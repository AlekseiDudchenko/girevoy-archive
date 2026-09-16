import { test } from 'node:test';
import assert from 'node:assert/strict';
import { DatabaseSync } from 'node:sqlite';
import { readFileSync } from 'node:fs';
import { execFileSync } from 'node:child_process';
import { getPerson } from '../src/queries.js';

const seedFiles = [
  'migrations/0001_init.sql',
  'migrations/0002_people.sql',
  'seeds/0001_reference.sql',
  'seeds/0003_chempionat-rossii-2026.sql',
  'seeds/0004_chempionat-rossii-2025.sql',
  'seeds/0005_merges.sql',
];
const execOptions = { encoding: 'utf8', maxBuffer: 16 * 1024 * 1024 };

function realDb() {
  const sql = new DatabaseSync(':memory:');
  for (const file of seedFiles) sql.exec(readFileSync(file, 'utf8'));
  sql.exec(execFileSync('python3', ['scripts/gen_people.py'], execOptions));
  return { sql, db: {
    all: async (query, ...params) => sql.prepare(query).all(...params),
    get: async (query, ...params) => sql.prepare(query).get(...params) ?? null,
  } };
}

const cases = [
  { coach: 'Каргин С.Я.', athlete: 'Каргин Сергей Ярославович', birthYear: 1998 },
  { coach: 'Коломин Д.А.', athlete: 'Коломин Дмитрий Андреевич', birthYear: 1999 },
];

for (const item of cases) {
  test(`${item.coach} reuses the athlete person`, async () => {
    const { sql, db } = realDb();
    try {
      const athlete = sql.prepare(`SELECT id FROM athletes
        WHERE full_name = ? AND birth_year = ? AND merged_into_id IS NULL LIMIT 1`)
        .get(item.athlete, item.birthYear);
      assert.ok(athlete, `athlete not found: ${item.athlete}`);

      const athletePerson = sql.prepare('SELECT person_id FROM person_athletes WHERE athlete_id = ?')
        .get(athlete.id);
      assert.ok(athletePerson);

      const coachPeople = sql.prepare(`SELECT DISTINCT pcm.person_id
        FROM person_coach_mentions pcm
        WHERE pcm.person_id = ?`).all(athletePerson.person_id);
      assert.ok(coachPeople.length > 0, `${item.athlete} has no coach role mentions`);

      const oldCoachSlug = `coach-${Buffer.from(item.coach, 'utf8').toString('hex')}`;
      assert.equal(sql.prepare('SELECT COUNT(*) AS count FROM persons WHERE slug = ?').get(oldCoachSlug).count, 0);

      const slug = sql.prepare(`SELECT s.slug FROM athlete_slugs s
        WHERE s.athlete_id = ? AND s.is_current = 1`).get(athlete.id).slug;
      const person = await getPerson(db, slug);
      assert.equal(person.person.id, athletePerson.person_id);
      assert.ok(person.athleteData?.results.length > 0);
      assert.ok(person.coachedAthletes.length > 0);
    } finally {
      sql.close();
    }
  });
}
