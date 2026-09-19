-- Афиша Кубка России 2026 (Ростов-на-Дону, 11–13 сентября 2026).
-- Файл лежит в public/competition-posters и копируется в статическую сборку.

INSERT OR REPLACE INTO competition_posters (competition_slug, poster_path) VALUES
  ('kubok-rossii-2026', '/competition-posters/kubok-rossii-2026.jpg');

UPDATE competitions
SET poster_path = (
  SELECT poster_path
  FROM competition_posters
  WHERE competition_slug = competitions.slug
)
WHERE slug = 'kubok-rossii-2026';
