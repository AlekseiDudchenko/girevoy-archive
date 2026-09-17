import { page } from './render.js';

const e = (v) => String(v ?? '').replace(/[&<>"']/g, (c) =>
  ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c]));

export async function listAthletes(db) {
  return db.all(`
    WITH published_results AS (
      SELECT COALESCE(source.merged_into_id, source.id) AS canonical_id,
             r.id,
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

function sportRankLabel(rank) {
  const value = String(rank ?? '').trim();
  if (!value) return '—';

  const youth = value.match(/^(I{1,3})\s+юношеский(?:\s+спортивный)?\s+разряд$/i);
  if (youth) return `${youth[1].toUpperCase()} юн.`;

  const adult = value.match(/^(I{1,3})\s+(?:спортивный\s+)?разряд$/i);
  if (adult) return adult[1].toUpperCase();

  return value;
}

function weightClassLabel(athlete) {
  const raw = String(athlete.last_weight_class ?? '').trim();
  if (!raw) return '—';
  return /кг/i.test(raw) ? raw : `${raw} кг`;
}

function weightClassSortValue(athlete) {
  if (athlete.last_weight_class_kg == null) return '';
  return Number(athlete.last_weight_class_kg) + (Number(athlete.last_weight_class_is_open) ? 0.5 : 0);
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
<div class="scroll"><table id="athletes-table">
<thead><tr>
<th scope="col" class="sort" data-sort="0" role="button" tabindex="0">Имя</th>
<th scope="col" class="sort" data-sort="1" role="button" tabindex="0">Регион</th>
<th scope="col" class="c sort" data-sort="2" role="button" tabindex="0">Год рождения</th>
<th scope="col" class="c sort" data-sort="3" data-default="desc" role="button" tabindex="0">Разряд</th>
<th scope="col" class="c sort" data-sort="4" data-default="desc" role="button" tabindex="0">Последняя весовая</th>
<th scope="col" class="c sort" data-sort="5" data-default="desc" role="button" tabindex="0">Последний протокол</th>
<th scope="col" class="c sort" data-sort="6" data-default="desc" role="button" tabindex="0">Результатов</th>
</tr></thead>
<tbody>${athletes.map((athlete) => `<tr>
<td>${athlete.slug ? `<a href="${e(L.athlete(athlete.slug))}">${e(athlete.name)}</a>` : e(athlete.name)}</td>
<td>${e(athlete.region || '—')}</td>
<td class="c n" data-sort-value="${athlete.birth_year ?? ''}">${e(athlete.birth_year || '—')}</td>
<td class="c" data-sort-value="${athlete.sport_rank_sort ?? ''}">${e(sportRankLabel(athlete.sport_rank))}</td>
<td class="c n" data-sort-value="${weightClassSortValue(athlete)}">${e(weightClassLabel(athlete))}</td>
<td class="c n" data-sort-value="${athlete.last_year ?? ''}">${e(athlete.last_year || '—')}</td>
<td class="c n" data-sort-value="${athlete.results_count ?? ''}">${e(athlete.results_count)}</td>
</tr>`).join('')}</tbody></table></div>
<p id="athlete-empty" role="status" hidden>Ничего не найдено.</p>
<script>(function () {
  var input = document.getElementById('athlete-search');
  var table = document.getElementById('athletes-table');
  var tbody = table.tBodies[0];
  var rows = Array.prototype.slice.call(tbody.rows);
  var heads = Array.prototype.slice.call(table.querySelectorAll('th[data-sort]'));
  var current = -1, dir = 1;
  function normalize(text) { return text.toLocaleLowerCase('ru').replace(/ё/g, 'е').trim(); }
  function value(row, index) {
    var cell = row.cells[index];
    var sortValue = cell.dataset.sortValue;
    if (sortValue !== undefined) return sortValue === '' ? null : Number(sortValue);
    return normalize(cell.textContent);
  }
  function filter() {
    var terms = normalize(input.value).split(/\\s+/).filter(Boolean);
    var visible = 0;
    rows.forEach(function (row) {
      row.hidden = !terms.every(function (term) { return normalize(row.textContent).includes(term); });
      if (!row.hidden) visible++;
    });
    document.getElementById('athlete-empty').hidden = visible !== 0;
  }
  function sortBy(head) {
    var index = Number(head.dataset.sort);
    dir = current === index ? -dir : (head.dataset.default === 'desc' ? -1 : 1);
    current = index;
    rows.sort(function (a, b) {
      var x = value(a, index), y = value(b, index);
      if (x === y) return 0;
      if (x == null) return 1;
      if (y == null) return -1;
      return (typeof x === 'number' ? x - y : x.localeCompare(y, 'ru')) * dir;
    });
    rows.forEach(function (row) { tbody.appendChild(row); });
    heads.forEach(function (h) {
      if (h === head) h.setAttribute('aria-sort', dir > 0 ? 'ascending' : 'descending');
      else h.removeAttribute('aria-sort');
    });
  }
  input.addEventListener('input', filter);
  heads.forEach(function (head) {
    head.addEventListener('click', function () { sortBy(head); });
    head.addEventListener('keydown', function (ev) {
      if (ev.key === 'Enter' || ev.key === ' ') { ev.preventDefault(); sortBy(head); }
    });
  });
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
