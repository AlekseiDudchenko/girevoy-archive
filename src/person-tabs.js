const ROLE_KEYS = {
  'Спортивный деятель': 'official',
  'Спортсмен': 'athlete',
  'Тренер': 'coach',
  'Судья': 'judge',
};

const ROLE_VALUES = new Set(Object.values(ROLE_KEYS));

const esc = (value) => String(value ?? '').replace(/[&<>"']/g, (char) =>
  ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[char]));

const plain = (value) => String(value ?? '')
  .replace(/<[^>]*>/g, '')
  .replace(/&nbsp;/g, ' ')
  .replace(/&amp;/g, '&')
  .replace(/&lt;/g, '<')
  .replace(/&gt;/g, '>')
  .replace(/&quot;/g, '"')
  .replace(/&#39;/g, "'")
  .trim();

const PROFILE_ICONS = {
  calendar: '<svg viewBox="0 0 24 24" focusable="false"><rect x="3.5" y="5.5" width="17" height="15" rx="2"/><path d="M7 3.5v4M17 3.5v4M3.5 9.5h17M7 13h2M11 13h2M15 13h2M7 17h2M11 17h2"/></svg>',
  pin: '<svg viewBox="0 0 24 24" focusable="false"><path d="M12 21s6-5.2 6-11a6 6 0 1 0-12 0c0 5.8 6 11 6 11Z"/><circle cx="12" cy="10" r="2.2"/></svg>',
  kettlebell: '<svg viewBox="0 0 24 24" focusable="false"><path d="M7.2 9V6.4C7.2 3.7 9.1 2.3 12 2.3s4.8 1.4 4.8 4.1V9"/><path d="M8.7 8V6.6c0-1.2 1-2 3.3-2s3.3.8 3.3 2V8"/><path d="M6.7 9h10.6c1.5 1.7 2.4 3.9 2.4 6.2 0 4-3.4 6.8-7.7 6.8s-7.7-2.8-7.7-6.8c0-2.3.9-4.5 2.4-6.2Z"/></svg>',
  club: '<svg viewBox="0 0 24 24" focusable="false"><circle cx="12" cy="7" r="3"/><circle cx="5.5" cy="9" r="2"/><circle cx="18.5" cy="9" r="2"/><path d="M7.5 20v-1.5A4.5 4.5 0 0 1 12 14a4.5 4.5 0 0 1 4.5 4.5V20M2.5 19v-1a3 3 0 0 1 3-3h1M21.5 19v-1a3 3 0 0 0-3-3h-1"/></svg>',
  flag: '<svg viewBox="0 0 24 24" focusable="false"><path d="M5 21V4M5 5c4-2 7 2 12 0v9c-5 2-8-2-12 0"/></svg>',
  bars: '<svg viewBox="0 0 24 24" focusable="false"><path d="M5 20v-5M12 20V9M19 20V4"/></svg>',
  clock: '<svg viewBox="0 0 24 24" focusable="false"><circle cx="12" cy="12" r="9"/><path d="M12 7v5l3.5 2"/></svg>',
  discipline: '<svg viewBox="0 0 24 24" focusable="false"><circle cx="12" cy="6" r="2"/><circle cx="6" cy="12" r="2"/><circle cx="18" cy="12" r="2"/><circle cx="12" cy="18" r="2"/><path d="M10.6 7.4 7.4 10.6M13.4 7.4l3.2 3.2M7.4 13.4l3.2 3.2M16.6 13.4l-3.2 3.2"/></svg>',
  coach: '<svg viewBox="0 0 24 24" focusable="false"><circle cx="12" cy="7" r="3"/><path d="M6 21v-2a6 6 0 0 1 12 0v2M4 21h16"/></svg>',
};

const profileIcon = (name) => `<span class="profile-icon" data-profile-icon="${name}" aria-hidden="true">${PROFILE_ICONS[name]}</span>`;

const profileFact = (icon, label, value, force = false) => (value || force)
  ? `<div class="profile-fact">${profileIcon(icon)}<div class="profile-fact-copy"><span class="profile-label">${label}</span><span class="profile-value">${value || ''}</span></div></div>`
  : '';

const profileStat = (icon, value, label) => `<div class="profile-stat">${profileIcon(icon)}<div class="profile-stat-copy">
  <strong>${value}</strong><span>${label}</span>
</div></div>`;

function athleteProfileCard(body, roles) {
  if (!roles.some((role) => role.key === 'athlete')) return body;

  const headerMatch = body.match(/<div class="page-head">([\s\S]*?)<\/div>/);
  if (!headerMatch) return body;

  const header = headerMatch[1];
  const h1 = header.match(/<h1>[\s\S]*?<\/h1>/)?.[0];
  if (!h1) return body;

  const name = plain(h1.replace(/<span class="rank[\s\S]*?<\/span>/, ''));
  const nameParts = name.split(/\s+/).filter(Boolean);
  const initials = nameParts.slice(0, 2).map((part) => part[0]).join('').toLocaleUpperCase('ru');
  const roleLine = roles.map((role) => role.label).join(' · ');

  const metaHtml = header.match(/<p class="meta-line">([\s\S]*?)<\/p>/)?.[1] || '';
  const metaParts = metaHtml.split(' · ').map((part) => part.trim()).filter(Boolean);
  const birthIndex = metaParts.findIndex((part) => /г\.\s*р\./.test(plain(part)));
  const birth = birthIndex >= 0 ? metaParts[birthIndex] : '';
  const locationParts = metaParts.filter((_, index) => index !== birthIndex);
  const region = locationParts[0] || '';
  const club = locationParts[1] || '';

  const resultTable = body.match(/<table class="athlete-result-table" id="athlete-results-table">([\s\S]*?)<\/table>/)?.[1] || '';
  const rows = [...resultTable.matchAll(/<tr data-date="([^"]*)" data-comp="([^"]*)"[\s\S]*?<\/tr>/g)];
  const dates = rows.map((row) => row[1]).filter(Boolean).sort();
  const competitions = new Set(rows.map((row) => row[2]).filter(Boolean));
  const latest = rows.reduce((best, row) => !best || row[1] > best[1] ? row : best, null);
  const latestCategory = latest?.[0].match(/<td class="c dim">([\s\S]*?)<\/td>/)?.[1] || '';
  const latestCategoryText = plain(latestCategory);
  const categoryValue = latestCategoryText && latestCategoryText !== '—'
    ? `${latestCategory}${/\d/.test(latestCategoryText) && !/кг/i.test(latestCategoryText) ? ' кг' : ''}${latest?.[1] ? ` (${latest[1].slice(0, 4)})` : ''}`
    : '';

  const disciplineMatches = [...body.matchAll(/<section class="discipline-group">\s*<h4>([\s\S]*?)\s*<span class="dim">/g)];
  const disciplines = [...new Map(disciplineMatches.map((match) => [plain(match[1]), match[1].trim()])).values()];

  const sourceParagraphs = [...header.matchAll(/<p class="source">([\s\S]*?)<\/p>/g)].map((match) => match[1]);
  const coaches = sourceParagraphs.find((source) => /^Тренер(?:ы)?:/.test(plain(source))) || '';
  const notes = sourceParagraphs.filter((source) => source !== coaches);

  const facts = [
    profileFact('calendar', 'Год рождения', birth.replace(/\s*г\.\s*р\.$/, '')),
    profileFact('pin', 'Регион', region),
    profileFact('kettlebell', 'Весовая категория', categoryValue),
    profileFact('club', 'Клуб', club, true),
  ].filter(Boolean).join('');

  const period = dates.length
    ? `${dates[0].slice(0, 4)}${dates.at(-1).slice(0, 4) !== dates[0].slice(0, 4) ? ` — ${dates.at(-1).slice(0, 4)}` : ''}`
    : '';
  const stats = rows.length ? [
    profileStat('flag', competitions.size, 'соревнований'),
    profileStat('bars', rows.length, 'результатов'),
    profileStat('clock', period, 'период выступлений'),
  ].join('') : '';

  const disciplinesBlock = disciplines.length ? `<div class="profile-detail">
    <div class="profile-detail-head">${profileIcon('discipline')}<span class="profile-label">Дисциплины</span></div>
    <div class="profile-chips">${disciplines.map((discipline) => `<span>${discipline}</span>`).join('')}</div>
  </div>` : '';
  const coachesBlock = coaches ? `<div class="profile-detail">
    <div class="profile-detail-head">${profileIcon('coach')}<span class="profile-label">Тренеры</span></div>
    <div class="profile-coaches">${coaches.replace(/^Тренер(?:ы)?:\s*/, '')}</div>
  </div>` : '';

  const card = `<section class="profile-card" aria-label="Карточка спортсмена">
  <div class="profile-top">
    <div class="profile-avatar" aria-hidden="true">${esc(initials || 'ГС')}</div>
    <div class="profile-identity">
      ${h1}
      <p class="profile-roles">${roleLine}</p>
    </div>
  </div>
  ${facts ? `<div class="profile-facts">${facts}</div>` : ''}
  ${stats ? `<div class="profile-stats">${stats}</div>` : ''}
  ${disciplinesBlock || coachesBlock ? `<div class="profile-details">${disciplinesBlock}${coachesBlock}</div>` : ''}
  ${notes.length ? `<div class="profile-note">${notes.join('<br>')}</div>` : ''}
</section>`;

  body = body.replace(headerMatch[0], card);
  body = body.replace('<section class="chart-block">', '<section class="chart-block" id="profile-progress">');
  body = body.replace('<section class="cat athlete-results">', '<section class="cat athlete-results" id="profile-results">');
  return body;
}

export function personRoleLinks(body, role) {
  if (!ROLE_VALUES.has(role)) return body;
  return body.replace(/href="([^"]+)"/g, (match, href) => {
    const base = href.split('#')[0];
    const isWorkerPerson = base.startsWith('/p/');
    const isStaticPerson = /^p-[^?#]+\.html$/.test(base);
    if (!isWorkerPerson && !isStaticPerson) return match;
    return `href="${base}#${role}"`;
  });
}

export function personTabs(body) {
  // Внутри общей person-страницы ссылки тоже должны вести на конкретную роль.
  body = body.replace(/<p class="source">Тренеры:[\s\S]*?<\/p>/,
    (fragment) => personRoleLinks(fragment, 'coach'));
  body = body.replace(/<section class="cat person-role">\s*<h2>Тренер<\/h2>[\s\S]*?<\/section>/,
    (fragment) => personRoleLinks(fragment, 'athlete'));

  const rolePattern = /<section class="([^"]*\bperson-role\b[^"]*)">\s*<h2>(Спортивный деятель|Спортсмен|Тренер|Судья)<\/h2>/g;
  const matches = [...body.matchAll(rolePattern)];
  if (!matches.length) return body;

  const roles = matches.map((match) => ({
    original: match[0],
    classes: match[1],
    label: match[2],
    key: ROLE_KEYS[match[2]],
  }));

  roles.forEach((role) => {
    const panel = `<section class="${role.classes}" id="role-${role.key}" role="tabpanel" aria-labelledby="tab-${role.key}" data-person-role="${role.key}">\n    <h2>${role.label}</h2>`;
    body = body.replace(role.original, panel);
  });

  // Без JS вкладки скрыты, а все секции профиля остаются обычными видимыми разделами.
  const tabs = `<nav class="person-tabs" role="tablist" aria-label="Разделы профиля" hidden>
    ${roles.map((role, index) => `<button type="button" class="person-tab" id="tab-${role.key}" role="tab" data-person-tab="${role.key}" aria-controls="role-${role.key}" aria-selected="${index ? 'false' : 'true'}" tabindex="${index ? '-1' : '0'}">${role.label}</button>`).join('\n    ')}
  </nav>`;

  body = body.replace(/(<div class="page-head">[\s\S]*?<\/div>)/, `$1\n${tabs}`);
  body = athleteProfileCard(body, roles);

  return body.replace('</body>', `<style>
.profile-card { margin:0 0 1.35rem; border:1px solid var(--rule); background:var(--surface); }
.profile-top { display:grid; grid-template-columns:5.4rem minmax(0,1fr); gap:1.2rem; align-items:center; padding:1.35rem; }
.profile-avatar { width:5.4rem; aspect-ratio:1; display:grid; place-items:center; border:1px solid var(--rule); border-radius:50%; background:var(--accent-soft); color:var(--accent); font-family:"Bitter",Georgia,serif; font-size:1.65rem; font-weight:600; letter-spacing:-.03em; }
.profile-identity h1 { margin:0 0 .3rem; }
.profile-roles { margin:0; color:var(--ink-2); font-size:1rem; }
.profile-icon { width:1.45rem; height:1.45rem; display:inline-grid; place-items:center; color:var(--accent); flex:0 0 auto; }
.profile-icon svg { display:block; width:100%; height:100%; fill:none; stroke:currentColor; stroke-width:1.8; stroke-linecap:round; stroke-linejoin:round; }
.profile-facts { display:grid; grid-template-columns:repeat(4,minmax(0,1fr)); gap:1px; border-top:1px solid var(--rule); background:var(--rule); }
.profile-fact { min-width:0; display:grid; grid-template-columns:1.7rem minmax(0,1fr); gap:.6rem; align-items:center; padding:.8rem .9rem; background:var(--surface); }
.profile-fact-copy, .profile-stat-copy { min-width:0; }
.profile-label { display:block; margin-bottom:.2rem; color:var(--ink-3); font-family:"PT Mono",monospace; font-size:.65rem; letter-spacing:.08em; line-height:1.35; text-transform:uppercase; }
.profile-value { display:block; min-height:1.2em; color:var(--ink); font-weight:700; overflow-wrap:anywhere; }
.profile-stats { display:grid; grid-template-columns:repeat(3,minmax(0,1fr)); gap:1px; border-top:1px solid var(--rule); background:var(--rule); }
.profile-stat { min-width:0; display:grid; grid-template-columns:1.7rem minmax(0,1fr); gap:.65rem; align-items:center; padding:.85rem .9rem; background:var(--accent-soft); }
.profile-stat strong { display:block; font-family:"Bitter",Georgia,serif; font-size:1.45rem; font-weight:600; line-height:1.1; font-variant-numeric:tabular-nums; }
.profile-stat span:not(.profile-icon) { display:block; margin-top:.22rem; color:var(--ink-3); font-size:.82rem; }
.profile-details { display:grid; grid-template-columns:1fr 1fr; border-top:1px solid var(--rule); }
.profile-detail { min-width:0; padding:.9rem; }
.profile-detail + .profile-detail { border-left:1px solid var(--rule); }
.profile-detail-head { display:flex; align-items:center; gap:.45rem; margin-bottom:.45rem; }
.profile-detail-head .profile-icon { width:1.15rem; height:1.15rem; }
.profile-detail-head .profile-label { margin:0; }
.profile-chips { display:flex; flex-wrap:wrap; gap:.35rem; }
.profile-chips span { padding:.18rem .52rem; background:var(--accent-soft); color:var(--accent); font-size:.82rem; }
.profile-coaches { color:var(--ink-2); font-size:.93rem; }
.profile-note { border-top:1px solid var(--rule); padding:.65rem .9rem; color:var(--ink-3); font-size:.82rem; }
.person-tabs { display:flex; gap:.2rem; overflow-x:auto; margin:0 0 1.4rem; border-bottom:1px solid var(--rule); scrollbar-width:thin; }
.person-tab { appearance:none; border:0; border-bottom:3px solid transparent; background:transparent; color:var(--ink-2); font:inherit; font-weight:700; padding:.7rem .85rem .55rem; cursor:pointer; white-space:nowrap; }
.person-tab:hover { color:var(--ink); }
.person-tab[aria-selected="true"] { color:var(--ink); border-bottom-color:var(--accent); }
.person-tab:focus-visible { outline:2px solid var(--accent); outline-offset:-2px; }
.person-role[hidden] { display:none !important; }
.person-role > h2:first-child { margin-top:0; }
@media (max-width:640px) {
  .profile-top { grid-template-columns:4.25rem minmax(0,1fr); gap:.85rem; padding:1rem; }
  .profile-avatar { width:4.25rem; font-size:1.35rem; }
  .profile-facts { grid-template-columns:repeat(2,minmax(0,1fr)); }
  .profile-stats { grid-template-columns:1fr; }
  .profile-details { grid-template-columns:1fr; }
  .profile-detail + .profile-detail { border-left:0; border-top:1px solid var(--rule); }
  .person-tabs { margin-left:-.2rem; margin-right:-.2rem; }
  .person-tab { padding-left:.7rem; padding-right:.7rem; }
}
</style>
<script>(function () {
  var tablist = document.querySelector('.person-tabs');
  var tabs = Array.prototype.slice.call(document.querySelectorAll('[data-person-tab]'));
  var panels = Array.prototype.slice.call(document.querySelectorAll('[data-person-role]'));
  if (!tablist || !tabs.length) return;

  function activate(key, updateHash) {
    var target = tabs.find(function (tab) { return tab.dataset.personTab === key; });
    if (!target) return false;
    tabs.forEach(function (tab) {
      var on = tab === target;
      tab.setAttribute('aria-selected', on ? 'true' : 'false');
      tab.tabIndex = on ? 0 : -1;
    });
    panels.forEach(function (panel) { panel.hidden = panel.dataset.personRole !== key; });
    if (updateHash && window.history && window.history.replaceState) {
      window.history.replaceState(null, '', '#' + key);
    }
    return true;
  }

  tabs.forEach(function (tab, index) {
    tab.addEventListener('click', function () { activate(tab.dataset.personTab, true); });
    tab.addEventListener('keydown', function (ev) {
      var next = index;
      if (ev.key === 'ArrowRight') next = (index + 1) % tabs.length;
      else if (ev.key === 'ArrowLeft') next = (index - 1 + tabs.length) % tabs.length;
      else if (ev.key === 'Home') next = 0;
      else if (ev.key === 'End') next = tabs.length - 1;
      else return;
      ev.preventDefault();
      tabs[next].focus();
      activate(tabs[next].dataset.personTab, true);
    });
  });

  window.addEventListener('hashchange', function () {
    activate(window.location.hash.slice(1), false);
  });

  if (!activate(window.location.hash.slice(1), false)) {
    activate(tabs[0].dataset.personTab, false);
  }
  tablist.hidden = false;
})();</script></body>`);
}
