-- Первоисточник Кубка России 2026: файл протокола на сайте ВФГС и копия в архиве.
-- Адрес прежде вёл на список протоколов 2026 года, из-за чего карточка показывала
-- «Оригинал» без формата, а копии для скачивания не было вовсе.
INSERT INTO competition_source_urls (competition_slug, source_url, archive_path) VALUES
  ('kubok-rossii-2026',
   'https://vfgs.ru/assets/files/protocoly/2026/KR_2026_Rostov-na-Donu.pdf',
   'sources/2026/KR_2026_Rostov-na-Donu.pdf');

UPDATE competitions
SET source_url = COALESCE(source_url, (
      SELECT source_url FROM competition_source_urls
      WHERE competition_slug = competitions.slug
    )),
    archive_path = (
      SELECT archive_path FROM competition_source_urls
      WHERE competition_slug = competitions.slug
    )
WHERE slug = 'kubok-rossii-2026';
