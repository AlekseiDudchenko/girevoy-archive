import { test } from 'node:test';
import assert from 'node:assert/strict';
import { renderPerson, links } from '../src/render.js';

const result = (overrides = {}) => ({
  event_date: '2025-05-10',
  competition: 'Чемпионат',
  competition_slug: 'championship',
  discipline_name: 'Толчок',
  bell_kg: 32,
  hands: 'two',
  time_limit_min: 10,
  weight_class_raw: '85',
  place: 1,
  reps: [{ hand: 'both', reps: 100 }],
  result_value: 100,
  rank_achieved: null,
  rank_achieved_code: null,
  body_weight_kg: 81.2,
  ...overrides,
});

function render(results) {
  return renderPerson({
    person: { display_name: 'Тестовый Спортсмен' },
    activities: [],
    judgeRoles: [],
    coachedAthletes: [],
    athleteData: { athlete: {}, results },
    L: links.worker,
  });
}

test('athlete results show sortable body weight and a weight history chart', () => {
  const html = render([
    result(),
    result({ competition: 'Кубок', competition_slug: 'cup', event_date: '2026-06-20', body_weight_kg: 79.8 }),
    result({ competition: 'Старт без взвешивания', competition_slug: 'no-weight', event_date: '2024-04-01', body_weight_kg: null }),
  ]);

  assert.ok(html.includes('data-key="weight"'));
  assert.ok(html.includes('>Личный вес</th>'));
  assert.ok(html.includes('data-weight="81.2"'));
  assert.ok(html.includes('data-weight="79.8"'));
  assert.ok(html.includes('81.2</td>'));
  assert.ok(html.includes('79.8</td>'));
  assert.ok(html.includes('aria-label="Динамика личного веса"'));
  assert.ok(html.includes('81.2 кг — 10 мая 2025, Чемпионат'));
  assert.ok(html.includes('79.8 кг — 20 июня 2026, Кубок'));
  assert.ok(html.includes('var numeric = { wc: 1, weight: 1, place: 1, value: 1 };'));
});

test('weight chart ignores missing values and deduplicates the same competition weighing', () => {
  const html = render([
    result(),
    result({ discipline_name: 'Рывок', result_value: 120 }),
    result({ competition: 'Без веса', competition_slug: 'missing', event_date: '2026-01-01', body_weight_kg: null }),
  ]);

  assert.equal((html.match(/81\.2 кг — 10 мая 2025, Чемпионат/g) || []).length, 1);
  assert.ok(!html.includes('null кг'));
});

test('athlete page explains when no body weight is available', () => {
  const html = render([result({ body_weight_kg: null })]);
  assert.ok(html.includes('Нет данных о личном весе.'));
});
