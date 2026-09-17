-- Poster assignment for Championship of Russia 2026.
-- The source JPEG is stored locally under public/competition-posters.

CREATE TABLE IF NOT EXISTS competition_posters (
  competition_slug TEXT PRIMARY KEY,
  poster_path      TEXT NOT NULL
);

INSERT OR REPLACE INTO competition_posters (competition_slug, poster_path) VALUES
  ('chempionat-rossii-2026', '/competition-posters/chempionat-rossii-2026.jpg');

UPDATE competitions
SET poster_path = (
  SELECT poster_path
  FROM competition_posters
  WHERE competition_slug = competitions.slug
)
WHERE slug = 'chempionat-rossii-2026';

CREATE TRIGGER IF NOT EXISTS competitions_fill_poster_after_insert
AFTER INSERT ON competitions
BEGIN
  UPDATE competitions
  SET poster_path = (
    SELECT poster_path
    FROM competition_posters
    WHERE competition_slug = NEW.slug
  )
  WHERE id = NEW.id
    AND EXISTS (
      SELECT 1
      FROM competition_posters
      WHERE competition_slug = NEW.slug
    );
END;
