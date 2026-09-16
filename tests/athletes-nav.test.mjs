import { test } from 'node:test';
import assert from 'node:assert/strict';
import { renderIndex } from '../src/render-home.js';
import { links } from '../src/render.js';
import { withAthletesNav } from '../src/athletes.js';

const stats = { competitions: 1, results: 2, athletes: 3, coaches: 4 };

function navOf(html) {
  return html.match(/<nav>([\s\S]*?)<\/nav>/)?.[1] || '';
}

test('home navigation includes athletes even when the tally already links to athletes', () => {
  const raw = renderIndex({ stats, competitions: [], L: links.worker });
  assert.match(raw, /href="\/athletes"[^>]*>Спортсменов<\/a>/);

  const html = withAthletesNav(raw, '/athletes', '/coaches');
  const nav = navOf(html);

  assert.match(nav, /href="\/athletes"[^>]*>Спортсмены<\/a>/);
  assert.equal((nav.match(/href="\/athletes"/g) || []).length, 1);
});

test('static home navigation includes athletes', () => {
  const raw = renderIndex({ stats, competitions: [], L: links.static });
  const html = withAthletesNav(raw, 'athletes.html', 'coaches.html');
  const nav = navOf(html);

  assert.match(nav, /href="athletes\.html"[^>]*>Спортсмены<\/a>/);
});
