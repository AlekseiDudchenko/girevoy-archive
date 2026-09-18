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
  assert.match(sql, /COUNT\(DISTINCT pr\.competition_id\) AS competitions_count/);
  assert.match(sql, /MIN\(SUBSTR\(pr\.result_date, 1, 4\)\) AS first_year/);
  assert.match(sql, /c\.is_published = 1/);
});

test('athlete list renders rank and latest weight class without duplicate year', () => {
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
      competitions_count: 5,
      first_year: '2023',
      last_year: '2026',
    }],
  });

  assert.match(html, />Разряд<\/th>/);
  assert.match(html, />Весовая<\/th>/);
  assert.match(html, /data-sort-value="5">МС<\/td>/);
  assert.match(html, /data-sort-value="95\.5">95\+ кг<\/td>/);
  assert.doesNotMatch(html, /95\+ кг \(2026\)/);
  assert.match(html, /Имя, регион, разряд, весовая категория или год/);
});

test('athlete list shows performance period, competitions and results', () => {
  const html = renderAthletes({
    L,
    athletes: [{
      id: 1,
      name: 'Иванов Иван',
      slug: 'ivanov-ivan',
      results_count: 12,
      competitions_count: 5,
      first_year: '2021',
      last_year: '2026',
    }],
  });

  assert.match(html, /data-sort="5"[^>]*>Период выступлений<\/th>\s*<th[^>]*data-sort="6"[^>]*>Соревнований<\/th>\s*<th[^>]*data-sort="7"[^>]*>Результатов<\/th>/);
  assert.match(html, /data-sort-value="2026">2021–2026<\/td>\s*<td class="c n" data-sort-value="5">5<\/td>\s*<td class="c n" data-sort-value="12">12<\/td>/);
  assert.doesNotMatch(html, /Последний протокол/);
});

test('athlete list uses compact labels for adult and youth sport ranks', () => {
  const html = renderAthletes({
    L,
    athletes: [
      {
        id: 1,
        name: 'Первый Спортсмен',
        slug: 'first',
        sport_rank: 'I разряд',
        sport_rank_sort: 3,
        results_count: 1,
        competitions_count: 1,
        first_year: '2026',
        last_year: '2026',
      },
      {
        id: 2,
        name: 'Второй Спортсмен',
        slug: 'second',
        sport_rank: 'II спортивный разряд',
        sport_rank_sort: 2,
        results_count: 1,
        competitions_count: 1,
        first_year: '2026',
        last_year: '2026',
      },
      {
        id: 3,
        name: 'Юный Спортсмен',
        slug: 'youth',
        sport_rank: 'III юношеский спортивный разряд',
        sport_rank_sort: 0,
        results_count: 1,
        competitions_count: 1,
        first_year: '2026',
        last_year: '2026',
      },
    ],
  });

  assert.match(html, /data-sort-value="3">I<\/td>/);
  assert.match(html, /data-sort-value="2">II<\/td>/);
  assert.match(html, /data-sort-value="0">III юн\.<\/td>/);
  assert.doesNotMatch(html, />I разряд<\/td>/);
});
