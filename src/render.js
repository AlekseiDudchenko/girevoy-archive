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
    <div><dt>Ждут сверки</dt><dd>${stats.pending}</dd></div>
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
    if (cat.hands === 'one') bits.push('одной рукой');
    bits.push(`${cat.bell_kg} кг`, `${cat.time_limit_min} мин`);
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
    ${live.map((c) => `<a class="chip" href="#cat-${c.id}">${e(catTitle(c))} · ${e(c.weight_class_raw || '')}</a>`).join('')}
  </nav>

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
    ${athlete?.coaches?.length ? `<p class="source">Тренер: ${athlete.coaches.map((coach) =>
      `<a href="${e(L.person(coach.slug))}">${e(coach.name)}</a>${coach.last_year ? ` (${e(coach.last_year)})` : ''}`).join(', ')}</p>` : ''}
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

  <section class="cat">
    <h3>Выступления</h3>
    <div class="scroll">
    <table>
      <thead><tr>
        <th>Дата</th><th>Соревнование</th><th>Дисциплина</th>
        <th class="c">Кат.</th><th class="c">Место</th>
        <th class="r">Подъёмы</th><th class="r">Результат</th><th class="c">Разряд</th>
      </tr></thead>
      <tbody>
      ${results.map((r) => `
        <tr>
          <td class="n dim">${r.event_date}</td>
          <td><a href="${L.comp(r.competition_slug)}">${e(r.competition)}</a></td>
          <td>${e(seriesLabel(r))}${r.division ? ` <span class="dim">· ${e(r.division)}</span>` : ''}</td>
          <td class="c dim">${e(r.weight_class_raw || '—')}</td>
          <td class="c place">${r.place == null ? '<span class="dim">—</span>' : `<span class="p p${r.place <= 3 ? r.place : 0}">${r.place}</span>`}</td>
          <td class="r n dim">${e(repsText(r.reps))}</td>
          <td class="r n strong">${num(r.result_value)}</td>
          <td class="c">${r.rank_achieved_code
            ? rankBadge(r.rank_achieved_code, r.rank_achieved) : '<span class="dim">—</span>'}</td>
        </tr>`).join('')}
      </tbody>
    </table>
    </div>
  </section>
  </section>` : ''}

  ${coachedAthletes.length ? `<section class="cat person-role">
    <h2>Тренер</h2>
    <p class="source">Год в скобках — последний опубликованный протокол, где зафиксирована эта связь.</p>
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
</article>`,
  });
}

// ---------------------------------------------------------------- график

const SERIES_COLORS = ['var(--s1)', 'var(--s2)', 'var(--s3)', 'var(--s4)'];

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
      <circle cx="${x(Date.parse(r.event_date)).toFixed(1)}" cy="${y(r.result_value).toFixed(1)}" r="4"
        fill="${color}" data-tip="${e(`${r.event_date} · ${r.result_value} · ${r.competition}`)}"/>`).join('');
    return line + dots;
  }).join('');

  const grid = ticks.map((v) => {
    const yy = y(v).toFixed(1);
    return `<line x1="${PL}" y1="${yy}" x2="${W - PR}" y2="${yy}" class="grid"/>
      <text x="${PL - 8}" y="${Number(yy) + 4}" text-anchor="end" class="axis">${num(v)}</text>`;
  }).join('');

  const yearLabels = years.map((year) => {
    const xx = x(Date.parse(`${year}-07-01`));
    if (xx < PL || xx > W - PR) return '';
    return `<text x="${xx.toFixed(1)}" y="${H - 12}" text-anchor="middle" class="axis">${year}</text>`;
  }).join('');

  const legend = ordered.slice(0, 4).map(([label], i) =>
    `<span><i style="background:${SERIES_COLORS[i]}"></i>${e(label)}</span>`).join('');

  return `<div class="chart-wrap">
<svg class="chart" viewBox="0 0 ${W} ${H}" role="img" aria-label="Динамика результатов">
  ${grid}${body}${yearLabels}
</svg>
<div class="legend">${legend}</div>
</div>`;
}

// -------------------------------------------------------- все результаты

export function renderResults({ rows, L }) {
  const series = (r) => seriesLabel(r);
  const weightClassKey = (v) => String(v ?? '').replace(/[^0-9+]/g, '');
  return page({
    title: 'Все результаты — Гиревой архив',
    description: 'Все опубликованные результаты соревнований по гиревому спорту.',
    L, active: 'results',
    body: `<h1>Все результаты</h1>
<div class="scroll"><table id="results-table"><thead><tr>
<th>Дата</th><th>Спортсмен</th><th>Дисциплина</th><th>Кат.</th><th>Соревнование</th><th>Место</th><th>Результат</th>
</tr></thead><tbody>${rows.map((r) => `<tr data-series="${e(series(r))}"
        data-wc="${weightClassKey(r.weight_class_raw)}" data-comp="${e(r.competition)}"
        data-place="${r.place ?? ''}">
      <td class="n dim">${r.event_date}</td>
      <td><a href="${L.person(r.slug)}">${e(fio(r))}</a></td>
      <td>${e(series(r))}</td>
      <td class="c dim">${e(r.weight_class_raw || '—')}</td>
      <td><a href="${L.comp(r.competition_slug)}">${e(r.competition)}</a></td>
      <td class="c">${r.place ?? '—'}</td>
      <td class="r strong">${num(r.result_value)}</td>
    </tr>`).join('')}</tbody></table></div>` });
}
