import { test } from 'node:test';
import assert from 'node:assert/strict';
import { renderIndex } from '../src/render-home.js';
import { links } from '../src/render.js';

const stats = {
  competitions: 1,
  results: 2,
  athletes: 3,
  coaches: 4,
  unique_categories: 1,
};

const competition = {
  slug: 'test-tournament',
  name: 'Чемпионат России 2026',
  date_start: '2026-05-01',
  city: 'Москва',
  country: 'RU',
  federation: 'ВФГС',
  rank_name: 'Всероссийский',
  categories: 1,
  results: 2,
};

test('expanded home tournament title opens tournament page instead of filtering by type', () => {
  const html = renderIndex({ stats, competitions: [competition], L: links.worker });

  assert.match(
    html,
    /<td><a class="home-quick-filter home-quick-name" href="\/c\/test-tournament">Чемпионат России 2026<\/a><\/td>/,
  );
  assert.doesNotMatch(html, /home-quick-name" data-filter="type"/);
  assert.match(html, /data-filter="rank" data-value="Всероссийский">Всероссийский<\/button>/);
});
