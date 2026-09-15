// Статический снимок сайта из локальной базы — чтобы смотреть UI без Cloudflare.
// Тот же код рендеринга, что и в Worker.
import { DatabaseSync } from 'node:sqlite';
import { mkdirSync, writeFileSync, copyFileSync, cpSync, existsSync, rmSync } from 'node:fs';
import { join } from 'node:path';
import * as q from '../src/queries.js';
import { links, renderIndex, renderCompetition, renderAthlete, renderResults } from '../src/render.js';

const DB_PATH = process.argv[2] || '.local/girevoy.db';
const OUT = process.argv[3] || 'dist';
const L = links.static;

const sqlite = new DatabaseSync(DB_PATH, { readOnly: true });
const db = {
  all: async (sql, ...p) => sqlite.prepare(sql).all(...p),
  // node:sqlite отдаёт undefined там, где D1 отдаёт null
  get: async (sql, ...p) => sqlite.prepare(sql).get(...p) ?? null,
};

rmSync(OUT, { recursive: true, force: true });
mkdirSync(OUT, { recursive: true });

const write = (name, body) => writeFileSync(join(OUT, name), body, 'utf8');

const [stats, competitions] = await Promise.all([q.getStats(db), q.listCompetitions(db)]);
write('index.html', renderIndex({ stats, competitions, L, bare: process.env.BARE_INDEX === '1' }));
write('results.html', renderResults({ rows: await q.listAllResults(db), L }));

for (const c of competitions) {
  const data = await q.getCompetition(db, c.slug);
  write(`c-${c.slug}.html`, renderCompetition({ ...data, L }));
}

const slugs = await q.listAthleteSlugs(db);
let athletePages = 0;
for (const { slug } of slugs) {
  const data = await q.getAthlete(db, slug);
  if (!data || !data.results.length) continue;
  write(`a-${slug}.html`, renderAthlete({ ...data, L }));
  athletePages++;
}

copyFileSync('public/style.css', join(OUT, 'style.css'));
// знаки разрядов: в Worker их отдаёт [site] bucket, в снимке копируем руками
if (existsSync('public/ranks')) cpSync('public/ranks', join(OUT, 'ranks'), { recursive: true });
console.log(`${OUT}/: 1 главная, 1 таблица результатов, ${competitions.length} турниров, ${athletePages} спортсменов`);
