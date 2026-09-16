// Статический снимок сайта из локальной базы — чтобы смотреть UI без Cloudflare.
// Тот же код рендеринга, что и в Worker.
import { DatabaseSync } from 'node:sqlite';
import { mkdirSync, writeFileSync, copyFileSync, rmSync } from 'node:fs';
import { join } from 'node:path';
import * as q from '../src/queries.js';
import { links, renderCompetition, renderPerson, renderResults, renderCoaches } from '../src/render.js';
import { renderIndex } from '../src/render-home.js';
import { personTabs } from '../src/person-tabs.js';

const DB_PATH = process.argv[2] || '.local/girevoy.db';
const OUT = process.argv[3] || 'dist';
const L = links.static;

const sqlite = new DatabaseSync(DB_PATH, { readOnly: true });
const db = {
  all: async (sql, ...p) => sqlite.prepare(sql).all(...p),
  get: async (sql, ...p) => sqlite.prepare(sql).get(...p) ?? null,
};

const sortableCoaches = (body, coaches) => {
  let rowIndex = 0;
  const searchableBody = body
    .replace('Поиск по имени или региону', 'Поиск по имени, региону или числу спортсменов')
    .replace('Имя тренера или регион', 'Имя, регион или число спортсменов');
  const withCounts = searchableBody.replace(/<tbody>([\s\S]*?)<\/tbody>/, (_, rows) =>
    `<tbody>${rows.replace(/<tr>([\s\S]*?)<\/tr>/g, (row) => {
      const count = coaches[rowIndex++]?.athletes?.length ?? 0;
      return row.replace('</tr>', `<td class="c n">${count}</td></tr>`);
    })}</tbody>`);
  return withCounts.replace(
    '<thead><tr><th scope="col">Имя</th><th scope="col">Регион</th></tr></thead>',
    '<thead><tr><th scope="col" class="sort" data-sort="0" role="button" tabindex="0">Имя</th><th scope="col" class="sort" data-sort="1" role="button" tabindex="0">Регион</th><th scope="col" class="c sort" data-sort="2" role="button" tabindex="0">Спортсменов в базе</th></tr></thead>',
  ).replace('</body>', `<script>(function () {
  var table = document.getElementById('coaches-table');
  if (!table) return;
  var body = table.tBodies[0];
  var heads = Array.prototype.slice.call(table.querySelectorAll('th[data-sort]'));
  var current = -1, dir = 1;
  function value(row, index) {
    var text = row.cells[index].textContent.trim();
    if (index === 2) return Number(text);
    return text.toLocaleLowerCase('ru').replace(/ё/g, 'е');
  }
  function sortBy(head) {
    var index = Number(head.dataset.sort);
    dir = current === index ? -dir : (index === 2 ? -1 : 1);
    current = index;
    var rows = Array.prototype.slice.call(body.rows);
    rows.sort(function (a, b) {
      var x = value(a, index), y = value(b, index);
      if (x === y) return 0;
      if (index !== 2) {
        if (x === '—') return 1;
        if (y === '—') return -1;
      }
      return (index === 2 ? x - y : x.localeCompare(y, 'ru')) * dir;
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

const personCoachYears = (body) => {
  const marker = '<h2>Тренер</h2>';
  const start = body.indexOf(marker);
  if (start < 0) return body;
  const end = body.indexOf('</section>', start);
  if (end < 0) return body;
  const section = body.slice(start, end)
    .replace(
      '<div class="scroll"><table><thead><tr><th>Спортсмен</th><th>Регион</th></tr></thead>',
      '<div class="scroll"><table id="coach-athletes-table"><thead><tr><th class="sort" data-sort="0" role="button" tabindex="0">Спортсмен</th><th class="sort" data-sort="1" role="button" tabindex="0">Регион</th><th class="c sort" data-sort="2" role="button" tabindex="0">Последний протокол</th></tr></thead>',
    )
    .replace(/<tr><td>(<a[^>]*>)?([\s\S]*?) \((\d{4})\)(<\/a>)?<\/td>\s*<td>([\s\S]*?)<\/td><\/tr>/g,
      '<tr><td>$1$2$4</td><td>$5</td><td class="c n">$3</td></tr>');
  const withSection = body.slice(0, start) + section + body.slice(end);
  return withSection.replace('</body>', `<script>(function () {
  var table = document.getElementById('coach-athletes-table');
  if (!table) return;
  var tbody = table.tBodies[0];
  var heads = Array.prototype.slice.call(table.querySelectorAll('th[data-sort]'));
  var current = -1, dir = 1;
  function value(row, index) {
    var text = row.cells[index].textContent.trim();
    if (index === 2) return text === '—' ? null : Number(text);
    return text.toLocaleLowerCase('ru').replace(/ё/g, 'е');
  }
  function sortBy(head) {
    var index = Number(head.dataset.sort);
    dir = current === index ? -dir : (index === 2 ? -1 : 1);
    current = index;
    var rows = Array.prototype.slice.call(tbody.rows);
    rows.sort(function (a, b) {
      var x = value(a, index), y = value(b, index);
      if (x === y) return 0;
      if (x == null) return 1;
      if (y == null) return -1;
      return (index === 2 ? x - y : x.localeCompare(y, 'ru')) * dir;
    });
    rows.forEach(function (row) { tbody.appendChild(row); });
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

rmSync(OUT, { recursive: true, force: true });
mkdirSync(OUT, { recursive: true });

const write = (name, body) => writeFileSync(join(OUT, name), body, 'utf8');

const [stats, competitions] = await Promise.all([q.getStats(db), q.listCompetitions(db)]);
write('index.html', renderIndex({ stats, competitions, L, bare: process.env.BARE_INDEX === '1' }));
write('results.html', renderResults({ rows: await q.listAllResults(db), L }));
const coaches = await q.listCoaches(db);
write('coaches.html', sortableCoaches(renderCoaches({ coaches, L }), coaches));
for (const { slug } of await q.listPersonSlugs(db)) {
  const data = await q.getPerson(db, slug);
  write(L.person(slug), personTabs(personCoachYears(renderPerson({ ...data, L }))));
}

for (const c of competitions) {
  const data = await q.getCompetition(db, c.slug);
  write(`c-${c.slug}.html`, renderCompetition({ ...data, L }));
}

const slugs = await q.listAthleteSlugs(db);
let athletePages = 0;
for (const { slug } of slugs) {
  const data = await q.getPerson(db, slug);
  if (!data?.athleteData?.results.length) continue;
  write(`a-${slug}.html`, personTabs(personCoachYears(renderPerson({ ...data, L }))));
  athletePages++;
}

copyFileSync('public/style.css', join(OUT, 'style.css'));
console.log(`${OUT}/: 1 главная, 1 таблица результатов, ${competitions.length} турниров, ${athletePages} спортсменов`);
