import test from 'node:test';
import assert from 'node:assert/strict';
import { renderAthletes } from '../src/athletes.js';
import { listCoaches } from '../src/queries.js';
import { renderCoaches } from '../src/render.js';

const L = {
  home: '/',
  results: '/results',
  coaches: '/coaches',
  css: '/style.css',
  athlete: (slug) => `/a/${slug}`,
  person: (slug) => `/p/${slug}`,
};

test('athlete search shows and updates filtered row count', () => {
  const html = renderAthletes({
    L,
    athletes: [
      { name: 'Иванов Иван', slug: 'ivanov', results_count: 1, competitions_count: 1 },
      { name: 'Петров Петр', slug: 'petrov', results_count: 1, competitions_count: 1 },
    ],
  });

  assert.match(html, /id="athlete-count"[^>]*>Показано строк: 2\.<\/p>/);
  assert.match(html, /athlete-count'\)\.textContent = 'Показано строк: ' \+ visible \+ '\.'/);
});

test('coach list aggregates first and last mention years', async () => {
  const db = {
    all: async () => [
      {
        person_id: 1, slug: 'coach', name: 'Иванов И.И.',
        athlete_id: 10, athlete_name: 'Спортсмен А', athlete_slug: 'athlete-a',
        region: 'Москва', first_year: '2019', last_year: '2021',
      },
      {
        person_id: 1, slug: 'coach', name: 'Иванов И.И.',
        athlete_id: 11, athlete_name: 'Спортсмен Б', athlete_slug: 'athlete-b',
        region: 'Москва', first_year: '2023', last_year: '2026',
      },
    ],
  };

  const [coach] = await listCoaches(db);
  assert.equal(coach.first_year, '2019');
  assert.equal(coach.last_year, '2026');
});

test('coach search shows and updates filtered row count', () => {
  const html = renderCoaches({
    L,
    coaches: [
      { name: 'Иванов И.И.', slug: 'ivanov', regions: ['Москва'], first_year: '2019', last_year: '2026' },
      { name: 'Петров П.П.', slug: 'petrov', regions: ['Томская область'], first_year: '2024', last_year: '2024' },
      { name: 'Сидоров С.С.', slug: 'sidorov', regions: [] },
    ],
  });

  assert.match(html, /id="coach-count"[^>]*>Показано строк: 3\.<\/p>/);
  assert.match(html, />Период<\/th>/);
  assert.match(html, />2019–2026<\/td>/);
  assert.match(html, />2024<\/td>/);
  assert.match(html, /coach-count'\)\.textContent = 'Показано строк: ' \+ visible \+ '\.'/);
});
