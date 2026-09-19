// Статический снимок сайта из локальной базы — чтобы смотреть UI без Cloudflare.
// Тот же код рендеринга, что и в Worker.
import { DatabaseSync } from 'node:sqlite';
import { mkdirSync, writeFileSync, copyFileSync, rmSync, readdirSync } from 'node:fs';
import { join } from 'node:path';
import * as q from '../src/queries.js';
import { links, page, renderCompetition, renderPerson, renderResults, renderCoaches } from '../src/render.js';
import { renderIndex, competitionListItem } from '../src/render-home.js';
import { personTabs, personRoleLinks } from '../src/person-tabs.js';
import { listAthletes, renderAthletes, withAthletesNav } from '../src/athletes.js';
import { competitionCard } from '../src/competition-card.js';

const SITE_ORIGIN = 'https://vsegiri.com';
const jsonLd = (value) => `<script type="application/ld+json">${JSON.stringify(value).replace(/</g, '\\u003c')}</script>`;

const DB_PATH = process.argv[2] || '.local/girevoy.db';
const OUT = process.argv[3] || 'dist';
const L = { ...links.static, athletes: 'athletes.html' };

const sqlite = new DatabaseSync(DB_PATH, { readOnly: true });
const db = {
  all: async (sql, ...p) => sqlite.prepare(sql).all(...p),
  get: async (sql, ...p) => sqlite.prepare(sql).get(...p) ?? null,
};

const sortableCoaches = (body, coaches) => {
  let rowIndex = 0;
  const searchableBody = body
    .replace('Поиск по имени, региону или году', 'Поиск по имени, региону, году или числу спортсменов')
    .replace('Имя, регион или год', 'Имя, регион, год или число спортсменов');
  const withCounts = searchableBody.replace(/<tbody>([\s\S]*?)<\/tbody>/, (_, rows) =>
    `<tbody>${rows.replace(/<tr>([\s\S]*?)<\/tr>/g, (row) => {
      const count = coaches[rowIndex++]?.athletes?.length ?? 0;
      return row.replace('</tr>', `<td class="c n">${count}</td></tr>`);
    })}</tbody>`);
  return withCounts.replace(
    '<thead><tr><th scope="col">Имя</th><th scope="col">Регион</th><th scope="col" class="c" title="От первого до последнего упоминания тренера в опубликованных протоколах">Период</th></tr></thead>',
    '<thead><tr><th scope="col" class="sort" data-sort="0" role="button" tabindex="0">Имя</th><th scope="col" class="sort" data-sort="1" role="button" tabindex="0">Регион</th><th scope="col" class="c sort" data-sort="2" data-default="desc" role="button" tabindex="0" title="От первого до последнего упоминания тренера в опубликованных протоколах">Период</th><th scope="col" class="c sort" data-sort="3" data-default="desc" role="button" tabindex="0">Спортсменов в базе</th></tr></thead>',
  ).replace('</body>', `<script>(function () {
  var table = document.getElementById('coaches-table');
  if (!table) return;
  var body = table.tBodies[0];
  var heads = Array.prototype.slice.call(table.querySelectorAll('th[data-sort]'));
  var current = -1, dir = 1;
  function value(row, index) {
    var cell = row.cells[index];
    var sortValue = cell.dataset.sortValue;
    if (sortValue !== undefined) return sortValue === '' ? null : Number(sortValue);
    var text = cell.textContent.trim();
    if (index === 3) return Number(text);
    return text.toLocaleLowerCase('ru').replace(/ё/g, 'е');
  }
  function sortBy(head) {
    var index = Number(head.dataset.sort);
    dir = current === index ? -dir : (head.dataset.default === 'desc' ? -1 : 1);
    current = index;
    var rows = Array.prototype.slice.call(body.rows);
    rows.sort(function (a, b) {
      var x = value(a, index), y = value(b, index);
      if (x === y) return 0;
      if (x == null) return 1;
      if (y == null) return -1;
      if (typeof x !== 'number') {
        if (x === '—') return 1;
        if (y === '—') return -1;
      }
      return (typeof x === 'number' ? x - y : x.localeCompare(y, 'ru')) * dir;
    });
    rows.forEach(function (row) { body.appendChild(row); });
    heads.forEach(function (h) {
      if (h === head) h.setAttribute('aria-sort', dir > 0 ? 'ascending' : 'descending');
      else h.removeAttribute('aria-sort');
    });
  }
  heads.forEach(function (head) {
    head.addEventListener('click', function () { sortBy(head); });
    head.addEventListener('keydown', function (ev) {
      if (ev.key === 'Enter' || ev.key === ' ') { ev.preventDefault(); sortBy(head); }
    });
  });
})();</script></body>`);
};

const formatTableDates = (html) => html.replace(/<table\b[\s\S]*?<\/table>/g, (table) =>
  table.replace(/(^|>)([^<]+)(?=<|$)/g, (_, prefix, text) =>
    prefix + text.replace(/\b(\d{4})-(\d{2})-(\d{2})\b/g, '$3.$2.$1')));

const compactAthleteResults = (html) => {
  const compactTables = html.replace(/<table class="athlete-result-table"[\s\S]*?<\/table>/g, (table) =>
    table
      .replace(/>Личный вес</g, '>Вес<')
      .replace(/<a href="([^"]+)">(Чемпионат России(?: по гиревому спорту)?\s+(\d{4}))<\/a>/g,
        '<a href="$1" title="$2">ЧР $3</a>')
      .replace(/(<span class="discipline-badge"[^>]*>[\s\S]*?) · (\d+ мин)(<\/span>)/g,
        '$1<span class="discipline-break"></span><span class="discipline-duration">$2</span>$3'));
  return compactTables
    .replace('.discipline-badge { display:inline-flex;', '.discipline-badge { display:inline-flex; flex-wrap:wrap;')
    .replace('.discipline-dot {', '.discipline-break { flex-basis:100%; height:0; }\n.discipline-duration { margin-left:.96rem; }\n.discipline-dot {');
};


const renderKubokRossii2026Placeholder = (L) => {
  const url = `${SITE_ORIGIN}/c-kubok-rossii-2026.html`;
  const base = page({
    title: 'Кубок России по гиревому спорту 2026 — результаты и протокол | Все гири',
    description: 'Кубок России по гиревому спорту 2026: результаты и протокол. Данные соревнований обрабатываются и будут опубликованы после проверки.',
    L, active: 'home',
    body: `
<nav class="breadcrumbs" aria-label="Хлебные крошки"><a href="${L.home}">Соревнования</a><span aria-hidden="true"> › </span><span>Кубок России 2026</span></nav>
<div class="page-head">
  <p class="eyebrow">Кубок России</p>
  <h1>Кубок России по гиревому спорту 2026</h1>
</div>
<section class="cat">
  <h2>Результаты Кубка России 2026</h2>
  <p>Данные обрабатываются. После завершения проверки здесь появятся все категории, спортсмены, места и результаты выступлений.</p>
</section>
${jsonLd({
  '@context': 'https://schema.org', '@type': 'SportsEvent',
  name: 'Кубок России по гиревому спорту 2026', sport: 'Гиревой спорт', url,
})}
${jsonLd({
  '@context': 'https://schema.org', '@type': 'BreadcrumbList',
  itemListElement: [
    { '@type': 'ListItem', position: 1, name: 'Соревнования', item: `${SITE_ORIGIN}/` },
    { '@type': 'ListItem', position: 2, name: 'Кубок России 2026', item: url },
  ],
})}`,
  });

  return competitionCard(base, {
    slug: 'kubok-rossii-2026',
    name: 'Кубок России по гиревому спорту 2026',
    year: '2026',
    poster_path: '/competition-posters/kubok-rossii-2026.jpg',
    date_start: '2026-09-10',
    date_end: '2026-09-14',
    city: 'Ростов-на-Дону',
    federation_name: 'Всероссийская федерация гиревого спорта',
    rank_name: 'Кубок России',
    pending: true,
  }, []);
};


const isKubokRossii = (competition) => /^Кубок России(?: по гиревому спорту)?\b/i.test(String(competition.name || ''))
  || String(competition.slug || '').startsWith('kubok-rossii-');

const competitionYear = (competition) => String(competition.date_start || '').slice(0, 4)
  || String(competition.slug || '').match(/(19|20)\d{2}/)?.[0]
  || '';

const renderKubokRossiiHub = (items, L) => {
  const url = `${SITE_ORIGIN}/kubok-rossii.html`;
  return page({
    title: 'Кубок России по гиревому спорту — протоколы и результаты | Все гири',
    description: 'Кубок России по гиревому спорту: протоколы и результаты по годам. Полные данные соревнований, спортсмены, категории и места.',
    L, active: 'home',
    body: `
<nav class="breadcrumbs" aria-label="Хлебные крошки"><a href="${L.home}">Соревнования</a><span aria-hidden="true"> › </span><span>Кубок России</span></nav>
<div class="page-head">
  <p class="eyebrow">Серия соревнований</p>
  <h1>Кубок России по гиревому спорту — протоколы и результаты</h1>
  <p class="lead">Архив Кубков России по гиревому спорту. Выберите год, чтобы открыть полный протокол и результаты соревнования.</p>
</div>
<div id="home-compact">
  <ul class="comp-list">
  ${items.map((c) => competitionListItem(c, L)).join('')}
  </ul>
</div>
${jsonLd({
  '@context': 'https://schema.org', '@type': 'BreadcrumbList',
  itemListElement: [
    { '@type': 'ListItem', position: 1, name: 'Соревнования', item: `${SITE_ORIGIN}/` },
    { '@type': 'ListItem', position: 2, name: 'Кубок России', item: url },
  ],
})}`,
  });
};

const withKubokRossiiYears = (html, items, currentSlug) => {
  if (!currentSlug?.startsWith('kubok-rossii-')) return html;
  const links = items.map((item) => item.slug === currentSlug
    ? `<strong>${item.year}</strong>`
    : `<a href="c-${item.slug}.html">${item.year}</a>`).join(' · ');
  const section = `<section class="cat"><h2>Кубок России по годам</h2><p>${links}</p><p><a href="kubok-rossii.html">Все Кубки России</a></p></section>`;
  if (html.includes('</article>')) return html.replace('</article>', `${section}</article>`);
  return html.replace('</main>', `${section}</main>`);
};

rmSync(OUT, { recursive: true, force: true });
mkdirSync(OUT, { recursive: true });

// name — итоговый файл; target, если задан, — путь, на который в этом файле
// должен указывать canonical (нужен для a-*.html: их canonical ведёт на
// действующий p-*.html конкретной персоны, а не на одноимённый p-файл —
// исторический слаг в athlete_slugs мог с тех пор смениться).
const canonicalPath = (name, target) => {
  if (target) return '/' + target;
  if (name === 'index.html') return '/';
  return '/' + name;
};

const withCanonical = (html, name, target) => {
  const canonicalUrl = `${SITE_ORIGIN}${canonicalPath(name, target)}`;
  const canonical = `<link rel="canonical" href="${canonicalUrl}">`;
  const ogUrl = `<meta property="og:url" content="${canonicalUrl}">`;
  if (html.includes('rel="canonical"')) return html;
  return html.replace('</head>', `${canonical}\n${ogUrl}\n</head>`);
};

const write = (name, body, canonicalTarget) => writeFileSync(join(OUT, name),
  withCanonical(
    compactAthleteResults(formatTableDates(withAthletesNav(body, L.athletes, L.coaches, name === 'athletes.html'))),
    name, canonicalTarget,
  ), 'utf8');

const [stats, competitions] = await Promise.all([q.getStats(db), q.listCompetitions(db)]);
const hasKubokRossii2026 = competitions.some((c) => c.slug === 'kubok-rossii-2026');
const kubokRossiiItems = competitions
  .filter(isKubokRossii)
  .map((c) => ({ ...c, year: competitionYear(c), pending: false }))
  .filter((c) => c.year);
if (!hasKubokRossii2026) {
  kubokRossiiItems.push({
    slug: 'kubok-rossii-2026',
    name: 'Кубок России по гиревому спорту 2026',
    date_start: '2026-09-10',
    date_end: '2026-09-14',
    city: 'Ростов-на-Дону',
    country: 'RU',
    federation: 'ВФГС',
    rank_name: 'Кубок России',
    year: '2026',
    pending: true,
  });
}
kubokRossiiItems.sort((a, b) => b.year.localeCompare(a.year));
const kubokTeaser = !hasKubokRossii2026 ? {
  href: 'c-kubok-rossii-2026.html',
  name: 'Кубок России по гиревому спорту 2026',
  note: 'Данные обрабатываются. Статистика подсчитывается, результаты и протокол будут опубликованы после проверки.',
} : null;
write('index.html', renderIndex({
  stats, competitions, L, bare: process.env.BARE_INDEX === '1',
  kubokTeaser, kubokHubHref: 'kubok-rossii.html',
}));
write('kubok-rossii.html', renderKubokRossiiHub(kubokRossiiItems, L));
write('results.html', personRoleLinks(renderResults({ rows: await q.listAllResults(db), L }), 'athlete'));
write('athletes.html', renderAthletes({ athletes: await listAthletes(db), L }));
const coaches = await q.listCoaches(db);
write('coaches.html', sortableCoaches(personRoleLinks(renderCoaches({ coaches, L }), 'coach'), coaches));
for (const { slug } of await q.listPersonSlugs(db)) {
  const data = await q.getPerson(db, slug);
  write(L.person(slug), personTabs(renderPerson({ ...data, L })));
}

if (!hasKubokRossii2026) {
  write('c-kubok-rossii-2026.html', withKubokRossiiYears(
    renderKubokRossii2026Placeholder(L), kubokRossiiItems, 'kubok-rossii-2026',
  ));
}

for (const c of competitions) {
  const data = await q.getCompetition(db, c.slug);
  let competitionHtml = personRoleLinks(competitionCard(renderCompetition({ ...data, L }), data.comp, data.categories), 'athlete');
  competitionHtml = withKubokRossiiYears(competitionHtml, kubokRossiiItems, c.slug);
  write(`c-${c.slug}.html`, competitionHtml);
}

// Каждый слаг в athlete_slugs — исторический адрес, который когда-то вёл на
// спортсмена (переименование, слияние дублей). getPerson() резолвит его к
// действующей персоне независимо от того, совпадает ли слаг с persons.slug —
// поэтому редирект и canonical всегда строятся из data.person.slug, а не из
// самого запрошенного slug (см. docs/schema.md, athlete_slugs).
const slugs = await q.listAthleteSlugs(db);
let athletePages = 0;
const athleteRedirects = [];
for (const { slug } of slugs) {
  const data = await q.getPerson(db, slug);
  if (!data) continue;
  const personSlug = data.person.slug;
  athleteRedirects.push(`/a-${slug}.html /p-${personSlug}.html 301`);
  if (!data.athleteData?.results.length) continue;
  write(`a-${slug}.html`, personTabs(renderPerson({ ...data, L })), `p-${personSlug}.html`);
  athletePages++;
}

copyFileSync('public/style.css', join(OUT, 'style.css'));

writeFileSync(join(OUT, '_redirects'), athleteRedirects.join('\n') + '\n', 'utf8');

const notFoundHtml = page({
  title: 'Страница не найдена — Гиревой архив',
  description: 'Такой страницы нет. Вернитесь к соревнованиям или результатам.',
  L,
  body: `
<div class="page-head">
  <p class="eyebrow">Ошибка 404</p>
  <h1>Страница не найдена</h1>
  <p class="lead">Такой страницы нет. Вернитесь к соревнованиям или результатам.</p>
  <p><a href="${L.home}">Соревнования</a> · <a href="${L.results}">Все результаты</a></p>
</div>`,
});
writeFileSync(join(OUT, '404.html'),
  withAthletesNav(notFoundHtml, L.athletes, L.coaches, false)
    .replace('</head>', '<meta name="robots" content="noindex, nofollow">\n</head>'),
  'utf8');

const htmlFiles = readdirSync(OUT)
  .filter((name) => name.endsWith('.html'))
  .sort();
const sitemapUrls = htmlFiles
  .filter((name) => !name.startsWith('a-') && name !== '404.html')
  .map((name) => `  <url><loc>${SITE_ORIGIN}${canonicalPath(name)}</loc></url>`);
writeFileSync(join(OUT, 'sitemap.xml'),
  `<?xml version="1.0" encoding="UTF-8"?>\n<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n${sitemapUrls.join('\n')}\n</urlset>\n`,
  'utf8');
writeFileSync(join(OUT, 'robots.txt'),
  `User-agent: *\nAllow: /\n\nSitemap: ${SITE_ORIGIN}/sitemap.xml\n`,
  'utf8');

console.log(`${OUT}/: 1 главная, 1 таблица результатов, 1 список спортсменов, ${competitions.length} турниров, ${athletePages} спортсменов`);
