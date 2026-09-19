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

rmSync(OUT, { recursive: true, force: true });
mkdirSync(OUT, { recursive: true });

const write = (name, body) => writeFileSync(join(OUT, name),
  compactAthleteResults(formatTableDates(withAthletesNav(body, L.athletes, L.coaches, name === 'athletes.html'))), 'utf8');

const [stats, competitions] = await Promise.all([q.getStats(db), q.listCompetitions(db)]);
write('index.html', renderIndex({ stats, competitions, L, bare: process.env.BARE_INDEX === '1' }));
write('results.html', personRoleLinks(renderResults({ rows: await q.listAllResults(db), L }), 'athlete'));
write('athletes.html', renderAthletes({ athletes: await listAthletes(db), L }));
const coaches = await q.listCoaches(db);
write('coaches.html', sortableCoaches(personRoleLinks(renderCoaches({ coaches, L }), 'coach'), coaches));
for (const { slug } of await q.listPersonSlugs(db)) {
  const data = await q.getPerson(db, slug);
  write(L.person(slug), personTabs(renderPerson({ ...data, L })));
}

for (const c of competitions) {
  const data = await q.getCompetition(db, c.slug);
  write(`c-${c.slug}.html`, personRoleLinks(competitionCard(renderCompetition({ ...data, L }), data.comp, data.categories), 'athlete'));
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

const SITE_ORIGIN = 'https://vsegiri.com';
const htmlFiles = readdirSync(OUT)
  .filter((name) => name.endsWith('.html'))
  .sort();
const sitemapUrls = htmlFiles.map((name) => {
  const path = name === 'index.html' ? '/' : '/' + name;
  return `  <url><loc>${SITE_ORIGIN}${path}</loc></url>`;
});
writeFileSync(join(OUT, 'sitemap.xml'),
  `<?xml version="1.0" encoding="UTF-8"?>\n<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n${sitemapUrls.join('\n')}\n</urlset>\n`,
  'utf8');
writeFileSync(join(OUT, 'robots.txt'),
  `User-agent: *\nAllow: /\n\nSitemap: ${SITE_ORIGIN}/sitemap.xml\n`,
  'utf8');

console.log(`${OUT}/: 1 главная, 1 таблица результатов, 1 список спортсменов, ${competitions.length} турниров, ${athletePages} спортсменов`);
