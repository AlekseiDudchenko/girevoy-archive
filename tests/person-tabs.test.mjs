import { test } from 'node:test';
import assert from 'node:assert/strict';
import { renderPerson, links } from '../src/render.js';
import { personTabs } from '../src/person-tabs.js';

test('person roles render as populated tabs in profile order', () => {
  const html = personTabs(renderPerson({
    person: { display_name: 'Тестовая Персона' },
    activities: [{ organization: 'Федерация', position: 'Председатель' }],
    athleteData: { athlete: {}, results: [] },
    coachedAthletes: [{ name: 'Спортсмен (2026)', slug: 'athlete', regions: ['Москва'] }],
    judgeRoles: [{ role: 'Главный судья', date_start: '2026-01-01' }],
    L: links.worker,
  }));

  const labels = ['Спортивный деятель', 'Спортсмен', 'Тренер', 'Судья'];
  let last = -1;
  for (const label of labels) {
    const index = html.indexOf(`role="tab" data-person-tab=`);
    assert.ok(html.includes(`>${label}</button>`), `missing tab: ${label}`);
    const labelIndex = html.indexOf(`>${label}</button>`);
    assert.ok(labelIndex > last, `wrong tab order: ${label}`);
    last = labelIndex;
    assert.ok(index >= 0);
  }

  assert.match(html, /id="tab-official"[^>]*aria-selected="true"[^>]*tabindex="0"/);
  assert.match(html, /id="role-official"[^>]*data-person-role="official">/);
  assert.match(html, /id="role-athlete"[^>]*data-person-role="athlete" hidden>/);
  assert.match(html, /id="role-coach"[^>]*data-person-role="coach" hidden>/);
  assert.match(html, /id="role-judge"[^>]*data-person-role="judge" hidden>/);
  assert.ok(html.includes("window.location.hash.slice(1)"));
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
