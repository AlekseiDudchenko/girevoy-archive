const esc = (value) => String(value ?? '').replace(/[&<>"']/g, (char) =>
  ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[char]));

const titleCaseWords = (value) => String(value ?? '').replace(
  /(^|[\s-])([а-яёa-z])/giu,
  (_, separator, char) => separator + char.toLocaleUpperCase('ru-RU'),
);

const MONTHS = ['января', 'февраля', 'марта', 'апреля', 'мая', 'июня',
  'июля', 'августа', 'сентября', 'октября', 'ноября', 'декабря'];

const dateRu = (iso) => {
  if (!iso) return '';
  const [year, month, day] = iso.split('-').map(Number);
  return `${day} ${MONTHS[month - 1]} ${year}`;
};

const ICONS = {
  calendar: '<svg viewBox="0 0 24 24" focusable="false"><rect x="3.5" y="5.5" width="17" height="15" rx="2"/><path d="M7 3.5v4M17 3.5v4M3.5 9.5h17"/></svg>',
  pin: '<svg viewBox="0 0 24 24" focusable="false"><path d="M12 21s6-5.2 6-11a6 6 0 1 0-12 0c0 5.8 6 11 6 11Z"/><circle cx="12" cy="10" r="2.2"/></svg>',
  federation: '<svg viewBox="0 0 24 24" focusable="false"><path d="M4 20h16M6 20V9M18 20V9M3 9h18L12 4 3 9ZM10 20V9M14 20V9"/></svg>',
  trophy: '<svg viewBox="0 0 24 24" focusable="false"><path d="M8 4h8v4a4 4 0 0 1-8 0V4ZM8 6H5v2a4 4 0 0 0 4 4M16 6h3v2a4 4 0 0 1-4 4M12 12v4M8 20h8M10 16h4v4"/></svg>',
  categories: '<svg viewBox="0 0 24 24" focusable="false"><path d="M5 6h14M5 12h14M5 18h14"/><circle cx="3" cy="6" r=".8"/><circle cx="3" cy="12" r=".8"/><circle cx="3" cy="18" r=".8"/></svg>',
  results: '<svg viewBox="0 0 24 24" focusable="false"><path d="M5 20v-5M12 20V9M19 20V4"/></svg>',
  source: '<svg viewBox="0 0 24 24" focusable="false"><path d="M8 3.5h6l4 4V20.5H8z"/><path d="M14 3.5v4h4M5 7.5H3.5v13H14"/></svg>',
};

const icon = (name) => `<span class="competition-icon" aria-hidden="true">${ICONS[name]}</span>`;
const fact = (iconName, label, value, href = '') => value
  ? `<div class="competition-fact${href ? ' competition-fact-link-wrap' : ''}">${icon(iconName)}<div><span class="competition-label">${label}</span><span class="competition-value">${href ? `<a class="competition-fact-link" href="${esc(href)}">${value}</a>` : value}</span></div></div>`
  : '';
const stat = (iconName, value, label) => `<div class="competition-stat">${icon(iconName)}<div><strong>${value}</strong><span>${label}</span></div></div>`;

export function sourceFormat(url) {
  if (!url) return '';
  try {
    const pathname = new URL(url, 'https://example.invalid').pathname;
    const match = pathname.match(/\.([a-z0-9]+)$/i);
    const ext = match?.[1]?.toUpperCase() || '';
    return ['PDF', 'XLS', 'XLSX', 'CSV', 'DOC', 'DOCX'].includes(ext) ? ext : '';
  } catch {
    return '';
  }
}

function archiveHref(path) {
  if (!path?.startsWith('sources/')) return '';
  const relative = path.slice('sources/'.length);
  return `/protocols/${relative.split('/').map(encodeURIComponent).join('/')}`;
}

function filterHref(homeHref, key, value) {
  if (!value) return '';
  const separator = homeHref.includes('?') ? '&' : '?';
  return `${homeHref}${separator}${key}=${encodeURIComponent(value)}`;
}

function visual(comp, year) {
  if (comp.poster_path) {
    return `<a class="competition-visual competition-visual-poster" href="${esc(comp.poster_path)}" target="_blank" rel="noopener noreferrer" aria-label="Открыть афишу турнира">
      <img src="${esc(comp.poster_path)}" alt="Афиша: ${esc(comp.name)}" loading="lazy" decoding="async">
    </a>`;
  }
  return `<div class="competition-visual competition-visual-placeholder" aria-label="Афиша турнира пока не добавлена"><span>${esc(year)}</span></div>`;
}

export function competitionCard(body, comp, categories = []) {
  const headerMatch = body.match(/<div class="page-head">[\s\S]*?<\/div>/);
  if (!headerMatch) return body;

  const live = categories.filter((category) => !category.is_deferred);
  const results = live.reduce((sum, category) => sum + (category.rows?.length || 0), 0);
  const year = comp.date_start?.slice(0, 4) || 'ГС';
  const date = comp.date_end && comp.date_end !== comp.date_start
    ? `${dateRu(comp.date_start)} — ${dateRu(comp.date_end)}`
    : dateRu(comp.date_start);
  const format = sourceFormat(comp.source_url || comp.archive_path);
  const formatSuffix = format ? ` (${format})` : '';
  const archived = archiveHref(comp.archive_path);
  const homeHref = body.match(/<a class="brand" href="([^"]+)"/)?.[1] || '/';
  const cityHref = filterHref(homeHref, 'city', comp.city);
  const rankHref = filterHref(homeHref, 'rank', comp.rank_name);

  const facts = [
    fact('calendar', 'Дата', esc(date)),
    fact('pin', 'Город', esc(comp.city || ''), cityHref),
    fact('federation', 'Федерация', esc(titleCaseWords(comp.federation_name || ''))),
    fact('trophy', 'Уровень', esc(comp.rank_name || ''), rankHref),
  ].filter(Boolean).join('');

  const sourceBlocks = [
    comp.source_url
      ? `<div class="competition-source">${icon('source')}<div><span class="competition-source-label">Протокол</span><a href="${esc(comp.source_url)}" target="_blank" rel="noopener noreferrer" title="Скачать файл с сайта ВФГС">Оригинал${formatSuffix}</a></div></div>`
      : '',
    archived
      ? `<div class="competition-source">${icon('source')}<div><span class="competition-source-label">Протокол</span><a href="${esc(archived)}" download title="Скачать копию файла с нашего сайта">Копия${formatSuffix}</a></div></div>`
      : '',
  ].filter(Boolean);
  const sourceCount = sourceBlocks.length;

  const card = `<section class="competition-card" aria-label="Карточка турнира">
  <div class="competition-top">
    ${visual(comp, year)}
    <div class="competition-identity">
      <p class="eyebrow">${esc(comp.rank_name || 'Соревнование')}</p>
      <h1>${esc(comp.name)}</h1>
    </div>
  </div>
  ${facts ? `<div class="competition-facts">${facts}</div>` : ''}
  <div class="competition-stats competition-stats-${2 + sourceCount}">
    ${stat('categories', live.length, 'категорий')}
    ${stat('results', results, 'результатов')}
    ${sourceBlocks.join('')}
  </div>
</section>`;

  body = body.replace(headerMatch[0], card);
  return body.replace('</body>', `<style>
.competition-card { margin:0 0 1.8rem; border:1px solid var(--rule); background:var(--surface); }
.competition-top { display:grid; grid-template-columns:7.2rem minmax(0,1fr); gap:1.2rem; align-items:center; padding:1.35rem; }
.competition-visual { width:7.2rem; height:9rem; display:grid; place-items:center; overflow:hidden; border:1px solid var(--rule); border-radius:.35rem; background:var(--accent-soft); color:var(--accent); text-decoration:none; }
.competition-visual-poster img { display:block; width:100%; height:100%; object-fit:cover; }
.competition-visual-placeholder span { font-family:"Bitter",Georgia,serif; font-size:1.35rem; font-weight:600; letter-spacing:-.03em; }
.competition-identity h1 { margin:0; }
.competition-identity .eyebrow { margin-bottom:.35rem; }
.competition-icon { width:1.45rem; height:1.45rem; display:inline-grid; place-items:center; color:var(--accent); flex:0 0 auto; }
.competition-icon svg { display:block; width:100%; height:100%; fill:none; stroke:currentColor; stroke-width:1.8; stroke-linecap:round; stroke-linejoin:round; }
.competition-facts { display:grid; grid-template-columns:repeat(4,minmax(0,1fr)); gap:1px; border-top:1px solid var(--rule); background:var(--rule); }
.competition-fact { min-width:0; display:grid; grid-template-columns:1.7rem minmax(0,1fr); gap:.6rem; align-items:center; padding:.8rem .9rem; background:var(--surface); }
.competition-fact-link-wrap { position:relative; transition:background-color .15s ease; }
.competition-fact-link-wrap:hover { background:var(--accent-soft); }
.competition-label { display:block; font-family:"PT Mono",monospace; font-size:.66rem; letter-spacing:.08em; text-transform:uppercase; color:var(--ink-3); }
.competition-value { display:block; margin-top:.08rem; color:var(--ink); overflow-wrap:anywhere; }
.competition-fact-link, .competition-fact-link:hover, .competition-fact-link:focus-visible { color:var(--accent); text-decoration:none; }
.competition-fact-link::after { content:''; position:absolute; inset:0; }
.competition-fact-link:focus-visible::after { outline:2px solid var(--accent); outline-offset:-2px; }
.competition-stats { display:grid; gap:1px; border-top:1px solid var(--rule); background:var(--rule); }
.competition-stats-2 { grid-template-columns:repeat(2,minmax(0,1fr)); }
.competition-stats-3 { grid-template-columns:repeat(3,minmax(0,1fr)); }
.competition-stats-4 { grid-template-columns:repeat(4,minmax(0,1fr)); }
.competition-stat, .competition-source { min-width:0; display:grid; grid-template-columns:1.7rem minmax(0,1fr); gap:.65rem; align-items:center; padding:.85rem .9rem; background:var(--surface); }
.competition-stat strong { display:block; font-family:"Bitter",Georgia,serif; font-size:1.2rem; line-height:1.1; }
.competition-stat span { display:block; margin-top:.08rem; color:var(--ink-3); font-size:.82rem; }
.competition-source-label { display:block; margin-bottom:.08rem; color:var(--ink-3); font-size:.72rem; }
.competition-source a { display:block; color:var(--accent); font-size:.82rem; line-height:1.2; text-decoration:none; overflow-wrap:anywhere; }
.competition-source a:hover, .competition-source a:focus-visible { text-decoration:underline; }
@media (max-width:760px) {
  .competition-facts { grid-template-columns:repeat(2,minmax(0,1fr)); }
  .competition-stats-3, .competition-stats-4 { grid-template-columns:repeat(2,minmax(0,1fr)); }
}
@media (max-width:520px) {
  .competition-top { grid-template-columns:5.2rem minmax(0,1fr); padding:1rem; gap:.9rem; align-items:start; }
  .competition-visual { width:5.2rem; height:6.5rem; }
  .competition-visual-placeholder span { font-size:1.05rem; }
  .competition-facts { grid-template-columns:1fr; }
  .competition-stats { grid-template-columns:1fr 1fr; }
}
</style></body>`);
}
