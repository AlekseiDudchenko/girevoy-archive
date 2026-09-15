// Рендеринг публичных страниц. Чистые функции: один код для Worker и для снимка.
import { seriesLabel } from './queries.js';

export const links = {
  worker: {
    home: '/', results: '/results', css: '/style.css',
    comp: (s) => `/c/${s}`, athlete: (s) => `/a/${s}`,
  },
  static: {
    home: 'index.html', results: 'results.html', css: 'style.css',
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
    </nav>
  </div>
</header>
<main class="inner">
${body}
</main>
<footer class="site-foot"><div class="inner">
  Турниры со словом «Демо» в названии — демонстрационные, их спортсмены вымышленные.
</div></footer>
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
          <td class="c place"><span class="p p${r.place <= 3 ? r.place : 0}">${r.place}</span></td>
          <td><a href="${L.athlete(r.slug)}">${e(fio(r))}</a></td>
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

// ------------------------------------------------------------ спортсмен

export function renderAthlete({ athlete, results, L }) {
  const name = fio(athlete);
  const series = new Map();
  for (const r of results) {
    const key = seriesLabel(r);
    if (!series.has(key)) series.set(key, []);
    series.get(key).push(r);
  }
  const ordered = [...series.entries()].sort((a, b) => b[1].length - a[1].length);

  return page({
    title: `${name} — результаты`,
    description: `${name}, ${athlete.birth_year || ''} г. р. Все выступления и динамика результатов.`,
    L,
    body: `
<article>
  <div class="page-head">
    <p class="eyebrow">Спортсмен</p>
    <h1>${e(name)}</h1>
    <p class="meta-line">${[athlete.birth_year && `${athlete.birth_year} г. р.`, athlete.region,
      athlete.club, athlete.sport_rank].filter(Boolean).map(e).join(' · ')}</p>
    ${athlete.coach ? `<p class="source">Тренер: ${e(athlete.coach)}</p>` : ''}
  </div>

  <section class="chart-block">
    <h2>Динамика результатов</h2>
    <p class="note">Результаты с разным весом снаряда, числом рук или регламентом
    несравнимы между собой и показаны отдельными линиями.</p>
    ${chart(ordered)}
  </section>

  <section class="cat">
    <h2>Выступления</h2>
    <div class="scroll">
    <table>
      <thead><tr>
        <th>Дата</th><th>Соревнование</th><th>Дисциплина</th>
        <th class="c">Кат.</th><th class="c">Место</th>
        <th class="r">Подъёмы</th><th class="r">Результат</th>
      </tr></thead>
      <tbody>
      ${results.map((r) => `
        <tr>
          <td class="n dim">${r.event_date}</td>
          <td><a href="${L.comp(r.competition_slug)}">${e(r.competition)}</a></td>
          <td>${e(seriesLabel(r))}${r.division ? ` <span class="dim">· ${e(r.division)}</span>` : ''}</td>
          <td class="c dim">${e(r.weight_class_raw || '—')}</td>
          <td class="c place"><span class="p p${r.place <= 3 ? r.place : 0}">${r.place}</span></td>
          <td class="r n dim">${e(repsText(r.reps))}</td>
          <td class="r n strong">${num(r.result_value)}</td>
        </tr>`).join('')}
      </tbody>
    </table>
    </div>
  </section>
</article>`,
  });
}

// ---------------------------------------------------------------- график

const SERIES_COLORS = ['var(--s1)', 'var(--s2)', 'var(--s3)', 'var(--s4)'];

function chart(ordered) {
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
        data-tip="${e(label)} — ${num(r.result_value)}, ${dateRu(r.event_date)}, место ${r.place}"/>`).join('');
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

// ------------------------------------------------------ все результаты

export function renderResults({ rows, L }) {
  const opts = (vals) => [...new Set(vals)].sort().map((v) => `<option>${e(v)}</option>`).join('');
  return page({
    title: 'Все результаты',
    description: 'Таблица всех результатов с фильтрами по дисциплине, весу снаряда и регламенту.',
    L, active: 'results',
    body: `
<div class="page-head">
  <h1>Все результаты</h1>
  <p class="meta-line">${rows.length} строк. Сортировка по результату работает
  только внутри одной серии — иначе рядом окажутся несравнимые числа.</p>
</div>

<form class="filters" id="f">
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
    <th>Дата</th><th>Спортсмен</th><th>Дисциплина</th><th class="c">Кат.</th>
    <th>Соревнование</th><th class="c">Место</th>
    <th class="r" id="sortcol">Результат</th>
  </tr></thead>
  <tbody>
  ${rows.map((r) => `
    <tr data-discipline_name="${e(r.discipline_name)}" data-bell_kg="${r.bell_kg}"
        data-hands="${r.hands}" data-time_limit_min="${r.time_limit_min}"
        data-weight_class_raw="${e(r.weight_class_raw || '')}" data-value="${r.result_value}">
      <td class="n dim">${r.event_date}</td>
      <td><a href="${L.athlete(r.slug)}">${e(fio(r))}</a></td>
      <td>${e(r.discipline_name)} · ${r.bell_kg} кг${r.hands === 'one' ? ' · одной' : ''} · ${r.time_limit_min} мин</td>
      <td class="c dim">${e(r.weight_class_raw || '—')}</td>
      <td><a href="${L.comp(r.competition_slug)}">${e(r.competition)}</a></td>
      <td class="c place"><span class="p p${r.place <= 3 ? r.place : 0}">${r.place}</span></td>
      <td class="r n strong">${num(r.result_value)}</td>
    </tr>`).join('')}
  </tbody>
</table>
</div>

<script>
(function () {
  var form = document.getElementById('f'), tbody = document.querySelector('#t tbody');
  var note = document.getElementById('sortnote'), col = document.getElementById('sortcol');
  var keys = ['discipline_name', 'bell_kg', 'hands', 'time_limit_min', 'weight_class_raw'];
  function apply() {
    var f = {};
    keys.forEach(function (k) { f[k] = form.elements[k].value; });
    var shown = 0;
    Array.prototype.forEach.call(tbody.rows, function (tr) {
      var ok = keys.every(function (k) { return !f[k] || tr.dataset[k] === f[k]; });
      tr.hidden = !ok;
      if (ok) shown++;
    });
    var sortable = f.discipline_name && f.bell_kg && f.hands && f.time_limit_min;
    note.textContent = sortable
      ? 'Показано строк: ' + shown + '. Серия задана — сортировка по результату включена.'
      : 'Задайте дисциплину, вес снаряда, руки и регламент, чтобы включить сортировку по результату.';
    col.classList.toggle('sortable', !!sortable);
    if (sortable) {
      var rows = Array.prototype.filter.call(tbody.rows, function (r) { return !r.hidden; });
      rows.sort(function (a, b) { return b.dataset.value - a.dataset.value; });
      rows.forEach(function (r) { tbody.appendChild(r); });
    }
  }
  form.addEventListener('change', apply);
  document.getElementById('reset').addEventListener('click', function () { form.reset(); apply(); });
  apply();
})();
</script>`,
  });
}
