-- Написания тренера, встреченные в протоколах.
--
-- Одного человека печатают `Барков А.П.`, `Барков А.П` и `Барков А. П.`, а карточка
-- показывает одно написание. Остальные нельзя ни выбросить, ни держать полем персоны:
-- написание — факт конкретного протокола, поэтому строка привязана к соревнованию.
-- Нормализацию написаний делает scripts/gen_people.py; сюда попадает то, что напечатано.
CREATE TABLE person_coach_aliases (
  person_id      INTEGER NOT NULL REFERENCES persons(id) ON DELETE CASCADE,
  raw_name       TEXT    NOT NULL,
  competition_id INTEGER NOT NULL REFERENCES competitions(id) ON DELETE CASCADE,
  PRIMARY KEY (person_id, raw_name, competition_id)
);
