-- Official source URLs and archived copies for competitions added from 2021–2023 protocols.
INSERT INTO competition_source_urls (competition_slug, source_url, archive_path) VALUES
  ('chempionat-rossii-2021',
   'https://vfgs.ru/assets/files/protocoly/2021/protokol-chr-2021g.r-n-d-.xlsx',
   'sources/2021/protokol-chr-2021g.r-n-d-.xlsx'),
  ('kubok-rossii-2021',
   'https://vfgs.ru/assets/files/protocoly/2021/kubok-rossii2021.xlsx',
   'sources/2021/kubok-rossii2021.xlsx'),
  ('chempionat-tsfo-yufo-szfo-pfo-skfo-2021',
   'https://vfgs.ru/assets/files/protocoly/2021/protokol-chemfoevro-2021-.xlsx',
   'sources/2021/protokol-chemfoevro-2021-.xlsx'),
  ('chempionat-dfo-sfo-ufo-2021',
   'https://vfgs.ru/assets/files/protocoly/2021/protokoly-dfo-sfo-ufo-itogovyj.xls',
   'sources/2021/protokoly-dfo-sfo-ufo-itogovyj.xls'),
  ('chempionat-dfo-sfo-ufo-2022',
   'https://vfgs.ru/assets/files/sorevnovania/2022/protokol-aziatskaya-zona.xls',
   'sources/2022/protokol-aziatskaya-zona.xls'),
  ('chempionat-rossii-2022',
   'https://vfgs.ru/assets/files/protocoly/2022/protokol-chr-2022.xlsx',
   'sources/2022/protokol-chr-2022.xlsx'),
  ('kubok-rossii-2022',
   'https://vfgs.ru/assets/files/protocoly/2022/kubok-rossii2022-1.xlsx',
   'sources/2022/kubok-rossii2022-1.xlsx'),
  ('chempionat-yufo-skfo-2023',
   'https://vfgs.ru/assets/files/protocoly/2023/chempionat-yufo-i-skfo.xlsx',
   'sources/2023/chempionat-yufo-i-skfo.xlsx'),
  ('chempionat-szfo-2023',
   'https://vfgs.ru/assets/files/protocoly/2023/protokol-chemfoszfo-2023.xlsx',
   'sources/2023/protokol-chemfoszfo-2023.xlsx'),
  ('chempionat-tsfo-2023',
   'https://vfgs.ru/assets/files/protocoly/2023/cfo-2023-kaluga.-xlsx.xlsx',
   'sources/2023/cfo-2023-kaluga.-xlsx.xlsx'),
  ('kubok-rossii-2023',
   'https://vfgs.ru/assets/files/protocoly/2023/protokol-kr-2023.xls',
   'sources/2023/protokol-kr-2023.xls');

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
