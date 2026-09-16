-- Чемпионат Центрального федерального округа 2026, Смоленск, 2026-04-13—2026-04-16.
-- Сгенерировано scripts/gen_seed.py из data/chempionat-tsfo-2026.json, не править руками.
-- Источник — скан официальных протоколов чемпионата Центрального федерального округа 2026 (PDF без текстового слоя). ФИО с отчеством, дата рождения полная. Импорт ведётся по одной индивидуальной категории отдельным коммитом. Титульный лист (стр. 1), эстафеты длинного цикла (стр. 14–16), командный зачёт (стр. 39) и список судей (стр. 40) не импортируются. Жонглирование (стр. 13) не поддержано текущей схемой. Командные очки сохраняются в JSON как напечатано, но в базу не попадают. На страницах 2 и 3 скан обрезан слева: колонка «Место» отсутствует, порядок мест восстановлен по убыванию результата и командных очков (см. ERRATA.md).
-- Данные извлечены из протокола моделью; сверка человеком не проводилась,
-- поэтому results.verified_by остаётся пустым (FR-A14).

INSERT OR IGNORE INTO regions (name, country) VALUES
  ('Смоленская область', 'RU'),
  ('Калужская область', 'RU'),
  ('Брянская область', 'RU'),
  ('Белгородская область', 'RU'),
  ('г. Москва', 'RU'),
  ('Ярославская область', 'RU');

INSERT OR IGNORE INTO clubs (name, region_id) VALUES
  ('КСШ № 1', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')),
  ('СШОР Маршал', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')),
  ('СШОР по борьбе', (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU')),
  ('МБУ ДО СШОР 5 г Белгород', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')),
  ('РО ООО «ВФГС» в г. Москве', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')),
  ('МАУ ДО СШОР "Метеор"', (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU'));

INSERT OR IGNORE INTO federations (name, short_name, country) VALUES
  ('Всероссийская федерация гиревого спорта', 'ВФГС', 'RU');

INSERT INTO competitions (id, slug, name, date_start, date_end, city, country, competition_rank_id, federation_id, source_url, is_published) VALUES
  (8001, 'chempionat-tsfo-2026', 'Чемпионат Центрального федерального округа 2026', '2026-04-13', '2026-04-16', 'Смоленск', 'RU', (SELECT id FROM competition_ranks WHERE code = 'federal_district'), (SELECT id FROM federations WHERE name = 'Всероссийская федерация гиревого спорта'), NULL, 1);

INSERT INTO protocols (id, competition_id, r2_key, filename, page_count, is_scan, status, published_at) VALUES
  (8001, 8001, 'protocols/chempionat-tsfo-2026.pdf', 'protokol_chempionat_TsFO.pdf', 40, 1, 'published', '2026-04-13');

INSERT INTO categories (id, competition_id, discipline_id, sex, age_group_id, division_id, bell_kg, hands, time_limit_min, weight_class_raw, weight_class_kg, weight_class_is_open, participants_declared, is_deferred, sort_order) VALUES
  (8001, 8001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '63', 63, 0, 4, 0, 1),
  (8002, 8001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '68', 68, 0, 4, 0, 2);

INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Цвик', 'Данил', 'Александрович', 2003, 'm', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КСШ № 1' AND region_id = (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')), 'Сергеев С.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Цвик' AND a.first_name = 'Данил' AND a.middle_name = 'Александрович' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кормилицын', 'Иван', 'Николаевич', 2010, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР Маршал' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Пянко И.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кормилицын' AND a.first_name = 'Иван' AND a.middle_name = 'Николаевич' AND a.birth_year = 2010 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Дубинин', 'Максим', 'Николаевич', 1989, 'm', (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР по борьбе' AND region_id = (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU')), 'Гомонов В.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Дубинин' AND a.first_name = 'Максим' AND a.middle_name = 'Николаевич' AND a.birth_year = 1989 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кривко', 'Никита', 'Алексеевич', 2002, 'm', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР 5 г Белгород' AND region_id = (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')), 'Вильган А.П.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кривко' AND a.first_name = 'Никита' AND a.middle_name = 'Алексеевич' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Горячев', 'Ярослав', 'Алексеевич', 2010, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР Маршал' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Барбакова Н.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Горячев' AND a.first_name = 'Ярослав' AND a.middle_name = 'Алексеевич' AND a.birth_year = 2010 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Хамидов', 'Фахриддин', 'Фарход угли', 2002, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР Маршал' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Барбакова Н.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Хамидов' AND a.first_name = 'Фахриддин' AND a.middle_name = 'Фарход угли' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Сидоренков', 'Александр', 'Александрович', 2010, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО «ВФГС» в г. Москве' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Соловьев А.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Сидоренков' AND a.first_name = 'Александр' AND a.middle_name = 'Александрович' AND a.birth_year = 2010 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Копаевский', 'Артём', 'Александрович', 2009, 'm', (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШОР "Метеор"' AND region_id = (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU')), 'Егоров В.В.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Копаевский' AND a.first_name = 'Артём' AND a.middle_name = 'Александрович' AND a.birth_year = 2009 LIMIT 1);

INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'cvik-danil-2003' AND s.athlete_id <> a.id)
              THEN 'cvik-danil-2003-' || a.id ELSE 'cvik-danil-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Цвик' AND first_name = 'Данил' AND middle_name = 'Александрович' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kormilicyn-ivan-2010' AND s.athlete_id <> a.id)
              THEN 'kormilicyn-ivan-2010-' || a.id ELSE 'kormilicyn-ivan-2010' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кормилицын' AND first_name = 'Иван' AND middle_name = 'Николаевич' AND birth_year = 2010 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'dubinin-maksim-1989' AND s.athlete_id <> a.id)
              THEN 'dubinin-maksim-1989-' || a.id ELSE 'dubinin-maksim-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Дубинин' AND first_name = 'Максим' AND middle_name = 'Николаевич' AND birth_year = 1989 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'krivko-nikita-2002' AND s.athlete_id <> a.id)
              THEN 'krivko-nikita-2002-' || a.id ELSE 'krivko-nikita-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кривко' AND first_name = 'Никита' AND middle_name = 'Алексеевич' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'goryachev-yaroslav-2010' AND s.athlete_id <> a.id)
              THEN 'goryachev-yaroslav-2010-' || a.id ELSE 'goryachev-yaroslav-2010' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Горячев' AND first_name = 'Ярослав' AND middle_name = 'Алексеевич' AND birth_year = 2010 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'hamidov-fahriddin-2002' AND s.athlete_id <> a.id)
              THEN 'hamidov-fahriddin-2002-' || a.id ELSE 'hamidov-fahriddin-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Хамидов' AND first_name = 'Фахриддин' AND middle_name = 'Фарход угли' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sidorenkov-aleksandr-2010' AND s.athlete_id <> a.id)
              THEN 'sidorenkov-aleksandr-2010-' || a.id ELSE 'sidorenkov-aleksandr-2010' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Сидоренков' AND first_name = 'Александр' AND middle_name = 'Александрович' AND birth_year = 2010 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kopaevskiy-artem-2009' AND s.athlete_id <> a.id)
              THEN 'kopaevskiy-artem-2009-' || a.id ELSE 'kopaevskiy-artem-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Копаевский' AND first_name = 'Артём' AND middle_name = 'Александрович' AND birth_year = 2009 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);

INSERT INTO results (id, category_id, athlete_id, place, total_reps, points, body_weight_kg, rank_achieved_id, discipline_id, bell_kg, hands, time_limit_min, competition_id, event_date, raw_name, raw_club, raw_region, protocol_id, source_page) VALUES
  (8001, 8001, (SELECT id FROM athletes WHERE last_name = 'Цвик' AND first_name = 'Данил' AND middle_name = 'Александрович' AND birth_year = 2003 LIMIT 1), 1, 44, NULL, 62.9, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Цвик Данил Александрович', 'КСШ № 1', 'Смоленская область', 8001, 2),
  (8002, 8001, (SELECT id FROM athletes WHERE last_name = 'Кормилицын' AND first_name = 'Иван' AND middle_name = 'Николаевич' AND birth_year = 2010 LIMIT 1), 2, 43, NULL, 63.0, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Кормилицын Иван Николаевич', 'СШОР Маршал', 'Калужская область', 8001, 2),
  (8003, 8001, (SELECT id FROM athletes WHERE last_name = 'Дубинин' AND first_name = 'Максим' AND middle_name = 'Николаевич' AND birth_year = 1989 LIMIT 1), 3, 40, NULL, 62.7, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Дубинин Максим Николаевич', 'СШОР по борьбе', 'Брянская область', 8001, 2),
  (8004, 8001, (SELECT id FROM athletes WHERE last_name = 'Кривко' AND first_name = 'Никита' AND middle_name = 'Алексеевич' AND birth_year = 2002 LIMIT 1), 4, 39, NULL, 62.9, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Кривко Никита Алексеевич', 'МБУ ДО СШОР 5 г Белгород', 'Белгородская область', 8001, 2),
  (8005, 8002, (SELECT id FROM athletes WHERE last_name = 'Горячев' AND first_name = 'Ярослав' AND middle_name = 'Алексеевич' AND birth_year = 2010 LIMIT 1), 1, 64, NULL, 68.0, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Горячев Ярослав Алексеевич', 'СШОР Маршал', 'Калужская область', 8001, 3),
  (8006, 8002, (SELECT id FROM athletes WHERE last_name = 'Хамидов' AND first_name = 'Фахриддин' AND middle_name = 'Фарход угли' AND birth_year = 2002 LIMIT 1), 2, 63, NULL, 67.85, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Хамидов Фахриддин Фарход угли', 'СШОР Маршал', 'Калужская область', 8001, 3),
  (8007, 8002, (SELECT id FROM athletes WHERE last_name = 'Сидоренков' AND first_name = 'Александр' AND middle_name = 'Александрович' AND birth_year = 2010 LIMIT 1), 3, 46, NULL, 67.7, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Сидоренков Александр Александрович', 'РО ООО «ВФГС» в г. Москве', 'г. Москва', 8001, 3),
  (8008, 8002, (SELECT id FROM athletes WHERE last_name = 'Копаевский' AND first_name = 'Артём' AND middle_name = 'Александрович' AND birth_year = 2009 LIMIT 1), 4, 16, NULL, 67.35, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Копаевский Артём Александрович', 'МАУ ДО СШОР "Метеор"', 'Ярославская область', 8001, 3);

INSERT INTO result_reps (id, result_id, exercise, hand, reps) VALUES
  (8001, 8001, 'long_cycle', 'both', 44),
  (8002, 8002, 'long_cycle', 'both', 43),
  (8003, 8003, 'long_cycle', 'both', 40),
  (8004, 8004, 'long_cycle', 'both', 39),
  (8005, 8005, 'long_cycle', 'both', 64),
  (8006, 8006, 'long_cycle', 'both', 63),
  (8007, 8007, 'long_cycle', 'both', 46),
  (8008, 8008, 'long_cycle', 'both', 16);

