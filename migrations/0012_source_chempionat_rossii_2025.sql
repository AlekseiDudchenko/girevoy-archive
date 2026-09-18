-- Official source URL and archived copy for the Russian Championship 2025.
INSERT INTO competition_source_urls (competition_slug, source_url, archive_path) VALUES
  ('chempionat-rossii-2025',
   'https://vfgs.ru/assets/files/protocoly/2025/protokl-chempionat-rossii-2025.pdf',
   'sources/2025/protokol-chempionat-rossii-2025.pdf');

UPDATE competitions
SET source_url = COALESCE(source_url, (
      SELECT source_url FROM competition_source_urls
      WHERE competition_slug = competitions.slug
    )),
    archive_path = (
      SELECT archive_path FROM competition_source_urls
      WHERE competition_slug = competitions.slug
    )
WHERE EXISTS (
  SELECT 1 FROM competition_source_urls
  WHERE competition_slug = competitions.slug
);
