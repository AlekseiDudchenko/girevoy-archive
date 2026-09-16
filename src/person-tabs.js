const ROLE_KEYS = {
  'Спортивный деятель': 'official',
  'Спортсмен': 'athlete',
  'Тренер': 'coach',
  'Судья': 'judge',
};

export function personTabs(body) {
  const rolePattern = /<section class="([^"]*\bperson-role\b[^"]*)">\s*<h2>(Спортивный деятель|Спортсмен|Тренер|Судья)<\/h2>/g;
  const matches = [...body.matchAll(rolePattern)];
  if (!matches.length) return body;

  const roles = matches.map((match) => ({
    original: match[0],
    classes: match[1],
    label: match[2],
    key: ROLE_KEYS[match[2]],
  }));

  roles.forEach((role, index) => {
    const panel = `<section class="${role.classes}" id="role-${role.key}" role="tabpanel" aria-labelledby="tab-${role.key}" data-person-role="${role.key}"${index ? ' hidden' : ''}>\n    <h2>${role.label}</h2>`;
    body = body.replace(role.original, panel);
  });

  const tabs = `<nav class="person-tabs" role="tablist" aria-label="Разделы профиля">
    ${roles.map((role, index) => `<button type="button" class="person-tab" id="tab-${role.key}" role="tab" data-person-tab="${role.key}" aria-controls="role-${role.key}" aria-selected="${index ? 'false' : 'true'}" tabindex="${index ? '-1' : '0'}">${role.label}</button>`).join('\n    ')}
  </nav>`;

  body = body.replace(/(<div class="page-head">[\s\S]*?<\/div>)/, `$1\n${tabs}`);

  return body.replace('</body>', `<style>
.person-tabs { display:flex; gap:.2rem; overflow-x:auto; margin:0 0 1.4rem; border-bottom:1px solid var(--rule); scrollbar-width:thin; }
.person-tab { appearance:none; border:0; border-bottom:3px solid transparent; background:transparent; color:var(--ink-2); font:inherit; font-weight:700; padding:.7rem .85rem .55rem; cursor:pointer; white-space:nowrap; }
.person-tab:hover { color:var(--ink); }
.person-tab[aria-selected="true"] { color:var(--ink); border-bottom-color:var(--accent); }
.person-tab:focus-visible { outline:2px solid var(--accent); outline-offset:-2px; }
.person-role[hidden] { display:none !important; }
.person-role > h2:first-child { margin-top:0; }
@media (max-width:640px) { .person-tabs { margin-left:-.2rem; margin-right:-.2rem; } .person-tab { padding-left:.7rem; padding-right:.7rem; } }
</style>
<script>(function () {
  var tabs = Array.prototype.slice.call(document.querySelectorAll('[data-person-tab]'));
  var panels = Array.prototype.slice.call(document.querySelectorAll('[data-person-role]'));
  if (!tabs.length) return;

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
  activate(window.location.hash.slice(1), false);
})();</script></body>`);
}
