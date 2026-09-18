#!/usr/bin/env python3
"""Справочник регионов и алиасов из data/regions.json.

В протоколах один субъект записан десятком способов: «Кировская область» и
«Кировская обл.», «ЯНАО» и «Ямало-Ненецкий автономный округ». Нормализация
живёт здесь, а не в data/*.json: сырое написание остаётся в results.raw_region
как напечатано, а region_id спортсмена резолвится через region_aliases.
"""
import json
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
REGIONS_PATH = os.path.join(ROOT, "data", "regions.json")


def norm_alias(value):
    """Ключ сопоставления: регистр, ё и лишние пробелы не различают написания."""
    return " ".join(str(value).replace("ё", "е").replace("Ё", "Е").lower().split())


def load_regions(path=REGIONS_PATH):
    with open(path, encoding="utf-8") as fh:
        return json.load(fh)["regions"]


def alias_map(regions):
    """norm(написание) -> каноническое имя региона. Падает на конфликте алиасов."""
    aliases = {}
    for region in regions:
        for alias in [region["name"], *region.get("aliases", [])]:
            key = norm_alias(alias)
            if key in aliases and aliases[key] != region["name"]:
                raise ValueError(
                    f"алиас {alias!r} закреплён и за {aliases[key]!r}, и за {region['name']!r}"
                )
            aliases[key] = region["name"]
    return aliases


def esc(value):
    return "'" + str(value).replace("'", "''") + "'"


def main():
    regions = sorted(load_regions(), key=lambda r: r["name"])
    ids = {}
    for i, region in enumerate(regions, start=1):
        # Ключ regions — UNIQUE (name, country), но алиас ведёт на одно имя: пока
        # одноимённых субъектов в разных странах нет, требуем уникальности имени.
        if region["name"] in ids:
            raise ValueError(
                f"регион {region['name']!r} объявлен дважды: алиасы и id станут неоднозначны"
            )
        ids[region["name"]] = i
    aliases = alias_map(regions)

    out = [
        "-- Справочник регионов и алиасов написаний из протоколов.",
        "-- Сгенерировано scripts/gen_regions.py из data/regions.json, не править руками.",
        "-- Алиас хранится нормализованным: нижний регистр, е вместо ё, одиночные пробелы.",
        "",
        "INSERT INTO regions (id, name, country) VALUES",
    ]
    out.append(",\n".join(
        f"  ({ids[r['name']]}, {esc(r['name'])}, {esc(r.get('country', 'RU'))})" for r in regions
    ) + ";")
    out.append("")
    out.append("INSERT INTO region_aliases (alias, region_id) VALUES")
    out.append(",\n".join(
        f"  ({esc(alias)}, {ids[name]})" for alias, name in sorted(aliases.items())
    ) + ";")
    out.append("")
    sys.stdout.write("\n".join(out))


if __name__ == "__main__":
    main()
