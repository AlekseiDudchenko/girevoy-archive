import { test } from 'node:test';
import assert from 'node:assert/strict';
import { seriesLabel } from '../src/queries.js';
import { renderCompetition, renderResults, links } from '../src/render.js';

test('snatch series never shows the redundant one-hand suffix', () => {
  assert.equal(seriesLabel({
    discipline_name: 'Рывок', bell_kg: 24, hands: 'one', time_limit_min: 10,
  }), 'Рывок · 24 кг · 10 мин');

  assert.equal(seriesLabel({
    discipline_name: 'Длинный цикл', bell_kg: 24, hands: 'one', time_limit_min: 30,
  }), 'Длинный цикл · 24 кг · одной рукой · 30 мин');
});

test('competition UI spells out Рывок and does not append one-hand wording', () => {
  const html = renderCompetition({
    comp: {
      name: 'Тест', date_start: '2026-01-01', city: 'Москва', country: 'RU',
      rank_name: 'Тест', federation_name: 'ВФГС', source_url: null,
    },
    categories: [{
      id: 1, discipline_name: 'Рывок', discipline_code: 'snatch', hands: 'one',
      bell_kg: 24, time_limit_min: 10, sex: 'f', age_group: 'Взрослые',
      division: null, weight_class_raw: '63', participants_declared: 0,
      is_deferred: 0, rows: [],
    }],
    L: links.worker,
  });

  assert.ok(html.includes('<h2>Рывок · 24 кг · 10 мин</h2>'));
  assert.ok(html.includes('Рывок(<span class="chip-sex chip-sex-f">ж</span>)'));
  assert.ok(!html.includes('Рывок · одной рукой'));
  assert.ok(!html.includes('>Р(<span class="chip-sex'));
});

test('all-results UI uses the same canonical snatch label', () => {
  const html = renderResults({
    rows: [{
      discipline_name: 'Рывок', bell_kg: 24, hands: 'one', time_limit_min: 10,
      sex: 'f', weight_class_raw: '63', result_value: 120,
      event_date: '2026-01-01', last_name: 'Иванова', first_name: 'Анна', middle_name: null,
      slug: 'ivanova-anna-1990', competition: 'Тест', competition_slug: 'test', place: 1,
    }],
    L: links.worker,
  });

  assert.ok(html.includes('Рывок · 24 кг · 10 мин'));
  assert.ok(!html.includes('Рывок · 24 кг · одной'));
});
