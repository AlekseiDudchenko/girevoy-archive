-- Чемпионат Центрального федерального округа 2026, Смоленск, 2026-04-13—2026-04-16.
-- Сгенерировано scripts/gen_seed.py из data/chempionat-tsfo-2026.json, не править руками.
-- Источник — скан официальных протоколов чемпионата Центрального федерального округа 2026 (PDF без текстового слоя). ФИО с отчеством, дата рождения полная. Импорт ведётся по одной индивидуальной категории отдельным коммитом. Титульный лист (стр. 1), эстафеты длинного цикла (стр. 14–16), командный зачёт (стр. 39) и список судей (стр. 40) не импортируются. Жонглирование (стр. 13) не поддержано текущей схемой. Командные очки сохраняются в JSON как напечатано, но в базу не попадают. На страницах 2 и 3 скан обрезан слева: колонка «Место» отсутствует, порядок мест восстановлен по убыванию результата и командных очков (см. ERRATA.md).
-- Данные извлечены из протокола моделью; сверка человеком не проводилась,
-- поэтому results.verified_by остаётся пустым (FR-A14).

INSERT OR IGNORE INTO regions (name, country) VALUES
  ('Калужская область', 'RU'),
  ('Смоленская область', 'RU'),
  ('г. Москва', 'RU'),
  ('Ярославская область', 'RU'),
  ('Воронежская область', 'RU'),
  ('Брянская область', 'RU'),
  ('Белгородская область', 'RU'),
  ('Курская область', 'RU'),
  ('Рязанская область', 'RU'),
  ('Московская область', 'RU'),
  ('Владимирская область', 'RU'),
  ('Ивановская область', 'RU');

INSERT OR IGNORE INTO clubs (name, region_id) VALUES
  ('СШОР Маршал', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')),
  ('КСШ № 1/СГУС', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')),
  ('СШОР «Маршал»', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')),
  ('ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')),
  ('РО ООО "ВФГС" в г.Москве', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')),
  ('МАУ ДО СШОР "Метеор"', (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU')),
  ('СШОР "Маршал"', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')),
  ('КСШ №1', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')),
  ('МКУ ДО "Бобровская СШ им. В.Л. Паткина"', (SELECT id FROM regions WHERE name = 'Воронежская область' AND country = 'RU')),
  ('СШОР по борьбе', (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU')),
  ('МБУ ДО СШ "ОСКОЛ"', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')),
  ('ЯРОО ФГС', (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU')),
  ('МБУ ДО СШОР 5 г Белгород', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')),
  ('ВС РФ', (SELECT id FROM regions WHERE name = 'Воронежская область' AND country = 'RU')),
  ('РО ООО «ВФГС» в г. Москве', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Курская область' AND country = 'RU')),
  ('СШ Маршал', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')),
  ('Ддю Алые паруса Ряжск', (SELECT id FROM regions WHERE name = 'Рязанская область' AND country = 'RU')),
  ('МУ ДО "СШ "Легион"', (SELECT id FROM regions WHERE name = 'Московская область' AND country = 'RU')),
  ('РО ООО "ВФГС" в г. Москве', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')),
  ('РО ООО "ВФГС" в Московской области', (SELECT id FROM regions WHERE name = 'Московская область' AND country = 'RU')),
  ('КСШ № 1', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')),
  ('ВА ВПВО', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')),
  ('ГБУ ДО МКСШОР "Запад" Отделение "Семёрка"', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')),
  ('Региональное отделение ВФГС по Курской области', (SELECT id FROM regions WHERE name = 'Курская область' AND country = 'RU')),
  ('КСШ №1/ВАВПВО', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')),
  ('ГБУ ДО МКСШОР "Запад" отделение "Семёрка"', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')),
  ('БРОО ФГС', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')),
  ('РО ООО «ВФГС» во Владимирской области', (SELECT id FROM regions WHERE name = 'Владимирская область' AND country = 'RU')),
  ('ФГС КО', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')),
  ('КСШ №1/СГУС', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')),
  ('МБУ ДО СШ "ОСКОЛ"/СШОР 5 Белгород', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')),
  ('Владимирская область', (SELECT id FROM regions WHERE name = 'Владимирская область' AND country = 'RU')),
  ('РОООО "ВФГС по ИО"', (SELECT id FROM regions WHERE name = 'Ивановская область' AND country = 'RU')),
  ('МБУДО КСШ1 , СГУС', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')),
  ('МБУ ДО СШ "Юность"', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')),
  ('РО ООО ВФГС в г. Москве', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')),
  ('Ивановское региональное отделение', (SELECT id FROM regions WHERE name = 'Ивановская область' AND country = 'RU')),
  ('МАУ СШОР Метеор', (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU')),
  ('РО ООО "ВФГС" во Владимирской области', (SELECT id FROM regions WHERE name = 'Владимирская область' AND country = 'RU')),
  ('РО ООО "ВФГС" в городе Москве', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')),
  ('МБУ ДО СШОР 5 г Белгород/ МБУ ДО ДЮСШ Волоконовский район', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')),
  ('ДДЮ Алые Паруса', (SELECT id FROM regions WHERE name = 'Рязанская область' AND country = 'RU')),
  ('Sapa Fitness', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU'));

INSERT OR IGNORE INTO federations (name, short_name, country) VALUES
  ('Всероссийская федерация гиревого спорта', 'ВФГС', 'RU');

INSERT INTO competitions (id, slug, name, date_start, date_end, city, country, competition_rank_id, federation_id, source_url, is_published) VALUES
  (8001, 'chempionat-tsfo-2026', 'Чемпионат Центрального федерального округа 2026', '2026-04-13', '2026-04-16', 'Смоленск', 'RU', (SELECT id FROM competition_ranks WHERE code = 'federal_district'), (SELECT id FROM federations WHERE name = 'Всероссийская федерация гиревого спорта'), NULL, 1);

INSERT INTO protocols (id, competition_id, r2_key, filename, page_count, is_scan, status, published_at) VALUES
  (8001, 8001, 'protocols/chempionat-tsfo-2026.pdf', 'protokol_chempionat_TsFO.pdf', 40, 1, 'published', '2026-04-13');

INSERT INTO categories (id, competition_id, discipline_id, sex, age_group_id, division_id, bell_kg, hands, time_limit_min, weight_class_raw, weight_class_kg, weight_class_is_open, participants_declared, is_deferred, sort_order) VALUES
  (8001, 8001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '58', 58, 0, 2, 0, 1),
  (8002, 8001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '63', 63, 0, 4, 0, 2),
  (8003, 8001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '68+', 68, 1, 4, 0, 3),
  (8004, 8001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '68', 68, 0, 4, 0, 4),
  (8005, 8001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '63', 63, 0, 4, 0, 5),
  (8006, 8001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '68', 68, 0, 6, 0, 6),
  (8007, 8001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '73', 73, 0, 6, 0, 7),
  (8008, 8001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '78', 78, 0, 9, 0, 8),
  (8009, 8001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '85', 85, 0, 9, 0, 9),
  (8010, 8001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '95+', 95, 1, 6, 0, 10),
  (8011, 8001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '95', 95, 0, 6, 0, 11),
  (8012, 8001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '58', 58, 0, 4, 0, 12),
  (8013, 8001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '63', 63, 0, 3, 0, 13),
  (8014, 8001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '68+', 68, 1, 4, 0, 14),
  (8015, 8001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '68', 68, 0, 2, 0, 15),
  (8016, 8001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '63', 63, 0, 4, 0, 16),
  (8017, 8001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '68', 68, 0, 4, 0, 17),
  (8018, 8001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '73', 73, 0, 9, 0, 18),
  (8019, 8001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '78', 78, 0, 9, 0, 19),
  (8020, 8001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '85', 85, 0, 5, 0, 20),
  (8021, 8001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '95+', 95, 1, 7, 0, 21),
  (8022, 8001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '95', 95, 0, 7, 0, 22),
  (8023, 8001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '63', 63, 0, 5, 0, 23),
  (8024, 8001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '68', 68, 0, 4, 0, 24),
  (8025, 8001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '73', 73, 0, 11, 0, 25),
  (8026, 8001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '78', 78, 0, 10, 0, 26),
  (8027, 8001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '85', 85, 0, 13, 0, 27);

INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Трофимова', 'Милена', 'Михайловна', 2007, 'f', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР Маршал' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Пянко И.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Трофимова' AND a.first_name = 'Милена' AND a.middle_name = 'Михайловна' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Грибанова', 'Ирина', 'Александровна', 2004, 'f', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КСШ № 1/СГУС' AND region_id = (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')), 'Шванев В.Б., Алферова В.Я.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Грибанова' AND a.first_name = 'Ирина' AND a.middle_name = 'Александровна' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Пивень', 'Александра', 'Максимовна', 2004, 'f', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР «Маршал»' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Пянко И.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Пивень' AND a.first_name = 'Александра' AND a.middle_name = 'Максимовна' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Мартынова', 'Любовь', 'Владимировна', 2007, 'f', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Ландин А.Ю., Бирюков С.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Мартынова' AND a.first_name = 'Любовь' AND a.middle_name = 'Владимировна' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Подольская', 'Анастасия', 'Владимировна', 2005, 'f', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО "ВФГС" в г.Москве' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Соловьев А.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Подольская' AND a.first_name = 'Анастасия' AND a.middle_name = 'Владимировна' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Переплетова', 'Яна', 'Васильевна', 2009, 'f', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Ландин А.Ю.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Переплетова' AND a.first_name = 'Яна' AND a.middle_name = 'Васильевна' AND a.birth_year = 2009 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Мартынова', 'Ирина', 'Александровна', 1999, 'f', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР «Маршал»' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Трофимов М.А.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Мартынова' AND a.first_name = 'Ирина' AND a.middle_name = 'Александровна' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Верховцева', 'Екатерина', 'Николаевна', 2003, 'f', (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШОР "Метеор"' AND region_id = (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU')), 'Гоголев М.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Верховцева' AND a.first_name = 'Екатерина' AND a.middle_name = 'Николаевна' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Побережная', 'Анна', 'Владимировна', 2010, 'f', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Маршал"' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Пянко И.А.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Побережная' AND a.first_name = 'Анна' AND a.middle_name = 'Владимировна' AND a.birth_year = 2010 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Якубенкова', 'Анна', 'Андреевна', 2007, 'f', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КСШ №1' AND region_id = (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')), 'Шванев В.Б.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Якубенкова' AND a.first_name = 'Анна' AND a.middle_name = 'Андреевна' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Воропаева', 'Виктория', 'Витальевна', 2004, 'f', (SELECT id FROM regions WHERE name = 'Воронежская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МКУ ДО "Бобровская СШ им. В.Л. Паткина"' AND region_id = (SELECT id FROM regions WHERE name = 'Воронежская область' AND country = 'RU')), 'Сорокин Н.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Воропаева' AND a.first_name = 'Виктория' AND a.middle_name = 'Витальевна' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Альянова', 'Виктория', 'Евгеньевна', 2004, 'f', (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР по борьбе' AND region_id = (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU')), 'Гомонов В.Н., Лукьянчиков Ю.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Альянова' AND a.first_name = 'Виктория' AND a.middle_name = 'Евгеньевна' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Сорокина', 'Ольга', 'Андреевна', 2003, 'f', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Ландин А.Ю., Афонин И.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Сорокина' AND a.first_name = 'Ольга' AND a.middle_name = 'Андреевна' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Щекина', 'Анна', 'Константиновна', 2012, 'f', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ "ОСКОЛ"' AND region_id = (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')), 'Ермаков К.И., Щекина А.К.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Щекина' AND a.first_name = 'Анна' AND a.middle_name = 'Константиновна' AND a.birth_year = 2012 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Арсентьев', 'Виталий', 'Александрович', 2001, 'm', (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ЯРОО ФГС' AND region_id = (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU')), 'Елькин Ю.Г., Кузнецов О.Г.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Арсентьев' AND a.first_name = 'Виталий' AND a.middle_name = 'Александрович' AND a.birth_year = 2001 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кормилицын', 'Иван', 'Николаевич', 2010, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР Маршал' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Пянко И.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кормилицын' AND a.first_name = 'Иван' AND a.middle_name = 'Николаевич' AND a.birth_year = 2010 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кривко', 'Никита', 'Алексеевич', 2002, 'm', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР 5 г Белгород' AND region_id = (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')), 'Вильган А.П.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кривко' AND a.first_name = 'Никита' AND a.middle_name = 'Алексеевич' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Буданов', 'Григорий', 'Денисович', 2010, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Ландин А.Ю.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Буданов' AND a.first_name = 'Григорий' AND a.middle_name = 'Денисович' AND a.birth_year = 2010 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Зуев', 'Владислав', 'Алексеевич', 2000, 'm', (SELECT id FROM regions WHERE name = 'Воронежская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС РФ' AND region_id = (SELECT id FROM regions WHERE name = 'Воронежская область' AND country = 'RU')), 'Колесниченко Н.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Зуев' AND a.first_name = 'Владислав' AND a.middle_name = 'Алексеевич' AND a.birth_year = 2000 LIMIT 1);
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
  SELECT 'Подволоцкий', 'Сергей', 'Александрович', 1997, 'm', (SELECT id FROM regions WHERE name = 'Воронежская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МКУ ДО "Бобровская СШ им. В.Л. Паткина"' AND region_id = (SELECT id FROM regions WHERE name = 'Воронежская область' AND country = 'RU')), 'Зуев В.А., Сорокин Н.Н.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Подволоцкий' AND a.first_name = 'Сергей' AND a.middle_name = 'Александрович' AND a.birth_year = 1997 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Пухучкин', 'Евгений', 'Викторович', 1979, 'm', (SELECT id FROM regions WHERE name = 'Курская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Курская область' AND country = 'RU')), 'Самостоятельно', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Пухучкин' AND a.first_name = 'Евгений' AND a.middle_name = 'Викторович' AND a.birth_year = 1979 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Трофимов', 'Тимур', 'Михайлович', 2011, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Маршал"' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Пянко И.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Трофимов' AND a.first_name = 'Тимур' AND a.middle_name = 'Михайлович' AND a.birth_year = 2011 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Сергеев', 'Александр', 'Сергеевич', 1991, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР «Маршал»' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Трофимов М.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Сергеев' AND a.first_name = 'Александр' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1991 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Васин', 'Артём', 'Иванович', 2007, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Маршал"' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Пянко И.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Васин' AND a.first_name = 'Артём' AND a.middle_name = 'Иванович' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Лисицын', 'Кирилл', 'Сергеевич', 2007, 'm', (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШОР "Метеор"' AND region_id = (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU')), 'Егоров В.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Лисицын' AND a.first_name = 'Кирилл' AND a.middle_name = 'Сергеевич' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Исмаилов', 'Артём', 'Николаевич', 2008, 'm', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ "ОСКОЛ"' AND region_id = (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')), 'Ермаков К.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Исмаилов' AND a.first_name = 'Артём' AND a.middle_name = 'Николаевич' AND a.birth_year = 2008 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Щипков', 'Даниил', 'Олегович', 2009, 'm', (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШОР "Метеор"' AND region_id = (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU')), 'Егоров В.В.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Щипков' AND a.first_name = 'Даниил' AND a.middle_name = 'Олегович' AND a.birth_year = 2009 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Сулейманов', 'Мовсар', 'Мусаевич', 1989, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ Маршал' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Трафимов М.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Сулейманов' AND a.first_name = 'Мовсар' AND a.middle_name = 'Мусаевич' AND a.birth_year = 1989 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ванин', 'Виктор', 'Викторович', 1991, 'm', (SELECT id FROM regions WHERE name = 'Рязанская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Ддю Алые паруса Ряжск' AND region_id = (SELECT id FROM regions WHERE name = 'Рязанская область' AND country = 'RU')), 'Шматов И.Б.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ванин' AND a.first_name = 'Виктор' AND a.middle_name = 'Викторович' AND a.birth_year = 1991 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Володин', 'Денис', 'Игоревич', 1993, 'm', (SELECT id FROM regions WHERE name = 'Московская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МУ ДО "СШ "Легион"' AND region_id = (SELECT id FROM regions WHERE name = 'Московская область' AND country = 'RU')), 'Соколов Н.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Володин' AND a.first_name = 'Денис' AND a.middle_name = 'Игоревич' AND a.birth_year = 1993 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Луценко', 'Никита', 'Ильич', 2003, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО "ВФГС" в г. Москве' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Коновалов Д.Е., Козлов Е.В.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Луценко' AND a.first_name = 'Никита' AND a.middle_name = 'Ильич' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Поляков', 'Матвей', 'Юрьевич', 2002, 'm', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР 5 г Белгород' AND region_id = (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')), 'Вильган А.П.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Поляков' AND a.first_name = 'Матвей' AND a.middle_name = 'Юрьевич' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ладе', 'Роман', 'Андреевич', 1991, 'm', (SELECT id FROM regions WHERE name = 'Московская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО "ВФГС" в Московской области' AND region_id = (SELECT id FROM regions WHERE name = 'Московская область' AND country = 'RU')), 'Рассадин А.А.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ладе' AND a.first_name = 'Роман' AND a.middle_name = 'Андреевич' AND a.birth_year = 1991 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Абдразаков', 'Рафик', 'Шавкатович', 2002, 'm', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КСШ № 1' AND region_id = (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')), 'Сергеев С.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Абдразаков' AND a.first_name = 'Рафик' AND a.middle_name = 'Шавкатович' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Богданов', 'Михаил', 'Юрьевич', 2007, 'm', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВА ВПВО' AND region_id = (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')), 'Калякин С.В.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Богданов' AND a.first_name = 'Михаил' AND a.middle_name = 'Юрьевич' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Масленников', 'Иван', 'Валерьевич', 2011, 'm', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ "ОСКОЛ"' AND region_id = (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')), 'Ермаков К.И., Щекина А.К.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Масленников' AND a.first_name = 'Иван' AND a.middle_name = 'Валерьевич' AND a.birth_year = 2011 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Андрущенко', 'Сергей', 'Александрович', 2005, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ГБУ ДО МКСШОР "Запад" Отделение "Семёрка"' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Ландин А.Ю., Ермаков К.И., Турищев Д.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Андрущенко' AND a.first_name = 'Сергей' AND a.middle_name = 'Александрович' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Мухитов', 'Андрей', 'Вячеславович', 1999, 'm', (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР по борьбе' AND region_id = (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU')), 'Гомонов В.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Мухитов' AND a.first_name = 'Андрей' AND a.middle_name = 'Вячеславович' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ветров', 'Денис', 'Сергеевич', 1989, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО «ВФГС» в г. Москве' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Шаповалов Е.Г.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ветров' AND a.first_name = 'Денис' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1989 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Гнездилов', 'Роман', 'Сергеевич', 1990, 'm', (SELECT id FROM regions WHERE name = 'Курская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Региональное отделение ВФГС по Курской области' AND region_id = (SELECT id FROM regions WHERE name = 'Курская область' AND country = 'RU')), 'Самостоятельно', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Гнездилов' AND a.first_name = 'Роман' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1990 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Овчинников', 'Никита', 'Олегович', 2000, 'm', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КСШ №1/ВАВПВО' AND region_id = (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')), 'Сергеев С.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Овчинников' AND a.first_name = 'Никита' AND a.middle_name = 'Олегович' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Квасов', 'Александр', 'Юрьевич', 2006, 'm', (SELECT id FROM regions WHERE name = 'Воронежская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС РФ' AND region_id = (SELECT id FROM regions WHERE name = 'Воронежская область' AND country = 'RU')), 'Зуев В.А., Колесниченко Н.Л.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Квасов' AND a.first_name = 'Александр' AND a.middle_name = 'Юрьевич' AND a.birth_year = 2006 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Витков', 'Алексей', 'Викторович', 1990, 'm', (SELECT id FROM regions WHERE name = 'Московская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО "ВФГС" в Московской области' AND region_id = (SELECT id FROM regions WHERE name = 'Московская область' AND country = 'RU')), 'Усс В.А.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Витков' AND a.first_name = 'Алексей' AND a.middle_name = 'Викторович' AND a.birth_year = 1990 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Насибов', 'Туран', 'Гурбанович', 2010, 'm', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ "ОСКОЛ"' AND region_id = (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')), 'Ермаков К.И., Щекина А.К.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Насибов' AND a.first_name = 'Туран' AND a.middle_name = 'Гурбанович' AND a.birth_year = 2010 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Закатов', 'Руслан', 'Александрович', 2007, 'm', (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШОР "Метеор"' AND region_id = (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU')), 'Егоров В.В.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Закатов' AND a.first_name = 'Руслан' AND a.middle_name = 'Александрович' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Турищев', 'Дмитрий', 'Владимирович', 1992, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ГБУ ДО МКСШОР "Запад" отделение "Семёрка"' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Ландин А.Ю., Винтовкин Н.В., Дуюнов Е.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Турищев' AND a.first_name = 'Дмитрий' AND a.middle_name = 'Владимирович' AND a.birth_year = 1992 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Розмазнин', 'Илья', 'Владимирович', 2000, 'm', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'БРОО ФГС' AND region_id = (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')), 'Мащенко О.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Розмазнин' AND a.first_name = 'Илья' AND a.middle_name = 'Владимирович' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Потатуев', 'Артём', 'Александрович', 1992, 'm', (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШОР "Метеор"' AND region_id = (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU')), 'Егоров В.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Потатуев' AND a.first_name = 'Артём' AND a.middle_name = 'Александрович' AND a.birth_year = 1992 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ильин', 'Антон', 'Андреевич', 1992, 'm', (SELECT id FROM regions WHERE name = 'Владимирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО «ВФГС» во Владимирской области' AND region_id = (SELECT id FROM regions WHERE name = 'Владимирская область' AND country = 'RU')), 'Арифулин А.Н.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ильин' AND a.first_name = 'Антон' AND a.middle_name = 'Андреевич' AND a.birth_year = 1992 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Слащев', 'Степан', 'Сергеевич', 2008, 'm', (SELECT id FROM regions WHERE name = 'Московская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МУ ДО "СШ "Легион"' AND region_id = (SELECT id FROM regions WHERE name = 'Московская область' AND country = 'RU')), 'Володин Д.И.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Слащев' AND a.first_name = 'Степан' AND a.middle_name = 'Сергеевич' AND a.birth_year = 2008 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Лысиков', 'Ярослав', 'Александрович', 2006, 'm', (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШОР "Метеор"' AND region_id = (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU')), 'Федулов А.Ю.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Лысиков' AND a.first_name = 'Ярослав' AND a.middle_name = 'Александрович' AND a.birth_year = 2006 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кулаков', 'Иван', 'Иванович', 1998, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР «Маршал»' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Шматов И.Б., Трофимов М.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кулаков' AND a.first_name = 'Иван' AND a.middle_name = 'Иванович' AND a.birth_year = 1998 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Гуров', 'Владимир', 'Анатольевич', 1978, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР Маршал' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Трофимов М.А.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Гуров' AND a.first_name = 'Владимир' AND a.middle_name = 'Анатольевич' AND a.birth_year = 1978 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кирюхин', 'Роман', 'Александрович', 1997, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ФГС КО' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Соловьев А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кирюхин' AND a.first_name = 'Роман' AND a.middle_name = 'Александрович' AND a.birth_year = 1997 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Булгаков', 'Денис', 'Витальевич', 1984, 'm', (SELECT id FROM regions WHERE name = 'Московская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО "ВФГС" в Московской области' AND region_id = (SELECT id FROM regions WHERE name = 'Московская область' AND country = 'RU')), 'Усс В.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Булгаков' AND a.first_name = 'Денис' AND a.middle_name = 'Витальевич' AND a.birth_year = 1984 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Конышев', 'Данила', 'Константинович', 2006, 'm', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КСШ №1/ВАВПВО' AND region_id = (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')), 'Калякин С.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Конышев' AND a.first_name = 'Данила' AND a.middle_name = 'Константинович' AND a.birth_year = 2006 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кулик', 'Никита', 'Алексеевич', 2005, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Ландин А.Ю., Турищев Д.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кулик' AND a.first_name = 'Никита' AND a.middle_name = 'Алексеевич' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Шилихина', 'Дарья', 'Павловна', 2006, 'f', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КСШ №1/СГУС' AND region_id = (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')), 'Сергеев С.В., Бирюков С.Н., Иванов Е.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Шилихина' AND a.first_name = 'Дарья' AND a.middle_name = 'Павловна' AND a.birth_year = 2006 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Фомина', 'Елизавета', 'Алексеевна', 2009, 'f', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР 5 г Белгород' AND region_id = (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')), 'Меркулин С.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Фомина' AND a.first_name = 'Елизавета' AND a.middle_name = 'Алексеевна' AND a.birth_year = 2009 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Чернова', 'Кира', 'Николаевна', 2009, 'f', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР «Маршал»' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Барбакова Н.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Чернова' AND a.first_name = 'Кира' AND a.middle_name = 'Николаевна' AND a.birth_year = 2009 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Щекина', 'Алеся', 'Константиновна', 2002, 'f', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ "ОСКОЛ"' AND region_id = (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')), 'Ермаков К.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Щекина' AND a.first_name = 'Алеся' AND a.middle_name = 'Константиновна' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Цвик', 'Данил', 'Александрович', 2003, 'm', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КСШ № 1' AND region_id = (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')), 'Сергеев С.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Цвик' AND a.first_name = 'Данил' AND a.middle_name = 'Александрович' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Дубинин', 'Максим', 'Николаевич', 1989, 'm', (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР по борьбе' AND region_id = (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU')), 'Гомонов В.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Дубинин' AND a.first_name = 'Максим' AND a.middle_name = 'Николаевич' AND a.birth_year = 1989 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Копаевский', 'Артём', 'Александрович', 2009, 'm', (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШОР "Метеор"' AND region_id = (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU')), 'Егоров В.В.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Копаевский' AND a.first_name = 'Артём' AND a.middle_name = 'Александрович' AND a.birth_year = 2009 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Багров', 'Максим', 'Дмитриевич', 2009, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО «ВФГС» в г. Москве' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Соловьёв А.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Багров' AND a.first_name = 'Максим' AND a.middle_name = 'Дмитриевич' AND a.birth_year = 2009 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Фомин', 'Фёдор', 'Алексеевич', 2004, 'm', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР 5 г Белгород' AND region_id = (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')), 'Меркулин С.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Фомин' AND a.first_name = 'Фёдор' AND a.middle_name = 'Алексеевич' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Сушков', 'Владимир', 'Валерьевия', 2000, 'm', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ "ОСКОЛ"/СШОР 5 Белгород' AND region_id = (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')), 'Ермаков К.И., Вильган А.П.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Сушков' AND a.first_name = 'Владимир' AND a.middle_name = 'Валерьевия' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Шахрай', 'Владислав', 'Сергеевич', 2002, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО «ВФГС» в г. Москве' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Ландин А.Ю.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Шахрай' AND a.first_name = 'Владислав' AND a.middle_name = 'Сергеевич' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Науменко', 'Мирослав', 'Константинович', 2007, 'm', (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШОР "Метеор"' AND region_id = (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU')), 'Федулов А.Ю.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Науменко' AND a.first_name = 'Мирослав' AND a.middle_name = 'Константинович' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Астахов', 'Евгений', 'Михайлович', 2002, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ГБУ ДО МКСШОР "Запад" отделение "Семёрка"' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Ландин А.Ю., Турищев Д.В., Ромашин Ю.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Астахов' AND a.first_name = 'Евгений' AND a.middle_name = 'Михайлович' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Лебеденко', 'Андрей', 'Евгеньевич', 2008, 'm', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ "ОСКОЛ"' AND region_id = (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')), 'Фиронов Ю.Г.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Лебеденко' AND a.first_name = 'Андрей' AND a.middle_name = 'Евгеньевич' AND a.birth_year = 2008 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Савинов', 'Андрей', 'Вячеславович', 1984, 'm', (SELECT id FROM regions WHERE name = 'Владимирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Владимирская область' AND region_id = (SELECT id FROM regions WHERE name = 'Владимирская область' AND country = 'RU')), 'Пономарев Д.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Савинов' AND a.first_name = 'Андрей' AND a.middle_name = 'Вячеславович' AND a.birth_year = 1984 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Гордеев', 'Михаил', 'Сергеевич', 1998, 'm', (SELECT id FROM regions WHERE name = 'Московская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО "ВФГС" в Московской области' AND region_id = (SELECT id FROM regions WHERE name = 'Московская область' AND country = 'RU')), 'Руднев С.Л.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Гордеев' AND a.first_name = 'Михаил' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1998 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Тупиков', 'Александр', 'Сергеевич', 1991, 'm', (SELECT id FROM regions WHERE name = 'Ивановская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РОООО "ВФГС по ИО"' AND region_id = (SELECT id FROM regions WHERE name = 'Ивановская область' AND country = 'RU')), 'Кулаков И.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Тупиков' AND a.first_name = 'Александр' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1991 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Курбаков', 'Данила', 'Александрович', 2009, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР Маршал' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Барбакова Н.А.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Курбаков' AND a.first_name = 'Данила' AND a.middle_name = 'Александрович' AND a.birth_year = 2009 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кузьмин', 'Илья', 'Алексеевич', 2007, 'm', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУДО КСШ1 , СГУС' AND region_id = (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')), 'Сергеев С.В., Алферова В.Я., Иванов Е.А.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кузьмин' AND a.first_name = 'Илья' AND a.middle_name = 'Алексеевич' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Аманатиди', 'Михаил', 'Константинович', 2009, 'm', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ "Юность"' AND region_id = (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')), 'Власов А.П.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Аманатиди' AND a.first_name = 'Михаил' AND a.middle_name = 'Константинович' AND a.birth_year = 2009 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Калистратов', 'Артем', 'Валерьевич', 1992, 'm', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КСШ № 1' AND region_id = (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')), 'Сергеев С.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Калистратов' AND a.first_name = 'Артем' AND a.middle_name = 'Валерьевич' AND a.birth_year = 1992 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Фартучный', 'Иван', 'Сергеевич', 2007, 'm', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ "ОСКОЛ"' AND region_id = (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')), 'Ермаков К.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Фартучный' AND a.first_name = 'Иван' AND a.middle_name = 'Сергеевич' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Станкович', 'Боян', NULL, 1988, 'm', (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ЯРОО ФГС' AND region_id = (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU')), 'Барков А.П.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Станкович' AND a.first_name = 'Боян' AND a.middle_name IS NULL AND a.birth_year = 1988 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Дворцов', 'Владимир', 'Владимирович', 1986, 'm', (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР по борьбе' AND region_id = (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU')), 'Гомонов В.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Дворцов' AND a.first_name = 'Владимир' AND a.middle_name = 'Владимирович' AND a.birth_year = 1986 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Митрофанов', 'Тимофей', 'Андреевич', 2009, 'm', (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШОР "Метеор"' AND region_id = (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU')), 'Егоров В.В.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Митрофанов' AND a.first_name = 'Тимофей' AND a.middle_name = 'Андреевич' AND a.birth_year = 2009 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Захаров', 'Станислав', 'Олегович', 1991, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО ВФГС в г. Москве' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Ландин А.Ю.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Захаров' AND a.first_name = 'Станислав' AND a.middle_name = 'Олегович' AND a.birth_year = 1991 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Муссалиев', 'Муса', 'Габиб Оглы', 2007, 'm', (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР по борьбе' AND region_id = (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU')), 'Гомонов В.Н., Лукьянчиков Ю.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Муссалиев' AND a.first_name = 'Муса' AND a.middle_name = 'Габиб Оглы' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Мамедсаатов', 'Егор', 'Русланович', 2008, 'm', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ "Юность"' AND region_id = (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')), 'Власов А.П.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Мамедсаатов' AND a.first_name = 'Егор' AND a.middle_name = 'Русланович' AND a.birth_year = 2008 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Сушков', 'Андрей', 'Васильевич', 1992, 'm', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР 5 г Белгород' AND region_id = (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')), 'Меркулин С.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Сушков' AND a.first_name = 'Андрей' AND a.middle_name = 'Васильевич' AND a.birth_year = 1992 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Исаков', 'Станислав', 'Алексеевич', 2006, 'm', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КСШ №1/ВАВПВО' AND region_id = (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')), 'Калякин С.В.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Исаков' AND a.first_name = 'Станислав' AND a.middle_name = 'Алексеевич' AND a.birth_year = 2006 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Петушков', 'Денис', 'Владимирович', 1986, 'm', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КСШ № 1' AND region_id = (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')), 'Сергеев С.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Петушков' AND a.first_name = 'Денис' AND a.middle_name = 'Владимирович' AND a.birth_year = 1986 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Балашов', 'Максим', 'Юрьевич', 1990, 'm', (SELECT id FROM regions WHERE name = 'Ивановская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Ивановское региональное отделение' AND region_id = (SELECT id FROM regions WHERE name = 'Ивановская область' AND country = 'RU')), 'Салов П.С.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Балашов' AND a.first_name = 'Максим' AND a.middle_name = 'Юрьевич' AND a.birth_year = 1990 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Савинов', 'Роман', 'Сергеевич', 1993, 'm', (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ СШОР Метеор' AND region_id = (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU')), 'Гоголев М.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Савинов' AND a.first_name = 'Роман' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1993 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кобелев', 'Сергей', 'Сергеевич', 1987, 'm', (SELECT id FROM regions WHERE name = 'Владимирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО "ВФГС" во Владимирской области' AND region_id = (SELECT id FROM regions WHERE name = 'Владимирская область' AND country = 'RU')), 'Арифулин А.Н.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кобелев' AND a.first_name = 'Сергей' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1987 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Евгиненков', 'Владимир', 'Александрович', 2009, 'm', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КСШ № 1' AND region_id = (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')), 'Шванев В.Б.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Евгиненков' AND a.first_name = 'Владимир' AND a.middle_name = 'Александрович' AND a.birth_year = 2009 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Дьячков', 'Олег', 'Сергеевич', 1995, 'm', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР 5 г Белгород' AND region_id = (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')), 'Меркулин С.В.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Дьячков' AND a.first_name = 'Олег' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1995 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Гинда', 'Денис', 'Петрович', 1979, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО «ВФГС» в г. Москве' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Рябченко А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Гинда' AND a.first_name = 'Денис' AND a.middle_name = 'Петрович' AND a.birth_year = 1979 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Спиридонов', 'Михаил', 'Борисович', 1988, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО "ВФГС" в городе Москве' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Шаповалов Е.Г.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Спиридонов' AND a.first_name = 'Михаил' AND a.middle_name = 'Борисович' AND a.birth_year = 1988 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Рассолов', 'Сергей', 'Сергеевич', 1990, 'm', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР 5 г Белгород' AND region_id = (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')), 'Меркулин С.В.', (SELECT id FROM sport_ranks WHERE code = 'ii')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Рассолов' AND a.first_name = 'Сергей' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1990 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бас', 'Денис', 'Николаевич', 2007, 'm', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР 5 г Белгород/ МБУ ДО ДЮСШ Волоконовский район' AND region_id = (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')), 'Вильган А.П., Осадчий Е.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бас' AND a.first_name = 'Денис' AND a.middle_name = 'Николаевич' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Мартысюк', 'Сергей', 'Сергеевич', 2010, 'm', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КСШ № 1' AND region_id = (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')), 'Сергеев С.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Мартысюк' AND a.first_name = 'Сергей' AND a.middle_name = 'Сергеевич' AND a.birth_year = 2010 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Шамара', 'Леонард', 'Леонидович', 1974, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО ВФГС в г. Москве' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Тарвердиева М.А., Симушин А.Л.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Шамара' AND a.first_name = 'Леонард' AND a.middle_name = 'Леонидович' AND a.birth_year = 1974 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кузовлев', 'Иван', 'Николаевич', 1985, 'm', (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ЯРОО ФГС' AND region_id = (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU')), 'Егоров В.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кузовлев' AND a.first_name = 'Иван' AND a.middle_name = 'Николаевич' AND a.birth_year = 1985 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Малашта', 'Роман', 'Анатольевич', 1987, 'm', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР 5 г Белгород' AND region_id = (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')), 'Меркулин С.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Малашта' AND a.first_name = 'Роман' AND a.middle_name = 'Анатольевич' AND a.birth_year = 1987 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Турищев', 'Михаил', 'Михайлович', 2007, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Ландин А.Ю., Турищев Д.В., Сергеев С.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Турищев' AND a.first_name = 'Михаил' AND a.middle_name = 'Михайлович' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Чернышев', 'Павел', 'Вадимович', 2007, 'm', (SELECT id FROM regions WHERE name = 'Рязанская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ДДЮ Алые Паруса' AND region_id = (SELECT id FROM regions WHERE name = 'Рязанская область' AND country = 'RU')), 'Виктор В.В.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Чернышев' AND a.first_name = 'Павел' AND a.middle_name = 'Вадимович' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ларечнев', 'Алексей', 'Викторович', 1981, 'm', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Sapa Fitness' AND region_id = (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')), 'Петушков Д.В., Римашевский А.Л.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ларечнев' AND a.first_name = 'Алексей' AND a.middle_name = 'Викторович' AND a.birth_year = 1981 LIMIT 1);

INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'trofimova-milena-2007' AND s.athlete_id <> a.id)
              THEN 'trofimova-milena-2007-' || a.id ELSE 'trofimova-milena-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Трофимова' AND first_name = 'Милена' AND middle_name = 'Михайловна' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'gribanova-irina-2004' AND s.athlete_id <> a.id)
              THEN 'gribanova-irina-2004-' || a.id ELSE 'gribanova-irina-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Грибанова' AND first_name = 'Ирина' AND middle_name = 'Александровна' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'piven-aleksandra-2004' AND s.athlete_id <> a.id)
              THEN 'piven-aleksandra-2004-' || a.id ELSE 'piven-aleksandra-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Пивень' AND first_name = 'Александра' AND middle_name = 'Максимовна' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'martynova-lyubov-2007' AND s.athlete_id <> a.id)
              THEN 'martynova-lyubov-2007-' || a.id ELSE 'martynova-lyubov-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Мартынова' AND first_name = 'Любовь' AND middle_name = 'Владимировна' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'podolskaya-anastasiya-2005' AND s.athlete_id <> a.id)
              THEN 'podolskaya-anastasiya-2005-' || a.id ELSE 'podolskaya-anastasiya-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Подольская' AND first_name = 'Анастасия' AND middle_name = 'Владимировна' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'perepletova-yana-2009' AND s.athlete_id <> a.id)
              THEN 'perepletova-yana-2009-' || a.id ELSE 'perepletova-yana-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Переплетова' AND first_name = 'Яна' AND middle_name = 'Васильевна' AND birth_year = 2009 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'martynova-irina-1999' AND s.athlete_id <> a.id)
              THEN 'martynova-irina-1999-' || a.id ELSE 'martynova-irina-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Мартынова' AND first_name = 'Ирина' AND middle_name = 'Александровна' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'verhovceva-ekaterina-2003' AND s.athlete_id <> a.id)
              THEN 'verhovceva-ekaterina-2003-' || a.id ELSE 'verhovceva-ekaterina-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Верховцева' AND first_name = 'Екатерина' AND middle_name = 'Николаевна' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'poberezhnaya-anna-2010' AND s.athlete_id <> a.id)
              THEN 'poberezhnaya-anna-2010-' || a.id ELSE 'poberezhnaya-anna-2010' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Побережная' AND first_name = 'Анна' AND middle_name = 'Владимировна' AND birth_year = 2010 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'yakubenkova-anna-2007' AND s.athlete_id <> a.id)
              THEN 'yakubenkova-anna-2007-' || a.id ELSE 'yakubenkova-anna-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Якубенкова' AND first_name = 'Анна' AND middle_name = 'Андреевна' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'voropaeva-viktoriya-2004' AND s.athlete_id <> a.id)
              THEN 'voropaeva-viktoriya-2004-' || a.id ELSE 'voropaeva-viktoriya-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Воропаева' AND first_name = 'Виктория' AND middle_name = 'Витальевна' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'alyanova-viktoriya-2004' AND s.athlete_id <> a.id)
              THEN 'alyanova-viktoriya-2004-' || a.id ELSE 'alyanova-viktoriya-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Альянова' AND first_name = 'Виктория' AND middle_name = 'Евгеньевна' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sorokina-olga-2003' AND s.athlete_id <> a.id)
              THEN 'sorokina-olga-2003-' || a.id ELSE 'sorokina-olga-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Сорокина' AND first_name = 'Ольга' AND middle_name = 'Андреевна' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'schekina-anna-2012' AND s.athlete_id <> a.id)
              THEN 'schekina-anna-2012-' || a.id ELSE 'schekina-anna-2012' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Щекина' AND first_name = 'Анна' AND middle_name = 'Константиновна' AND birth_year = 2012 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'arsentev-vitaliy-2001' AND s.athlete_id <> a.id)
              THEN 'arsentev-vitaliy-2001-' || a.id ELSE 'arsentev-vitaliy-2001' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Арсентьев' AND first_name = 'Виталий' AND middle_name = 'Александрович' AND birth_year = 2001 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kormilicyn-ivan-2010' AND s.athlete_id <> a.id)
              THEN 'kormilicyn-ivan-2010-' || a.id ELSE 'kormilicyn-ivan-2010' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кормилицын' AND first_name = 'Иван' AND middle_name = 'Николаевич' AND birth_year = 2010 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'krivko-nikita-2002' AND s.athlete_id <> a.id)
              THEN 'krivko-nikita-2002-' || a.id ELSE 'krivko-nikita-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кривко' AND first_name = 'Никита' AND middle_name = 'Алексеевич' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'budanov-grigoriy-2010' AND s.athlete_id <> a.id)
              THEN 'budanov-grigoriy-2010-' || a.id ELSE 'budanov-grigoriy-2010' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Буданов' AND first_name = 'Григорий' AND middle_name = 'Денисович' AND birth_year = 2010 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zuev-vladislav-2000' AND s.athlete_id <> a.id)
              THEN 'zuev-vladislav-2000-' || a.id ELSE 'zuev-vladislav-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Зуев' AND first_name = 'Владислав' AND middle_name = 'Алексеевич' AND birth_year = 2000 LIMIT 1)
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
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'podvolockiy-sergey-1997' AND s.athlete_id <> a.id)
              THEN 'podvolockiy-sergey-1997-' || a.id ELSE 'podvolockiy-sergey-1997' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Подволоцкий' AND first_name = 'Сергей' AND middle_name = 'Александрович' AND birth_year = 1997 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'puhuchkin-evgeniy-1979' AND s.athlete_id <> a.id)
              THEN 'puhuchkin-evgeniy-1979-' || a.id ELSE 'puhuchkin-evgeniy-1979' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Пухучкин' AND first_name = 'Евгений' AND middle_name = 'Викторович' AND birth_year = 1979 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'trofimov-timur-2011' AND s.athlete_id <> a.id)
              THEN 'trofimov-timur-2011-' || a.id ELSE 'trofimov-timur-2011' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Трофимов' AND first_name = 'Тимур' AND middle_name = 'Михайлович' AND birth_year = 2011 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sergeev-aleksandr-1991' AND s.athlete_id <> a.id)
              THEN 'sergeev-aleksandr-1991-' || a.id ELSE 'sergeev-aleksandr-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Сергеев' AND first_name = 'Александр' AND middle_name = 'Сергеевич' AND birth_year = 1991 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'vasin-artem-2007' AND s.athlete_id <> a.id)
              THEN 'vasin-artem-2007-' || a.id ELSE 'vasin-artem-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Васин' AND first_name = 'Артём' AND middle_name = 'Иванович' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lisicyn-kirill-2007' AND s.athlete_id <> a.id)
              THEN 'lisicyn-kirill-2007-' || a.id ELSE 'lisicyn-kirill-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Лисицын' AND first_name = 'Кирилл' AND middle_name = 'Сергеевич' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ismailov-artem-2008' AND s.athlete_id <> a.id)
              THEN 'ismailov-artem-2008-' || a.id ELSE 'ismailov-artem-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Исмаилов' AND first_name = 'Артём' AND middle_name = 'Николаевич' AND birth_year = 2008 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'schipkov-daniil-2009' AND s.athlete_id <> a.id)
              THEN 'schipkov-daniil-2009-' || a.id ELSE 'schipkov-daniil-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Щипков' AND first_name = 'Даниил' AND middle_name = 'Олегович' AND birth_year = 2009 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'suleymanov-movsar-1989' AND s.athlete_id <> a.id)
              THEN 'suleymanov-movsar-1989-' || a.id ELSE 'suleymanov-movsar-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Сулейманов' AND first_name = 'Мовсар' AND middle_name = 'Мусаевич' AND birth_year = 1989 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'vanin-viktor-1991' AND s.athlete_id <> a.id)
              THEN 'vanin-viktor-1991-' || a.id ELSE 'vanin-viktor-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ванин' AND first_name = 'Виктор' AND middle_name = 'Викторович' AND birth_year = 1991 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'volodin-denis-1993' AND s.athlete_id <> a.id)
              THEN 'volodin-denis-1993-' || a.id ELSE 'volodin-denis-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Володин' AND first_name = 'Денис' AND middle_name = 'Игоревич' AND birth_year = 1993 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lucenko-nikita-2003' AND s.athlete_id <> a.id)
              THEN 'lucenko-nikita-2003-' || a.id ELSE 'lucenko-nikita-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Луценко' AND first_name = 'Никита' AND middle_name = 'Ильич' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'polyakov-matvey-2002' AND s.athlete_id <> a.id)
              THEN 'polyakov-matvey-2002-' || a.id ELSE 'polyakov-matvey-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Поляков' AND first_name = 'Матвей' AND middle_name = 'Юрьевич' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lade-roman-1991' AND s.athlete_id <> a.id)
              THEN 'lade-roman-1991-' || a.id ELSE 'lade-roman-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ладе' AND first_name = 'Роман' AND middle_name = 'Андреевич' AND birth_year = 1991 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'abdrazakov-rafik-2002' AND s.athlete_id <> a.id)
              THEN 'abdrazakov-rafik-2002-' || a.id ELSE 'abdrazakov-rafik-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Абдразаков' AND first_name = 'Рафик' AND middle_name = 'Шавкатович' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'bogdanov-mihail-2007' AND s.athlete_id <> a.id)
              THEN 'bogdanov-mihail-2007-' || a.id ELSE 'bogdanov-mihail-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Богданов' AND first_name = 'Михаил' AND middle_name = 'Юрьевич' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'maslennikov-ivan-2011' AND s.athlete_id <> a.id)
              THEN 'maslennikov-ivan-2011-' || a.id ELSE 'maslennikov-ivan-2011' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Масленников' AND first_name = 'Иван' AND middle_name = 'Валерьевич' AND birth_year = 2011 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'andruschenko-sergey-2005' AND s.athlete_id <> a.id)
              THEN 'andruschenko-sergey-2005-' || a.id ELSE 'andruschenko-sergey-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Андрущенко' AND first_name = 'Сергей' AND middle_name = 'Александрович' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'muhitov-andrey-1999' AND s.athlete_id <> a.id)
              THEN 'muhitov-andrey-1999-' || a.id ELSE 'muhitov-andrey-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Мухитов' AND first_name = 'Андрей' AND middle_name = 'Вячеславович' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'vetrov-denis-1989' AND s.athlete_id <> a.id)
              THEN 'vetrov-denis-1989-' || a.id ELSE 'vetrov-denis-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ветров' AND first_name = 'Денис' AND middle_name = 'Сергеевич' AND birth_year = 1989 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'gnezdilov-roman-1990' AND s.athlete_id <> a.id)
              THEN 'gnezdilov-roman-1990-' || a.id ELSE 'gnezdilov-roman-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Гнездилов' AND first_name = 'Роман' AND middle_name = 'Сергеевич' AND birth_year = 1990 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ovchinnikov-nikita-2000' AND s.athlete_id <> a.id)
              THEN 'ovchinnikov-nikita-2000-' || a.id ELSE 'ovchinnikov-nikita-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Овчинников' AND first_name = 'Никита' AND middle_name = 'Олегович' AND birth_year = 2000 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kvasov-aleksandr-2006' AND s.athlete_id <> a.id)
              THEN 'kvasov-aleksandr-2006-' || a.id ELSE 'kvasov-aleksandr-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Квасов' AND first_name = 'Александр' AND middle_name = 'Юрьевич' AND birth_year = 2006 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'vitkov-aleksey-1990' AND s.athlete_id <> a.id)
              THEN 'vitkov-aleksey-1990-' || a.id ELSE 'vitkov-aleksey-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Витков' AND first_name = 'Алексей' AND middle_name = 'Викторович' AND birth_year = 1990 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'nasibov-turan-2010' AND s.athlete_id <> a.id)
              THEN 'nasibov-turan-2010-' || a.id ELSE 'nasibov-turan-2010' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Насибов' AND first_name = 'Туран' AND middle_name = 'Гурбанович' AND birth_year = 2010 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zakatov-ruslan-2007' AND s.athlete_id <> a.id)
              THEN 'zakatov-ruslan-2007-' || a.id ELSE 'zakatov-ruslan-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Закатов' AND first_name = 'Руслан' AND middle_name = 'Александрович' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'turischev-dmitriy-1992' AND s.athlete_id <> a.id)
              THEN 'turischev-dmitriy-1992-' || a.id ELSE 'turischev-dmitriy-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Турищев' AND first_name = 'Дмитрий' AND middle_name = 'Владимирович' AND birth_year = 1992 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'rozmaznin-ilya-2000' AND s.athlete_id <> a.id)
              THEN 'rozmaznin-ilya-2000-' || a.id ELSE 'rozmaznin-ilya-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Розмазнин' AND first_name = 'Илья' AND middle_name = 'Владимирович' AND birth_year = 2000 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'potatuev-artem-1992' AND s.athlete_id <> a.id)
              THEN 'potatuev-artem-1992-' || a.id ELSE 'potatuev-artem-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Потатуев' AND first_name = 'Артём' AND middle_name = 'Александрович' AND birth_year = 1992 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ilin-anton-1992' AND s.athlete_id <> a.id)
              THEN 'ilin-anton-1992-' || a.id ELSE 'ilin-anton-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ильин' AND first_name = 'Антон' AND middle_name = 'Андреевич' AND birth_year = 1992 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'slaschev-stepan-2008' AND s.athlete_id <> a.id)
              THEN 'slaschev-stepan-2008-' || a.id ELSE 'slaschev-stepan-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Слащев' AND first_name = 'Степан' AND middle_name = 'Сергеевич' AND birth_year = 2008 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lysikov-yaroslav-2006' AND s.athlete_id <> a.id)
              THEN 'lysikov-yaroslav-2006-' || a.id ELSE 'lysikov-yaroslav-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Лысиков' AND first_name = 'Ярослав' AND middle_name = 'Александрович' AND birth_year = 2006 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kulakov-ivan-1998' AND s.athlete_id <> a.id)
              THEN 'kulakov-ivan-1998-' || a.id ELSE 'kulakov-ivan-1998' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кулаков' AND first_name = 'Иван' AND middle_name = 'Иванович' AND birth_year = 1998 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'gurov-vladimir-1978' AND s.athlete_id <> a.id)
              THEN 'gurov-vladimir-1978-' || a.id ELSE 'gurov-vladimir-1978' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Гуров' AND first_name = 'Владимир' AND middle_name = 'Анатольевич' AND birth_year = 1978 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kiryuhin-roman-1997' AND s.athlete_id <> a.id)
              THEN 'kiryuhin-roman-1997-' || a.id ELSE 'kiryuhin-roman-1997' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кирюхин' AND first_name = 'Роман' AND middle_name = 'Александрович' AND birth_year = 1997 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'bulgakov-denis-1984' AND s.athlete_id <> a.id)
              THEN 'bulgakov-denis-1984-' || a.id ELSE 'bulgakov-denis-1984' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Булгаков' AND first_name = 'Денис' AND middle_name = 'Витальевич' AND birth_year = 1984 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'konyshev-danila-2006' AND s.athlete_id <> a.id)
              THEN 'konyshev-danila-2006-' || a.id ELSE 'konyshev-danila-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Конышев' AND first_name = 'Данила' AND middle_name = 'Константинович' AND birth_year = 2006 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kulik-nikita-2005' AND s.athlete_id <> a.id)
              THEN 'kulik-nikita-2005-' || a.id ELSE 'kulik-nikita-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кулик' AND first_name = 'Никита' AND middle_name = 'Алексеевич' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'shilihina-darya-2006' AND s.athlete_id <> a.id)
              THEN 'shilihina-darya-2006-' || a.id ELSE 'shilihina-darya-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Шилихина' AND first_name = 'Дарья' AND middle_name = 'Павловна' AND birth_year = 2006 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'fomina-elizaveta-2009' AND s.athlete_id <> a.id)
              THEN 'fomina-elizaveta-2009-' || a.id ELSE 'fomina-elizaveta-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Фомина' AND first_name = 'Елизавета' AND middle_name = 'Алексеевна' AND birth_year = 2009 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'chernova-kira-2009' AND s.athlete_id <> a.id)
              THEN 'chernova-kira-2009-' || a.id ELSE 'chernova-kira-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Чернова' AND first_name = 'Кира' AND middle_name = 'Николаевна' AND birth_year = 2009 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'schekina-alesya-2002' AND s.athlete_id <> a.id)
              THEN 'schekina-alesya-2002-' || a.id ELSE 'schekina-alesya-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Щекина' AND first_name = 'Алеся' AND middle_name = 'Константиновна' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'cvik-danil-2003' AND s.athlete_id <> a.id)
              THEN 'cvik-danil-2003-' || a.id ELSE 'cvik-danil-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Цвик' AND first_name = 'Данил' AND middle_name = 'Александрович' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'dubinin-maksim-1989' AND s.athlete_id <> a.id)
              THEN 'dubinin-maksim-1989-' || a.id ELSE 'dubinin-maksim-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Дубинин' AND first_name = 'Максим' AND middle_name = 'Николаевич' AND birth_year = 1989 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kopaevskiy-artem-2009' AND s.athlete_id <> a.id)
              THEN 'kopaevskiy-artem-2009-' || a.id ELSE 'kopaevskiy-artem-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Копаевский' AND first_name = 'Артём' AND middle_name = 'Александрович' AND birth_year = 2009 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'bagrov-maksim-2009' AND s.athlete_id <> a.id)
              THEN 'bagrov-maksim-2009-' || a.id ELSE 'bagrov-maksim-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Багров' AND first_name = 'Максим' AND middle_name = 'Дмитриевич' AND birth_year = 2009 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'fomin-fedor-2004' AND s.athlete_id <> a.id)
              THEN 'fomin-fedor-2004-' || a.id ELSE 'fomin-fedor-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Фомин' AND first_name = 'Фёдор' AND middle_name = 'Алексеевич' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sushkov-vladimir-2000' AND s.athlete_id <> a.id)
              THEN 'sushkov-vladimir-2000-' || a.id ELSE 'sushkov-vladimir-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Сушков' AND first_name = 'Владимир' AND middle_name = 'Валерьевия' AND birth_year = 2000 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'shahray-vladislav-2002' AND s.athlete_id <> a.id)
              THEN 'shahray-vladislav-2002-' || a.id ELSE 'shahray-vladislav-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Шахрай' AND first_name = 'Владислав' AND middle_name = 'Сергеевич' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'naumenko-miroslav-2007' AND s.athlete_id <> a.id)
              THEN 'naumenko-miroslav-2007-' || a.id ELSE 'naumenko-miroslav-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Науменко' AND first_name = 'Мирослав' AND middle_name = 'Константинович' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'astahov-evgeniy-2002' AND s.athlete_id <> a.id)
              THEN 'astahov-evgeniy-2002-' || a.id ELSE 'astahov-evgeniy-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Астахов' AND first_name = 'Евгений' AND middle_name = 'Михайлович' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lebedenko-andrey-2008' AND s.athlete_id <> a.id)
              THEN 'lebedenko-andrey-2008-' || a.id ELSE 'lebedenko-andrey-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Лебеденко' AND first_name = 'Андрей' AND middle_name = 'Евгеньевич' AND birth_year = 2008 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'savinov-andrey-1984' AND s.athlete_id <> a.id)
              THEN 'savinov-andrey-1984-' || a.id ELSE 'savinov-andrey-1984' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Савинов' AND first_name = 'Андрей' AND middle_name = 'Вячеславович' AND birth_year = 1984 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'gordeev-mihail-1998' AND s.athlete_id <> a.id)
              THEN 'gordeev-mihail-1998-' || a.id ELSE 'gordeev-mihail-1998' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Гордеев' AND first_name = 'Михаил' AND middle_name = 'Сергеевич' AND birth_year = 1998 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'tupikov-aleksandr-1991' AND s.athlete_id <> a.id)
              THEN 'tupikov-aleksandr-1991-' || a.id ELSE 'tupikov-aleksandr-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Тупиков' AND first_name = 'Александр' AND middle_name = 'Сергеевич' AND birth_year = 1991 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kurbakov-danila-2009' AND s.athlete_id <> a.id)
              THEN 'kurbakov-danila-2009-' || a.id ELSE 'kurbakov-danila-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Курбаков' AND first_name = 'Данила' AND middle_name = 'Александрович' AND birth_year = 2009 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kuzmin-ilya-2007' AND s.athlete_id <> a.id)
              THEN 'kuzmin-ilya-2007-' || a.id ELSE 'kuzmin-ilya-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кузьмин' AND first_name = 'Илья' AND middle_name = 'Алексеевич' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'amanatidi-mihail-2009' AND s.athlete_id <> a.id)
              THEN 'amanatidi-mihail-2009-' || a.id ELSE 'amanatidi-mihail-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Аманатиди' AND first_name = 'Михаил' AND middle_name = 'Константинович' AND birth_year = 2009 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kalistratov-artem-1992' AND s.athlete_id <> a.id)
              THEN 'kalistratov-artem-1992-' || a.id ELSE 'kalistratov-artem-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Калистратов' AND first_name = 'Артем' AND middle_name = 'Валерьевич' AND birth_year = 1992 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'fartuchnyy-ivan-2007' AND s.athlete_id <> a.id)
              THEN 'fartuchnyy-ivan-2007-' || a.id ELSE 'fartuchnyy-ivan-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Фартучный' AND first_name = 'Иван' AND middle_name = 'Сергеевич' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'stankovich-boyan-1988' AND s.athlete_id <> a.id)
              THEN 'stankovich-boyan-1988-' || a.id ELSE 'stankovich-boyan-1988' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Станкович' AND first_name = 'Боян' AND middle_name IS NULL AND birth_year = 1988 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'dvorcov-vladimir-1986' AND s.athlete_id <> a.id)
              THEN 'dvorcov-vladimir-1986-' || a.id ELSE 'dvorcov-vladimir-1986' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Дворцов' AND first_name = 'Владимир' AND middle_name = 'Владимирович' AND birth_year = 1986 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'mitrofanov-timofey-2009' AND s.athlete_id <> a.id)
              THEN 'mitrofanov-timofey-2009-' || a.id ELSE 'mitrofanov-timofey-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Митрофанов' AND first_name = 'Тимофей' AND middle_name = 'Андреевич' AND birth_year = 2009 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zaharov-stanislav-1991' AND s.athlete_id <> a.id)
              THEN 'zaharov-stanislav-1991-' || a.id ELSE 'zaharov-stanislav-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Захаров' AND first_name = 'Станислав' AND middle_name = 'Олегович' AND birth_year = 1991 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'mussaliev-musa-2007' AND s.athlete_id <> a.id)
              THEN 'mussaliev-musa-2007-' || a.id ELSE 'mussaliev-musa-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Муссалиев' AND first_name = 'Муса' AND middle_name = 'Габиб Оглы' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'mamedsaatov-egor-2008' AND s.athlete_id <> a.id)
              THEN 'mamedsaatov-egor-2008-' || a.id ELSE 'mamedsaatov-egor-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Мамедсаатов' AND first_name = 'Егор' AND middle_name = 'Русланович' AND birth_year = 2008 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sushkov-andrey-1992' AND s.athlete_id <> a.id)
              THEN 'sushkov-andrey-1992-' || a.id ELSE 'sushkov-andrey-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Сушков' AND first_name = 'Андрей' AND middle_name = 'Васильевич' AND birth_year = 1992 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'isakov-stanislav-2006' AND s.athlete_id <> a.id)
              THEN 'isakov-stanislav-2006-' || a.id ELSE 'isakov-stanislav-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Исаков' AND first_name = 'Станислав' AND middle_name = 'Алексеевич' AND birth_year = 2006 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'petushkov-denis-1986' AND s.athlete_id <> a.id)
              THEN 'petushkov-denis-1986-' || a.id ELSE 'petushkov-denis-1986' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Петушков' AND first_name = 'Денис' AND middle_name = 'Владимирович' AND birth_year = 1986 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'balashov-maksim-1990' AND s.athlete_id <> a.id)
              THEN 'balashov-maksim-1990-' || a.id ELSE 'balashov-maksim-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Балашов' AND first_name = 'Максим' AND middle_name = 'Юрьевич' AND birth_year = 1990 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'savinov-roman-1993' AND s.athlete_id <> a.id)
              THEN 'savinov-roman-1993-' || a.id ELSE 'savinov-roman-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Савинов' AND first_name = 'Роман' AND middle_name = 'Сергеевич' AND birth_year = 1993 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kobelev-sergey-1987' AND s.athlete_id <> a.id)
              THEN 'kobelev-sergey-1987-' || a.id ELSE 'kobelev-sergey-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кобелев' AND first_name = 'Сергей' AND middle_name = 'Сергеевич' AND birth_year = 1987 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'evginenkov-vladimir-2009' AND s.athlete_id <> a.id)
              THEN 'evginenkov-vladimir-2009-' || a.id ELSE 'evginenkov-vladimir-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Евгиненков' AND first_name = 'Владимир' AND middle_name = 'Александрович' AND birth_year = 2009 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'dyachkov-oleg-1995' AND s.athlete_id <> a.id)
              THEN 'dyachkov-oleg-1995-' || a.id ELSE 'dyachkov-oleg-1995' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Дьячков' AND first_name = 'Олег' AND middle_name = 'Сергеевич' AND birth_year = 1995 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ginda-denis-1979' AND s.athlete_id <> a.id)
              THEN 'ginda-denis-1979-' || a.id ELSE 'ginda-denis-1979' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Гинда' AND first_name = 'Денис' AND middle_name = 'Петрович' AND birth_year = 1979 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'spiridonov-mihail-1988' AND s.athlete_id <> a.id)
              THEN 'spiridonov-mihail-1988-' || a.id ELSE 'spiridonov-mihail-1988' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Спиридонов' AND first_name = 'Михаил' AND middle_name = 'Борисович' AND birth_year = 1988 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'rassolov-sergey-1990' AND s.athlete_id <> a.id)
              THEN 'rassolov-sergey-1990-' || a.id ELSE 'rassolov-sergey-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Рассолов' AND first_name = 'Сергей' AND middle_name = 'Сергеевич' AND birth_year = 1990 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'bas-denis-2007' AND s.athlete_id <> a.id)
              THEN 'bas-denis-2007-' || a.id ELSE 'bas-denis-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бас' AND first_name = 'Денис' AND middle_name = 'Николаевич' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'martysyuk-sergey-2010' AND s.athlete_id <> a.id)
              THEN 'martysyuk-sergey-2010-' || a.id ELSE 'martysyuk-sergey-2010' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Мартысюк' AND first_name = 'Сергей' AND middle_name = 'Сергеевич' AND birth_year = 2010 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'shamara-leonard-1974' AND s.athlete_id <> a.id)
              THEN 'shamara-leonard-1974-' || a.id ELSE 'shamara-leonard-1974' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Шамара' AND first_name = 'Леонард' AND middle_name = 'Леонидович' AND birth_year = 1974 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kuzovlev-ivan-1985' AND s.athlete_id <> a.id)
              THEN 'kuzovlev-ivan-1985-' || a.id ELSE 'kuzovlev-ivan-1985' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кузовлев' AND first_name = 'Иван' AND middle_name = 'Николаевич' AND birth_year = 1985 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'malashta-roman-1987' AND s.athlete_id <> a.id)
              THEN 'malashta-roman-1987-' || a.id ELSE 'malashta-roman-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Малашта' AND first_name = 'Роман' AND middle_name = 'Анатольевич' AND birth_year = 1987 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'turischev-mihail-2007' AND s.athlete_id <> a.id)
              THEN 'turischev-mihail-2007-' || a.id ELSE 'turischev-mihail-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Турищев' AND first_name = 'Михаил' AND middle_name = 'Михайлович' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'chernyshev-pavel-2007' AND s.athlete_id <> a.id)
              THEN 'chernyshev-pavel-2007-' || a.id ELSE 'chernyshev-pavel-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Чернышев' AND first_name = 'Павел' AND middle_name = 'Вадимович' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'larechnev-aleksey-1981' AND s.athlete_id <> a.id)
              THEN 'larechnev-aleksey-1981-' || a.id ELSE 'larechnev-aleksey-1981' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ларечнев' AND first_name = 'Алексей' AND middle_name = 'Викторович' AND birth_year = 1981 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);

INSERT INTO results (id, category_id, athlete_id, place, total_reps, points, body_weight_kg, rank_achieved_id, discipline_id, bell_kg, hands, time_limit_min, competition_id, event_date, raw_name, raw_club, raw_region, protocol_id, source_page) VALUES
  (8001, 8001, (SELECT id FROM athletes WHERE last_name = 'Трофимова' AND first_name = 'Милена' AND middle_name = 'Михайловна' AND birth_year = 2007 LIMIT 1), 1, 69, NULL, 58.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 8001, '2026-04-13', 'Трофимова Милена Михайловна', 'СШОР Маршал', 'Калужская область', 8001, 24),
  (8002, 8001, (SELECT id FROM athletes WHERE last_name = 'Грибанова' AND first_name = 'Ирина' AND middle_name = 'Александровна' AND birth_year = 2004 LIMIT 1), 2, 32, NULL, 57.02, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 8001, '2026-04-13', 'Грибанова Ирина Александровна', 'КСШ № 1/СГУС', 'Смоленская область', 8001, 24),
  (8003, 8002, (SELECT id FROM athletes WHERE last_name = 'Пивень' AND first_name = 'Александра' AND middle_name = 'Максимовна' AND birth_year = 2004 LIMIT 1), 1, 85, NULL, 60.45, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 8001, '2026-04-13', 'Пивень Александра Максимовна', 'СШОР «Маршал»', 'Калужская область', 8001, 25),
  (8004, 8002, (SELECT id FROM athletes WHERE last_name = 'Мартынова' AND first_name = 'Любовь' AND middle_name = 'Владимировна' AND birth_year = 2007 LIMIT 1), 2, 62, NULL, 62.95, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 8001, '2026-04-13', 'Мартынова Любовь Владимировна', 'ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»', 'г. Москва', 8001, 25),
  (8005, 8002, (SELECT id FROM athletes WHERE last_name = 'Подольская' AND first_name = 'Анастасия' AND middle_name = 'Владимировна' AND birth_year = 2005 LIMIT 1), 3, 51, NULL, 58.14, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 8001, '2026-04-13', 'Подольская Анастасия Владимировна', 'РО ООО "ВФГС" в г.Москве', 'г. Москва', 8001, 25),
  (8006, 8002, (SELECT id FROM athletes WHERE last_name = 'Переплетова' AND first_name = 'Яна' AND middle_name = 'Васильевна' AND birth_year = 2009 LIMIT 1), 4, 16, NULL, 63.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 8001, '2026-04-13', 'Переплетова Яна Васильевна', 'ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»', 'г. Москва', 8001, 25),
  (8007, 8003, (SELECT id FROM athletes WHERE last_name = 'Мартынова' AND first_name = 'Ирина' AND middle_name = 'Александровна' AND birth_year = 1999 LIMIT 1), 1, 97, NULL, 88.6, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 8001, '2026-04-13', 'Мартынова Ирина Александровна', 'СШОР «Маршал»', 'Калужская область', 8001, 27),
  (8008, 8003, (SELECT id FROM athletes WHERE last_name = 'Верховцева' AND first_name = 'Екатерина' AND middle_name = 'Николаевна' AND birth_year = 2003 LIMIT 1), 2, 61, NULL, 82.55, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 8001, '2026-04-13', 'Верховцева Екатерина Николаевна', 'МАУ ДО СШОР "Метеор"', 'Ярославская область', 8001, 27),
  (8009, 8003, (SELECT id FROM athletes WHERE last_name = 'Побережная' AND first_name = 'Анна' AND middle_name = 'Владимировна' AND birth_year = 2010 LIMIT 1), 3, 60, NULL, 79.25, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 8001, '2026-04-13', 'Побережная Анна Владимировна', 'СШОР "Маршал"', 'Калужская область', 8001, 27),
  (8010, 8003, (SELECT id FROM athletes WHERE last_name = 'Якубенкова' AND first_name = 'Анна' AND middle_name = 'Андреевна' AND birth_year = 2007 LIMIT 1), 4, 49, NULL, 83.4, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 8001, '2026-04-13', 'Якубенкова Анна Андреевна', 'КСШ №1', 'Смоленская область', 8001, 27),
  (8011, 8004, (SELECT id FROM athletes WHERE last_name = 'Воропаева' AND first_name = 'Виктория' AND middle_name = 'Витальевна' AND birth_year = 2004 LIMIT 1), 1, 79, NULL, 67.45, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 8001, '2026-04-13', 'Воропаева Виктория Витальевна', 'МКУ ДО "Бобровская СШ им. В.Л. Паткина"', 'Воронежская область', 8001, 26),
  (8012, 8004, (SELECT id FROM athletes WHERE last_name = 'Альянова' AND first_name = 'Виктория' AND middle_name = 'Евгеньевна' AND birth_year = 2004 LIMIT 1), 2, 48, NULL, 67.05, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 8001, '2026-04-13', 'Альянова Виктория Евгеньевна', 'СШОР по борьбе', 'Брянская область', 8001, 26),
  (8013, 8004, (SELECT id FROM athletes WHERE last_name = 'Сорокина' AND first_name = 'Ольга' AND middle_name = 'Андреевна' AND birth_year = 2003 LIMIT 1), 3, 36, NULL, 66.9, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 8001, '2026-04-13', 'Сорокина Ольга Андреевна', 'ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»', 'г. Москва', 8001, 26),
  (8014, 8004, (SELECT id FROM athletes WHERE last_name = 'Щекина' AND first_name = 'Анна' AND middle_name = 'Константиновна' AND birth_year = 2012 LIMIT 1), 4, 13, NULL, 66.2, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 8001, '2026-04-13', 'Щекина Анна Константиновна', 'МБУ ДО СШ "ОСКОЛ"', 'Белгородская область', 8001, 26),
  (8015, 8005, (SELECT id FROM athletes WHERE last_name = 'Арсентьев' AND first_name = 'Виталий' AND middle_name = 'Александрович' AND birth_year = 2001 LIMIT 1), 1, 95, NULL, 62.9, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Арсентьев Виталий Александрович', 'ЯРОО ФГС', 'Ярославская область', 8001, 17),
  (8016, 8005, (SELECT id FROM athletes WHERE last_name = 'Кормилицын' AND first_name = 'Иван' AND middle_name = 'Николаевич' AND birth_year = 2010 LIMIT 1), 2, 62, NULL, 63.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Кормилицын Иван Николаевич', 'СШОР Маршал', 'Калужская область', 8001, 17),
  (8017, 8005, (SELECT id FROM athletes WHERE last_name = 'Кривко' AND first_name = 'Никита' AND middle_name = 'Алексеевич' AND birth_year = 2002 LIMIT 1), 3, 50, NULL, 62.7, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Кривко Никита Алексеевич', 'МБУ ДО СШОР 5 г Белгород', 'Белгородская область', 8001, 17),
  (8018, 8005, (SELECT id FROM athletes WHERE last_name = 'Буданов' AND first_name = 'Григорий' AND middle_name = 'Денисович' AND birth_year = 2010 LIMIT 1), 4, 16, NULL, 61.25, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Буданов Григорий Денисович', 'ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»', 'г. Москва', 8001, 17),
  (8019, 8006, (SELECT id FROM athletes WHERE last_name = 'Зуев' AND first_name = 'Владислав' AND middle_name = 'Алексеевич' AND birth_year = 2000 LIMIT 1), 1, 115, NULL, 67.95, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Зуев Владислав Алексеевич', 'ВС РФ', 'Воронежская область', 8001, 18),
  (8020, 8006, (SELECT id FROM athletes WHERE last_name = 'Горячев' AND first_name = 'Ярослав' AND middle_name = 'Алексеевич' AND birth_year = 2010 LIMIT 1), 2, 102, NULL, 68.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Горячев Ярослав Алексеевич', 'СШОР Маршал', 'Калужская область', 8001, 18),
  (8021, 8006, (SELECT id FROM athletes WHERE last_name = 'Хамидов' AND first_name = 'Фахриддин' AND middle_name = 'Фарход угли' AND birth_year = 2002 LIMIT 1), 3, 94, NULL, 67.95, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Хамидов Фахриддин Фарход угли', 'СШОР Маршал', 'Калужская область', 8001, 18),
  (8022, 8006, (SELECT id FROM athletes WHERE last_name = 'Сидоренков' AND first_name = 'Александр' AND middle_name = 'Александрович' AND birth_year = 2010 LIMIT 1), 4, 73, NULL, 67.8, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Сидоренков Александр Александрович', 'РО ООО «ВФГС» в г. Москве', 'г. Москва', 8001, 18),
  (8023, 8006, (SELECT id FROM athletes WHERE last_name = 'Подволоцкий' AND first_name = 'Сергей' AND middle_name = 'Александрович' AND birth_year = 1997 LIMIT 1), 5, 72, NULL, 66.5, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Подволоцкий Сергей Александрович', 'МКУ ДО "Бобровская СШ им. В.Л. Паткина"', 'Воронежская область', 8001, 18),
  (8024, 8006, (SELECT id FROM athletes WHERE last_name = 'Пухучкин' AND first_name = 'Евгений' AND middle_name = 'Викторович' AND birth_year = 1979 LIMIT 1), 6, 45, NULL, 66.9, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Пухучкин Евгений Викторович', '', 'Курская область', 8001, 18),
  (8025, 8007, (SELECT id FROM athletes WHERE last_name = 'Трофимов' AND first_name = 'Тимур' AND middle_name = 'Михайлович' AND birth_year = 2011 LIMIT 1), 1, 115, NULL, 73.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Трофимов Тимур Михайлович', 'СШОР "Маршал"', 'Калужская область', 8001, 19),
  (8026, 8007, (SELECT id FROM athletes WHERE last_name = 'Сергеев' AND first_name = 'Александр' AND middle_name = 'Сергеевич' AND birth_year = 1991 LIMIT 1), 2, 108, NULL, 71.75, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Сергеев Александр Сергеевич', 'СШОР «Маршал»', 'Калужская область', 8001, 19),
  (8027, 8007, (SELECT id FROM athletes WHERE last_name = 'Васин' AND first_name = 'Артём' AND middle_name = 'Иванович' AND birth_year = 2007 LIMIT 1), 3, 99, NULL, 71.1, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Васин Артём Иванович', 'СШОР "Маршал"', 'Калужская область', 8001, 19),
  (8028, 8007, (SELECT id FROM athletes WHERE last_name = 'Лисицын' AND first_name = 'Кирилл' AND middle_name = 'Сергеевич' AND birth_year = 2007 LIMIT 1), 4, 86, NULL, 72.9, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Лисицын Кирилл Сергеевич', 'МАУ ДО СШОР "Метеор"', 'Ярославская область', 8001, 19),
  (8029, 8007, (SELECT id FROM athletes WHERE last_name = 'Исмаилов' AND first_name = 'Артём' AND middle_name = 'Николаевич' AND birth_year = 2008 LIMIT 1), 5, 80, NULL, 70.35, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Исмаилов Артём Николаевич', 'МБУ ДО СШ "ОСКОЛ"', 'Белгородская область', 8001, 19),
  (8030, 8007, (SELECT id FROM athletes WHERE last_name = 'Щипков' AND first_name = 'Даниил' AND middle_name = 'Олегович' AND birth_year = 2009 LIMIT 1), 6, 57, NULL, 71.55, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Щипков Даниил Олегович', 'МАУ ДО СШОР "Метеор"', 'Ярославская область', 8001, 19),
  (8031, 8008, (SELECT id FROM athletes WHERE last_name = 'Сулейманов' AND first_name = 'Мовсар' AND middle_name = 'Мусаевич' AND birth_year = 1989 LIMIT 1), 1, 140, NULL, 78.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Сулейманов Мовсар Мусаевич', 'СШ Маршал', 'Калужская область', 8001, 20),
  (8032, 8008, (SELECT id FROM athletes WHERE last_name = 'Ванин' AND first_name = 'Виктор' AND middle_name = 'Викторович' AND birth_year = 1991 LIMIT 1), 2, 105, NULL, 77.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Ванин Виктор Викторович', 'Ддю Алые паруса Ряжск', 'Рязанская область', 8001, 20),
  (8033, 8008, (SELECT id FROM athletes WHERE last_name = 'Володин' AND first_name = 'Денис' AND middle_name = 'Игоревич' AND birth_year = 1993 LIMIT 1), 3, 88, NULL, 76.55, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Володин Денис Игоревич', 'МУ ДО "СШ "Легион"', 'Московская область', 8001, 20),
  (8034, 8008, (SELECT id FROM athletes WHERE last_name = 'Луценко' AND first_name = 'Никита' AND middle_name = 'Ильич' AND birth_year = 2003 LIMIT 1), 4, 80, NULL, 77.45, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Луценко Никита Ильич', 'РО ООО "ВФГС" в г. Москве', 'г. Москва', 8001, 20),
  (8035, 8008, (SELECT id FROM athletes WHERE last_name = 'Поляков' AND first_name = 'Матвей' AND middle_name = 'Юрьевич' AND birth_year = 2002 LIMIT 1), 5, 79, NULL, 78.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Поляков Матвей Юрьевич', 'МБУ ДО СШОР 5 г Белгород', 'Белгородская область', 8001, 20),
  (8036, 8008, (SELECT id FROM athletes WHERE last_name = 'Ладе' AND first_name = 'Роман' AND middle_name = 'Андреевич' AND birth_year = 1991 LIMIT 1), 6, 78, NULL, 78.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Ладе Роман Андреевич', 'РО ООО "ВФГС" в Московской области', 'Московская область', 8001, 20),
  (8037, 8008, (SELECT id FROM athletes WHERE last_name = 'Абдразаков' AND first_name = 'Рафик' AND middle_name = 'Шавкатович' AND birth_year = 2002 LIMIT 1), 7, 69, NULL, 77.55, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Абдразаков Рафик Шавкатович', 'КСШ № 1', 'Смоленская область', 8001, 20),
  (8038, 8008, (SELECT id FROM athletes WHERE last_name = 'Богданов' AND first_name = 'Михаил' AND middle_name = 'Юрьевич' AND birth_year = 2007 LIMIT 1), 8, 41, NULL, 77.2, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Богданов Михаил Юрьевич', 'ВА ВПВО', 'Смоленская область', 8001, 20),
  (8039, 8008, (SELECT id FROM athletes WHERE last_name = 'Масленников' AND first_name = 'Иван' AND middle_name = 'Валерьевич' AND birth_year = 2011 LIMIT 1), 9, 36, NULL, 73.5, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Масленников Иван Валерьевич', 'МБУ ДО СШ "ОСКОЛ"', 'Белгородская область', 8001, 20),
  (8040, 8009, (SELECT id FROM athletes WHERE last_name = 'Андрущенко' AND first_name = 'Сергей' AND middle_name = 'Александрович' AND birth_year = 2005 LIMIT 1), 1, 105, NULL, 84.7, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Андрущенко Сергей Александрович', 'ГБУ ДО МКСШОР "Запад" Отделение "Семёрка"', 'г. Москва, Белгородская область', 8001, 21),
  (8041, 8009, (SELECT id FROM athletes WHERE last_name = 'Мухитов' AND first_name = 'Андрей' AND middle_name = 'Вячеславович' AND birth_year = 1999 LIMIT 1), 2, 102, NULL, 84.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Мухитов Андрей Вячеславович', 'СШОР по борьбе', 'Брянская область', 8001, 21),
  (8042, 8009, (SELECT id FROM athletes WHERE last_name = 'Ветров' AND first_name = 'Денис' AND middle_name = 'Сергеевич' AND birth_year = 1989 LIMIT 1), 3, 96, NULL, 84.35, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Ветров Денис Сергеевич', 'РО ООО «ВФГС» в г. Москве', 'г. Москва', 8001, 21),
  (8043, 8009, (SELECT id FROM athletes WHERE last_name = 'Гнездилов' AND first_name = 'Роман' AND middle_name = 'Сергеевич' AND birth_year = 1990 LIMIT 1), 4, 92, NULL, 83.1, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Гнездилов Роман Сергеевич', 'Региональное отделение ВФГС по Курской области', 'Курская область', 8001, 21),
  (8044, 8009, (SELECT id FROM athletes WHERE last_name = 'Овчинников' AND first_name = 'Никита' AND middle_name = 'Олегович' AND birth_year = 2000 LIMIT 1), 5, 90, NULL, 84.15, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Овчинников Никита Олегович', 'КСШ №1/ВАВПВО', 'Смоленская область', 8001, 21),
  (8045, 8009, (SELECT id FROM athletes WHERE last_name = 'Квасов' AND first_name = 'Александр' AND middle_name = 'Юрьевич' AND birth_year = 2006 LIMIT 1), 6, 79, NULL, 84.3, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Квасов Александр Юрьевич', 'ВС РФ', 'Воронежская область', 8001, 21),
  (8046, 8009, (SELECT id FROM athletes WHERE last_name = 'Витков' AND first_name = 'Алексей' AND middle_name = 'Викторович' AND birth_year = 1990 LIMIT 1), 7, 74, NULL, 84.75, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Витков Алексей Викторович', 'РО ООО "ВФГС" в Московской области', 'Московская область', 8001, 21),
  (8047, 8009, (SELECT id FROM athletes WHERE last_name = 'Насибов' AND first_name = 'Туран' AND middle_name = 'Гурбанович' AND birth_year = 2010 LIMIT 1), 8, 66, NULL, 78.2, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Насибов Туран Гурбанович', 'МБУ ДО СШ "ОСКОЛ"', 'Белгородская область', 8001, 21),
  (8048, 8009, (SELECT id FROM athletes WHERE last_name = 'Закатов' AND first_name = 'Руслан' AND middle_name = 'Александрович' AND birth_year = 2007 LIMIT 1), 9, 53, NULL, 84.85, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Закатов Руслан Александрович', 'МАУ ДО СШОР "Метеор"', 'Ярославская область', 8001, 21),
  (8049, 8010, (SELECT id FROM athletes WHERE last_name = 'Турищев' AND first_name = 'Дмитрий' AND middle_name = 'Владимирович' AND birth_year = 1992 LIMIT 1), 1, 153, NULL, 103.55, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Турищев Дмитрий Владимирович', 'ГБУ ДО МКСШОР "Запад" отделение "Семёрка"', 'г. Москва', 8001, 23),
  (8050, 8010, (SELECT id FROM athletes WHERE last_name = 'Розмазнин' AND first_name = 'Илья' AND middle_name = 'Владимирович' AND birth_year = 2000 LIMIT 1), 2, 142, NULL, 113.05, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Розмазнин Илья Владимирович', 'БРОО ФГС', 'Белгородская область', 8001, 23),
  (8051, 8010, (SELECT id FROM athletes WHERE last_name = 'Потатуев' AND first_name = 'Артём' AND middle_name = 'Александрович' AND birth_year = 1992 LIMIT 1), 3, 105, NULL, 112.95, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Потатуев Артём Александрович', 'МАУ ДО СШОР "Метеор"', 'Ярославская область', 8001, 23),
  (8052, 8010, (SELECT id FROM athletes WHERE last_name = 'Ильин' AND first_name = 'Антон' AND middle_name = 'Андреевич' AND birth_year = 1992 LIMIT 1), 4, 98, NULL, 105.8, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Ильин Антон Андреевич', 'РО ООО «ВФГС» во Владимирской области', 'Владимирская область', 8001, 23),
  (8053, 8010, (SELECT id FROM athletes WHERE last_name = 'Слащев' AND first_name = 'Степан' AND middle_name = 'Сергеевич' AND birth_year = 2008 LIMIT 1), 5, 95, NULL, 106.1, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Слащев Степан Сергеевич', 'МУ ДО "СШ "Легион"', 'Московская область', 8001, 23),
  (8054, 8010, (SELECT id FROM athletes WHERE last_name = 'Лысиков' AND first_name = 'Ярослав' AND middle_name = 'Александрович' AND birth_year = 2006 LIMIT 1), 6, 79, NULL, 112.95, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Лысиков Ярослав Александрович', 'МАУ ДО СШОР "Метеор"', 'Ярославская область', 8001, 23),
  (8055, 8011, (SELECT id FROM athletes WHERE last_name = 'Кулаков' AND first_name = 'Иван' AND middle_name = 'Иванович' AND birth_year = 1998 LIMIT 1), 1, 147, NULL, 94.95, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Кулаков Иван Иванович', 'СШОР «Маршал»', 'Калужская область', 8001, 22),
  (8056, 8011, (SELECT id FROM athletes WHERE last_name = 'Гуров' AND first_name = 'Владимир' AND middle_name = 'Анатольевич' AND birth_year = 1978 LIMIT 1), 2, 140, NULL, 92.75, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Гуров Владимир Анатольевич', 'СШОР Маршал', 'Калужская область', 8001, 22),
  (8057, 8011, (SELECT id FROM athletes WHERE last_name = 'Кирюхин' AND first_name = 'Роман' AND middle_name = 'Александрович' AND birth_year = 1997 LIMIT 1), 3, 128, NULL, 87.8, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Кирюхин Роман Александрович', 'ФГС КО', 'Калужская область', 8001, 22),
  (8058, 8011, (SELECT id FROM athletes WHERE last_name = 'Булгаков' AND first_name = 'Денис' AND middle_name = 'Витальевич' AND birth_year = 1984 LIMIT 1), 4, 82, NULL, 85.85, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Булгаков Денис Витальевич', 'РО ООО "ВФГС" в Московской области', 'Московская область', 8001, 22),
  (8059, 8011, (SELECT id FROM athletes WHERE last_name = 'Конышев' AND first_name = 'Данила' AND middle_name = 'Константинович' AND birth_year = 2006 LIMIT 1), 5, 81, NULL, 94.15, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Конышев Данила Константинович', 'КСШ №1/ВАВПВО', 'Смоленская область', 8001, 22),
  (8060, 8011, (SELECT id FROM athletes WHERE last_name = 'Кулик' AND first_name = 'Никита' AND middle_name = 'Алексеевич' AND birth_year = 2005 LIMIT 1), 6, 78, NULL, 94.2, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Кулик Никита Алексеевич', 'ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»', 'г. Москва', 8001, 22),
  (8061, 8012, (SELECT id FROM athletes WHERE last_name = 'Трофимова' AND first_name = 'Милена' AND middle_name = 'Михайловна' AND birth_year = 2007 LIMIT 1), 1, 50, NULL, 58.0, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 8001, '2026-04-13', 'Трофимова Милена Михайловна', 'СШОР Маршал', 'Калужская область', 8001, 9),
  (8062, 8012, (SELECT id FROM athletes WHERE last_name = 'Шилихина' AND first_name = 'Дарья' AND middle_name = 'Павловна' AND birth_year = 2006 LIMIT 1), 2, 29, NULL, 57.92, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 8001, '2026-04-13', 'Шилихина Дарья Павловна', 'КСШ №1/СГУС', 'Смоленская область', 8001, 9),
  (8063, 8012, (SELECT id FROM athletes WHERE last_name = 'Фомина' AND first_name = 'Елизавета' AND middle_name = 'Алексеевна' AND birth_year = 2009 LIMIT 1), 3, 26, NULL, 54.6, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 8001, '2026-04-13', 'Фомина Елизавета Алексеевна', 'МБУ ДО СШОР 5 г Белгород', 'Белгородская область', 8001, 9),
  (8064, 8012, (SELECT id FROM athletes WHERE last_name = 'Чернова' AND first_name = 'Кира' AND middle_name = 'Николаевна' AND birth_year = 2009 LIMIT 1), 4, 26, NULL, 56.86, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 8001, '2026-04-13', 'Чернова Кира Николаевна', 'СШОР «Маршал»', 'Калужская область', 8001, 9),
  (8065, 8013, (SELECT id FROM athletes WHERE last_name = 'Пивень' AND first_name = 'Александра' AND middle_name = 'Максимовна' AND birth_year = 2004 LIMIT 1), 1, 72, NULL, 60.6, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 8001, '2026-04-13', 'Пивень Александра Максимовна', 'СШОР «Маршал»', 'Калужская область', 8001, 10),
  (8066, 8013, (SELECT id FROM athletes WHERE last_name = 'Мартынова' AND first_name = 'Любовь' AND middle_name = 'Владимировна' AND birth_year = 2007 LIMIT 1), 2, 46, NULL, 63.0, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 8001, '2026-04-13', 'Мартынова Любовь Владимировна', 'ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»', 'г. Москва', 8001, 10),
  (8067, 8013, (SELECT id FROM athletes WHERE last_name = 'Подольская' AND first_name = 'Анастасия' AND middle_name = 'Владимировна' AND birth_year = 2005 LIMIT 1), 3, 45, NULL, 58.1, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 8001, '2026-04-13', 'Подольская Анастасия Владимировна', 'РО ООО "ВФГС" в г.Москве', 'г. Москва', 8001, 10),
  (8068, 8014, (SELECT id FROM athletes WHERE last_name = 'Мартынова' AND first_name = 'Ирина' AND middle_name = 'Александровна' AND birth_year = 1999 LIMIT 1), 1, 75, NULL, 88.3, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 8001, '2026-04-13', 'Мартынова Ирина Александровна', 'СШОР «Маршал»', 'Калужская область', 8001, 12),
  (8069, 8014, (SELECT id FROM athletes WHERE last_name = 'Якубенкова' AND first_name = 'Анна' AND middle_name = 'Андреевна' AND birth_year = 2007 LIMIT 1), 2, 36, NULL, 84.0, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 8001, '2026-04-13', 'Якубенкова Анна Андреевна', 'КСШ №1', 'Смоленская область', 8001, 12),
  (8070, 8014, (SELECT id FROM athletes WHERE last_name = 'Побережная' AND first_name = 'Анна' AND middle_name = 'Владимировна' AND birth_year = 2010 LIMIT 1), 3, 35, NULL, 78.5, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 8001, '2026-04-13', 'Побережная Анна Владимировна', 'СШОР "Маршал"', 'Калужская область', 8001, 12),
  (8071, 8014, (SELECT id FROM athletes WHERE last_name = 'Щекина' AND first_name = 'Алеся' AND middle_name = 'Константиновна' AND birth_year = 2002 LIMIT 1), 4, 25, NULL, 98.5, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 8001, '2026-04-13', 'Щекина Алеся Константиновна', 'МБУ ДО СШ "ОСКОЛ"', 'Белгородская область', 8001, 12),
  (8072, 8015, (SELECT id FROM athletes WHERE last_name = 'Воропаева' AND first_name = 'Виктория' AND middle_name = 'Витальевна' AND birth_year = 2004 LIMIT 1), 1, 70, NULL, 66.75, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 8001, '2026-04-13', 'Воропаева Виктория Витальевна', 'МКУ ДО "Бобровская СШ им. В.Л. Паткина"', 'Воронежская область', 8001, 11),
  (8073, 8015, (SELECT id FROM athletes WHERE last_name = 'Альянова' AND first_name = 'Виктория' AND middle_name = 'Евгеньевна' AND birth_year = 2004 LIMIT 1), 2, 20, NULL, 67.0, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 8001, '2026-04-13', 'Альянова Виктория Евгеньевна', 'СШОР по борьбе', 'Брянская область', 8001, 11),
  (8074, 8016, (SELECT id FROM athletes WHERE last_name = 'Цвик' AND first_name = 'Данил' AND middle_name = 'Александрович' AND birth_year = 2003 LIMIT 1), 1, 44, NULL, 62.9, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Цвик Данил Александрович', 'КСШ № 1', 'Смоленская область', 8001, 2),
  (8075, 8016, (SELECT id FROM athletes WHERE last_name = 'Кормилицын' AND first_name = 'Иван' AND middle_name = 'Николаевич' AND birth_year = 2010 LIMIT 1), 2, 43, NULL, 63.0, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Кормилицын Иван Николаевич', 'СШОР Маршал', 'Калужская область', 8001, 2),
  (8076, 8016, (SELECT id FROM athletes WHERE last_name = 'Дубинин' AND first_name = 'Максим' AND middle_name = 'Николаевич' AND birth_year = 1989 LIMIT 1), 3, 40, NULL, 62.7, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Дубинин Максим Николаевич', 'СШОР по борьбе', 'Брянская область', 8001, 2),
  (8077, 8016, (SELECT id FROM athletes WHERE last_name = 'Кривко' AND first_name = 'Никита' AND middle_name = 'Алексеевич' AND birth_year = 2002 LIMIT 1), 4, 39, NULL, 62.9, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Кривко Никита Алексеевич', 'МБУ ДО СШОР 5 г Белгород', 'Белгородская область', 8001, 2),
  (8078, 8017, (SELECT id FROM athletes WHERE last_name = 'Горячев' AND first_name = 'Ярослав' AND middle_name = 'Алексеевич' AND birth_year = 2010 LIMIT 1), 1, 64, NULL, 68.0, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Горячев Ярослав Алексеевич', 'СШОР Маршал', 'Калужская область', 8001, 3),
  (8079, 8017, (SELECT id FROM athletes WHERE last_name = 'Хамидов' AND first_name = 'Фахриддин' AND middle_name = 'Фарход угли' AND birth_year = 2002 LIMIT 1), 2, 63, NULL, 67.85, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Хамидов Фахриддин Фарход угли', 'СШОР Маршал', 'Калужская область', 8001, 3),
  (8080, 8017, (SELECT id FROM athletes WHERE last_name = 'Сидоренков' AND first_name = 'Александр' AND middle_name = 'Александрович' AND birth_year = 2010 LIMIT 1), 3, 46, NULL, 67.7, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Сидоренков Александр Александрович', 'РО ООО «ВФГС» в г. Москве', 'г. Москва', 8001, 3),
  (8081, 8017, (SELECT id FROM athletes WHERE last_name = 'Копаевский' AND first_name = 'Артём' AND middle_name = 'Александрович' AND birth_year = 2009 LIMIT 1), 4, 16, NULL, 67.35, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Копаевский Артём Александрович', 'МАУ ДО СШОР "Метеор"', 'Ярославская область', 8001, 3),
  (8082, 8018, (SELECT id FROM athletes WHERE last_name = 'Багров' AND first_name = 'Максим' AND middle_name = 'Дмитриевич' AND birth_year = 2009 LIMIT 1), 1, 73, NULL, 72.5, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Багров Максим Дмитриевич', 'РО ООО «ВФГС» в г. Москве', 'г. Москва', 8001, 4),
  (8083, 8018, (SELECT id FROM athletes WHERE last_name = 'Фомин' AND first_name = 'Фёдор' AND middle_name = 'Алексеевич' AND birth_year = 2004 LIMIT 1), 2, 71, NULL, 72.75, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Фомин Фёдор Алексеевич', 'МБУ ДО СШОР 5 г Белгород', 'Белгородская область', 8001, 4),
  (8084, 8018, (SELECT id FROM athletes WHERE last_name = 'Трофимов' AND first_name = 'Тимур' AND middle_name = 'Михайлович' AND birth_year = 2011 LIMIT 1), 3, 62, NULL, 72.9, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Трофимов Тимур Михайлович', 'СШОР "Маршал"', 'Калужская область', 8001, 4),
  (8085, 8018, (SELECT id FROM athletes WHERE last_name = 'Сергеев' AND first_name = 'Александр' AND middle_name = 'Сергеевич' AND birth_year = 1991 LIMIT 1), 4, 58, NULL, 72.2, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Сергеев Александр Сергеевич', 'СШОР «Маршал»', 'Калужская область', 8001, 4),
  (8086, 8018, (SELECT id FROM athletes WHERE last_name = 'Васин' AND first_name = 'Артём' AND middle_name = 'Иванович' AND birth_year = 2007 LIMIT 1), 5, 57, NULL, 72.6, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Васин Артём Иванович', 'СШОР "Маршал"', 'Калужская область', 8001, 4),
  (8087, 8018, (SELECT id FROM athletes WHERE last_name = 'Сушков' AND first_name = 'Владимир' AND middle_name = 'Валерьевия' AND birth_year = 2000 LIMIT 1), 6, 46, NULL, 70.9, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Сушков Владимир Валерьевия', 'МБУ ДО СШ "ОСКОЛ"/СШОР 5 Белгород', 'Белгородская область', 8001, 4),
  (8088, 8018, (SELECT id FROM athletes WHERE last_name = 'Шахрай' AND first_name = 'Владислав' AND middle_name = 'Сергеевич' AND birth_year = 2002 LIMIT 1), 7, 31, NULL, 72.3, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Шахрай Владислав Сергеевич', 'РО ООО «ВФГС» в г. Москве', 'г. Москва', 8001, 4),
  (8089, 8018, (SELECT id FROM athletes WHERE last_name = 'Щипков' AND first_name = 'Даниил' AND middle_name = 'Олегович' AND birth_year = 2009 LIMIT 1), 8, 26, NULL, 71.75, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Щипков Даниил Олегович', 'МАУ ДО СШОР "Метеор"', 'Ярославская область', 8001, 4),
  (8090, 8018, (SELECT id FROM athletes WHERE last_name = 'Науменко' AND first_name = 'Мирослав' AND middle_name = 'Константинович' AND birth_year = 2007 LIMIT 1), 9, 24, NULL, 72.3, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Науменко Мирослав Константинович', 'МАУ ДО СШОР "Метеор"', 'Ярославская область', 8001, 4),
  (8091, 8019, (SELECT id FROM athletes WHERE last_name = 'Астахов' AND first_name = 'Евгений' AND middle_name = 'Михайлович' AND birth_year = 2002 LIMIT 1), 1, 73, NULL, 76.8, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Астахов Евгений Михайлович', 'ГБУ ДО МКСШОР "Запад" отделение "Семёрка"', 'г. Москва', 8001, 5),
  (8092, 8019, (SELECT id FROM athletes WHERE last_name = 'Лебеденко' AND first_name = 'Андрей' AND middle_name = 'Евгеньевич' AND birth_year = 2008 LIMIT 1), 2, 55, NULL, 77.95, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Лебеденко Андрей Евгеньевич', 'МБУ ДО СШ "ОСКОЛ"', 'Белгородская область', 8001, 5),
  (8093, 8019, (SELECT id FROM athletes WHERE last_name = 'Савинов' AND first_name = 'Андрей' AND middle_name = 'Вячеславович' AND birth_year = 1984 LIMIT 1), 3, 50, NULL, 77.0, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Савинов Андрей Вячеславович', 'Владимирская область', 'Владимирская область', 8001, 5),
  (8094, 8019, (SELECT id FROM athletes WHERE last_name = 'Гордеев' AND first_name = 'Михаил' AND middle_name = 'Сергеевич' AND birth_year = 1998 LIMIT 1), 4, 50, NULL, 77.9, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Гордеев Михаил Сергеевич', 'РО ООО "ВФГС" в Московской области', 'Московская область', 8001, 5),
  (8095, 8019, (SELECT id FROM athletes WHERE last_name = 'Абдразаков' AND first_name = 'Рафик' AND middle_name = 'Шавкатович' AND birth_year = 2002 LIMIT 1), 5, 46, NULL, 77.8, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Абдразаков Рафик Шавкатович', 'КСШ № 1', 'Смоленская область', 8001, 5),
  (8096, 8019, (SELECT id FROM athletes WHERE last_name = 'Володин' AND first_name = 'Денис' AND middle_name = 'Игоревич' AND birth_year = 1993 LIMIT 1), 6, 40, NULL, 76.75, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Володин Денис Игоревич', 'МУ ДО "СШ "Легион"', 'Московская область', 8001, 5),
  (8097, 8019, (SELECT id FROM athletes WHERE last_name = 'Тупиков' AND first_name = 'Александр' AND middle_name = 'Сергеевич' AND birth_year = 1991 LIMIT 1), 7, 40, NULL, 76.8, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Тупиков Александр Сергеевич', 'РОООО "ВФГС по ИО"', 'Ивановская область', 8001, 5),
  (8098, 8019, (SELECT id FROM athletes WHERE last_name = 'Луценко' AND first_name = 'Никита' AND middle_name = 'Ильич' AND birth_year = 2003 LIMIT 1), 8, 37, NULL, 77.35, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Луценко Никита Ильич', 'РО ООО "ВФГС" в г. Москве', 'г. Москва', 8001, 5),
  (8099, 8019, (SELECT id FROM athletes WHERE last_name = 'Курбаков' AND first_name = 'Данила' AND middle_name = 'Александрович' AND birth_year = 2009 LIMIT 1), 9, 23, NULL, 78.0, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Курбаков Данила Александрович', 'СШОР Маршал', 'Калужская область', 8001, 5),
  (8100, 8020, (SELECT id FROM athletes WHERE last_name = 'Андрущенко' AND first_name = 'Сергей' AND middle_name = 'Александрович' AND birth_year = 2005 LIMIT 1), 1, 80, NULL, 84.45, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Андрущенко Сергей Александрович', 'ГБУ ДО МКСШОР "Запад" Отделение "Семёрка"', 'г. Москва, Белгородская область', 8001, 6),
  (8101, 8020, (SELECT id FROM athletes WHERE last_name = 'Мухитов' AND first_name = 'Андрей' AND middle_name = 'Вячеславович' AND birth_year = 1999 LIMIT 1), 2, 65, NULL, 84.15, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Мухитов Андрей Вячеславович', 'СШОР по борьбе', 'Брянская область', 8001, 6),
  (8102, 8020, (SELECT id FROM athletes WHERE last_name = 'Кузьмин' AND first_name = 'Илья' AND middle_name = 'Алексеевич' AND birth_year = 2007 LIMIT 1), 3, 50, NULL, 84.35, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Кузьмин Илья Алексеевич', 'МБУДО КСШ1 , СГУС', 'Смоленская область', 8001, 6),
  (8103, 8020, (SELECT id FROM athletes WHERE last_name = 'Витков' AND first_name = 'Алексей' AND middle_name = 'Викторович' AND birth_year = 1990 LIMIT 1), 4, 45, NULL, 84.15, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Витков Алексей Викторович', 'РО ООО "ВФГС" в Московской области', 'Московская область', 8001, 6),
  (8104, 8020, (SELECT id FROM athletes WHERE last_name = 'Аманатиди' AND first_name = 'Михаил' AND middle_name = 'Константинович' AND birth_year = 2009 LIMIT 1), 5, 35, NULL, 83.05, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Аманатиди Михаил Константинович', 'МБУ ДО СШ "Юность"', 'Белгородская область', 8001, 6),
  (8105, 8021, (SELECT id FROM athletes WHERE last_name = 'Турищев' AND first_name = 'Дмитрий' AND middle_name = 'Владимирович' AND birth_year = 1992 LIMIT 1), 1, 78, NULL, 103.0, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Турищев Дмитрий Владимирович', 'ГБУ ДО МКСШОР "Запад" отделение "Семёрка"', 'г. Москва', 8001, 8),
  (8106, 8021, (SELECT id FROM athletes WHERE last_name = 'Калистратов' AND first_name = 'Артем' AND middle_name = 'Валерьевич' AND birth_year = 1992 LIMIT 1), 2, 74, NULL, 110.2, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Калистратов Артем Валерьевич', 'КСШ № 1', 'Смоленская область', 8001, 8),
  (8107, 8021, (SELECT id FROM athletes WHERE last_name = 'Слащев' AND first_name = 'Степан' AND middle_name = 'Сергеевич' AND birth_year = 2008 LIMIT 1), 3, 57, NULL, 105.95, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Слащев Степан Сергеевич', 'МУ ДО "СШ "Легион"', 'Московская область', 8001, 8),
  (8108, 8021, (SELECT id FROM athletes WHERE last_name = 'Фартучный' AND first_name = 'Иван' AND middle_name = 'Сергеевич' AND birth_year = 2007 LIMIT 1), 4, 50, NULL, 122.05, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Фартучный Иван Сергеевич', 'МБУ ДО СШ "ОСКОЛ"', 'Белгородская область', 8001, 8),
  (8109, 8021, (SELECT id FROM athletes WHERE last_name = 'Станкович' AND first_name = 'Боян' AND middle_name IS NULL AND birth_year = 1988 LIMIT 1), 5, 45, NULL, 103.65, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Станкович Боян', 'ЯРОО ФГС', 'Ярославская область', 8001, 8),
  (8110, 8021, (SELECT id FROM athletes WHERE last_name = 'Дворцов' AND first_name = 'Владимир' AND middle_name = 'Владимирович' AND birth_year = 1986 LIMIT 1), 6, 40, NULL, 108.95, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Дворцов Владимир Владимирович', 'СШОР по борьбе', 'Брянская область', 8001, 8),
  (8111, 8021, (SELECT id FROM athletes WHERE last_name = 'Митрофанов' AND first_name = 'Тимофей' AND middle_name = 'Андреевич' AND birth_year = 2009 LIMIT 1), 7, 16, NULL, 118.5, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Митрофанов Тимофей Андреевич', 'МАУ ДО СШОР "Метеор"', 'Ярославская область', 8001, 8),
  (8112, 8022, (SELECT id FROM athletes WHERE last_name = 'Кулаков' AND first_name = 'Иван' AND middle_name = 'Иванович' AND birth_year = 1998 LIMIT 1), 1, 90, NULL, 94.95, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Кулаков Иван Иванович', 'СШОР «Маршал»', 'Калужская область', 8001, 7),
  (8113, 8022, (SELECT id FROM athletes WHERE last_name = 'Кирюхин' AND first_name = 'Роман' AND middle_name = 'Александрович' AND birth_year = 1997 LIMIT 1), 2, 75, NULL, 88.0, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Кирюхин Роман Александрович', 'ФГС КО', 'Калужская область', 8001, 7),
  (8114, 8022, (SELECT id FROM athletes WHERE last_name = 'Кулик' AND first_name = 'Никита' AND middle_name = 'Алексеевич' AND birth_year = 2005 LIMIT 1), 3, 62, NULL, 92.25, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Кулик Никита Алексеевич', 'ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»', 'г. Москва', 8001, 7),
  (8115, 8022, (SELECT id FROM athletes WHERE last_name = 'Булгаков' AND first_name = 'Денис' AND middle_name = 'Витальевич' AND birth_year = 1984 LIMIT 1), 4, 45, NULL, 86.4, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Булгаков Денис Витальевич', 'РО ООО "ВФГС" в Московской области', 'Московская область', 8001, 7),
  (8116, 8022, (SELECT id FROM athletes WHERE last_name = 'Захаров' AND first_name = 'Станислав' AND middle_name = 'Олегович' AND birth_year = 1991 LIMIT 1), 5, 43, NULL, 86.0, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Захаров Станислав Олегович', 'РО ООО ВФГС в г. Москве', 'г. Москва', 8001, 7),
  (8117, 8022, (SELECT id FROM athletes WHERE last_name = 'Муссалиев' AND first_name = 'Муса' AND middle_name = 'Габиб Оглы' AND birth_year = 2007 LIMIT 1), 6, 37, NULL, 85.6, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Муссалиев Муса Габиб Оглы', 'СШОР по борьбе', 'Брянская область', 8001, 7),
  (8118, 8022, (SELECT id FROM athletes WHERE last_name = 'Мамедсаатов' AND first_name = 'Егор' AND middle_name = 'Русланович' AND birth_year = 2008 LIMIT 1), 7, 31, NULL, 91.5, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Мамедсаатов Егор Русланович', 'МБУ ДО СШ "Юность"', 'Белгородская область', 8001, 7),
  (8119, 8023, (SELECT id FROM athletes WHERE last_name = 'Арсентьев' AND first_name = 'Виталий' AND middle_name = 'Александрович' AND birth_year = 2001 LIMIT 1), 1, 146, NULL, 62.8, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 8001, '2026-04-13', 'Арсентьев Виталий Александрович', 'ЯРОО ФГС', 'Ярославская область', 8001, 28),
  (8120, 8023, (SELECT id FROM athletes WHERE last_name = 'Сушков' AND first_name = 'Андрей' AND middle_name = 'Васильевич' AND birth_year = 1992 LIMIT 1), 2, 120, NULL, 62.9, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 8001, '2026-04-13', 'Сушков Андрей Васильевич', 'МБУ ДО СШОР 5 г Белгород', 'Белгородская область', 8001, 28),
  (8121, 8023, (SELECT id FROM athletes WHERE last_name = 'Исаков' AND first_name = 'Станислав' AND middle_name = 'Алексеевич' AND birth_year = 2006 LIMIT 1), 3, 98, NULL, 62.5, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 8001, '2026-04-13', 'Исаков Станислав Алексеевич', 'КСШ №1/ВАВПВО', 'Смоленская область', 8001, 28),
  (8122, 8023, (SELECT id FROM athletes WHERE last_name = 'Кормилицын' AND first_name = 'Иван' AND middle_name = 'Николаевич' AND birth_year = 2010 LIMIT 1), 4, 85, NULL, 62.7, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 8001, '2026-04-13', 'Кормилицын Иван Николаевич', 'СШОР Маршал', 'Калужская область', 8001, 28),
  (8123, 8023, (SELECT id FROM athletes WHERE last_name = 'Буданов' AND first_name = 'Григорий' AND middle_name = 'Денисович' AND birth_year = 2010 LIMIT 1), 5, 40, NULL, 61.75, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 8001, '2026-04-13', 'Буданов Григорий Денисович', 'ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»', 'г. Москва', 8001, 28),
  (8124, 8024, (SELECT id FROM athletes WHERE last_name = 'Петушков' AND first_name = 'Денис' AND middle_name = 'Владимирович' AND birth_year = 1986 LIMIT 1), 1, 140, NULL, 67.7, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 8001, '2026-04-13', 'Петушков Денис Владимирович', 'КСШ № 1', 'Смоленская область', 8001, 29),
  (8125, 8024, (SELECT id FROM athletes WHERE last_name = 'Хамидов' AND first_name = 'Фахриддин' AND middle_name = 'Фарход угли' AND birth_year = 2002 LIMIT 1), 2, 111, NULL, 68.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 8001, '2026-04-13', 'Хамидов Фахриддин Фарход угли', 'СШОР Маршал', 'Калужская область', 8001, 29),
  (8126, 8024, (SELECT id FROM athletes WHERE last_name = 'Горячев' AND first_name = 'Ярослав' AND middle_name = 'Алексеевич' AND birth_year = 2010 LIMIT 1), 3, 100, NULL, 67.9, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 8001, '2026-04-13', 'Горячев Ярослав Алексеевич', 'СШОР Маршал', 'Калужская область', 8001, 29),
  (8127, 8024, (SELECT id FROM athletes WHERE last_name = 'Копаевский' AND first_name = 'Артём' AND middle_name = 'Александрович' AND birth_year = 2009 LIMIT 1), 4, 93, NULL, 67.1, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 8001, '2026-04-13', 'Копаевский Артём Александрович', 'МАУ ДО СШОР "Метеор"', 'Ярославская область', 8001, 29),
  (8128, 8025, (SELECT id FROM athletes WHERE last_name = 'Сергеев' AND first_name = 'Александр' AND middle_name = 'Сергеевич' AND birth_year = 1991 LIMIT 1), 1, 172, NULL, 71.95, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 8001, '2026-04-13', 'Сергеев Александр Сергеевич', 'СШОР «Маршал»', 'Калужская область', 8001, 30),
  (8129, 8025, (SELECT id FROM athletes WHERE last_name = 'Балашов' AND first_name = 'Максим' AND middle_name = 'Юрьевич' AND birth_year = 1990 LIMIT 1), 2, 166, NULL, 72.95, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 8001, '2026-04-13', 'Балашов Максим Юрьевич', 'Ивановское региональное отделение', 'Ивановская область', 8001, 30),
  (8130, 8025, (SELECT id FROM athletes WHERE last_name = 'Савинов' AND first_name = 'Роман' AND middle_name = 'Сергеевич' AND birth_year = 1993 LIMIT 1), 3, 143, NULL, 70.7, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 8001, '2026-04-13', 'Савинов Роман Сергеевич', 'МАУ СШОР Метеор', 'Ярославская область', 8001, 30),
  (8131, 8025, (SELECT id FROM athletes WHERE last_name = 'Багров' AND first_name = 'Максим' AND middle_name = 'Дмитриевич' AND birth_year = 2009 LIMIT 1), 4, 131, NULL, 72.6, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 8001, '2026-04-13', 'Багров Максим Дмитриевич', 'РО ООО «ВФГС» в г. Москве', 'г. Москва', 8001, 30),
  (8132, 8025, (SELECT id FROM athletes WHERE last_name = 'Трофимов' AND first_name = 'Тимур' AND middle_name = 'Михайлович' AND birth_year = 2011 LIMIT 1), 5, 129, NULL, 73.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 8001, '2026-04-13', 'Трофимов Тимур Михайлович', 'СШОР "Маршал"', 'Калужская область', 8001, 30),
  (8133, 8025, (SELECT id FROM athletes WHERE last_name = 'Васин' AND first_name = 'Артём' AND middle_name = 'Иванович' AND birth_year = 2007 LIMIT 1), 6, 125, NULL, 72.3, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 8001, '2026-04-13', 'Васин Артём Иванович', 'СШОР "Маршал"', 'Калужская область', 8001, 30),
  (8134, 8025, (SELECT id FROM athletes WHERE last_name = 'Кобелев' AND first_name = 'Сергей' AND middle_name = 'Сергеевич' AND birth_year = 1987 LIMIT 1), 7, 115, NULL, 71.05, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 8001, '2026-04-13', 'Кобелев Сергей Сергеевич', 'РО ООО "ВФГС" во Владимирской области', 'Владимирская область', 8001, 30),
  (8135, 8025, (SELECT id FROM athletes WHERE last_name = 'Исмаилов' AND first_name = 'Артём' AND middle_name = 'Николаевич' AND birth_year = 2008 LIMIT 1), 8, 106, NULL, 69.7, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 8001, '2026-04-13', 'Исмаилов Артём Николаевич', 'МБУ ДО СШ "ОСКОЛ"', 'Белгородская область', 8001, 30),
  (8136, 8025, (SELECT id FROM athletes WHERE last_name = 'Науменко' AND first_name = 'Мирослав' AND middle_name = 'Константинович' AND birth_year = 2007 LIMIT 1), 9, 89, NULL, 72.8, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 8001, '2026-04-13', 'Науменко Мирослав Константинович', 'МАУ ДО СШОР "Метеор"', 'Ярославская область', 8001, 30),
  (8137, 8025, (SELECT id FROM athletes WHERE last_name = 'Евгиненков' AND first_name = 'Владимир' AND middle_name = 'Александрович' AND birth_year = 2009 LIMIT 1), 10, 81, NULL, 70.95, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 8001, '2026-04-13', 'Евгиненков Владимир Александрович', 'КСШ № 1', 'Смоленская область', 8001, 30),
  (8138, 8025, (SELECT id FROM athletes WHERE last_name = 'Лисицын' AND first_name = 'Кирилл' AND middle_name = 'Сергеевич' AND birth_year = 2007 LIMIT 1), 11, 67, NULL, 72.55, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 8001, '2026-04-13', 'Лисицын Кирилл Сергеевич', 'МАУ ДО СШОР "Метеор"', 'Ярославская область', 8001, 30),
  (8139, 8026, (SELECT id FROM athletes WHERE last_name = 'Ванин' AND first_name = 'Виктор' AND middle_name = 'Викторович' AND birth_year = 1991 LIMIT 1), 1, 180, NULL, 77.2, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 8001, '2026-04-13', 'Ванин Виктор Викторович', 'Ддю Алые паруса Ряжск', 'Рязанская область', 8001, 31),
  (8140, 8026, (SELECT id FROM athletes WHERE last_name = 'Дьячков' AND first_name = 'Олег' AND middle_name = 'Сергеевич' AND birth_year = 1995 LIMIT 1), 2, 176, NULL, 77.8, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 8001, '2026-04-13', 'Дьячков Олег Сергеевич', 'МБУ ДО СШОР 5 г Белгород', 'Белгородская область', 8001, 31),
  (8141, 8026, (SELECT id FROM athletes WHERE last_name = 'Гинда' AND first_name = 'Денис' AND middle_name = 'Петрович' AND birth_year = 1979 LIMIT 1), 3, 166, NULL, 75.25, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 8001, '2026-04-13', 'Гинда Денис Петрович', 'РО ООО «ВФГС» в г. Москве', 'г. Москва', 8001, 31),
  (8142, 8026, (SELECT id FROM athletes WHERE last_name = 'Спиридонов' AND first_name = 'Михаил' AND middle_name = 'Борисович' AND birth_year = 1988 LIMIT 1), 4, 136, NULL, 77.35, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 8001, '2026-04-13', 'Спиридонов Михаил Борисович', 'РО ООО "ВФГС" в городе Москве', 'г. Москва', 8001, 31),
  (8143, 8026, (SELECT id FROM athletes WHERE last_name = 'Сулейманов' AND first_name = 'Мовсар' AND middle_name = 'Мусаевич' AND birth_year = 1989 LIMIT 1), 5, 135, NULL, 78.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 8001, '2026-04-13', 'Сулейманов Мовсар Мусаевич', 'СШ Маршал', 'Калужская область', 8001, 31),
  (8144, 8026, (SELECT id FROM athletes WHERE last_name = 'Гордеев' AND first_name = 'Михаил' AND middle_name = 'Сергеевич' AND birth_year = 1998 LIMIT 1), 6, 110, NULL, 77.75, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 8001, '2026-04-13', 'Гордеев Михаил Сергеевич', 'РО ООО "ВФГС" в Московской области', 'Московская область', 8001, 31),
  (8145, 8026, (SELECT id FROM athletes WHERE last_name = 'Курбаков' AND first_name = 'Данила' AND middle_name = 'Александрович' AND birth_year = 2009 LIMIT 1), 7, 97, NULL, 78.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 8001, '2026-04-13', 'Курбаков Данила Александрович', 'СШОР Маршал', 'Калужская область', 8001, 31),
  (8146, 8026, (SELECT id FROM athletes WHERE last_name = 'Рассолов' AND first_name = 'Сергей' AND middle_name = 'Сергеевич' AND birth_year = 1990 LIMIT 1), 8, 92, NULL, 77.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 8001, '2026-04-13', 'Рассолов Сергей Сергеевич', 'МБУ ДО СШОР 5 г Белгород', 'Белгородская область', 8001, 31),
  (8147, 8026, (SELECT id FROM athletes WHERE last_name = 'Ладе' AND first_name = 'Роман' AND middle_name = 'Андреевич' AND birth_year = 1991 LIMIT 1), 9, 81, NULL, 77.9, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 8001, '2026-04-13', 'Ладе Роман Андреевич', 'РО ООО "ВФГС" в Московской области', 'Московская область', 8001, 31),
  (8148, 8026, (SELECT id FROM athletes WHERE last_name = 'Масленников' AND first_name = 'Иван' AND middle_name = 'Валерьевич' AND birth_year = 2011 LIMIT 1), 10, 50, NULL, 73.55, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 8001, '2026-04-13', 'Масленников Иван Валерьевич', 'МБУ ДО СШ "ОСКОЛ"', 'Белгородская область', 8001, 31),
  (8149, 8027, (SELECT id FROM athletes WHERE last_name = 'Ветров' AND first_name = 'Денис' AND middle_name = 'Сергеевич' AND birth_year = 1989 LIMIT 1), 1, 168, NULL, 84.8, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 8001, '2026-04-13', 'Ветров Денис Сергеевич', 'РО ООО «ВФГС» в г. Москве', 'г. Москва', 8001, 32),
  (8150, 8027, (SELECT id FROM athletes WHERE last_name = 'Бас' AND first_name = 'Денис' AND middle_name = 'Николаевич' AND birth_year = 2007 LIMIT 1), 2, 163, NULL, 83.7, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 8001, '2026-04-13', 'Бас Денис Николаевич', 'МБУ ДО СШОР 5 г Белгород/ МБУ ДО ДЮСШ Волоконовский район', 'Белгородская область', 8001, 32),
  (8151, 8027, (SELECT id FROM athletes WHERE last_name = 'Гнездилов' AND first_name = 'Роман' AND middle_name = 'Сергеевич' AND birth_year = 1990 LIMIT 1), 3, 160, NULL, 83.75, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 8001, '2026-04-13', 'Гнездилов Роман Сергеевич', 'Региональное отделение ВФГС по Курской области', 'Курская область', 8001, 32),
  (8152, 8027, (SELECT id FROM athletes WHERE last_name = 'Андрущенко' AND first_name = 'Сергей' AND middle_name = 'Александрович' AND birth_year = 2005 LIMIT 1), 4, 156, NULL, 84.25, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 8001, '2026-04-13', 'Андрущенко Сергей Александрович', 'ГБУ ДО МКСШОР "Запад" Отделение "Семёрка"', 'г. Москва, Белгородская область', 8001, 32),
  (8153, 8027, (SELECT id FROM athletes WHERE last_name = 'Мартысюк' AND first_name = 'Сергей' AND middle_name = 'Сергеевич' AND birth_year = 2010 LIMIT 1), 5, 150, NULL, 80.45, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 8001, '2026-04-13', 'Мартысюк Сергей Сергеевич', 'КСШ № 1', 'Смоленская область', 8001, 32),
  (8154, 8027, (SELECT id FROM athletes WHERE last_name = 'Шамара' AND first_name = 'Леонард' AND middle_name = 'Леонидович' AND birth_year = 1974 LIMIT 1), 6, 149, NULL, 82.8, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 8001, '2026-04-13', 'Шамара Леонард Леонидович', 'РО ООО ВФГС в г. Москве', 'г. Москва', 8001, 32),
  (8155, 8027, (SELECT id FROM athletes WHERE last_name = 'Кузовлев' AND first_name = 'Иван' AND middle_name = 'Николаевич' AND birth_year = 1985 LIMIT 1), 7, 132, NULL, 84.2, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 8001, '2026-04-13', 'Кузовлев Иван Николаевич', 'ЯРОО ФГС', 'Ярославская область', 8001, 32),
  (8156, 8027, (SELECT id FROM athletes WHERE last_name = 'Малашта' AND first_name = 'Роман' AND middle_name = 'Анатольевич' AND birth_year = 1987 LIMIT 1), 8, 131, NULL, 83.4, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 8001, '2026-04-13', 'Малашта Роман Анатольевич', 'МБУ ДО СШОР 5 г Белгород', 'Белгородская область', 8001, 32),
  (8157, 8027, (SELECT id FROM athletes WHERE last_name = 'Турищев' AND first_name = 'Михаил' AND middle_name = 'Михайлович' AND birth_year = 2007 LIMIT 1), 9, 99, NULL, 82.2, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 8001, '2026-04-13', 'Турищев Михаил Михайлович', 'ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»', 'г. Москва', 8001, 32),
  (8158, 8027, (SELECT id FROM athletes WHERE last_name = 'Витков' AND first_name = 'Алексей' AND middle_name = 'Викторович' AND birth_year = 1990 LIMIT 1), 10, 95, NULL, 84.8, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 8001, '2026-04-13', 'Витков Алексей Викторович', 'РО ООО "ВФГС" в Московской области', 'Московская область', 8001, 32),
  (8159, 8027, (SELECT id FROM athletes WHERE last_name = 'Чернышев' AND first_name = 'Павел' AND middle_name = 'Вадимович' AND birth_year = 2007 LIMIT 1), 11, 91, NULL, 82.2, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 8001, '2026-04-13', 'Чернышев Павел Вадимович', 'ДДЮ Алые Паруса', 'Рязанская область', 8001, 32),
  (8160, 8027, (SELECT id FROM athletes WHERE last_name = 'Ларечнев' AND first_name = 'Алексей' AND middle_name = 'Викторович' AND birth_year = 1981 LIMIT 1), 12, 74, NULL, 81.25, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 8001, '2026-04-13', 'Ларечнев Алексей Викторович', 'Sapa Fitness', 'Смоленская область', 8001, 32),
  (8161, 8027, (SELECT id FROM athletes WHERE last_name = 'Насибов' AND first_name = 'Туран' AND middle_name = 'Гурбанович' AND birth_year = 2010 LIMIT 1), 13, 70, NULL, 78.45, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 8001, '2026-04-13', 'Насибов Туран Гурбанович', 'МБУ ДО СШ "ОСКОЛ"', 'Белгородская область', 8001, 32);

INSERT INTO result_reps (id, result_id, exercise, hand, reps) VALUES
  (8001, 8001, 'jerk', 'both', 69),
  (8002, 8002, 'jerk', 'both', 32),
  (8003, 8003, 'jerk', 'both', 85),
  (8004, 8004, 'jerk', 'both', 62),
  (8005, 8005, 'jerk', 'both', 51),
  (8006, 8006, 'jerk', 'both', 16),
  (8007, 8007, 'jerk', 'both', 97),
  (8008, 8008, 'jerk', 'both', 61),
  (8009, 8009, 'jerk', 'both', 60),
  (8010, 8010, 'jerk', 'both', 49),
  (8011, 8011, 'jerk', 'both', 79),
  (8012, 8012, 'jerk', 'both', 48),
  (8013, 8013, 'jerk', 'both', 36),
  (8014, 8014, 'jerk', 'both', 13),
  (8015, 8015, 'jerk', 'both', 95),
  (8016, 8016, 'jerk', 'both', 62),
  (8017, 8017, 'jerk', 'both', 50),
  (8018, 8018, 'jerk', 'both', 16),
  (8019, 8019, 'jerk', 'both', 115),
  (8020, 8020, 'jerk', 'both', 102),
  (8021, 8021, 'jerk', 'both', 94),
  (8022, 8022, 'jerk', 'both', 73),
  (8023, 8023, 'jerk', 'both', 72),
  (8024, 8024, 'jerk', 'both', 45),
  (8025, 8025, 'jerk', 'both', 115),
  (8026, 8026, 'jerk', 'both', 108),
  (8027, 8027, 'jerk', 'both', 99),
  (8028, 8028, 'jerk', 'both', 86),
  (8029, 8029, 'jerk', 'both', 80),
  (8030, 8030, 'jerk', 'both', 57),
  (8031, 8031, 'jerk', 'both', 140),
  (8032, 8032, 'jerk', 'both', 105),
  (8033, 8033, 'jerk', 'both', 88),
  (8034, 8034, 'jerk', 'both', 80),
  (8035, 8035, 'jerk', 'both', 79),
  (8036, 8036, 'jerk', 'both', 78),
  (8037, 8037, 'jerk', 'both', 69),
  (8038, 8038, 'jerk', 'both', 41),
  (8039, 8039, 'jerk', 'both', 36),
  (8040, 8040, 'jerk', 'both', 105),
  (8041, 8041, 'jerk', 'both', 102),
  (8042, 8042, 'jerk', 'both', 96),
  (8043, 8043, 'jerk', 'both', 92),
  (8044, 8044, 'jerk', 'both', 90),
  (8045, 8045, 'jerk', 'both', 79),
  (8046, 8046, 'jerk', 'both', 74),
  (8047, 8047, 'jerk', 'both', 66),
  (8048, 8048, 'jerk', 'both', 53),
  (8049, 8049, 'jerk', 'both', 153),
  (8050, 8050, 'jerk', 'both', 142),
  (8051, 8051, 'jerk', 'both', 105),
  (8052, 8052, 'jerk', 'both', 98),
  (8053, 8053, 'jerk', 'both', 95),
  (8054, 8054, 'jerk', 'both', 79),
  (8055, 8055, 'jerk', 'both', 147),
  (8056, 8056, 'jerk', 'both', 140),
  (8057, 8057, 'jerk', 'both', 128),
  (8058, 8058, 'jerk', 'both', 82),
  (8059, 8059, 'jerk', 'both', 81),
  (8060, 8060, 'jerk', 'both', 78),
  (8061, 8061, 'long_cycle', 'both', 50),
  (8062, 8062, 'long_cycle', 'both', 29),
  (8063, 8063, 'long_cycle', 'both', 26),
  (8064, 8064, 'long_cycle', 'both', 26),
  (8065, 8065, 'long_cycle', 'both', 72),
  (8066, 8066, 'long_cycle', 'both', 46),
  (8067, 8067, 'long_cycle', 'both', 45),
  (8068, 8068, 'long_cycle', 'both', 75),
  (8069, 8069, 'long_cycle', 'both', 36),
  (8070, 8070, 'long_cycle', 'both', 35),
  (8071, 8071, 'long_cycle', 'both', 25),
  (8072, 8072, 'long_cycle', 'both', 70),
  (8073, 8073, 'long_cycle', 'both', 20),
  (8074, 8074, 'long_cycle', 'both', 44),
  (8075, 8075, 'long_cycle', 'both', 43),
  (8076, 8076, 'long_cycle', 'both', 40),
  (8077, 8077, 'long_cycle', 'both', 39),
  (8078, 8078, 'long_cycle', 'both', 64),
  (8079, 8079, 'long_cycle', 'both', 63),
  (8080, 8080, 'long_cycle', 'both', 46),
  (8081, 8081, 'long_cycle', 'both', 16),
  (8082, 8082, 'long_cycle', 'both', 73),
  (8083, 8083, 'long_cycle', 'both', 71),
  (8084, 8084, 'long_cycle', 'both', 62),
  (8085, 8085, 'long_cycle', 'both', 58),
  (8086, 8086, 'long_cycle', 'both', 57),
  (8087, 8087, 'long_cycle', 'both', 46),
  (8088, 8088, 'long_cycle', 'both', 31),
  (8089, 8089, 'long_cycle', 'both', 26),
  (8090, 8090, 'long_cycle', 'both', 24),
  (8091, 8091, 'long_cycle', 'both', 73),
  (8092, 8092, 'long_cycle', 'both', 55),
  (8093, 8093, 'long_cycle', 'both', 50),
  (8094, 8094, 'long_cycle', 'both', 50),
  (8095, 8095, 'long_cycle', 'both', 46),
  (8096, 8096, 'long_cycle', 'both', 40),
  (8097, 8097, 'long_cycle', 'both', 40),
  (8098, 8098, 'long_cycle', 'both', 37),
  (8099, 8099, 'long_cycle', 'both', 23),
  (8100, 8100, 'long_cycle', 'both', 80),
  (8101, 8101, 'long_cycle', 'both', 65),
  (8102, 8102, 'long_cycle', 'both', 50),
  (8103, 8103, 'long_cycle', 'both', 45),
  (8104, 8104, 'long_cycle', 'both', 35),
  (8105, 8105, 'long_cycle', 'both', 78),
  (8106, 8106, 'long_cycle', 'both', 74),
  (8107, 8107, 'long_cycle', 'both', 57),
  (8108, 8108, 'long_cycle', 'both', 50),
  (8109, 8109, 'long_cycle', 'both', 45),
  (8110, 8110, 'long_cycle', 'both', 40),
  (8111, 8111, 'long_cycle', 'both', 16),
  (8112, 8112, 'long_cycle', 'both', 90),
  (8113, 8113, 'long_cycle', 'both', 75),
  (8114, 8114, 'long_cycle', 'both', 62),
  (8115, 8115, 'long_cycle', 'both', 45),
  (8116, 8116, 'long_cycle', 'both', 43),
  (8117, 8117, 'long_cycle', 'both', 37),
  (8118, 8118, 'long_cycle', 'both', 31),
  (8119, 8119, 'snatch', 'both', 146),
  (8120, 8120, 'snatch', 'both', 120),
  (8121, 8121, 'snatch', 'both', 98),
  (8122, 8122, 'snatch', 'both', 85),
  (8123, 8123, 'snatch', 'both', 40),
  (8124, 8124, 'snatch', 'both', 140),
  (8125, 8125, 'snatch', 'both', 111),
  (8126, 8126, 'snatch', 'both', 100),
  (8127, 8127, 'snatch', 'both', 93),
  (8128, 8128, 'snatch', 'both', 172),
  (8129, 8129, 'snatch', 'both', 166),
  (8130, 8130, 'snatch', 'both', 143),
  (8131, 8131, 'snatch', 'both', 131),
  (8132, 8132, 'snatch', 'both', 129),
  (8133, 8133, 'snatch', 'both', 125),
  (8134, 8134, 'snatch', 'both', 115),
  (8135, 8135, 'snatch', 'both', 106),
  (8136, 8136, 'snatch', 'both', 89),
  (8137, 8137, 'snatch', 'both', 81),
  (8138, 8138, 'snatch', 'both', 67),
  (8139, 8139, 'snatch', 'both', 180),
  (8140, 8140, 'snatch', 'both', 176),
  (8141, 8141, 'snatch', 'both', 166),
  (8142, 8142, 'snatch', 'both', 136),
  (8143, 8143, 'snatch', 'both', 135),
  (8144, 8144, 'snatch', 'both', 110),
  (8145, 8145, 'snatch', 'both', 97),
  (8146, 8146, 'snatch', 'both', 92),
  (8147, 8147, 'snatch', 'both', 81),
  (8148, 8148, 'snatch', 'both', 50),
  (8149, 8149, 'snatch', 'both', 168),
  (8150, 8150, 'snatch', 'both', 163),
  (8151, 8151, 'snatch', 'both', 160),
  (8152, 8152, 'snatch', 'both', 156),
  (8153, 8153, 'snatch', 'both', 150),
  (8154, 8154, 'snatch', 'both', 149),
  (8155, 8155, 'snatch', 'both', 132),
  (8156, 8156, 'snatch', 'both', 131),
  (8157, 8157, 'snatch', 'both', 99),
  (8158, 8158, 'snatch', 'both', 95),
  (8159, 8159, 'snatch', 'both', 91),
  (8160, 8160, 'snatch', 'both', 74),
  (8161, 8161, 'snatch', 'both', 70);

