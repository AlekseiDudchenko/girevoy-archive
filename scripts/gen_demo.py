#!/usr/bin/env python3
"""Генератор демонстрационных данных для seeds/0002_demo.sql.

Все соревнования и спортсмены вымышленные. Данные нужны, чтобы разрабатывать
и показывать интерфейс до того, как заработает извлечение из PDF.

Запуск: python3 scripts/gen_demo.py > seeds/0002_demo.sql
"""
import random
import sys

rnd = random.Random(20240915)

SURNAMES = [
    "Астахов", "Белозёров", "Вьюгин", "Гордеев", "Дьяконов", "Ерохин",
    "Жарков", "Зимин", "Ильчук", "Кравец", "Лемешев", "Мещеряков",
    "Наумов", "Осипчук", "Пахомов", "Рыбаков", "Сотников", "Тарасюк",
    "Ушаков", "Федотов", "Хабаров", "Цветков", "Чалый", "Шестопалов",
]
NAMES_M = ["Артём", "Борис", "Виктор", "Глеб", "Денис", "Егор", "Кирилл",
           "Леонид", "Матвей", "Никита", "Олег", "Павел", "Роман", "Семён"]
NAMES_F = ["Алина", "Варвара", "Дарья", "Евгения", "Ксения", "Марина",
           "Нина", "Ольга", "Полина", "Рада", "Светлана", "Ульяна"]
PATRONYMIC_M = ["Андреевич", "Викторович", "Ильич", "Максимович",
                "Олегович", "Петрович", "Сергеевич", "Юрьевич"]
PATRONYMIC_F = ["Андреевна", "Викторовна", "Ильинична", "Максимовна",
                "Олеговна", "Петровна", "Сергеевна", "Юрьевна"]

REGIONS = [
    (1, "Тульская область", "RU"), (2, "Республика Татарстан", "RU"),
    (3, "Свердловская область", "RU"), (4, "Краснодарский край", "RU"),
    (5, "Санкт-Петербург", "RU"), (6, "Новосибирская область", "RU"),
    (7, "Казахстан", "KZ"), (8, "Беларусь", "BY"), (9, "Латвия", "LV"),
]
CLUBS = [
    (1, "СШОР № 2", 1), (2, "Гиревой клуб «Засека»", 1),
    (3, "ЦСП «Барс»", 2), (4, "СК «Уралец»", 3),
    (5, "СШОР «Олимп»", 4), (6, "ГК «Нева»", 5),
    (7, "СК «Сибирь»", 6), (8, "ГК «Астана»", 7),
    (9, "СК «Неман»", 8), (10, "KB Riga", 9),
]
CLUB_ALIASES = [
    ("СШОР-2", 1), ("СШОР №2 г. Тула", 1), ("Тула, СШОР 2", 1),
    ("Засека", 2), ("ГК Засека", 2),
    ("ЦСП Барс", 3), ("Барс, Казань", 3),
    ("Уралец", 4), ("СК Уралец Екб", 4),
    ("Олимп", 5), ("Нева", 6), ("Сибирь", 7),
    ("Astana KB", 8), ("Неман", 9), ("Riga KB", 10),
]
FEDERATIONS = [
    (1, "Всероссийская федерация гиревого спорта", "ВФГС", "RU"),
    (2, "International Union of Kettlebell Lifting", "IUKL", None),
]

out = []
w = out.append


def esc(v):
    if v is None:
        return "NULL"
    if isinstance(v, (int, float)):
        return str(v)
    return "'" + str(v).replace("'", "''") + "'"


def insert(table, cols, rows):
    if not rows:
        return
    w(f"INSERT INTO {table} ({', '.join(cols)}) VALUES")
    body = [",\n".join("  (" + ", ".join(esc(v) for v in r) + ")" for r in rows)]
    w(body[0] + ";")
    w("")


# ---------------------------------------------------------------- спортсмены
athletes = []
used = set()
aid = 0
for _ in range(60):
    sex = "m" if rnd.random() < 0.72 else "f"
    while True:
        sur = rnd.choice(SURNAMES)
        if sex == "f":
            sur = sur + "а"
        first = rnd.choice(NAMES_M if sex == "m" else NAMES_F)
        patr = rnd.choice(PATRONYMIC_M if sex == "m" else PATRONYMIC_F)
        year = rnd.randint(1972, 2009)
        if (sur, first, year) not in used:
            used.add((sur, first, year))
            break
    aid += 1
    region = rnd.choice(REGIONS)
    club = rnd.choice([c for c in CLUBS if c[2] == region[0]] or CLUBS)
    athletes.append({
        "id": aid, "last": sur, "first": first, "patr": patr,
        "year": year, "sex": sex, "region": region[0], "club": club[0],
        "coach": rnd.choice(SURNAMES) + " " + rnd.choice(PATRONYMIC_M)[0] + ".",
        "rank": rnd.choice([None, 2, 3, 4, 4, 5]),
    })


def slug(a):
    table = str.maketrans({
        "а": "a", "б": "b", "в": "v", "г": "g", "д": "d", "е": "e", "ё": "e",
        "ж": "zh", "з": "z", "и": "i", "й": "y", "к": "k", "л": "l", "м": "m",
        "н": "n", "о": "o", "п": "p", "р": "r", "с": "s", "т": "t", "у": "u",
        "ф": "f", "х": "h", "ц": "c", "ч": "ch", "ш": "sh", "щ": "sch",
        "ъ": "", "ы": "y", "ь": "", "э": "e", "ю": "yu", "я": "ya",
    })
    base = (a["last"] + "-" + a["first"]).lower().translate(table)
    return f"{base}-{a['year']}"


# ------------------------------------------------------------ соревнования
# Категория: (дисциплина, пол, возраст, дивизион, вес гири, руки, минуты, вес.кат)
competitions = [
    {
        "id": 1, "slug": "kubok-demo-goroda-2024", "name": "Кубок Демо-города 2024",
        "date": "2024-03-16", "city": "Демо-город", "country": "RU",
        "rank": 1, "fed": 1, "published": 1, "status": "published",
        "cats": [
            (1, "m", 3, None, 24, "two", 10, "до 73"),
            (1, "m", 3, None, 24, "two", 10, "до 85"),
            (1, "m", 3, None, 24, "two", 10, "+95"),
            (3, "f", 3, None, 16, "two", 10, "до 63"),
            (2, "m", 3, None, 24, "two", 10, "до 85"),
        ],
    },
    {
        "id": 2, "slug": "pervenstvo-demo-oblasti-2025", "name": "Первенство Демо-области 2025",
        "date": "2025-02-08", "city": "Демо-город", "country": "RU",
        "rank": 1, "fed": 1, "published": 1, "status": "published",
        "cats": [
            (1, "m", 1, None, 16, "two", 5, "до 63"),
            (1, "m", 2, None, 24, "two", 10, "до 73"),
            (3, "f", 1, None, 12, "two", 5, "до 58"),
        ],
    },
    {
        "id": 3, "slug": "demo-open-international-2025", "name": "Demo Open International 2025",
        "date": "2025-06-14", "city": "Demo City", "country": "LV",
        "rank": 5, "fed": 2, "published": 1, "status": "published",
        "cats": [
            (1, "m", 3, 3, 32, "two", 10, "до 85"),
            (1, "m", 3, 2, 24, "two", 10, "до 85"),
            (2, "m", 3, 2, 28, "one", 30, "до 85"),   # длинный цикл одной рукой, полумарафон
            (3, "f", 3, 2, 16, "two", 10, "до 63"),
            (2, "m", 3, 1, 16, "two", 10, "+95"),     # новички
        ],
    },
    {
        "id": 4, "slug": "kubok-demo-goroda-2025", "name": "Кубок Демо-города 2025",
        "date": "2025-11-22", "city": "Демо-город", "country": "RU",
        "rank": 1, "fed": 1, "published": 0, "status": "extracted",  # ждёт сверки
        "cats": [
            (1, "m", 3, None, 24, "two", 10, "до 73"),
            (1, "m", 3, None, 24, "two", 10, "до 85"),
        ],
    },
]

WEIGHT_M = {"до 63": 63, "до 68": 68, "до 73": 73, "до 78": 78,
            "до 85": 85, "до 95": 95, "+95": 95}
WEIGHT_F = {"до 58": 58, "до 63": 63, "до 68": 68, "+68": 68}

series_history = {}   # (дисциплина, гиря, руки, минуты) -> кто уже выступал
cat_rows, result_rows, reps_rows, issue_rows = [], [], [], []
cat_id = res_id = reps_id = issue_id = 0
appearances = {}

for comp in competitions:
    # спортсмен выступает в одной весовой категории на турнир и дисциплину
    taken = {}
    for order, (disc, sex, age, div, bell, hands, minutes, wclass) in enumerate(comp["cats"], 1):
        cat_id += 1
        wmap = WEIGHT_M if sex == "m" else WEIGHT_F
        pool = [a for a in athletes if a["sex"] == sex]
        if age == 1:
            pool = [a for a in pool if a["year"] >= 2006]
        elif age == 2:
            pool = [a for a in pool if 2002 <= a["year"] <= 2007]
        else:
            pool = [a for a in pool if a["year"] <= 2003]
        busy = taken.setdefault((comp["id"], disc), set())
        pool = [a for a in pool if a["id"] not in busy]
        size = min(len(pool), rnd.randint(5, 9))

        # большинство состава — те, кто уже выступал в этой же серии:
        # так на карточке спортсмена появляется линия, а не одинокая точка
        skey = (disc, bell, hands, minutes)
        seen = series_history.setdefault(skey, set())
        returning = [a for a in pool if a["id"] in seen]
        fresh = [a for a in pool if a["id"] not in seen]
        want_back = min(len(returning), int(size * 0.7))
        entrants = rnd.sample(returning, want_back)
        entrants += rnd.sample(fresh, min(len(fresh), size - want_back))
        busy.update(a["id"] for a in entrants)
        seen.update(a["id"] for a in entrants)

        rows = []
        for a in entrants:
            # база результата зависит от веса гири и регламента
            scale = minutes / 10 * (24 / bell) ** 0.8
            if disc == 1:      # двоеборье
                jerk = max(20, int(rnd.gauss(58, 11) * scale))
                snatch = max(24, int(rnd.gauss(84, 15) * scale))
                pts = round(jerk + 0.5 * snatch, 1)
                rows.append((a, None, pts, [("jerk", "both", jerk), ("snatch", "both", snatch)]))
            elif disc == 2 and hands == "one":
                left = max(30, int(rnd.gauss(96, 16) * scale))
                right = max(30, int(rnd.gauss(100, 16) * scale))
                rows.append((a, left + right, None,
                             [("long_cycle", "left", left), ("long_cycle", "right", right)]))
            elif disc == 2:
                lc = max(20, int(rnd.gauss(52, 10) * scale))
                rows.append((a, lc, None, [("long_cycle", "both", lc)]))
            else:              # рывок
                left = max(20, int(rnd.gauss(64, 12) * scale))
                right = max(20, int(rnd.gauss(66, 12) * scale))
                rows.append((a, left + right, None,
                             [("snatch", "left", left), ("snatch", "right", right)]))

        rows.sort(key=lambda r: r[2] if r[2] is not None else r[1], reverse=True)

        cat_rows.append((
            cat_id, comp["id"], disc, sex, age, div, bell, hands, minutes,
            wclass, wmap.get(wclass), 1 if wclass.startswith("+") else 0,
            len(rows), 0, order,
        ))

        limit = wmap.get(wclass) or 95
        for place, (a, total, pts, reps) in enumerate(rows, 1):
            res_id += 1
            bw = round(limit - rnd.uniform(0.2, 2.4), 1) if not wclass.startswith("+") \
                else round(limit + rnd.uniform(1.0, 12.0), 1)
            result_rows.append((
                res_id, cat_id, a["id"], place, total, pts, bw,
                a["rank"] if rnd.random() < 0.4 else None,
                disc, bell, hands, minutes, comp["id"], comp["date"],
                f'{a["last"]} {a["first"][0]}.{a["patr"][0]}.',
                next(c[1] for c in CLUBS if c[0] == a["club"]),
                next(r[1] for r in REGIONS if r[0] == a["region"]),
                comp["id"], rnd.randint(1, 6),
                "admin" if comp["published"] else None,
                comp["date"] if comp["published"] else None,
            ))
            appearances.setdefault(a["id"], 0)
            appearances[a["id"]] += 1
            for ex, hand, n in reps:
                reps_id += 1
                reps_rows.append((reps_id, res_id, ex, hand, n))

# отложенная категория: эстафета на международном старте (FR-C7)
cat_id += 1
cat_rows.append((cat_id, 3, 1, "m", 3, None, 24, "two", 10, "эстафета", None, 0,
                 None, 1, 99))

# протокол, который ждёт сверки, — с открытыми проблемами (FR-A5, A17)
demo_issues = [
    ("run_mismatch", "snatch_reps", "Прогоны разошлись: 142 и 112", "142", "112"),
    ("place_order", None, "Место 4 выше места 3 при меньшем результате", None, None),
    ("body_weight", "body_weight_kg", "Личный вес 74,8 вне категории «до 73»", None, None),
    ("implausible", "jerk_reps", "Толчок 340 подъёмов — неправдоподобно", None, None),
]
unverified = [r for r in result_rows if r[12] == 4][:4]
for (kind, field, msg, v1, v2), row in zip(demo_issues, unverified):
    issue_id += 1
    issue_rows.append((issue_id, 4, row[1], row[0], kind, field, msg, v1, v2, "open"))

# ---------------------------------------------------------------- вывод
w("-- ДЕМОНСТРАЦИОННЫЕ ДАННЫЕ. Соревнования и спортсмены вымышленные.")
w("-- Сгенерировано scripts/gen_demo.py, детерминированно. Не для публикации.")
w("")

insert("regions", ["id", "name", "country"], REGIONS)
insert("clubs", ["id", "name", "region_id"], CLUBS)
insert("club_aliases", ["alias", "club_id"], CLUB_ALIASES)
insert("federations", ["id", "name", "short_name", "country"], FEDERATIONS)

insert("athletes",
       ["id", "last_name", "first_name", "middle_name", "birth_year", "sex",
        "region_id", "club_id", "coach", "sport_rank_id"],
       [(a["id"], a["last"], a["first"], a["patr"], a["year"], a["sex"],
         a["region"], a["club"], a["coach"], a["rank"]) for a in athletes])

insert("athlete_slugs", ["slug", "athlete_id"],
       [(slug(a), a["id"]) for a in athletes])

insert("competitions",
       ["id", "slug", "name", "date_start", "city", "country",
        "competition_rank_id", "federation_id", "source_url", "is_published"],
       [(c["id"], c["slug"], c["name"], c["date"], c["city"], c["country"],
         c["rank"], c["fed"], f'https://example.org/protocols/{c["slug"]}.pdf',
         c["published"]) for c in competitions])

insert("protocols",
       ["id", "competition_id", "r2_key", "filename", "page_count", "status", "published_at"],
       [(c["id"], c["id"], f'protocols/{c["slug"]}.pdf', f'{c["slug"]}.pdf',
         rnd.randint(3, 9), c["status"],
         c["date"] if c["published"] else None) for c in competitions])

insert("extraction_runs",
       ["protocol_id", "run_no", "model", "prompt_version", "finished_at"],
       [(c["id"], n, "demo-model", "v1", c["date"])
        for c in competitions for n in (1, 2)])

insert("categories",
       ["id", "competition_id", "discipline_id", "sex", "age_group_id", "division_id",
        "bell_kg", "hands", "time_limit_min", "weight_class_raw", "weight_class_kg",
        "weight_class_is_open", "participants_declared", "is_deferred", "sort_order"],
       cat_rows)

insert("results",
       ["id", "category_id", "athlete_id", "place", "total_reps", "points",
        "body_weight_kg", "rank_achieved_id", "discipline_id", "bell_kg", "hands",
        "time_limit_min", "competition_id", "event_date", "raw_name", "raw_club",
        "raw_region", "protocol_id", "source_page", "verified_by", "verified_at"],
       result_rows)

insert("result_reps", ["id", "result_id", "exercise", "hand", "reps"], reps_rows)

insert("issues",
       ["id", "protocol_id", "category_id", "result_id", "kind", "field",
        "message", "run1_value", "run2_value", "status"],
       issue_rows)

multi = sum(1 for v in appearances.values() if v > 1)
w(f"-- Итого: {len(competitions)} соревнования, {len(cat_rows)} категорий, "
  f"{len(result_rows)} результатов, {len(athletes)} спортсменов")
w(f"-- Выступают более чем на одном турнире: {multi} — на них проверяется график прогресса")

sys.stdout.write("\n".join(out) + "\n")
