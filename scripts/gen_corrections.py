#!/usr/bin/env python3
"""Materialize public source corrections from data/*.json into the edits table."""
import glob
import json
import sys

CATEGORY_FIELDS = {
    "bell_kg", "hands", "time_limit_min", "weight_class_raw", "weight_class_kg",
    "weight_class_is_open", "sex", "age_group_id", "division_id", "discipline_id",
}
ATHLETE_FIELDS = {
    "birth_year", "last_name", "first_name", "middle_name", "region_id", "club_id",
    "coach", "sport_rank_id",
}
COMPETITION_FIELDS = {"name", "date_start", "date_end", "city", "country", "federation_id"}

def esc(value):
    if value is None:
        return "NULL"
    return "'" + str(value).replace("'", "''") + "'"

def sql_list(values):
    return ", ".join(esc(value) for value in values)

def inferred_entity(warning):
    explicit = warning.get("entity") or warning.get("scope", {}).get("entity")
    if explicit:
        aliases = {"result": "results", "category": "categories", "athlete": "athletes", "competition": "competitions"}
        return aliases.get(explicit, explicit)
    field = warning.get("field")
    if field in CATEGORY_FIELDS:
        return "categories"
    if field in ATHLETE_FIELDS:
        return "athletes"
    if field in COMPETITION_FIELDS:
        return "competitions"
    return "results"

def category_filters(scope, alias="cat", discipline_alias="d"):
    where = []
    if scope.get("discipline"):
        where.append(f"{discipline_alias}.code = {esc(scope['discipline'])}")
    if scope.get("sex"):
        where.append(f"{alias}.sex = {esc(scope['sex'])}")
    if scope.get("weight_classes"):
        where.append(f"{alias}.weight_class_raw IN ({sql_list(scope['weight_classes'])})")
    if scope.get("weight_class"):
        where.append(f"{alias}.weight_class_raw = {esc(scope['weight_class'])}")
    if scope.get("hands"):
        where.append(f"{alias}.hands = {esc(scope['hands'])}")
    if scope.get("time_limit_min") is not None:
        where.append(f"{alias}.time_limit_min = {int(scope['time_limit_min'])}")
    if scope.get("bell_kg") is not None:
        where.append(f"{alias}.bell_kg = {int(scope['bell_kg'])}")
    return where

def result_filters(scope, result_alias="r"):
    where = []
    names = scope.get("athletes") or scope.get("athlete_names")
    if names:
        where.append(f"{result_alias}.raw_name IN ({sql_list(names)})")
    if scope.get("athlete"):
        where.append(f"{result_alias}.raw_name = {esc(scope['athlete'])}")
    if scope.get("places"):
        where.append(f"{result_alias}.place IN ({', '.join(str(int(v)) for v in scope['places'])})")
    if scope.get("source_pages"):
        where.append(f"{result_alias}.source_page IN ({', '.join(str(int(v)) for v in scope['source_pages'])})")
    if scope.get("result_ids"):
        where.append(f"{result_alias}.id IN ({', '.join(str(int(v)) for v in scope['result_ids'])})")
    return where

def warning_sql(comp_slug, warning):
    if warning.get("type") != "source_error_correction" or not warning.get("public") or not warning.get("correction_applied"):
        return None
    field = warning.get("field")
    if not field or "id" not in warning:
        return None
    entity = inferred_entity(warning)
    scope = warning.get("scope") or {}
    changed_by = f"source_correction:{warning['id']}"
    old_value = warning.get("source_value")
    new_value = warning.get("corrected_value")

    if entity == "competitions":
        from_sql = "competitions c"
        target = "c.id"
        where = [f"c.slug = {esc(comp_slug)}"]
    elif entity == "categories":
        from_sql = "categories cat JOIN competitions c ON c.id = cat.competition_id JOIN disciplines d ON d.id = cat.discipline_id"
        target = "cat.id"
        where = [f"c.slug = {esc(comp_slug)}", *category_filters(scope)]
    elif entity == "results":
        from_sql = "results r JOIN categories cat ON cat.id = r.category_id JOIN competitions c ON c.id = r.competition_id JOIN disciplines d ON d.id = r.discipline_id"
        target = "r.id"
        where = [f"c.slug = {esc(comp_slug)}", *category_filters(scope), *result_filters(scope)]
    elif entity == "athletes":
        from_sql = "results r JOIN athletes a ON a.id = r.athlete_id JOIN categories cat ON cat.id = r.category_id JOIN competitions c ON c.id = r.competition_id JOIN disciplines d ON d.id = r.discipline_id"
        target = "COALESCE(a.merged_into_id, a.id)"
        where = [f"c.slug = {esc(comp_slug)}", *category_filters(scope), *result_filters(scope)]
    else:
        raise ValueError(f"Unsupported correction entity {entity!r} in {warning['id']}")

    where.append(
        f"NOT EXISTS (SELECT 1 FROM edits existing WHERE existing.entity = {esc(entity)} "
        f"AND existing.entity_id = {target} AND existing.field = {esc(field)} "
        f"AND existing.changed_by = {esc(changed_by)})"
    )
    return (
        "INSERT INTO edits (entity, entity_id, field, old_value, new_value, changed_by)\n"
        f"SELECT DISTINCT {esc(entity)}, {target}, {esc(field)}, {esc(old_value)}, {esc(new_value)}, {esc(changed_by)}\n"
        f"FROM {from_sql}\nWHERE " + "\n  AND ".join(where) + ";"
    )

def main(paths):
    statements = ["-- Публичные исправления первоисточников. Сгенерировано scripts/gen_corrections.py."]
    for path in paths:
        with open(path, encoding="utf-8") as handle:
            data = json.load(handle)
        competition = data.get("competition")
        if not competition or not competition.get("slug"):
            continue
        for warning in data.get("warnings", []):
            statement = warning_sql(competition["slug"], warning)
            if statement:
                statements.extend(["", f"-- {warning['id']}", statement])
    print("\n".join(statements))

if __name__ == "__main__":
    main(sys.argv[1:] or sorted(glob.glob("data/*.json")))
