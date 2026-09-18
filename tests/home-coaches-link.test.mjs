import { test } from 'node:test';
import assert from 'node:assert/strict';
import { renderIndex } from '../src/render-home.js';
import { links } from '../src/render.js';

const stats = { competitions: 1, results: 2, athletes: 3, coaches: 4, regions: 5, unique_categories: 6 };

const coachesLink = (href) => new RegExp(`<a[^>]*href="${href.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')}"[^>]*>Тренеров<\\/a>`);

test('home coaches tally links to coaches page in worker', () => {
  const html = renderIndex({ stats, competitions: [], L: links.worker });
  assert.match(html, coachesLink('/coaches'));
});

test('home coaches tally links to coaches page in static snapshot', () => {
  const html = renderIndex({ stats, competitions: [], L: links.static });
  assert.match(html, coachesLink('coaches.html'));
});


test('home tally shows normalized region count', () => {
  const html = renderIndex({ stats, competitions: [], L: links.worker });
  assert.match(html, /<dt>Регионов<\/dt><dd>5<\/dd>/);
  assert.doesNotMatch(html, /<dt>Регионов<\/dt><dd[^>]*>подсчитываем<\/dd>/);
});
