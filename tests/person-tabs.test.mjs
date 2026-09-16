import { test } from 'node:test';
import assert from 'node:assert/strict';
import { renderPerson, links } from '../src/render.js';
import { personTabs, personRoleLinks } from '../src/person-tabs.js';

test('person roles render as populated tabs in profile order', () => {
  const html = personTabs(renderPerson({
    person: { display_name: 'Тестовая Персона' },
    activities: [{ organization: 'Федерация', position: 'Председатель' }],
    athleteData: {
      athlete: { coaches: [{ name: 'Тренер', slug: 'coach', last_year: '2026' }] },
      results: [],
    },
    coachedAthletes: [{ name: 'Спортсмен (2026)', slug: 'athlete', regions: ['Москва'] }],
    judgeRoles: [{ role: 'Главный судья', date_start: '2026-01-01' }],
    L: links.worker,
  }));

  const labels = ['Спортивный деятель', 'Спортсмен', 'Тренер', 'Судья'];
  let last = -1;
  for (const label of labels) {
    assert.ok(html.includes(`>${label}</button>`), `missing tab: ${label}`);
    const labelIndex = html.indexOf(`>${label}</button>`);
    assert.ok(labelIndex > last, `wrong tab order: ${label}`);
    last = labelIndex;
  }

  assert.match(html, /<nav class="person-tabs"[^>]*hidden>/);
  assert.match(html, /id="tab-official"[^>]*aria-selected="true"[^>]*tabindex="0"/);
  assert.match(html, /id="role-official"[^>]*data-person-role="official">/);
  assert.match(html, /id="role-athlete"[^>]*data-person-role="athlete">/);
  assert.match(html, /id="role-coach"[^>]*data-person-role="coach">/);
  assert.match(html, /id="role-judge"[^>]*data-person-role="judge">/);
  assert.ok(!/data-person-role="(?:athlete|coach|judge)" hidden/.test(html));
  assert.ok(html.includes("activate(tabs[0].dataset.personTab, false)"));
  assert.ok(html.includes('href="/p/coach#coach"'));
  assert.ok(html.includes('href="/p/athlete#athlete"'));
});

test('empty roles do not create tabs', () => {
  const html = personTabs(renderPerson({
    person: { display_name: 'Только тренер' },
    activities: [], athleteData: null,
    coachedAthletes: [{ name: 'Спортсмен', slug: 'athlete', regions: [] }],
    judgeRoles: [], L: links.worker,
  }));

  assert.ok(html.includes('data-person-tab="coach"'));
  assert.ok(!html.includes('data-person-tab="official"'));
  assert.ok(!html.includes('data-person-tab="athlete"'));
  assert.ok(!html.includes('data-person-tab="judge"'));
});

test('role-specific page links open the requested person tab', () => {
  const worker = personRoleLinks(
    '<a href="/p/person-1">Персона</a><a href="/c/comp-1">Турнир</a>', 'coach');
  assert.ok(worker.includes('href="/p/person-1#coach"'));
  assert.ok(worker.includes('href="/c/comp-1"'));

  const staticHtml = personRoleLinks(
    '<a href="p-person-1.html#coach">Персона</a><a href="results.html">Результаты</a>', 'athlete');
  assert.ok(staticHtml.includes('href="p-person-1.html#athlete"'));
  assert.ok(staticHtml.includes('href="results.html"'));
});
