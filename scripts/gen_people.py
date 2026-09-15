#!/usr/bin/env python3
"""Генерирует SQL для персон и исторических связей тренер–спортсмен.

Источник правды для тренера — строка конкретного протокола в data/*.json, а не
athletes.coach: спортсмен общий для нескольких турниров, поэтому одно поле не
может хранить историю смены тренера.

Запуск:
    python3 scripts/gen_people.py > .local/people.sql
"""

from __future__ import annotations

import glob
import json

SELF_MARKERS = {
    "-", "—", "–", "Самостоя.С.", "Самостоятельно", "самостоятельно",
}


def esc(value: str | None) -> str:
    if value is None:
        return "NULL"
    return "'" + str(value).replace("'", "''") + "'"


def split_name(full: str) -> tuple[str, str, str | None]:
    parts = full.split()
    return parts[0], parts[1], " ".join(parts[2:]) or None


def athlete_sql(full_name: str, born: str, names_without_middle: bool = False) -> str:
    last, first, middle = split_name(full_name)
    year = int(born.split(".")[-1])
    conditions = [
        f"last_name = {esc(last)}",
        f"first_name = {esc(first)}",
        f"birth_year = {year}",
    ]
    if middle is not None:
        conditions.insert(2, f"middle_name = {esc(middle)}")
    elif not names_without_middle:
        conditions.insert(2, "middle_name IS NULL")
    return "(SELECT id FROM athletes WHERE " + " AND ".join(conditions) + " LIMIT 1)"


def coach_names(raw: str | None) -> list[str]:
    if not raw:
        return []
    names = []
    for token in raw.split(","):
        name = token.strip().replace(". ", ".")
        if name and name not in SELF_MARKERS:
            names.append(name)
    return names


def coach_slug(name: str) -> str:
    return "coach-" + name.encode("utf-8").hex()


def load_protocols():
    for path in sorted(glob.glob("data/*.json")):
        if path.endswith("merges.json"):
            continue
        data = json.load(open(path, encoding="utf-8"))
        if "competition" not in data or "categories" not in data:
            continue
        yield data


def main() -> None:
    protocols = list(load_protocols())
    coaches: set[str] = set()
    links: set[tuple[str, str, str]] = set()
    mentions: set[tuple[str, str, str, str]] = set()

    for data in protocols:
        comp_slug = data["competition"]["slug"]
        names_without_middle = bool(data.get("source", {}).get("names_without_middle", False))
        for category in data["categories"]:
            for row in category.get("rows", []):
                full_name, born, raw_coach = row[1], row[2], row[10]
                athlete = athlete_sql(full_name, born, names_without_middle)
                for coach in coach_names(raw_coach):
                    coaches.add(coach)
                    links.add((coach, athlete, full_name))
                    mentions.add((coach, athlete, full_name, comp_slug))

    print("-- Сгенерировано scripts/gen_people.py из data/*.json. Не править руками.")
    print("-- История тренеров берётся из строк конкретных протоколов.\n")

    print("INSERT OR IGNORE INTO persons (slug, display_name, birth_year, region_id)")
    print("SELECT s.slug, a.full_name, a.birth_year, a.region_id")
    print("FROM athletes a")
    print("JOIN athlete_slugs s ON s.athlete_id = a.id AND s.is_current = 1")
    print("WHERE a.merged_into_id IS NULL;\n")

    print("INSERT OR IGNORE INTO person_athletes (person_id, athlete_id)")
    print("SELECT p.id, a.id")
    print("FROM athletes a")
    print("JOIN athlete_slugs s ON s.athlete_id = COALESCE(a.merged_into_id, a.id) AND s.is_current = 1")
    print("JOIN persons p ON p.slug = s.slug;\n")

    if coaches:
        print("INSERT OR IGNORE INTO persons (slug, display_name) VALUES")
        values = [f"  ({esc(coach_slug(name))}, {esc(name)})" for name in sorted(coaches)]
        print(",\n".join(values) + ";\n")

    for coach, athlete, _ in sorted(links):
        print("INSERT OR IGNORE INTO person_coach_athletes (person_id, athlete_id)")
        print(
            f"SELECT (SELECT id FROM persons WHERE slug = {esc(coach_slug(coach))}), {athlete} "
            f"WHERE {athlete} IS NOT NULL;"
        )
    print()

    for coach, athlete, _, comp_slug in sorted(mentions):
        print("INSERT OR IGNORE INTO person_coach_mentions (person_id, athlete_id, competition_id)")
        print(
            f"SELECT (SELECT id FROM persons WHERE slug = {esc(coach_slug(coach))}), {athlete}, "
            f"(SELECT id FROM competitions WHERE slug = {esc(comp_slug)}) "
            f"WHERE {athlete} IS NOT NULL;"
        )


if __name__ == "__main__":
    main()
