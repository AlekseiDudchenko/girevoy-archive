import { test } from 'node:test';
import assert from 'node:assert/strict';
import { execFileSync } from 'node:child_process';
import { readFileSync } from 'node:fs';

const sql = execFileSync('python3', ['scripts/gen_people.py'], {
  encoding: 'utf8',
  maxBuffer: 32 * 1024 * 1024,
});

const coachPeopleBlock = sql.match(
  /INSERT OR IGNORE INTO persons \(slug, display_name(?:, birth_year)?\) VALUES\n([\s\S]*?);\n/,
)?.[1] ?? '';

const roleLinks = JSON.parse(readFileSync('data/person_role_links.json', 'utf8'));
const linkedCoachIdentities = new Set(
  (roleLinks.coach_athlete_links ?? []).map((item) => item.coach),
);

function generatesCoachPerson(name) {
  return coachPeopleBlock.includes(`'${name}'`);
}

function generatesCoachIdentity(name) {
  return generatesCoachPerson(name) || linkedCoachIdentities.has(name);
}

test('confirmed coach aliases generate only canonical people', () => {
  const duplicates = [
    'Соловьев А.В.',
    'Мамагов Г.Т.',
    'Донский А.И.',
    'Шпартко М.А',
    'Трофимов М.А',
    'Нестеренко Д. В.',
    'Садыков Р. И.',
    'Филимонов М. О.',
    'Симушин А. М.',
    'Мошев Д.И',
    'Леонов С.Т',
    'Трофимова А.А',
  ];
  const canonical = [
    'Соловьёв А.В.',
    'Маматов Г.Т.',
    'Донских А.И.',
    'Шпартко М.А.',
    'Трофимов М.А.',
    'Нестеренко Д.В.',
    'Садыков Р.И.',
    'Филимонов М.О.',
    'Симушин А.М.',
    'Мошев Д.И.',
    'Леонов С.Т.',
    'Трофимова А.А.',
  ];

  for (const name of duplicates) {
    assert.ok(!generatesCoachPerson(name), `duplicate person must not be generated: ${name}`);
  }
  for (const name of canonical) {
    assert.ok(generatesCoachPerson(name), `canonical person must be generated: ${name}`);
  }
});

test('confirmed missing delimiters split into separate coach identities', () => {
  const combined = [
    'Емельянов Н.А. Ефимов А.В.',
    'Бабичев М.А. Горбачёв В.В.',
    'Семенов А.Н. Руднев С.Л.',
    'Шпартко М.А.Шульга Н.В.',
    'Фадеев А.С.Катаев И .В.',
    'Танаев А.Ю.Танаев Ю.М.',
    'Соловьев А.В.Ландин А.Ю.',
    'Салов П.С.Алфёрова В.Я.',
    'Огарев В.Я.Вильган А.',
    'Никольский С.А.Бирюков С.Н.',
    'Кулаков И.И.Шматов И.Б.',
    'Кириллов С.А.Огарев В.Я',
    'Катаев И.В.Бирюков С.Н.',
    'Каргин С.Я.Барбакова Н.А.',
    'Дубровин Д.А. Кириллов С.А',
    'Гомонов В.Н.Лукьянчиков Ю.В.',
    'Бирюков А.С.Винтовкин Н.В.',
    'Бенидзе А.А.Огарев В.Я',
    'Барков А.П. Мартьянов А.В.Садыков Р.И.',
    'Бабичев М.А.Донских А.И.',
  ];
  const separate = [
    'Емельянов Н.А.', 'Ефимов А.В.',
    'Бабичев М.А.', 'Горбачёв В.В.',
    'Семёнов А.Н.', 'Руднев С.Л.',
    'Шпартко М.А.', 'Шульга Н.В.',
    'Фадеев А.С.', 'Катаев И.В.',
    'Танаев А.Ю.', 'Танаев Ю.М.',
    'Соловьёв А.В.', 'Ландин А.Ю.',
    'Салов П.С.', 'Алфёрова В.Я.',
    'Огарев В.Я.', 'Вильган А.',
    'Никольский С.А.', 'Бирюков С.Н.',
    'Кулаков И.И.', 'Шматов И.Б.',
    'Кириллов С.А.', 'Каргин С.Я.',
    'Барбакова Н.А.', 'Дубровин Д.А.',
    'Гомонов В.Н.', 'Лукьянчиков Ю.В.',
    'Бирюков А.С.', 'Винтовкин Н.В.',
    'Бенидзе А.А.', 'Барков А.П.',
    'Мартьянов А.В.', 'Садыков Р.И.',
    'Донских А.И.',
  ];

  for (const name of combined) {
    assert.ok(!generatesCoachPerson(name), `combined coach person must not be generated: ${name}`);
  }
  for (const name of separate) {
    assert.ok(generatesCoachIdentity(name), `split coach identity must be generated: ${name}`);
  }
});
