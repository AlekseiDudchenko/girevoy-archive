#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

BUILD_DIR=".local/build"
DB_PATH=".local/girevoy.db"
OUT_DIR="dist"

rm -rf "$BUILD_DIR" "$OUT_DIR"
rm -f "$DB_PATH"
mkdir -p "$BUILD_DIR"

# Keep the complete public dataset in one canonical build manifest.
python3 scripts/gen_seed.py data/chempionat-rossii-2024.json > "$BUILD_DIR/chempionat-rossii-2024.sql"
python3 scripts/gen_seed.py data/chempionat-rossii-2023.json > "$BUILD_DIR/chempionat-rossii-2023.sql"
python3 scripts/gen_seed.py data/chempionat-pfo-2026.json > "$BUILD_DIR/chempionat-pfo-2026.sql"
python3 scripts/gen_seed.py data/chempionat-pfo-2025.json > "$BUILD_DIR/chempionat-pfo-2025.sql"
python3 scripts/gen_seed.py data/chempionat-pfo-2024.json > "$BUILD_DIR/chempionat-pfo-2024.sql"
python3 scripts/gen_seed_override.py data/chempionat-pfo-2023.json 137000 > "$BUILD_DIR/chempionat-pfo-2023.sql"
python3 scripts/gen_seed.py data/chempionat-pfo-2022.json > "$BUILD_DIR/chempionat-pfo-2022.sql"
python3 scripts/gen_seed.py data/chempionat-dfo-sfo-2026.json > "$BUILD_DIR/chempionat-dfo-sfo-2026.sql"
python3 scripts/gen_seed.py data/chempionat-dfo-sfo-2023.json > "$BUILD_DIR/chempionat-dfo-sfo-2023.sql"
python3 scripts/gen_seed.py data/chempionat-dfo-sfo-ufo-2024.json > "$BUILD_DIR/chempionat-dfo-sfo-ufo-2024.sql"
python3 scripts/gen_seed.py data/chempionat-dfo-sfo-ufo-2022.json > "$BUILD_DIR/chempionat-dfo-sfo-ufo-2022.sql"
python3 scripts/gen_seed.py data/chempionat-ufo-2026.json > "$BUILD_DIR/chempionat-ufo-2026.sql"
python3 scripts/gen_seed.py data/chempionat-szfo-2026.json > "$BUILD_DIR/chempionat-szfo-2026.sql"
python3 scripts/gen_seed.py data/chempionat-szfo-2025.json > "$BUILD_DIR/chempionat-szfo-2025.sql"
python3 scripts/gen_seed.py data/chempionat-szfo-2024.json > "$BUILD_DIR/chempionat-szfo-2024.sql"
python3 scripts/gen_seed.py data/chempionat-szfo-2023.json > "$BUILD_DIR/chempionat-szfo-2023.sql"
python3 scripts/gen_seed.py data/chempionat-szfo-2022.json > "$BUILD_DIR/chempionat-szfo-2022.sql"
python3 scripts/gen_seed.py data/chempionat-yufo-skfo-2026.json > "$BUILD_DIR/chempionat-yufo-skfo-2026.sql"
python3 scripts/gen_seed.py data/chempionat-yufo-skfo-2025.json > "$BUILD_DIR/chempionat-yufo-skfo-2025.sql"
python3 scripts/gen_seed.py data/chempionat-yufo-skfo-2024.json > "$BUILD_DIR/chempionat-yufo-skfo-2024.sql"
python3 scripts/gen_seed.py data/chempionat-yufo-skfo-2023.json > "$BUILD_DIR/chempionat-yufo-skfo-2023.sql"
python3 scripts/gen_seed.py data/chempionat-yufo-skfo-2022.json > "$BUILD_DIR/chempionat-yufo-skfo-2022.sql"
python3 scripts/gen_seed.py data/chempionat-tsfo-2026.json > "$BUILD_DIR/chempionat-tsfo-2026.sql"
python3 scripts/gen_seed.py data/chempionat-tsfo-2025.json > "$BUILD_DIR/chempionat-tsfo-2025.sql"
python3 scripts/gen_seed.py data/chempionat-tsfo-2024.json > "$BUILD_DIR/chempionat-tsfo-2024.sql"
python3 scripts/gen_seed.py data/chempionat-tsfo-2023.json > "$BUILD_DIR/chempionat-tsfo-2023.sql"
python3 scripts/gen_seed.py data/kubok-rossii-2025.json > "$BUILD_DIR/kubok-rossii-2025.sql"
python3 scripts/gen_seed.py data/kubok-rossii-2023.json > "$BUILD_DIR/kubok-rossii-2023.sql"
python3 scripts/gen_seed.py data/chempionat-rossii-2022.json > "$BUILD_DIR/chempionat-rossii-2022.sql"
python3 scripts/gen_seed_status.py data/chempionat-rossii-2021.json > "$BUILD_DIR/chempionat-rossii-2021.sql"
python3 scripts/gen_seed_status.py data/chempionat-rossii-2020.json > "$BUILD_DIR/chempionat-rossii-2020.sql"
python3 scripts/gen_seed_status.py data/kubok-rossii-2022.json > "$BUILD_DIR/kubok-rossii-2022.sql"
python3 scripts/gen_seed_status.py data/kubok-rossii-2021.json > "$BUILD_DIR/kubok-rossii-2021.sql"
python3 scripts/gen_seed.py data/kubok-rossii-2020.json > "$BUILD_DIR/kubok-rossii-2020.sql"
python3 scripts/gen_seed.py data/chempionat-tsfo-yufo-szfo-pfo-skfo-2021.json > "$BUILD_DIR/chempionat-tsfo-yufo-szfo-pfo-skfo-2021.sql"
python3 scripts/gen_seed_status.py data/chempionat-dfo-sfo-ufo-2021.json > "$BUILD_DIR/chempionat-dfo-sfo-ufo-2021.sql"
python3 scripts/gen_people.py > "$BUILD_DIR/people.sql"
python3 scripts/gen_corrections.py > "$BUILD_DIR/corrections.sql"

cat \
  migrations/*.sql \
  seeds/0001_reference.sql \
  seeds/0002_regions.sql \
  seeds/0003_chempionat-rossii-2026.sql \
  seeds/0004_chempionat-rossii-2025.sql \
  "$BUILD_DIR/chempionat-rossii-2024.sql" \
  "$BUILD_DIR/chempionat-rossii-2023.sql" \
  "$BUILD_DIR/chempionat-pfo-2026.sql" \
  "$BUILD_DIR/chempionat-pfo-2025.sql" \
  "$BUILD_DIR/chempionat-pfo-2024.sql" \
  "$BUILD_DIR/chempionat-pfo-2023.sql" \
  "$BUILD_DIR/chempionat-pfo-2022.sql" \
  "$BUILD_DIR/chempionat-dfo-sfo-2026.sql" \
  "$BUILD_DIR/chempionat-dfo-sfo-2023.sql" \
  "$BUILD_DIR/chempionat-dfo-sfo-ufo-2024.sql" \
  "$BUILD_DIR/chempionat-dfo-sfo-ufo-2022.sql" \
  "$BUILD_DIR/chempionat-ufo-2026.sql" \
  "$BUILD_DIR/chempionat-szfo-2026.sql" \
  "$BUILD_DIR/chempionat-szfo-2025.sql" \
  "$BUILD_DIR/chempionat-szfo-2024.sql" \
  "$BUILD_DIR/chempionat-szfo-2023.sql" \
  "$BUILD_DIR/chempionat-szfo-2022.sql" \
  "$BUILD_DIR/chempionat-yufo-skfo-2026.sql" \
  "$BUILD_DIR/chempionat-yufo-skfo-2025.sql" \
  "$BUILD_DIR/chempionat-yufo-skfo-2024.sql" \
  "$BUILD_DIR/chempionat-yufo-skfo-2023.sql" \
  "$BUILD_DIR/chempionat-yufo-skfo-2022.sql" \
  "$BUILD_DIR/chempionat-tsfo-2026.sql" \
  "$BUILD_DIR/chempionat-tsfo-2025.sql" \
  "$BUILD_DIR/chempionat-tsfo-2024.sql" \
  "$BUILD_DIR/chempionat-tsfo-2023.sql" \
  "$BUILD_DIR/kubok-rossii-2025.sql" \
  "$BUILD_DIR/kubok-rossii-2023.sql" \
  "$BUILD_DIR/chempionat-rossii-2022.sql" \
  "$BUILD_DIR/chempionat-rossii-2021.sql" \
  "$BUILD_DIR/chempionat-rossii-2020.sql" \
  "$BUILD_DIR/kubok-rossii-2022.sql" \
  "$BUILD_DIR/kubok-rossii-2021.sql" \
  "$BUILD_DIR/kubok-rossii-2020.sql" \
  "$BUILD_DIR/chempionat-tsfo-yufo-szfo-pfo-skfo-2021.sql" \
  "$BUILD_DIR/chempionat-dfo-sfo-ufo-2021.sql" \
  seeds/0005_merges.sql \
  seeds/0006_normalize_snatch.sql \
  "$BUILD_DIR/corrections.sql" \
  "$BUILD_DIR/people.sql" \
  > "$BUILD_DIR/full.sql"

# Use Python's standard-library sqlite3 so the build does not depend on the sqlite3 CLI.
python3 - "$DB_PATH" "$BUILD_DIR/full.sql" <<'PY'
import sqlite3
import sys
from pathlib import Path

path = sys.argv[1]
sql_path = Path(sys.argv[2])
conn = sqlite3.connect(path)
try:
    conn.executescript(sql_path.read_text(encoding="utf-8"))
    conn.commit()
    results = conn.execute("SELECT COUNT(*) FROM results").fetchone()[0]
    coach_mentions = conn.execute("SELECT COUNT(*) FROM person_coach_mentions").fetchone()[0]
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
    print("snatch hands: one (verified)")
finally:
    conn.close()
PY

node --test tests/*.test.mjs
node scripts/snapshot.mjs "$DB_PATH" "$OUT_DIR"
node scripts/competition-cards.mjs "$OUT_DIR"
node scripts/person-activities-list.mjs "$OUT_DIR"

test -s "$OUT_DIR/index.html"
test -s "$OUT_DIR/results.html"
test -s "$OUT_DIR/coaches.html"
test -s "$OUT_DIR/style.css"
find "$OUT_DIR" -maxdepth 1 -type f -name 'c-*.html' -print -quit | grep -q .
find "$OUT_DIR" -maxdepth 1 -type f -name 'a-*.html' -print -quit | grep -q .
find "$OUT_DIR" -maxdepth 1 -type f -name 'p-*.html' -print -quit | grep -q .

touch "$OUT_DIR/.nojekyll"

echo "Static site built in $OUT_DIR/"
