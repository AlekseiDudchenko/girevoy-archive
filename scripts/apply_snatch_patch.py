#!/usr/bin/env python3
from pathlib import Path


def replace_once(path, old, new):
    p = Path(path)
    text = p.read_text(encoding="utf-8")
    if new in text:
        return
    if old not in text:
        raise SystemExit(f"{path}: expected text not found: {old!r}")
    p.write_text(text.replace(old, new, 1), encoding="utf-8")


# New imports: standalone snatch is always one-hand regardless of source JSON.
p = Path("scripts/gen_seed.py")
text = p.read_text(encoding="utf-8")
if "def normalized_hands(" not in text:
    anchor = '''def rank_id(label):
    if label is None: return None
    label = str(label).strip()
    if not label or label == "-": return None
    code = RANKS.get(label.strip("+"))
    return ref("sport_ranks", code) if code else None
'''
    helper = anchor + '''\n\ndef normalized_hands(discipline, hands):
    return "one" if discipline == "snatch" else hands
'''
    if anchor not in text:
        raise SystemExit("scripts/gen_seed.py: rank_id anchor not found")
    text = text.replace(anchor, helper, 1)
if 'normalized_hands(cat["discipline"], cat["hands"])' not in text:
    if text.count('cat["hands"]') < 2:
        raise SystemExit("scripts/gen_seed.py: expected category hands occurrences not found")
    text = text.replace('cat["hands"]', 'normalized_hands(cat["discipline"], cat["hands"])')
if 'normalized_hands(d["discipline"], d["hands"])' not in text:
    if 'd["hands"]' not in text:
        raise SystemExit("scripts/gen_seed.py: deferred hands occurrence not found")
    text = text.replace('d["hands"]', 'normalized_hands(d["discipline"], d["hands"])')
p.write_text(text, encoding="utf-8")

# Shared labels never append redundant one-hand wording to snatch.
replace_once(
    "src/queries.js",
    "  const hands = r.hands === 'one' ? ' · одной рукой' : '';",
    "  const hands = r.hands === 'one' && r.discipline_name !== 'Рывок' ? ' · одной рукой' : '';",
)

# Use the shared formatter in all-results and spell out the competition chip.
replace_once(
    "src/render.js",
    ": cat.discipline_code === 'snatch' ? 'Р' : cat.discipline_name;",
    ": cat.discipline_code === 'snatch' ? 'Рывок' : cat.discipline_name;",
)
replace_once(
    "src/render.js",
    "  const series = (r) => `${r.discipline_name} · ${r.bell_kg} кг${r.hands === 'one' ? ' · одной' : ''} · ${r.time_limit_min} мин`;",
    "  const series = (r) => seriesLabel(r);",
)

# Correct legacy fixed seeds after all competition data is loaded.
Path("seeds/0006_normalize_snatch.sql").write_text(
    """-- Canonical rule: snatch is always one-hand.
-- Keep categories and denormalized result series aligned, including legacy fixed seeds.
UPDATE categories
   SET hands = 'one'
 WHERE discipline_id = (SELECT id FROM disciplines WHERE code = 'snatch')
   AND hands <> 'one';

UPDATE results
   SET hands = 'one'
 WHERE discipline_id = (SELECT id FROM disciplines WHERE code = 'snatch')
   AND hands <> 'one';
""",
    encoding="utf-8",
)

replace_once(
    "scripts/build-static.sh",
    '  seeds/0005_merges.sql \\\n  "$BUILD_DIR/people.sql" \\\n',
    '  seeds/0005_merges.sql \\\n  seeds/0006_normalize_snatch.sql \\\n  "$BUILD_DIR/people.sql" \\\n',
)
replace_once(
    "scripts/build-static.sh",
    '    coach_mentions = conn.execute("SELECT COUNT(*) FROM person_coach_mentions").fetchone()[0]\n    print(f"results: {results}")\n    print(f"person_coach_mentions: {coach_mentions}")',
    '''    coach_mentions = conn.execute("SELECT COUNT(*) FROM person_coach_mentions").fetchone()[0]
    bad_snatch_hands = conn.execute("""
        SELECT
          (SELECT COUNT(*) FROM categories cat JOIN disciplines d ON d.id = cat.discipline_id
            WHERE d.code = 'snatch' AND cat.hands <> 'one')
          +
          (SELECT COUNT(*) FROM results r JOIN disciplines d ON d.id = r.discipline_id
            WHERE d.code = 'snatch' AND r.hands <> 'one')
    """).fetchone()[0]
    if bad_snatch_hands:
        raise RuntimeError(f"snatch rows with hands != one: {bad_snatch_hands}")
    print(f"results: {results}")
    print(f"person_coach_mentions: {coach_mentions}")
    print("snatch hands: one (verified)")''',
)

# D1 and local database helpers receive the same corrective seed.
replace_once(
    "package.json",
    "wrangler d1 execute girevoy-archive --file=seeds/0005_merges.sql && wrangler d1 execute girevoy-archive --file=.local/people.sql",
    "wrangler d1 execute girevoy-archive --file=seeds/0005_merges.sql && wrangler d1 execute girevoy-archive --file=seeds/0006_normalize_snatch.sql && wrangler d1 execute girevoy-archive --file=.local/people.sql",
)
replace_once(
    "package.json",
    "seeds/0005_merges.sql .local/people.sql | sqlite3 .local/girevoy.db",
    "seeds/0005_merges.sql seeds/0006_normalize_snatch.sql .local/people.sql | sqlite3 .local/girevoy.db",
)

Path("tests/snatch-normalization.test.mjs").write_text(
    r'''import { test } from 'node:test';
import assert from 'node:assert/strict';
import { seriesLabel } from '../src/queries.js';
import { renderCompetition, renderResults, links } from '../src/render.js';

test('snatch series never shows the redundant one-hand suffix', () => {
  assert.equal(seriesLabel({
    discipline_name: 'Рывок', bell_kg: 24, hands: 'one', time_limit_min: 10,
  }), 'Рывок · 24 кг · 10 мин');

  assert.equal(seriesLabel({
    discipline_name: 'Длинный цикл', bell_kg: 24, hands: 'one', time_limit_min: 30,
  }), 'Длинный цикл · 24 кг · одной рукой · 30 мин');
});

test('competition UI spells out Рывок and does not append one-hand wording', () => {
  const html = renderCompetition({
    comp: {
      name: 'Тест', date_start: '2026-01-01', city: 'Москва', country: 'RU',
      rank_name: 'Тест', federation_name: 'ВФГС', source_url: null,
    },
    categories: [{
      id: 1, discipline_name: 'Рывок', discipline_code: 'snatch', hands: 'one',
      bell_kg: 24, time_limit_min: 10, sex: 'f', age_group: 'Взрослые',
      division: null, weight_class_raw: '63', participants_declared: 0,
      is_deferred: 0, rows: [],
    }],
    L: links.worker,
  });

  assert.ok(html.includes('<h2>Рывок · 24 кг · 10 мин</h2>'));
  assert.ok(html.includes('Рывок(<span class="chip-sex chip-sex-f">ж</span>)'));
  assert.ok(!html.includes('Рывок · одной рукой'));
  assert.ok(!html.includes('>Р(<span class="chip-sex'));
});

test('all-results UI uses the same canonical snatch label', () => {
  const html = renderResults({
    rows: [{
      discipline_name: 'Рывок', bell_kg: 24, hands: 'one', time_limit_min: 10,
      sex: 'f', weight_class_raw: '63', result_value: 120,
      event_date: '2026-01-01', last_name: 'Иванова', first_name: 'Анна', middle_name: null,
      slug: 'ivanova-anna-1990', competition: 'Тест', competition_slug: 'test', place: 1,
    }],
    L: links.worker,
  });

  assert.ok(html.includes('Рывок · 24 кг · 10 мин'));
  assert.ok(!html.includes('Рывок · 24 кг · одной'));
});
''',
    encoding="utf-8",
)
