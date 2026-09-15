-- Публичные персоны и роли из уже загруженных протоколов.
-- Спортсмены получают персону по устойчивому текущему athlete_slug.
INSERT OR IGNORE INTO persons (slug, display_name, birth_year, region_id)
SELECT s.slug, a.full_name, a.birth_year, a.region_id
FROM athletes a
JOIN athlete_slugs s ON s.athlete_id = a.id AND s.is_current = 1
WHERE a.merged_into_id IS NULL;

INSERT OR IGNORE INTO person_athletes (person_id, athlete_id)
SELECT p.id, a.id
FROM athletes a
JOIN athlete_slugs s
  ON s.athlete_id = COALESCE(a.merged_into_id, a.id) AND s.is_current = 1
JOIN persons p ON p.slug = s.slug;

-- Разделяем перечисления тренеров. Эти персоны намеренно не объединяются с
-- одноимёнными спортсменами без отдельного подтверждения.
WITH RECURSIVE split(athlete_id, rest, token) AS (
  SELECT id, TRIM(coach) || ',', '' FROM athletes
  WHERE NULLIF(TRIM(coach), '') IS NOT NULL
  UNION ALL
  SELECT athlete_id,
         SUBSTR(rest, INSTR(rest, ',') + 1),
         TRIM(SUBSTR(rest, 1, INSTR(rest, ',') - 1))
  FROM split WHERE rest <> ''
), names AS (
  SELECT DISTINCT REPLACE(token, '. ', '.') AS name
  FROM split WHERE token <> '' AND token NOT IN ('-', '—', '–')
)
INSERT OR IGNORE INTO persons (slug, display_name)
SELECT 'coach-' || LOWER(HEX(CAST(name AS BLOB))), name FROM names;

WITH RECURSIVE split(athlete_id, rest, token) AS (
  SELECT id, TRIM(coach) || ',', '' FROM athletes
  WHERE NULLIF(TRIM(coach), '') IS NOT NULL
  UNION ALL
  SELECT athlete_id,
         SUBSTR(rest, INSTR(rest, ',') + 1),
         TRIM(SUBSTR(rest, 1, INSTR(rest, ',') - 1))
  FROM split WHERE rest <> ''
), links AS (
  SELECT athlete_id, REPLACE(token, '. ', '.') AS name
  FROM split WHERE token <> '' AND token NOT IN ('-', '—', '–')
)
INSERT OR IGNORE INTO person_coach_athletes (person_id, athlete_id)
SELECT p.id, l.athlete_id
FROM links l
JOIN persons p ON p.slug = 'coach-' || LOWER(HEX(CAST(l.name AS BLOB)));
