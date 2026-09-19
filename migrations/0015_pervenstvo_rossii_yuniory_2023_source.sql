-- Official source URL and archived copy for the 2023 Russian Junior Championships.
INSERT INTO competition_source_urls (competition_slug, source_url, archive_path) VALUES
  ('pervenstvo-rossii-yuniory-2023',
   'https://vfgs.ru/assets/files/protocoly/2023/yuniory-2023.xlsx',
   'sources/2023/yuniory-2023.xlsx');

UPDATE competitions
SET source_url = COALESCE(source_url, (
      SELECT source_url FROM competition_source_urls
      WHERE competition_slug = competitions.slug
    )),
    archive_path = (
      SELECT archive_path FROM competition_source_urls
      WHERE competition_slug = competitions.slug
    )
WHERE slug = 'pervenstvo-rossii-yuniory-2023';
