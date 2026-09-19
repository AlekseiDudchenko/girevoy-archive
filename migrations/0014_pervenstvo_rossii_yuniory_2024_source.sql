-- Official source URL and archived copy for the 2024 Russian Junior Championships.
INSERT INTO competition_source_urls (competition_slug, source_url, archive_path) VALUES
  ('pervenstvo-rossii-yuniory-2024',
   'https://vfgs.ru/assets/files/protocoly/2024/protokoly-pr-yun-ry-2024-bor-.xlsx',
   'sources/2024/protokoly-pr-yun-ry-2024-bor-.xlsx');

UPDATE competitions
SET source_url = COALESCE(source_url, (
      SELECT source_url FROM competition_source_urls
      WHERE competition_slug = competitions.slug
    )),
    archive_path = (
      SELECT archive_path FROM competition_source_urls
      WHERE competition_slug = competitions.slug
    )
WHERE competition_slug = 'pervenstvo-rossii-yuniory-2024';
