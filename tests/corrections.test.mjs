import { test } from 'node:test';
import assert from 'node:assert/strict';
import { execFileSync } from 'node:child_process';
import { listAllResults } from '../src/queries.js';
import { renderCompetition, renderPerson, renderResults, links } from '../src/render.js';

const correction = {
  scope: 'category', field: 'bell_kg', source_value: '32', corrected_value: '24', correction_id: 'test-bell',
};

const row = (overrides = {}) => ({
  id: 1, category_id: 2, athlete_id: 3, competition_id: 4,
  place: 1, last_name: 'Тестова', first_name: 'Анна', middle_name: '', slug: 'testova-anna-2000',
  birth_year: 2000, region: 'Регион', club: 'Клуб', body_weight_kg: 57.1,
  reps: [{ hand: 'both', reps: 50 }], result_value: 50,
  event_date: '2025-05-10', competition: 'Чемпионат', competition_slug: 'championship',
  discipline_name: 'Толчок', discipline_code: 'jerk', bell_kg: 24, hands: 'two', time_limit_min: 10,
  weight_class_raw: '58', sex: 'f', division: null, rank_achieved: null, rank_achieved_code: null,
  corrections: [correction], ...overrides,
});

test('correction generator materializes public source correction warnings', () => {
  const sql = execFileSync('python3', ['scripts/gen_corrections.py', 'data/chempionat-pfo-2023.json'], { encoding: 'utf8' });
  assert.match(sql, /source_correction:pfo-2023-womens-snatch-bell-weight/);
  assert.match(sql, /'bell_kg', '32', '24'/);
  assert.match(sql, /cat\.weight_class_raw IN \('63', '68', '68\+'\)/);
});

test('category correction is inherited by rows returned from all results', async () => {
  const db = {
    async all(sql) {
      if (sql.includes('FROM results r')) return [row({ corrections: undefined })];
      if (sql.includes('FROM edits')) return [{
        entity: 'categories', entity_id: 2, field: 'bell_kg', old_value: '32', new_value: '24',
        changed_by: 'source_correction:test-bell',
      }];
      throw new Error(`Unexpected query: ${sql}`);
    },
  };
  const rows = await listAllResults(db);
  assert.equal(rows[0].corrections.length, 1);
  assert.equal(rows[0].corrections[0].scope, 'category');
  assert.equal(rows[0].corrections[0].source_value, '32');
});

test('competition page marks category heading and every affected result row', () => {
  const r = row();
  const html = renderCompetition({
    comp: { name: 'Чемпионат', date_start: '2025-05-10', city: 'Город' },
    categories: [{
      id: 2, competition_id: 4, is_deferred: 0, discipline_name: 'Толчок', discipline_code: 'jerk',
      sex: 'f', age_group: 'Взрослые', division: null, bell_kg: 24, hands: 'two', time_limit_min: 10,
      weight_class_raw: '58', participants_declared: 1, corrections: [correction], rows: [r],
    }], L: links.worker,
  });
  assert.ok(html.includes('24 кг<button type="button" class="correction-mark correction-inline"'));
  assert.ok((html.match(/class="correction-mark/g) || []).length >= 2);
  assert.ok(html.includes('Вес гири: 32 кг → 24 кг'));
});

test('all results and athlete result tables keep the correction marker', () => {
  const r = row();
  const all = renderResults({ rows: [r], L: links.worker });
  assert.ok(all.includes('class="c correction-col"><button type="button" class="correction-mark"'));
  assert.ok(all.includes('Вес гири: 32 кг → 24 кг'));

  const person = renderPerson({
    person: { display_name: 'Тестова Анна', birth_year: 2000 }, activities: [], judgeRoles: [], coachedAthletes: [],
    athleteData: { athlete: {}, results: [r] }, L: links.worker,
  });
  assert.ok(person.includes('class="c correction-col"><button type="button" class="correction-mark"'));
  assert.ok(person.includes('Вес гири: 32 кг → 24 кг'));
});
