import { page, dateRu } from './render.js';

const e = (v) => String(v ?? '').replace(/[&<>"']/g, (c) =>
  ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c]));

const yearOf = (iso) => String(iso || '').slice(0, 4) || '—';

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
  <div class="scroll">
    <table class="home-competitions-table">
      <thead><tr>
        <th>Год</th><th>Соревнование</th><th>Место</th><th>Дата</th>
        <th>Уровень</th><th class="r">Категорий</th><th class="r">Результатов</th>
      </tr></thead>
      <tbody>
      ${competitions.map((c) => `<tr>
        <td class="n">${e(yearOf(c.date_start))}</td>
        <td><a href="${L.comp(c.slug)}">${e(c.name)}</a></td>
        <td>${e(c.city || '—')}</td>
        <td class="n">${e(c.date_start || '—')}</td>
        <td>${e(c.rank_name || '—')}</td>
        <td class="r n">${c.categories ?? '—'}</td>
        <td class="r n">${c.results ?? '—'}</td>
      </tr>`).join('')}
      </tbody>
    </table>
  </div>
</div>

<style>
.home-list-head { display:flex; flex-wrap:wrap; align-items:end; justify-content:space-between; gap:.7rem 1rem; margin-top:2.4rem; }
.home-list-head h2.sec { flex:1 1 auto; margin:0; }
.view-toggle { display:inline-flex; border:1px solid var(--rule); background:var(--surface); padding:2px; }
.view-toggle button { border:0; background:transparent; color:var(--ink-2); font:inherit; font-size:.88rem; padding:.3rem .65rem; cursor:pointer; }
.view-toggle button.on { background:var(--accent); color:var(--surface); }
.home-competitions-table td:first-child { color:var(--ink-3); }
@media (max-width:640px) {
  .home-list-head { align-items:stretch; }
  .home-list-head h2.sec { flex-basis:100%; }
  .home-view-toggle { width:100%; }
  .home-view-toggle button { flex:1; }
}
</style>
<script>
(function () {
  var compact = document.getElementById('home-compact');
  var expanded = document.getElementById('home-expanded');
  var buttons = Array.prototype.slice.call(document.querySelectorAll('[data-home-view]'));
  var key = 'girevoy-home-view';

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
      try { localStorage.setItem(key, view); } catch (_) {}
    }
  }

  buttons.forEach(function (button) {
    button.addEventListener('click', function () { setView(button.dataset.homeView, true); });
  });

  var initial = 'compact';
  try {
    var saved = localStorage.getItem(key);
    if (saved === 'expanded') initial = saved;
  } catch (_) {}
  setView(initial, false);
})();
</script>`,
  });
}
