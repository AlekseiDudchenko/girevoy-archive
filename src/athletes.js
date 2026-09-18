import { athleteSummaryTable, page } from './render.js';

export async function listAthletes(db) {
  return db.all(`
    WITH published_results AS (
      SELECT COALESCE(source.merged_into_id, source.id) AS canonical_id,
             r.id,
             r.competition_id,
             COALESCE(r.event_date, c.date_start) AS result_date,
             cat.weight_class_raw,
             cat.weight_class_kg,
             cat.weight_class_is_open,
             achieved.name AS rank_name,
             achieved.sort_order AS rank_sort
      FROM results r
      JOIN athletes source ON source.id = r.athlete_id
      JOIN competitions c ON c.id = r.competition_id
      JOIN categories cat ON cat.id = r.category_id
      LEFT JOIN sport_ranks achieved ON achieved.id = r.rank_achieved_id
      WHERE c.is_published = 1
    )
    SELECT canonical.id,
           canonical.full_name AS name,
           canonical.birth_year,
           reg.name AS region,
           s.slug,
           COUNT(pr.id) AS results_count,
           COUNT(DISTINCT pr.competition_id) AS competitions_count,
           MIN(SUBSTR(pr.result_date, 1, 4)) AS first_year,
           MAX(SUBSTR(pr.result_date, 1, 4)) AS last_year,
           COALESCE((
             SELECT latest_rank.rank_name
             FROM published_results latest_rank
             WHERE latest_rank.canonical_id = canonical.id
               AND latest_rank.rank_name IS NOT NULL
             ORDER BY latest_rank.result_date DESC, latest_rank.id DESC
             LIMIT 1
           ), current_rank.name) AS sport_rank,
           COALESCE((
             SELECT latest_rank.rank_sort
             FROM published_results latest_rank
             WHERE latest_rank.canonical_id = canonical.id
               AND latest_rank.rank_name IS NOT NULL
             ORDER BY latest_rank.result_date DESC, latest_rank.id DESC
             LIMIT 1
           ), current_rank.sort_order) AS sport_rank_sort,
           (
             SELECT latest_weight.weight_class_raw
             FROM published_results latest_weight
             WHERE latest_weight.canonical_id = canonical.id
             ORDER BY latest_weight.result_date DESC, latest_weight.id DESC
             LIMIT 1
           ) AS last_weight_class,
           (
             SELECT latest_weight.weight_class_kg
             FROM published_results latest_weight
             WHERE latest_weight.canonical_id = canonical.id
             ORDER BY latest_weight.result_date DESC, latest_weight.id DESC
             LIMIT 1
           ) AS last_weight_class_kg,
           (
             SELECT latest_weight.weight_class_is_open
             FROM published_results latest_weight
             WHERE latest_weight.canonical_id = canonical.id
             ORDER BY latest_weight.result_date DESC, latest_weight.id DESC
             LIMIT 1
           ) AS last_weight_class_is_open,
           (
             SELECT SUBSTR(latest_weight.result_date, 1, 4)
             FROM published_results latest_weight
             WHERE latest_weight.canonical_id = canonical.id
             ORDER BY latest_weight.result_date DESC, latest_weight.id DESC
             LIMIT 1
           ) AS last_weight_year
    FROM athletes canonical
    JOIN published_results pr ON pr.canonical_id = canonical.id
    LEFT JOIN regions reg ON reg.id = canonical.region_id
    LEFT JOIN athlete_slugs s ON s.athlete_id = canonical.id AND s.is_current = 1
    LEFT JOIN sport_ranks current_rank ON current_rank.id = canonical.sport_rank_id
    WHERE canonical.merged_into_id IS NULL
    GROUP BY canonical.id, canonical.full_name, canonical.birth_year, reg.name, s.slug,
             current_rank.name, current_rank.sort_order
    ORDER BY canonical.full_name COLLATE NOCASE`);
}

export function renderAthletes({ athletes, L }) {
  return page({
    title: 'Спортсмены — Гиревой архив',
    description: 'Спортсмены из опубликованных протоколов соревнований по гиревому спорту.',
    L,
    body: `<h1>Спортсмены</h1>
<p class="lead">Спортсмены и история их выступлений в гиревом спорте. Найдите спортсмена, чтобы посмотреть его результаты, соревнования и динамику выступлений.</p>
${athletes.length ? `<label for="athlete-search">Поиск по имени, региону, разряду, весу или году</label>
<input id="athlete-search" type="search" placeholder="Имя, регион, разряд, весовая категория или год">
<p class="note" id="athlete-count" role="status">Показано строк: ${athletes.length}.</p>
${athleteSummaryTable({ athletes, L, id: 'athletes-table' })}
<p id="athlete-empty" role="status" hidden>Ничего не найдено.</p>
<script>(function () {
  var input = document.getElementById('athlete-search');
  var rows = Array.prototype.slice.call(document.querySelectorAll('#athletes-table tbody tr'));
  function normalize(text) { return text.toLocaleLowerCase('ru').replace(/ё/g, 'е').trim(); }
  function filter() {
    var terms = normalize(input.value).split(/\\s+/).filter(Boolean);
    var visible = 0;
    rows.forEach(function (row) {
      row.hidden = !terms.every(function (term) { return normalize(row.textContent).includes(term); });
      if (!row.hidden) visible++;
    });
    document.getElementById('athlete-count').textContent = 'Показано строк: ' + visible + '.';
    document.getElementById('athlete-empty').hidden = visible !== 0;
  }
  input.addEventListener('input', filter);
})();</script>` : '<p>В опубликованных данных пока нет спортсменов.</p>'}`,
  });
}

export function withAthletesNav(body, athletesHref, coachesHref, active = false) {
  const marker = `<a href="${coachesHref}"`;
  const markerIndex = body.indexOf(marker);
  if (markerIndex < 0) return body;

  const navStart = body.lastIndexOf('<nav', markerIndex);
  const navEnd = body.indexOf('</nav>', markerIndex);
  const nav = navStart >= 0 && navEnd > markerIndex ? body.slice(navStart, navEnd) : '';
  if (nav.includes(`href="${athletesHref}"`)) return body;

  return body.replace(marker,
    `<a href="${athletesHref}"${active ? ' class="on"' : ''}>Спортсмены</a>\n      ${marker}`);
}
