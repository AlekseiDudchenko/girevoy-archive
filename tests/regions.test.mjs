import { test } from 'node:test';
import assert from 'node:assert/strict';
import { DatabaseSync } from 'node:sqlite';
import { readFileSync, readdirSync, existsSync } from 'node:fs';

// Ключ сопоставления повторяет norm_alias() из scripts/gen_regions.py.
const norm = (value) => String(value).replace(/ё/g, 'е').replace(/Ё/g, 'Е').toLowerCase().trim().split(/\s+/).join(' ');

const db = () => {
  const conn = new DatabaseSync(':memory:');
  for (const file of ['migrations/0001_init.sql', 'seeds/0002_regions.sql']) conn.exec(readFileSync(file, 'utf8'));
  return conn;
};

function rawRegions() {
  const values = new Set();
  for (const file of readdirSync('data').filter((f) => f.endsWith('.json'))) {
    const data = JSON.parse(readFileSync(`data/${file}`, 'utf8'));
    if (!data || !data.competition) continue;
    const categories = [...(data.categories ?? [])];
    const dir = `data/categories/${data.competition.slug}`;
    if (existsSync(dir)) {
      for (const fragment of readdirSync(dir).filter((f) => f.endsWith('.json'))) {
        const parsed = JSON.parse(readFileSync(`${dir}/${fragment}`, 'utf8'));
        categories.push(parsed.category ?? parsed);
      }
    }
    for (const category of categories) for (const row of category.rows ?? []) if (row[4]) values.add(row[4]);
  }
  return [...values];
}

test('каждое написание региона из протоколов разрешается в справочник', () => {
  const conn = db();
  const known = new Set(conn.prepare('SELECT alias FROM region_aliases').all().map((r) => r.alias));
  const unknown = rawRegions().filter((value) => !known.has(norm(value)));
  assert.deepEqual(unknown, [], `нет алиаса в data/regions.json: ${unknown.join(', ')}`);
});

test('варианты написания одного субъекта ведут на один регион', () => {
  const conn = db();
  const resolve = (alias) => conn.prepare('SELECT region_id FROM region_aliases WHERE alias = ?').get(norm(alias))?.region_id;
  for (const variants of [
    ['Кировская область', 'Кировская обл.', 'Кировская обл'],
    ['ЯНАО', 'Ямало-Ненецкий автономный округ', 'ЯНАО/Омская область'],
    ['ХМАО-Югра', 'Ханты-Мансийский АО - Югра'],
    ['г. Санкт-Петербург', 'г.Санкт-Петербург', 'Санкт-Петербург', 'Г.Санкт-Петербург'],
    ['Челябинская область', 'Челябинская область '],
  ]) {
    const ids = new Set(variants.map(resolve));
    assert.equal(ids.size, 1, `${variants.join(' / ')} разошлись по регионам`);
    assert.ok([...ids][0], `${variants[0]} не нашёлся в справочнике`);
  }
});

test('регион канонизируется, но сырое написание остаётся в результате', () => {
  const conn = db();
  const names = conn.prepare('SELECT name FROM regions ORDER BY name').all().map((r) => r.name);
  assert.ok(!names.some((n) => /\bобл\.?$/.test(n)), 'в справочнике осталось сокращение «обл.»');
  assert.ok(names.includes('Кировская область') && !names.includes('Кировская обл.'));
  // raw_region по-прежнему хранит написание протокола — это проверяет схема, не справочник.
  assert.ok(readFileSync('migrations/0001_init.sql', 'utf8').includes('raw_region'));
});
