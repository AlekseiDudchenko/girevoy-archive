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

  assert.match(html, /<section class="profile-card" data-profile-role="default" aria-label="Карточка спортсмена">/);
  assert.match(html, /<div class="profile-avatar" aria-hidden="true">ТП<\/div>/);
  assert.ok(html.includes('<p class="profile-roles">Спортивный деятель · Спортсмен · Тренер · Судья</p>'));
  assert.ok(html.includes('<span class="profile-label">Тренеры</span>'));
  assert.ok(html.includes('data-profile-icon="coach"'));
  assert.ok(!html.includes('<div class="profile-stats">'));
});

test('athlete profile shows the proposed icon set', () => {
  const html = personTabs(`<!doctype html><body>
    <div class="page-head">
      <h1>Иванов Иван Иванович</h1>
      <p class="meta-line">1989 г. р. · Москва · СШОР №3</p>
      <p class="source">Тренеры: Петров А.А.</p>
    </div>
    <section class="person-role"><h2>Спортсмен</h2>
      <section class="chart-block"></section>
      <section class="cat athlete-results">
        <table class="athlete-result-table" id="athlete-results-table"><tbody>
          <tr data-date="2025-01-01" data-comp="Чемпионат"><td class="c dim">85</td></tr>
        </tbody></table>
        <section class="discipline-group"><h4>Рывок <span class="dim">1</span></h4></section>
      </section>
    </section>
  </body>`);

  for (const icon of ['calendar', 'pin', 'scale', 'club', 'flag', 'bars', 'clock', 'discipline', 'coach']) {
    assert.ok(html.includes(`data-profile-icon="${icon}"`), `missing profile icon: ${icon}`);
  }
  assert.match(html, /data-profile-icon="scale"[^>]*>[\s\S]*?<svg viewBox="0 0 24 24"/);
  assert.ok(!html.includes('data-profile-icon="kettlebell"'));
});

test('athlete profile keeps the club field when club data is missing', () => {
  const html = personTabs(`<!doctype html><body>
    <div class="page-head">
      <h1>Марков Иван Эдуардович</h1>
      <p class="meta-line">1995 г. р. · г. Санкт-Петербург</p>
    </div>
    <section class="person-role"><h2>Спортсмен</h2></section>
  </body>`);

  assert.ok(html.includes('data-profile-icon="club"'));
  assert.ok(html.includes('<span class="profile-label">Клуб</span><span class="profile-value"></span>'));
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
  assert.ok(html.includes('aria-label="Карточка тренера"'));
});


test('coach profile card shows four metrics, regions and the period cell', () => {
  const html = personTabs(renderPerson({
    person: { display_name: 'Попова А.Е.' },
    activities: [],
    athleteData: null,
    coachedAthletes: [{ name: 'Спортсмен', slug: 'athlete', region: 'Москва' }],
    coachSummary: {
      athletes_count: 34,
      results_count: 286,
      competitions_count: 47,
      years_count: 12,
      first_year: '2008',
      last_year: '2026',
      regions: ['Москва', 'Московская область'],
    },
    judgeRoles: [],
    L: links.worker,
  }));

  assert.ok(html.includes('aria-label="Карточка тренера"'));
  assert.ok(html.includes('<p class="profile-roles">Тренер</p>'));
  assert.ok(!html.includes('profile-period'));
  assert.ok(!html.includes('Период работы'));
  assert.ok(html.includes('<strong>34</strong><span>спортсмена</span>'));
  assert.ok(html.includes('<strong>286</strong><span>результатов</span>'));
  assert.ok(html.includes('<strong>47</strong><span>соревнований</span>'));
  assert.ok(html.includes('<strong>12</strong><span>лет</span>'));
  assert.ok(html.includes('<strong>Регионы:</strong> Москва · Московская область'));
  assert.ok(html.includes('<strong>Период:</strong> 2008–2026'));
  assert.match(html, /<div class="coach-meta coach-meta-split">/);
  assert.match(html, /<div class="profile-stats profile-stats-4">/);
});

test('coach card omits metrics when the summary is missing', () => {
  const html = personTabs(renderPerson({
    person: { display_name: 'Попова А.Е.' },
    activities: [],
    athleteData: null,
    coachedAthletes: [
      { name: 'Первый', slug: 'a1', region: 'Москва', results_count: 41, competitions_count: 9 },
      { name: 'Второй', slug: 'a2', region: 'Москва', results_count: 7, competitions_count: 3 },
    ],
    judgeRoles: [],
    L: links.worker,
  }));

  assert.ok(html.includes('aria-label="Карточка тренера"'));
  // Спортсменов столько, сколько строк, — это не сумма чужих счётчиков.
  assert.ok(html.includes('<strong>2</strong><span>спортсмена</span>'));
  assert.match(html, /<div class="profile-stats profile-stats-1">/);
  assert.ok(!/<strong>\d+<\/strong><span>результат/.test(html));
  assert.ok(!/<strong>\d+<\/strong><span>соревновани/.test(html));
  assert.ok(!/<strong>\d+<\/strong><span>(год|года|лет)/.test(html));
  assert.ok(!html.includes('Период:'));
  assert.ok(!html.includes('<div class="coach-meta coach-meta-split">'));
});

test('coach card never adds a second h1 and hides on other tabs', () => {
  const html = personTabs(renderPerson({
    person: { display_name: 'Попова А.Е.' },
    activities: [],
    athleteData: null,
    coachedAthletes: [{ name: 'Спортсмен', slug: 'athlete', region: 'Москва' }],
    coachSummary: { athletes_count: 1, results_count: 2, competitions_count: 2,
      years_count: 2, first_year: '2024', last_year: '2026', regions: ['Москва'] },
    judgeRoles: [{ competition: 'Кубок России', role: 'Судья', date_start: '2026-02-01' }],
    L: links.worker,
  }));

  assert.equal(html.match(/<h1>/g).length, 1);
  assert.ok(html.includes('<p class="profile-name">Попова А.Е.</p>'));
  assert.match(html, /<div class="page-head" data-profile-role="default">/);
  assert.match(html, /<section class="profile-card coach-profile-card" data-profile-role="coach" hidden/);
});

test('coach-only person keeps the card as the page heading', () => {
  const html = personTabs(renderPerson({
    person: { display_name: 'Попова А.Е.' },
    activities: [],
    athleteData: null,
    coachedAthletes: [{ name: 'Спортсмен', slug: 'athlete', region: 'Москва' }],
    coachSummary: { athletes_count: 1, results_count: 2, competitions_count: 2,
      years_count: 2, first_year: '2024', last_year: '2026', regions: ['Москва'] },
    judgeRoles: [],
    L: links.worker,
  }));

  assert.equal(html.match(/<h1>/g).length, 1);
  assert.ok(!html.includes('class="profile-name"'));
  assert.ok(!html.includes('data-profile-role="coach" hidden'));
  assert.ok(!html.includes('<div class="page-head"'));
});

test('coach athlete table pairs coach-scoped counts with career totals', () => {
  const html = renderPerson({
    person: { display_name: 'Попова А.Е.' },
    activities: [],
    athleteData: null,
    coachedAthletes: [{
      name: 'Спортсмен', slug: 'athlete', region: 'Москва',
      competitions_count: 9, results_count: 41,
      coach_competitions_count: 4, coach_results_count: 29,
    }],
    judgeRoles: [],
    L: links.worker,
  });

  assert.ok(html.includes('>4<span class="dim"> / 9</span></span>'));
  assert.ok(html.includes('>29<span class="dim"> / 41</span></span>'));
  assert.ok(html.includes('С этим тренером: 4, всего: 9'));
  assert.ok(html.includes('data-sort-value="4"'));
  assert.ok(html.includes('data-sort-value="29"'));
});

test('coach athlete table keeps a single number when the counts agree', () => {
  const html = renderPerson({
    person: { display_name: 'Попова А.Е.' },
    activities: [],
    athleteData: null,
    coachedAthletes: [{
      name: 'Спортсмен', slug: 'athlete', region: 'Москва',
      competitions_count: 3, results_count: 6,
      coach_competitions_count: 3, coach_results_count: 6,
    }],
    judgeRoles: [],
    L: links.worker,
  });

  assert.ok(!html.includes('count-pair'));
  assert.ok(html.includes('<td class="c n" data-sort-value="3">3</td>'));
  assert.ok(html.includes('<td class="c n" data-sort-value="6">6</td>'));
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
