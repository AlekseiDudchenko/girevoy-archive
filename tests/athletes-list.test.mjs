import test from 'node:test';
import assert from 'node:assert/strict';
import { listAthletes, renderAthletes } from '../src/athletes.js';

const L = {
  home: '/',
  results: '/results',
  coaches: '/coaches',
  css: '/style.css',
  athlete: (slug) => `/a/${slug}`,
};

test('athlete list query derives latest rank and weight class from published results', async () => {
  let sql = '';
  const db = {
    all: async (query) => {
      sql = query;
      return [];
    },
  };

  await listAthletes(db);

  assert.match(sql, /rank_achieved_id/);
  assert.match(sql, /weight_class_raw/);
  assert.match(sql, /weight_class_kg/);
  assert.match(sql, /ORDER BY latest_rank\.result_date DESC/);
  assert.match(sql, /ORDER BY latest_weight\.result_date DESC/);
  assert.match(sql, /c\.is_published = 1/);
});

test('athlete list renders rank and latest weight class with year and numeric sort values', () => {
  const html = renderAthletes({
    L,
    athletes: [{
      id: 1,
      name: 'Иванов Иван',
      slug: 'ivanov-ivan',
      region: 'Москва',
      birth_year: 1990,
      sport_rank: 'МС',
      sport_rank_sort: 5,
      last_weight_class: '95+',
      last_weight_class_kg: 95,
      last_weight_class_is_open: 1,
      last_weight_year: '2026',
      results_count: 12,
      last_year: '2026',
    }],
  });

  assert.match(html, />Разряд<\/th>/);
  assert.match(html, />Последняя весовая<\/th>/);
  assert.match(html, /data-sort-value="5">МС<\/td>/);
  assert.match(html, /data-sort-value="95\.5">95\+ кг \(2026\)<\/td>/);
  assert.match(html, /Имя, регион, разряд, весовая категория или год/);
});
