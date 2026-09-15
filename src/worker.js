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
        return html(renderCoaches({ coaches: await q.listCoaches(db), L }));
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
