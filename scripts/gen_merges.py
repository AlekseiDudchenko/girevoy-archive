#!/usr/bin/env python3
"""Слияние дублей спортсменов: JSON из data/ → SQL (FR-A13).

    python3 scripts/gen_merges.py data/merges.json > seeds/0005_merges.sql

Слияние обратимо: строка дубля остаётся в athletes с merged_into_id, результаты
не переносятся, а старый slug продолжает вести на каноническую карточку.
"""
import json
import sys


def esc(v):
    return "'" + str(v).replace("'", "''") + "'"


def main(path):
    data = json.load(open(path, encoding="utf-8"))
    out = [
        "-- Слияние дублей спортсменов (FR-A13).",
        "-- Сформировано из data/merges.json; исходные результаты и raw_name не изменяются.",
        "",
        "DROP TABLE IF EXISTS _athlete_merge_map;",
        "CREATE TEMP TABLE _athlete_merge_map (canonical TEXT NOT NULL, duplicate TEXT NOT NULL, birth_year INTEGER NOT NULL);",
        "INSERT INTO _athlete_merge_map (canonical, duplicate, birth_year) VALUES",
    ]

    rows = [
        f"  ({esc(m['canonical'])}, {esc(m['duplicate'])}, {m['birth_year']})"
        for m in data["merges"]
    ]
    out.append(",\n".join(rows) + ";")
    out.extend([
        "",
        "DROP TABLE IF EXISTS _resolved_athlete_merges;",
        "CREATE TEMP TABLE _resolved_athlete_merges AS",
        "SELECT d.id AS duplicate_id, c.id AS canonical_id",
        "  FROM _athlete_merge_map m",
        "  JOIN athletes d ON d.full_name = m.duplicate AND d.birth_year = m.birth_year",
        "  JOIN athletes c ON c.full_name = m.canonical AND c.birth_year = m.birth_year;",
        "",
        "UPDATE athletes",
        "   SET merged_into_id = (SELECT r.canonical_id FROM _resolved_athlete_merges r WHERE r.duplicate_id = athletes.id)",
        " WHERE id IN (SELECT duplicate_id FROM _resolved_athlete_merges);",
        "",
        "UPDATE athlete_slugs",
        "   SET athlete_id = (SELECT r.canonical_id FROM _resolved_athlete_merges r WHERE r.duplicate_id = athlete_slugs.athlete_id),",
        "       is_current = 0",
        " WHERE athlete_id IN (SELECT duplicate_id FROM _resolved_athlete_merges);",
        "",
        "DROP TABLE _resolved_athlete_merges;",
        "DROP TABLE _athlete_merge_map;",
    ])
    print("\n".join(out))


if __name__ == "__main__":
    main(sys.argv[1] if len(sys.argv) > 1 else "data/merges.json")
