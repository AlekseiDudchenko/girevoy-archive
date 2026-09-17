-- Official source URLs for archived competition protocols.
--
-- The mapping is loaded before seed data in local/static builds, so an INSERT trigger
-- fills competitions.source_url as competitions are created. archive_path points to the
-- immutable copy kept in this repository and published with the static site.

CREATE TABLE competition_source_urls (
  competition_slug TEXT PRIMARY KEY,
  source_url       TEXT NOT NULL,
  archive_path     TEXT NOT NULL
);

INSERT INTO competition_source_urls (competition_slug, source_url, archive_path) VALUES
  ('chempionat-rossii-2023', 'https://vfgs.ru/assets/files/protocoly/2023/chempionat-rossii-2023.xlsx', 'sources/2023/chempionat-rossii-2023.xlsx'),
  ('chempionat-dfo-sfo-2023', 'https://vfgs.ru/assets/files/protocoly/2023/protokol-dfo-sfo-2023.xls', 'sources/2023/protokol-dfo-sfo-2023.xls'),
  ('chempionat-pfo-2023', 'https://vfgs.ru/assets/files/protocoly/2023/protokol-pfo-7-9.04.2023.xlsx', 'sources/2023/protokol-pfo-7-9.04.2023.xlsx'),
  ('chempionat-rossii-2024', 'https://vfgs.ru/assets/files/protocoly/2024/protokol-chr-2024.xlsx', 'sources/2024/protokol-chr-2024.xlsx'),
  ('chempionat-pfo-2024', 'https://vfgs.ru/assets/files/protocoly/2024/Protokoly_PFO_12-14_04_24.xlsx', 'sources/2024/Protokoly_PFO_12-14_04_24.xlsx'),
  ('chempionat-dfo-sfo-ufo-2024', 'https://vfgs.ru/assets/files/protocoly/2024/chempionat-ufo-sfo-dfo4.xlsx', 'sources/2024/chempionat-ufo-sfo-dfo4.xlsx'),
  ('chempionat-yufo-skfo-2024', 'https://vfgs.ru/assets/files/protocoly/2024/chempionat-yufo-i-skfo.xlsx', 'sources/2024/chempionat-yufo-i-skfo.xlsx'),
  ('chempionat-szfo-2024', 'https://vfgs.ru/assets/files/protocoly/2024/szfo-2024.xlsx', 'sources/2024/szfo-2024.xlsx'),
  ('chempionat-tsfo-2024', 'https://vfgs.ru/assets/files/protocoly/2024/cfo-2024.xlsx', 'sources/2024/cfo-2024.xlsx'),
  ('kubok-rossii-2025', 'https://vfgs.ru/assets/files/protocoly/2025/protokol-kubok-rossii-2025-g-sankt-peterburg.pdf', 'sources/2025/protokol-kubok-rossii-2025-g-sankt-peterburg.pdf'),
  ('chempionat-tsfo-2025', 'https://vfgs.ru/assets/files/protocoly/2025/chemp.-cfo-9-13.04.2025_compressed.pdf', 'sources/2025/chemp.-cfo-9-13.04.2025_compressed.pdf'),
  ('chempionat-pfo-2025', 'https://vfgs.ru/assets/files/protocoly/2025/pfo_2025.pdf', 'sources/2025/pfo_2025.pdf'),
  ('chempionat-szfo-2025', 'https://vfgs.ru/assets/files/protocoly/2025/chszfo-2025-s-pechatyami_250422_114952.pdf', 'sources/2025/chszfo-2025-s-pechatyami_250422_114952.pdf'),
  ('chempionat-yufo-skfo-2026', 'https://vfgs.ru/assets/files/protocoly/2026/protokoly-chempionata-yufo-i-skfo.pdf', 'sources/2026/protokoly-chempionata-yufo-i-skfo.pdf'),
  ('chempionat-szfo-2026', 'https://vfgs.ru/assets/files/protocoly/2026/protokol-chempionata-szfo.pdf', 'sources/2026/protokol-chempionata-szfo.pdf'),
  ('chempionat-ufo-2026', 'https://vfgs.ru/assets/files/protocoly/2026/protokoly-ufo.pdf', 'sources/2026/protokoly-ufo.pdf');

UPDATE competitions
SET source_url = (
  SELECT source_url
  FROM competition_source_urls
  WHERE competition_slug = competitions.slug
)
WHERE source_url IS NULL
  AND EXISTS (
    SELECT 1
    FROM competition_source_urls
    WHERE competition_slug = competitions.slug
  );

CREATE TRIGGER competitions_fill_source_url_after_insert
AFTER INSERT ON competitions
WHEN NEW.source_url IS NULL
BEGIN
  UPDATE competitions
  SET source_url = (
    SELECT source_url
    FROM competition_source_urls
    WHERE competition_slug = NEW.slug
  )
  WHERE id = NEW.id
    AND EXISTS (
      SELECT 1
      FROM competition_source_urls
      WHERE competition_slug = NEW.slug
    );
END;
