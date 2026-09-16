-- Чемпионат Центрального федерального округа 2026, Смоленск, 2026-04-13—2026-04-16.
-- Сгенерировано scripts/gen_seed.py из data/chempionat-tsfo-2026.json, не править руками.
-- Источник — скан официальных протоколов чемпионата Центрального федерального округа 2026 (PDF без текстового слоя). ФИО с отчеством, дата рождения полная. Импорт ведётся по одной индивидуальной категории отдельным коммитом. Титульный лист (стр. 1), эстафеты длинного цикла (стр. 14–16), командный зачёт (стр. 39) и список судей (стр. 40) не импортируются. Жонглирование (стр. 13) не поддержано текущей схемой. Командные очки сохраняются в JSON как напечатано, но в базу не попадают. На страницах 2 и 3 скан обрезан слева: колонка «Место» отсутствует, порядок мест восстановлен по убыванию результата и командных очков (см. ERRATA.md).
-- Данные извлечены из протокола моделью; сверка человеком не проводилась,
-- поэтому results.verified_by остаётся пустым (FR-A14).

INSERT OR IGNORE INTO regions (name, country) VALUES
  ('Ярославская область', 'RU'),
  ('Калужская область', 'RU'),
  ('Белгородская область', 'RU'),
  ('г. Москва', 'RU'),
  ('Воронежская область', 'RU'),
  ('Курская область', 'RU'),
  ('Рязанская область', 'RU'),
  ('Московская область', 'RU'),
  ('Смоленская область', 'RU'),
  ('Брянская область', 'RU'),
  ('Владимирская область', 'RU'),
  ('Ивановская область', 'RU');

INSERT OR IGNORE INTO clubs (name, region_id) VALUES
  ('ЯРОО ФГС', (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU')),
  ('СШОР Маршал', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')),
  ('МБУ ДО СШОР 5 г Белгород', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')),
  ('ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')),
  ('ВС РФ', (SELECT id FROM regions WHERE name = 'Воронежская область' AND country = 'RU')),
  ('РО ООО «ВФГС» в г. Москве', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')),
  ('МКУ ДО "Бобровская СШ им. В.Л. Паткина"', (SELECT id FROM regions WHERE name = 'Воронежская область' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Курская область' AND country = 'RU')),
  ('СШОР "Маршал"', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')),
  ('СШОР «Маршал»', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')),
  ('МАУ ДО СШОР "Метеор"', (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU')),
  ('МБУ ДО СШ "ОСКОЛ"', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')),
  ('СШ Маршал', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')),
  ('Ддю Алые паруса Ряжск', (SELECT id FROM regions WHERE name = 'Рязанская область' AND country = 'RU')),
  ('МУ ДО "СШ "Легион"', (SELECT id FROM regions WHERE name = 'Московская область' AND country = 'RU')),
  ('РО ООО "ВФГС" в г. Москве', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')),
  ('РО ООО "ВФГС" в Московской области', (SELECT id FROM regions WHERE name = 'Московская область' AND country = 'RU')),
  ('КСШ № 1', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')),
  ('ВА ВПВО', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')),
  ('КСШ №1/СГУС', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')),
  ('РО ООО "ВФГС" в г.Москве', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')),
  ('КСШ №1', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')),
  ('СШОР по борьбе', (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU')),
  ('МБУ ДО СШ "ОСКОЛ"/СШОР 5 Белгород', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')),
  ('ГБУ ДО МКСШОР "Запад" отделение "Семёрка"', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')),
  ('Владимирская область', (SELECT id FROM regions WHERE name = 'Владимирская область' AND country = 'RU')),
  ('РОООО "ВФГС по ИО"', (SELECT id FROM regions WHERE name = 'Ивановская область' AND country = 'RU')),
  ('ГБУ ДО МКСШОР "Запад" Отделение "Семёрка"', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')),
  ('МБУДО КСШ1 , СГУС', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')),
  ('МБУ ДО СШ "Юность"', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')),
  ('ФГС КО', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')),
  ('РО ООО ВФГС в г. Москве', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'));

INSERT OR IGNORE INTO federations (name, short_name, country) VALUES
  ('Всероссийская федерация гиревого спорта', 'ВФГС', 'RU');

INSERT INTO competitions (id, slug, name, date_start, date_end, city, country, competition_rank_id, federation_id, source_url, is_published) VALUES
  (8001, 'chempionat-tsfo-2026', 'Чемпионат Центрального федерального округа 2026', '2026-04-13', '2026-04-16', 'Смоленск', 'RU', (SELECT id FROM competition_ranks WHERE code = 'federal_district'), (SELECT id FROM federations WHERE name = 'Всероссийская федерация гиревого спорта'), NULL, 1);

INSERT INTO protocols (id, competition_id, r2_key, filename, page_count, is_scan, status, published_at) VALUES
  (8001, 8001, 'protocols/chempionat-tsfo-2026.pdf', 'protokol_chempionat_TsFO.pdf', 40, 1, 'published', '2026-04-13');

INSERT INTO categories (id, competition_id, discipline_id, sex, age_group_id, division_id, bell_kg, hands, time_limit_min, weight_class_raw, weight_class_kg, weight_class_is_open, participants_declared, is_deferred, sort_order) VALUES
  (8001, 8001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '63', 63, 0, 4, 0, 1),
  (8002, 8001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '68', 68, 0, 6, 0, 2),
  (8003, 8001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '73', 73, 0, 6, 0, 3),
  (8004, 8001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '78', 78, 0, 9, 0, 4),
  (8005, 8001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '58', 58, 0, 4, 0, 5),
  (8006, 8001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '63', 63, 0, 3, 0, 6),
  (8007, 8001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '68+', 68, 1, 4, 0, 7),
  (8008, 8001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '68', 68, 0, 2, 0, 8),
  (8009, 8001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '63', 63, 0, 4, 0, 9),
  (8010, 8001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '68', 68, 0, 4, 0, 10),
  (8011, 8001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '73', 73, 0, 9, 0, 11),
  (8012, 8001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '78', 78, 0, 9, 0, 12),
  (8013, 8001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '85', 85, 0, 5, 0, 13),
  (8014, 8001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '95+', 95, 1, 7, 0, 14),
  (8015, 8001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '95', 95, 0, 7, 0, 15);

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
  SELECT 'Трофимова', 'Милена', 'Михайловна', 2007, 'f', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР Маршал' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Пянко И.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Трофимова' AND a.first_name = 'Милена' AND a.middle_name = 'Михайловна' AND a.birth_year = 2007 LIMIT 1);
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
  SELECT 'Пивень', 'Александра', 'Максимовна', 2004, 'f', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР «Маршал»' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Пянко И.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Пивень' AND a.first_name = 'Александра' AND a.middle_name = 'Максимовна' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Мартынова', 'Любовь', 'Владимировна', 2007, 'f', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Ландин А.Ю., Бирюков С.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Мартынова' AND a.first_name = 'Любовь' AND a.middle_name = 'Владимировна' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Подольская', 'Анастасия', 'Владимировна', 2005, 'f', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО "ВФГС" в г.Москве' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Соловьев А.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Подольская' AND a.first_name = 'Анастасия' AND a.middle_name = 'Владимировна' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Мартынова', 'Ирина', 'Александровна', 1999, 'f', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР «Маршал»' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Трофимов М.А.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Мартынова' AND a.first_name = 'Ирина' AND a.middle_name = 'Александровна' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Якубенкова', 'Анна', 'Андреевна', 2007, 'f', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КСШ №1' AND region_id = (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')), 'Шванев В.Б.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Якубенкова' AND a.first_name = 'Анна' AND a.middle_name = 'Андреевна' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Побережная', 'Анна', 'Владимировна', 2010, 'f', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Маршал"' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Пянко И.А.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Побережная' AND a.first_name = 'Анна' AND a.middle_name = 'Владимировна' AND a.birth_year = 2010 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Щекина', 'Алеся', 'Константиновна', 2002, 'f', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ "ОСКОЛ"' AND region_id = (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')), 'Ермаков К.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Щекина' AND a.first_name = 'Алеся' AND a.middle_name = 'Константиновна' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Воропаева', 'Виктория', 'Витальевна', 2004, 'f', (SELECT id FROM regions WHERE name = 'Воронежская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МКУ ДО "Бобровская СШ им. В.Л. Паткина"' AND region_id = (SELECT id FROM regions WHERE name = 'Воронежская область' AND country = 'RU')), 'Сорокин Н.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Воропаева' AND a.first_name = 'Виктория' AND a.middle_name = 'Витальевна' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Альянова', 'Виктория', 'Евгеньевна', 2004, 'f', (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР по борьбе' AND region_id = (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU')), 'Гомонов В.Н., Лукьянчиков Ю.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Альянова' AND a.first_name = 'Виктория' AND a.middle_name = 'Евгеньевна' AND a.birth_year = 2004 LIMIT 1);
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
  SELECT 'Андрущенко', 'Сергей', 'Александрович', 2005, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ГБУ ДО МКСШОР "Запад" Отделение "Семёрка"' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Ландин А.Ю., Ермаков К.И., Турищев Д.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Андрущенко' AND a.first_name = 'Сергей' AND a.middle_name = 'Александрович' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Мухитов', 'Андрей', 'Вячеславович', 1999, 'm', (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР по борьбе' AND region_id = (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU')), 'Гомонов В.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Мухитов' AND a.first_name = 'Андрей' AND a.middle_name = 'Вячеславович' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кузьмин', 'Илья', 'Алексеевич', 2007, 'm', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУДО КСШ1 , СГУС' AND region_id = (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')), 'Сергеев С.В., Алферова В.Я., Иванов Е.А.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кузьмин' AND a.first_name = 'Илья' AND a.middle_name = 'Алексеевич' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Витков', 'Алексей', 'Викторович', 1990, 'm', (SELECT id FROM regions WHERE name = 'Московская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО "ВФГС" в Московской области' AND region_id = (SELECT id FROM regions WHERE name = 'Московская область' AND country = 'RU')), 'Усс В.А.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Витков' AND a.first_name = 'Алексей' AND a.middle_name = 'Викторович' AND a.birth_year = 1990 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Аманатиди', 'Михаил', 'Константинович', 2009, 'm', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ "Юность"' AND region_id = (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')), 'Власов А.П.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Аманатиди' AND a.first_name = 'Михаил' AND a.middle_name = 'Константинович' AND a.birth_year = 2009 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Турищев', 'Дмитрий', 'Владимирович', 1992, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ГБУ ДО МКСШОР "Запад" отделение "Семёрка"' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Ландин А.Ю., Винтовкин Н.В., Дуюнов Е.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Турищев' AND a.first_name = 'Дмитрий' AND a.middle_name = 'Владимирович' AND a.birth_year = 1992 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Калистратов', 'Артем', 'Валерьевич', 1992, 'm', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КСШ № 1' AND region_id = (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')), 'Сергеев С.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Калистратов' AND a.first_name = 'Артем' AND a.middle_name = 'Валерьевич' AND a.birth_year = 1992 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Слащев', 'Степан', 'Сергеевич', 2008, 'm', (SELECT id FROM regions WHERE name = 'Московская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МУ ДО "СШ "Легион"' AND region_id = (SELECT id FROM regions WHERE name = 'Московская область' AND country = 'RU')), 'Володин Д.И.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Слащев' AND a.first_name = 'Степан' AND a.middle_name = 'Сергеевич' AND a.birth_year = 2008 LIMIT 1);
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
  SELECT 'Кулаков', 'Иван', 'Иванович', 1998, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР «Маршал»' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Шматов И.Б., Трофимов М.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кулаков' AND a.first_name = 'Иван' AND a.middle_name = 'Иванович' AND a.birth_year = 1998 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кирюхин', 'Роман', 'Александрович', 1997, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ФГС КО' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Соловьев А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кирюхин' AND a.first_name = 'Роман' AND a.middle_name = 'Александрович' AND a.birth_year = 1997 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кулик', 'Никита', 'Алексеевич', 2005, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Ландин А.Ю., Турищев Д.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кулик' AND a.first_name = 'Никита' AND a.middle_name = 'Алексеевич' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Булгаков', 'Денис', 'Витальевич', 1984, 'm', (SELECT id FROM regions WHERE name = 'Московская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО "ВФГС" в Московской области' AND region_id = (SELECT id FROM regions WHERE name = 'Московская область' AND country = 'RU')), 'Усс В.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Булгаков' AND a.first_name = 'Денис' AND a.middle_name = 'Витальевич' AND a.birth_year = 1984 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Захаров', 'Станислав', 'Олегович', 1991, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО ВФГС в г. Москве' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Ландин А.Ю.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Захаров' AND a.first_name = 'Станислав' AND a.middle_name = 'Олегович' AND a.birth_year = 1991 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Муссалиев', 'Муса', 'Габиб Оглы', 2007, 'm', (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР по борьбе' AND region_id = (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU')), 'Гомонов В.Н., Лукьянчиков Ю.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Муссалиев' AND a.first_name = 'Муса' AND a.middle_name = 'Габиб Оглы' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Мамедсаатов', 'Егор', 'Русланович', 2008, 'm', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ "Юность"' AND region_id = (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')), 'Власов А.П.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Мамедсаатов' AND a.first_name = 'Егор' AND a.middle_name = 'Русланович' AND a.birth_year = 2008 LIMIT 1);

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
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'trofimova-milena-2007' AND s.athlete_id <> a.id)
              THEN 'trofimova-milena-2007-' || a.id ELSE 'trofimova-milena-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Трофимова' AND first_name = 'Милена' AND middle_name = 'Михайловна' AND birth_year = 2007 LIMIT 1)
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
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'martynova-irina-1999' AND s.athlete_id <> a.id)
              THEN 'martynova-irina-1999-' || a.id ELSE 'martynova-irina-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Мартынова' AND first_name = 'Ирина' AND middle_name = 'Александровна' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'yakubenkova-anna-2007' AND s.athlete_id <> a.id)
              THEN 'yakubenkova-anna-2007-' || a.id ELSE 'yakubenkova-anna-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Якубенкова' AND first_name = 'Анна' AND middle_name = 'Андреевна' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'poberezhnaya-anna-2010' AND s.athlete_id <> a.id)
              THEN 'poberezhnaya-anna-2010-' || a.id ELSE 'poberezhnaya-anna-2010' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Побережная' AND first_name = 'Анна' AND middle_name = 'Владимировна' AND birth_year = 2010 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'schekina-alesya-2002' AND s.athlete_id <> a.id)
              THEN 'schekina-alesya-2002-' || a.id ELSE 'schekina-alesya-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Щекина' AND first_name = 'Алеся' AND middle_name = 'Константиновна' AND birth_year = 2002 LIMIT 1)
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
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kuzmin-ilya-2007' AND s.athlete_id <> a.id)
              THEN 'kuzmin-ilya-2007-' || a.id ELSE 'kuzmin-ilya-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кузьмин' AND first_name = 'Илья' AND middle_name = 'Алексеевич' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'vitkov-aleksey-1990' AND s.athlete_id <> a.id)
              THEN 'vitkov-aleksey-1990-' || a.id ELSE 'vitkov-aleksey-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Витков' AND first_name = 'Алексей' AND middle_name = 'Викторович' AND birth_year = 1990 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'amanatidi-mihail-2009' AND s.athlete_id <> a.id)
              THEN 'amanatidi-mihail-2009-' || a.id ELSE 'amanatidi-mihail-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Аманатиди' AND first_name = 'Михаил' AND middle_name = 'Константинович' AND birth_year = 2009 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'turischev-dmitriy-1992' AND s.athlete_id <> a.id)
              THEN 'turischev-dmitriy-1992-' || a.id ELSE 'turischev-dmitriy-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Турищев' AND first_name = 'Дмитрий' AND middle_name = 'Владимирович' AND birth_year = 1992 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kalistratov-artem-1992' AND s.athlete_id <> a.id)
              THEN 'kalistratov-artem-1992-' || a.id ELSE 'kalistratov-artem-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Калистратов' AND first_name = 'Артем' AND middle_name = 'Валерьевич' AND birth_year = 1992 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'slaschev-stepan-2008' AND s.athlete_id <> a.id)
              THEN 'slaschev-stepan-2008-' || a.id ELSE 'slaschev-stepan-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Слащев' AND first_name = 'Степан' AND middle_name = 'Сергеевич' AND birth_year = 2008 LIMIT 1)
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
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kulakov-ivan-1998' AND s.athlete_id <> a.id)
              THEN 'kulakov-ivan-1998-' || a.id ELSE 'kulakov-ivan-1998' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кулаков' AND first_name = 'Иван' AND middle_name = 'Иванович' AND birth_year = 1998 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kiryuhin-roman-1997' AND s.athlete_id <> a.id)
              THEN 'kiryuhin-roman-1997-' || a.id ELSE 'kiryuhin-roman-1997' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кирюхин' AND first_name = 'Роман' AND middle_name = 'Александрович' AND birth_year = 1997 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kulik-nikita-2005' AND s.athlete_id <> a.id)
              THEN 'kulik-nikita-2005-' || a.id ELSE 'kulik-nikita-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кулик' AND first_name = 'Никита' AND middle_name = 'Алексеевич' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'bulgakov-denis-1984' AND s.athlete_id <> a.id)
              THEN 'bulgakov-denis-1984-' || a.id ELSE 'bulgakov-denis-1984' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Булгаков' AND first_name = 'Денис' AND middle_name = 'Витальевич' AND birth_year = 1984 LIMIT 1)
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

INSERT INTO results (id, category_id, athlete_id, place, total_reps, points, body_weight_kg, rank_achieved_id, discipline_id, bell_kg, hands, time_limit_min, competition_id, event_date, raw_name, raw_club, raw_region, protocol_id, source_page) VALUES
  (8001, 8001, (SELECT id FROM athletes WHERE last_name = 'Арсентьев' AND first_name = 'Виталий' AND middle_name = 'Александрович' AND birth_year = 2001 LIMIT 1), 1, 95, NULL, 62.9, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Арсентьев Виталий Александрович', 'ЯРОО ФГС', 'Ярославская область', 8001, 17),
  (8002, 8001, (SELECT id FROM athletes WHERE last_name = 'Кормилицын' AND first_name = 'Иван' AND middle_name = 'Николаевич' AND birth_year = 2010 LIMIT 1), 2, 62, NULL, 63.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Кормилицын Иван Николаевич', 'СШОР Маршал', 'Калужская область', 8001, 17),
  (8003, 8001, (SELECT id FROM athletes WHERE last_name = 'Кривко' AND first_name = 'Никита' AND middle_name = 'Алексеевич' AND birth_year = 2002 LIMIT 1), 3, 50, NULL, 62.7, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Кривко Никита Алексеевич', 'МБУ ДО СШОР 5 г Белгород', 'Белгородская область', 8001, 17),
  (8004, 8001, (SELECT id FROM athletes WHERE last_name = 'Буданов' AND first_name = 'Григорий' AND middle_name = 'Денисович' AND birth_year = 2010 LIMIT 1), 4, 16, NULL, 61.25, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Буданов Григорий Денисович', 'ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»', 'г. Москва', 8001, 17),
  (8005, 8002, (SELECT id FROM athletes WHERE last_name = 'Зуев' AND first_name = 'Владислав' AND middle_name = 'Алексеевич' AND birth_year = 2000 LIMIT 1), 1, 115, NULL, 67.95, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Зуев Владислав Алексеевич', 'ВС РФ', 'Воронежская область', 8001, 18),
  (8006, 8002, (SELECT id FROM athletes WHERE last_name = 'Горячев' AND first_name = 'Ярослав' AND middle_name = 'Алексеевич' AND birth_year = 2010 LIMIT 1), 2, 102, NULL, 68.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Горячев Ярослав Алексеевич', 'СШОР Маршал', 'Калужская область', 8001, 18),
  (8007, 8002, (SELECT id FROM athletes WHERE last_name = 'Хамидов' AND first_name = 'Фахриддин' AND middle_name = 'Фарход угли' AND birth_year = 2002 LIMIT 1), 3, 94, NULL, 67.95, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Хамидов Фахриддин Фарход угли', 'СШОР Маршал', 'Калужская область', 8001, 18),
  (8008, 8002, (SELECT id FROM athletes WHERE last_name = 'Сидоренков' AND first_name = 'Александр' AND middle_name = 'Александрович' AND birth_year = 2010 LIMIT 1), 4, 73, NULL, 67.8, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Сидоренков Александр Александрович', 'РО ООО «ВФГС» в г. Москве', 'г. Москва', 8001, 18),
  (8009, 8002, (SELECT id FROM athletes WHERE last_name = 'Подволоцкий' AND first_name = 'Сергей' AND middle_name = 'Александрович' AND birth_year = 1997 LIMIT 1), 5, 72, NULL, 66.5, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Подволоцкий Сергей Александрович', 'МКУ ДО "Бобровская СШ им. В.Л. Паткина"', 'Воронежская область', 8001, 18),
  (8010, 8002, (SELECT id FROM athletes WHERE last_name = 'Пухучкин' AND first_name = 'Евгений' AND middle_name = 'Викторович' AND birth_year = 1979 LIMIT 1), 6, 45, NULL, 66.9, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Пухучкин Евгений Викторович', '', 'Курская область', 8001, 18),
  (8011, 8003, (SELECT id FROM athletes WHERE last_name = 'Трофимов' AND first_name = 'Тимур' AND middle_name = 'Михайлович' AND birth_year = 2011 LIMIT 1), 1, 115, NULL, 73.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Трофимов Тимур Михайлович', 'СШОР "Маршал"', 'Калужская область', 8001, 19),
  (8012, 8003, (SELECT id FROM athletes WHERE last_name = 'Сергеев' AND first_name = 'Александр' AND middle_name = 'Сергеевич' AND birth_year = 1991 LIMIT 1), 2, 108, NULL, 71.75, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Сергеев Александр Сергеевич', 'СШОР «Маршал»', 'Калужская область', 8001, 19),
  (8013, 8003, (SELECT id FROM athletes WHERE last_name = 'Васин' AND first_name = 'Артём' AND middle_name = 'Иванович' AND birth_year = 2007 LIMIT 1), 3, 99, NULL, 71.1, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Васин Артём Иванович', 'СШОР "Маршал"', 'Калужская область', 8001, 19),
  (8014, 8003, (SELECT id FROM athletes WHERE last_name = 'Лисицын' AND first_name = 'Кирилл' AND middle_name = 'Сергеевич' AND birth_year = 2007 LIMIT 1), 4, 86, NULL, 72.9, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Лисицын Кирилл Сергеевич', 'МАУ ДО СШОР "Метеор"', 'Ярославская область', 8001, 19),
  (8015, 8003, (SELECT id FROM athletes WHERE last_name = 'Исмаилов' AND first_name = 'Артём' AND middle_name = 'Николаевич' AND birth_year = 2008 LIMIT 1), 5, 80, NULL, 70.35, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Исмаилов Артём Николаевич', 'МБУ ДО СШ "ОСКОЛ"', 'Белгородская область', 8001, 19),
  (8016, 8003, (SELECT id FROM athletes WHERE last_name = 'Щипков' AND first_name = 'Даниил' AND middle_name = 'Олегович' AND birth_year = 2009 LIMIT 1), 6, 57, NULL, 71.55, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Щипков Даниил Олегович', 'МАУ ДО СШОР "Метеор"', 'Ярославская область', 8001, 19),
  (8017, 8004, (SELECT id FROM athletes WHERE last_name = 'Сулейманов' AND first_name = 'Мовсар' AND middle_name = 'Мусаевич' AND birth_year = 1989 LIMIT 1), 1, 140, NULL, 78.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Сулейманов Мовсар Мусаевич', 'СШ Маршал', 'Калужская область', 8001, 20),
  (8018, 8004, (SELECT id FROM athletes WHERE last_name = 'Ванин' AND first_name = 'Виктор' AND middle_name = 'Викторович' AND birth_year = 1991 LIMIT 1), 2, 105, NULL, 77.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Ванин Виктор Викторович', 'Ддю Алые паруса Ряжск', 'Рязанская область', 8001, 20),
  (8019, 8004, (SELECT id FROM athletes WHERE last_name = 'Володин' AND first_name = 'Денис' AND middle_name = 'Игоревич' AND birth_year = 1993 LIMIT 1), 3, 88, NULL, 76.55, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Володин Денис Игоревич', 'МУ ДО "СШ "Легион"', 'Московская область', 8001, 20),
  (8020, 8004, (SELECT id FROM athletes WHERE last_name = 'Луценко' AND first_name = 'Никита' AND middle_name = 'Ильич' AND birth_year = 2003 LIMIT 1), 4, 80, NULL, 77.45, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Луценко Никита Ильич', 'РО ООО "ВФГС" в г. Москве', 'г. Москва', 8001, 20),
  (8021, 8004, (SELECT id FROM athletes WHERE last_name = 'Поляков' AND first_name = 'Матвей' AND middle_name = 'Юрьевич' AND birth_year = 2002 LIMIT 1), 5, 79, NULL, 78.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Поляков Матвей Юрьевич', 'МБУ ДО СШОР 5 г Белгород', 'Белгородская область', 8001, 20),
  (8022, 8004, (SELECT id FROM athletes WHERE last_name = 'Ладе' AND first_name = 'Роман' AND middle_name = 'Андреевич' AND birth_year = 1991 LIMIT 1), 6, 78, NULL, 78.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Ладе Роман Андреевич', 'РО ООО "ВФГС" в Московской области', 'Московская область', 8001, 20),
  (8023, 8004, (SELECT id FROM athletes WHERE last_name = 'Абдразаков' AND first_name = 'Рафик' AND middle_name = 'Шавкатович' AND birth_year = 2002 LIMIT 1), 7, 69, NULL, 77.55, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Абдразаков Рафик Шавкатович', 'КСШ № 1', 'Смоленская область', 8001, 20),
  (8024, 8004, (SELECT id FROM athletes WHERE last_name = 'Богданов' AND first_name = 'Михаил' AND middle_name = 'Юрьевич' AND birth_year = 2007 LIMIT 1), 8, 41, NULL, 77.2, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Богданов Михаил Юрьевич', 'ВА ВПВО', 'Смоленская область', 8001, 20),
  (8025, 8004, (SELECT id FROM athletes WHERE last_name = 'Масленников' AND first_name = 'Иван' AND middle_name = 'Валерьевич' AND birth_year = 2011 LIMIT 1), 9, 36, NULL, 73.5, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 8001, '2026-04-13', 'Масленников Иван Валерьевич', 'МБУ ДО СШ "ОСКОЛ"', 'Белгородская область', 8001, 20),
  (8026, 8005, (SELECT id FROM athletes WHERE last_name = 'Трофимова' AND first_name = 'Милена' AND middle_name = 'Михайловна' AND birth_year = 2007 LIMIT 1), 1, 50, NULL, 58.0, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 8001, '2026-04-13', 'Трофимова Милена Михайловна', 'СШОР Маршал', 'Калужская область', 8001, 9),
  (8027, 8005, (SELECT id FROM athletes WHERE last_name = 'Шилихина' AND first_name = 'Дарья' AND middle_name = 'Павловна' AND birth_year = 2006 LIMIT 1), 2, 29, NULL, 57.92, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 8001, '2026-04-13', 'Шилихина Дарья Павловна', 'КСШ №1/СГУС', 'Смоленская область', 8001, 9),
  (8028, 8005, (SELECT id FROM athletes WHERE last_name = 'Фомина' AND first_name = 'Елизавета' AND middle_name = 'Алексеевна' AND birth_year = 2009 LIMIT 1), 3, 26, NULL, 54.6, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 8001, '2026-04-13', 'Фомина Елизавета Алексеевна', 'МБУ ДО СШОР 5 г Белгород', 'Белгородская область', 8001, 9),
  (8029, 8005, (SELECT id FROM athletes WHERE last_name = 'Чернова' AND first_name = 'Кира' AND middle_name = 'Николаевна' AND birth_year = 2009 LIMIT 1), 4, 26, NULL, 56.86, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 8001, '2026-04-13', 'Чернова Кира Николаевна', 'СШОР «Маршал»', 'Калужская область', 8001, 9),
  (8030, 8006, (SELECT id FROM athletes WHERE last_name = 'Пивень' AND first_name = 'Александра' AND middle_name = 'Максимовна' AND birth_year = 2004 LIMIT 1), 1, 72, NULL, 60.6, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 8001, '2026-04-13', 'Пивень Александра Максимовна', 'СШОР «Маршал»', 'Калужская область', 8001, 10),
  (8031, 8006, (SELECT id FROM athletes WHERE last_name = 'Мартынова' AND first_name = 'Любовь' AND middle_name = 'Владимировна' AND birth_year = 2007 LIMIT 1), 2, 46, NULL, 63.0, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 8001, '2026-04-13', 'Мартынова Любовь Владимировна', 'ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»', 'г. Москва', 8001, 10),
  (8032, 8006, (SELECT id FROM athletes WHERE last_name = 'Подольская' AND first_name = 'Анастасия' AND middle_name = 'Владимировна' AND birth_year = 2005 LIMIT 1), 3, 45, NULL, 58.1, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 8001, '2026-04-13', 'Подольская Анастасия Владимировна', 'РО ООО "ВФГС" в г.Москве', 'г. Москва', 8001, 10),
  (8033, 8007, (SELECT id FROM athletes WHERE last_name = 'Мартынова' AND first_name = 'Ирина' AND middle_name = 'Александровна' AND birth_year = 1999 LIMIT 1), 1, 75, NULL, 88.3, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 8001, '2026-04-13', 'Мартынова Ирина Александровна', 'СШОР «Маршал»', 'Калужская область', 8001, 12),
  (8034, 8007, (SELECT id FROM athletes WHERE last_name = 'Якубенкова' AND first_name = 'Анна' AND middle_name = 'Андреевна' AND birth_year = 2007 LIMIT 1), 2, 36, NULL, 84.0, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 8001, '2026-04-13', 'Якубенкова Анна Андреевна', 'КСШ №1', 'Смоленская область', 8001, 12),
  (8035, 8007, (SELECT id FROM athletes WHERE last_name = 'Побережная' AND first_name = 'Анна' AND middle_name = 'Владимировна' AND birth_year = 2010 LIMIT 1), 3, 35, NULL, 78.5, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 8001, '2026-04-13', 'Побережная Анна Владимировна', 'СШОР "Маршал"', 'Калужская область', 8001, 12),
  (8036, 8007, (SELECT id FROM athletes WHERE last_name = 'Щекина' AND first_name = 'Алеся' AND middle_name = 'Константиновна' AND birth_year = 2002 LIMIT 1), 4, 25, NULL, 98.5, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 8001, '2026-04-13', 'Щекина Алеся Константиновна', 'МБУ ДО СШ "ОСКОЛ"', 'Белгородская область', 8001, 12),
  (8037, 8008, (SELECT id FROM athletes WHERE last_name = 'Воропаева' AND first_name = 'Виктория' AND middle_name = 'Витальевна' AND birth_year = 2004 LIMIT 1), 1, 70, NULL, 66.75, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 8001, '2026-04-13', 'Воропаева Виктория Витальевна', 'МКУ ДО "Бобровская СШ им. В.Л. Паткина"', 'Воронежская область', 8001, 11),
  (8038, 8008, (SELECT id FROM athletes WHERE last_name = 'Альянова' AND first_name = 'Виктория' AND middle_name = 'Евгеньевна' AND birth_year = 2004 LIMIT 1), 2, 20, NULL, 67.0, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 8001, '2026-04-13', 'Альянова Виктория Евгеньевна', 'СШОР по борьбе', 'Брянская область', 8001, 11),
  (8039, 8009, (SELECT id FROM athletes WHERE last_name = 'Цвик' AND first_name = 'Данил' AND middle_name = 'Александрович' AND birth_year = 2003 LIMIT 1), 1, 44, NULL, 62.9, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Цвик Данил Александрович', 'КСШ № 1', 'Смоленская область', 8001, 2),
  (8040, 8009, (SELECT id FROM athletes WHERE last_name = 'Кормилицын' AND first_name = 'Иван' AND middle_name = 'Николаевич' AND birth_year = 2010 LIMIT 1), 2, 43, NULL, 63.0, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Кормилицын Иван Николаевич', 'СШОР Маршал', 'Калужская область', 8001, 2),
  (8041, 8009, (SELECT id FROM athletes WHERE last_name = 'Дубинин' AND first_name = 'Максим' AND middle_name = 'Николаевич' AND birth_year = 1989 LIMIT 1), 3, 40, NULL, 62.7, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Дубинин Максим Николаевич', 'СШОР по борьбе', 'Брянская область', 8001, 2),
  (8042, 8009, (SELECT id FROM athletes WHERE last_name = 'Кривко' AND first_name = 'Никита' AND middle_name = 'Алексеевич' AND birth_year = 2002 LIMIT 1), 4, 39, NULL, 62.9, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Кривко Никита Алексеевич', 'МБУ ДО СШОР 5 г Белгород', 'Белгородская область', 8001, 2),
  (8043, 8010, (SELECT id FROM athletes WHERE last_name = 'Горячев' AND first_name = 'Ярослав' AND middle_name = 'Алексеевич' AND birth_year = 2010 LIMIT 1), 1, 64, NULL, 68.0, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Горячев Ярослав Алексеевич', 'СШОР Маршал', 'Калужская область', 8001, 3),
  (8044, 8010, (SELECT id FROM athletes WHERE last_name = 'Хамидов' AND first_name = 'Фахриддин' AND middle_name = 'Фарход угли' AND birth_year = 2002 LIMIT 1), 2, 63, NULL, 67.85, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Хамидов Фахриддин Фарход угли', 'СШОР Маршал', 'Калужская область', 8001, 3),
  (8045, 8010, (SELECT id FROM athletes WHERE last_name = 'Сидоренков' AND first_name = 'Александр' AND middle_name = 'Александрович' AND birth_year = 2010 LIMIT 1), 3, 46, NULL, 67.7, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Сидоренков Александр Александрович', 'РО ООО «ВФГС» в г. Москве', 'г. Москва', 8001, 3),
  (8046, 8010, (SELECT id FROM athletes WHERE last_name = 'Копаевский' AND first_name = 'Артём' AND middle_name = 'Александрович' AND birth_year = 2009 LIMIT 1), 4, 16, NULL, 67.35, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Копаевский Артём Александрович', 'МАУ ДО СШОР "Метеор"', 'Ярославская область', 8001, 3),
  (8047, 8011, (SELECT id FROM athletes WHERE last_name = 'Багров' AND first_name = 'Максим' AND middle_name = 'Дмитриевич' AND birth_year = 2009 LIMIT 1), 1, 73, NULL, 72.5, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Багров Максим Дмитриевич', 'РО ООО «ВФГС» в г. Москве', 'г. Москва', 8001, 4),
  (8048, 8011, (SELECT id FROM athletes WHERE last_name = 'Фомин' AND first_name = 'Фёдор' AND middle_name = 'Алексеевич' AND birth_year = 2004 LIMIT 1), 2, 71, NULL, 72.75, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Фомин Фёдор Алексеевич', 'МБУ ДО СШОР 5 г Белгород', 'Белгородская область', 8001, 4),
  (8049, 8011, (SELECT id FROM athletes WHERE last_name = 'Трофимов' AND first_name = 'Тимур' AND middle_name = 'Михайлович' AND birth_year = 2011 LIMIT 1), 3, 62, NULL, 72.9, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Трофимов Тимур Михайлович', 'СШОР "Маршал"', 'Калужская область', 8001, 4),
  (8050, 8011, (SELECT id FROM athletes WHERE last_name = 'Сергеев' AND first_name = 'Александр' AND middle_name = 'Сергеевич' AND birth_year = 1991 LIMIT 1), 4, 58, NULL, 72.2, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Сергеев Александр Сергеевич', 'СШОР «Маршал»', 'Калужская область', 8001, 4),
  (8051, 8011, (SELECT id FROM athletes WHERE last_name = 'Васин' AND first_name = 'Артём' AND middle_name = 'Иванович' AND birth_year = 2007 LIMIT 1), 5, 57, NULL, 72.6, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Васин Артём Иванович', 'СШОР "Маршал"', 'Калужская область', 8001, 4),
  (8052, 8011, (SELECT id FROM athletes WHERE last_name = 'Сушков' AND first_name = 'Владимир' AND middle_name = 'Валерьевия' AND birth_year = 2000 LIMIT 1), 6, 46, NULL, 70.9, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Сушков Владимир Валерьевия', 'МБУ ДО СШ "ОСКОЛ"/СШОР 5 Белгород', 'Белгородская область', 8001, 4),
  (8053, 8011, (SELECT id FROM athletes WHERE last_name = 'Шахрай' AND first_name = 'Владислав' AND middle_name = 'Сергеевич' AND birth_year = 2002 LIMIT 1), 7, 31, NULL, 72.3, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Шахрай Владислав Сергеевич', 'РО ООО «ВФГС» в г. Москве', 'г. Москва', 8001, 4),
  (8054, 8011, (SELECT id FROM athletes WHERE last_name = 'Щипков' AND first_name = 'Даниил' AND middle_name = 'Олегович' AND birth_year = 2009 LIMIT 1), 8, 26, NULL, 71.75, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Щипков Даниил Олегович', 'МАУ ДО СШОР "Метеор"', 'Ярославская область', 8001, 4),
  (8055, 8011, (SELECT id FROM athletes WHERE last_name = 'Науменко' AND first_name = 'Мирослав' AND middle_name = 'Константинович' AND birth_year = 2007 LIMIT 1), 9, 24, NULL, 72.3, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Науменко Мирослав Константинович', 'МАУ ДО СШОР "Метеор"', 'Ярославская область', 8001, 4),
  (8056, 8012, (SELECT id FROM athletes WHERE last_name = 'Астахов' AND first_name = 'Евгений' AND middle_name = 'Михайлович' AND birth_year = 2002 LIMIT 1), 1, 73, NULL, 76.8, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Астахов Евгений Михайлович', 'ГБУ ДО МКСШОР "Запад" отделение "Семёрка"', 'г. Москва', 8001, 5),
  (8057, 8012, (SELECT id FROM athletes WHERE last_name = 'Лебеденко' AND first_name = 'Андрей' AND middle_name = 'Евгеньевич' AND birth_year = 2008 LIMIT 1), 2, 55, NULL, 77.95, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Лебеденко Андрей Евгеньевич', 'МБУ ДО СШ "ОСКОЛ"', 'Белгородская область', 8001, 5),
  (8058, 8012, (SELECT id FROM athletes WHERE last_name = 'Савинов' AND first_name = 'Андрей' AND middle_name = 'Вячеславович' AND birth_year = 1984 LIMIT 1), 3, 50, NULL, 77.0, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Савинов Андрей Вячеславович', 'Владимирская область', 'Владимирская область', 8001, 5),
  (8059, 8012, (SELECT id FROM athletes WHERE last_name = 'Гордеев' AND first_name = 'Михаил' AND middle_name = 'Сергеевич' AND birth_year = 1998 LIMIT 1), 4, 50, NULL, 77.9, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Гордеев Михаил Сергеевич', 'РО ООО "ВФГС" в Московской области', 'Московская область', 8001, 5),
  (8060, 8012, (SELECT id FROM athletes WHERE last_name = 'Абдразаков' AND first_name = 'Рафик' AND middle_name = 'Шавкатович' AND birth_year = 2002 LIMIT 1), 5, 46, NULL, 77.8, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Абдразаков Рафик Шавкатович', 'КСШ № 1', 'Смоленская область', 8001, 5),
  (8061, 8012, (SELECT id FROM athletes WHERE last_name = 'Володин' AND first_name = 'Денис' AND middle_name = 'Игоревич' AND birth_year = 1993 LIMIT 1), 6, 40, NULL, 76.75, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Володин Денис Игоревич', 'МУ ДО "СШ "Легион"', 'Московская область', 8001, 5),
  (8062, 8012, (SELECT id FROM athletes WHERE last_name = 'Тупиков' AND first_name = 'Александр' AND middle_name = 'Сергеевич' AND birth_year = 1991 LIMIT 1), 7, 40, NULL, 76.8, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Тупиков Александр Сергеевич', 'РОООО "ВФГС по ИО"', 'Ивановская область', 8001, 5),
  (8063, 8012, (SELECT id FROM athletes WHERE last_name = 'Луценко' AND first_name = 'Никита' AND middle_name = 'Ильич' AND birth_year = 2003 LIMIT 1), 8, 37, NULL, 77.35, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Луценко Никита Ильич', 'РО ООО "ВФГС" в г. Москве', 'г. Москва', 8001, 5),
  (8064, 8012, (SELECT id FROM athletes WHERE last_name = 'Курбаков' AND first_name = 'Данила' AND middle_name = 'Александрович' AND birth_year = 2009 LIMIT 1), 9, 23, NULL, 78.0, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Курбаков Данила Александрович', 'СШОР Маршал', 'Калужская область', 8001, 5),
  (8065, 8013, (SELECT id FROM athletes WHERE last_name = 'Андрущенко' AND first_name = 'Сергей' AND middle_name = 'Александрович' AND birth_year = 2005 LIMIT 1), 1, 80, NULL, 84.45, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Андрущенко Сергей Александрович', 'ГБУ ДО МКСШОР "Запад" Отделение "Семёрка"', 'г. Москва, Белгородская область', 8001, 6),
  (8066, 8013, (SELECT id FROM athletes WHERE last_name = 'Мухитов' AND first_name = 'Андрей' AND middle_name = 'Вячеславович' AND birth_year = 1999 LIMIT 1), 2, 65, NULL, 84.15, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Мухитов Андрей Вячеславович', 'СШОР по борьбе', 'Брянская область', 8001, 6),
  (8067, 8013, (SELECT id FROM athletes WHERE last_name = 'Кузьмин' AND first_name = 'Илья' AND middle_name = 'Алексеевич' AND birth_year = 2007 LIMIT 1), 3, 50, NULL, 84.35, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Кузьмин Илья Алексеевич', 'МБУДО КСШ1 , СГУС', 'Смоленская область', 8001, 6),
  (8068, 8013, (SELECT id FROM athletes WHERE last_name = 'Витков' AND first_name = 'Алексей' AND middle_name = 'Викторович' AND birth_year = 1990 LIMIT 1), 4, 45, NULL, 84.15, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Витков Алексей Викторович', 'РО ООО "ВФГС" в Московской области', 'Московская область', 8001, 6),
  (8069, 8013, (SELECT id FROM athletes WHERE last_name = 'Аманатиди' AND first_name = 'Михаил' AND middle_name = 'Константинович' AND birth_year = 2009 LIMIT 1), 5, 35, NULL, 83.05, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Аманатиди Михаил Константинович', 'МБУ ДО СШ "Юность"', 'Белгородская область', 8001, 6),
  (8070, 8014, (SELECT id FROM athletes WHERE last_name = 'Турищев' AND first_name = 'Дмитрий' AND middle_name = 'Владимирович' AND birth_year = 1992 LIMIT 1), 1, 78, NULL, 103.0, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Турищев Дмитрий Владимирович', 'ГБУ ДО МКСШОР "Запад" отделение "Семёрка"', 'г. Москва', 8001, 8),
  (8071, 8014, (SELECT id FROM athletes WHERE last_name = 'Калистратов' AND first_name = 'Артем' AND middle_name = 'Валерьевич' AND birth_year = 1992 LIMIT 1), 2, 74, NULL, 110.2, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Калистратов Артем Валерьевич', 'КСШ № 1', 'Смоленская область', 8001, 8),
  (8072, 8014, (SELECT id FROM athletes WHERE last_name = 'Слащев' AND first_name = 'Степан' AND middle_name = 'Сергеевич' AND birth_year = 2008 LIMIT 1), 3, 57, NULL, 105.95, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Слащев Степан Сергеевич', 'МУ ДО "СШ "Легион"', 'Московская область', 8001, 8),
  (8073, 8014, (SELECT id FROM athletes WHERE last_name = 'Фартучный' AND first_name = 'Иван' AND middle_name = 'Сергеевич' AND birth_year = 2007 LIMIT 1), 4, 50, NULL, 122.05, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Фартучный Иван Сергеевич', 'МБУ ДО СШ "ОСКОЛ"', 'Белгородская область', 8001, 8),
  (8074, 8014, (SELECT id FROM athletes WHERE last_name = 'Станкович' AND first_name = 'Боян' AND middle_name IS NULL AND birth_year = 1988 LIMIT 1), 5, 45, NULL, 103.65, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Станкович Боян', 'ЯРОО ФГС', 'Ярославская область', 8001, 8),
  (8075, 8014, (SELECT id FROM athletes WHERE last_name = 'Дворцов' AND first_name = 'Владимир' AND middle_name = 'Владимирович' AND birth_year = 1986 LIMIT 1), 6, 40, NULL, 108.95, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Дворцов Владимир Владимирович', 'СШОР по борьбе', 'Брянская область', 8001, 8),
  (8076, 8014, (SELECT id FROM athletes WHERE last_name = 'Митрофанов' AND first_name = 'Тимофей' AND middle_name = 'Андреевич' AND birth_year = 2009 LIMIT 1), 7, 16, NULL, 118.5, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Митрофанов Тимофей Андреевич', 'МАУ ДО СШОР "Метеор"', 'Ярославская область', 8001, 8),
  (8077, 8015, (SELECT id FROM athletes WHERE last_name = 'Кулаков' AND first_name = 'Иван' AND middle_name = 'Иванович' AND birth_year = 1998 LIMIT 1), 1, 90, NULL, 94.95, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Кулаков Иван Иванович', 'СШОР «Маршал»', 'Калужская область', 8001, 7),
  (8078, 8015, (SELECT id FROM athletes WHERE last_name = 'Кирюхин' AND first_name = 'Роман' AND middle_name = 'Александрович' AND birth_year = 1997 LIMIT 1), 2, 75, NULL, 88.0, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Кирюхин Роман Александрович', 'ФГС КО', 'Калужская область', 8001, 7),
  (8079, 8015, (SELECT id FROM athletes WHERE last_name = 'Кулик' AND first_name = 'Никита' AND middle_name = 'Алексеевич' AND birth_year = 2005 LIMIT 1), 3, 62, NULL, 92.25, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Кулик Никита Алексеевич', 'ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»', 'г. Москва', 8001, 7),
  (8080, 8015, (SELECT id FROM athletes WHERE last_name = 'Булгаков' AND first_name = 'Денис' AND middle_name = 'Витальевич' AND birth_year = 1984 LIMIT 1), 4, 45, NULL, 86.4, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Булгаков Денис Витальевич', 'РО ООО "ВФГС" в Московской области', 'Московская область', 8001, 7),
  (8081, 8015, (SELECT id FROM athletes WHERE last_name = 'Захаров' AND first_name = 'Станислав' AND middle_name = 'Олегович' AND birth_year = 1991 LIMIT 1), 5, 43, NULL, 86.0, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Захаров Станислав Олегович', 'РО ООО ВФГС в г. Москве', 'г. Москва', 8001, 7),
  (8082, 8015, (SELECT id FROM athletes WHERE last_name = 'Муссалиев' AND first_name = 'Муса' AND middle_name = 'Габиб Оглы' AND birth_year = 2007 LIMIT 1), 6, 37, NULL, 85.6, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Муссалиев Муса Габиб Оглы', 'СШОР по борьбе', 'Брянская область', 8001, 7),
  (8083, 8015, (SELECT id FROM athletes WHERE last_name = 'Мамедсаатов' AND first_name = 'Егор' AND middle_name = 'Русланович' AND birth_year = 2008 LIMIT 1), 7, 31, NULL, 91.5, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 8001, '2026-04-13', 'Мамедсаатов Егор Русланович', 'МБУ ДО СШ "Юность"', 'Белгородская область', 8001, 7);

INSERT INTO result_reps (id, result_id, exercise, hand, reps) VALUES
  (8001, 8001, 'jerk', 'both', 95),
  (8002, 8002, 'jerk', 'both', 62),
  (8003, 8003, 'jerk', 'both', 50),
  (8004, 8004, 'jerk', 'both', 16),
  (8005, 8005, 'jerk', 'both', 115),
  (8006, 8006, 'jerk', 'both', 102),
  (8007, 8007, 'jerk', 'both', 94),
  (8008, 8008, 'jerk', 'both', 73),
  (8009, 8009, 'jerk', 'both', 72),
  (8010, 8010, 'jerk', 'both', 45),
  (8011, 8011, 'jerk', 'both', 115),
  (8012, 8012, 'jerk', 'both', 108),
  (8013, 8013, 'jerk', 'both', 99),
  (8014, 8014, 'jerk', 'both', 86),
  (8015, 8015, 'jerk', 'both', 80),
  (8016, 8016, 'jerk', 'both', 57),
  (8017, 8017, 'jerk', 'both', 140),
  (8018, 8018, 'jerk', 'both', 105),
  (8019, 8019, 'jerk', 'both', 88),
  (8020, 8020, 'jerk', 'both', 80),
  (8021, 8021, 'jerk', 'both', 79),
  (8022, 8022, 'jerk', 'both', 78),
  (8023, 8023, 'jerk', 'both', 69),
  (8024, 8024, 'jerk', 'both', 41),
  (8025, 8025, 'jerk', 'both', 36),
  (8026, 8026, 'long_cycle', 'both', 50),
  (8027, 8027, 'long_cycle', 'both', 29),
  (8028, 8028, 'long_cycle', 'both', 26),
  (8029, 8029, 'long_cycle', 'both', 26),
  (8030, 8030, 'long_cycle', 'both', 72),
  (8031, 8031, 'long_cycle', 'both', 46),
  (8032, 8032, 'long_cycle', 'both', 45),
  (8033, 8033, 'long_cycle', 'both', 75),
  (8034, 8034, 'long_cycle', 'both', 36),
  (8035, 8035, 'long_cycle', 'both', 35),
  (8036, 8036, 'long_cycle', 'both', 25),
  (8037, 8037, 'long_cycle', 'both', 70),
  (8038, 8038, 'long_cycle', 'both', 20),
  (8039, 8039, 'long_cycle', 'both', 44),
  (8040, 8040, 'long_cycle', 'both', 43),
  (8041, 8041, 'long_cycle', 'both', 40),
  (8042, 8042, 'long_cycle', 'both', 39),
  (8043, 8043, 'long_cycle', 'both', 64),
  (8044, 8044, 'long_cycle', 'both', 63),
  (8045, 8045, 'long_cycle', 'both', 46),
  (8046, 8046, 'long_cycle', 'both', 16),
  (8047, 8047, 'long_cycle', 'both', 73),
  (8048, 8048, 'long_cycle', 'both', 71),
  (8049, 8049, 'long_cycle', 'both', 62),
  (8050, 8050, 'long_cycle', 'both', 58),
  (8051, 8051, 'long_cycle', 'both', 57),
  (8052, 8052, 'long_cycle', 'both', 46),
  (8053, 8053, 'long_cycle', 'both', 31),
  (8054, 8054, 'long_cycle', 'both', 26),
  (8055, 8055, 'long_cycle', 'both', 24),
  (8056, 8056, 'long_cycle', 'both', 73),
  (8057, 8057, 'long_cycle', 'both', 55),
  (8058, 8058, 'long_cycle', 'both', 50),
  (8059, 8059, 'long_cycle', 'both', 50),
  (8060, 8060, 'long_cycle', 'both', 46),
  (8061, 8061, 'long_cycle', 'both', 40),
  (8062, 8062, 'long_cycle', 'both', 40),
  (8063, 8063, 'long_cycle', 'both', 37),
  (8064, 8064, 'long_cycle', 'both', 23),
  (8065, 8065, 'long_cycle', 'both', 80),
  (8066, 8066, 'long_cycle', 'both', 65),
  (8067, 8067, 'long_cycle', 'both', 50),
  (8068, 8068, 'long_cycle', 'both', 45),
  (8069, 8069, 'long_cycle', 'both', 35),
  (8070, 8070, 'long_cycle', 'both', 78),
  (8071, 8071, 'long_cycle', 'both', 74),
  (8072, 8072, 'long_cycle', 'both', 57),
  (8073, 8073, 'long_cycle', 'both', 50),
  (8074, 8074, 'long_cycle', 'both', 45),
  (8075, 8075, 'long_cycle', 'both', 40),
  (8076, 8076, 'long_cycle', 'both', 16),
  (8077, 8077, 'long_cycle', 'both', 90),
  (8078, 8078, 'long_cycle', 'both', 75),
  (8079, 8079, 'long_cycle', 'both', 62),
  (8080, 8080, 'long_cycle', 'both', 45),
  (8081, 8081, 'long_cycle', 'both', 43),
  (8082, 8082, 'long_cycle', 'both', 37),
  (8083, 8083, 'long_cycle', 'both', 31);

