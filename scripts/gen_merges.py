#!/usr/bin/env python3
"""Слияние дублей спортсменов: JSON из data/ → SQL (FR-A13).

    python3 scripts/gen_merges.py data/merges.json > seeds/0005_merges.sql

Дубль появляется, когда протоколы расходятся в написании ФИО: ключ склейки в
gen_seed.py — фамилия, имя, отчество и год рождения, и «Андревич» разъезжается
с «Андреевичем». Здесь такие записи сводятся к одной.

Слияние обратимо, как того требует схема: строка дубля остаётся на месте, у неё
только проставляется merged_into_id. Результаты никуда не переносятся — запросы
показывают выступления и канонической записи, и всех слитых в неё. Слаг дубля
переводится на каноническую запись с is_current = 0: адрес, который когда-то вёл
на спортсмена, продолжает открывать его карточку.

Сид идёт последним: он опирается на записи, вставленные сидами протоколов.
"""
import json
import sys


def esc(v):
    return "'" + str(v).replace("'", "''") + "'"


def split_name(full):
    parts = full.split()
    return parts[0], parts[1], " ".join(parts[2:]) or None


def athlete_sql(full_name, year):
    last, first, middle = split_name(full_name)
    middle_cond = "middle_name IS NULL" if middle is None else f"middle_name = {esc(middle)}"
    return (f"(SELECT id FROM athletes WHERE last_name = {esc(last)} "
            f"AND first_name = {esc(first)} AND {middle_cond} AND birth_year = {year})")


def main(path):
    data = json.load(open(path, encoding="utf-8"))
    out = ["-- Слияние дублей спортсменов (FR-A13).",
           f"-- Сгенерировано scripts/gen_merges.py из {path}, не править руками.",
           f"-- {data['note']}", ""]

    for m in data["merges"]:
        canonical = athlete_sql(m["canonical"], m["birth_year"])
        duplicate = athlete_sql(m["duplicate"], m["birth_year"])
        out.append(f"-- {m['duplicate']} → {m['canonical']}, {m['birth_year']} г. р.")
        out.append(f"-- {m['reason']}")
        out.append(f"UPDATE athletes SET merged_into_id = {canonical}")
        out.append(f" WHERE id = {duplicate} AND {canonical} IS NOT NULL;")
        out.append("")
        out.append("UPDATE athlete_slugs")
        out.append(f"   SET athlete_id = {canonical}, is_current = 0")
        out.append(f" WHERE athlete_id = {duplicate} AND {canonical} IS NOT NULL;")
        out.append("")

    print("\n".join(out))


if __name__ == "__main__":
    main(sys.argv[1] if len(sys.argv) > 1 else "data/merges.json")
