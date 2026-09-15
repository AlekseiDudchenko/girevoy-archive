-- Публичные персоны и роли. Отдельная миграция нужна, чтобы обновить уже
-- существующую D1-базу, созданную через 0001_init.sql.

-- Одна публичная карточка человека может объединять несколько ролей. Тренер
-- не связывается со спортсменом только по совпадению ФИО: person_athletes
-- заполняется отдельно и служит подтверждённой связью.
CREATE TABLE persons (
  id           INTEGER PRIMARY KEY,
  slug         TEXT NOT NULL UNIQUE,
  display_name TEXT NOT NULL,
  birth_year   INTEGER,
  region_id    INTEGER REFERENCES regions(id) ON DELETE SET NULL,
  created_at   TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE TABLE person_athletes (
  person_id  INTEGER NOT NULL REFERENCES persons(id) ON DELETE CASCADE,
  athlete_id INTEGER NOT NULL UNIQUE REFERENCES athletes(id) ON DELETE CASCADE,
  PRIMARY KEY (person_id, athlete_id)
);

CREATE TABLE person_coach_athletes (
  person_id  INTEGER NOT NULL REFERENCES persons(id) ON DELETE CASCADE,
  athlete_id INTEGER NOT NULL REFERENCES athletes(id) ON DELETE CASCADE,
  PRIMARY KEY (person_id, athlete_id)
);

CREATE TABLE person_activities (
  id            INTEGER PRIMARY KEY,
  person_id     INTEGER NOT NULL REFERENCES persons(id) ON DELETE CASCADE,
  organization  TEXT NOT NULL,
  position      TEXT NOT NULL,
  region_id     INTEGER REFERENCES regions(id) ON DELETE SET NULL,
  date_from     TEXT,
  date_to       TEXT,
  source_url    TEXT
);

CREATE TABLE person_judge_roles (
  id             INTEGER PRIMARY KEY,
  person_id      INTEGER NOT NULL REFERENCES persons(id) ON DELETE CASCADE,
  competition_id INTEGER REFERENCES competitions(id) ON DELETE SET NULL,
  role           TEXT NOT NULL,
  source_url     TEXT
);

CREATE INDEX idx_person_coaches_person ON person_coach_athletes(person_id);
CREATE INDEX idx_person_activities_person ON person_activities(person_id);
CREATE INDEX idx_person_judges_person ON person_judge_roles(person_id);
