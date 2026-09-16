import { page, dateRu } from './render.js';

const e = (v) => String(v ?? '').replace(/[&<>"']/g, (c) =>
  ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c]));

const yearOf = (iso) => String(iso || '').slice(0, 4) || '—';
const uniq = (values) => [...new Set(values.filter(Boolean))].sort((a, b) =>
  String(a).localeCompare(String(b), 'ru', { numeric: true }));
const options = (values, emptyLabel) => `<option value="">${emptyLabel}</option>` +
  uniq(values).map((v) => `<option value="${e(v)}">${e(v)}</option>`).join('');

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

<div class="home-list-head">
  <h2 class="sec">Соревнования</h2>
  <div class="view-toggle home-view-toggle" role="group" aria-label="Вид списка соревнований">
    <button type="button" class="on" data-home-view="compact" aria-pressed="true">Компактный</button>
    <button type="button" data-home-view="expanded" aria-pressed="false">Расширенный</button>
  </div>
</div>

<div id="home-compact">
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
  </ul>
</div>

<div id="home-expanded" hidden>
  <form class="home-filters" id="home-filters">
    <label>Год
      <select name="year">${options(competitions.map((c) => yearOf(c.date_start)), 'Все годы')}</select>
    </label>
    <label>Турнир
      <select name="name">${options(competitions.map((c) => c.name), 'Все турниры')}</select>
    </label>
    <label>Место
      <select name="city">${options(competitions.map((c) => c.city), 'Все места')}</select>
    </label>
    <label>Уровень
      <select name="rank">${options(competitions.map((c) => c.rank_name), 'Все уровни')}</select>
    </label>
    <button type="button" class="home-filter-reset" id="home-filter-reset">Сбросить</button>
  </form>

  <div class="home-active-filters" id="home-active-filters" aria-live="polite"></div>
  <p class="note home-filter-count" id="home-filter-count"></p>

  <div class="scroll">
    <table class="home-competitions-table" id="home-competitions-table">
      <thead><tr>
        <th>Год</th><th>Соревнование</th><th>Место</th><th>Дата</th>
        <th>Уровень</th><th class="r">Категорий</th><th class="r">Результатов</th><th aria-label="Открыть"></th>
      </tr></thead>
      <tbody>
      ${competitions.map((c) => `<tr
        data-year="${e(yearOf(c.date_start))}"
        data-name="${e(c.name)}"
        data-city="${e(c.city || '')}"
        data-rank="${e(c.rank_name || '')}">
        <td class="n"><button type="button" class="home-quick-filter" data-filter="year" data-value="${e(yearOf(c.date_start))}">${e(yearOf(c.date_start))}</button></td>
        <td><button type="button" class="home-quick-filter home-quick-name" data-filter="name" data-value="${e(c.name)}">${e(c.name)}</button></td>
        <td>${c.city ? `<button type="button" class="home-quick-filter" data-filter="city" data-value="${e(c.city)}">${e(c.city)}</button>` : '—'}</td>
        <td class="n">${e(c.date_start || '—')}</td>
        <td>${c.rank_name ? `<button type="button" class="home-quick-filter" data-filter="rank" data-value="${e(c.rank_name)}">${e(c.rank_name)}</button>` : '—'}</td>
        <td class="r n">${c.categories ?? '—'}</td>
        <td class="r n">${c.results ?? '—'}</td>
        <td class="home-open"><a href="${L.comp(c.slug)}" aria-label="Открыть ${e(c.name)}">→</a></td>
      </tr>`).join('')}
      </tbody>
    </table>
  </div>
  <p id="home-filter-empty" class="note" hidden>Соревнований с такими фильтрами нет.</p>
</div>

<style>
.home-list-head { display:flex; flex-wrap:wrap; align-items:end; justify-content:space-between; gap:.7rem 1rem; margin-top:2.4rem; }
.home-list-head h2.sec { flex:1 1 auto; margin:0; }
.view-toggle { display:inline-flex; border:1px solid var(--rule); background:var(--surface); padding:2px; }
.view-toggle button { border:0; background:transparent; color:var(--ink-2); font:inherit; font-size:.88rem; padding:.3rem .65rem; cursor:pointer; }
.view-toggle button.on { background:var(--accent); color:var(--surface); }
.home-filters { display:flex; flex-wrap:wrap; gap:.55rem .75rem; align-items:end; margin:1rem 0 .55rem; }
.home-filters label { display:flex; flex-direction:column; gap:.2rem; color:var(--ink-3); font-family:"PT Mono",monospace; font-size:.68rem; letter-spacing:.06em; text-transform:uppercase; }
.home-filters select, .home-filter-reset { min-height:2.1rem; border:1px solid var(--rule); background:var(--surface); color:var(--ink); font:inherit; font-size:.9rem; padding:.28rem .48rem; }
.home-filter-reset { color:var(--accent); cursor:pointer; }
.home-filter-reset:hover { border-color:var(--accent); }
.home-active-filters { display:flex; flex-wrap:wrap; gap:.35rem; min-height:0; margin:.35rem 0; }
.home-filter-chip { border:1px solid var(--accent); background:var(--accent-soft); color:var(--accent); font:inherit; font-size:.82rem; padding:.18rem .45rem; cursor:pointer; }
.home-filter-count { margin:.3rem 0 .7rem; }
.home-competitions-table td:first-child { color:var(--ink-3); }
.home-quick-filter { border:0; padding:0; background:none; color:var(--accent); font:inherit; text-align:left; text-decoration:underline; text-decoration-thickness:1px; text-underline-offset:2px; cursor:pointer; }
.home-quick-filter:hover { text-decoration-thickness:2px; }
.home-quick-name { font-weight:700; }
.home-open { width:2rem; text-align:right; }
.home-open a { display:inline-block; min-width:1.5rem; text-align:center; text-decoration:none; font-size:1.1rem; }
@media (max-width:640px) {
  .home-list-head { align-items:stretch; }
  .home-list-head h2.sec { flex-basis:100%; }
  .home-view-toggle { width:100%; }
  .home-view-toggle button { flex:1; }
  .home-filters { display:grid; grid-template-columns:1fr 1fr; }
  .home-filters label, .home-filters select, .home-filter-reset { width:100%; }
}
@media (max-width:420px) { .home-filters { grid-template-columns:1fr; } }
</style>
<script>
(function () {
  var compact = document.getElementById('home-compact');
  var expanded = document.getElementById('home-expanded');
  var buttons = Array.prototype.slice.call(document.querySelectorAll('[data-home-view]'));
  var storageKey = 'girevoy-home-view';
  var form = document.getElementById('home-filters');
  var table = document.getElementById('home-competitions-table');
  var rows = table ? Array.prototype.slice.call(table.tBodies[0].rows) : [];
  var active = document.getElementById('home-active-filters');
  var count = document.getElementById('home-filter-count');
  var empty = document.getElementById('home-filter-empty');
  var filterKeys = ['year', 'name', 'city', 'rank'];
  var labels = { year: 'Год', name: 'Турнир', city: 'Место', rank: 'Уровень' };

  function setView(view, persist) {
    var expandedOn = view === 'expanded';
    compact.hidden = expandedOn;
    expanded.hidden = !expandedOn;
    buttons.forEach(function (button) {
      var on = button.dataset.homeView === view;
      button.classList.toggle('on', on);
      button.setAttribute('aria-pressed', on ? 'true' : 'false');
    });
    if (persist) {
      try { localStorage.setItem(storageKey, view); } catch (_) {}
    }
  }

  function currentFilters() {
    var out = {};
    filterKeys.forEach(function (key) { out[key] = form.elements[key].value; });
    return out;
  }

  function syncUrl(filters) {
    try {
      var url = new URL(window.location.href);
      filterKeys.forEach(function (key) {
        if (filters[key]) url.searchParams.set(key, filters[key]);
        else url.searchParams.delete(key);
      });
      history.replaceState(null, '', url.pathname + url.search + url.hash);
    } catch (_) {}
  }

  function renderChips(filters) {
    active.innerHTML = '';
    filterKeys.forEach(function (key) {
      if (!filters[key]) return;
      var chip = document.createElement('button');
      chip.type = 'button';
      chip.className = 'home-filter-chip';
      chip.dataset.clearFilter = key;
      chip.textContent = labels[key] + ': ' + filters[key] + ' ×';
      active.appendChild(chip);
    });
  }

  function applyFilters(updateUrl) {
    var filters = currentFilters();
    var shown = 0;
    rows.forEach(function (row) {
      var visible = filterKeys.every(function (key) {
        return !filters[key] || row.dataset[key] === filters[key];
      });
      row.hidden = !visible;
      if (visible) shown++;
    });
    count.textContent = 'Показано: ' + shown + ' из ' + rows.length;
    empty.hidden = shown !== 0;
    renderChips(filters);
    if (updateUrl) syncUrl(filters);
  }

  function setFilter(key, value) {
    if (!form.elements[key]) return;
    form.elements[key].value = value;
    applyFilters(true);
  }

  buttons.forEach(function (button) {
    button.addEventListener('click', function () { setView(button.dataset.homeView, true); });
  });

  form.addEventListener('change', function () { applyFilters(true); });
  document.getElementById('home-filter-reset').addEventListener('click', function () {
    filterKeys.forEach(function (key) { form.elements[key].value = ''; });
    applyFilters(true);
  });
  table.addEventListener('click', function (ev) {
    var button = ev.target.closest('[data-filter]');
    if (!button) return;
    setFilter(button.dataset.filter, button.dataset.value);
  });
  active.addEventListener('click', function (ev) {
    var chip = ev.target.closest('[data-clear-filter]');
    if (!chip) return;
    setFilter(chip.dataset.clearFilter, '');
  });

  var initial = 'compact';
  try {
    var saved = localStorage.getItem(storageKey);
    if (saved === 'expanded') initial = saved;
  } catch (_) {}

  try {
    var params = new URL(window.location.href).searchParams;
    var hasFilters = false;
    filterKeys.forEach(function (key) {
      var value = params.get(key);
      if (value && Array.prototype.some.call(form.elements[key].options, function (option) { return option.value === value; })) {
        form.elements[key].value = value;
        hasFilters = true;
      }
    });
    if (hasFilters) initial = 'expanded';
  } catch (_) {}

  setView(initial, false);
  applyFilters(false);
})();
</script>`,
  });
}
