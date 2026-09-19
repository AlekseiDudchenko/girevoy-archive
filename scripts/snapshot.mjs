// Статический снимок сайта из локальной базы — чтобы смотреть UI без Cloudflare.
// Тот же код рендеринга, что и в Worker.
import { DatabaseSync } from 'node:sqlite';
import { mkdirSync, writeFileSync, copyFileSync, rmSync, readdirSync } from 'node:fs';
import { join } from 'node:path';
import * as q from '../src/queries.js';
import { links, renderCompetition, renderPerson, renderResults, renderCoaches } from '../src/render.js';
import { renderIndex } from '../src/render-home.js';
import { personTabs, personRoleLinks } from '../src/person-tabs.js';
import { listAthletes, renderAthletes, withAthletesNav } from '../src/athletes.js';
import { competitionCard } from '../src/competition-card.js';

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


const renderKubokRossii2026Placeholder = () => {
  const base = `<!doctype html>
<html lang="ru">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<title>Кубок России по гиревому спорту 2026 — результаты и протокол | Все гири</title>
<meta name="description" content="Кубок России по гиревому спорту 2026: результаты и протокол. Данные соревнований обрабатываются и будут опубликованы после проверки.">
<meta property="og:type" content="website">
<meta property="og:site_name" content="Все гири">
<meta property="og:title" content="Кубок России по гиревому спорту 2026 — результаты и протокол">
<meta property="og:description" content="Данные Кубка России 2026 обрабатываются. Результаты и протокол появятся после проверки.">
<meta name="twitter:card" content="summary">
<link rel="stylesheet" href="style.css">
</head>
<body>
<header class="site">
  <div class="inner">
    <a class="brand" href="index.html">Гиревой архив</a>
    <nav>
      <a href="index.html" class="on">Соревнования</a>
      <a href="results.html">Все результаты</a>
      <a href="athletes.html">Спортсмены</a>
      <a href="coaches.html">Тренеры</a>
    </nav>
  </div>
</header>
<main class="inner">
  <nav class="breadcrumbs" aria-label="Хлебные крошки"><a href="index.html">Соревнования</a><span aria-hidden="true"> › </span><span>Кубок России 2026</span></nav>
  <div class="page-head">
    <p class="eyebrow">Кубок России</p>
    <h1>Кубок России по гиревому спорту 2026</h1>
  </div>
  <section class="cat">
    <h2>Результаты Кубка России 2026</h2>
    <p>Данные обрабатываются. После завершения проверки здесь появятся все категории, спортсмены, места и результаты выступлений.</p>
  </section>
</main>
<script type="application/ld+json">{"@context":"https://schema.org","@type":"SportsEvent","name":"Кубок России по гиревому спорту 2026","sport":"Гиревой спорт","url":"https://vsegiri.com/c-kubok-rossii-2026.html"}</script>
<script type="application/ld+json">{"@context":"https://schema.org","@type":"BreadcrumbList","itemListElement":[{"@type":"ListItem","position":1,"name":"Соревнования","item":"https://vsegiri.com/"},{"@type":"ListItem","position":2,"name":"Кубок России 2026","item":"https://vsegiri.com/c-kubok-rossii-2026.html"}]}</script>
</body>
</html>`;

  return competitionCard(base, {
    slug: 'kubok-rossii-2026',
    name: 'Кубок России по гиревому спорту 2026',
    year: '2026',
    rank_name: 'Кубок России',
    pending: true,
  }, []);
};


const isKubokRossii = (competition) => /^Кубок России(?: по гиревому спорту)?\b/i.test(String(competition.name || ''))
  || String(competition.slug || '').startsWith('kubok-rossii-');

const competitionYear = (competition) => String(competition.date_start || '').slice(0, 4)
  || String(competition.slug || '').match(/(19|20)\d{2}/)?.[0]
  || '';

const renderKubokRossiiHub = (items) => {
  const rows = items.map((item) => `
    <li><a href="c-${item.slug}.html">Кубок России ${item.year}</a>${item.pending ? ' <span class="dim">· данные обрабатываются</span>' : ''}</li>`).join('');
  return `<!doctype html>
<html lang="ru">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<title>Кубок России по гиревому спорту — протоколы и результаты | Все гири</title>
<meta name="description" content="Кубок России по гиревому спорту: протоколы и результаты по годам. Полные данные соревнований, спортсмены, категории и места.">
<meta property="og:type" content="website">
<meta property="og:site_name" content="Все гири">
<meta property="og:title" content="Кубок России по гиревому спорту — протоколы и результаты">
<meta property="og:description" content="Архив Кубков России по гиревому спорту с протоколами и результатами по годам.">
<meta name="twitter:card" content="summary">
<link rel="stylesheet" href="style.css">
</head>
<body>
<header class="site"><div class="inner">
<a class="brand" href="index.html">Гиревой архив</a>
<nav><a href="index.html" class="on">Соревнования</a><a href="results.html">Все результаты</a><a href="athletes.html">Спортсмены</a><a href="coaches.html">Тренеры</a></nav>
</div></header>
<main class="inner">
<nav class="breadcrumbs" aria-label="Хлебные крошки"><a href="index.html">Соревнования</a><span aria-hidden="true"> › </span><span>Кубок России</span></nav>
<div class="page-head">
<p class="eyebrow">Серия соревнований</p>
<h1>Кубок России по гиревому спорту — протоколы и результаты</h1>
<p class="lead">Архив Кубков России по гиревому спорту. Выберите год, чтобы открыть полный протокол и результаты соревнования.</p>
</div>
<section class="cat"><h2>Кубок России по годам</h2><ul>${rows}</ul></section>
</main>
<script type="application/ld+json">{"@context":"https://schema.org","@type":"BreadcrumbList","itemListElement":[{"@type":"ListItem","position":1,"name":"Соревнования","item":"https://vsegiri.com/"},{"@type":"ListItem","position":2,"name":"Кубок России","item":"https://vsegiri.com/kubok-rossii.html"}]}</script>
</body>
</html>`;
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

const SITE_ORIGIN = 'https://vsegiri.com';

const canonicalPath = (name) => {
  if (name === 'index.html') return '/';
  if (name.startsWith('a-')) return '/' + name.replace(/^a-/, 'p-');
  return '/' + name;
};

const withCanonical = (html, name) => {
  const canonicalUrl = `${SITE_ORIGIN}${canonicalPath(name)}`;
  const canonical = `<link rel="canonical" href="${canonicalUrl}">`;
  const ogUrl = `<meta property="og:url" content="${canonicalUrl}">`;
  if (html.includes('rel="canonical"')) return html;
  return html.replace('</head>', `${canonical}\n${ogUrl}\n</head>`);
};

const write = (name, body) => writeFileSync(join(OUT, name),
  withCanonical(
    compactAthleteResults(formatTableDates(withAthletesNav(body, L.athletes, L.coaches, name === 'athletes.html'))),
    name,
  ), 'utf8');

const [stats, competitions] = await Promise.all([q.getStats(db), q.listCompetitions(db)]);
const hasKubokRossii2026 = competitions.some((c) => c.slug === 'kubok-rossii-2026');
const kubokRossiiItems = competitions
  .filter(isKubokRossii)
  .map((c) => ({ slug: c.slug, year: competitionYear(c), pending: false }))
  .filter((c) => c.year);
if (!hasKubokRossii2026) kubokRossiiItems.push({ slug: 'kubok-rossii-2026', year: '2026', pending: true });
kubokRossiiItems.sort((a, b) => b.year.localeCompare(a.year));
let indexHtml = renderIndex({ stats, competitions, L, bare: process.env.BARE_INDEX === '1' });
if (!hasKubokRossii2026) {
  indexHtml = indexHtml.replace(
    '<div class="home-list-head">',
    '<section class="cat"><p class="eyebrow">Свежие соревнования</p><h2><a href="c-kubok-rossii-2026.html">Кубок России по гиревому спорту 2026</a></h2><p class="lead">Данные обрабатываются. Статистика подсчитывается, результаты и протокол будут опубликованы после проверки.</p></section><div class="home-list-head">',
  );
}
indexHtml = indexHtml.replace(
  '<div class="home-list-head">',
  '<p class="source"><a href="kubok-rossii.html">Кубок России по годам →</a></p><div class="home-list-head">',
);
indexHtml = indexHtml.replace('</body>', '<script type="application/ld+json">{"@context":"https://schema.org","@type":"WebSite","name":"Все гири","alternateName":"Гиревой архив","url":"https://vsegiri.com/"}</script></body>');
write('index.html', indexHtml);
write('kubok-rossii.html', renderKubokRossiiHub(kubokRossiiItems));
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
    renderKubokRossii2026Placeholder(), kubokRossiiItems, 'kubok-rossii-2026',
  ));
}

for (const c of competitions) {
  const data = await q.getCompetition(db, c.slug);
  let competitionHtml = personRoleLinks(competitionCard(renderCompetition({ ...data, L }), data.comp, data.categories), 'athlete');
  competitionHtml = withKubokRossiiYears(competitionHtml, kubokRossiiItems, c.slug);
  write(`c-${c.slug}.html`, competitionHtml);
}

const slugs = await q.listAthleteSlugs(db);
let athletePages = 0;
for (const { slug } of slugs) {
  const data = await q.getPerson(db, slug);
  if (!data?.athleteData?.results.length) continue;
  write(`a-${slug}.html`, personTabs(renderPerson({ ...data, L })));
  athletePages++;
}

copyFileSync('public/style.css', join(OUT, 'style.css'));

const athleteRedirects = slugs
  .map(({ slug }) => `/a-${slug}.html /p-${slug}.html 301`)
  .join('\n');
writeFileSync(join(OUT, '_redirects'), athleteRedirects + '\n', 'utf8');

writeFileSync(join(OUT, '404.html'), `<!doctype html>
<html lang="ru">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<meta name="robots" content="noindex, nofollow">
<title>Страница не найдена — Гиревой архив</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<header class="site"><div class="inner"><a class="brand" href="/">Гиревой архив</a></div></header>
<main class="inner">
  <div class="page-head">
    <p class="eyebrow">Ошибка 404</p>
    <h1>Страница не найдена</h1>
    <p class="lead">Такой страницы нет. Вернитесь к соревнованиям или результатам.</p>
    <p><a href="/">Соревнования</a> · <a href="/results.html">Все результаты</a></p>
  </div>
</main>
</body>
</html>`, 'utf8');

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
