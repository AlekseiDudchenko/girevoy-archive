-- Official source URLs and archived copies for remaining 2025–2026 competitions.
INSERT INTO competition_source_urls (competition_slug, source_url, archive_path) VALUES
  ('chempionat-rossii-2025',
   'https://vfgs.ru/assets/files/protocoly/2025/protokl-chempionat-rossii-2025.pdf',
   'sources/2025/protokol-chempionat-rossii-2025.pdf'),
  ('chempionat-yufo-skfo-2025',
   'https://vfgs.ru/assets/files/protocoly/2025/yufo-i-skfo.pdf',
   'sources/2025/yufo-i-skfo.pdf'),
  ('chempionat-rossii-2026',
   'https://vfgs.ru/assets/files/protocoly/2026/Chempionat_Rossii_2026.pdf',
   'sources/2026/Chempionat_Rossii_2026.pdf'),
  ('chempionat-tsfo-2026',
   'https://vfgs.ru/assets/files/protocoly/2026/protokol_chempionat_TsFO.pdf',
   'sources/2026/protokol_chempionat_TsFO.pdf'),
  ('chempionat-dfo-sfo-2026',
   'https://vfgs.ru/assets/files/protocoly/2026/protokoly_SFO_DFO_2026.pdf',
   'sources/2026/protokoly_SFO_DFO_2026.pdf'),
  ('chempionat-pfo-2026',
   'https://vfgs.ru/assets/files/protocoly/2026/Protokoly-PFO-2026.pdf',
   'sources/2026/Protokoly-PFO-2026.pdf');

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
