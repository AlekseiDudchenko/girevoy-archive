-- Local poster assets for competition cards.
-- Posters live in public/competition-posters and are copied into the static build.

ALTER TABLE competitions ADD COLUMN poster_path TEXT;
