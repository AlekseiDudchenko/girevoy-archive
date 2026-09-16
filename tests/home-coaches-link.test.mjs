import { test } from 'node:test';
import assert from 'node:assert/strict';
import { renderIndex } from '../src/render-home.js';
import { links } from '../src/render.js';

const stats = { competitions: 1, results: 2, athletes: 3, coaches: 4 };

test('home coaches tally links to coaches page in worker', () => {
  const html = renderIndex({ stats, competitions: [], L: links.worker });
  assert.ok(html.includes('<a href="/coaches">Тренеров</a>'));
});

test('home coaches tally links to coaches page in static snapshot', () => {
  const html = renderIndex({ stats, competitions: [], L: links.static });
  assert.ok(html.includes('<a href="coaches.html">Тренеров</a>'));
});
