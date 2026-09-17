const PAGE_SIZE = 100;

const decodeHtml = (value) => String(value ?? '')
  .replace(/&#39;/g, "'")
  .replace(/&quot;/g, '"')
  .replace(/&gt;/g, '>')
  .replace(/&lt;/g, '<')
  .replace(/&amp;/g, '&');

const formatDates = (html) => html.replace(/\b(\d{4})-(\d{2})-(\d{2})\b/g, '$3.$2.$1');

function resultRows(tbodyHtml) {
  return [...tbodyHtml.matchAll(/<tr\b([^>]*)>([\s\S]*?)<\/tr>/g)].map((match) => {
    const row = { cells: formatDates(match[2]).trim().replace(/>\s+</g, '><') };
    for (const attr of match[1].matchAll(/\bdata-([a-zA-Z0-9_]+)="([^"]*)"/g)) {
      row[attr[1]] = decodeHtml(attr[2]);
    }
    return row;
  });
}

const safeJson = (value) => JSON.stringify(value)
  .replace(/</g, '\\u003c')
  .replace(/\u2028/g, '\\u2028')
  .replace(/\u2029/g, '\\u2029');

export function paginateResultsHtml(html, pageSize = PAGE_SIZE) {
  const tableStart = html.indexOf('<table id="t">');
  if (tableStart < 0) throw new Error('results pagination: table #t not found');

  const tbodyOpen = html.indexOf('<tbody>', tableStart);
  const tbodyClose = html.indexOf('</tbody>', tbodyOpen);
  if (tbodyOpen < 0 || tbodyClose < 0) throw new Error('results pagination: tbody not found');

  const rows = resultRows(html.slice(tbodyOpen + '<tbody>'.length, tbodyClose));
  if (!rows.length) return html;

  const firstPage = rows.slice(0, pageSize).map((row) => `<tr>${row.cells}</tr>`).join('\n');
  let updated = html.slice(0, tbodyOpen + '<tbody>'.length)
    + `\n${firstPage}\n`
    + html.slice(tbodyClose);

  const oldResultsScript = /<script>\s*\(function \(\) \{\s*var form = document\.getElementById\('f'\), tbody = document\.querySelector\('#t tbody'\);[\s\S]*?<\/script>/;
  if (!oldResultsScript.test(updated)) throw new Error('results pagination: legacy results script not found');

  const data = safeJson(rows);
  const client = `
<style>
.results-pager { display:flex; align-items:center; justify-content:center; gap:.75rem; margin:1rem 0 2rem; flex-wrap:wrap; }
.results-pager button { border:1px solid var(--rule); border-radius:4px; background:var(--surface); color:var(--ink); padding:.4rem .75rem; font:inherit; cursor:pointer; }
.results-pager button:hover:not(:disabled) { border-color:var(--accent); color:var(--accent); }
.results-pager button:disabled { opacity:.45; cursor:default; }
.results-pager-status { min-width:14rem; text-align:center; color:var(--ink-2); }
</style>
<nav class="results-pager" id="results-pager" aria-label="Страницы результатов">
  <button type="button" id="results-prev">← Назад</button>
  <span class="results-pager-status" id="results-page-status" aria-live="polite"></span>
  <button type="button" id="results-next">Далее →</button>
</nav>
<script type="application/json" id="results-data">${data}</script>
<script>
(function () {
  var PAGE_SIZE = ${Number(pageSize)};
  var allRows = JSON.parse(document.getElementById('results-data').textContent);
  var form = document.getElementById('f'), tbody = document.querySelector('#t tbody');
  var note = document.getElementById('sortnote'), col = document.getElementById('sortcol');
  var heads = Array.prototype.slice.call(document.querySelectorAll('#t th.sort'));
  var prev = document.getElementById('results-prev'), next = document.getElementById('results-next');
  var pageStatus = document.getElementById('results-page-status');
  var keys = ['sex', 'discipline_name', 'bell_kg', 'hands', 'time_limit_min', 'weight_class_raw'];
  var NUM = { wc: 1, place: 1, value: 1 };
  var sort = { key: 'date', dir: -1 }, picked = false, sortable = false;
  var page = 1, filtered = allRows.slice();

  function cmp(key, dir) {
    return function (a, b) {
      var x = a[key] == null ? '' : String(a[key]);
      var y = b[key] == null ? '' : String(b[key]);
      if (x === y) return 0;
      if (x === '') return 1;
      if (y === '') return -1;
      var d = NUM[key] ? Number(x) - Number(y) : x.localeCompare(y, 'ru');
      return d * dir;
    };
  }

  function filters() {
    var values = {};
    keys.forEach(function (key) { values[key] = form.elements[key].value; });
    return values;
  }

  function render(scrollToTable) {
    heads.forEach(function (head) {
      if (head.dataset.key === sort.key) head.setAttribute('aria-sort', sort.dir > 0 ? 'ascending' : 'descending');
      else head.removeAttribute('aria-sort');
    });

    var view = filtered.slice().sort(cmp(sort.key, sort.dir));
    var pages = view.length ? Math.ceil(view.length / PAGE_SIZE) : 0;
    if (!pages) page = 1;
    else page = Math.max(1, Math.min(page, pages));
    var start = (page - 1) * PAGE_SIZE;
    var end = Math.min(start + PAGE_SIZE, view.length);
    tbody.innerHTML = view.slice(start, end).map(function (row) { return '<tr>' + row.cells + '</tr>'; }).join('');

    prev.disabled = page <= 1 || !pages;
    next.disabled = !pages || page >= pages;
    pageStatus.textContent = pages
      ? 'Страница ' + page + ' из ' + pages + ' · ' + (start + 1) + '–' + end + ' из ' + view.length
      : 'Нет результатов';

    if (scrollToTable) document.getElementById('t').scrollIntoView({ block: 'start' });
  }

  function apply() {
    var f = filters();
    filtered = allRows.filter(function (row) {
      return keys.every(function (key) { return !f[key] || String(row[key] ?? '') === f[key]; });
    });
    sortable = !!(f.discipline_name && f.bell_kg && f.hands && f.time_limit_min);
    note.textContent = sortable
      ? 'Найдено: ' + filtered.length + '. Серия задана — сортировка по результату включена.'
      : 'Найдено: ' + filtered.length + '. Задайте дисциплину, вес снаряда, руки и регламент, чтобы включить сортировку по результату.';
    col.setAttribute('aria-disabled', sortable ? 'false' : 'true');
    if (sortable && !picked) sort = { key: 'value', dir: -1 };
    if (!sortable && sort.key === 'value') { sort = { key: 'date', dir: -1 }; picked = false; }
    page = 1;
    render(false);
  }

  function click(head) {
    var key = head.dataset.key;
    if (key === 'value' && !sortable) return;
    if (sort.key === key) sort.dir = -sort.dir;
    else sort = { key: key, dir: (key === 'date' || key === 'value') ? -1 : 1 };
    picked = true;
    page = 1;
    render(false);
  }

  heads.forEach(function (head) {
    head.addEventListener('click', function () { click(head); });
    head.addEventListener('keydown', function (event) {
      if (event.key === 'Enter' || event.key === ' ') { event.preventDefault(); click(head); }
    });
  });
  form.addEventListener('change', apply);
  document.getElementById('reset').addEventListener('click', function () {
    keys.forEach(function (key) { form.elements[key].value = ''; });
    sort = { key: 'date', dir: -1 };
    picked = false;
    apply();
  });
  prev.addEventListener('click', function () { if (page > 1) { page--; render(true); } });
  next.addEventListener('click', function () {
    var pages = Math.ceil(filtered.length / PAGE_SIZE);
    if (page < pages) { page++; render(true); }
  });
  apply();
})();
</script>`;

  return updated.replace(oldResultsScript, client);
}
