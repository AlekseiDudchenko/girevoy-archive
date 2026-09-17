-- Local poster assets for competition cards.
-- Posters live in public/competition-posters and are copied into the static build.

ALTER TABLE competitions ADD COLUMN poster_path TEXT;

CREATE TABLE competition_posters (
  competition_slug TEXT PRIMARY KEY,
  poster_path      TEXT NOT NULL
);

UPDATE competitions
SET poster_path = (
  SELECT poster_path FROM competition_posters
  WHERE competition_slug = competitions.slug
)
WHERE EXISTS (
  SELECT 1 FROM competition_posters
  WHERE competition_slug = competitions.slug
);

CREATE TRIGGER competitions_fill_poster_after_insert
AFTER INSERT ON competitions
BEGIN
  UPDATE competitions
  SET poster_path = (
    SELECT poster_path FROM competition_posters
    WHERE competition_slug = NEW.slug
  )
  WHERE id = NEW.id
    AND EXISTS (
      SELECT 1 FROM competition_posters
      WHERE competition_slug = NEW.slug
    );
END;
