// Cloudflare Worker: серверный рендеринг публичных страниц из D1.
import * as q from './queries.js';
import { links, renderCompetition, renderPerson, renderResults, renderCoaches } from './render.js';
import { renderIndex } from './render-home.js';
import { personTabs, personRoleLinks } from './person-tabs.js';
import { listAthletes, renderAthletes, withAthletesNav } from './athletes.js';
import { competitionCard } from './competition-card.js';

const d1 = (DB) => ({
  all: async (sql, ...p) => (await DB.prepare(sql).bind(...p).all()).results,
  get: async (sql, ...p) => await DB.prepare(sql).bind(...p).first(),
});

const html = (body, status = 200) => new Response(
  withAthletesNav(body, '/athletes', '/coaches', body.includes('<title>Спортсмены — Гиревой архив</title>')),
  {
    status,
    headers: {
      'content-type': 'text/html; charset=utf-8',
      'cache-control': 'public, max-age=60, s-maxage=86400',
    },
  },
);

const sortableCoaches = (body, coaches) => {
  let rowIndex = 0;
  const searchableBody = body
    .replace('Поиск по имени, региону или году', 'Поиск по имени, региону, году или числу спортсменов')
    .replace('Имя, регион или год', 'Имя, регион, год или число спортсменов');
  const withCounts = searchableBody.replace(/<tbody>([\s\S]*?)<\/tbody>/, (_, rows) =>
    `<tbody>${rows.replace(/<tr>([\s\S]*?)<\/tr>/g, (row) => {
      const count = coaches[rowIndex++]?.athletes?.length ?? 0;
      return row.replace('</tr>', `<td class="c n">${count}</td></tr>`);
    })}</tbody>`);
  return withCounts.replace(
    '<thead><tr><th scope="col">Имя</th><th scope="col">Регион</th><th scope="col" class="c" title="От первого до последнего упоминания тренера в опубликованных протоколах">Период</th></tr></thead>',
    '<thead><tr><th scope="col" class="sort" data-sort="0" role="button" tabindex="0">Имя</th><th scope="col" class="sort" data-sort="1" role="button" tabindex="0">Регион</th><th scope="col" class="c sort" data-sort="2" data-default="desc" role="button" tabindex="0" title="От первого до последнего упоминания тренера в опубликованных протоколах">Период</th><th scope="col" class="c sort" data-sort="3" data-default="desc" role="button" tabindex="0">Спортсменов в базе</th></tr></thead>',
  ).replace('</body>', `<script>(function () {
  var table = document.getElementById('coaches-table');
  if (!table) return;
  var body = table.tBodies[0];
  var heads = Array.prototype.slice.call(table.querySelectorAll('th[data-sort]'));
  var current = -1, dir = 1;
  function value(row, index) {
    var cell = row.cells[index];
    var sortValue = cell.dataset.sortValue;
    if (sortValue !== undefined) return sortValue === '' ? null : Number(sortValue);
    var text = cell.textContent.trim();
    if (index === 3) return Number(text);
    return text.toLocaleLowerCase('ru').replace(/ё/g, 'е');
  }
  function sortBy(head) {
    var index = Number(head.dataset.sort);
    dir = current === index ? -dir : (head.dataset.default === 'desc' ? -1 : 1);
    current = index;
    var rows = Array.prototype.slice.call(body.rows);
    rows.sort(function (a, b) {
      var x = value(a, index), y = value(b, index);
      if (x === y) return 0;
      if (x == null) return 1;
      if (y == null) return -1;
      if (typeof x !== 'number') {
        if (x === '—') return 1;
        if (y === '—') return -1;
      }
      return (typeof x === 'number' ? x - y : x.localeCompare(y, 'ru')) * dir;
    });
    rows.forEach(function (row) { body.appendChild(row); });
    heads.forEach(function (h) {
      if (h === head) h.setAttribute('aria-sort', dir > 0 ? 'ascending' : 'descending');
      else h.removeAttribute('aria-sort');
    });
  }
  heads.forEach(function (head) {
    head.addEventListener('click', function () { sortBy(head); });
    head.addEventListener('keydown', function (ev) {
      if (ev.key === 'Enter' || ev.key === ' ') { ev.preventDefault(); sortBy(head); }
    });
  });
})();</script></body>`);
};

export default {
  async fetch(request, env) {
    const url = new URL(request.url);
    const path = url.pathname.replace(/\/+$/, '') || '/';
    const db = d1(env.DB);
    const L = { ...links.worker, athletes: '/athletes' };

    try {
      if (path === '/') {
        const [stats, competitions] = await Promise.all([q.getStats(db), q.listCompetitions(db)]);
        return html(renderIndex({ stats, competitions, L }));
      }
      if (path === '/results') {
        return html(personRoleLinks(renderResults({ rows: await q.listAllResults(db), L }), 'athlete'));
      }
      if (path === '/athletes') {
        return html(renderAthletes({ athletes: await listAthletes(db), L }));
      }
      if (path === '/coaches') {
        const coaches = await q.listCoaches(db);
        return html(sortableCoaches(personRoleLinks(renderCoaches({ coaches, L }), 'coach'), coaches));
      }
      if (path.startsWith('/p/')) {
        const data = await q.getPerson(db, decodeURIComponent(path.slice(3)));
        return data ? html(personTabs(renderPerson({ ...data, L }))) : html(notFound(L), 404);
      }
      if (path.startsWith('/c/')) {
        const data = await q.getCompetition(db, decodeURIComponent(path.slice(3)));
        return data
          ? html(personRoleLinks(competitionCard(renderCompetition({ ...data, L }), data.comp, data.categories), 'athlete'))
          : html(notFound(L), 404);
      }
      if (path.startsWith('/a/')) {
        const data = await q.getPerson(db, decodeURIComponent(path.slice(3)));
        return data ? html(personTabs(renderPerson({ ...data, L }))) : html(notFound(L), 404);
      }
      return html(notFound(L), 404);
    } catch (err) {
      return html(`<!doctype html><meta charset="utf-8"><title>Ошибка</title>
        <p>Страница не собралась: ${String(err.message)}</p>`, 500);
    }
  },
};

const notFound = () => `<!doctype html><html lang="ru"><meta charset="utf-8">
<title>Страница не найдена</title><link rel="stylesheet" href="/style.css">
<main class="inner"><h1>Страница не найдена</h1>
<p><a href="/">Вернуться к списку соревнований</a></p></main>`;
