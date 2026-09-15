// Статический снимок сайта из локальной базы — чтобы смотреть UI без Cloudflare.
// Тот же код рендеринга, что и в Worker.
import { DatabaseSync } from 'node:sqlite';
import { mkdirSync, writeFileSync, copyFileSync, rmSync } from 'node:fs';
import { join } from 'node:path';
import * as q from '../src/queries.js';
import { links, renderIndex, renderCompetition, renderPerson, renderResults, renderCoaches } from '../src/render.js';

const DB_PATH = process.argv[2] || '.local/girevoy.db';
const OUT = process.argv[3] || 'dist';
const L = links.static;

const sqlite = new DatabaseSync(DB_PATH, { readOnly: true });
const db = {
  all: async (sql, ...p) => sqlite.prepare(sql).all(...p),
  // node:sqlite отдаёт undefined там, где D1 отдаёт null
  get: async (sql, ...p) => sqlite.prepare(sql).get(...p) ?? null,
};

const sortableCoaches = (body) => body.replace(
  '<thead><tr><th scope="col">Имя</th><th scope="col">Регион</th></tr></thead>',
  '<thead><tr><th scope="col" class="sort" data-sort="0" role="button" tabindex="0">Имя</th><th scope="col" class="sort" data-sort="1" role="button" tabindex="0">Регион</th></tr></thead>',
).replace('</body>', `<script>(function () {
  var table = document.getElementById('coaches-table');
  if (!table) return;
  var body = table.tBodies[0];
  var heads = Array.prototype.slice.call(table.querySelectorAll('th[data-sort]'));
  var current = -1, dir = 1;
  function text(row, index) {
    return row.cells[index].textContent.toLocaleLowerCase('ru').replace(/ё/g, 'е').trim();
  }
  function sortBy(head) {
    var index = Number(head.dataset.sort);
    dir = current === index ? -dir : 1;
    current = index;
    var rows = Array.prototype.slice.call(body.rows);
    rows.sort(function (a, b) {
      var x = text(a, index), y = text(b, index);
      if (x === y) return 0;
      if (x === '—') return 1;
      if (y === '—') return -1;
      return x.localeCompare(y, 'ru') * dir;
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

rmSync(OUT, { recursive: true, force: true });
mkdirSync(OUT, { recursive: true });

const write = (name, body) => writeFileSync(join(OUT, name), body, 'utf8');

const [stats, competitions] = await Promise.all([q.getStats(db), q.listCompetitions(db)]);
write('index.html', renderIndex({ stats, competitions, L, bare: process.env.BARE_INDEX === '1' }));
write('results.html', renderResults({ rows: await q.listAllResults(db), L }));
const coaches = await q.listCoaches(db);
write('coaches.html', sortableCoaches(renderCoaches({ coaches, L })));
for (const { slug } of await q.listPersonSlugs(db)) {
  const data = await q.getPerson(db, slug);
  write(L.person(slug), renderPerson({ ...data, L }));
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
  write(`a-${slug}.html`, renderPerson({ ...data, L }));
  athletePages++;
}

copyFileSync('public/style.css', join(OUT, 'style.css'));
console.log(`${OUT}/: 1 главная, 1 таблица результатов, ${competitions.length} турниров, ${athletePages} спортсменов`);
