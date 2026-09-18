-- Official source URLs and archived copies for the Russian Championships and Cups 2019–2020.
INSERT INTO competition_source_urls (competition_slug, source_url, archive_path) VALUES
  ('chempionat-rossii-2019',
   'https://vfgs.ru/assets/files/protocoly/2019/chempionat-rossii-2019.xlsx',
   'sources/2019/chempionat-rossii-2019.xlsx'),
  ('kubok-rossii-2019',
   'https://vfgs.ru/assets/files/protocoly/2019/kubok-rossii-2019.xlsx',
   'sources/2019/kubok-rossii-2019.xlsx'),
  ('chempionat-rossii-2020',
   'https://vfgs.ru/assets/files/protocoly/2020/rus-champ-2020.xlsx',
   'sources/2020/rus-champ-2020.xlsx'),
  ('kubok-rossii-2020',
   'https://vfgs.ru/assets/files/sorevnovania/2021/kr2020-SPb.xlsx',
   'sources/2020/kr2020-SPb.xlsx');

-- Backfill rows that already exist in D1. The INSERT trigger only covers competitions
-- created after the mapping is present.
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
