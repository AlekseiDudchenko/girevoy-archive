import { test } from 'node:test';
import assert from 'node:assert/strict';
import { DatabaseSync } from 'node:sqlite';
import { readFileSync } from 'node:fs';
import { execFileSync } from 'node:child_process';
import { listCoaches, getPerson } from '../src/queries.js';
import { renderCoaches, renderPerson, links } from '../src/render.js';

const before2024 = ['migrations/0001_init.sql', 'migrations/0002_people.sql', 'seeds/0001_reference.sql',
  'seeds/0003_chempionat-rossii-2026.sql', 'seeds/0004_chempionat-rossii-2025.sql'];
const after2024 = ['seeds/0005_merges.sql'];
const execOptions = { encoding: 'utf8', maxBuffer: 16 * 1024 * 1024 };

function realDb() {
  const sql = new DatabaseSync(':memory:');
  for (const file of before2024) sql.exec(readFileSync(file, 'utf8'));
  sql.exec(execFileSync('python3', ['scripts/gen_seed.py', 'data/chempionat-rossii-2024.json'], execOptions));
  sql.exec(execFileSync('python3', ['scripts/gen_seed.py', 'data/chempionat-rossii-2023.json'], execOptions));
  for (const file of after2024) sql.exec(readFileSync(file, 'utf8'));
  sql.exec(execFileSync('python3', ['scripts/gen_people.py'], execOptions));
  return { sql, db: {
    all: async (query, ...params) => sql.prepare(query).all(...params),
    get: async (query, ...params) => sql.prepare(query).get(...params) ?? null,
  } };
}

test('protocol without patronymics reuses athlete by first name, last name and year', () => {
  const { sql } = realDb();
  try {
    const row = sql.prepare(`SELECT COUNT(DISTINCT r.athlete_id) AS count
      FROM results r JOIN athletes a ON a.id = r.athlete_id
      WHERE a.last_name = 'Руднев' AND a.first_name = 'Руслан' AND a.birth_year = 1994`).get();
    assert.equal(row.count, 1);
    const raw = sql.prepare(`SELECT COUNT(*) AS count FROM results
      WHERE raw_name = 'Руднев Руслан'`).get();
    assert.ok(raw.count >= 1);
  } finally { sql.close(); }
});

test('joint coach strings become separate person roles', async () => {
  const { sql, db } = realDb();
  try {
    const coaches = await listCoaches(db);
    assert.ok(coaches.length > 1);
    assert.ok(coaches.every((c) => c.slug && c.athletes.length));
    assert.ok(coaches.every((c) => !c.name.includes(',')));
    assert.ok(coaches.flatMap((c) => c.athletes).every((a) => /^202[3-6]$/.test(a.last_year)));
  } finally { sql.close(); }
});

test('coach history keeps competition-level provenance', () => {
  const { sql } = realDb();
  try {
    const mentions = sql.prepare('SELECT COUNT(*) AS count FROM person_coach_mentions').get();
    const links = sql.prepare('SELECT COUNT(*) AS count FROM person_coach_athletes').get();
    assert.ok(mentions.count > 0);
    assert.ok(mentions.count >= links.count);
    const bad = sql.prepare(`SELECT COUNT(*) AS count FROM person_coach_mentions pcm
      LEFT JOIN competitions c ON c.id = pcm.competition_id
      WHERE c.id IS NULL OR c.is_published <> 1`).get();
    assert.equal(bad.count, 0);
  } finally { sql.close(); }
});

test('self-coached markers do not become people or coach links', () => {
  const { sql } = realDb();
  try {
    const markers = ['Самостоя.С.', 'Самостоятельно', 'самостоятельно'];
    const placeholders = markers.map(() => '?').join(', ');
    const people = sql.prepare(`SELECT COUNT(*) AS count FROM persons
      WHERE display_name IN (${placeholders})`).get(...markers);
    const links = sql.prepare(`SELECT COUNT(*) AS count FROM person_coach_athletes pca
      JOIN persons p ON p.id = pca.person_id
      WHERE p.display_name IN (${placeholders})`).get(...markers);
    assert.equal(people.count, 0);
    assert.equal(links.count, 0);
  } finally { sql.close(); }
});

test('person page renders only populated roles and activity comes first', () => {
  const html = renderPerson({
    person: { display_name: '<Персона>' },
    activities: [{ organization: 'Федерация', position: 'Председатель' }],
    coachedAthletes: [{ name: 'A&B (2026)', slug: 'a', regions: ['Москва'] }],
    judgeRoles: [], athleteData: null, L: links.worker,
  });
  assert.ok(html.includes('&lt;Персона&gt;') && html.includes('A&amp;B (2026)'));
  assert.ok(html.indexOf('Спортивный деятель') < html.indexOf('<h2>Тренер</h2>'));
  assert.ok(!html.includes('<h2>Спортсмен</h2>'));
  assert.ok(!html.includes('<h2>Судья</h2>'));
  assert.ok(html.includes(`href="${links.worker.person('a')}"`));
});

test('old athlete aliases resolve to the same person', async () => {
  const { sql, db } = realDb();
  try {
    const old = sql.prepare('SELECT slug FROM athlete_slugs WHERE is_current = 0 LIMIT 1').get();
    assert.ok(old);
    assert.ok((await getPerson(db, old.slug)).athleteData.results.length);
  } finally { sql.close(); }
});

test('athlete person shows coaches with the last published year', async () => {
  const { sql, db } = realDb();
  try {
    const row = sql.prepare(`SELECT p.slug FROM persons p
      JOIN person_athletes pa ON pa.person_id = p.id
      JOIN person_coach_mentions pcm ON pcm.athlete_id = pa.athlete_id
      LIMIT 1`).get();
    assert.ok(row);
    const person = await getPerson(db, row.slug);
    assert.ok(person.athleteData.athlete.coaches.length);
    assert.ok(person.athleteData.athlete.coaches.every((c) => /^202[3-6]$/.test(c.last_year)));
    assert.ok(/\(202[3-6]\)/.test(person.athleteData.athlete.coach));
  } finally { sql.close(); }
});

test('stored person can combine athlete, coach, official and judge roles', async () => {
  const { sql, db } = realDb();
  try {
    const athlete = sql.prepare('SELECT person_id, athlete_id FROM person_athletes LIMIT 1').get();
    const coached = sql.prepare('SELECT athlete_id, competition_id FROM person_coach_mentions LIMIT 1').get();
    sql.prepare('INSERT OR IGNORE INTO person_coach_athletes VALUES (?, ?)').run(athlete.person_id, coached.athlete_id);
    sql.prepare('INSERT OR IGNORE INTO person_coach_mentions VALUES (?, ?, ?)').run(
      athlete.person_id, coached.athlete_id, coached.competition_id);
    sql.prepare("INSERT INTO person_activities(person_id, organization, position) VALUES (?, 'Федерация', 'Председатель')").run(athlete.person_id);
    sql.prepare("INSERT INTO person_judge_roles(person_id, role) VALUES (?, 'Главный судья')").run(athlete.person_id);
    const slug = sql.prepare('SELECT slug FROM persons WHERE id = ?').get(athlete.person_id).slug;
    const person = await getPerson(db, slug);
    assert.ok(person.athleteData.results.length);
    assert.ok(person.coachedAthletes.length);
    assert.equal(person.activities.length, 1);
    assert.equal(person.judgeRoles.length, 1);
  } finally { sql.close(); }
});

test('coaches table links to person pages and includes search', () => {
  const html = renderCoaches({ coaches: [{ name: 'Тренер', slug: 'coach-1', regions: ['Омск'] }], L: links.static });
  assert.ok(html.includes('id="coach-search"'));
  assert.ok(html.includes('href="p-coach-1.html"'));
});
