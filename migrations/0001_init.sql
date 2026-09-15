-- Гиревой архив — начальная схема (D1 / SQLite)
-- Решения, из которых она следует: docs/decisions.md
-- Пояснения к неочевидным местам: docs/schema.md

PRAGMA foreign_keys = ON;

-- ============================================================
-- Справочники (FR-A12)
-- ============================================================

CREATE TABLE disciplines (
  id          INTEGER PRIMARY KEY,
  code        TEXT NOT NULL UNIQUE,   -- jerk | snatch | long_cycle | biathlon
  name        TEXT NOT NULL,
  -- какие поля подъёмов заполняются у результата этой дисциплины
  exercises   TEXT NOT NULL,          -- JSON: ["jerk","snatch"]
  sort_order  INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE age_groups (
  id          INTEGER PRIMARY KEY,
  code        TEXT NOT NULL UNIQUE,   -- youth | junior | adult | veteran_40 ...
  name        TEXT NOT NULL,
  sort_order  INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE sport_ranks (               -- ЕВСК: III–I разряд, КМС, МС, МСМК, ЗМС
  id          INTEGER PRIMARY KEY,
  code        TEXT NOT NULL UNIQUE,
  name        TEXT NOT NULL,
  sort_order  INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE competition_ranks (         -- региональные, ЧР, Кубок России, ЧЕ, ЧМ
  id          INTEGER PRIMARY KEY,
  code        TEXT NOT NULL UNIQUE,
  name        TEXT NOT NULL,
  sort_order  INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE federations (
  id          INTEGER PRIMARY KEY,
  name        TEXT NOT NULL UNIQUE,
  short_name  TEXT,
  country     TEXT                      -- ISO 3166-1 alpha-2
);

CREATE TABLE regions (
  id          INTEGER PRIMARY KEY,
  name        TEXT NOT NULL,
  country     TEXT NOT NULL DEFAULT 'RU',
  UNIQUE (name, country)
);

CREATE TABLE clubs (
  id          INTEGER PRIMARY KEY,
  name        TEXT NOT NULL,
  region_id   INTEGER REFERENCES regions(id) ON DELETE SET NULL,
  UNIQUE (name, region_id)
);

-- Алиасы: в протоколах один клуб пишется пятью способами.
-- Сопоставление при извлечении идёт через эти таблицы, иначе фильтр бесполезен.
CREATE TABLE club_aliases (
  alias       TEXT PRIMARY KEY,
  club_id     INTEGER NOT NULL REFERENCES clubs(id) ON DELETE CASCADE
);

CREATE TABLE region_aliases (
  alias       TEXT PRIMARY KEY,
  region_id   INTEGER NOT NULL REFERENCES regions(id) ON DELETE CASCADE
);

-- ============================================================
-- Исходники и конвейер (FR-A2, A3, A4, A17, раздел 4.1)
-- ============================================================

CREATE TABLE protocols (
  id             INTEGER PRIMARY KEY,
  competition_id INTEGER REFERENCES competitions(id) ON DELETE SET NULL,
  r2_key         TEXT NOT NULL UNIQUE,   -- исходный PDF в R2
  filename       TEXT NOT NULL,
  page_count     INTEGER,
  is_scan        INTEGER NOT NULL DEFAULT 0,
  -- загружен → распознан → проверен → опубликован | отклонён
  status         TEXT NOT NULL DEFAULT 'uploaded'
                 CHECK (status IN ('uploaded','extracted','verified','published','rejected')),
  reject_reason  TEXT,                   -- заполняется при status='rejected' (FR-A4)
  uploaded_at    TEXT NOT NULL DEFAULT (datetime('now')),
  published_at   TEXT
);

CREATE INDEX idx_protocols_status ON protocols(status);

-- Два независимых прогона распознавания (FR-A17).
-- raw_json хранится как есть: его форма меняется с каждой правкой промпта,
-- нормализовать его незачем.
CREATE TABLE extraction_runs (
  id             INTEGER PRIMARY KEY,
  protocol_id    INTEGER NOT NULL REFERENCES protocols(id) ON DELETE CASCADE,
  run_no         INTEGER NOT NULL CHECK (run_no IN (1, 2)),
  model          TEXT NOT NULL,
  prompt_version TEXT NOT NULL,
  raw_json       TEXT,                   -- JSON-вывод модели
  error          TEXT,
  started_at     TEXT NOT NULL DEFAULT (datetime('now')),
  finished_at    TEXT,
  UNIQUE (protocol_id, run_no)
);

-- ============================================================
-- Соревнования и категории-зачёты
-- ============================================================

CREATE TABLE competitions (
  id                  INTEGER PRIMARY KEY,
  slug                TEXT NOT NULL UNIQUE,   -- устойчивый URL (FR-X3)
  name                TEXT NOT NULL,
  date_start          TEXT NOT NULL,          -- YYYY-MM-DD
  date_end            TEXT,
  city                TEXT,
  country             TEXT NOT NULL DEFAULT 'RU',
  competition_rank_id INTEGER REFERENCES competition_ranks(id) ON DELETE SET NULL,
  federation_id       INTEGER REFERENCES federations(id) ON DELETE SET NULL,
  source_url          TEXT,                   -- ссылка на первоисточник (FR-C6)
  is_published        INTEGER NOT NULL DEFAULT 0,
  created_at          TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at          TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE INDEX idx_competitions_date ON competitions(date_start DESC);
CREATE INDEX idx_competitions_pub  ON competitions(is_published, date_start DESC);

-- Разрез внутри соревнования, внутри которого разыгрываются места.
-- Весовая категория хранится в том виде, в каком стоит в протоколе (решение 5),
-- плюс разобранное число и признак «+» — для автопроверки и фильтров.
CREATE TABLE categories (
  id                   INTEGER PRIMARY KEY,
  competition_id       INTEGER NOT NULL REFERENCES competitions(id) ON DELETE CASCADE,
  discipline_id        INTEGER NOT NULL REFERENCES disciplines(id),
  sex                  TEXT NOT NULL CHECK (sex IN ('m','f','mixed')),
  age_group_id         INTEGER REFERENCES age_groups(id),
  bell_kg              INTEGER NOT NULL,      -- 8 / 12 / 16 / 24 / 32
  time_limit_min       INTEGER NOT NULL DEFAULT 10,
  weight_class_raw     TEXT,                  -- «до 63», «+95», «63,0» — как в протоколе
  weight_class_kg      INTEGER,               -- 63, 95
  weight_class_is_open INTEGER NOT NULL DEFAULT 0,  -- 1 для «+95»
  participants_declared INTEGER,              -- заявлено в протоколе, для автопроверки FR-A5
  -- FR-C7: категория есть в протоколе, но не оцифрована (эстафета и командный зачёт)
  is_deferred          INTEGER NOT NULL DEFAULT 0,
  sort_order           INTEGER NOT NULL DEFAULT 0,
  UNIQUE (competition_id, discipline_id, sex, age_group_id,
          bell_kg, time_limit_min, weight_class_raw)
);

CREATE INDEX idx_categories_competition ON categories(competition_id, sort_order);

-- ============================================================
-- Спортсмены (FR-S1, A7, A13, X3)
-- ============================================================

CREATE TABLE athletes (
  id              INTEGER PRIMARY KEY,
  last_name       TEXT NOT NULL,
  first_name      TEXT NOT NULL,
  middle_name     TEXT,
  full_name       TEXT GENERATED ALWAYS AS (
                    last_name || ' ' || first_name ||
                    CASE WHEN middle_name IS NULL OR middle_name = ''
                         THEN '' ELSE ' ' || middle_name END
                  ) STORED,
  birth_year      INTEGER,
  sex             TEXT CHECK (sex IN ('m','f')),
  region_id       INTEGER REFERENCES regions(id) ON DELETE SET NULL,
  club_id         INTEGER REFERENCES clubs(id) ON DELETE SET NULL,
  coach           TEXT,
  sport_rank_id   INTEGER REFERENCES sport_ranks(id) ON DELETE SET NULL,
  -- слияние дублей (FR-A13). Обратимо: запись остаётся, ссылка снимается.
  merged_into_id  INTEGER REFERENCES athletes(id) ON DELETE SET NULL,
  created_at      TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE INDEX idx_athletes_name  ON athletes(last_name, first_name, birth_year);
CREATE INDEX idx_athletes_merge ON athletes(merged_into_id) WHERE merged_into_id IS NOT NULL;

-- Все адреса, которые когда-либо вели на этого спортсмена.
-- Держит FR-X3 при переименовании и FR-A13 при слиянии.
CREATE TABLE athlete_slugs (
  slug        TEXT PRIMARY KEY,
  athlete_id  INTEGER NOT NULL REFERENCES athletes(id) ON DELETE CASCADE,
  is_current  INTEGER NOT NULL DEFAULT 1
);

CREATE INDEX idx_athlete_slugs_current ON athlete_slugs(athlete_id, is_current);

-- ============================================================
-- Результаты
-- ============================================================

CREATE TABLE results (
  id              INTEGER PRIMARY KEY,
  category_id     INTEGER NOT NULL REFERENCES categories(id) ON DELETE CASCADE,
  athlete_id      INTEGER NOT NULL REFERENCES athletes(id) ON DELETE RESTRICT,
  place           INTEGER,

  -- подъёмы. Заполняются те, что предусмотрены дисциплиной (disciplines.exercises)
  jerk_reps       INTEGER,
  snatch_reps     INTEGER,               -- сумма обеими руками
  snatch_left     INTEGER,
  snatch_right    INTEGER,
  long_cycle_reps INTEGER,
  points          REAL,                  -- очки двоеборья: берутся из протокола, не считаются (решение 6)

  body_weight_kg  REAL,                  -- личный вес на взвешивании (решение 7)
  rank_achieved_id INTEGER REFERENCES sport_ranks(id) ON DELETE SET NULL,

  -- денормализованный ключ серии: по нему идут все фильтры и график прогресса
  discipline_id   INTEGER NOT NULL REFERENCES disciplines(id),
  bell_kg         INTEGER NOT NULL,
  time_limit_min  INTEGER NOT NULL,
  competition_id  INTEGER NOT NULL REFERENCES competitions(id) ON DELETE CASCADE,
  event_date      TEXT NOT NULL,

  -- сырьё из протокола: то, что написано в PDF, до сопоставления со справочниками
  raw_name        TEXT,
  raw_club        TEXT,
  raw_region      TEXT,

  -- происхождение (FR-A14)
  protocol_id     INTEGER REFERENCES protocols(id) ON DELETE SET NULL,
  source_page     INTEGER,
  verified_by     TEXT,
  verified_at     TEXT
);

-- Фильтры публичной таблицы (FR-F2) и сортировка внутри серии
CREATE INDEX idx_results_series     ON results(discipline_id, bell_kg, time_limit_min);
-- График прогресса спортсмена (FR-S3, V1)
CREATE INDEX idx_results_athlete    ON results(athlete_id, event_date);
-- Итоговая таблица категории (FR-C2)
CREATE INDEX idx_results_category   ON results(category_id, place);
CREATE INDEX idx_results_competition ON results(competition_id);
-- Поиск дублей внутри категории — намеренно НЕ UNIQUE, см. docs/schema.md
CREATE INDEX idx_results_dup_check  ON results(category_id, athlete_id);

-- ============================================================
-- Проблемы: автопроверки и расхождения прогонов (FR-A5, A6, A8, A17)
-- ============================================================

CREATE TABLE issues (
  id           INTEGER PRIMARY KEY,
  protocol_id  INTEGER NOT NULL REFERENCES protocols(id) ON DELETE CASCADE,
  category_id  INTEGER REFERENCES categories(id) ON DELETE CASCADE,
  result_id    INTEGER REFERENCES results(id) ON DELETE CASCADE,
  kind         TEXT NOT NULL CHECK (kind IN (
                 'place_order',        -- места не по убыванию результата
                 'row_count',          -- строк не столько, сколько участников
                 'body_weight',        -- личный вес не укладывается в категорию
                 'duplicate',          -- спортсмен дважды в одной категории
                 'implausible',        -- неправдоподобное число подъёмов
                 'run_mismatch'        -- прогоны 1 и 2 разошлись (FR-A17)
               )),
  field        TEXT,                   -- какое поле, для run_mismatch
  message      TEXT NOT NULL,
  run1_value   TEXT,
  run2_value   TEXT,
  status       TEXT NOT NULL DEFAULT 'open' CHECK (status IN ('open','reviewed')),
  created_at   TEXT NOT NULL DEFAULT (datetime('now')),
  reviewed_by  TEXT,
  reviewed_at  TEXT
);

-- FR-A8: публиковать можно, только когда по протоколу нет issues со status='open'
CREATE INDEX idx_issues_open ON issues(protocol_id, status);
CREATE INDEX idx_issues_result ON issues(result_id);

-- ============================================================
-- История правок (FR-A15, приоритет C — таблица заводится сразу, пишется с начала)
-- ============================================================

CREATE TABLE edits (
  id          INTEGER PRIMARY KEY,
  entity      TEXT NOT NULL,           -- results | athletes | competitions | categories
  entity_id   INTEGER NOT NULL,
  field       TEXT NOT NULL,
  old_value   TEXT,
  new_value   TEXT,
  changed_by  TEXT,
  changed_at  TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE INDEX idx_edits_entity ON edits(entity, entity_id, changed_at DESC);
