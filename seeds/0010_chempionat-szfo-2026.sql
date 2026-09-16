-- Чемпионат Северо-Западного федерального округа 2026, Санкт-Петербург, 2026-04-09—2026-04-13.
-- Сгенерировано scripts/gen_seed.py из data/chempionat-szfo-2026.json, не править руками.
-- Источник — скан официальных протоколов чемпионата Северо-Западного федерального округа 2026 (PDF без текстового слоя). ФИО с отчеством, дата рождения полная. Импорт ведётся по одной индивидуальной категории отдельным коммитом и деплоем. Эстафеты длинного цикла (стр. 11–12), командный зачёт (стр. 35) и список судей (стр. 36) не импортируются. Жонглирование (стр. 23) не поддержано текущей схемой. Командные очки сохраняются в JSON как напечатано, но в базу не попадают.
-- Данные извлечены из протокола моделью; сверка человеком не проводилась,
-- поэтому results.verified_by остаётся пустым (FR-A14).

INSERT OR IGNORE INTO regions (name, country) VALUES
  ('г. Санкт-Петербург', 'RU'),
  ('Псковская область', 'RU'),
  ('Архангельская область', 'RU'),
  ('Вологодская область', 'RU'),
  ('Мурманская область', 'RU'),
  ('Новгородская область', 'RU'),
  ('Калининградская область', 'RU'),
  ('Ленинградская область', 'RU');

INSERT OR IGNORE INTO clubs (name, region_id) VALUES
  ('СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')),
  ('РОО ФГС Псковской области', (SELECT id FROM regions WHERE name = 'Псковская область' AND country = 'RU')),
  ('САФУ Арктика', (SELECT id FROM regions WHERE name = 'Архангельская область' AND country = 'RU')),
  ('СШОР №3', (SELECT id FROM regions WHERE name = 'Вологодская область' AND country = 'RU')),
  ('ВС РФ', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')),
  ('-', (SELECT id FROM regions WHERE name = 'Мурманская область' AND country = 'RU')),
  ('-', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')),
  ('РОООО ВФГС в Новгородской области', (SELECT id FROM regions WHERE name = 'Новгородская область' AND country = 'RU')),
  ('РО ООО ВФГС в Архангельской области', (SELECT id FROM regions WHERE name = 'Архангельская область' AND country = 'RU')),
  ('МАУ ДО СШОР', (SELECT id FROM regions WHERE name = 'Калининградская область' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')),
  ('МО РФ', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')),
  ('-', (SELECT id FROM regions WHERE name = 'Ленинградская область' AND country = 'RU')),
  ('МО РФ', (SELECT id FROM regions WHERE name = 'Мурманская область' AND country = 'RU')),
  ('СК «Дзержинец»', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Ленинградская область' AND country = 'RU')),
  ('Спорт-ЛАЭС', (SELECT id FROM regions WHERE name = 'Ленинградская область' AND country = 'RU'));

INSERT OR IGNORE INTO federations (name, short_name, country) VALUES
  ('Всероссийская федерация гиревого спорта', 'ВФГС', 'RU');

INSERT INTO competitions (id, slug, name, date_start, date_end, city, country, competition_rank_id, federation_id, source_url, is_published) VALUES
  (7001, 'chempionat-szfo-2026', 'Чемпионат Северо-Западного федерального округа 2026', '2026-04-09', '2026-04-13', 'Санкт-Петербург', 'RU', (SELECT id FROM competition_ranks WHERE code = 'federal_district'), (SELECT id FROM federations WHERE name = 'Всероссийская федерация гиревого спорта'), NULL, 1);

INSERT INTO protocols (id, competition_id, r2_key, filename, page_count, is_scan, status, published_at) VALUES
  (7001, 7001, 'protocols/chempionat-szfo-2026.pdf', 'protokol-chempionata-szfo.pdf', 36, 1, 'published', '2026-04-09');

INSERT INTO categories (id, competition_id, discipline_id, sex, age_group_id, division_id, bell_kg, hands, time_limit_min, weight_class_raw, weight_class_kg, weight_class_is_open, participants_declared, is_deferred, sort_order) VALUES
  (7001, 7001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '63', 63, 0, 1, 0, 1),
  (7002, 7001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '68+', 68, 1, 1, 0, 2),
  (7003, 7001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '68', 68, 0, 3, 0, 3),
  (7004, 7001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '63', 63, 0, 2, 0, 4),
  (7005, 7001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '68', 68, 0, 2, 0, 5),
  (7006, 7001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '73', 73, 0, 3, 0, 6),
  (7007, 7001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '78', 78, 0, 4, 0, 7),
  (7008, 7001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '85', 85, 0, 3, 0, 8),
  (7009, 7001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '95+', 95, 1, 5, 0, 9),
  (7010, 7001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '95', 95, 0, 5, 0, 10),
  (7011, 7001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '63', 63, 0, 4, 0, 11),
  (7012, 7001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '68', 68, 0, 4, 0, 12),
  (7013, 7001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '73', 73, 0, 6, 0, 13),
  (7014, 7001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '78', 78, 0, 4, 0, 14),
  (7015, 7001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '85', 85, 0, 6, 0, 15),
  (7016, 7001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '95+', 95, 1, 7, 0, 16),
  (7017, 7001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '95', 95, 0, 6, 0, 17),
  (7018, 7001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '68+', 68, 1, 1, 0, 18),
  (7019, 7001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '68', 68, 0, 3, 0, 19),
  (7020, 7001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '63', 63, 0, 3, 0, 20),
  (7021, 7001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '68', 68, 0, 6, 0, 21),
  (7022, 7001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '73', 73, 0, 3, 0, 22),
  (7023, 7001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '78', 78, 0, 9, 0, 23),
  (7024, 7001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '85', 85, 0, 6, 0, 24);

INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Тарвердиева', 'Мария', 'Алексеевна', 1986, 'f', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Семенов А.Н.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Тарвердиева' AND a.first_name = 'Мария' AND a.middle_name = 'Алексеевна' AND a.birth_year = 1986 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Черницкая', 'Анастасия', 'Андреевна', 2000, 'f', (SELECT id FROM regions WHERE name = 'Псковская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РОО ФГС Псковской области' AND region_id = (SELECT id FROM regions WHERE name = 'Псковская область' AND country = 'RU')), 'Олехнович О.Ю.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Черницкая' AND a.first_name = 'Анастасия' AND a.middle_name = 'Андреевна' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Герман', 'Алена', 'Сергеевна', 1997, 'f', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Семенов А.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Герман' AND a.first_name = 'Алена' AND a.middle_name = 'Сергеевна' AND a.birth_year = 1997 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Забелинская', 'Дарья', 'Александровна', 2003, 'f', (SELECT id FROM regions WHERE name = 'Архангельская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'САФУ Арктика' AND region_id = (SELECT id FROM regions WHERE name = 'Архангельская область' AND country = 'RU')), 'Коршун А.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Забелинская' AND a.first_name = 'Дарья' AND a.middle_name = 'Александровна' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кудрявцева', 'Алина', 'Витальевна', 2000, 'f', (SELECT id FROM regions WHERE name = 'Псковская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РОО ФГС Псковской области' AND region_id = (SELECT id FROM regions WHERE name = 'Псковская область' AND country = 'RU')), 'Олехнович О.Ю.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кудрявцева' AND a.first_name = 'Алина' AND a.middle_name = 'Витальевна' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бенидзе', 'Джони', 'Бадриевич', 1990, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Кириллов С.А.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бенидзе' AND a.first_name = 'Джони' AND a.middle_name = 'Бадриевич' AND a.birth_year = 1990 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Мартынов', 'Даниил', 'Юрьевич', 2008, 'm', (SELECT id FROM regions WHERE name = 'Вологодская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР №3' AND region_id = (SELECT id FROM regions WHERE name = 'Вологодская область' AND country = 'RU')), 'Огарков А.Н.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Мартынов' AND a.first_name = 'Даниил' AND a.middle_name = 'Юрьевич' AND a.birth_year = 2008 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Щербин', 'Олег', 'Владимирович', 1989, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Никифоров А.В.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Щербин' AND a.first_name = 'Олег' AND a.middle_name = 'Владимирович' AND a.birth_year = 1989 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Фарзалиев', 'Мурад', 'Нажмудалович', 2007, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС РФ' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Катаев И.В., Бирюков С.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Фарзалиев' AND a.first_name = 'Мурад' AND a.middle_name = 'Нажмудалович' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Смирнов', 'Даниил', 'Алексеевич', 2003, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Бенидзе А.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Смирнов' AND a.first_name = 'Даниил' AND a.middle_name = 'Алексеевич' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Салихов', 'Денис', 'Владимирович', 2005, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС РФ' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Катаев И.В.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Салихов' AND a.first_name = 'Денис' AND a.middle_name = 'Владимирович' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Карпов', 'Владислав', 'Алексеевич', 1999, 'm', (SELECT id FROM regions WHERE name = 'Мурманская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'Мурманская область' AND country = 'RU')), 'Трофимов М.А., Бенидзе Д.Б.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Карпов' AND a.first_name = 'Владислав' AND a.middle_name = 'Алексеевич' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бессонов', 'Максим', 'Вячеславович', 2004, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Барков А.П.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бессонов' AND a.first_name = 'Максим' AND a.middle_name = 'Вячеславович' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ольшко', 'Иван', 'Вячеславович', 2007, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Пронин Е.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ольшко' AND a.first_name = 'Иван' AND a.middle_name = 'Вячеславович' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Дьяков', 'Илья', 'Сергеевич', 2005, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Барков А.П.', (SELECT id FROM sport_ranks WHERE code = 'ii')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Дьяков' AND a.first_name = 'Илья' AND a.middle_name = 'Сергеевич' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Лавров', 'Марк', 'Кириллович', 2011, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Глязинтинов Д.А.', (SELECT id FROM sport_ranks WHERE code = 'ii')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Лавров' AND a.first_name = 'Марк' AND a.middle_name = 'Кириллович' AND a.birth_year = 2011 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Косухин', 'Владислав', 'Владимирович', 2004, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Дубровин Д.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Косухин' AND a.first_name = 'Владислав' AND a.middle_name = 'Владимирович' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Микшин', 'Сергей', 'Владимирович', 2000, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Бенидзе А.А., Бенидзе Д.Б., Сотников Е.С.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Микшин' AND a.first_name = 'Сергей' AND a.middle_name = 'Владимирович' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Акиньшин', 'Владислав', 'Андреевич', 2002, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС РФ' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Дубровин Д.А.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Акиньшин' AND a.first_name = 'Владислав' AND a.middle_name = 'Андреевич' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Марков', 'Иван', 'Эдуардович', 1995, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Семенов А.Н.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Марков' AND a.first_name = 'Иван' AND a.middle_name = 'Эдуардович' AND a.birth_year = 1995 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Лебедев', 'Дмитрий', 'Николаевич', 2008, 'm', (SELECT id FROM regions WHERE name = 'Вологодская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР №3' AND region_id = (SELECT id FROM regions WHERE name = 'Вологодская область' AND country = 'RU')), 'Шемякин О.Л.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Лебедев' AND a.first_name = 'Дмитрий' AND a.middle_name = 'Николаевич' AND a.birth_year = 2008 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Петров', 'Никита', 'Петрович', 2009, 'm', (SELECT id FROM regions WHERE name = 'Новгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РОООО ВФГС в Новгородской области' AND region_id = (SELECT id FROM regions WHERE name = 'Новгородская область' AND country = 'RU')), 'Трофимов С.Н.', (SELECT id FROM sport_ranks WHERE code = 'ii')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Петров' AND a.first_name = 'Никита' AND a.middle_name = 'Петрович' AND a.birth_year = 2009 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Винокуров', 'Максим', 'Константинович', 1995, 'm', (SELECT id FROM regions WHERE name = 'Псковская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РОО ФГС Псковской области' AND region_id = (SELECT id FROM regions WHERE name = 'Псковская область' AND country = 'RU')), 'Олехнович О.Ю.', (SELECT id FROM sport_ranks WHERE code = 'ii')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Винокуров' AND a.first_name = 'Максим' AND a.middle_name = 'Константинович' AND a.birth_year = 1995 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Мышкарев', 'Сергей', 'Юрьевич', 1976, 'm', (SELECT id FROM regions WHERE name = 'Новгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РОООО ВФГС в Новгородской области' AND region_id = (SELECT id FROM regions WHERE name = 'Новгородская область' AND country = 'RU')), 'Трофимов С.Н.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Мышкарев' AND a.first_name = 'Сергей' AND a.middle_name = 'Юрьевич' AND a.birth_year = 1976 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Поздеев', 'Андрей', 'Николаевич', 1990, 'm', (SELECT id FROM regions WHERE name = 'Архангельская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО ВФГС в Архангельской области' AND region_id = (SELECT id FROM regions WHERE name = 'Архангельская область' AND country = 'RU')), 'Хвостов А.В., Сахаров Н.Л.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Поздеев' AND a.first_name = 'Андрей' AND a.middle_name = 'Николаевич' AND a.birth_year = 1990 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кравченко', 'Сергей', 'Сергеевич', 1982, 'm', (SELECT id FROM regions WHERE name = 'Калининградская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШОР' AND region_id = (SELECT id FROM regions WHERE name = 'Калининградская область' AND country = 'RU')), 'Самостоятельно', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кравченко' AND a.first_name = 'Сергей' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1982 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Олехнович', 'Олег', 'Юрьевич', 1991, 'm', (SELECT id FROM regions WHERE name = 'Псковская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РОО ФГС Псковской области' AND region_id = (SELECT id FROM regions WHERE name = 'Псковская область' AND country = 'RU')), 'Самостоятельно', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Олехнович' AND a.first_name = 'Олег' AND a.middle_name = 'Юрьевич' AND a.birth_year = 1991 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Жоров', 'Егор', 'Иванович', 2003, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Пронин Е.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Жоров' AND a.first_name = 'Егор' AND a.middle_name = 'Иванович' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Чегорев', 'Александр', 'Сергеевич', 1983, 'm', (SELECT id FROM regions WHERE name = 'Новгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РОООО ВФГС в Новгородской области' AND region_id = (SELECT id FROM regions WHERE name = 'Новгородская область' AND country = 'RU')), 'самостоятельно', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Чегорев' AND a.first_name = 'Александр' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1983 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Руднев', 'Руслан', 'Сергеевич', 1994, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Руднев С.Л.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Руднев' AND a.first_name = 'Руслан' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1994 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Иванов', 'Кирилл', 'Михайлович', 2009, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Резонов А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Иванов' AND a.first_name = 'Кирилл' AND a.middle_name = 'Михайлович' AND a.birth_year = 2009 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Жбанов', 'Алексей', 'Александрович', 1986, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Барков А.П.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Жбанов' AND a.first_name = 'Алексей' AND a.middle_name = 'Александрович' AND a.birth_year = 1986 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Лазуков', 'Андрей', 'Михайлович', 2004, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Пронин Е.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Лазуков' AND a.first_name = 'Андрей' AND a.middle_name = 'Михайлович' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Рыжков', 'Антон', 'Николаевич', 1994, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МО РФ' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Кириллов С.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Рыжков' AND a.first_name = 'Антон' AND a.middle_name = 'Николаевич' AND a.birth_year = 1994 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Пикуль', 'Денис', 'Юрьевич', 2003, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Литвинко В.С., Бенидзе Д.Б., Сотников Е.С.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Пикуль' AND a.first_name = 'Денис' AND a.middle_name = 'Юрьевич' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Жумадилов', 'Аслан', 'Жасланович', 2004, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Пронин Е.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Жумадилов' AND a.first_name = 'Аслан' AND a.middle_name = 'Жасланович' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бучин', 'Алексей', 'Валериевич', 1988, 'm', (SELECT id FROM regions WHERE name = 'Псковская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РОО ФГС Псковской области' AND region_id = (SELECT id FROM regions WHERE name = 'Псковская область' AND country = 'RU')), 'Лапшин Н.С.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бучин' AND a.first_name = 'Алексей' AND a.middle_name = 'Валериевич' AND a.birth_year = 1988 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Гусев', 'Владимир', 'Владимирович', 2004, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Бенидзе А.А., Бенидзе Д.Б., Сотников Е.С.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Гусев' AND a.first_name = 'Владимир' AND a.middle_name = 'Владимирович' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Беба', 'Юрий', 'Николаевич', 2004, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС РФ' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Катаев И.В.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Беба' AND a.first_name = 'Юрий' AND a.middle_name = 'Николаевич' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Петров', 'Павел', 'Александрович', 2007, 'm', (SELECT id FROM regions WHERE name = 'Вологодская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР №3' AND region_id = (SELECT id FROM regions WHERE name = 'Вологодская область' AND country = 'RU')), 'Шемякин О.Л.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Петров' AND a.first_name = 'Павел' AND a.middle_name = 'Александрович' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Молчанов', 'Дианисий', 'Николаевич', 2005, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Катаев И.В., Бирюков С.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Молчанов' AND a.first_name = 'Дианисий' AND a.middle_name = 'Николаевич' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Смоленцев', 'Игорь', 'Валентинович', 2003, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МО РФ' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Бенидзе Д.Б., Сотников Е.С.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Смоленцев' AND a.first_name = 'Игорь' AND a.middle_name = 'Валентинович' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бабич', 'Гордей', 'Сергеевич', 2009, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Глязинтинов Д.А.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бабич' AND a.first_name = 'Гордей' AND a.middle_name = 'Сергеевич' AND a.birth_year = 2009 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кобяков', 'Григорий', 'Кириллович', 2004, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Никифоров А.В., Бенидзе Д.Б.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кобяков' AND a.first_name = 'Григорий' AND a.middle_name = 'Кириллович' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Чуев', 'Павел', 'Владимирович', 1997, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Кириллов С.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Чуев' AND a.first_name = 'Павел' AND a.middle_name = 'Владимирович' AND a.birth_year = 1997 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Сарлаев', 'Андрей', 'Дмитриевич', 2003, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Катаев И.В., Козленко В.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Сарлаев' AND a.first_name = 'Андрей' AND a.middle_name = 'Дмитриевич' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Хомяков', 'Илья', 'Алексеевич', 2002, 'm', (SELECT id FROM regions WHERE name = 'Архангельская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО ВФГС в Архангельской области' AND region_id = (SELECT id FROM regions WHERE name = 'Архангельская область' AND country = 'RU')), 'Редькин В.В.', (SELECT id FROM sport_ranks WHERE code = 'ii')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Хомяков' AND a.first_name = 'Илья' AND a.middle_name = 'Алексеевич' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Сошников', 'Никита', 'Олегович', 1986, 'm', (SELECT id FROM regions WHERE name = 'Ленинградская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'Ленинградская область' AND country = 'RU')), 'Рачинский С.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Сошников' AND a.first_name = 'Никита' AND a.middle_name = 'Олегович' AND a.birth_year = 1986 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Мельников', 'Максим', 'Михайлович', 1991, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Лазарева А.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Мельников' AND a.first_name = 'Максим' AND a.middle_name = 'Михайлович' AND a.birth_year = 1991 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Конобрий', 'Максим', 'Леонидович', 1986, 'm', (SELECT id FROM regions WHERE name = 'Ленинградская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'Ленинградская область' AND country = 'RU')), 'Рачинский С.А.', (SELECT id FROM sport_ranks WHERE code = 'ii')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Конобрий' AND a.first_name = 'Максим' AND a.middle_name = 'Леонидович' AND a.birth_year = 1986 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Шведов', 'Павел', 'Вячеславович', 2007, 'm', (SELECT id FROM regions WHERE name = 'Калининградская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШОР' AND region_id = (SELECT id FROM regions WHERE name = 'Калининградская область' AND country = 'RU')), 'Бабушкин М.Б.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Шведов' AND a.first_name = 'Павел' AND a.middle_name = 'Вячеславович' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Межнецов', 'Данила', 'Алексеевич', 1993, 'm', (SELECT id FROM regions WHERE name = 'Ленинградская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'Ленинградская область' AND country = 'RU')), 'Огарев В.Я., Соболев Н.В.', (SELECT id FROM sport_ranks WHERE code = 'ii')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Межнецов' AND a.first_name = 'Данила' AND a.middle_name = 'Алексеевич' AND a.birth_year = 1993 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Анисимов', 'Алексей', 'Павлович', 2004, 'm', (SELECT id FROM regions WHERE name = 'Вологодская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР №3' AND region_id = (SELECT id FROM regions WHERE name = 'Вологодская область' AND country = 'RU')), 'Шемякин О.Л.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Анисимов' AND a.first_name = 'Алексей' AND a.middle_name = 'Павлович' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Микряков', 'Михаил', 'Геннадьевич', 2007, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Катаев И.В., Федосеев А.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Микряков' AND a.first_name = 'Михаил' AND a.middle_name = 'Геннадьевич' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бежанов', 'Василий', 'Витальевич', 1999, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Катаев И.В., Балабанов С.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бежанов' AND a.first_name = 'Василий' AND a.middle_name = 'Витальевич' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Мельник', 'Евгений', 'Андреевич', 2003, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Петров В.М., Дубровин Д.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Мельник' AND a.first_name = 'Евгений' AND a.middle_name = 'Андреевич' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Мазанко', 'Григорий', 'Сергеевич', 2008, 'm', (SELECT id FROM regions WHERE name = 'Вологодская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР №3' AND region_id = (SELECT id FROM regions WHERE name = 'Вологодская область' AND country = 'RU')), 'Шемякин О.Л.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Мазанко' AND a.first_name = 'Григорий' AND a.middle_name = 'Сергеевич' AND a.birth_year = 2008 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Вихарев', 'Артем', 'Сергеевич', 2006, 'm', (SELECT id FROM regions WHERE name = 'Вологодская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР №3' AND region_id = (SELECT id FROM regions WHERE name = 'Вологодская область' AND country = 'RU')), 'Шемякин О.Л.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Вихарев' AND a.first_name = 'Артем' AND a.middle_name = 'Сергеевич' AND a.birth_year = 2006 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Коршунов', 'Алексей', 'Андреевич', 2008, 'm', (SELECT id FROM regions WHERE name = 'Вологодская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР №3' AND region_id = (SELECT id FROM regions WHERE name = 'Вологодская область' AND country = 'RU')), 'Шемякин О.Л.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Коршунов' AND a.first_name = 'Алексей' AND a.middle_name = 'Андреевич' AND a.birth_year = 2008 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кабачий', 'Владислав', 'Юрьевич', 2006, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Резонов А.В.', (SELECT id FROM sport_ranks WHERE code = 'ii')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кабачий' AND a.first_name = 'Владислав' AND a.middle_name = 'Юрьевич' AND a.birth_year = 2006 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Смагулов', 'Нурсултан', 'Шайзандинович', 1999, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Катаев И.В., Смагулов Ш.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Смагулов' AND a.first_name = 'Нурсултан' AND a.middle_name = 'Шайзандинович' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бенидзе', 'Спартак', 'Бадриевич', 2002, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Бенидзе А.А., Огарев В.Я., Вильган А.П.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бенидзе' AND a.first_name = 'Спартак' AND a.middle_name = 'Бадриевич' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Никифоров', 'Сергей', 'Валерьевич', 1981, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС РФ' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Дубровин Д.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Никифоров' AND a.first_name = 'Сергей' AND a.middle_name = 'Валерьевич' AND a.birth_year = 1981 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Юров', 'Евгений', 'Владимирович', 1995, 'm', (SELECT id FROM regions WHERE name = 'Новгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РОООО ВФГС в Новгородской области' AND region_id = (SELECT id FROM regions WHERE name = 'Новгородская область' AND country = 'RU')), 'Трофимов С.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Юров' AND a.first_name = 'Евгений' AND a.middle_name = 'Владимирович' AND a.birth_year = 1995 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Горячев', 'Сергей', 'Сергеевич', 1988, 'm', (SELECT id FROM regions WHERE name = 'Псковская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РОО ФГС Псковской области' AND region_id = (SELECT id FROM regions WHERE name = 'Псковская область' AND country = 'RU')), 'Лапшин Н.С.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Горячев' AND a.first_name = 'Сергей' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1988 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Мельников', 'Егор', 'Тимурович', 2004, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Бенидзе Д.Б., Сотников Е.С.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Мельников' AND a.first_name = 'Егор' AND a.middle_name = 'Тимурович' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Григорьев', 'Никита', 'Юрьевич', 1994, 'm', (SELECT id FROM regions WHERE name = 'Псковская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РОО ФГС Псковской области' AND region_id = (SELECT id FROM regions WHERE name = 'Псковская область' AND country = 'RU')), 'самостоятельно', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Григорьев' AND a.first_name = 'Никита' AND a.middle_name = 'Юрьевич' AND a.birth_year = 1994 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кухаренко', 'Илья', 'Олегович', 2003, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Литвинко В.С., Бенидзе Д.Б., Сотников Е.С.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кухаренко' AND a.first_name = 'Илья' AND a.middle_name = 'Олегович' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Нифанин', 'Евгений', 'Сергеевич', 1994, 'm', (SELECT id FROM regions WHERE name = 'Архангельская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО ВФГС в Архангельской области' AND region_id = (SELECT id FROM regions WHERE name = 'Архангельская область' AND country = 'RU')), 'самостоятельно', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Нифанин' AND a.first_name = 'Евгений' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1994 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бабенко', 'Федор', 'Федорович', 1990, 'm', (SELECT id FROM regions WHERE name = 'Калининградская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШОР' AND region_id = (SELECT id FROM regions WHERE name = 'Калининградская область' AND country = 'RU')), 'Самостоятельно', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бабенко' AND a.first_name = 'Федор' AND a.middle_name = 'Федорович' AND a.birth_year = 1990 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Яваев', 'Максим', 'Айниорович', 2002, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СК «Дзержинец»' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Чуев П.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Яваев' AND a.first_name = 'Максим' AND a.middle_name = 'Айниорович' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Коноков', 'Андрей', 'Сергеевич', 1987, 'm', (SELECT id FROM regions WHERE name = 'Псковская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РОО ФГС Псковской области' AND region_id = (SELECT id FROM regions WHERE name = 'Псковская область' AND country = 'RU')), 'Лапшин Н.С.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Коноков' AND a.first_name = 'Андрей' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1987 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Юдин', 'Валерий', 'Викторович', 1990, 'm', (SELECT id FROM regions WHERE name = 'Псковская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РОО ФГС Псковской области' AND region_id = (SELECT id FROM regions WHERE name = 'Псковская область' AND country = 'RU')), 'самостоятельно', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Юдин' AND a.first_name = 'Валерий' AND a.middle_name = 'Викторович' AND a.birth_year = 1990 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Подпружников', 'Алексей', 'Евгеньевич', 1980, 'm', (SELECT id FROM regions WHERE name = 'Ленинградская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Ленинградская область' AND country = 'RU')), 'Петров С.Б.', (SELECT id FROM sport_ranks WHERE code = 'ii')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Подпружников' AND a.first_name = 'Алексей' AND a.middle_name = 'Евгеньевич' AND a.birth_year = 1980 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Иванов', 'Александр', 'Юрьевич', 1986, 'm', (SELECT id FROM regions WHERE name = 'Ленинградская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Спорт-ЛАЭС' AND region_id = (SELECT id FROM regions WHERE name = 'Ленинградская область' AND country = 'RU')), 'Давыдов А.А.', (SELECT id FROM sport_ranks WHERE code = 'ii')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Иванов' AND a.first_name = 'Александр' AND a.middle_name = 'Юрьевич' AND a.birth_year = 1986 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Смирнов', 'Руслан', 'Сергеевич', 1994, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Катаев И.В., Карпов Ф.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Смирнов' AND a.first_name = 'Руслан' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1994 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Янголенко', 'Даниил', 'Витальевич', 2000, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Кириллов С.А., Бенидзе Д.Б.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Янголенко' AND a.first_name = 'Даниил' AND a.middle_name = 'Витальевич' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Малиновский', 'Семён', 'Андреевич', 1989, 'm', (SELECT id FROM regions WHERE name = 'Ленинградская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Ленинградская область' AND country = 'RU')), 'Виноградов М.Е.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Малиновский' AND a.first_name = 'Семён' AND a.middle_name = 'Андреевич' AND a.birth_year = 1989 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Волков', 'Илья', 'Алексеевич', 1992, 'm', (SELECT id FROM regions WHERE name = 'Ленинградская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Спорт-ЛАЭС' AND region_id = (SELECT id FROM regions WHERE name = 'Ленинградская область' AND country = 'RU')), 'Давыдов А.А.', (SELECT id FROM sport_ranks WHERE code = 'ii')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Волков' AND a.first_name = 'Илья' AND a.middle_name = 'Алексеевич' AND a.birth_year = 1992 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Никитин', 'Даниил', 'Алексеевич', 1981, 'm', (SELECT id FROM regions WHERE name = 'Псковская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РОО ФГС Псковской области' AND region_id = (SELECT id FROM regions WHERE name = 'Псковская область' AND country = 'RU')), 'Колодочский А.А.', (SELECT id FROM sport_ranks WHERE code = 'ii')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Никитин' AND a.first_name = 'Даниил' AND a.middle_name = 'Алексеевич' AND a.birth_year = 1981 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Прокофьев', 'Алексей', 'Михайлович', 1985, 'm', (SELECT id FROM regions WHERE name = 'Ленинградская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Спорт-ЛАЭС' AND region_id = (SELECT id FROM regions WHERE name = 'Ленинградская область' AND country = 'RU')), 'Давыдов А.А.', (SELECT id FROM sport_ranks WHERE code = 'ii')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Прокофьев' AND a.first_name = 'Алексей' AND a.middle_name = 'Михайлович' AND a.birth_year = 1985 LIMIT 1);

INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'tarverdieva-mariya-1986' AND s.athlete_id <> a.id)
              THEN 'tarverdieva-mariya-1986-' || a.id ELSE 'tarverdieva-mariya-1986' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Тарвердиева' AND first_name = 'Мария' AND middle_name = 'Алексеевна' AND birth_year = 1986 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'chernickaya-anastasiya-2000' AND s.athlete_id <> a.id)
              THEN 'chernickaya-anastasiya-2000-' || a.id ELSE 'chernickaya-anastasiya-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Черницкая' AND first_name = 'Анастасия' AND middle_name = 'Андреевна' AND birth_year = 2000 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'german-alena-1997' AND s.athlete_id <> a.id)
              THEN 'german-alena-1997-' || a.id ELSE 'german-alena-1997' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Герман' AND first_name = 'Алена' AND middle_name = 'Сергеевна' AND birth_year = 1997 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zabelinskaya-darya-2003' AND s.athlete_id <> a.id)
              THEN 'zabelinskaya-darya-2003-' || a.id ELSE 'zabelinskaya-darya-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Забелинская' AND first_name = 'Дарья' AND middle_name = 'Александровна' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kudryavceva-alina-2000' AND s.athlete_id <> a.id)
              THEN 'kudryavceva-alina-2000-' || a.id ELSE 'kudryavceva-alina-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кудрявцева' AND first_name = 'Алина' AND middle_name = 'Витальевна' AND birth_year = 2000 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'benidze-dzhoni-1990' AND s.athlete_id <> a.id)
              THEN 'benidze-dzhoni-1990-' || a.id ELSE 'benidze-dzhoni-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бенидзе' AND first_name = 'Джони' AND middle_name = 'Бадриевич' AND birth_year = 1990 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'martynov-daniil-2008' AND s.athlete_id <> a.id)
              THEN 'martynov-daniil-2008-' || a.id ELSE 'martynov-daniil-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Мартынов' AND first_name = 'Даниил' AND middle_name = 'Юрьевич' AND birth_year = 2008 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'scherbin-oleg-1989' AND s.athlete_id <> a.id)
              THEN 'scherbin-oleg-1989-' || a.id ELSE 'scherbin-oleg-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Щербин' AND first_name = 'Олег' AND middle_name = 'Владимирович' AND birth_year = 1989 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'farzaliev-murad-2007' AND s.athlete_id <> a.id)
              THEN 'farzaliev-murad-2007-' || a.id ELSE 'farzaliev-murad-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Фарзалиев' AND first_name = 'Мурад' AND middle_name = 'Нажмудалович' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'smirnov-daniil-2003' AND s.athlete_id <> a.id)
              THEN 'smirnov-daniil-2003-' || a.id ELSE 'smirnov-daniil-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Смирнов' AND first_name = 'Даниил' AND middle_name = 'Алексеевич' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'salihov-denis-2005' AND s.athlete_id <> a.id)
              THEN 'salihov-denis-2005-' || a.id ELSE 'salihov-denis-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Салихов' AND first_name = 'Денис' AND middle_name = 'Владимирович' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'karpov-vladislav-1999' AND s.athlete_id <> a.id)
              THEN 'karpov-vladislav-1999-' || a.id ELSE 'karpov-vladislav-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Карпов' AND first_name = 'Владислав' AND middle_name = 'Алексеевич' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'bessonov-maksim-2004' AND s.athlete_id <> a.id)
              THEN 'bessonov-maksim-2004-' || a.id ELSE 'bessonov-maksim-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бессонов' AND first_name = 'Максим' AND middle_name = 'Вячеславович' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'olshko-ivan-2007' AND s.athlete_id <> a.id)
              THEN 'olshko-ivan-2007-' || a.id ELSE 'olshko-ivan-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ольшко' AND first_name = 'Иван' AND middle_name = 'Вячеславович' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'dyakov-ilya-2005' AND s.athlete_id <> a.id)
              THEN 'dyakov-ilya-2005-' || a.id ELSE 'dyakov-ilya-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Дьяков' AND first_name = 'Илья' AND middle_name = 'Сергеевич' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lavrov-mark-2011' AND s.athlete_id <> a.id)
              THEN 'lavrov-mark-2011-' || a.id ELSE 'lavrov-mark-2011' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Лавров' AND first_name = 'Марк' AND middle_name = 'Кириллович' AND birth_year = 2011 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kosuhin-vladislav-2004' AND s.athlete_id <> a.id)
              THEN 'kosuhin-vladislav-2004-' || a.id ELSE 'kosuhin-vladislav-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Косухин' AND first_name = 'Владислав' AND middle_name = 'Владимирович' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'mikshin-sergey-2000' AND s.athlete_id <> a.id)
              THEN 'mikshin-sergey-2000-' || a.id ELSE 'mikshin-sergey-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Микшин' AND first_name = 'Сергей' AND middle_name = 'Владимирович' AND birth_year = 2000 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'akinshin-vladislav-2002' AND s.athlete_id <> a.id)
              THEN 'akinshin-vladislav-2002-' || a.id ELSE 'akinshin-vladislav-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Акиньшин' AND first_name = 'Владислав' AND middle_name = 'Андреевич' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'markov-ivan-1995' AND s.athlete_id <> a.id)
              THEN 'markov-ivan-1995-' || a.id ELSE 'markov-ivan-1995' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Марков' AND first_name = 'Иван' AND middle_name = 'Эдуардович' AND birth_year = 1995 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lebedev-dmitriy-2008' AND s.athlete_id <> a.id)
              THEN 'lebedev-dmitriy-2008-' || a.id ELSE 'lebedev-dmitriy-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Лебедев' AND first_name = 'Дмитрий' AND middle_name = 'Николаевич' AND birth_year = 2008 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'petrov-nikita-2009' AND s.athlete_id <> a.id)
              THEN 'petrov-nikita-2009-' || a.id ELSE 'petrov-nikita-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Петров' AND first_name = 'Никита' AND middle_name = 'Петрович' AND birth_year = 2009 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'vinokurov-maksim-1995' AND s.athlete_id <> a.id)
              THEN 'vinokurov-maksim-1995-' || a.id ELSE 'vinokurov-maksim-1995' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Винокуров' AND first_name = 'Максим' AND middle_name = 'Константинович' AND birth_year = 1995 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'myshkarev-sergey-1976' AND s.athlete_id <> a.id)
              THEN 'myshkarev-sergey-1976-' || a.id ELSE 'myshkarev-sergey-1976' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Мышкарев' AND first_name = 'Сергей' AND middle_name = 'Юрьевич' AND birth_year = 1976 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'pozdeev-andrey-1990' AND s.athlete_id <> a.id)
              THEN 'pozdeev-andrey-1990-' || a.id ELSE 'pozdeev-andrey-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Поздеев' AND first_name = 'Андрей' AND middle_name = 'Николаевич' AND birth_year = 1990 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kravchenko-sergey-1982' AND s.athlete_id <> a.id)
              THEN 'kravchenko-sergey-1982-' || a.id ELSE 'kravchenko-sergey-1982' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кравченко' AND first_name = 'Сергей' AND middle_name = 'Сергеевич' AND birth_year = 1982 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'olehnovich-oleg-1991' AND s.athlete_id <> a.id)
              THEN 'olehnovich-oleg-1991-' || a.id ELSE 'olehnovich-oleg-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Олехнович' AND first_name = 'Олег' AND middle_name = 'Юрьевич' AND birth_year = 1991 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zhorov-egor-2003' AND s.athlete_id <> a.id)
              THEN 'zhorov-egor-2003-' || a.id ELSE 'zhorov-egor-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Жоров' AND first_name = 'Егор' AND middle_name = 'Иванович' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'chegorev-aleksandr-1983' AND s.athlete_id <> a.id)
              THEN 'chegorev-aleksandr-1983-' || a.id ELSE 'chegorev-aleksandr-1983' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Чегорев' AND first_name = 'Александр' AND middle_name = 'Сергеевич' AND birth_year = 1983 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'rudnev-ruslan-1994' AND s.athlete_id <> a.id)
              THEN 'rudnev-ruslan-1994-' || a.id ELSE 'rudnev-ruslan-1994' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Руднев' AND first_name = 'Руслан' AND middle_name = 'Сергеевич' AND birth_year = 1994 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ivanov-kirill-2009' AND s.athlete_id <> a.id)
              THEN 'ivanov-kirill-2009-' || a.id ELSE 'ivanov-kirill-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Кирилл' AND middle_name = 'Михайлович' AND birth_year = 2009 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zhbanov-aleksey-1986' AND s.athlete_id <> a.id)
              THEN 'zhbanov-aleksey-1986-' || a.id ELSE 'zhbanov-aleksey-1986' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Жбанов' AND first_name = 'Алексей' AND middle_name = 'Александрович' AND birth_year = 1986 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lazukov-andrey-2004' AND s.athlete_id <> a.id)
              THEN 'lazukov-andrey-2004-' || a.id ELSE 'lazukov-andrey-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Лазуков' AND first_name = 'Андрей' AND middle_name = 'Михайлович' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ryzhkov-anton-1994' AND s.athlete_id <> a.id)
              THEN 'ryzhkov-anton-1994-' || a.id ELSE 'ryzhkov-anton-1994' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Рыжков' AND first_name = 'Антон' AND middle_name = 'Николаевич' AND birth_year = 1994 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'pikul-denis-2003' AND s.athlete_id <> a.id)
              THEN 'pikul-denis-2003-' || a.id ELSE 'pikul-denis-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Пикуль' AND first_name = 'Денис' AND middle_name = 'Юрьевич' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zhumadilov-aslan-2004' AND s.athlete_id <> a.id)
              THEN 'zhumadilov-aslan-2004-' || a.id ELSE 'zhumadilov-aslan-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Жумадилов' AND first_name = 'Аслан' AND middle_name = 'Жасланович' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'buchin-aleksey-1988' AND s.athlete_id <> a.id)
              THEN 'buchin-aleksey-1988-' || a.id ELSE 'buchin-aleksey-1988' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бучин' AND first_name = 'Алексей' AND middle_name = 'Валериевич' AND birth_year = 1988 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'gusev-vladimir-2004' AND s.athlete_id <> a.id)
              THEN 'gusev-vladimir-2004-' || a.id ELSE 'gusev-vladimir-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Гусев' AND first_name = 'Владимир' AND middle_name = 'Владимирович' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'beba-yuriy-2004' AND s.athlete_id <> a.id)
              THEN 'beba-yuriy-2004-' || a.id ELSE 'beba-yuriy-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Беба' AND first_name = 'Юрий' AND middle_name = 'Николаевич' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'petrov-pavel-2007' AND s.athlete_id <> a.id)
              THEN 'petrov-pavel-2007-' || a.id ELSE 'petrov-pavel-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Петров' AND first_name = 'Павел' AND middle_name = 'Александрович' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'molchanov-dianisiy-2005' AND s.athlete_id <> a.id)
              THEN 'molchanov-dianisiy-2005-' || a.id ELSE 'molchanov-dianisiy-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Молчанов' AND first_name = 'Дианисий' AND middle_name = 'Николаевич' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'smolencev-igor-2003' AND s.athlete_id <> a.id)
              THEN 'smolencev-igor-2003-' || a.id ELSE 'smolencev-igor-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Смоленцев' AND first_name = 'Игорь' AND middle_name = 'Валентинович' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'babich-gordey-2009' AND s.athlete_id <> a.id)
              THEN 'babich-gordey-2009-' || a.id ELSE 'babich-gordey-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бабич' AND first_name = 'Гордей' AND middle_name = 'Сергеевич' AND birth_year = 2009 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kobyakov-grigoriy-2004' AND s.athlete_id <> a.id)
              THEN 'kobyakov-grigoriy-2004-' || a.id ELSE 'kobyakov-grigoriy-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кобяков' AND first_name = 'Григорий' AND middle_name = 'Кириллович' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'chuev-pavel-1997' AND s.athlete_id <> a.id)
              THEN 'chuev-pavel-1997-' || a.id ELSE 'chuev-pavel-1997' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Чуев' AND first_name = 'Павел' AND middle_name = 'Владимирович' AND birth_year = 1997 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sarlaev-andrey-2003' AND s.athlete_id <> a.id)
              THEN 'sarlaev-andrey-2003-' || a.id ELSE 'sarlaev-andrey-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Сарлаев' AND first_name = 'Андрей' AND middle_name = 'Дмитриевич' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'homyakov-ilya-2002' AND s.athlete_id <> a.id)
              THEN 'homyakov-ilya-2002-' || a.id ELSE 'homyakov-ilya-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Хомяков' AND first_name = 'Илья' AND middle_name = 'Алексеевич' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'soshnikov-nikita-1986' AND s.athlete_id <> a.id)
              THEN 'soshnikov-nikita-1986-' || a.id ELSE 'soshnikov-nikita-1986' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Сошников' AND first_name = 'Никита' AND middle_name = 'Олегович' AND birth_year = 1986 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'melnikov-maksim-1991' AND s.athlete_id <> a.id)
              THEN 'melnikov-maksim-1991-' || a.id ELSE 'melnikov-maksim-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Мельников' AND first_name = 'Максим' AND middle_name = 'Михайлович' AND birth_year = 1991 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'konobriy-maksim-1986' AND s.athlete_id <> a.id)
              THEN 'konobriy-maksim-1986-' || a.id ELSE 'konobriy-maksim-1986' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Конобрий' AND first_name = 'Максим' AND middle_name = 'Леонидович' AND birth_year = 1986 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'shvedov-pavel-2007' AND s.athlete_id <> a.id)
              THEN 'shvedov-pavel-2007-' || a.id ELSE 'shvedov-pavel-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Шведов' AND first_name = 'Павел' AND middle_name = 'Вячеславович' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'mezhnecov-danila-1993' AND s.athlete_id <> a.id)
              THEN 'mezhnecov-danila-1993-' || a.id ELSE 'mezhnecov-danila-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Межнецов' AND first_name = 'Данила' AND middle_name = 'Алексеевич' AND birth_year = 1993 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'anisimov-aleksey-2004' AND s.athlete_id <> a.id)
              THEN 'anisimov-aleksey-2004-' || a.id ELSE 'anisimov-aleksey-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Анисимов' AND first_name = 'Алексей' AND middle_name = 'Павлович' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'mikryakov-mihail-2007' AND s.athlete_id <> a.id)
              THEN 'mikryakov-mihail-2007-' || a.id ELSE 'mikryakov-mihail-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Микряков' AND first_name = 'Михаил' AND middle_name = 'Геннадьевич' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'bezhanov-vasiliy-1999' AND s.athlete_id <> a.id)
              THEN 'bezhanov-vasiliy-1999-' || a.id ELSE 'bezhanov-vasiliy-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бежанов' AND first_name = 'Василий' AND middle_name = 'Витальевич' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'melnik-evgeniy-2003' AND s.athlete_id <> a.id)
              THEN 'melnik-evgeniy-2003-' || a.id ELSE 'melnik-evgeniy-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Мельник' AND first_name = 'Евгений' AND middle_name = 'Андреевич' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'mazanko-grigoriy-2008' AND s.athlete_id <> a.id)
              THEN 'mazanko-grigoriy-2008-' || a.id ELSE 'mazanko-grigoriy-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Мазанко' AND first_name = 'Григорий' AND middle_name = 'Сергеевич' AND birth_year = 2008 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'viharev-artem-2006' AND s.athlete_id <> a.id)
              THEN 'viharev-artem-2006-' || a.id ELSE 'viharev-artem-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Вихарев' AND first_name = 'Артем' AND middle_name = 'Сергеевич' AND birth_year = 2006 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'korshunov-aleksey-2008' AND s.athlete_id <> a.id)
              THEN 'korshunov-aleksey-2008-' || a.id ELSE 'korshunov-aleksey-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Коршунов' AND first_name = 'Алексей' AND middle_name = 'Андреевич' AND birth_year = 2008 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kabachiy-vladislav-2006' AND s.athlete_id <> a.id)
              THEN 'kabachiy-vladislav-2006-' || a.id ELSE 'kabachiy-vladislav-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кабачий' AND first_name = 'Владислав' AND middle_name = 'Юрьевич' AND birth_year = 2006 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'smagulov-nursultan-1999' AND s.athlete_id <> a.id)
              THEN 'smagulov-nursultan-1999-' || a.id ELSE 'smagulov-nursultan-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Смагулов' AND first_name = 'Нурсултан' AND middle_name = 'Шайзандинович' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'benidze-spartak-2002' AND s.athlete_id <> a.id)
              THEN 'benidze-spartak-2002-' || a.id ELSE 'benidze-spartak-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бенидзе' AND first_name = 'Спартак' AND middle_name = 'Бадриевич' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'nikiforov-sergey-1981' AND s.athlete_id <> a.id)
              THEN 'nikiforov-sergey-1981-' || a.id ELSE 'nikiforov-sergey-1981' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Никифоров' AND first_name = 'Сергей' AND middle_name = 'Валерьевич' AND birth_year = 1981 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'yurov-evgeniy-1995' AND s.athlete_id <> a.id)
              THEN 'yurov-evgeniy-1995-' || a.id ELSE 'yurov-evgeniy-1995' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Юров' AND first_name = 'Евгений' AND middle_name = 'Владимирович' AND birth_year = 1995 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'goryachev-sergey-1988' AND s.athlete_id <> a.id)
              THEN 'goryachev-sergey-1988-' || a.id ELSE 'goryachev-sergey-1988' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Горячев' AND first_name = 'Сергей' AND middle_name = 'Сергеевич' AND birth_year = 1988 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'melnikov-egor-2004' AND s.athlete_id <> a.id)
              THEN 'melnikov-egor-2004-' || a.id ELSE 'melnikov-egor-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Мельников' AND first_name = 'Егор' AND middle_name = 'Тимурович' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'grigorev-nikita-1994' AND s.athlete_id <> a.id)
              THEN 'grigorev-nikita-1994-' || a.id ELSE 'grigorev-nikita-1994' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Григорьев' AND first_name = 'Никита' AND middle_name = 'Юрьевич' AND birth_year = 1994 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kuharenko-ilya-2003' AND s.athlete_id <> a.id)
              THEN 'kuharenko-ilya-2003-' || a.id ELSE 'kuharenko-ilya-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кухаренко' AND first_name = 'Илья' AND middle_name = 'Олегович' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'nifanin-evgeniy-1994' AND s.athlete_id <> a.id)
              THEN 'nifanin-evgeniy-1994-' || a.id ELSE 'nifanin-evgeniy-1994' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Нифанин' AND first_name = 'Евгений' AND middle_name = 'Сергеевич' AND birth_year = 1994 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'babenko-fedor-1990' AND s.athlete_id <> a.id)
              THEN 'babenko-fedor-1990-' || a.id ELSE 'babenko-fedor-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бабенко' AND first_name = 'Федор' AND middle_name = 'Федорович' AND birth_year = 1990 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'yavaev-maksim-2002' AND s.athlete_id <> a.id)
              THEN 'yavaev-maksim-2002-' || a.id ELSE 'yavaev-maksim-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Яваев' AND first_name = 'Максим' AND middle_name = 'Айниорович' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'konokov-andrey-1987' AND s.athlete_id <> a.id)
              THEN 'konokov-andrey-1987-' || a.id ELSE 'konokov-andrey-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Коноков' AND first_name = 'Андрей' AND middle_name = 'Сергеевич' AND birth_year = 1987 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'yudin-valeriy-1990' AND s.athlete_id <> a.id)
              THEN 'yudin-valeriy-1990-' || a.id ELSE 'yudin-valeriy-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Юдин' AND first_name = 'Валерий' AND middle_name = 'Викторович' AND birth_year = 1990 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'podpruzhnikov-aleksey-1980' AND s.athlete_id <> a.id)
              THEN 'podpruzhnikov-aleksey-1980-' || a.id ELSE 'podpruzhnikov-aleksey-1980' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Подпружников' AND first_name = 'Алексей' AND middle_name = 'Евгеньевич' AND birth_year = 1980 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ivanov-aleksandr-1986' AND s.athlete_id <> a.id)
              THEN 'ivanov-aleksandr-1986-' || a.id ELSE 'ivanov-aleksandr-1986' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Александр' AND middle_name = 'Юрьевич' AND birth_year = 1986 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'smirnov-ruslan-1994' AND s.athlete_id <> a.id)
              THEN 'smirnov-ruslan-1994-' || a.id ELSE 'smirnov-ruslan-1994' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Смирнов' AND first_name = 'Руслан' AND middle_name = 'Сергеевич' AND birth_year = 1994 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'yangolenko-daniil-2000' AND s.athlete_id <> a.id)
              THEN 'yangolenko-daniil-2000-' || a.id ELSE 'yangolenko-daniil-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Янголенко' AND first_name = 'Даниил' AND middle_name = 'Витальевич' AND birth_year = 2000 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'malinovskiy-semen-1989' AND s.athlete_id <> a.id)
              THEN 'malinovskiy-semen-1989-' || a.id ELSE 'malinovskiy-semen-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Малиновский' AND first_name = 'Семён' AND middle_name = 'Андреевич' AND birth_year = 1989 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'volkov-ilya-1992' AND s.athlete_id <> a.id)
              THEN 'volkov-ilya-1992-' || a.id ELSE 'volkov-ilya-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Волков' AND first_name = 'Илья' AND middle_name = 'Алексеевич' AND birth_year = 1992 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'nikitin-daniil-1981' AND s.athlete_id <> a.id)
              THEN 'nikitin-daniil-1981-' || a.id ELSE 'nikitin-daniil-1981' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Никитин' AND first_name = 'Даниил' AND middle_name = 'Алексеевич' AND birth_year = 1981 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'prokofev-aleksey-1985' AND s.athlete_id <> a.id)
              THEN 'prokofev-aleksey-1985-' || a.id ELSE 'prokofev-aleksey-1985' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Прокофьев' AND first_name = 'Алексей' AND middle_name = 'Михайлович' AND birth_year = 1985 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);

INSERT INTO results (id, category_id, athlete_id, place, total_reps, points, body_weight_kg, rank_achieved_id, discipline_id, bell_kg, hands, time_limit_min, competition_id, event_date, raw_name, raw_club, raw_region, protocol_id, source_page) VALUES
  (7001, 7001, (SELECT id FROM athletes WHERE last_name = 'Тарвердиева' AND first_name = 'Мария' AND middle_name = 'Алексеевна' AND birth_year = 1986 LIMIT 1), 1, 60, NULL, 63.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 7001, '2026-04-09', 'Тарвердиева Мария Алексеевна', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 7001, 20),
  (7002, 7002, (SELECT id FROM athletes WHERE last_name = 'Черницкая' AND first_name = 'Анастасия' AND middle_name = 'Андреевна' AND birth_year = 2000 LIMIT 1), 1, 38, NULL, 80.85, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 7001, '2026-04-09', 'Черницкая Анастасия Андреевна', 'РОО ФГС Псковской области', 'Псковская область', 7001, 22),
  (7003, 7003, (SELECT id FROM athletes WHERE last_name = 'Герман' AND first_name = 'Алена' AND middle_name = 'Сергеевна' AND birth_year = 1997 LIMIT 1), 1, 46, NULL, 67.45, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 7001, '2026-04-09', 'Герман Алена Сергеевна', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 7001, 21),
  (7004, 7003, (SELECT id FROM athletes WHERE last_name = 'Забелинская' AND first_name = 'Дарья' AND middle_name = 'Александровна' AND birth_year = 2003 LIMIT 1), 2, 28, NULL, 66.95, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 7001, '2026-04-09', 'Забелинская Дарья Александровна', 'САФУ Арктика', 'Архангельская область', 7001, 21),
  (7005, 7003, (SELECT id FROM athletes WHERE last_name = 'Кудрявцева' AND first_name = 'Алина' AND middle_name = 'Витальевна' AND birth_year = 2000 LIMIT 1), 3, 0, NULL, 66.35, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 7001, '2026-04-09', 'Кудрявцева Алина Витальевна', 'РОО ФГС Псковской области', 'Псковская область', 7001, 21),
  (7006, 7004, (SELECT id FROM athletes WHERE last_name = 'Бенидзе' AND first_name = 'Джони' AND middle_name = 'Бадриевич' AND birth_year = 1990 LIMIT 1), 1, 111, NULL, 63.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 7001, '2026-04-09', 'Бенидзе Джони Бадриевич', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 7001, 13),
  (7007, 7004, (SELECT id FROM athletes WHERE last_name = 'Мартынов' AND first_name = 'Даниил' AND middle_name = 'Юрьевич' AND birth_year = 2008 LIMIT 1), 2, 33, NULL, 62.35, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 7001, '2026-04-09', 'Мартынов Даниил Юрьевич', 'СШОР №3', 'Вологодская область', 7001, 13),
  (7008, 7005, (SELECT id FROM athletes WHERE last_name = 'Щербин' AND first_name = 'Олег' AND middle_name = 'Владимирович' AND birth_year = 1989 LIMIT 1), 1, 110, NULL, 67.45, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 7001, '2026-04-09', 'Щербин Олег Владимирович', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 7001, 14),
  (7009, 7005, (SELECT id FROM athletes WHERE last_name = 'Фарзалиев' AND first_name = 'Мурад' AND middle_name = 'Нажмудалович' AND birth_year = 2007 LIMIT 1), 2, 60, NULL, 68.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 7001, '2026-04-09', 'Фарзалиев Мурад Нажмудалович', 'ВС РФ', 'г. Санкт-Петербург', 7001, 14),
  (7010, 7006, (SELECT id FROM athletes WHERE last_name = 'Смирнов' AND first_name = 'Даниил' AND middle_name = 'Алексеевич' AND birth_year = 2003 LIMIT 1), 1, 115, NULL, 72.35, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 7001, '2026-04-09', 'Смирнов Даниил Алексеевич', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 7001, 15),
  (7011, 7006, (SELECT id FROM athletes WHERE last_name = 'Салихов' AND first_name = 'Денис' AND middle_name = 'Владимирович' AND birth_year = 2005 LIMIT 1), 2, 82, NULL, 72.7, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 7001, '2026-04-09', 'Салихов Денис Владимирович', 'ВС РФ', 'г. Санкт-Петербург', 7001, 15),
  (7012, 7006, (SELECT id FROM athletes WHERE last_name = 'Карпов' AND first_name = 'Владислав' AND middle_name = 'Алексеевич' AND birth_year = 1999 LIMIT 1), 3, 77, NULL, 72.6, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 7001, '2026-04-09', 'Карпов Владислав Алексеевич', '-', 'Мурманская область', 7001, 15),
  (7013, 7007, (SELECT id FROM athletes WHERE last_name = 'Бессонов' AND first_name = 'Максим' AND middle_name = 'Вячеславович' AND birth_year = 2004 LIMIT 1), 1, 127, NULL, 77.55, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 7001, '2026-04-09', 'Бессонов Максим Вячеславович', '-', 'г. Санкт-Петербург', 7001, 16),
  (7014, 7007, (SELECT id FROM athletes WHERE last_name = 'Ольшко' AND first_name = 'Иван' AND middle_name = 'Вячеславович' AND birth_year = 2007 LIMIT 1), 2, 79, NULL, 77.5, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 7001, '2026-04-09', 'Ольшко Иван Вячеславович', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 7001, 16),
  (7015, 7007, (SELECT id FROM athletes WHERE last_name = 'Дьяков' AND first_name = 'Илья' AND middle_name = 'Сергеевич' AND birth_year = 2005 LIMIT 1), 3, 66, NULL, 74.7, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 7001, '2026-04-09', 'Дьяков Илья Сергеевич', '-', 'г. Санкт-Петербург', 7001, 16),
  (7016, 7007, (SELECT id FROM athletes WHERE last_name = 'Лавров' AND first_name = 'Марк' AND middle_name = 'Кириллович' AND birth_year = 2011 LIMIT 1), 4, 42, NULL, 78.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 7001, '2026-04-09', 'Лавров Марк Кириллович', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 7001, 16),
  (7017, 7008, (SELECT id FROM athletes WHERE last_name = 'Косухин' AND first_name = 'Владислав' AND middle_name = 'Владимирович' AND birth_year = 2004 LIMIT 1), 1, 124, NULL, 84.55, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 7001, '2026-04-09', 'Косухин Владислав Владимирович', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 7001, 17),
  (7018, 7008, (SELECT id FROM athletes WHERE last_name = 'Микшин' AND first_name = 'Сергей' AND middle_name = 'Владимирович' AND birth_year = 2000 LIMIT 1), 2, 118, NULL, 83.35, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 7001, '2026-04-09', 'Микшин Сергей Владимирович', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 7001, 17),
  (7019, 7008, (SELECT id FROM athletes WHERE last_name = 'Акиньшин' AND first_name = 'Владислав' AND middle_name = 'Андреевич' AND birth_year = 2002 LIMIT 1), 3, 25, NULL, 84.3, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 7001, '2026-04-09', 'Акиньшин Владислав Андреевич', 'ВС РФ', 'г. Санкт-Петербург', 7001, 17),
  (7020, 7009, (SELECT id FROM athletes WHERE last_name = 'Марков' AND first_name = 'Иван' AND middle_name = 'Эдуардович' AND birth_year = 1995 LIMIT 1), 1, 161, NULL, 99.45, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 7001, '2026-04-09', 'Марков Иван Эдуардович', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 7001, 19),
  (7021, 7009, (SELECT id FROM athletes WHERE last_name = 'Лебедев' AND first_name = 'Дмитрий' AND middle_name = 'Николаевич' AND birth_year = 2008 LIMIT 1), 2, 60, NULL, 96.25, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 7001, '2026-04-09', 'Лебедев Дмитрий Николаевич', 'СШОР №3', 'Вологодская область', 7001, 19),
  (7022, 7009, (SELECT id FROM athletes WHERE last_name = 'Петров' AND first_name = 'Никита' AND middle_name = 'Петрович' AND birth_year = 2009 LIMIT 1), 3, 35, NULL, 112.45, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 7001, '2026-04-09', 'Петров Никита Петрович', 'РОООО ВФГС в Новгородской области', 'Новгородская область', 7001, 19),
  (7023, 7009, (SELECT id FROM athletes WHERE last_name = 'Винокуров' AND first_name = 'Максим' AND middle_name = 'Константинович' AND birth_year = 1995 LIMIT 1), 4, 25, NULL, 128.65, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 7001, '2026-04-09', 'Винокуров Максим Константинович', 'РОО ФГС Псковской области', 'Псковская область', 7001, 19),
  (7024, 7009, (SELECT id FROM athletes WHERE last_name = 'Мышкарев' AND first_name = 'Сергей' AND middle_name = 'Юрьевич' AND birth_year = 1976 LIMIT 1), 5, 15, NULL, 97.5, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 7001, '2026-04-09', 'Мышкарев Сергей Юрьевич', 'РОООО ВФГС в Новгородской области', 'Новгородская область', 7001, 19),
  (7025, 7010, (SELECT id FROM athletes WHERE last_name = 'Поздеев' AND first_name = 'Андрей' AND middle_name = 'Николаевич' AND birth_year = 1990 LIMIT 1), 1, 111, NULL, 86.4, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 7001, '2026-04-09', 'Поздеев Андрей Николаевич', 'РО ООО ВФГС в Архангельской области', 'Архангельская область', 7001, 18),
  (7026, 7010, (SELECT id FROM athletes WHERE last_name = 'Кравченко' AND first_name = 'Сергей' AND middle_name = 'Сергеевич' AND birth_year = 1982 LIMIT 1), 2, 103, NULL, 92.15, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 7001, '2026-04-09', 'Кравченко Сергей Сергеевич', 'МАУ ДО СШОР', 'Калининградская область', 7001, 18),
  (7027, 7010, (SELECT id FROM athletes WHERE last_name = 'Олехнович' AND first_name = 'Олег' AND middle_name = 'Юрьевич' AND birth_year = 1991 LIMIT 1), 3, 93, NULL, 88.85, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 7001, '2026-04-09', 'Олехнович Олег Юрьевич', 'РОО ФГС Псковской области', 'Псковская область', 7001, 18),
  (7028, 7010, (SELECT id FROM athletes WHERE last_name = 'Жоров' AND first_name = 'Егор' AND middle_name = 'Иванович' AND birth_year = 2003 LIMIT 1), 4, 93, NULL, 92.9, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 7001, '2026-04-09', 'Жоров Егор Иванович', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 7001, 18),
  (7029, 7010, (SELECT id FROM athletes WHERE last_name = 'Чегорев' AND first_name = 'Александр' AND middle_name = 'Сергеевич' AND birth_year = 1983 LIMIT 1), 5, 25, NULL, 91.1, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 7001, '2026-04-09', 'Чегорев Александр Сергеевич', 'РОООО ВФГС в Новгородской области', 'Новгородская область', 7001, 18),
  (7030, 7011, (SELECT id FROM athletes WHERE last_name = 'Руднев' AND first_name = 'Руслан' AND middle_name = 'Сергеевич' AND birth_year = 1994 LIMIT 1), 1, 55, NULL, 62.95, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 7001, '2026-04-09', 'Руднев Руслан Сергеевич', '', 'г. Санкт-Петербург', 7001, 2),
  (7031, 7011, (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Кирилл' AND middle_name = 'Михайлович' AND birth_year = 2009 LIMIT 1), 2, 53, NULL, 60.9, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 7001, '2026-04-09', 'Иванов Кирилл Михайлович', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 7001, 2),
  (7032, 7011, (SELECT id FROM athletes WHERE last_name = 'Жбанов' AND first_name = 'Алексей' AND middle_name = 'Александрович' AND birth_year = 1986 LIMIT 1), 3, 48, NULL, 63.0, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 7001, '2026-04-09', 'Жбанов Алексей Александрович', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 7001, 2),
  (7033, 7011, (SELECT id FROM athletes WHERE last_name = 'Лазуков' AND first_name = 'Андрей' AND middle_name = 'Михайлович' AND birth_year = 2004 LIMIT 1), 4, 42, NULL, 62.45, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 7001, '2026-04-09', 'Лазуков Андрей Михайлович', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 7001, 2),
  (7034, 7012, (SELECT id FROM athletes WHERE last_name = 'Рыжков' AND first_name = 'Антон' AND middle_name = 'Николаевич' AND birth_year = 1994 LIMIT 1), 1, 71, NULL, 68.0, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 7001, '2026-04-09', 'Рыжков Антон Николаевич', 'МО РФ', 'г. Санкт-Петербург', 7001, 3),
  (7035, 7012, (SELECT id FROM athletes WHERE last_name = 'Пикуль' AND first_name = 'Денис' AND middle_name = 'Юрьевич' AND birth_year = 2003 LIMIT 1), 2, 50, NULL, 68.0, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 7001, '2026-04-09', 'Пикуль Денис Юрьевич', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 7001, 3),
  (7036, 7012, (SELECT id FROM athletes WHERE last_name = 'Жумадилов' AND first_name = 'Аслан' AND middle_name = 'Жасланович' AND birth_year = 2004 LIMIT 1), 3, 45, NULL, 68.0, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 7001, '2026-04-09', 'Жумадилов Аслан Жасланович', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 7001, 3),
  (7037, 7012, (SELECT id FROM athletes WHERE last_name = 'Бучин' AND first_name = 'Алексей' AND middle_name = 'Валериевич' AND birth_year = 1988 LIMIT 1), 4, 36, NULL, 65.65, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 7001, '2026-04-09', 'Бучин Алексей Валериевич', 'РОО ФГС Псковской области', 'Псковская область', 7001, 3),
  (7038, 7013, (SELECT id FROM athletes WHERE last_name = 'Гусев' AND first_name = 'Владимир' AND middle_name = 'Владимирович' AND birth_year = 2004 LIMIT 1), 1, 64, NULL, 73.0, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 7001, '2026-04-09', 'Гусев Владимир Владимирович', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 7001, 4),
  (7039, 7013, (SELECT id FROM athletes WHERE last_name = 'Смирнов' AND first_name = 'Даниил' AND middle_name = 'Алексеевич' AND birth_year = 2003 LIMIT 1), 2, 59, NULL, 72.8, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 7001, '2026-04-09', 'Смирнов Даниил Алексеевич', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 7001, 4),
  (7040, 7013, (SELECT id FROM athletes WHERE last_name = 'Салихов' AND first_name = 'Денис' AND middle_name = 'Владимирович' AND birth_year = 2005 LIMIT 1), 3, 46, NULL, 72.45, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 7001, '2026-04-09', 'Салихов Денис Владимирович', 'ВС РФ', 'г. Санкт-Петербург', 7001, 4),
  (7041, 7013, (SELECT id FROM athletes WHERE last_name = 'Карпов' AND first_name = 'Владислав' AND middle_name = 'Алексеевич' AND birth_year = 1999 LIMIT 1), 4, 44, NULL, 72.35, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 7001, '2026-04-09', 'Карпов Владислав Алексеевич', '-', 'Мурманская область', 7001, 4),
  (7042, 7013, (SELECT id FROM athletes WHERE last_name = 'Беба' AND first_name = 'Юрий' AND middle_name = 'Николаевич' AND birth_year = 2004 LIMIT 1), 5, 40, NULL, 73.0, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 7001, '2026-04-09', 'Беба Юрий Николаевич', 'ВС РФ', 'г. Санкт-Петербург', 7001, 4),
  (7043, 7013, (SELECT id FROM athletes WHERE last_name = 'Петров' AND first_name = 'Павел' AND middle_name = 'Александрович' AND birth_year = 2007 LIMIT 1), 6, 38, NULL, 70.0, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 7001, '2026-04-09', 'Петров Павел Александрович', 'СШОР №3', 'Вологодская область', 7001, 4),
  (7044, 7014, (SELECT id FROM athletes WHERE last_name = 'Молчанов' AND first_name = 'Дианисий' AND middle_name = 'Николаевич' AND birth_year = 2005 LIMIT 1), 1, 75, NULL, 78.0, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 7001, '2026-04-09', 'Молчанов Дианисий Николаевич', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 7001, 5),
  (7045, 7014, (SELECT id FROM athletes WHERE last_name = 'Смоленцев' AND first_name = 'Игорь' AND middle_name = 'Валентинович' AND birth_year = 2003 LIMIT 1), 2, 55, NULL, 77.35, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 7001, '2026-04-09', 'Смоленцев Игорь Валентинович', 'МО РФ', 'г. Санкт-Петербург', 7001, 5),
  (7046, 7014, (SELECT id FROM athletes WHERE last_name = 'Бабич' AND first_name = 'Гордей' AND middle_name = 'Сергеевич' AND birth_year = 2009 LIMIT 1), 3, 54, NULL, 77.4, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 7001, '2026-04-09', 'Бабич Гордей Сергеевич', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 7001, 5),
  (7047, 7014, (SELECT id FROM athletes WHERE last_name = 'Кобяков' AND first_name = 'Григорий' AND middle_name = 'Кириллович' AND birth_year = 2004 LIMIT 1), 4, 44, NULL, 77.95, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 7001, '2026-04-09', 'Кобяков Григорий Кириллович', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 7001, 5),
  (7048, 7015, (SELECT id FROM athletes WHERE last_name = 'Чуев' AND first_name = 'Павел' AND middle_name = 'Владимирович' AND birth_year = 1997 LIMIT 1), 1, 84, NULL, 85.0, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 7001, '2026-04-09', 'Чуев Павел Владимирович', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 7001, 6),
  (7049, 7015, (SELECT id FROM athletes WHERE last_name = 'Сарлаев' AND first_name = 'Андрей' AND middle_name = 'Дмитриевич' AND birth_year = 2003 LIMIT 1), 2, 69, NULL, 83.1, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 7001, '2026-04-09', 'Сарлаев Андрей Дмитриевич', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 7001, 6),
  (7050, 7015, (SELECT id FROM athletes WHERE last_name = 'Хомяков' AND first_name = 'Илья' AND middle_name = 'Алексеевич' AND birth_year = 2002 LIMIT 1), 3, 69, NULL, 84.1, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 7001, '2026-04-09', 'Хомяков Илья Алексеевич', 'РО ООО ВФГС в Архангельской области', 'Архангельская область', 7001, 6),
  (7051, 7015, (SELECT id FROM athletes WHERE last_name = 'Сошников' AND first_name = 'Никита' AND middle_name = 'Олегович' AND birth_year = 1986 LIMIT 1), 4, 68, NULL, 80.55, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 7001, '2026-04-09', 'Сошников Никита Олегович', '-', 'Ленинградская область', 7001, 6),
  (7052, 7015, (SELECT id FROM athletes WHERE last_name = 'Мельников' AND first_name = 'Максим' AND middle_name = 'Михайлович' AND birth_year = 1991 LIMIT 1), 5, 63, NULL, 83.4, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 7001, '2026-04-09', 'Мельников Максим Михайлович', '-', 'г. Санкт-Петербург', 7001, 6),
  (7053, 7015, (SELECT id FROM athletes WHERE last_name = 'Конобрий' AND first_name = 'Максим' AND middle_name = 'Леонидович' AND birth_year = 1986 LIMIT 1), 6, 56, NULL, 85.0, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 7001, '2026-04-09', 'Конобрий Максим Леонидович', '-', 'Ленинградская область', 7001, 6),
  (7054, 7016, (SELECT id FROM athletes WHERE last_name = 'Лебедев' AND first_name = 'Дмитрий' AND middle_name = 'Николаевич' AND birth_year = 2008 LIMIT 1), 1, 88, NULL, 96.4, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 7001, '2026-04-09', 'Лебедев Дмитрий Николаевич', 'СШОР №3', 'Вологодская область', 7001, 8),
  (7055, 7016, (SELECT id FROM athletes WHERE last_name = 'Шведов' AND first_name = 'Павел' AND middle_name = 'Вячеславович' AND birth_year = 2007 LIMIT 1), 2, 50, NULL, 99.6, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 7001, '2026-04-09', 'Шведов Павел Вячеславович', 'МАУ ДО СШОР', 'Калининградская область', 7001, 8),
  (7056, 7016, (SELECT id FROM athletes WHERE last_name = 'Петров' AND first_name = 'Никита' AND middle_name = 'Петрович' AND birth_year = 2009 LIMIT 1), 3, 22, NULL, 111.0, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 7001, '2026-04-09', 'Петров Никита Петрович', 'РОООО ВФГС в Новгородской области', 'Новгородская область', 7001, 8),
  (7057, 7016, (SELECT id FROM athletes WHERE last_name = 'Винокуров' AND first_name = 'Максим' AND middle_name = 'Константинович' AND birth_year = 1995 LIMIT 1), 4, 19, NULL, 129.8, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 7001, '2026-04-09', 'Винокуров Максим Константинович', 'РОО ФГС Псковской области', 'Псковская область', 7001, 8),
  (7058, 7016, (SELECT id FROM athletes WHERE last_name = 'Межнецов' AND first_name = 'Данила' AND middle_name = 'Алексеевич' AND birth_year = 1993 LIMIT 1), 5, 15, NULL, 104.4, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 7001, '2026-04-09', 'Межнецов Данила Алексеевич', '-', 'Ленинградская область', 7001, 8),
  (7059, 7016, (SELECT id FROM athletes WHERE last_name = 'Мышкарев' AND first_name = 'Сергей' AND middle_name = 'Юрьевич' AND birth_year = 1976 LIMIT 1), 6, 12, NULL, 98.45, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 7001, '2026-04-09', 'Мышкарев Сергей Юрьевич', 'РОООО ВФГС в Новгородской области', 'Новгородская область', 7001, 8),
  (7060, 7016, (SELECT id FROM athletes WHERE last_name = 'Анисимов' AND first_name = 'Алексей' AND middle_name = 'Павлович' AND birth_year = 2004 LIMIT 1), 7, 11, NULL, 105.2, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 7001, '2026-04-09', 'Анисимов Алексей Павлович', 'СШОР №3', 'Вологодская область', 7001, 8),
  (7061, 7017, (SELECT id FROM athletes WHERE last_name = 'Микряков' AND first_name = 'Михаил' AND middle_name = 'Геннадьевич' AND birth_year = 2007 LIMIT 1), 1, 46, NULL, 94.55, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 7001, '2026-04-09', 'Микряков Михаил Геннадьевич', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 7001, 7),
  (7062, 7017, (SELECT id FROM athletes WHERE last_name = 'Бежанов' AND first_name = 'Василий' AND middle_name = 'Витальевич' AND birth_year = 1999 LIMIT 1), 2, 44, NULL, 95.0, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 7001, '2026-04-09', 'Бежанов Василий Витальевич', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 7001, 7),
  (7063, 7017, (SELECT id FROM athletes WHERE last_name = 'Мельник' AND first_name = 'Евгений' AND middle_name = 'Андреевич' AND birth_year = 2003 LIMIT 1), 3, 36, NULL, 91.2, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 7001, '2026-04-09', 'Мельник Евгений Андреевич', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 7001, 7),
  (7064, 7017, (SELECT id FROM athletes WHERE last_name = 'Мазанко' AND first_name = 'Григорий' AND middle_name = 'Сергеевич' AND birth_year = 2008 LIMIT 1), 4, 28, NULL, 86.4, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 7001, '2026-04-09', 'Мазанко Григорий Сергеевич', 'СШОР №3', 'Вологодская область', 7001, 7),
  (7065, 7017, (SELECT id FROM athletes WHERE last_name = 'Чегорев' AND first_name = 'Александр' AND middle_name = 'Сергеевич' AND birth_year = 1983 LIMIT 1), 5, 27, NULL, 91.4, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 7001, '2026-04-09', 'Чегорев Александр Сергеевич', 'РОООО ВФГС в Новгородской области', 'Новгородская область', 7001, 7),
  (7066, 7017, (SELECT id FROM athletes WHERE last_name = 'Вихарев' AND first_name = 'Артем' AND middle_name = 'Сергеевич' AND birth_year = 2006 LIMIT 1), 6, 23, NULL, 90.0, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 7001, '2026-04-09', 'Вихарев Артем Сергеевич', 'СШОР №3', 'Вологодская область', 7001, 7),
  (7067, 7018, (SELECT id FROM athletes WHERE last_name = 'Черницкая' AND first_name = 'Анастасия' AND middle_name = 'Андреевна' AND birth_year = 2000 LIMIT 1), 1, 26, NULL, 80.8, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 7001, '2026-04-09', 'Черницкая Анастасия Андреевна', 'РОО ФГС Псковской области', 'Псковская область', 7001, 10),
  (7068, 7019, (SELECT id FROM athletes WHERE last_name = 'Забелинская' AND first_name = 'Дарья' AND middle_name = 'Александровна' AND birth_year = 2003 LIMIT 1), 1, 41, NULL, 67.8, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 7001, '2026-04-09', 'Забелинская Дарья Александровна', 'САФУ Арктика', 'Архангельская область', 7001, 9),
  (7069, 7019, (SELECT id FROM athletes WHERE last_name = 'Герман' AND first_name = 'Алена' AND middle_name = 'Сергеевна' AND birth_year = 1997 LIMIT 1), 2, 37, NULL, 67.3, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 7001, '2026-04-09', 'Герман Алена Сергеевна', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 7001, 9),
  (7070, 7019, (SELECT id FROM athletes WHERE last_name = 'Кудрявцева' AND first_name = 'Алина' AND middle_name = 'Витальевна' AND birth_year = 2000 LIMIT 1), 3, 10, NULL, 65.4, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 7001, '2026-04-09', 'Кудрявцева Алина Витальевна', 'РОО ФГС Псковской области', 'Псковская область', 7001, 9),
  (7071, 7020, (SELECT id FROM athletes WHERE last_name = 'Бенидзе' AND first_name = 'Джони' AND middle_name = 'Бадриевич' AND birth_year = 1990 LIMIT 1), 1, 176, NULL, 63.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 7001, '2026-04-09', 'Бенидзе Джони Бадриевич', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 7001, 24),
  (7072, 7020, (SELECT id FROM athletes WHERE last_name = 'Коршунов' AND first_name = 'Алексей' AND middle_name = 'Андреевич' AND birth_year = 2008 LIMIT 1), 2, 76, NULL, 62.75, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 7001, '2026-04-09', 'Коршунов Алексей Андреевич', 'СШОР №3', 'Вологодская область', 7001, 24),
  (7073, 7020, (SELECT id FROM athletes WHERE last_name = 'Кабачий' AND first_name = 'Владислав' AND middle_name = 'Юрьевич' AND birth_year = 2006 LIMIT 1), 3, 55, NULL, 60.3, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 7001, '2026-04-09', 'Кабачий Владислав Юрьевич', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 7001, 24),
  (7074, 7021, (SELECT id FROM athletes WHERE last_name = 'Щербин' AND first_name = 'Олег' AND middle_name = 'Владимирович' AND birth_year = 1989 LIMIT 1), 1, 191, NULL, 67.3, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 7001, '2026-04-09', 'Щербин Олег Владимирович', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 7001, 25),
  (7075, 7021, (SELECT id FROM athletes WHERE last_name = 'Смагулов' AND first_name = 'Нурсултан' AND middle_name = 'Шайзандинович' AND birth_year = 1999 LIMIT 1), 2, 184, NULL, 67.3, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 7001, '2026-04-09', 'Смагулов Нурсултан Шайзандинович', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 7001, 25),
  (7076, 7021, (SELECT id FROM athletes WHERE last_name = 'Бенидзе' AND first_name = 'Спартак' AND middle_name = 'Бадриевич' AND birth_year = 2002 LIMIT 1), 3, 177, NULL, 67.8, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 7001, '2026-04-09', 'Бенидзе Спартак Бадриевич', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 7001, 25),
  (7077, 7021, (SELECT id FROM athletes WHERE last_name = 'Никифоров' AND first_name = 'Сергей' AND middle_name = 'Валерьевич' AND birth_year = 1981 LIMIT 1), 4, 112, NULL, 68.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 7001, '2026-04-09', 'Никифоров Сергей Валерьевич', 'ВС РФ', 'г. Санкт-Петербург', 7001, 25),
  (7078, 7021, (SELECT id FROM athletes WHERE last_name = 'Юров' AND first_name = 'Евгений' AND middle_name = 'Владимирович' AND birth_year = 1995 LIMIT 1), 5, 105, NULL, 67.9, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 7001, '2026-04-09', 'Юров Евгений Владимирович', 'РОООО ВФГС в Новгородской области', 'Новгородская область', 7001, 25),
  (7079, 7021, (SELECT id FROM athletes WHERE last_name = 'Горячев' AND first_name = 'Сергей' AND middle_name = 'Сергеевич' AND birth_year = 1988 LIMIT 1), 6, 66, NULL, 66.35, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 7001, '2026-04-09', 'Горячев Сергей Сергеевич', 'РОО ФГС Псковской области', 'Псковская область', 7001, 25),
  (7080, 7022, (SELECT id FROM athletes WHERE last_name = 'Карпов' AND first_name = 'Владислав' AND middle_name = 'Алексеевич' AND birth_year = 1999 LIMIT 1), 1, 169, NULL, 73.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 7001, '2026-04-09', 'Карпов Владислав Алексеевич', 'МО РФ', 'Мурманская область', 7001, 26),
  (7081, 7022, (SELECT id FROM athletes WHERE last_name = 'Мельников' AND first_name = 'Егор' AND middle_name = 'Тимурович' AND birth_year = 2004 LIMIT 1), 2, 85, NULL, 73.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 7001, '2026-04-09', 'Мельников Егор Тимурович', '-', 'г. Санкт-Петербург', 7001, 26),
  (7082, 7022, (SELECT id FROM athletes WHERE last_name = 'Григорьев' AND first_name = 'Никита' AND middle_name = 'Юрьевич' AND birth_year = 1994 LIMIT 1), 3, 55, NULL, 73.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 7001, '2026-04-09', 'Григорьев Никита Юрьевич', 'РОО ФГС Псковской области', 'Псковская область', 7001, 26),
  (7083, 7023, (SELECT id FROM athletes WHERE last_name = 'Кухаренко' AND first_name = 'Илья' AND middle_name = 'Олегович' AND birth_year = 2003 LIMIT 1), 1, 159, NULL, 76.8, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 7001, '2026-04-09', 'Кухаренко Илья Олегович', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 7001, 27),
  (7084, 7023, (SELECT id FROM athletes WHERE last_name = 'Нифанин' AND first_name = 'Евгений' AND middle_name = 'Сергеевич' AND birth_year = 1994 LIMIT 1), 2, 156, NULL, 77.35, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 7001, '2026-04-09', 'Нифанин Евгений Сергеевич', 'РО ООО ВФГС в Архангельской области', 'Архангельская область', 7001, 27),
  (7085, 7023, (SELECT id FROM athletes WHERE last_name = 'Кобяков' AND first_name = 'Григорий' AND middle_name = 'Кириллович' AND birth_year = 2004 LIMIT 1), 3, 150, NULL, 77.95, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 7001, '2026-04-09', 'Кобяков Григорий Кириллович', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 7001, 27),
  (7086, 7023, (SELECT id FROM athletes WHERE last_name = 'Бабенко' AND first_name = 'Федор' AND middle_name = 'Федорович' AND birth_year = 1990 LIMIT 1), 4, 141, NULL, 77.45, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 7001, '2026-04-09', 'Бабенко Федор Федорович', 'МАУ ДО СШОР', 'Калининградская область', 7001, 27),
  (7087, 7023, (SELECT id FROM athletes WHERE last_name = 'Яваев' AND first_name = 'Максим' AND middle_name = 'Айниорович' AND birth_year = 2002 LIMIT 1), 5, 132, NULL, 76.95, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 7001, '2026-04-09', 'Яваев Максим Айниорович', 'СК «Дзержинец»', 'г. Санкт-Петербург', 7001, 27),
  (7088, 7023, (SELECT id FROM athletes WHERE last_name = 'Коноков' AND first_name = 'Андрей' AND middle_name = 'Сергеевич' AND birth_year = 1987 LIMIT 1), 6, 84, NULL, 74.2, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 7001, '2026-04-09', 'Коноков Андрей Сергеевич', 'РОО ФГС Псковской области', 'Псковская область', 7001, 27),
  (7089, 7023, (SELECT id FROM athletes WHERE last_name = 'Юдин' AND first_name = 'Валерий' AND middle_name = 'Викторович' AND birth_year = 1990 LIMIT 1), 7, 78, NULL, 74.05, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 7001, '2026-04-09', 'Юдин Валерий Викторович', 'РОО ФГС Псковской области', 'Псковская область', 7001, 27),
  (7090, 7023, (SELECT id FROM athletes WHERE last_name = 'Подпружников' AND first_name = 'Алексей' AND middle_name = 'Евгеньевич' AND birth_year = 1980 LIMIT 1), 8, 65, NULL, 74.65, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 7001, '2026-04-09', 'Подпружников Алексей Евгеньевич', '', 'Ленинградская область', 7001, 27),
  (7091, 7023, (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Александр' AND middle_name = 'Юрьевич' AND birth_year = 1986 LIMIT 1), 9, 51, NULL, 75.3, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 7001, '2026-04-09', 'Иванов Александр Юрьевич', 'Спорт-ЛАЭС', 'Ленинградская область', 7001, 27),
  (7092, 7024, (SELECT id FROM athletes WHERE last_name = 'Смирнов' AND first_name = 'Руслан' AND middle_name = 'Сергеевич' AND birth_year = 1994 LIMIT 1), 1, 179, NULL, 84.3, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 7001, '2026-04-09', 'Смирнов Руслан Сергеевич', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 7001, 28),
  (7093, 7024, (SELECT id FROM athletes WHERE last_name = 'Янголенко' AND first_name = 'Даниил' AND middle_name = 'Витальевич' AND birth_year = 2000 LIMIT 1), 2, 170, NULL, 84.55, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 7001, '2026-04-09', 'Янголенко Даниил Витальевич', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 7001, 28),
  (7094, 7024, (SELECT id FROM athletes WHERE last_name = 'Малиновский' AND first_name = 'Семён' AND middle_name = 'Андреевич' AND birth_year = 1989 LIMIT 1), 3, 168, NULL, 83.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 7001, '2026-04-09', 'Малиновский Семён Андреевич', '', 'Ленинградская область', 7001, 28),
  (7095, 7024, (SELECT id FROM athletes WHERE last_name = 'Волков' AND first_name = 'Илья' AND middle_name = 'Алексеевич' AND birth_year = 1992 LIMIT 1), 4, 88, NULL, 80.3, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 7001, '2026-04-09', 'Волков Илья Алексеевич', 'Спорт-ЛАЭС', 'Ленинградская область', 7001, 28),
  (7096, 7024, (SELECT id FROM athletes WHERE last_name = 'Никитин' AND first_name = 'Даниил' AND middle_name = 'Алексеевич' AND birth_year = 1981 LIMIT 1), 5, 80, NULL, 80.8, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 7001, '2026-04-09', 'Никитин Даниил Алексеевич', 'РОО ФГС Псковской области', 'Псковская область', 7001, 28),
  (7097, 7024, (SELECT id FROM athletes WHERE last_name = 'Прокофьев' AND first_name = 'Алексей' AND middle_name = 'Михайлович' AND birth_year = 1985 LIMIT 1), 6, 62, NULL, 82.4, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 7001, '2026-04-09', 'Прокофьев Алексей Михайлович', 'Спорт-ЛАЭС', 'Ленинградская область', 7001, 28);

INSERT INTO result_reps (id, result_id, exercise, hand, reps) VALUES
  (7001, 7001, 'jerk', 'both', 60),
  (7002, 7002, 'jerk', 'both', 38),
  (7003, 7003, 'jerk', 'both', 46),
  (7004, 7004, 'jerk', 'both', 28),
  (7005, 7005, 'jerk', 'both', 0),
  (7006, 7006, 'jerk', 'both', 111),
  (7007, 7007, 'jerk', 'both', 33),
  (7008, 7008, 'jerk', 'both', 110),
  (7009, 7009, 'jerk', 'both', 60),
  (7010, 7010, 'jerk', 'both', 115),
  (7011, 7011, 'jerk', 'both', 82),
  (7012, 7012, 'jerk', 'both', 77),
  (7013, 7013, 'jerk', 'both', 127),
  (7014, 7014, 'jerk', 'both', 79),
  (7015, 7015, 'jerk', 'both', 66),
  (7016, 7016, 'jerk', 'both', 42),
  (7017, 7017, 'jerk', 'both', 124),
  (7018, 7018, 'jerk', 'both', 118),
  (7019, 7019, 'jerk', 'both', 25),
  (7020, 7020, 'jerk', 'both', 161),
  (7021, 7021, 'jerk', 'both', 60),
  (7022, 7022, 'jerk', 'both', 35),
  (7023, 7023, 'jerk', 'both', 25),
  (7024, 7024, 'jerk', 'both', 15),
  (7025, 7025, 'jerk', 'both', 111),
  (7026, 7026, 'jerk', 'both', 103),
  (7027, 7027, 'jerk', 'both', 93),
  (7028, 7028, 'jerk', 'both', 93),
  (7029, 7029, 'jerk', 'both', 25),
  (7030, 7030, 'long_cycle', 'both', 55),
  (7031, 7031, 'long_cycle', 'both', 53),
  (7032, 7032, 'long_cycle', 'both', 48),
  (7033, 7033, 'long_cycle', 'both', 42),
  (7034, 7034, 'long_cycle', 'both', 71),
  (7035, 7035, 'long_cycle', 'both', 50),
  (7036, 7036, 'long_cycle', 'both', 45),
  (7037, 7037, 'long_cycle', 'both', 36),
  (7038, 7038, 'long_cycle', 'both', 64),
  (7039, 7039, 'long_cycle', 'both', 59),
  (7040, 7040, 'long_cycle', 'both', 46),
  (7041, 7041, 'long_cycle', 'both', 44),
  (7042, 7042, 'long_cycle', 'both', 40),
  (7043, 7043, 'long_cycle', 'both', 38),
  (7044, 7044, 'long_cycle', 'both', 75),
  (7045, 7045, 'long_cycle', 'both', 55),
  (7046, 7046, 'long_cycle', 'both', 54),
  (7047, 7047, 'long_cycle', 'both', 44),
  (7048, 7048, 'long_cycle', 'both', 84),
  (7049, 7049, 'long_cycle', 'both', 69),
  (7050, 7050, 'long_cycle', 'both', 69),
  (7051, 7051, 'long_cycle', 'both', 68),
  (7052, 7052, 'long_cycle', 'both', 63),
  (7053, 7053, 'long_cycle', 'both', 56),
  (7054, 7054, 'long_cycle', 'both', 88),
  (7055, 7055, 'long_cycle', 'both', 50),
  (7056, 7056, 'long_cycle', 'both', 22),
  (7057, 7057, 'long_cycle', 'both', 19),
  (7058, 7058, 'long_cycle', 'both', 15),
  (7059, 7059, 'long_cycle', 'both', 12),
  (7060, 7060, 'long_cycle', 'both', 11),
  (7061, 7061, 'long_cycle', 'both', 46),
  (7062, 7062, 'long_cycle', 'both', 44),
  (7063, 7063, 'long_cycle', 'both', 36),
  (7064, 7064, 'long_cycle', 'both', 28),
  (7065, 7065, 'long_cycle', 'both', 27),
  (7066, 7066, 'long_cycle', 'both', 23),
  (7067, 7067, 'long_cycle', 'both', 26),
  (7068, 7068, 'long_cycle', 'both', 41),
  (7069, 7069, 'long_cycle', 'both', 37),
  (7070, 7070, 'long_cycle', 'both', 10),
  (7071, 7071, 'snatch', 'both', 176),
  (7072, 7072, 'snatch', 'both', 76),
  (7073, 7073, 'snatch', 'both', 55),
  (7074, 7074, 'snatch', 'both', 191),
  (7075, 7075, 'snatch', 'both', 184),
  (7076, 7076, 'snatch', 'both', 177),
  (7077, 7077, 'snatch', 'both', 112),
  (7078, 7078, 'snatch', 'both', 105),
  (7079, 7079, 'snatch', 'both', 66),
  (7080, 7080, 'snatch', 'both', 169),
  (7081, 7081, 'snatch', 'both', 85),
  (7082, 7082, 'snatch', 'both', 55),
  (7083, 7083, 'snatch', 'both', 159),
  (7084, 7084, 'snatch', 'both', 156),
  (7085, 7085, 'snatch', 'both', 150),
  (7086, 7086, 'snatch', 'both', 141),
  (7087, 7087, 'snatch', 'both', 132),
  (7088, 7088, 'snatch', 'both', 84),
  (7089, 7089, 'snatch', 'both', 78),
  (7090, 7090, 'snatch', 'both', 65),
  (7091, 7091, 'snatch', 'both', 51),
  (7092, 7092, 'snatch', 'both', 179),
  (7093, 7093, 'snatch', 'both', 170),
  (7094, 7094, 'snatch', 'both', 168),
  (7095, 7095, 'snatch', 'both', 88),
  (7096, 7096, 'snatch', 'both', 80),
  (7097, 7097, 'snatch', 'both', 62);

