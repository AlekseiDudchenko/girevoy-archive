import { readdirSync, readFileSync, writeFileSync } from 'node:fs';
import { join } from 'node:path';
import { sourceFormat } from '../src/competition-card.js';

const OUT = process.argv[2] || 'dist';

const plain = (value) => String(value ?? '')
  .replace(/<[^>]*>/g, '')
  .replace(/&nbsp;/g, ' ')
  .replace(/&amp;/g, '&')
  .replace(/&lt;/g, '<')
  .replace(/&gt;/g, '>')
  .replace(/&quot;/g, '"')
  .replace(/&#39;/g, "'")
  .trim();

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
const fact = (iconName, label, value) => value
  ? `<div class="competition-fact">${icon(iconName)}<div><span class="competition-label">${label}</span><span class="competition-value">${value}</span></div></div>`
  : '';
const stat = (iconName, value, label) => `<div class="competition-stat">${icon(iconName)}<div><strong>${value}</strong><span>${label}</span></div></div>`;

const STYLES = `<style>
.competition-card { margin:0 0 1.8rem; border:1px solid var(--rule); background:var(--surface); }
.competition-top { display:grid; grid-template-columns:5.4rem minmax(0,1fr); gap:1.2rem; align-items:center; padding:1.35rem; }
.competition-mark { width:5.4rem; aspect-ratio:1; display:grid; place-items:center; border:1px solid var(--rule); border-radius:50%; background:var(--accent-soft); color:var(--accent); font-family:"Bitter",Georgia,serif; font-size:1.35rem; font-weight:600; letter-spacing:-.03em; }
.competition-identity h1 { margin:0; }
.competition-identity .eyebrow { margin-bottom:.35rem; }
.competition-icon { width:1.45rem; height:1.45rem; display:inline-grid; place-items:center; color:var(--accent); flex:0 0 auto; }
.competition-icon svg { display:block; width:100%; height:100%; fill:none; stroke:currentColor; stroke-width:1.8; stroke-linecap:round; stroke-linejoin:round; }
.competition-facts { display:grid; grid-template-columns:repeat(4,minmax(0,1fr)); gap:1px; border-top:1px solid var(--rule); background:var(--rule); }
.competition-fact { min-width:0; display:grid; grid-template-columns:1.7rem minmax(0,1fr); gap:.6rem; align-items:center; padding:.8rem .9rem; background:var(--surface); }
.competition-label { display:block; font-family:"PT Mono",monospace; font-size:.66rem; letter-spacing:.08em; text-transform:uppercase; color:var(--ink-3); }
.competition-value { display:block; margin-top:.08rem; color:var(--ink); overflow-wrap:anywhere; }
.competition-stats { display:grid; grid-template-columns:repeat(2,minmax(0,1fr)); gap:1px; border-top:1px solid var(--rule); background:var(--rule); }
.competition-stat { display:grid; grid-template-columns:1.7rem minmax(0,1fr); gap:.65rem; align-items:center; padding:.85rem .9rem; background:var(--surface); }
.competition-stat strong { display:block; font-family:"Bitter",Georgia,serif; font-size:1.2rem; line-height:1.1; }
.competition-stat span { display:block; margin-top:.08rem; color:var(--ink-3); font-size:.82rem; }
.competition-source { display:flex; gap:.65rem; align-items:center; padding:.8rem .9rem; border-top:1px solid var(--rule); font-size:.92rem; }
@media (max-width:760px) { .competition-facts { grid-template-columns:repeat(2,minmax(0,1fr)); } }
@media (max-width:520px) {
  .competition-top { grid-template-columns:4.2rem minmax(0,1fr); padding:1rem; gap:.9rem; }
  .competition-mark { width:4.2rem; font-size:1.05rem; }
  .competition-facts { grid-template-columns:1fr; }
  .competition-stats { grid-template-columns:1fr 1fr; }
}
</style>`;

function renderCard(html) {
  const header = html.match(/<div class="page-head">([\s\S]*?)<\/div>/);
  if (!header) return html;

  const content = header[1];
  const eyebrow = content.match(/<p class="eyebrow">([\s\S]*?)<\/p>/)?.[1] || 'Соревнование';
  const h1 = content.match(/<h1>([\s\S]*?)<\/h1>/)?.[1] || '';
  const meta = content.match(/<p class="meta-line">([\s\S]*?)<\/p>/)?.[1] || '';
  const metaParts = meta.split(' · ').map((part) => part.trim()).filter(Boolean);
  const date = metaParts[0] || '';
  const city = metaParts[1] || '';
  const federation = metaParts.slice(2).join(' · ');
  const year = plain(date).match(/\b(20\d{2})\b/)?.[1] || 'ГС';

  const source = content.match(/<p class="source"><a href="([^"]+)">[\s\S]*?<\/a><\/p>/);
  const sourceUrl = source?.[1] || '';
  const format = sourceFormat(sourceUrl);
  const sourceLabel = `Оригинал протокола${format ? ` (${format})` : ''}`;

  const categorySections = [...html.matchAll(/<section class="cat" id="cat-[^"]+">([\s\S]*?)<\/section>/g)];
  const categoryCount = categorySections.length;
  const resultCount = categorySections.reduce((sum, section) =>
    sum + [...section[1].matchAll(/<tbody>[\s\S]*?<\/tbody>/g)]
      .reduce((inner, body) => inner + (body[0].match(/<tr>/g)?.length || 0), 0), 0);

  const facts = [
    fact('calendar', 'Дата', date),
    fact('pin', 'Город', city),
    fact('federation', 'Федерация', federation),
    fact('trophy', 'Уровень', eyebrow),
  ].filter(Boolean).join('');

  const card = `<section class="competition-card" aria-label="Карточка турнира">
  <div class="competition-top">
    <div class="competition-mark" aria-hidden="true">${year}</div>
    <div class="competition-identity"><p class="eyebrow">${eyebrow}</p><h1>${h1}</h1></div>
  </div>
  ${facts ? `<div class="competition-facts">${facts}</div>` : ''}
  <div class="competition-stats">${stat('categories', categoryCount, 'категорий')}${stat('results', resultCount, 'результатов')}</div>
  ${sourceUrl ? `<div class="competition-source">${icon('source')}<a href="${sourceUrl}" target="_blank" rel="noopener noreferrer">${sourceLabel}</a></div>` : ''}
</section>`;

  return html.replace(header[0], card).replace('</body>', `${STYLES}</body>`);
}

let changed = 0;
for (const name of readdirSync(OUT).filter((name) => /^c-.*\.html$/.test(name))) {
  const path = join(OUT, name);
  const original = readFileSync(path, 'utf8');
  const next = renderCard(original);
  if (next !== original) {
    writeFileSync(path, next, 'utf8');
    changed++;
  }
}

console.log(`Tournament cards: ${changed}`);
