-- Poster assignment for Russia Cup 2026.
-- The source JPEG is stored locally under public/competition-posters.

INSERT OR REPLACE INTO competition_posters (competition_slug, poster_path) VALUES
  ('kubok-rossii-2026', '/competition-posters/kubok-rossii-2026.jpg');

UPDATE competitions
SET poster_path = (
  SELECT poster_path
  FROM competition_posters
  WHERE competition_slug = competitions.slug
)
WHERE slug = 'kubok-rossii-2026';
