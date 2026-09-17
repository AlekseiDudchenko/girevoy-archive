-- Optional visual identity for competition cards.
-- Posters are preferred over logos in the public UI when both are available.

ALTER TABLE competitions ADD COLUMN poster_url TEXT;
ALTER TABLE competitions ADD COLUMN logo_url TEXT;
