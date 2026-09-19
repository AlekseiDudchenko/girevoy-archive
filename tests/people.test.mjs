import { test } from 'node:test';
import assert from 'node:assert/strict';
import { DatabaseSync } from 'node:sqlite';
import { readFileSync, readdirSync } from 'node:fs';
import { execFileSync } from 'node:child_process';
import { listCoaches, getPerson } from '../src/queries.js';
import { renderCoaches, renderPerson, links } from '../src/render.js';

// Миграции берутся списком каталога: захардкоженный перечень отставал от migrations/
// и новая таблица роняла тесты, хотя схема была верна.
const migrations = readdirSync('migrations').filter((f) => f.endsWith('.sql')).sort()
  .map((f) => `migrations/${f}`);
const before2024 = [...migrations, 'seeds/0001_reference.sql', 'seeds/0002_regions.sql',
  'seeds/0003_chempionat-rossii-2026.sql', 'seeds/0004_chempionat-rossii-2025.sql'];
const after2024 = ['seeds/0005_merges.sql'];
const execOptions = { encoding: 'utf8', maxBuffer: 16 * 1024 * 1024 };

test('comma inside coach initials is normalized before splitting', () => {
  const script = `
import sys
sys.path.insert(0, 'scripts')
from gen_people import coach_names

for value in ['Ковалевский А,А.', 'Трофимов М,А.', 'Иванов А.А., Петров Б.Б.']:
    print('|'.join(coach_names(value, {}, {})))
`;
  const actual = execFileSync('python3', ['-c', script], execOptions).trim().split('\n');
  assert.deepEqual(actual, ['Ковалевский А.А.', 'Трофимов М.А.', 'Иванов А.А.|Петров Б.Б.']);
});

test('known malformed coach names use canonical spelling', () => {
  const script = `
import sys
sys.path.insert(0, 'scripts')
from gen_people import coach_names, load_person_rules

merges, splits = load_person_rules()
for value in ['А.Е.Попова', 'АбдуллинР.Р.', 'Ананенко А.В.', 'Анасенко МС.В.']:
    print('|'.join(coach_names(value, merges, splits)))
`;
  const actual = execFileSync('python3', ['-c', script], execOptions).trim().split('\n');
  assert.deepEqual(actual, ['Попова А.Е.', 'Абдуллин Р.Р.', 'Анасенко А.В.', 'Анасенко А.В.']);
});

test('2024 glued Khlebodarov and Anasenko coaches are split', () => {
  const script = `
import sys
sys.path.insert(0, 'scripts')
from gen_people import coach_names, load_person_rules

merges, splits = load_person_rules()
print('|'.join(coach_names('Коломин Д., Хлебодаров А. Анасенко А.В.', merges, splits)))
`;
  const actual = execFileSync('python3', ['-c', script], execOptions).trim();
  assert.equal(actual, 'Коломин Д.|Хлебодаров А.|Анасенко А.В.');
});

test('known malformed Polyanskiy spelling uses canonical coach', () => {
  const script = `
import sys
sys.path.insert(0, 'scripts')
from gen_people import coach_names, load_person_rules

merges, splits = load_person_rules()
print('|'.join(coach_names('Полянский .Е.', merges, splits)))
`;
  const actual = execFileSync('python3', ['-c', script], execOptions).trim();
  assert.equal(actual, 'Полянский В.С.');
});

test('known malformed Lyubimskiy spelling uses canonical coach', () => {
  const script = `
import sys
sys.path.insert(0, 'scripts')
from gen_people import coach_names, load_person_rules

merges, splits = load_person_rules()
print('|'.join(coach_names('Любимскмй С.А.', merges, splits)))
`;
  const actual = execFileSync('python3', ['-c', script], execOptions).trim();
  assert.equal(actual, 'Любимский С.А.');
});

test('punctuation in coach spelling does not create a second person', () => {
  const script = `
import sys
sys.path.insert(0, 'scripts')
from gen_people import normalize_coach_name

for value in ['Барков А.П', 'Смирнов А', 'Танаев.Ю.М.', 'ДягилевА.В.', 'Бирюков С.Н..',
              'Глинкин  Б.Н.', 'Нестеренко Д. В.', 'Барков А.П.', 'Салов Павел Сергеевич']:
    print(normalize_coach_name(value))
`;
  const actual = execFileSync('python3', ['-c', script], execOptions).trim().split('\n');
  assert.deepEqual(actual, ['Барков А.П.', 'Смирнов А.', 'Танаев Ю.М.', 'Дягилев А.В.',
    'Бирюков С.Н.', 'Глинкин Б.Н.', 'Нестеренко Д.В.', 'Барков А.П.', 'Салов Павел Сергеевич']);
});

test('newline separates two coaches, comma between initials does not', () => {
  const script = `
import sys
sys.path.insert(0, 'scripts')
from gen_people import coach_names

print('|'.join(coach_names('Виноградов М.\\nМарков И.', {}, {})))
print('|'.join(coach_names('Ковалевский А,А.', {}, {})))
`;
  const actual = execFileSync('python3', ['-c', script], execOptions).trim().split('\n');
  assert.deepEqual(actual, ['Виноградов М.|Марков И.', 'Ковалевский А.А.']);
});

test('self-coaching marker survives normalization', () => {
  const script = `
import sys
sys.path.insert(0, 'scripts')
from gen_people import coach_names

for value in ['Самостоя.С.', 'самостоятельно', '-']:
    print(len(coach_names(value, {}, {})))
`;
  const actual = execFileSync('python3', ['-c', script], execOptions).trim().split('\n');
  assert.deepEqual(actual, ['0', '0', '0']);
});

test('spelling with ё wins over the same name with е', () => {
  const script = `
import sys
sys.path.insert(0, 'scripts')
from gen_people import canonical_spelling

resolved = canonical_spelling({'Пономарев Д.В.', 'Пономарёв Д.В.', 'Петров В.М.'})
print(resolved['Пономарев Д.В.'])
print(resolved['Пономарёв Д.В.'])
print(resolved['Петров В.М.'])
`;
  const actual = execFileSync('python3', ['-c', script], execOptions).trim().split('\n');
  assert.deepEqual(actual, ['Пономарёв Д.В.', 'Пономарёв Д.В.', 'Петров В.М.']);
});

test('capital Ё folds into the same group as Е', () => {
  // `str.replace('ё', 'е')` не трогает заглавную Ё, и `Ёлькин Ю.Г.` оставался
  // отдельной персоной от `Елькин Ю.Г.` — ровно тот дубль, против которого
  // canonical_spelling() и написан.
  const script = `
import sys
sys.path.insert(0, 'scripts')
from gen_people import canonical_spelling

resolved = canonical_spelling({'Ёлькин Ю.Г.', 'Елькин Ю.Г.'})
print(resolved['Ёлькин Ю.Г.'])
print(resolved['Елькин Ю.Г.'])
`;
  const actual = execFileSync('python3', ['-c', script], execOptions).trim().split('\n');
  assert.deepEqual(actual, ['Ёлькин Ю.Г.', 'Ёлькин Ю.Г.']);
});

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

test('coach spellings are kept with the competition they were printed in', () => {
  const { sql } = realDb();
  try {
    const aliases = sql.prepare(`
      SELECT COUNT(*) AS count,
             SUM(CASE WHEN competition_id IS NULL THEN 1 ELSE 0 END) AS without_source
      FROM person_coach_aliases`).get();
    assert.ok(aliases.count > 0);
    // Написание — факт конкретного протокола, без ссылки на него строка бессмысленна.
    assert.equal(aliases.without_source, 0);
    const orphan = sql.prepare(`
      SELECT COUNT(*) AS count FROM person_coach_aliases a
      LEFT JOIN persons p ON p.id = a.person_id WHERE p.id IS NULL`).get();
    assert.equal(orphan.count, 0);
    // Каждый тренер хранит хотя бы то написание, под которым показан.
    const missing = sql.prepare(`
      SELECT COUNT(*) AS count FROM persons p
      JOIN person_coach_mentions m ON m.person_id = p.id
      WHERE NOT EXISTS (SELECT 1 FROM person_coach_aliases a WHERE a.person_id = p.id)`).get();
    assert.equal(missing.count, 0);
  } finally { sql.close(); }
});

test('coach card shows the spellings printed in protocols', async () => {
  const { sql, db } = realDb();
  try {
    const coaches = await listCoaches(db);
    const withAlias = [];
    for (const coach of coaches) {
      const person = await getPerson(db, coach.slug);
      const aliases = person.coachSummary?.aliases || [];
      if (aliases.length) withAlias.push({ coach, person, aliases });
    }
    assert.ok(withAlias.length, 'ожидался хотя бы один тренер с другим написанием');
    const { person, aliases } = withAlias[0];
    // Показанное написание в список других не попадает — иначе строка повторяет заголовок.
    assert.ok(aliases.every((a) => a.raw_name !== person.person.display_name));
    assert.ok(aliases.every((a) => a.first_year && a.last_year));
    const html = renderPerson({ ...person, L: links.static });
    assert.match(html, /Написания в протоколах/);
    assert.ok(html.includes(`«${aliases[0].raw_name}»`));
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
    coachedAthletes: [{
      name: 'A&B', slug: 'a', region: 'Москва', birth_year: 1990,
      sport_rank: 'МС', sport_rank_sort: 5,
      last_weight_class: '95+', last_weight_class_kg: 95, last_weight_class_is_open: 1,
      first_year: '2023', last_year: '2026', competitions_count: 3, results_count: 7,
    }],
    judgeRoles: [], athleteData: null, L: links.worker,
  });
  assert.ok(html.includes('&lt;Персона&gt;') && html.includes('A&amp;B'));
  assert.ok(html.indexOf('Спортивный деятель') < html.indexOf('<h2>Тренер</h2>'));
  assert.ok(!html.includes('<h2>Спортсмен</h2>'));
  assert.ok(!html.includes('<h2>Судья</h2>'));
  assert.ok(html.includes(`href="${links.worker.person('a')}"`));
  assert.match(html, />Период выступлений<\/th>/);
  assert.match(html, />Соревнований<\/th>/);
  assert.match(html, />Результатов<\/th>/);
  assert.match(html, /data-sort-value="2026">2023–2026<\/td>/);
});

test('coach athlete summaries include full athlete-list statistics', async () => {
  const { sql, db } = realDb();
  try {
    const coach = sql.prepare('SELECT p.slug FROM persons p JOIN person_coach_mentions pcm ON pcm.person_id = p.id LIMIT 1').get();
    assert.ok(coach);
    const person = await getPerson(db, coach.slug);
    assert.ok(person.coachedAthletes.length);
    assert.ok(person.coachSummary);
    assert.equal(person.coachSummary.athletes_count, person.coachedAthletes.length);
    assert.ok(person.coachSummary.results_count >= 1);
    assert.ok(person.coachSummary.competitions_count >= 1);
    assert.ok(person.coachSummary.years_count >= 1);
    assert.match(String(person.coachSummary.first_year), /^202[3-6]$/);
    assert.match(String(person.coachSummary.last_year), /^202[3-6]$/);
    assert.ok(Array.isArray(person.coachSummary.regions));
    for (const athlete of person.coachedAthletes) {
      assert.ok(athlete.results_count >= 1);
      assert.ok(athlete.competitions_count >= 1);
      assert.ok(athlete.coach_results_count >= 1);
      assert.ok(athlete.coach_competitions_count >= 1);
      assert.ok(athlete.coach_results_count <= athlete.results_count);
      assert.ok(athlete.coach_competitions_count <= athlete.competitions_count);
      assert.match(String(athlete.first_year), /^202[3-6]$/);
      assert.match(String(athlete.last_year), /^202[3-6]$/);
      assert.ok(athlete.last_year >= athlete.first_year);
      assert.ok('sport_rank' in athlete);
      assert.ok('last_weight_class' in athlete);
    }
  } finally { sql.close(); }
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
