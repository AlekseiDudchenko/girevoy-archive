// Рендеринг публичных страниц. Чистые функции: один код для Worker и для снимка.
import { seriesLabel } from './queries.js';

export const links = {
  worker: {
    home: '/', results: '/results', coaches: '/coaches', css: '/style.css',
    person: (s) => `/p/${s}`,
    comp: (s) => `/c/${s}`, athlete: (s) => `/a/${s}`,
  },
  static: {
    home: 'index.html', results: 'results.html', coaches: 'coaches.html', css: 'style.css',
    person: (s) => `p-${s}.html`,
    comp: (s) => `c-${s}.html`, athlete: (s) => `a-${s}.html`,
  },
};

const e = (v) => String(v ?? '').replace(/[&<>"']/g, (c) =>
  ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c]));

const MONTHS = ['января', 'февраля', 'марта', 'апреля', 'мая', 'июня',
  'июля', 'августа', 'сентября', 'октября', 'ноября', 'декабря'];

export function dateRu(iso) {
  const [y, m, d] = iso.split('-').map(Number);
  return `${d} ${MONTHS[m - 1]} ${y}`;
}

const num = (v) => (v == null ? '—' : Number.isInteger(v) ? String(v) : v.toFixed(1));

const fio = (r) => `${r.last_name} ${r.first_name}${r.middle_name ? ' ' + r.middle_name : ''}`;

const repsText = (reps) => {
  if (!reps?.length) return '—';
  if (reps.length === 1 && reps[0].hand === 'both') return String(reps[0].reps);
  return reps.map((x) => {
    const h = x.hand === 'left' ? 'л' : x.hand === 'right' ? 'п' : '';
    return h ? `${h} ${x.reps}` : String(x.reps);
  }).join(' · ');
};

// Значок спортивного разряда. Код ЕВСК — из справочника sport_ranks.
const RANK_TIER = { zms: 'master', msmk: 'master', ms: 'master', kms: 'kms' };
const RANK_TITLE = {
  zms: 'Заслуженный мастер спорта',
  msmk: 'Мастер спорта международного класса',
  ms: 'Мастер спорта',
  kms: 'Кандидат в мастера спорта',
  i: 'Первый разряд', ii: 'Второй разряд', iii: 'Третий разряд',
};
// На значке разряды — римской цифрой: «III разряд» целиком в строку не влезает.
const RANK_LABEL = { i: 'I', ii: 'II', iii: 'III' };

function rankBadge(code, name) {
  if (!code) return '';
  const tier = RANK_TIER[code] || 'class';
  const label = RANK_LABEL[code] || name || code.toUpperCase();
  const title = RANK_TITLE[code] || name || '';
  return `<span class="rank rank-${tier}"${title ? ` title="${e(title)}"` : ''}>${e(label)}</span>`;
}

// ------------------------------------------------------------------ каркас

// bare: без <html>/<head>/<body> — для площадок, которые оборачивают страницу сами.
export function page({ title, description, body, L, active, bare = false }) {
  const head = `<title>${e(title)}</title>
<meta name="description" content="${e(description || '')}">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Bitter:wght@500;600&family=PT+Sans:wght@400;700&family=PT+Mono&display=swap">
<link rel="stylesheet" href="${L.css}">`;

  const doc = `<header class="site">
  <div class="inner">
    <a class="brand" href="${L.home}">Гиревой архив</a>
    <nav>
      <a href="${L.home}"${active === 'home' ? ' class="on"' : ''}>Соревнования</a>
      <a href="${L.results}"${active === 'results' ? ' class="on"' : ''}>Все результаты</a>
      <a href="${L.coaches}"${active === 'coaches' ? ' class="on"' : ''}>Тренеры</a>
    </nav>
  </div>
</header>
<main class="inner">
${body}
</main>
<div id="tip" class="tip" hidden></div>
<script>
(function () {
  var tip = document.getElementById('tip');
  document.addEventListener('mouseover', function (ev) {
    var p = ev.target.closest('[data-tip]');
    if (!p) return;
    tip.textContent = p.getAttribute('data-tip');
    tip.hidden = false;
    var r = p.getBoundingClientRect();
    tip.style.left = Math.min(window.innerWidth - tip.offsetWidth - 8, r.left + window.scrollX - 20) + 'px';
    tip.style.top = (r.top + window.scrollY - tip.offsetHeight - 10) + 'px';
  });
  document.addEventListener('mouseout', function (ev) {
    if (ev.target.closest('[data-tip]')) tip.hidden = true;
  });
})();
</script>`;

  if (bare) return head + '\n' + doc;
  return `<!doctype html>
<html lang="ru">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
${head}
</head>
<body>
${doc}
</body>
</html>`;
}

// ------------------------------------------------------------------ главная

export function renderIndex({ stats, competitions, L, bare }) {
  return page({
    bare,
    title: 'Гиревой архив',
    description: 'Архив протоколов соревнований по гиревому спорту: результаты, спортсмены, динамика.',
    L, active: 'home',
    body: `
<section class="hero">
  <h1>Протоколы соревнований<br>по гиревому спорту</h1>
  <p class="lead">Каждый турнир целиком: все категории, все участники, а не только призёры.
  Числа сверены с оригиналом протокола.</p>
  <dl class="tally">
    <div><dt>Турниров</dt><dd>${stats.competitions}</dd></div>
    <div><dt>Результатов</dt><dd>${stats.results}</dd></div>
    <div><dt>Спортсменов</dt><dd>${stats.athletes}</dd></div>
    <div><dt>Тренеров</dt><dd>${stats.coaches}</dd></div>
  </dl>
</section>

<h2 class="sec">Соревнования</h2>
<ul class="comp-list">
${competitions.map((c) => `
  <li>
    <a class="comp" href="${L.comp(c.slug)}">
      <span class="date">${dateRu(c.date_start)}</span>
      <span class="name">${e(c.name)}</span>
      <span class="meta">${e(c.city || '')}${c.country !== 'RU' ? ' · ' + e(c.country) : ''}${c.federation ? ' · ' + e(c.federation) : ''}</span>
      <span class="badge">${e(c.rank_name || '')}</span>
      <span class="counts">${c.categories} кат. · ${c.results} результатов</span>
    </a>
  </li>`).join('')}
</ul>`,
  });
}

export function renderCoaches({ coaches, L }) {
  return page({ title: 'Тренеры — Гиревой архив', L, active: 'coaches',
    description: 'Тренеры и связанные с ними спортсмены из опубликованных соревнований.',
    body: `<h1>Тренеры</h1>
<p class="lead">По данным спортсменов с результатами в опубликованных соревнованиях.</p>
<p class="source">Если указано несколько тренеров, спортсмен показан у каждого. Пробелы в инициалах нормализованы; разные написания ФИО не объединяются автоматически. Это не обязательно текущий тренер спортсмена.</p>
<p class="source">Регион указан по связанным спортсменам, а не как подтверждённое место работы тренера.</p>
${coaches.length ? `<label for="coach-search">Поиск по имени или региону</label>
<input id="coach-search" type="search" placeholder="Имя тренера или регион">
<div class="scroll"><table id="coaches-table">
<thead><tr><th scope="col">Имя</th><th scope="col">Регион</th></tr></thead>
<tbody>${coaches.map((coach) => `<tr>
<td><a href="${e(L.person(coach.slug))}">${e(coach.name)}</a></td>
<td>${e((coach.regions || []).join(', ') || '—')}</td></tr>`).join('')}</tbody></table></div>
<p id="coach-empty" role="status" hidden>Ничего не найдено.</p>
<script>(function () {
  var input = document.getElementById('coach-search');
  var rows = Array.from(document.querySelectorAll('#coaches-table tbody tr'));
  function normalize(text) { return text.toLocaleLowerCase('ru').replace(/ё/g, 'е').trim(); }
  input.addEventListener('input', function () {
    var terms = normalize(input.value).split(/\\s+/).filter(Boolean);
    var visible = 0;
    rows.forEach(function (row) {
      var text = normalize(row.textContent);
      row.hidden = !terms.every(function (term) { return text.includes(term); });
      if (!row.hidden) visible++;
    });
    document.getElementById('coach-empty').hidden = visible !== 0;
  });
})();</script>` : '<p>В опубликованных данных пока нет тренеров.</p>'}` });
}

// -------------------------------------------------------------- турнир

export function renderCompetition({ comp, categories, L }) {
  const live = categories.filter((c) => !c.is_deferred);
  const deferred = categories.filter((c) => c.is_deferred);

  const catTitle = (cat) => {
    const bits = [cat.discipline_name];
    if (cat.hands === 'one' && cat.discipline_code !== 'snatch') bits.push('одной рукой');
    bits.push(`${cat.bell_kg} кг`, `${cat.time_limit_min} мин`);
    return bits.join(' · ');
  };
  const chipHtml = (cat) => {
    const sex = cat.sex === 'f' ? 'ж' : 'м';
    const sexClass = cat.sex === 'f' ? 'chip-sex-f' : 'chip-sex-m';
    const discipline = cat.discipline_code === 'long_cycle' ? 'ДЦ'
      : cat.discipline_code === 'jerk' ? 'Т'
        : cat.discipline_code === 'snatch' ? 'Р' : cat.discipline_name;
    const weightClass = Number(cat.bell_kg) === 32 ? ' chip-weight-32'
      : Number(cat.bell_kg) === 24 ? ' chip-weight-24' : '';
    const weight = weightClass
      ? `<span class="chip-weight${weightClass}">${e(cat.bell_kg)} кг</span>`
      : `${e(cat.bell_kg)} кг`;
    const bits = [`${e(discipline)}(<span class="chip-sex ${sexClass}">${sex}</span>)`];
    if (cat.hands === 'one' && cat.discipline_code !== 'snatch') bits.push('одной рукой');
    bits.push(weight, `${e(cat.time_limit_min)} мин`);
    return bits.join(' · ');
  };
  const catSub = (cat) => [cat.sex === 'f' ? 'женщины' : 'мужчины', cat.age_group,
    cat.division, cat.weight_class_raw && `${cat.weight_class_raw} кг`]
    .filter(Boolean).join(' · ');

  return page({
    title: `${comp.name} — протокол`,
    description: `Полный протокол: ${comp.name}, ${dateRu(comp.date_start)}.`,
    L,
    body: `
<article>
  <div class="page-head">
    <p class="eyebrow">${e(comp.rank_name || 'Соревнование')}</p>
    <h1>${e(comp.name)}</h1>
    <p class="meta-line">${dateRu(comp.date_start)} · ${e(comp.city || '')}${comp.federation_name ? ' · ' + e(comp.federation_name) : ''}</p>
    ${comp.source_url ? `<p class="source"><a href="${e(comp.source_url)}">Исходный протокол (PDF)</a></p>` : ''}
  </div>

  <nav class="chips" aria-label="Категории">
    ${live.map((c) => `<a class="chip" href="#cat-${c.id}">${chipHtml(c)} · ${e(c.weight_class_raw || '')}</a>`).join('')}
  </nav>
  <style>
  .chip-sex { font-weight: 700; }
  .chip-sex-m { color: #3987e5; }
  .chip-sex-f { color: #d95bc8; }
  .chip-weight {
    display: inline-block; padding: 0 .28em; border-radius: 3px;
    color: #fff; font-weight: 700; line-height: 1.45;
  }
  .chip-weight-32 { background: #7f302d; }
  .chip-weight-24 { background: #17623b; }
  </style>

  ${live.map((cat) => `
  <section class="cat" id="cat-${cat.id}">
    <h2>${e(catTitle(cat))}</h2>
    <p class="cat-sub">${e(catSub(cat))}${cat.participants_declared ? ` · участников: ${cat.participants_declared}` : ''}</p>
    <div class="scroll">
    <table>
      <thead><tr>
        <th class="c">Место</th><th>Спортсмен</th><th class="c">Г. р.</th>
        <th>Регион, клуб</th><th class="r">Собств. вес</th>
        <th class="r">Подъёмы</th><th class="r">Результат</th>
      </tr></thead>
      <tbody>
      ${cat.rows.map((r) => `
        <tr>
          <td class="c place">${r.place == null ? '<span class="dim">—</span>' : `<span class="p p${r.place <= 3 ? r.place : 0}">${r.place}</span>`}</td>
          <td><a href="${L.person(r.slug)}">${e(fio(r))}</a></td>
          <td class="c n">${r.birth_year || '—'}</td>
          <td class="dim">${e([r.region, r.club].filter(Boolean).join(', '))}</td>
          <td class="r n">${r.body_weight_kg == null ? '—' : r.body_weight_kg.toFixed(1)}</td>
          <td class="r n dim">${e(repsText(r.reps))}</td>
          <td class="r n strong">${num(r.result_value)}</td>
        </tr>`).join('')}
      </tbody>
    </table>
    </div>
  </section>`).join('')}

  ${deferred.length ? `
  <section class="cat deferred">
    <h2>Не оцифровано</h2>
    <p>Эти разделы протокола есть в оригинале, но пока не внесены в базу.
    Числа будут добавлены позже — до тех пор смотрите PDF.</p>
    <ul>${deferred.map((c) => `<li>${e(c.weight_class_raw || c.discipline_name)} — будет добавлено позже</li>`).join('')}</ul>
  </section>` : ''}
</article>`,
  });
}

// -------------------------------------------------------------- персона

const SERIES_COLORS = ['var(--s1)', 'var(--s2)', 'var(--s3)', 'var(--s4)'];

export function renderPerson({ person, activities = [], judgeRoles = [], athleteData,
  coachedAthletes = [], L }) {
  const athlete = athleteData?.athlete;
  const results = athleteData?.results || [];
  const name = person.display_name;
  const series = new Map();
  for (const r of results) {
    const key = seriesLabel(r);
    if (!series.has(key)) series.set(key, []);
    series.get(key).push(r);
  }
  const ordered = [...series.entries()].sort((a, b) => b[1].length - a[1].length);
  const seriesColor = new Map(ordered.slice(0, SERIES_COLORS.length)
    .map(([label], i) => [label, SERIES_COLORS[i]]));
  const disciplines = new Map();
  for (const r of results) {
    const key = r.discipline_name || 'Без дисциплины';
    if (!disciplines.has(key)) disciplines.set(key, []);
    disciplines.get(key).push(r);
  }
  const grouped = [...disciplines.entries()].sort((a, b) => b[1].length - a[1].length);
  const colorFor = (r) => seriesColor.get(seriesLabel(r)) || 'var(--ink-3)';
  const resultRow = (r, showDiscipline) => `
        <tr data-date="${e(r.event_date || '')}" data-comp="${e(r.competition || '')}"
            data-series="${e(seriesLabel(r))}" data-wc="${weightClassKey(r.weight_class_raw)}"
            data-weight="${r.body_weight_kg ?? ''}" data-place="${r.place ?? ''}"
            data-reps="${e(repsText(r.reps))}" data-value="${r.result_value ?? ''}"
            data-rank="${e(r.rank_achieved || '')}">
          <td class="n dim">${e(r.event_date || '—')}</td>
          <td><a href="${L.comp(r.competition_slug)}">${e(r.competition)}</a></td>
          ${showDiscipline ? `<td><span class="discipline-badge" style="--series-color:${colorFor(r)}"><span class="discipline-dot"></span>${e(seriesLabel(r))}</span>${r.division ? ` <span class="dim">· ${e(r.division)}</span>` : ''}</td>` : ''}
          <td class="c dim">${e(r.weight_class_raw || '—')}</td>
          <td class="r n">${r.body_weight_kg == null ? '—' : Number(r.body_weight_kg).toFixed(1)}</td>
          <td class="c place">${r.place == null ? '<span class="dim">—</span>' : `<span class="p p${r.place <= 3 ? r.place : 0}">${r.place}</span>`}</td>
          <td class="r n dim">${e(repsText(r.reps))}</td>
          <td class="r n strong">${num(r.result_value)}</td>
          <td class="c">${r.rank_achieved_code
            ? rankBadge(r.rank_achieved_code, r.rank_achieved) : '<span class="dim">—</span>'}</td>
        </tr>`;
  const sortableHead = (key, label, cls = '') =>
    `<th class="${cls ? `${cls} ` : ''}sort" data-key="${key}" role="button" tabindex="0">${label}</th>`;
  const resultTable = (rows, id, showDiscipline) => `
    <div class="scroll">
    <table class="athlete-result-table" id="${id}">
      <thead><tr>
        ${sortableHead('date', 'Дата')}${sortableHead('comp', 'Соревнование')}
        ${showDiscipline ? sortableHead('series', 'Дисциплина') : ''}
        ${sortableHead('wc', 'Кат.', 'c')}${sortableHead('weight', 'Личный вес', 'r')}
        ${sortableHead('place', 'Место', 'c')}${sortableHead('reps', 'Подъёмы', 'r')}
        ${sortableHead('value', 'Результат', 'r')}${sortableHead('rank', 'Разряд', 'c')}
      </tr></thead>
      <tbody>${rows.map((r) => resultRow(r, showDiscipline)).join('')}</tbody>
    </table>
    </div>`;

  return page({
    title: `${name} — Гиревой архив`,
    description: `${name}: спортивная деятельность, выступления, тренерская и судейская работа.`,
    L,
    body: `
<article>
  <div class="page-head">
    <p class="eyebrow">Персона</p>
    <h1>${e(name)}${athlete?.sport_rank_code
      ? ` ${rankBadge(athlete.sport_rank_code, athlete.sport_rank)}` : ''}</h1>
    <p class="meta-line">${[(person.birth_year || athlete?.birth_year) && `${person.birth_year || athlete.birth_year} г. р.`,
      person.region || athlete?.region, athlete?.club].filter(Boolean).map(e).join(' · ')}</p>
    ${athlete?.coaches?.length ? `<p class="source">Тренеры: ${athlete.coaches.map((coach) =>
      `${coach.slug ? `<a href="${e(L.person(coach.slug))}">${e(coach.name)}</a>` : e(coach.name)}${coach.last_year ? ` (${e(coach.last_year)})` : ''}`).join(', ')}</p>`
      : athlete?.coach ? `<p class="source">Тренер: ${e(athlete.coach)}</p>` : ''}
    ${athlete?.other_spellings?.length
      ? `<p class="source">В протоколах также: ${athlete.other_spellings.map(e).join(', ')}</p>`
      : ''}
  </div>

  ${activities.length ? `<section class="cat person-role">
    <h2>Спортивный деятель</h2>
    <div class="scroll"><table><thead><tr><th>Организация</th><th>Должность</th><th>Регион</th><th>Период</th></tr></thead>
    <tbody>${activities.map((a) => `<tr><td>${a.source_url ? `<a href="${e(a.source_url)}">${e(a.organization)}</a>` : e(a.organization)}</td>
      <td>${e(a.position)}</td><td>${e(a.region || '—')}</td>
      <td class="n">${e([a.date_from, a.date_to].filter(Boolean).join(' — ') || '—')}</td></tr>`).join('')}</tbody></table></div>
  </section>` : ''}

  ${athlete ? `<section class="person-role">
  <h2>Спортсмен</h2>
  <section class="chart-block">
    <h3>Динамика результатов</h3>
    <p class="note">Результаты с разным весом снаряда, числом рук или регламентом
    несравнимы между собой и показаны отдельными линиями.</p>
    ${chart(ordered)}
  </section>

  <details class="chart-block athlete-weight-chart" open>
    <summary><span class="athlete-weight-title">Личный вес</span></summary>
    <p class="note">Только значения, прямо указанные в протоколах. Пропуски не рассчитываются и не интерполируются.</p>
    ${weightChart(results)}
  </details>

  <section class="cat athlete-results">
    <div class="athlete-results-head">
      <h3>Выступления</h3>
      <div class="view-toggle" role="group" aria-label="Вид результатов">
        <button type="button" class="on" data-results-view="all" aria-pressed="true">Все результаты</button>
        <button type="button" data-results-view="grouped" aria-pressed="false">По дисциплинам</button>
      </div>
    </div>
    <p class="note">Цвет серии совпадает с её линией на графике. Нажмите на заголовок столбца, чтобы изменить сортировку.</p>

    <div id="athlete-results-all">
      ${resultTable(results, 'athlete-results-table', true)}
    </div>
    <div id="athlete-results-grouped" hidden>
      ${grouped.map(([discipline, rows], index) => `<section class="discipline-group">
        <h4>${e(discipline)} <span class="dim">${rows.length}</span></h4>
        ${resultTable(rows, `athlete-results-discipline-${index}`, false)}
      </section>`).join('')}
    </div>
  </section>
  </section>` : ''}

  ${coachedAthletes.length ? `<section class="cat person-role">
    <h2>Тренер</h2>
    <p class="source">Связи взяты из опубликованных протоколов и не обязательно актуальны сегодня.</p>
    <div class="scroll"><table><thead><tr><th>Спортсмен</th><th>Регион</th></tr></thead>
    <tbody>${coachedAthletes.map((a) => `<tr><td>${a.slug ? `<a href="${e(L.person(a.slug))}">${e(a.name)}</a>` : e(a.name)}</td>
      <td>${e(a.regions.join(', ') || '—')}</td></tr>`).join('')}</tbody></table></div>
  </section>` : ''}

  ${judgeRoles.length ? `<section class="cat person-role">
    <h2>Судья</h2>
    <div class="scroll"><table><thead><tr><th>Дата</th><th>Соревнование</th><th>Роль</th></tr></thead>
    <tbody>${judgeRoles.map((j) => `<tr><td class="n">${e(j.date_start || '—')}</td>
      <td>${j.competition_slug ? `<a href="${e(L.comp(j.competition_slug))}">${e(j.competition)}</a>` : e(j.competition || '—')}</td>
      <td>${j.source_url ? `<a href="${e(j.source_url)}">${e(j.role)}</a>` : e(j.role)}</td></tr>`).join('')}</tbody></table></div>
  </section>` : ''}
</article>
<style>
.athlete-results-head { display:flex; flex-wrap:wrap; align-items:center; justify-content:space-between; gap:.7rem 1rem; margin-bottom:.55rem; }
.athlete-results-head h3 { margin:0; }
.view-toggle { display:inline-flex; border:1px solid var(--rule); background:var(--surface); padding:2px; }
.view-toggle button { border:0; background:transparent; color:var(--ink-2); font:inherit; font-size:.88rem; padding:.3rem .65rem; cursor:pointer; }
.view-toggle button.on { background:var(--accent); color:var(--surface); }
.athlete-weight-chart summary { cursor:pointer; }
.athlete-weight-chart[open] summary { margin-bottom:.5rem; }
.athlete-weight-title { font-family:"Bitter",Georgia,serif; font-size:1.17em; font-weight:500; }
.discipline-badge { display:inline-flex; align-items:center; gap:.38rem; white-space:nowrap; }
.discipline-dot { width:.58rem; height:.58rem; border-radius:50%; background:var(--series-color); flex:0 0 auto; }
.discipline-group { margin:1.4rem 0 2rem; }
.discipline-group h4 { margin:0 0 .55rem; font-family:"Bitter",Georgia,serif; font-size:1.03rem; font-weight:500; }
.discipline-group h4 .dim { font-family:"PT Mono",monospace; font-size:.72rem; font-weight:400; margin-left:.25rem; }
@media (max-width:640px) { .view-toggle { width:100%; } .view-toggle button { flex:1; } }
</style>
<script>
(function () {
  var root = document.querySelector('.athlete-results');
  if (!root) return;
  var all = document.getElementById('athlete-results-all');
  var grouped = document.getElementById('athlete-results-grouped');
  var toggles = Array.prototype.slice.call(root.querySelectorAll('[data-results-view]'));
  var numeric = { wc: 1, weight: 1, place: 1, value: 1 };

  function setView(view) {
    var groupedOn = view === 'grouped';
    all.hidden = groupedOn;
    grouped.hidden = !groupedOn;
    toggles.forEach(function (button) {
      var on = button.dataset.resultsView === view;
      button.classList.toggle('on', on);
      button.setAttribute('aria-pressed', on ? 'true' : 'false');
    });
  }

  function initSort(table) {
    var body = table.tBodies[0];
    var heads = Array.prototype.slice.call(table.querySelectorAll('th.sort'));
    var sort = { key: 'date', dir: -1 };

    function render() {
      heads.forEach(function (head) {
        if (head.dataset.key === sort.key) head.setAttribute('aria-sort', sort.dir > 0 ? 'ascending' : 'descending');
        else head.removeAttribute('aria-sort');
      });
      var rows = Array.prototype.slice.call(body.rows);
      rows.sort(function (a, b) {
        var x = a.dataset[sort.key] || '', y = b.dataset[sort.key] || '';
        if (x === y) return 0;
        if (x === '') return 1;
        if (y === '') return -1;
        var d = numeric[sort.key] ? Number(x) - Number(y) : x.localeCompare(y, 'ru');
        return d * sort.dir;
      });
      rows.forEach(function (row) { body.appendChild(row); });
    }

    function pick(head) {
      var key = head.dataset.key;
      if (sort.key === key) sort.dir = -sort.dir;
      else sort = { key: key, dir: (key === 'date' || key === 'value') ? -1 : 1 };
      render();
    }

    heads.forEach(function (head) {
      head.addEventListener('click', function () { pick(head); });
      head.addEventListener('keydown', function (ev) {
        if (ev.key === 'Enter' || ev.key === ' ') { ev.preventDefault(); pick(head); }
      });
    });
    render();
  }

  toggles.forEach(function (button) {
    button.addEventListener('click', function () { setView(button.dataset.resultsView); });
  });
  Array.prototype.forEach.call(root.querySelectorAll('.athlete-result-table'), initSort);
  setView('all');
})();
</script>`,
  });
}

// ---------------------------------------------------------------- график

function chart(ordered) {
  // снятые по правилам идут без результата — на графике их нет
  ordered = ordered.map(([label, rows]) => [label, rows.filter((r) => r.result_value != null)])
    .filter(([, rows]) => rows.length);
  const pts = ordered.flatMap(([, rows]) => rows);
  if (!pts.length) return '<p class="note">Нет данных.</p>';

  const W = 720, H = 300, PL = 54, PR = 16, PT = 18, PB = 42;
  const times = pts.map((r) => Date.parse(r.event_date));
  const vals = pts.map((r) => r.result_value);
  let t0 = Math.min(...times), t1 = Math.max(...times);
  if (t0 === t1) { t0 -= 86400000 * 30; t1 += 86400000 * 30; }
  const vmax = Math.max(...vals), vmin = Math.min(...vals);
  const pad = (vmax - vmin) * 0.15 || Math.max(vmax * 0.1, 1);
  const y0 = Math.max(0, Math.floor((vmin - pad) / 10) * 10);
  const y1 = Math.ceil((vmax + pad) / 10) * 10;

  const x = (t) => PL + ((t - t0) / (t1 - t0)) * (W - PL - PR);
  const y = (v) => PT + (1 - (v - y0) / (y1 - y0)) * (H - PT - PB);

  const ticks = [];
  for (let i = 0; i <= 4; i++) ticks.push(y0 + ((y1 - y0) * i) / 4);

  const years = [...new Set(pts.map((r) => r.event_date.slice(0, 4)))].sort();

  const body = ordered.slice(0, 4).map(([label, rows], i) => {
    const color = SERIES_COLORS[i];
    const sorted = [...rows].sort((a, b) => a.event_date.localeCompare(b.event_date));
    const d = sorted.map((r, j) => `${j ? 'L' : 'M'}${x(Date.parse(r.event_date)).toFixed(1)} ${y(r.result_value).toFixed(1)}`).join(' ');
    const line = sorted.length > 1
      ? `<path d="${d}" fill="none" stroke="${color}" stroke-width="2" stroke-linejoin="round" stroke-linecap="round"/>` : '';
    const dots = sorted.map((r) => `
      <circle cx="${x(Date.parse(r.event_date)).toFixed(1)}" cy="${y(r.result_value).toFixed(1)}" r="5"
        fill="${color}" stroke="var(--surface)" stroke-width="2"
        data-tip="${e(label)} — ${num(r.result_value)}, ${dateRu(r.event_date)}, место ${r.place ?? '—'}"/>`).join('');
    return line + dots;
  }).join('');

  const legend = ordered.length > 1 ? `
    <ul class="legend">
      ${ordered.slice(0, 4).map(([label], i) =>
        `<li><span class="dot" style="background:${SERIES_COLORS[i]}"></span>${e(label)}</li>`).join('')}
      ${ordered.length > 4 ? `<li class="dim">и ещё ${ordered.length - 4}</li>` : ''}
    </ul>` : `<p class="single-series">${e(ordered[0][0])}</p>`;

  return `
<figure class="chart">
  <svg viewBox="0 0 ${W} ${H}" role="img" preserveAspectRatio="xMidYMid meet"
       aria-label="Динамика результатов по сериям">
    ${ticks.map((v) => `
      <line x1="${PL}" x2="${W - PR}" y1="${y(v).toFixed(1)}" y2="${y(v).toFixed(1)}"
            stroke="var(--grid)" stroke-width="1"/>
      <text x="${PL - 10}" y="${(y(v) + 4).toFixed(1)}" text-anchor="end"
            class="ax">${Math.round(v)}</text>`).join('')}
    ${years.map((yr) => {
      const t = Date.parse(`${yr}-07-01`);
      const cx = Math.min(W - PR, Math.max(PL, x(t)));
      return `<text x="${cx.toFixed(1)}" y="${H - 14}" text-anchor="middle" class="ax">${yr}</text>`;
    }).join('')}
    ${body}
  </svg>
  <figcaption>${legend}</figcaption>
</figure>`;
}

function weightChart(results) {
  const seen = new Set();
  const pts = results.filter((r) => r.body_weight_kg != null && r.event_date).filter((r) => {
    const key = `${r.event_date}\u0000${r.competition_slug || r.competition || ''}\u0000${r.body_weight_kg}`;
    if (seen.has(key)) return false;
    seen.add(key);
    return true;
  }).sort((a, b) => a.event_date.localeCompare(b.event_date));
  if (!pts.length) return '<p class="note">Нет данных о личном весе.</p>';

  const W = 720, H = 260, PL = 54, PR = 16, PT = 18, PB = 42;
  const times = pts.map((r) => Date.parse(r.event_date));
  const vals = pts.map((r) => Number(r.body_weight_kg));
  let t0 = Math.min(...times), t1 = Math.max(...times);
  if (t0 === t1) { t0 -= 86400000 * 30; t1 += 86400000 * 30; }
  const vmax = Math.max(...vals), vmin = Math.min(...vals);
  const pad = (vmax - vmin) * 0.2 || Math.max(vmax * 0.02, 1);
  const y0 = Math.max(0, Math.floor((vmin - pad) * 2) / 2);
  let y1 = Math.ceil((vmax + pad) * 2) / 2;
  if (y1 <= y0) y1 = y0 + 1;

  const x = (t) => PL + ((t - t0) / (t1 - t0)) * (W - PL - PR);
  const y = (v) => PT + (1 - (v - y0) / (y1 - y0)) * (H - PT - PB);
  const ticks = [];
  for (let i = 0; i <= 4; i++) ticks.push(y0 + ((y1 - y0) * i) / 4);
  const years = [...new Set(pts.map((r) => r.event_date.slice(0, 4)))].sort();
  const d = pts.map((r, i) => `${i ? 'L' : 'M'}${x(Date.parse(r.event_date)).toFixed(1)} ${y(Number(r.body_weight_kg)).toFixed(1)}`).join(' ');
  const line = pts.length > 1
    ? `<path d="${d}" fill="none" stroke="var(--s1)" stroke-width="2" stroke-linejoin="round" stroke-linecap="round"/>` : '';
  const dots = pts.map((r) => `
    <circle cx="${x(Date.parse(r.event_date)).toFixed(1)}" cy="${y(Number(r.body_weight_kg)).toFixed(1)}" r="5"
      fill="var(--s1)" stroke="var(--surface)" stroke-width="2"
      data-tip="${Number(r.body_weight_kg).toFixed(1)} кг — ${dateRu(r.event_date)}${r.competition ? `, ${e(r.competition)}` : ''}"/>`).join('');

  return `
<figure class="chart">
  <svg viewBox="0 0 ${W} ${H}" role="img" preserveAspectRatio="xMidYMid meet"
       aria-label="Динамика личного веса">
    ${ticks.map((v) => `
      <line x1="${PL}" x2="${W - PR}" y1="${y(v).toFixed(1)}" y2="${y(v).toFixed(1)}"
            stroke="var(--grid)" stroke-width="1"/>
      <text x="${PL - 10}" y="${(y(v) + 4).toFixed(1)}" text-anchor="end"
            class="ax">${v.toFixed(1)}</text>`).join('')}
    ${years.map((yr) => {
      const t = Date.parse(`${yr}-07-01`);
      const cx = Math.min(W - PR, Math.max(PL, x(t)));
      return `<text x="${cx.toFixed(1)}" y="${H - 14}" text-anchor="middle" class="ax">${yr}</text>`;
    }).join('')}
    ${line}${dots}
  </svg>
</figure>`;
}

// ------------------------------------------------------ все результаты

export function renderResults({ rows, L }) {
  const opts = (vals) => [...new Set(vals)].sort().map((v) => `<option>${e(v)}</option>`).join('');
  // подпись серии в ячейке и она же ключ сортировки столбца «Дисциплина»
  const series = (r) => `${r.discipline_name} · ${r.bell_kg} кг${r.hands === 'one' ? ' · одной' : ''} · ${r.time_limit_min} мин`;
  const th = (key, label, cls) =>
    `<th${cls ? ` class="${cls} sort"` : ' class="sort"'} data-key="${key}" role="button" tabindex="0">${label}</th>`;
  return page({
    title: 'Все результаты',
    description: 'Таблица всех результатов с фильтрами по полу, дисциплине, весу снаряда и регламенту.',
    L, active: 'results',
    body: `
<div class="page-head">
  <h1>Все результаты</h1>
  <p class="meta-line">${rows.length} строк. Столбцы сортируются по клику. Сортировка по результату
  работает только внутри одной серии — иначе рядом окажутся несравнимые числа.</p>
</div>

<form class="filters" id="f">
  <label>Пол <select name="sex"><option value="">любой</option><option value="m">мужчины</option><option value="f">женщины</option></select></label>
  <label>Дисциплина <select name="discipline_name"><option value="">любая</option>${opts(rows.map((r) => r.discipline_name))}</select></label>
  <label>Вес снаряда <select name="bell_kg"><option value="">любой</option>${opts(rows.map((r) => String(r.bell_kg)))}</select></label>
  <label>Руки <select name="hands"><option value="">любые</option><option value="two">двумя</option><option value="one">одной</option></select></label>
  <label>Регламент <select name="time_limit_min"><option value="">любой</option>${opts(rows.map((r) => String(r.time_limit_min)))}</select></label>
  <label>Категория <select name="weight_class_raw"><option value="">любая</option>${opts(rows.map((r) => r.weight_class_raw || ''))}</select></label>
  <button type="button" id="reset">Сбросить</button>
</form>
<p class="note" id="sortnote">Задайте дисциплину, вес снаряда, руки и регламент, чтобы включить сортировку по результату.</p>

<div class="scroll">
<table id="t">
  <thead><tr>
    ${th('date', 'Дата')}${th('name', 'Спортсмен')}${th('series', 'Дисциплина')}${th('wc', 'Кат.', 'c')}
    ${th('comp', 'Соревнование')}${th('place', 'Место', 'c')}
    <th class="r sort" data-key="value" role="button" tabindex="0" aria-disabled="true" id="sortcol">Результат</th>
  </tr></thead>
  <tbody>
  ${rows.map((r) => `
    <tr data-discipline_name="${e(r.discipline_name)}" data-bell_kg="${r.bell_kg}"
        data-hands="${r.hands}" data-time_limit_min="${r.time_limit_min}" data-sex="${e(r.sex)}"
        data-weight_class_raw="${e(r.weight_class_raw || '')}" data-value="${r.result_value ?? ''}"
        data-date="${r.event_date ?? ''}" data-name="${e(fio(r))}" data-series="${e(series(r))}"
        data-wc="${weightClassKey(r.weight_class_raw)}" data-comp="${e(r.competition)}"
        data-place="${r.place ?? ''}">
      <td class="n dim">${r.event_date}</td>
      <td><a href="${L.person(r.slug)}">${e(fio(r))}</a></td>
      <td>${e(series(r))}</td>
      <td class="c dim">${e(r.weight_class_raw || '—')}</td>
      <td><a href="${L.comp(r.competition_slug)}">${e(r.competition)}</a></td>
      <td class="c place">${r.place == null ? '<span class="dim">—</span>' : `<span class="p p${r.place <= 3 ? r.place : 0}">${r.place}</span>`}</td>
      <td class="r n strong">${num(r.result_value)}</td>
    </tr>`).join('')}
  </tbody>
</table>
</div>

<script>
(function () {
  var form = document.getElementById('f'), tbody = document.querySelector('#t tbody');
  var note = document.getElementById('sortnote'), col = document.getElementById('sortcol');
  var heads = Array.prototype.slice.call(document.querySelectorAll('#t th.sort'));
  var keys = ['sex', 'discipline_name', 'bell_kg', 'hands', 'time_limit_min', 'weight_class_raw'];
  var NUM = { wc: 1, place: 1, value: 1 };
  // столбец и направление, выбранные кликом; пока не кликали — дата по убыванию,
  // а заданная серия сама включает сортировку по результату
  var sort = { key: 'date', dir: -1 }, picked = false, sortable = false;

  function cmp(key, dir) {
    return function (a, b) {
      var x = a.dataset[key], y = b.dataset[key];
      if (x === y) return 0;
      if (x === '') return 1;          // пустые всегда внизу, в обе стороны
      if (y === '') return -1;
      var d = NUM[key] ? Number(x) - Number(y) : x.localeCompare(y, 'ru');
      return d * dir;
    };
  }

  function apply() {
    var f = {};
    keys.forEach(function (k) { f[k] = form.elements[k].value; });
    var shown = 0;
    Array.prototype.forEach.call(tbody.rows, function (tr) {
      var ok = keys.every(function (k) { return !f[k] || tr.dataset[k] === f[k]; });
      tr.hidden = !ok;
      if (ok) shown++;
    });
    sortable = !!(f.discipline_name && f.bell_kg && f.hands && f.time_limit_min);
    note.textContent = sortable
      ? 'Показано строк: ' + shown + '. Серия задана — сортировка по результату включена.'
      : 'Задайте дисциплину, вес снаряда, руки и регламент, чтобы включить сортировку по результату.';
    col.setAttribute('aria-disabled', sortable ? 'false' : 'true');
    if (sortable && !picked) sort = { key: 'value', dir: -1 };
    if (!sortable && sort.key === 'value') { sort = { key: 'date', dir: -1 }; picked = false; }
    render();
  }

  function render() {
    heads.forEach(function (h) {
      if (h.dataset.key === sort.key) h.setAttribute('aria-sort', sort.dir > 0 ? 'ascending' : 'descending');
      else h.removeAttribute('aria-sort');
    });
    var rows = Array.prototype.filter.call(tbody.rows, function (r) { return !r.hidden; });
    rows.sort(cmp(sort.key, sort.dir));
    rows.forEach(function (r) { tbody.appendChild(r); });
  }

  function click(h) {
    var key = h.dataset.key;
    if (key === 'value' && !sortable) return;
    // первый клик: даты и результаты полезнее сразу по убыванию, остальное — по возрастанию
    if (sort.key === key) sort.dir = -sort.dir;
    else sort = { key: key, dir: (key === 'date' || key === 'value') ? -1 : 1 };
    picked = true;
    render();
  }

  heads.forEach(function (h) {
    h.addEventListener('click', function () { click(h); });
    h.addEventListener('keydown', function (ev) {
      if (ev.key === 'Enter' || ev.key === ' ') { ev.preventDefault(); click(h); }
    });
  });
  form.addEventListener('change', apply);
  document.getElementById('reset').addEventListener('click', function () {
    keys.forEach(function (k) { form.elements[k].value = ''; });
    sort = { key: 'date', dir: -1 };
    picked = false;
    apply();
  });
  apply();
})();
</script>`,
  });
}

// «+95» весит больше 95, но меньше следующей категории — этого хватает для сортировки
function weightClassKey(raw) {
  if (!raw) return '';
  const m = String(raw).replace(',', '.').match(/(\d+(?:\.\d+)?)/);
  if (!m) return '';
  return Number(m[1]) + (String(raw).includes('+') ? 0.5 : 0);
}
