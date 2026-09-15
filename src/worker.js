// Cloudflare Worker: серверный рендеринг публичных страниц из D1.
import * as q from './queries.js';
import { links, renderIndex, renderCompetition, renderPerson, renderResults, renderCoaches } from './render.js';

const d1 = (DB) => ({
  all: async (sql, ...p) => (await DB.prepare(sql).bind(...p).all()).results,
  get: async (sql, ...p) => await DB.prepare(sql).bind(...p).first(),
});

const html = (body, status = 200) => new Response(body, {
  status,
  headers: {
    'content-type': 'text/html; charset=utf-8',
    // страницы статичны между публикациями — кэш сбрасывается при публикации протокола
    'cache-control': 'public, max-age=60, s-maxage=86400',
  },
});

const sortableCoaches = (body, coaches) => {
  let rowIndex = 0;
  const withYear = body.replace(
    '<thead><tr><th scope="col">Имя</th><th scope="col">Регион</th></tr></thead>',
    '<thead><tr><th scope="col" class="sort" data-sort="0" role="button" tabindex="0">Имя</th><th scope="col" class="sort" data-sort="1" role="button" tabindex="0">Регион</th><th scope="col" class="c sort" data-sort="2" role="button" tabindex="0">Последний протокол</th></tr></thead>',
  ).replace(/(<tbody>[\s\S]*?<\/tbody>)/, (tbody) => tbody.replace(/<\/tr>/g, () => {
    const coach = coaches[rowIndex++];
    const years = (coach?.athletes || []).map((a) => a.last_year).filter(Boolean);
    const lastYear = years.length ? years.sort().at(-1) : '—';
    return `<td class="c n">${lastYear}</td></tr>`;
  }));

  return withYear.replace('</body>', `<script>(function () {
  var table = document.getElementById('coaches-table');
  if (!table) return;
  var body = table.tBodies[0];
  var heads = Array.prototype.slice.call(table.querySelectorAll('th[data-sort]'));
  var current = -1, dir = 1;
  function text(row, index) {
    return row.cells[index].textContent.toLocaleLowerCase('ru').replace(/ё/g, 'е').trim();
  }
  function sortBy(head) {
    var index = Number(head.dataset.sort);
    dir = current === index ? -dir : 1;
    current = index;
    var rows = Array.prototype.slice.call(body.rows);
    rows.sort(function (a, b) {
      var x = text(a, index), y = text(b, index);
      if (x === y) return 0;
      if (x === '—') return 1;
      if (y === '—') return -1;
      return x.localeCompare(y, 'ru') * dir;
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
    const L = links.worker;

    try {
      if (path === '/') {
        const [stats, competitions] = await Promise.all([q.getStats(db), q.listCompetitions(db)]);
        return html(renderIndex({ stats, competitions, L }));
      }
      if (path === '/results') {
        return html(renderResults({ rows: await q.listAllResults(db), L }));
      }
      if (path === '/coaches') {
        const coaches = await q.listCoaches(db);
        return html(sortableCoaches(renderCoaches({ coaches, L }), coaches));
      }
      if (path.startsWith('/p/')) {
        const data = await q.getPerson(db, decodeURIComponent(path.slice(3)));
        return data ? html(renderPerson({ ...data, L })) : html(notFound(L), 404);
      }
      if (path.startsWith('/c/')) {
        const data = await q.getCompetition(db, decodeURIComponent(path.slice(3)));
        return data ? html(renderCompetition({ ...data, L })) : html(notFound(L), 404);
      }
      if (path.startsWith('/a/')) {
        // Старые адреса спортсменов остаются рабочими.
        const data = await q.getPerson(db, decodeURIComponent(path.slice(3)));
        return data ? html(renderPerson({ ...data, L })) : html(notFound(L), 404);
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
