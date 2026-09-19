#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

DB_PATH=".local/girevoy.db"
OUT_DIR="dist"

rm -rf "$OUT_DIR"

# Состав базы — data/protocols.json. Тот же скрипт стоит за `npm run db:local`,
# поэтому локальная база и статический снимок не могут разойтись по набору протоколов.
python3 scripts/build_db.py --db "$DB_PATH"

node --test tests/*.test.mjs
node scripts/snapshot.mjs "$DB_PATH" "$OUT_DIR"
node scripts/competition-cards.mjs "$OUT_DIR"
node scripts/person-activities-list.mjs "$OUT_DIR"

test -s "$OUT_DIR/index.html"
test -s "$OUT_DIR/results.html"
test -s "$OUT_DIR/coaches.html"
test -s "$OUT_DIR/style.css"
test -s "$OUT_DIR/robots.txt"
test -s "$OUT_DIR/sitemap.xml"
test -s "$OUT_DIR/404.html"
grep -q '<meta name="robots" content="noindex, nofollow">' "$OUT_DIR/404.html"
! grep -q '/404.html' "$OUT_DIR/sitemap.xml"
grep -q 'rel="canonical" href="https://vsegiri.com/"' "$OUT_DIR/index.html"
grep -q 'rel="canonical" href="https://vsegiri.com/results.html"' "$OUT_DIR/results.html"
find "$OUT_DIR" -maxdepth 1 -type f -name 'c-*.html' -print -quit | grep -q .
find "$OUT_DIR" -maxdepth 1 -type f -name 'a-*.html' -print -quit | grep -q .
find "$OUT_DIR" -maxdepth 1 -type f -name 'p-*.html' -print -quit | grep -q .

touch "$OUT_DIR/.nojekyll"

echo "Static site built in $OUT_DIR/"
