#!/usr/bin/env python3
"""Генерирует SQL для персон и исторических связей тренер–спортсмен."""
from __future__ import annotations
import glob
import json

SELF_MARKERS = {"-", "—", "–", "Самостоя.С.", "Самостоятельно", "самостоятельно"}


def esc(value: str | None) -> str:
    if value is None: return "NULL"
    return "'" + str(value).replace("'", "''") + "'"


def split_name(full: str) -> tuple[str, str, str | None]:
    parts = full.split()
    return parts[0], parts[1], " ".join(parts[2:]) or None


def athlete_sql(full_name: str, born: str, names_without_middle: bool = False) -> str:
    last, first, middle = split_name(full_name); year = int(born.split(".")[-1])
    conditions = [f"last_name = {esc(last)}", f"first_name = {esc(first)}", f"birth_year = {year}"]
    if middle is not None: conditions.insert(2, f"middle_name = {esc(middle)}")
    elif not names_without_middle: conditions.insert(2, "middle_name IS NULL")
    return "(SELECT id FROM athletes WHERE " + " AND ".join(conditions) + " LIMIT 1)"


def normalize_coach_name(name: str) -> str:
    return name.strip().replace(". ", ".")


def load_person_rules() -> tuple[dict[str, str], dict[str, list[str]]]:
    try:
        data = json.load(open("data/person_merges.json", encoding="utf-8"))
    except FileNotFoundError:
        return {}, {}

    merges: dict[str, str] = {}
    for item in data.get("merges", []):
        duplicate = item["duplicate"].strip()
        canonical = normalize_coach_name(item["canonical"])
        merges[duplicate] = canonical
        merges[normalize_coach_name(duplicate)] = canonical

    splits: dict[str, list[str]] = {}
    for item in data.get("splits", []):
        source = item["source"].strip()
        persons = [normalize_coach_name(name) for name in item["persons"]]
        splits[source] = persons
        splits[normalize_coach_name(source)] = persons
    return merges, splits


def load_role_links() -> dict[str, dict[str, object]]:
    try:
        data = json.load(open("data/person_role_links.json", encoding="utf-8"))
    except FileNotFoundError:
        return {}

    links: dict[str, dict[str, object]] = {}
    for item in data.get("coach_athlete_links", []):
        coach = normalize_coach_name(item["coach"])
        links[coach] = {
            "athlete": item["athlete"].strip(),
            "birth_year": int(item["birth_year"]),
        }
    return links


def split_coach_value(value: str, splits: dict[str, list[str]]) -> list[str] | None:
    value = value.strip()
    return splits.get(value, splits.get(normalize_coach_name(value)))


def coach_names(raw: str | None, merges: dict[str, str], splits: dict[str, list[str]]) -> list[str]:
    if not raw: return []

    raw_value = raw.strip()
    parts = split_coach_value(raw_value, splits)
    if parts is None:
        parts = []
        for token in raw_value.split(","):
            token = token.strip()
            token_parts = split_coach_value(token, splits)
            parts.extend(token_parts if token_parts is not None else [token])

    names=[]
    for part in parts:
        normalized=normalize_coach_name(part)
        if normalized and normalized not in SELF_MARKERS:
            names.append(merges.get(part.strip(), merges.get(normalized, normalized)))
    return names


def coach_slug(name: str) -> str: return "coach-" + name.encode("utf-8").hex()


def athlete_person_sql(full_name: str, birth_year: int) -> str:
    last, first, middle = split_name(full_name)
    conditions = [f"a.last_name = {esc(last)}", f"a.first_name = {esc(first)}", f"a.birth_year = {birth_year}"]
    if middle is not None:
        conditions.insert(2, f"a.middle_name = {esc(middle)}")
    else:
        conditions.insert(2, "a.middle_name IS NULL")
    return "(SELECT pa.person_id FROM athletes a JOIN person_athletes pa ON pa.athlete_id = COALESCE(a.merged_into_id, a.id) WHERE " + " AND ".join(conditions) + " LIMIT 1)"


def coach_person_sql(coach: str, role_links: dict[str, dict[str, object]]) -> str:
    link = role_links.get(coach)
    if link:
        return athlete_person_sql(str(link["athlete"]), int(link["birth_year"]))
    return f"(SELECT id FROM persons WHERE slug = {esc(coach_slug(coach))})"


def load_protocols():
    for path in sorted(glob.glob("data/*.json")):
        if path.endswith("merges.json") or path.endswith("person_role_links.json"): continue
        data=json.load(open(path,encoding="utf-8"))
        if "competition" not in data or "categories" not in data: continue
        slug=data["competition"]["slug"]
        for category_path in sorted(glob.glob(f"data/categories/{slug}/*.json")):
            fragment=json.load(open(category_path,encoding="utf-8"))
            data["categories"].append(fragment["category"] if "category" in fragment else fragment)
        yield data


def main() -> None:
    protocols=list(load_protocols()); merges,splits=load_person_rules(); role_links=load_role_links(); coaches:set[str]=set(); links:set[tuple[str,str,str]]=set(); mentions:set[tuple[str,str,str,str]]=set()
    for data in protocols:
        comp_slug=data["competition"]["slug"]
        names_without_middle=bool(data.get("source",{}).get("names_without_middle",False))
        for category in data["categories"]:
            for row in category.get("rows",[]):
                full_name,born,raw_coach=row[1],row[2],row[10]
                athlete=athlete_sql(full_name,born,names_without_middle)
                for coach in coach_names(raw_coach, merges, splits):
                    coaches.add(coach); links.add((coach,athlete,full_name)); mentions.add((coach,athlete,full_name,comp_slug))
    print("-- Сгенерировано scripts/gen_people.py из data/*.json и data/categories/. Не править руками.")
    print("-- История тренеров берётся из строк конкретных протоколов.\n")
    print("INSERT OR IGNORE INTO persons (slug, display_name, birth_year, region_id)")
    print("SELECT s.slug, a.full_name, a.birth_year, a.region_id FROM athletes a")
    print("JOIN athlete_slugs s ON s.athlete_id = a.id AND s.is_current = 1 WHERE a.merged_into_id IS NULL;\n")
    print("INSERT OR IGNORE INTO person_athletes (person_id, athlete_id)")
    print("SELECT p.id, a.id FROM athletes a")
    print("JOIN athlete_slugs s ON s.athlete_id = COALESCE(a.merged_into_id, a.id) AND s.is_current = 1")
    print("JOIN persons p ON p.slug = s.slug;\n")
    standalone_coaches = [name for name in sorted(coaches) if name not in role_links]
    if standalone_coaches:
        print("INSERT OR IGNORE INTO persons (slug, display_name) VALUES")
        print(",\n".join(f"  ({esc(coach_slug(name))}, {esc(name)})" for name in standalone_coaches) + ";\n")
    for coach,athlete,_ in sorted(links):
        person=coach_person_sql(coach, role_links)
        print("INSERT OR IGNORE INTO person_coach_athletes (person_id, athlete_id)")
        print(f"SELECT {person}, {athlete} WHERE {person} IS NOT NULL AND {athlete} IS NOT NULL;")
    print()
    for coach,athlete,_,comp_slug in sorted(mentions):
        person=coach_person_sql(coach, role_links)
        print("INSERT OR IGNORE INTO person_coach_mentions (person_id, athlete_id, competition_id)")
        print(f"SELECT {person}, {athlete}, (SELECT id FROM competitions WHERE slug = {esc(comp_slug)}) WHERE {person} IS NOT NULL AND {athlete} IS NOT NULL;")


if __name__ == "__main__": main()
