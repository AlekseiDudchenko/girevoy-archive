import { test } from 'node:test';
import assert from 'node:assert/strict';
import { renderResults, links } from '../src/render.js';
import { paginateResultsHtml } from '../scripts/results-pagination.mjs';

const makeRow = (i) => ({
  id: i,
  last_name: `Спортсмен${String(i).padStart(3, '0')}`,
  first_name: 'Тест',
  middle_name: '',
  slug: `athlete-${i}`,
  competition: `Турнир ${Math.ceil(i / 10)}`,
  competition_slug: `competition-${Math.ceil(i / 10)}`,
  event_date: `2025-01-${String((i % 28) + 1).padStart(2, '0')}`,
  discipline_name: i % 2 ? 'Рывок' : 'Толчок',
  bell_kg: i % 2 ? 24 : 32,
  hands: i % 2 ? 'one' : 'two',
  time_limit_min: 10,
  sex: i % 3 ? 'm' : 'f',
  weight_class_raw: i % 2 ? '73' : '85',
  result_value: 100 + i,
  place: (i % 5) + 1,
  corrections: i === 150 ? [{
    scope: 'category', field: 'bell_kg', source_value: '32', corrected_value: '24', correction_id: 'test',
  }] : [],
});

test('static results pagination keeps only one page of table rows in the DOM', () => {
  const html = renderResults({ rows: Array.from({ length: 250 }, (_, i) => makeRow(i + 1)), L: links.static });
  const paginated = paginateResultsHtml(html, 100);

  const tbody = paginated.match(/<table id="t">[\s\S]*?<tbody>([\s\S]*?)<\/tbody>/)?.[1] || '';
  assert.equal((tbody.match(/<tr>/g) || []).length, 100);
  assert.ok(paginated.includes('id="results-pager"'));
  assert.ok(paginated.includes('var PAGE_SIZE = 100'));
  assert.ok(!paginated.includes('Array.prototype.forEach.call(tbody.rows'));
});

test('static results pagination preserves all rows as data for filtering and later pages', () => {
  const html = renderResults({ rows: Array.from({ length: 250 }, (_, i) => makeRow(i + 1)), L: links.static });
  const paginated = paginateResultsHtml(html, 100);
  const json = paginated.match(/<script type="application\/json" id="results-data">([\s\S]*?)<\/script>/)?.[1];
  assert.ok(json);

  const data = JSON.parse(json);
  assert.equal(data.length, 250);
  assert.equal(data[0].discipline_name, 'Рывок');
  assert.match(data[149].cells, /correction-mark/);
  assert.match(data[149].cells, /Вес гири: 32 кг → 24 кг/);
  assert.match(data[149].cells, /\d{2}\.01\.2025/);
});

test('results JSON is safe to embed in an HTML script element', () => {
  const html = renderResults({ rows: [makeRow(1), { ...makeRow(2), competition: '</script><b>test</b>' }], L: links.static });
  const paginated = paginateResultsHtml(html, 1);
  const json = paginated.match(/<script type="application\/json" id="results-data">([\s\S]*?)<\/script>/)?.[1];
  assert.ok(json);
  assert.ok(!json.includes('</script>'));
  assert.equal(JSON.parse(json)[1].comp, '</script><b>test</b>');
});
