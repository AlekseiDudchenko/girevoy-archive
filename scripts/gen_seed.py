#!/usr/bin/env python3
"""Сид с реальными данными протокола: JSON из data/ → SQL.

Запуск: python3 scripts/gen_seed.py data/<файл>.json > seeds/<номер>-<slug>.sql

Регионы, клубы и федерации вставляются через INSERT OR IGNORE и берутся обратно
по имени: они общие для всех протоколов, и второй турнир из того же региона не
должен заводить его заново. BASE сдвигает id остальных таблиц — так сиды разных
протоколов не сталкиваются в одной базе.
"""
import json
import sys

BASE = 0  # сдвиг id; задаётся полем source.id_base — следующему протоколу 1000, 2000, …

RANKS = {
    "III": "iii", "II": "ii", "I": "i",
    "КМС": "kms", "МС": "ms", "МСМК": "msmk", "ЗМС": "zms",
}
TRANSLIT = str.maketrans({
    "а": "a", "б": "b", "в": "v", "г": "g", "д": "d", "е": "e", "ё": "e",
    "ж": "zh", "з": "z", "и": "i", "й": "y", "к": "k", "л": "l", "м": "m",
    "н": "n", "о": "o", "п": "p", "р": "r", "с": "s", "т": "t", "у": "u",
    "ф": "f", "х": "h", "ц": "c", "ч": "ch", "ш": "sh", "щ": "sch",
    "ъ": "", "ы": "y", "ь": "", "э": "e", "ю": "yu", "я": "ya", " ": "-",
})

out = []
w = out.append


def esc(v):
    if v is None:
        return "NULL"
    if isinstance(v, bool):
        return str(int(v))
    if isinstance(v, (int, float)):
        return str(v)
    return "'" + str(v).replace("'", "''") + "'"


def insert(table, cols, rows):
    if not rows:
        return
    w(f"INSERT INTO {table} ({', '.join(cols)}) VALUES")
    w(",\n".join("  (" + ", ".join(v if isinstance(v, Raw) else esc(v) for v in r) + ")"
                 for r in rows) + ";")
    w("")


class Raw(str):
    """Подставляется в SQL как есть — для подзапросов по справочникам."""


def region_name(raw):
    """«г. Санкт-Петербург, Самарская область» → первый регион; полная запись
    остаётся в results.raw_region."""
    return raw.split(",")[0].strip()


def region_id(name):
    return Raw(f"(SELECT id FROM regions WHERE name = {esc(region_name(name))} "
               f"AND country = 'RU')")


def club_id(name, region):
    return Raw(f"(SELECT id FROM clubs WHERE name = {esc(name)} "
               f"AND region_id = {region_id(region)})")


def ref(table, code, col="code"):
    return Raw(f"(SELECT id FROM {table} WHERE {col} = {esc(code)})")


def rank_id(label):
    if not label or label == "-":
        return None
    code = RANKS.get(label.lstrip("+"))
    return ref("sport_ranks", code) if code else None


def athlete_key_sql(key, alias=""):
    last, first, middle, year = key
    a = alias + "." if alias else ""
    middle_cond = (f"{a}middle_name IS NULL" if middle is None
                   else f"{a}middle_name = {esc(middle)}")
    return (f"{a}last_name = {esc(last)} AND {a}first_name = {esc(first)} "
            f"AND {middle_cond} AND {a}birth_year = {year}")


def athlete_id(key):
    return Raw(f"(SELECT id FROM athletes WHERE {athlete_key_sql(key)})")


def exists_athlete(key):
    return f"(SELECT 1 FROM athletes a WHERE {athlete_key_sql(key, 'a')})"


def split_name(full):
    """«Хамидов Фахриддин Фарход угли» → (Хамидов, Фахриддин, Фарход угли)."""
    parts = full.split()
    return parts[0], parts[1], " ".join(parts[2:]) or None


def main(path):
    global BASE
    data = json.load(open(path, encoding="utf-8"))
    comp = data["competition"]
    src = data["source"]
    BASE = src.get("id_base", 0)

    w(f"-- {comp['name']}, {comp['city']}, {comp['date_start']}"
      f"{'—' + comp['date_end'] if comp.get('date_end') else ''}.")
    w(f"-- Сгенерировано scripts/gen_seed.py из {path}, не править руками.")
    w(f"-- {src['note']}")
    w("-- Данные извлечены из скана протокола моделью; сверка человеком не проводилась,")
    w("-- поэтому results.verified_by остаётся пустым (FR-A14).")
    w("")

    # --- справочники: имена могут уже быть в базе от другого протокола
    regions, clubs = [], []
    for cat in data["categories"]:
        for r in cat["rows"]:
            reg = region_name(r[4])
            if reg not in regions:
                regions.append(reg)
            if (r[5], reg) not in clubs:
                clubs.append((r[5], reg))

    w("INSERT OR IGNORE INTO regions (name, country) VALUES")
    w(",\n".join(f"  ({esc(r)}, 'RU')" for r in regions) + ";")
    w("")
    w("INSERT OR IGNORE INTO clubs (name, region_id) VALUES")
    w(",\n".join(f"  ({esc(c)}, {region_id(reg)})" for c, reg in clubs) + ";")
    w("")
    w("INSERT OR IGNORE INTO federations (name, short_name, country) VALUES")
    w(f"  ({esc(comp['federation'])}, 'ВФГС', 'RU');")
    w("")

    # --- соревнование и протокол
    cid = BASE + 1
    insert("competitions",
           ["id", "slug", "name", "date_start", "date_end", "city", "country",
            "competition_rank_id", "federation_id", "source_url", "is_published"],
           [(cid, comp["slug"], comp["name"], comp["date_start"], comp.get("date_end"),
             comp["city"], comp["country"],
             ref("competition_ranks", comp["competition_rank"]),
             Raw(f"(SELECT id FROM federations WHERE name = {esc(comp['federation'])})"),
             comp.get("source_url"), 1)])

    pid = BASE + 1
    insert("protocols",
           ["id", "competition_id", "r2_key", "filename", "page_count", "is_scan",
            "status", "published_at"],
           [(pid, cid, f"protocols/{comp['slug']}.pdf", src["filename"],
             src["page_count"], 1 if src["is_scan"] else 0, "published",
             comp["date_start"])])

    # --- категории
    cats, order = [], 0
    for cat in data["categories"]:
        order += 1
        wc = cat["weight_class"]
        cats.append((BASE + order, cid, ref("disciplines", cat["discipline"]), cat["sex"],
                     ref("age_groups", "adult"), None, cat["bell_kg"], cat["hands"],
                     cat["time_limit_min"], wc, int(wc.rstrip("+")),
                     1 if wc.endswith("+") else 0, len(cat["rows"]), 0, order,
                     cat["page"]))
    for d in data.get("deferred", []):
        order += 1
        cats.append((BASE + order, cid, ref("disciplines", d["discipline"]), d["sex"],
                     ref("age_groups", "adult"), None, d["bell_kg"], d["hands"],
                     d["time_limit_min"], d["weight_class"], None, 0, None, 1, 90 + order,
                     d["page"]))
    insert("categories",
           ["id", "competition_id", "discipline_id", "sex", "age_group_id", "division_id",
            "bell_kg", "hands", "time_limit_min", "weight_class_raw", "weight_class_kg",
            "weight_class_is_open", "participants_declared", "is_deferred", "sort_order"],
           [c[:-1] for c in cats])
    cat_page = {c[0]: c[-1] for c in cats}

    # --- спортсмены: ключ — фамилия, имя, отчество и год рождения.
    # Человек выступает не на одном турнире, поэтому запись общая для всех
    # протоколов: второй протокол не заводит её заново, а находит по ключу.
    athletes, index = [], {}
    for cat in data["categories"]:
        for r in cat["rows"]:
            last, first, middle = split_name(r[1])
            year = int(r[2].split(".")[-1])
            key = (last, first, middle, year)
            if key in index:
                continue
            index[key] = athlete_id(key)
            athletes.append((key, last, first, middle, year, cat["sex"],
                             region_id(r[4]), club_id(r[5], r[4]), r[10], rank_id(r[3])))

    w("-- Спортсмен заводится, только если его ещё нет: тот же человек на другом")
    w("-- турнире — та же строка athletes, иначе карточка и график разъедутся надвое.")
    for a in athletes:
        cols = ["last_name", "first_name", "middle_name", "birth_year", "sex",
                "region_id", "club_id", "coach", "sport_rank_id"]
        vals = ", ".join(v if isinstance(v, Raw) else esc(v) for v in a[1:])
        w(f"INSERT INTO athletes ({', '.join(cols)})")
        w(f"  SELECT {vals}")
        w(f"  WHERE NOT EXISTS {exists_athlete(a[0])};")
    w("")

    # Слаг держит URL карточки. У знакомого спортсмена он уже есть — тогда строка
    # не добавляется; у однофамильца того же года рождения слаг разводится по id.
    seen = {}
    for a in athletes:
        base = (a[1] + "-" + a[2]).lower().translate(TRANSLIT)
        slug = f"{base}-{a[4]}"
        seen[slug] = seen.get(slug, 0) + 1
        if seen[slug] > 1:
            slug = f"{slug}-{seen[slug]}"
        w("INSERT INTO athlete_slugs (slug, athlete_id)")
        w(f"  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s"
          f" WHERE s.slug = {esc(slug)} AND s.athlete_id <> a.id)")
        w(f"              THEN {esc(slug + '-')} || a.id ELSE {esc(slug)} END, a.id")
        w(f"    FROM athletes a WHERE a.id = {index[a[0]]}")
        w("     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);")
    w("")

    # --- результаты
    results, reps = [], []
    for i, cat in enumerate(data["categories"], start=1):
        cat_id = BASE + i
        for r in cat["rows"]:
            rid = BASE + len(results) + 1
            last, first, middle = split_name(r[1])
            aid = index[(last, first, middle, int(r[2].split(".")[-1]))]
            results.append((rid, cat_id, aid, r[0], r[7], None, r[6], rank_id(r[8]),
                            ref("disciplines", cat["discipline"]), cat["bell_kg"],
                            cat["hands"], cat["time_limit_min"], cid, comp["date_start"],
                            r[1], r[5], r[4], pid, cat_page[cat_id]))
            # снятый по правилам идёт строкой без места и результата: подъёмов нет
            if r[7] is not None:
                reps.append((BASE + len(reps) + 1, rid, cat["discipline"], "both", r[7]))
    insert("results",
           ["id", "category_id", "athlete_id", "place", "total_reps", "points",
            "body_weight_kg", "rank_achieved_id", "discipline_id", "bell_kg", "hands",
            "time_limit_min", "competition_id", "event_date", "raw_name", "raw_club",
            "raw_region", "protocol_id", "source_page"], results)
    insert("result_reps", ["id", "result_id", "exercise", "hand", "reps"], reps)

    print("\n".join(out))


if __name__ == "__main__":
    main(sys.argv[1] if len(sys.argv) > 1 else "data/chempionat-rossii-2026.json")
