#!/usr/bin/env python3
"""Генерирует SQL для персон и исторических связей тренер–спортсмен."""
from __future__ import annotations
import glob
import json
import re

SELF_MARKERS: set[str] = {"-", "—", "–", "Самостоя.С.", "Самостоятельно", "самостоятельно"}
COACH_NAME_RE = re.compile(r"[А-ЯЁ][А-Яа-яЁё-]+\s*[А-ЯЁ]\.\s*[А-ЯЁ]\.?", re.UNICODE)


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
    """Свести написание тренера к виду «Фамилия И.О.».

    Протоколы печатают одного тренера десятком способов, и каждое написание заводило
    отдельную персону: `Барков А.П` и `Барков А.П.` — две карточки одного человека.
    Разницу в пунктуации снимает нормализация; заводить на неё правила в
    data/person_merges.json нельзя — правило привязано к конкретному написанию в
    конкретном протоколе, а следующий протокол напечатает по-своему.

    Выбор между `ё` и `е` тут не делается: оба написания корректны, и какое из них
    показывать — решает canonical_spelling() уже по всему списку.
    """
    name = re.sub(r"\s+", " ", name.strip())
    # Пробел перед запятой, а за ней инициалы: `Фёдоров ,В.Н`. Запятая тут не
    # разделитель тренеров, а опечатка: строка делилась по ней, и один тренер
    # становился двумя фантомными персонами — «Фёдоров» и «В.Н.». Пробел перед
    # запятой и есть признак опечатки: в настоящем перечислении (`Мощев, А.Е.
    # Попова`) его не ставят, поэтому такие ячейки правило не трогает.
    name = re.sub(r"(?<=[а-яё])\s+,\s*(?=[А-ЯЁ]\.)", " ", name)
    # Точка вместо пробела перед инициалами: `Танаев.Ю.М.`
    name = re.sub(r"(?<=[а-яё])\.(?=[А-ЯЁ]\.)", " ", name)
    # Пропущенный пробел перед инициалами: `ДягилевА.В.`
    name = re.sub(r"(?<=[а-яё])(?=[А-ЯЁ]\.)", " ", name)
    name = name.replace(". ", ".")
    name = re.sub(r"(?<=[А-ЯЁ])\s*,\s*(?=[А-ЯЁ]\.)", ".", name)
    name = re.sub(r"\.{2,}", ".", name)
    # Пропущенная точка после последнего инициала: `Барков А.П`, `Смирнов А`
    return re.sub(r"(?<=[\s.][А-ЯЁ])$", ".", name)


def fold_yo(name: str) -> str:
    """Ключ написания без `ё`, в обоих регистрах.

    `str.replace("ё", "е")` не трогает заглавную `Ё`, и фамилия, начинающаяся с неё,
    уезжала в собственную группу: `Ёлькин Ю.Г.` и `Елькин Ю.Г.` оставались двумя
    персонами, хотя ради таких пар canonical_spelling() и написан.
    """
    return name.replace("ё", "е").replace("Ё", "Е")


def canonical_spelling(names: set[str], confirmed: set[str] | None = None) -> dict[str, str]:
    """Выбрать одно написание на группу, различающуюся только `ё`/`е`.

    `Пономарев Д.В.` и `Пономарёв Д.В.` — один тренер, но нормализация их не сводит:
    оба написания законны, и выкидывать `ё` из публичной карточки незачем. Поэтому
    группа собирается по ключу без `ё`, а показывается та форма, где `ё` есть — так
    же, как это выбиралось руками в data/person_merges.json (`Алфёрова В.Я.`,
    `Соловьёв А.В.`, `Семёнов А.Н.`).

    Написание, подтверждённое правилом в data/person_role_links.json, сильнее печати:
    про такого тренера известно полное имя из внешнего источника, а адрес его карточки
    собран из имени. Одна печать `Ажермачёв А.Б.` в Кубке России 2017 иначе переименовала
    бы `Ажермачев А.Б.`, чьё имя подтверждено профилем, и увела бы адрес карточки.
    """
    confirmed = confirmed or set()
    groups: dict[str, set[str]] = {}
    for name in names:
        groups.setdefault(fold_yo(name), set()).add(name)
    resolved = {}
    for key, variants in groups.items():
        preferred = sorted(variants, key=lambda n: (n not in confirmed, n == fold_yo(n), n))[0]
        for variant in variants:
            resolved[variant] = preferred
    return resolved


def apply_spelling(rules: dict, spelling: dict[str, str]) -> dict:
    """Перевести ключи правил в написание, выбранное canonical_spelling().

    Правило в data/person_role_links.json привязано к написанию, а `ё`/`е` выбирается
    уже по всему списку тренеров: стоит новому протоколу напечатать `Ажермачёв А.Б.`,
    и профиль, заведённый на `Ажермачев А.Б.`, перестаёт срабатывать молча. Ключ
    сопоставляется без `ё`, как и сама группа написаний.
    """
    canonical = {fold_yo(name): preferred for name, preferred in spelling.items()}
    return {canonical.get(fold_yo(key), key): value for key, value in rules.items()}


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


def load_role_data() -> tuple[dict[str, dict[str, object]], dict[str, dict[str, object]]]:
    try:
        data = json.load(open("data/person_role_links.json", encoding="utf-8"))
    except FileNotFoundError:
        return {}, {}

    links: dict[str, dict[str, object]] = {}
    for item in data.get("coach_athlete_links", []):
        coach = normalize_coach_name(item["coach"])
        links[coach] = {
            "athlete": item["athlete"].strip(),
            "birth_year": int(item["birth_year"]),
        }

    profiles: dict[str, dict[str, object]] = {}
    for item in data.get("coach_profiles", []):
        coach = normalize_coach_name(item["coach"])
        profiles[coach] = {
            "display_name": item["display_name"].strip(),
            "birth_year": int(item["birth_year"]) if item.get("birth_year") is not None else None,
            "activities": item.get("activities", []),
        }
    return links, profiles


# `Самостоя.С.` после нормализации становится `Самостоя С.` и перестаёт совпадать
# с исходным маркером — сравниваем с обеими формами.
SELF_MARKERS |= {normalize_coach_name(marker) for marker in SELF_MARKERS}


def has_surname(name: str) -> bool:
    """Есть ли в токене фамилия, а не одни заглавные буквы.

    Остаток неудачного разбора выглядит как тренер и заводит персону: ячейка
    `Эмирасанов Э.К.,ШВ.` из КР-2021 давала карточку тренера «ШВ.» с живым
    спортсменом. Восстановить, что там было напечатано, нечем, а фамилии в
    огрызке нет — значит, это и не имя. Признак: две строчные буквы подряд;
    по всем протоколам под правило попадает ровно `ШВ.`, записано в ERRATA.md.
    """
    return re.search(r"[а-яё]{2}", name) is not None


def split_coach_value(value: str, splits: dict[str, list[str]]) -> list[str] | None:
    value = value.strip()
    return splits.get(value, splits.get(normalize_coach_name(value)))


def split_coach_token(token: str, splits: dict[str, list[str]]) -> list[str]:
    token = token.strip()
    explicit = split_coach_value(token, splits)
    if explicit is not None:
        return explicit
    matches = [normalize_coach_name(m.group(0)) for m in COACH_NAME_RE.finditer(token)]
    if len(matches) > 1:
        return matches
    return [token]


def coach_mentions(raw: str | None, merges: dict[str, str],
                   splits: dict[str, list[str]]) -> list[tuple[str, str]]:
    """Пары «канонический тренер, написание из протокола».

    Написание сохраняется до нормализации: именно оно напечатано в протоколе и
    показывается в карточке тренера. Когда в одной ячейке склеены два тренера,
    точное написание каждого из них восстановить нельзя — тогда написанием
    считается разобранный фрагмент.
    """
    if not raw: return []

    raw_value = raw.strip()
    parts = split_coach_value(raw_value, splits)
    if parts is not None:
        pairs = [(part, part) for part in parts]
    else:
        pairs = []
        # Перевод строки разделяет тренеров и снимается до нормализации: она схлопывает
        # его в пробел, и `Виноградов М.\nМарков И.` склеивается в одну персону.
        # А запятая — наоборот: между инициалами (`Ковалевский А,А.`) она часть имени
        # и превращается в точку именно нормализацией, поэтому строку сначала
        # нормализуем и только потом делим по запятой.
        for line in raw_value.split("\n"):
            parsed = []
            for token in re.split(r"[,;]", normalize_coach_name(line)):
                parsed.extend(split_coach_token(token, splits))
            # Один тренер на строку — написание известно точно, это сама строка.
            # Несколько — восстановить, какой кусок строки чей, нельзя: запятая между
            # инициалами (`Ковалевский А,А.`) не разделитель, и делить сырую строку
            # ради написаний означало бы снова ломать разбор.
            if len(parsed) == 1:
                pairs.append((parsed[0], line.strip()))
            else:
                pairs.extend((part, part) for part in parsed)

    mentions=[]
    for part, printed in pairs:
        normalized=normalize_coach_name(part)
        if normalized and normalized not in SELF_MARKERS and has_surname(normalized):
            mentions.append((merges.get(part.strip(), merges.get(normalized, normalized)), printed))
    return mentions


def coach_names(raw: str | None, merges: dict[str, str], splits: dict[str, list[str]]) -> list[str]:
    return [coach for coach, _ in coach_mentions(raw, merges, splits)]


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
    protocols=list(load_protocols()); merges,splits=load_person_rules(); role_links,profiles=load_role_data(); coaches:set[str]=set(); links:set[tuple[str,str,str]]=set(); mentions:set[tuple[str,str,str,str]]=set(); aliases:set[tuple[str,str,str]]=set()
    for data in protocols:
        comp_slug=data["competition"]["slug"]
        names_without_middle=bool(data.get("source",{}).get("names_without_middle",False))
        for category in data["categories"]:
            for row in category.get("rows",[]):
                full_name,born,raw_coach=row[1],row[2],row[10]
                athlete=athlete_sql(full_name,born,names_without_middle)
                for coach,printed in coach_mentions(raw_coach, merges, splits):
                    coaches.add(coach); links.add((coach,athlete,full_name)); mentions.add((coach,athlete,full_name,comp_slug))
                    aliases.add((coach,printed,comp_slug))
    spelling=canonical_spelling(coaches,set(role_links)|set(profiles))
    role_links=apply_spelling(role_links,spelling); profiles=apply_spelling(profiles,spelling)
    coaches={spelling[c] for c in coaches}
    links={(spelling[c],a,n) for c,a,n in links}
    mentions={(spelling[c],a,n,s) for c,a,n,s in mentions}
    aliases={(spelling[c],printed,s) for c,printed,s in aliases}
    print("-- Сгенерировано scripts/gen_people.py из data/*.json и data/categories/. Не править руками.")
    print("-- История тренеров берётся из строк конкретных протоколов.\n")
    print("INSERT OR IGNORE INTO persons (slug, display_name, birth_year, region_id)")
    print("SELECT s.slug, a.full_name, a.birth_year, a.region_id FROM athletes a")
    print("JOIN athlete_slugs s ON s.athlete_id = a.id AND s.is_current = 1 WHERE a.merged_into_id IS NULL;\n")
    print("INSERT OR IGNORE INTO person_athletes (person_id, athlete_id)")
    print("SELECT p.id, a.id FROM athletes a")
    print("JOIN athlete_slugs s ON s.athlete_id = COALESCE(a.merged_into_id, a.id) AND s.is_current = 1")
    print("JOIN persons p ON p.slug = s.slug;\n")
    for coach in sorted(role_links):
        person=coach_person_sql(coach, role_links)
        print(f"DELETE FROM persons WHERE slug = {esc(coach_slug(coach))} AND {person} IS NOT NULL;")
    if role_links:
        print()
    standalone_coaches = [name for name in sorted(coaches) if name not in role_links]
    if standalone_coaches:
        print("INSERT OR IGNORE INTO persons (slug, display_name, birth_year) VALUES")
        values=[]
        for name in standalone_coaches:
            profile=profiles.get(name,{})
            display_name=str(profile.get("display_name") or name)
            birth_year=profile.get("birth_year")
            values.append(f"  ({esc(coach_slug(name))}, {esc(display_name)}, {birth_year if birth_year is not None else 'NULL'})")
        print(",\n".join(values) + ";\n")
    for coach,profile in sorted(profiles.items()):
        if coach not in coaches or coach in role_links: continue
        for activity in profile.get("activities", []):
            person=coach_person_sql(coach, role_links)
            print("INSERT INTO person_activities (person_id, organization, position, date_from, date_to, source_url)")
            print(f"SELECT {person}, {esc(activity['organization'])}, {esc(activity['position'])}, {esc(activity.get('date_from'))}, {esc(activity.get('date_to'))}, {esc(activity.get('source_url'))} WHERE {person} IS NOT NULL;")
    if profiles:
        print()
    for coach,athlete,_ in sorted(links):
        person=coach_person_sql(coach, role_links)
        print("INSERT OR IGNORE INTO person_coach_athletes (person_id, athlete_id)")
        print(f"SELECT {person}, {athlete} WHERE {person} IS NOT NULL AND {athlete} IS NOT NULL;")
    print()
    for coach,athlete,_,comp_slug in sorted(mentions):
        person=coach_person_sql(coach, role_links)
        print("INSERT OR IGNORE INTO person_coach_mentions (person_id, athlete_id, competition_id)")
        print(f"SELECT {person}, {athlete}, (SELECT id FROM competitions WHERE slug = {esc(comp_slug)}) WHERE {person} IS NOT NULL AND {athlete} IS NOT NULL;")
    print()
    for coach,printed,comp_slug in sorted(aliases):
        person=coach_person_sql(coach, role_links)
        print("INSERT OR IGNORE INTO person_coach_aliases (person_id, raw_name, competition_id)")
        print(f"SELECT {person}, {esc(printed)}, (SELECT id FROM competitions WHERE slug = {esc(comp_slug)}) WHERE {person} IS NOT NULL;")


if __name__ == "__main__": main()
