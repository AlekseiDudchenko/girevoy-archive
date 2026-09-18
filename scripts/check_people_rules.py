#!/usr/bin/env python3
"""Проверка правил идентификации тренеров против строк протоколов.

    python3 scripts/check_people_rules.py            # проверить, вывести сводку
    python3 scripts/check_people_rules.py --report   # плюс список подозрительных имён

Правила в data/person_merges.json и data/person_role_links.json применяются
сопоставлением строки целиком: gen_people.py ищет raw-значение тренера среди ключей
merges/splits. Правило, которое ни с чем не совпало, не срабатывает и молчит — ровно
как слияние спортсменов, не нашедшее пары по full_name + birth_year (FR-A13). Достаточно
переизвлечь протокол или поправить пробел в raw-строке, чтобы правило тихо вышло из игры,
а склейка двух тренеров вернулась.

Поэтому каждое правило обязано срабатывать хотя бы на одной строке протокола. Это
проверяется на каждой сборке базы: scripts/build_db.py зовёт verify() перед генерацией.

Подозрительные имена (склейка, отсутствие инициалов, инициалы впереди) сборку не роняют:
это кандидаты на разбор для аудита персон, а не поломка. Они печатаются числом всегда
и списком по --report.
"""
from __future__ import annotations
import argparse
import contextlib
import json
import os
import re
import sys
from collections import Counter
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import gen_people as people

ROOT = Path(__file__).resolve().parent.parent
PERSON_MERGES = ROOT / "data" / "person_merges.json"
ROLE_LINKS = ROOT / "data" / "person_role_links.json"


def raw_coach_values() -> list[str]:
    """Все raw-значения тренера из протоколов — в том виде, в каком их видит gen_people."""
    values = []
    for protocol in people.load_protocols():
        for category in protocol.get("categories", []):
            for row in category.get("rows", []):
                if len(row) > 10 and row[10]:
                    values.append(str(row[10]))
    return values


def rules_fired(raws: list[str], splits: dict[str, list[str]]) -> tuple[set[str], Counter]:
    """Какие split-правила сработали и сколько раз встретился каждый выведенный тренер."""
    merges, _ = people.load_person_rules()
    fired: set[str] = set()
    coaches: Counter = Counter()
    for raw in raws:
        value = raw.strip()
        if people.split_coach_value(value, splits):
            fired.update((value, people.normalize_coach_name(value)))
        else:
            for token in re.split(r"[,;]", people.normalize_coach_name(value)):
                token = token.strip()
                if people.split_coach_value(token, splits):
                    fired.update((token, people.normalize_coach_name(token)))
        for coach in people.coach_names(raw, merges, splits):
            coaches[coach] += 1
    return fired, coaches


def check_merges(data: dict, raws: list[str]) -> list[str]:
    errors = []
    seen: dict[str, str] = {}

    for item in data.get("merges", []):
        duplicate, canonical = item["duplicate"].strip(), people.normalize_coach_name(item["canonical"])
        if duplicate == item["canonical"].strip():
            errors.append(f"merge {duplicate!r} → сам в себя")
        if duplicate in seen and seen[duplicate] != canonical:
            errors.append(f"merge {duplicate!r} объявлен дважды: {seen[duplicate]!r} и {canonical!r}")
        seen[duplicate] = canonical

        # Правило срабатывает, только если написание действительно встречается в протоколах.
        variants = {duplicate, people.normalize_coach_name(duplicate)}
        if not any(v in raw or v in people.normalize_coach_name(raw) for raw in raws for v in variants):
            errors.append(f"merge {duplicate!r} → {canonical!r}: написание не встречается ни в одном протоколе")

        # Цепочка: канонический тренер сам объявлен дублем другого правила.
        if canonical in {i["duplicate"].strip() for i in data.get("merges", [])}:
            errors.append(f"цепочка merge: {canonical!r} одновременно канонический и дубль")

    return errors


def check_splits(data: dict, fired: set[str]) -> list[str]:
    errors = []
    for item in data.get("splits", []):
        source = item["source"].strip()
        if source not in fired and people.normalize_coach_name(source) not in fired:
            errors.append(f"split {source!r}: не срабатывает ни на одной строке протокола")
        if len(item["persons"]) < 2:
            errors.append(f"split {source!r}: меньше двух персон — это merge, а не split")
    return errors


def check_role_links(coaches: Counter) -> list[str]:
    """Связи ролей и профили должны указывать на реально существующего тренера."""
    if not ROLE_LINKS.exists():
        return []
    data = json.loads(ROLE_LINKS.read_text(encoding="utf-8"))
    errors = []
    for key, section in (("coach", "coach_athlete_links"), ("coach", "coach_profiles")):
        for item in data.get(section, []):
            coach = people.normalize_coach_name(item[key])
            if coach not in coaches:
                errors.append(f"{section}: тренера {coach!r} нет среди выведенных из протоколов")
    return errors


SUSPICIOUS = (
    (lambda n: "." not in n, "без инициалов"),
    (lambda n: re.search(r"[а-яё][А-ЯЁ]", n) is not None, "склейка без пробела"),
    (lambda n: re.match(r"^[А-ЯЁ]\.", n) is not None, "инициалы впереди"),
    (lambda n: len(people.COACH_NAME_RE.findall(n)) > 1, "похоже на две фамилии"),
)


def suspicious(coaches: Counter) -> list[tuple[str, int, list[str]]]:
    found = []
    for name in sorted(coaches):
        flags = [label for test, label in SUSPICIOUS if test(name)]
        if flags:
            found.append((name, coaches[name], flags))
    return found


@contextlib.contextmanager
def at_root():
    """gen_people читает data/ относительно текущего каталога."""
    previous = os.getcwd()
    os.chdir(ROOT)
    try:
        yield
    finally:
        os.chdir(previous)


def verify(report: bool = False) -> None:
    """Проверить правила тренеров; при ошибке — выйти с сообщением."""
    with at_root():
        _verify(report)


def _verify(report: bool) -> None:
    data = json.loads(PERSON_MERGES.read_text(encoding="utf-8")) if PERSON_MERGES.exists() else {}
    _, splits = people.load_person_rules()
    raws = raw_coach_values()
    fired, coaches = rules_fired(raws, splits)

    errors = check_merges(data, raws) + check_splits(data, fired) + check_role_links(coaches)
    errors = list(dict.fromkeys(errors))
    if errors:
        sys.exit("Правила тренеров не срабатывают:\n  " + "\n  ".join(errors))

    odd = suspicious(coaches)
    print(f"правила тренеров сходятся с data/: merge {len(data.get('merges', []))}, "
          f"split {len(data.get('splits', []))}; тренеров {len(coaches)}, "
          f"подозрительных имён {len(odd)}")
    if report and odd:
        print("\nКандидаты на разбор в аудите персон:")
        for name, count, flags in odd:
            print(f"  {name!r} — упоминаний {count}, {', '.join(flags)}")


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--report", action="store_true",
                    help="вывести список подозрительных имён тренеров")
    verify(ap.parse_args().report)


if __name__ == "__main__":
    main()
