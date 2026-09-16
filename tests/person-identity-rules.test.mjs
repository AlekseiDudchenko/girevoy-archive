import { test } from 'node:test';
import assert from 'node:assert/strict';
import { execFileSync } from 'node:child_process';

const sql = execFileSync('python3', ['scripts/gen_people.py'], {
  encoding: 'utf8',
  maxBuffer: 32 * 1024 * 1024,
});

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
    assert.ok(!sql.includes(`'${name}'`), `duplicate person must not be generated: ${name}`);
  }
  for (const name of canonical) {
    assert.ok(sql.includes(`'${name}'`), `canonical person must be generated: ${name}`);
  }
});

test('confirmed missing delimiters split into separate coach people', () => {
  const combined = [
    'Емельянов Н.А. Ефимов А.В.',
    'Бабичев М.А. Горбачёв В.В.',
    'Семенов А.Н. Руднев С.Л.',
  ];
  const separate = [
    'Емельянов Н.А.', 'Ефимов А.В.',
    'Бабичев М.А.', 'Горбачёв В.В.',
    'Семёнов А.Н.', 'Руднев С.Л.',
  ];

  for (const name of combined) {
    assert.ok(!sql.includes(`'${name}'`), `combined coach person must not be generated: ${name}`);
  }
  for (const name of separate) {
    assert.ok(sql.includes(`'${name}'`), `split coach person must be generated: ${name}`);
  }
});
