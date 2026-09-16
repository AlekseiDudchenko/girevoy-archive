-- Чемпионат Приволжского федерального округа 2026, Оренбург, 2026-04-02—2026-04-05.
-- Сгенерировано scripts/gen_seed.py из data/chempionat-pfo-2026.json, не править руками.
-- Источник — скан официальных протоколов чемпионата Приволжского федерального округа 2026 (PDF без текстового слоя, страницы повёрнуты на 90°). ФИО с отчеством, дата рождения полная. Импорт ведётся по одной индивидуальной категории отдельным коммитом. Эстафеты (стр. 11–12), командный зачёт (стр. 36) и командные очки отдельных протоколов не импортируются. Жонглирование (стр. 35) не поддержано текущей схемой. Список судей (стр. 37) в модель импорта протоколов не входит.
-- Данные извлечены из протокола моделью; сверка человеком не проводилась,
-- поэтому results.verified_by остаётся пустым (FR-A14).

INSERT OR IGNORE INTO regions (name, country) VALUES
  ('Кировская область', 'RU'),
  ('Республика Татарстан', 'RU'),
  ('Пермский край', 'RU'),
  ('Оренбургская область', 'RU'),
  ('Республика Башкортостан', 'RU'),
  ('Чувашская Республика', 'RU'),
  ('Удмуртская область', 'RU'),
  ('Самарская область', 'RU'),
  ('Удмуртская Республика', 'RU'),
  ('Периский край', 'RU'),
  ('Республика Мордовия', 'RU');

INSERT OR IGNORE INTO clubs (name, region_id) VALUES
  ('КОГАУ "СШОР "Юность"', (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU')),
  ('МБОУ ДО СШ Татнефть Олимп', (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU')),
  ('Кит "на спорте"', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')),
  ('МАУ ДО СШ "Прикамье"', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')),
  ('СШ № 1 им Л.Д. Ковалевского', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')),
  ('Отдел образования г. Стерлитамак', (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU')),
  ('МАУ СШ "Свобода" г. Орск', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')),
  ('МБУ ДО "ДЮСШ "Спарт"', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')),
  ('МАУ ДО СШОР', (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU')),
  ('СШ Новорского р-на', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')),
  ('СШ Энергия', (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU')),
  ('-', (SELECT id FROM regions WHERE name = 'Удмуртская область' AND country = 'RU')),
  ('РО ООО "ВФГС" СО', (SELECT id FROM regions WHERE name = 'Самарская область' AND country = 'RU')),
  ('-', (SELECT id FROM regions WHERE name = 'Удмуртская Республика' AND country = 'RU')),
  ('СШ "Буревестник"', (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU')),
  ('ЦСР г. Мелеуз', (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU')),
  ('МБУ ДО "СШ" Сорочинского МО', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')),
  ('ДС СШ "Прикамье"', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')),
  ('МБУДО "СШ" Сорочинского МО', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')),
  ('МАУ ДО СШ "Чемпион"', (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU')),
  ('МАУ СШ "Свобода" г. Орска', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU')),
  ('МАУ ДО СШ "Прикамье"', (SELECT id FROM regions WHERE name = 'Периский край' AND country = 'RU')),
  ('ВФСО "Динамо"', (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU')),
  ('МБУ ДО Саракташского р-на', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')),
  ('МБУДО "Акбулаксая СШ"', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')),
  ('МБУ ДО ДЮСШ Чамзинского МО', (SELECT id FROM regions WHERE name = 'Республика Мордовия' AND country = 'RU')),
  ('-', (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU')),
  ('МБУ ДО "СШ" Красногвардейского МО', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')),
  ('РО ООО "ВФГС" в Кировской обл.', (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU')),
  ('МБУ ДО "Грачевская СШ"', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')),
  ('МАУ ДШ "Чемпион"', (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU')),
  ('-', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')),
  ('МБУДО"СШ" Сорочинского МО', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')),
  ('МБУ ДО СШ "Лидер" Слободского р-на', (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU'));

INSERT OR IGNORE INTO federations (name, short_name, country) VALUES
  ('Всероссийская федерация гиревого спорта', 'ВФГС', 'RU');

INSERT INTO competitions (id, slug, name, date_start, date_end, city, country, competition_rank_id, federation_id, source_url, is_published) VALUES
  (4001, 'chempionat-pfo-2026', 'Чемпионат Приволжского федерального округа 2026', '2026-04-02', '2026-04-05', 'Оренбург', 'RU', (SELECT id FROM competition_ranks WHERE code = 'federal_district'), (SELECT id FROM federations WHERE name = 'Всероссийская федерация гиревого спорта'), NULL, 1);

INSERT INTO protocols (id, competition_id, r2_key, filename, page_count, is_scan, status, published_at) VALUES
  (4001, 4001, 'protocols/chempionat-pfo-2026.pdf', 'Protokoly-PFO-2026.pdf', 37, 1, 'published', '2026-04-02');

INSERT INTO categories (id, competition_id, discipline_id, sex, age_group_id, division_id, bell_kg, hands, time_limit_min, weight_class_raw, weight_class_kg, weight_class_is_open, participants_declared, is_deferred, sort_order) VALUES
  (4001, 4001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '63', 63, 0, 2, 0, 1),
  (4002, 4001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '68+', 68, 1, 7, 0, 2),
  (4003, 4001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '63', 63, 0, 7, 0, 3),
  (4004, 4001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '68', 68, 0, 6, 0, 4),
  (4005, 4001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '73', 73, 0, 9, 0, 5),
  (4006, 4001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '78', 78, 0, 4, 0, 6),
  (4007, 4001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '85', 85, 0, 6, 0, 7),
  (4008, 4001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '95+', 95, 1, 3, 0, 8),
  (4009, 4001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '95', 95, 0, 5, 0, 9),
  (4010, 4001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '63', 63, 0, 1, 0, 10),
  (4011, 4001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '68+', 68, 1, 6, 0, 11),
  (4012, 4001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '63', 63, 0, 3, 0, 12),
  (4013, 4001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '68', 68, 0, 4, 0, 13),
  (4014, 4001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '73', 73, 0, 6, 0, 14),
  (4015, 4001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '78', 78, 0, 6, 0, 15),
  (4016, 4001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '85', 85, 0, 4, 0, 16),
  (4017, 4001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '95+', 95, 1, 2, 0, 17),
  (4018, 4001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '95', 95, 0, 4, 0, 18),
  (4019, 4001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'one', 10, '58', 58, 0, 10, 0, 19),
  (4020, 4001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'one', 10, '63', 63, 0, 5, 0, 20),
  (4021, 4001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'one', 10, '68+', 68, 1, 8, 0, 21),
  (4022, 4001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'one', 10, '68', 68, 0, 5, 0, 22),
  (4023, 4001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '63', 63, 0, 4, 0, 23),
  (4024, 4001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '68', 68, 0, 6, 0, 24),
  (4025, 4001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '73', 73, 0, 5, 0, 25),
  (4026, 4001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '78', 78, 0, 8, 0, 26),
  (4027, 4001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '85', 85, 0, 6, 0, 27),
  (4028, 4001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '95+', 95, 1, 8, 0, 28),
  (4029, 4001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '95', 95, 0, 7, 0, 29);

INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Матвеева', 'Елена', 'Евгеньевна', 1974, 'f', (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КОГАУ "СШОР "Юность"' AND region_id = (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU')), 'Малков Е.И.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Матвеева' AND a.first_name = 'Елена' AND a.middle_name = 'Евгеньевна' AND a.birth_year = 1974 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Пузанкова', 'Анастасия', 'Константиновна', 2006, 'f', (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБОУ ДО СШ Татнефть Олимп' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU')), 'Гиниатуллин А.З.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Пузанкова' AND a.first_name = 'Анастасия' AND a.middle_name = 'Константиновна' AND a.birth_year = 2006 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Филимонова', 'Карина', 'Денисовна', 2006, 'f', (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КОГАУ "СШОР "Юность"' AND region_id = (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU')), 'Малков Е.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Филимонова' AND a.first_name = 'Карина' AND a.middle_name = 'Денисовна' AND a.birth_year = 2006 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Попова', 'Мария', 'Алексеевна', 2005, 'f', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Кит "на спорте"' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Паклин П.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Попова' AND a.first_name = 'Мария' AND a.middle_name = 'Алексеевна' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Новикова', 'Полина', 'Феликсовна', 2012, 'f', (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КОГАУ "СШОР "Юность"' AND region_id = (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU')), 'Малков Е.И.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Новикова' AND a.first_name = 'Полина' AND a.middle_name = 'Феликсовна' AND a.birth_year = 2012 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Махкамова', 'Парвина', 'Маруфовна', 2007, 'f', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШ "Прикамье"' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Мошев Д.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Махкамова' AND a.first_name = 'Парвина' AND a.middle_name = 'Маруфовна' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кузьмичева', 'Ксения', 'Сергеевна', 2004, 'f', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ № 1 им Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Павлов С.П.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кузьмичева' AND a.first_name = 'Ксения' AND a.middle_name = 'Сергеевна' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Герцева', 'Ульяна', 'Денисовна', 2011, 'f', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ № 1 им Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Майоров М.А.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Герцева' AND a.first_name = 'Ульяна' AND a.middle_name = 'Денисовна' AND a.birth_year = 2011 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Хасанова', 'Алсу', 'Саматовна', 1995, 'f', (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Отдел образования г. Стерлитамак' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU')), 'Хасанов Р.Ф.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Хасанова' AND a.first_name = 'Алсу' AND a.middle_name = 'Саматовна' AND a.birth_year = 1995 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Сиразетдинов', 'Данил', 'Ильфатович', 2007, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШ "Прикамье"' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Мошев Д.И., Ческис О.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Сиразетдинов' AND a.first_name = 'Данил' AND a.middle_name = 'Ильфатович' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бервин', 'Матвей', 'Витальевич', 2010, 'm', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ СШ "Свобода" г. Орск' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Пуякин А.П.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бервин' AND a.first_name = 'Матвей' AND a.middle_name = 'Витальевич' AND a.birth_year = 2010 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Утев', 'Руслан', 'Андреевич', 2005, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО "ДЮСШ "Спарт"' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Мошев Д.И., Маматов Г.Т.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Утев' AND a.first_name = 'Руслан' AND a.middle_name = 'Андреевич' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Старков', 'Георгий', 'Альбертович', 2007, 'm', (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШОР' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU')), 'Гладких В.Л.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Старков' AND a.first_name = 'Георгий' AND a.middle_name = 'Альбертович' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кылосов', 'Владимир', 'Андреевич', 2008, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО "ДЮСШ "Спарт"' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Маматов Г.Т.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кылосов' AND a.first_name = 'Владимир' AND a.middle_name = 'Андреевич' AND a.birth_year = 2008 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Митюкевич', 'Станислав', 'Николаевич', 2008, 'm', (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШОР' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU')), 'Гладких В.Л.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Митюкевич' AND a.first_name = 'Станислав' AND a.middle_name = 'Николаевич' AND a.birth_year = 2008 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Токарев', 'Артем', 'Дмитриевич', 2009, 'm', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ Новорского р-на' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Токарев Д.П.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Токарев' AND a.first_name = 'Артем' AND a.middle_name = 'Дмитриевич' AND a.birth_year = 2009 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Узюкин', 'Анатолий', 'Эдуардович', 2000, 'm', (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ Энергия' AND region_id = (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU')), 'Глинкин Б.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Узюкин' AND a.first_name = 'Анатолий' AND a.middle_name = 'Эдуардович' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Громов', 'Алексей', 'Николаевич', 1995, 'm', (SELECT id FROM regions WHERE name = 'Удмуртская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'Удмуртская область' AND country = 'RU')), 'Шиляев И.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Громов' AND a.first_name = 'Алексей' AND a.middle_name = 'Николаевич' AND a.birth_year = 1995 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Лучинин', 'Илья', 'Михайлович', 2008, 'm', (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КОГАУ "СШОР "Юность"' AND region_id = (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU')), 'Малков Е.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Лучинин' AND a.first_name = 'Илья' AND a.middle_name = 'Михайлович' AND a.birth_year = 2008 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Киякин', 'Александр', 'Александрович', 2001, 'm', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ № 1 им Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Павлов С.П.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Киякин' AND a.first_name = 'Александр' AND a.middle_name = 'Александрович' AND a.birth_year = 2001 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Сафаргалин', 'Рамазан', 'Марселевич', 2007, 'm', (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШОР' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU')), 'Гладких В.Л.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Сафаргалин' AND a.first_name = 'Рамазан' AND a.middle_name = 'Марселевич' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Мелюхин', 'Кирилл', 'Александрович', 2011, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО "ДЮСШ "Спарт"' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Маматов Г.Т.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Мелюхин' AND a.first_name = 'Кирилл' AND a.middle_name = 'Александрович' AND a.birth_year = 2011 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Балдин', 'Александр', 'Васильевич', 1993, 'm', (SELECT id FROM regions WHERE name = 'Самарская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО "ВФГС" СО' AND region_id = (SELECT id FROM regions WHERE name = 'Самарская область' AND country = 'RU')), 'Бахтов И.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Балдин' AND a.first_name = 'Александр' AND a.middle_name = 'Васильевич' AND a.birth_year = 1993 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Гарифуллин', 'Константин', 'Фардатович', 1999, 'm', (SELECT id FROM regions WHERE name = 'Удмуртская Республика' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'Удмуртская Республика' AND country = 'RU')), 'Шиляев И.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Гарифуллин' AND a.first_name = 'Константин' AND a.middle_name = 'Фардатович' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Попов', 'Кирилл', 'Максимович', 2008, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО "ДЮСШ "Спарт"' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Маматов Г.Т.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Попов' AND a.first_name = 'Кирилл' AND a.middle_name = 'Максимович' AND a.birth_year = 2008 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Гареев', 'Денис', 'Александрович', 2005, 'm', (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ "Буревестник"' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU')), 'Минибаев Р.М.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Гареев' AND a.first_name = 'Денис' AND a.middle_name = 'Александрович' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Хвалев', 'Кирилл', 'Александрович', 1998, 'm', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ № 1 им Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Лавринов В.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Хвалев' AND a.first_name = 'Кирилл' AND a.middle_name = 'Александрович' AND a.birth_year = 1998 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Сычёв', 'Алексей', 'Андреевич', 2006, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШ "Прикамье"' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Мошев Д.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Сычёв' AND a.first_name = 'Алексей' AND a.middle_name = 'Андреевич' AND a.birth_year = 2006 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Янгуатов', 'Вячеслав', 'Эдуардович', 2005, 'm', (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ "Буревестник"' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU')), 'Минибаев Р.М.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Янгуатов' AND a.first_name = 'Вячеслав' AND a.middle_name = 'Эдуардович' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ярусов', 'Константин', 'Леонидович', 2006, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО "ДЮСШ "Спарт"' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Маматов Г.Т.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ярусов' AND a.first_name = 'Константин' AND a.middle_name = 'Леонидович' AND a.birth_year = 2006 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Шишков', 'Игорь', 'Викторович', 2010, 'm', (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ЦСР г. Мелеуз' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU')), 'Исаков В.Н., Хусаинов Р.М.', (SELECT id FROM sport_ranks WHERE code = 'ii')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Шишков' AND a.first_name = 'Игорь' AND a.middle_name = 'Викторович' AND a.birth_year = 2010 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Порцев', 'Роман', 'Геннадьевич', 1987, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШ "Прикамье"' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Мошев Д.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Порцев' AND a.first_name = 'Роман' AND a.middle_name = 'Геннадьевич' AND a.birth_year = 1987 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Герцев', 'Артем', 'Николаевич', 2010, 'm', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО "СШ" Сорочинского МО' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Майоров М.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Герцев' AND a.first_name = 'Артем' AND a.middle_name = 'Николаевич' AND a.birth_year = 2010 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Свотин', 'Алексей', 'Юрьевич', 1997, 'm', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ № 1 им Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Лавринов В.А.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Свотин' AND a.first_name = 'Алексей' AND a.middle_name = 'Юрьевич' AND a.birth_year = 1997 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Рудаков', 'Никита', 'Евгеньевич', 2008, 'm', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ № 1 им Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Павлов С.П.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Рудаков' AND a.first_name = 'Никита' AND a.middle_name = 'Евгеньевич' AND a.birth_year = 2008 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Маликов', 'Данил', 'Дамирович', 2001, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ДС СШ "Прикамье"' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Мошев Д.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Маликов' AND a.first_name = 'Данил' AND a.middle_name = 'Дамирович' AND a.birth_year = 2001 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Пешков', 'Виталий', 'Юрьевич', 1998, 'm', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ № 1 им Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Лавринов В.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Пешков' AND a.first_name = 'Виталий' AND a.middle_name = 'Юрьевич' AND a.birth_year = 1998 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Салихов', 'Рустам', 'Ренатович', 1982, 'm', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ № 1 им Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Фунтиков Н.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Салихов' AND a.first_name = 'Рустам' AND a.middle_name = 'Ренатович' AND a.birth_year = 1982 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Акульшин', 'Алексей', 'Сергеевич', 1994, 'm', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ № 1 им Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Лавринов В.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Акульшин' AND a.first_name = 'Алексей' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1994 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Миллер', 'Максим', 'Сергеевич', 2007, 'm', (SELECT id FROM regions WHERE name = 'Самарская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО "ВФГС" СО' AND region_id = (SELECT id FROM regions WHERE name = 'Самарская область' AND country = 'RU')), 'Федоссев А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Миллер' AND a.first_name = 'Максим' AND a.middle_name = 'Сергеевич' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Файзулин', 'Данис', 'Марсэлевич', 2012, 'm', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУДО "СШ" Сорочинского МО' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Майоров М.А.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Файзулин' AND a.first_name = 'Данис' AND a.middle_name = 'Марсэлевич' AND a.birth_year = 2012 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Соболев', 'Никита', 'Александрович', 2006, 'm', (SELECT id FROM regions WHERE name = 'Удмуртская Республика' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'Удмуртская Республика' AND country = 'RU')), 'Веретенников С.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Соболев' AND a.first_name = 'Никита' AND a.middle_name = 'Александрович' AND a.birth_year = 2006 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Усатов', 'Николай', 'Владимирович', 1988, 'm', (SELECT id FROM regions WHERE name = 'Самарская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО "ВФГС" СО' AND region_id = (SELECT id FROM regions WHERE name = 'Самарская область' AND country = 'RU')), 'Балдин А.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Усатов' AND a.first_name = 'Николай' AND a.middle_name = 'Владимирович' AND a.birth_year = 1988 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Казаков', 'Сергей', 'Денисович', 2007, 'm', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ № 1 им Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Павлов С.П., Фунтиков Н.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Казаков' AND a.first_name = 'Сергей' AND a.middle_name = 'Денисович' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Иванов', 'Александр', 'Сергеевич', 2008, 'm', (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШ "Чемпион"' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU')), 'Абзалова И.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Иванов' AND a.first_name = 'Александр' AND a.middle_name = 'Сергеевич' AND a.birth_year = 2008 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Заварзин', 'Павел', 'Александрович', 2000, 'm', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ № 1 им Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Павлов С.П., Лавринов В.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Заварзин' AND a.first_name = 'Павел' AND a.middle_name = 'Александрович' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Зуев', 'Илья', 'Александрович', 2007, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШ "Прикамье"' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Мошев Д.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Зуев' AND a.first_name = 'Илья' AND a.middle_name = 'Александрович' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кодиров', 'Абдумаъруф', 'Абдукодирович', 2000, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ДС СШ "Прикамье"' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Мошев Д.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кодиров' AND a.first_name = 'Абдумаъруф' AND a.middle_name = 'Абдукодирович' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Головин', 'Кирилл', 'Денисович', 2006, 'm', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ № 1 им Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Курунов А.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Головин' AND a.first_name = 'Кирилл' AND a.middle_name = 'Денисович' AND a.birth_year = 2006 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Мангул', 'Никита', 'Алексеевич', 2007, 'm', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ СШ "Свобода" г. Орска' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Пуякин А.П.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Мангул' AND a.first_name = 'Никита' AND a.middle_name = 'Алексеевич' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Орлов', 'Максим', 'Вадимович', 2007, 'm', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ СШ "Свобода" г. Орска' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Пуякин А.П.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Орлов' AND a.first_name = 'Максим' AND a.middle_name = 'Вадимович' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Новоселов', 'Андрей', 'Евгеньевич', 2004, 'm', (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КОГАУ "СШОР "Юность"' AND region_id = (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU')), 'Малков Е.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Новоселов' AND a.first_name = 'Андрей' AND a.middle_name = 'Евгеньевич' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Шамкаев', 'Радик', 'Мусаевич', 1990, 'm', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ № 1 им Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Лавринов В.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Шамкаев' AND a.first_name = 'Радик' AND a.middle_name = 'Мусаевич' AND a.birth_year = 1990 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Попов', 'Кирилл', 'Александрович', 2008, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО "ДЮСШ "Спарт"' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Маматов Г.Т.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Попов' AND a.first_name = 'Кирилл' AND a.middle_name = 'Александрович' AND a.birth_year = 2008 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Маймаков', 'Кадыр', 'Миратович', 2009, 'm', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ Новорского р-на' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Токарев Д.П.', (SELECT id FROM sport_ranks WHERE code = 'ii')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Маймаков' AND a.first_name = 'Кадыр' AND a.middle_name = 'Миратович' AND a.birth_year = 2009 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ляукин', 'Кирилл', 'Сергеевич', 1999, 'm', (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU')), 'Низамова А.А., Трофимов М.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ляукин' AND a.first_name = 'Кирилл' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Петухов', 'Алексей', 'Петрович', 2003, 'm', (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ Энергия' AND region_id = (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU')), 'Глинкин Б.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Петухов' AND a.first_name = 'Алексей' AND a.middle_name = 'Петрович' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Углов', 'Никита', 'Константинович', 2008, 'm', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ СШ "Свобода" г. Орска' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Пуякин А.П.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Углов' AND a.first_name = 'Никита' AND a.middle_name = 'Константинович' AND a.birth_year = 2008 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Хасанов', 'Рустам', 'Фаридович', 1980, 'm', (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВФСО "Динамо"' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU')), 'Лавринов В.А., Квашнин М.Ф.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Хасанов' AND a.first_name = 'Рустам' AND a.middle_name = 'Фаридович' AND a.birth_year = 1980 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Добровольский', 'Павел', 'Иванович', 2009, 'm', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ СШ "Свобода" г. Орск' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Медведев А.А.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Добровольский' AND a.first_name = 'Павел' AND a.middle_name = 'Иванович' AND a.birth_year = 2009 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Нурсафин', 'Денис', 'Рафаэльевич', 1990, 'm', (SELECT id FROM regions WHERE name = 'Самарская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО "ВФГС" СО' AND region_id = (SELECT id FROM regions WHERE name = 'Самарская область' AND country = 'RU')), 'Бахтова И.И.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Нурсафин' AND a.first_name = 'Денис' AND a.middle_name = 'Рафаэльевич' AND a.birth_year = 1990 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Константинов', 'Александр', 'Иванович', 2007, 'm', (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ Энергия' AND region_id = (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU')), 'Глинкин Б.Н., Иванов А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Константинов' AND a.first_name = 'Александр' AND a.middle_name = 'Иванович' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Михайлов', 'Денис', 'Витальевич', 1987, 'm', (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ Энергия' AND region_id = (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU')), 'Гликин Б.Н., Родин Е.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Михайлов' AND a.first_name = 'Денис' AND a.middle_name = 'Витальевич' AND a.birth_year = 1987 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кожеватова', 'Василиса', 'Егоровна', 2002, 'f', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ № 1 им Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Павлов С.П.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кожеватова' AND a.first_name = 'Василиса' AND a.middle_name = 'Егоровна' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Юлусова', 'Вероника', 'Николаевна', 2009, 'f', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ № 1 им Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Ерохин А.В., Фунтиков Н.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Юлусова' AND a.first_name = 'Вероника' AND a.middle_name = 'Николаевна' AND a.birth_year = 2009 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Лилуашвили', 'Виктория', 'Важаевна', 2010, 'f', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУДО "СШ" Сорочинского МО' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Фирябников А.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Лилуашвили' AND a.first_name = 'Виктория' AND a.middle_name = 'Важаевна' AND a.birth_year = 2010 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бурлина', 'Алена', 'Викторовна', 2010, 'f', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО Саракташского р-на' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Поляничко В.А.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бурлина' AND a.first_name = 'Алена' AND a.middle_name = 'Викторовна' AND a.birth_year = 2010 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бубенцова', 'Софья', 'Алексеевна', 2009, 'f', (SELECT id FROM regions WHERE name = 'Самарская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО "ВФГС" СО' AND region_id = (SELECT id FROM regions WHERE name = 'Самарская область' AND country = 'RU')), 'Балдин А.В.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бубенцова' AND a.first_name = 'Софья' AND a.middle_name = 'Алексеевна' AND a.birth_year = 2009 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ковалева', 'Милена', 'Витальевна', 2012, 'f', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУДО "Акбулаксая СШ"' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Нилов М.Г.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ковалева' AND a.first_name = 'Милена' AND a.middle_name = 'Витальевна' AND a.birth_year = 2012 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Уварова', 'Нелли', 'Валерьевна', 2009, 'f', (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ "Буревестник"' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU')), 'Минибаев Р.М.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Уварова' AND a.first_name = 'Нелли' AND a.middle_name = 'Валерьевна' AND a.birth_year = 2009 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Карбовская', 'Ангелина', 'Юрьевна', 2010, 'f', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУДО "Акбулаксая СШ"' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Нилов М.Г.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Карбовская' AND a.first_name = 'Ангелина' AND a.middle_name = 'Юрьевна' AND a.birth_year = 2010 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Симдянова', 'София', 'Михайловна', 2006, 'f', (SELECT id FROM regions WHERE name = 'Республика Мордовия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО ДЮСШ Чамзинского МО' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Мордовия' AND country = 'RU')), 'Симдянов М.В.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Симдянова' AND a.first_name = 'София' AND a.middle_name = 'Михайловна' AND a.birth_year = 2006 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Дмитриева', 'Софья', 'Александровна', 2008, 'f', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ СШ "Свобода" г. Орска' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Пуякин А.П.', (SELECT id FROM sport_ranks WHERE code = 'ii')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Дмитриева' AND a.first_name = 'Софья' AND a.middle_name = 'Александровна' AND a.birth_year = 2008 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бурмакина', 'Екатерина', 'Сергеевна', 2005, 'f', (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU')), 'Трофимов М.А., Гиниатуллин А.З.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бурмакина' AND a.first_name = 'Екатерина' AND a.middle_name = 'Сергеевна' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Воронова', 'Наталья', 'Александровна', 2006, 'f', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ № 1 им Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Курунов А.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Воронова' AND a.first_name = 'Наталья' AND a.middle_name = 'Александровна' AND a.birth_year = 2006 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Малюшина', 'Мария', 'Алексеевна', 2009, 'f', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУДО "СШ" Сорочинского МО' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Калугин В.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Малюшина' AND a.first_name = 'Мария' AND a.middle_name = 'Алексеевна' AND a.birth_year = 2009 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Козлова', 'Ирина', 'Дмитриевна', 2006, 'f', (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ "Буревестник"' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU')), 'Миннибаев Р.М.', (SELECT id FROM sport_ranks WHERE code = 'ii')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Козлова' AND a.first_name = 'Ирина' AND a.middle_name = 'Дмитриевна' AND a.birth_year = 2006 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Дубовик', 'Светлана', 'Сергеевна', 2009, 'f', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО "СШ" Красногвардейского МО' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Гончаров Ю.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Дубовик' AND a.first_name = 'Светлана' AND a.middle_name = 'Сергеевна' AND a.birth_year = 2009 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Черезова', 'Александра', 'Дмитриевна', 2011, 'f', (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КОГАУ "СШОР "Юность"' AND region_id = (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU')), 'Малков Е.И.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Черезова' AND a.first_name = 'Александра' AND a.middle_name = 'Дмитриевна' AND a.birth_year = 2011 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Калугина', 'Ирина', 'Вячеславовна', 2008, 'f', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ № 1 им Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Калугин В.Н., Фунтиков Н.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Калугина' AND a.first_name = 'Ирина' AND a.middle_name = 'Вячеславовна' AND a.birth_year = 2008 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Плечова', 'Карина', 'Юрьевна', 2007, 'f', (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ Энергия' AND region_id = (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU')), 'Глинкин Б.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Плечова' AND a.first_name = 'Карина' AND a.middle_name = 'Юрьевна' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кузьмичева', 'Екатерина', 'Сергеевна', 2004, 'f', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ № 1 им Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Павлов С.П.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кузьмичева' AND a.first_name = 'Екатерина' AND a.middle_name = 'Сергеевна' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Имаева', 'Гузель', 'Мунировна', 2004, 'f', (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ "Буревестник"' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU')), 'Миинибаев Р.М.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Имаева' AND a.first_name = 'Гузель' AND a.middle_name = 'Мунировна' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Морогина', 'Наталья', 'Леонидовна', 1972, 'f', (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО "ВФГС" в Кировской обл.' AND region_id = (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU')), 'Царегородцев Д.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Морогина' AND a.first_name = 'Наталья' AND a.middle_name = 'Леонидовна' AND a.birth_year = 1972 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Лавринов', 'Валерий', 'Александрович', 1980, 'm', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ № 1 им Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Вдовкин А.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Лавринов' AND a.first_name = 'Валерий' AND a.middle_name = 'Александрович' AND a.birth_year = 1980 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Половников', 'Павел', 'Викторович', 2002, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО "ДЮСШ "Спарт"' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Маматов Г.Т.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Половников' AND a.first_name = 'Павел' AND a.middle_name = 'Викторович' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Афанасьев', 'Даниил', 'Петрович', 2009, 'm', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО "Грачевская СШ"' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Матвеев Ю.А.', (SELECT id FROM sport_ranks WHERE code = 'ii')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Афанасьев' AND a.first_name = 'Даниил' AND a.middle_name = 'Петрович' AND a.birth_year = 2009 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Цюпко', 'Егор', 'Александрович', 2007, 'm', (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДШ "Чемпион"' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU')), 'Абзалова И.В., Абзалов В.М.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Цюпко' AND a.first_name = 'Егор' AND a.middle_name = 'Александрович' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Башаров', 'Ислам', 'Нурисламович', 2007, 'm', (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU')), 'Федоров В.Н., Башаров Н.М.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Башаров' AND a.first_name = 'Ислам' AND a.middle_name = 'Нурисламович' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Башаров', 'Арыслан', 'Нурисламович', 2007, 'm', (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU')), 'Федоров В.Н., Башаров Н.М.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Башаров' AND a.first_name = 'Арыслан' AND a.middle_name = 'Нурисламович' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Паклин', 'Павел', 'Алексеевич', 1990, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШ "Прикамье"' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Мошев Д.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Паклин' AND a.first_name = 'Павел' AND a.middle_name = 'Алексеевич' AND a.birth_year = 1990 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ермаков', 'Игорь', 'Анатольевич', 1992, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШ "Прикамье"' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Мошев Д.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ермаков' AND a.first_name = 'Игорь' AND a.middle_name = 'Анатольевич' AND a.birth_year = 1992 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Алексеев', 'Радиф', 'Дамирович', 1989, 'm', (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ Энергия' AND region_id = (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU')), 'Глинкин Б.Н., Бронюков Ю.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Алексеев' AND a.first_name = 'Радиф' AND a.middle_name = 'Дамирович' AND a.birth_year = 1989 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Третьяков', 'Владислав', 'Владимирович', 1989, 'm', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ № 1 им Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Павлов С.П.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Третьяков' AND a.first_name = 'Владислав' AND a.middle_name = 'Владимирович' AND a.birth_year = 1989 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бурков', 'Юрий', 'Михайлович', 1987, 'm', (SELECT id FROM regions WHERE name = 'Удмуртская Республика' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'Удмуртская Республика' AND country = 'RU')), 'Шиляев И.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бурков' AND a.first_name = 'Юрий' AND a.middle_name = 'Михайлович' AND a.birth_year = 1987 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Хайбуллин', 'Разяп', 'Ринатович', 2007, 'm', (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU')), 'Куршев А.В.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Хайбуллин' AND a.first_name = 'Разяп' AND a.middle_name = 'Ринатович' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Гоцко', 'Роман', 'Иванович', 2006, 'm', (SELECT id FROM regions WHERE name = 'Удмуртская Республика' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'Удмуртская Республика' AND country = 'RU')), 'Шиляев И.Н.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Гоцко' AND a.first_name = 'Роман' AND a.middle_name = 'Иванович' AND a.birth_year = 2006 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Крестьянинов', 'Виктор', 'Александрович', 2000, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШ "Прикамье"' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Мошев Д.И., Панфилов Г.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Крестьянинов' AND a.first_name = 'Виктор' AND a.middle_name = 'Александрович' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бахтов', 'Илья', 'Владимирович', 1989, 'm', (SELECT id FROM regions WHERE name = 'Самарская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО "ВФГС" СО' AND region_id = (SELECT id FROM regions WHERE name = 'Самарская область' AND country = 'RU')), 'Балдин А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бахтов' AND a.first_name = 'Илья' AND a.middle_name = 'Владимирович' AND a.birth_year = 1989 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Волошин', 'Валентин', 'Иванович', 2007, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШ "Прикамье"' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Мошев Д.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Волошин' AND a.first_name = 'Валентин' AND a.middle_name = 'Иванович' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Павлов', 'Александр', 'Станиславович', 1994, 'm', (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ Энергия' AND region_id = (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU')), 'Глинкин Б.Н.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Павлов' AND a.first_name = 'Александр' AND a.middle_name = 'Станиславович' AND a.birth_year = 1994 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Булагасов', 'Эдуард', 'Олегович', 1991, 'm', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ № 1 им Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'самостоятельно', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Булагасов' AND a.first_name = 'Эдуард' AND a.middle_name = 'Олегович' AND a.birth_year = 1991 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Царегородцев', 'Дмитрий', 'Владимирович', 1981, 'm', (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ "Лидер" Слободского р-на' AND region_id = (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU')), 'самостоятельно', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Царегородцев' AND a.first_name = 'Дмитрий' AND a.middle_name = 'Владимирович' AND a.birth_year = 1981 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Константинов', 'Александр', 'Иванович', 2003, 'm', (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ Энергия' AND region_id = (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU')), 'Глинкин Б.Н., Иванов А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Константинов' AND a.first_name = 'Александр' AND a.middle_name = 'Иванович' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кукжанов', 'Дияс', 'Канатович', 2007, 'm', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ № 1 им Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Фунтиков Н.Н.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кукжанов' AND a.first_name = 'Дияс' AND a.middle_name = 'Канатович' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ляпин', 'Кирилл', 'Алексеевич', 2009, 'm', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ № 1 им Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Вилиев Э. М.', (SELECT id FROM sport_ranks WHERE code = 'ii')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ляпин' AND a.first_name = 'Кирилл' AND a.middle_name = 'Алексеевич' AND a.birth_year = 2009 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Носков', 'Андрей', 'Николаевич', 1993, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШ "Прикамье"' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Мошев Д.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Носков' AND a.first_name = 'Андрей' AND a.middle_name = 'Николаевич' AND a.birth_year = 1993 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Башаров', 'Нурислам', 'Максумович', 1983, 'm', (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU')), 'Федоров В.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Башаров' AND a.first_name = 'Нурислам' AND a.middle_name = 'Максумович' AND a.birth_year = 1983 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кабанов', 'Ринат', 'Камилович', 1994, 'm', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ № 1 им Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Лавринов В.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кабанов' AND a.first_name = 'Ринат' AND a.middle_name = 'Камилович' AND a.birth_year = 1994 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Пирожников', 'Александр', 'Андреевич', 1987, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ДС СШ "Прикамье"' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Мошев Д.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Пирожников' AND a.first_name = 'Александр' AND a.middle_name = 'Андреевич' AND a.birth_year = 1987 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ипатов', 'Евгений', 'Николаевич', 1994, 'm', (SELECT id FROM regions WHERE name = 'Удмуртская Республика' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'Удмуртская Республика' AND country = 'RU')), 'Несмелов В.А., Шиляев И.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ипатов' AND a.first_name = 'Евгений' AND a.middle_name = 'Николаевич' AND a.birth_year = 1994 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Симдянов', 'Михаил', 'Владимирович', 1981, 'm', (SELECT id FROM regions WHERE name = 'Республика Мордовия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО ДЮСШ Чамзинского МО' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Мордовия' AND country = 'RU')), 'самостоятельно', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Симдянов' AND a.first_name = 'Михаил' AND a.middle_name = 'Владимирович' AND a.birth_year = 1981 LIMIT 1);

INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'matveeva-elena-1974' AND s.athlete_id <> a.id)
              THEN 'matveeva-elena-1974-' || a.id ELSE 'matveeva-elena-1974' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Матвеева' AND first_name = 'Елена' AND middle_name = 'Евгеньевна' AND birth_year = 1974 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'puzankova-anastasiya-2006' AND s.athlete_id <> a.id)
              THEN 'puzankova-anastasiya-2006-' || a.id ELSE 'puzankova-anastasiya-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Пузанкова' AND first_name = 'Анастасия' AND middle_name = 'Константиновна' AND birth_year = 2006 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'filimonova-karina-2006' AND s.athlete_id <> a.id)
              THEN 'filimonova-karina-2006-' || a.id ELSE 'filimonova-karina-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Филимонова' AND first_name = 'Карина' AND middle_name = 'Денисовна' AND birth_year = 2006 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'popova-mariya-2005' AND s.athlete_id <> a.id)
              THEN 'popova-mariya-2005-' || a.id ELSE 'popova-mariya-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Попова' AND first_name = 'Мария' AND middle_name = 'Алексеевна' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'novikova-polina-2012' AND s.athlete_id <> a.id)
              THEN 'novikova-polina-2012-' || a.id ELSE 'novikova-polina-2012' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Новикова' AND first_name = 'Полина' AND middle_name = 'Феликсовна' AND birth_year = 2012 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'mahkamova-parvina-2007' AND s.athlete_id <> a.id)
              THEN 'mahkamova-parvina-2007-' || a.id ELSE 'mahkamova-parvina-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Махкамова' AND first_name = 'Парвина' AND middle_name = 'Маруфовна' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kuzmicheva-kseniya-2004' AND s.athlete_id <> a.id)
              THEN 'kuzmicheva-kseniya-2004-' || a.id ELSE 'kuzmicheva-kseniya-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кузьмичева' AND first_name = 'Ксения' AND middle_name = 'Сергеевна' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'gerceva-ulyana-2011' AND s.athlete_id <> a.id)
              THEN 'gerceva-ulyana-2011-' || a.id ELSE 'gerceva-ulyana-2011' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Герцева' AND first_name = 'Ульяна' AND middle_name = 'Денисовна' AND birth_year = 2011 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'hasanova-alsu-1995' AND s.athlete_id <> a.id)
              THEN 'hasanova-alsu-1995-' || a.id ELSE 'hasanova-alsu-1995' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Хасанова' AND first_name = 'Алсу' AND middle_name = 'Саматовна' AND birth_year = 1995 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sirazetdinov-danil-2007' AND s.athlete_id <> a.id)
              THEN 'sirazetdinov-danil-2007-' || a.id ELSE 'sirazetdinov-danil-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Сиразетдинов' AND first_name = 'Данил' AND middle_name = 'Ильфатович' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'bervin-matvey-2010' AND s.athlete_id <> a.id)
              THEN 'bervin-matvey-2010-' || a.id ELSE 'bervin-matvey-2010' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бервин' AND first_name = 'Матвей' AND middle_name = 'Витальевич' AND birth_year = 2010 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'utev-ruslan-2005' AND s.athlete_id <> a.id)
              THEN 'utev-ruslan-2005-' || a.id ELSE 'utev-ruslan-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Утев' AND first_name = 'Руслан' AND middle_name = 'Андреевич' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'starkov-georgiy-2007' AND s.athlete_id <> a.id)
              THEN 'starkov-georgiy-2007-' || a.id ELSE 'starkov-georgiy-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Старков' AND first_name = 'Георгий' AND middle_name = 'Альбертович' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kylosov-vladimir-2008' AND s.athlete_id <> a.id)
              THEN 'kylosov-vladimir-2008-' || a.id ELSE 'kylosov-vladimir-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кылосов' AND first_name = 'Владимир' AND middle_name = 'Андреевич' AND birth_year = 2008 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'mityukevich-stanislav-2008' AND s.athlete_id <> a.id)
              THEN 'mityukevich-stanislav-2008-' || a.id ELSE 'mityukevich-stanislav-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Митюкевич' AND first_name = 'Станислав' AND middle_name = 'Николаевич' AND birth_year = 2008 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'tokarev-artem-2009' AND s.athlete_id <> a.id)
              THEN 'tokarev-artem-2009-' || a.id ELSE 'tokarev-artem-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Токарев' AND first_name = 'Артем' AND middle_name = 'Дмитриевич' AND birth_year = 2009 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'uzyukin-anatoliy-2000' AND s.athlete_id <> a.id)
              THEN 'uzyukin-anatoliy-2000-' || a.id ELSE 'uzyukin-anatoliy-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Узюкин' AND first_name = 'Анатолий' AND middle_name = 'Эдуардович' AND birth_year = 2000 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'gromov-aleksey-1995' AND s.athlete_id <> a.id)
              THEN 'gromov-aleksey-1995-' || a.id ELSE 'gromov-aleksey-1995' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Громов' AND first_name = 'Алексей' AND middle_name = 'Николаевич' AND birth_year = 1995 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'luchinin-ilya-2008' AND s.athlete_id <> a.id)
              THEN 'luchinin-ilya-2008-' || a.id ELSE 'luchinin-ilya-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Лучинин' AND first_name = 'Илья' AND middle_name = 'Михайлович' AND birth_year = 2008 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kiyakin-aleksandr-2001' AND s.athlete_id <> a.id)
              THEN 'kiyakin-aleksandr-2001-' || a.id ELSE 'kiyakin-aleksandr-2001' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Киякин' AND first_name = 'Александр' AND middle_name = 'Александрович' AND birth_year = 2001 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'safargalin-ramazan-2007' AND s.athlete_id <> a.id)
              THEN 'safargalin-ramazan-2007-' || a.id ELSE 'safargalin-ramazan-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Сафаргалин' AND first_name = 'Рамазан' AND middle_name = 'Марселевич' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'melyuhin-kirill-2011' AND s.athlete_id <> a.id)
              THEN 'melyuhin-kirill-2011-' || a.id ELSE 'melyuhin-kirill-2011' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Мелюхин' AND first_name = 'Кирилл' AND middle_name = 'Александрович' AND birth_year = 2011 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'baldin-aleksandr-1993' AND s.athlete_id <> a.id)
              THEN 'baldin-aleksandr-1993-' || a.id ELSE 'baldin-aleksandr-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Балдин' AND first_name = 'Александр' AND middle_name = 'Васильевич' AND birth_year = 1993 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'garifullin-konstantin-1999' AND s.athlete_id <> a.id)
              THEN 'garifullin-konstantin-1999-' || a.id ELSE 'garifullin-konstantin-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Гарифуллин' AND first_name = 'Константин' AND middle_name = 'Фардатович' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'popov-kirill-2008' AND s.athlete_id <> a.id)
              THEN 'popov-kirill-2008-' || a.id ELSE 'popov-kirill-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Попов' AND first_name = 'Кирилл' AND middle_name = 'Максимович' AND birth_year = 2008 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'gareev-denis-2005' AND s.athlete_id <> a.id)
              THEN 'gareev-denis-2005-' || a.id ELSE 'gareev-denis-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Гареев' AND first_name = 'Денис' AND middle_name = 'Александрович' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'hvalev-kirill-1998' AND s.athlete_id <> a.id)
              THEN 'hvalev-kirill-1998-' || a.id ELSE 'hvalev-kirill-1998' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Хвалев' AND first_name = 'Кирилл' AND middle_name = 'Александрович' AND birth_year = 1998 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sychev-aleksey-2006' AND s.athlete_id <> a.id)
              THEN 'sychev-aleksey-2006-' || a.id ELSE 'sychev-aleksey-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Сычёв' AND first_name = 'Алексей' AND middle_name = 'Андреевич' AND birth_year = 2006 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'yanguatov-vyacheslav-2005' AND s.athlete_id <> a.id)
              THEN 'yanguatov-vyacheslav-2005-' || a.id ELSE 'yanguatov-vyacheslav-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Янгуатов' AND first_name = 'Вячеслав' AND middle_name = 'Эдуардович' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'yarusov-konstantin-2006' AND s.athlete_id <> a.id)
              THEN 'yarusov-konstantin-2006-' || a.id ELSE 'yarusov-konstantin-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ярусов' AND first_name = 'Константин' AND middle_name = 'Леонидович' AND birth_year = 2006 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'shishkov-igor-2010' AND s.athlete_id <> a.id)
              THEN 'shishkov-igor-2010-' || a.id ELSE 'shishkov-igor-2010' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Шишков' AND first_name = 'Игорь' AND middle_name = 'Викторович' AND birth_year = 2010 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'porcev-roman-1987' AND s.athlete_id <> a.id)
              THEN 'porcev-roman-1987-' || a.id ELSE 'porcev-roman-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Порцев' AND first_name = 'Роман' AND middle_name = 'Геннадьевич' AND birth_year = 1987 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'gercev-artem-2010' AND s.athlete_id <> a.id)
              THEN 'gercev-artem-2010-' || a.id ELSE 'gercev-artem-2010' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Герцев' AND first_name = 'Артем' AND middle_name = 'Николаевич' AND birth_year = 2010 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'svotin-aleksey-1997' AND s.athlete_id <> a.id)
              THEN 'svotin-aleksey-1997-' || a.id ELSE 'svotin-aleksey-1997' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Свотин' AND first_name = 'Алексей' AND middle_name = 'Юрьевич' AND birth_year = 1997 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'rudakov-nikita-2008' AND s.athlete_id <> a.id)
              THEN 'rudakov-nikita-2008-' || a.id ELSE 'rudakov-nikita-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Рудаков' AND first_name = 'Никита' AND middle_name = 'Евгеньевич' AND birth_year = 2008 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'malikov-danil-2001' AND s.athlete_id <> a.id)
              THEN 'malikov-danil-2001-' || a.id ELSE 'malikov-danil-2001' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Маликов' AND first_name = 'Данил' AND middle_name = 'Дамирович' AND birth_year = 2001 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'peshkov-vitaliy-1998' AND s.athlete_id <> a.id)
              THEN 'peshkov-vitaliy-1998-' || a.id ELSE 'peshkov-vitaliy-1998' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Пешков' AND first_name = 'Виталий' AND middle_name = 'Юрьевич' AND birth_year = 1998 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'salihov-rustam-1982' AND s.athlete_id <> a.id)
              THEN 'salihov-rustam-1982-' || a.id ELSE 'salihov-rustam-1982' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Салихов' AND first_name = 'Рустам' AND middle_name = 'Ренатович' AND birth_year = 1982 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'akulshin-aleksey-1994' AND s.athlete_id <> a.id)
              THEN 'akulshin-aleksey-1994-' || a.id ELSE 'akulshin-aleksey-1994' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Акульшин' AND first_name = 'Алексей' AND middle_name = 'Сергеевич' AND birth_year = 1994 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'miller-maksim-2007' AND s.athlete_id <> a.id)
              THEN 'miller-maksim-2007-' || a.id ELSE 'miller-maksim-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Миллер' AND first_name = 'Максим' AND middle_name = 'Сергеевич' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'fayzulin-danis-2012' AND s.athlete_id <> a.id)
              THEN 'fayzulin-danis-2012-' || a.id ELSE 'fayzulin-danis-2012' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Файзулин' AND first_name = 'Данис' AND middle_name = 'Марсэлевич' AND birth_year = 2012 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sobolev-nikita-2006' AND s.athlete_id <> a.id)
              THEN 'sobolev-nikita-2006-' || a.id ELSE 'sobolev-nikita-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Соболев' AND first_name = 'Никита' AND middle_name = 'Александрович' AND birth_year = 2006 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'usatov-nikolay-1988' AND s.athlete_id <> a.id)
              THEN 'usatov-nikolay-1988-' || a.id ELSE 'usatov-nikolay-1988' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Усатов' AND first_name = 'Николай' AND middle_name = 'Владимирович' AND birth_year = 1988 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kazakov-sergey-2007' AND s.athlete_id <> a.id)
              THEN 'kazakov-sergey-2007-' || a.id ELSE 'kazakov-sergey-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Казаков' AND first_name = 'Сергей' AND middle_name = 'Денисович' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ivanov-aleksandr-2008' AND s.athlete_id <> a.id)
              THEN 'ivanov-aleksandr-2008-' || a.id ELSE 'ivanov-aleksandr-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Александр' AND middle_name = 'Сергеевич' AND birth_year = 2008 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zavarzin-pavel-2000' AND s.athlete_id <> a.id)
              THEN 'zavarzin-pavel-2000-' || a.id ELSE 'zavarzin-pavel-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Заварзин' AND first_name = 'Павел' AND middle_name = 'Александрович' AND birth_year = 2000 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zuev-ilya-2007' AND s.athlete_id <> a.id)
              THEN 'zuev-ilya-2007-' || a.id ELSE 'zuev-ilya-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Зуев' AND first_name = 'Илья' AND middle_name = 'Александрович' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kodirov-abdumaruf-2000' AND s.athlete_id <> a.id)
              THEN 'kodirov-abdumaruf-2000-' || a.id ELSE 'kodirov-abdumaruf-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кодиров' AND first_name = 'Абдумаъруф' AND middle_name = 'Абдукодирович' AND birth_year = 2000 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'golovin-kirill-2006' AND s.athlete_id <> a.id)
              THEN 'golovin-kirill-2006-' || a.id ELSE 'golovin-kirill-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Головин' AND first_name = 'Кирилл' AND middle_name = 'Денисович' AND birth_year = 2006 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'mangul-nikita-2007' AND s.athlete_id <> a.id)
              THEN 'mangul-nikita-2007-' || a.id ELSE 'mangul-nikita-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Мангул' AND first_name = 'Никита' AND middle_name = 'Алексеевич' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'orlov-maksim-2007' AND s.athlete_id <> a.id)
              THEN 'orlov-maksim-2007-' || a.id ELSE 'orlov-maksim-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Орлов' AND first_name = 'Максим' AND middle_name = 'Вадимович' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'novoselov-andrey-2004' AND s.athlete_id <> a.id)
              THEN 'novoselov-andrey-2004-' || a.id ELSE 'novoselov-andrey-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Новоселов' AND first_name = 'Андрей' AND middle_name = 'Евгеньевич' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'shamkaev-radik-1990' AND s.athlete_id <> a.id)
              THEN 'shamkaev-radik-1990-' || a.id ELSE 'shamkaev-radik-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Шамкаев' AND first_name = 'Радик' AND middle_name = 'Мусаевич' AND birth_year = 1990 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'popov-kirill-2008-2' AND s.athlete_id <> a.id)
              THEN 'popov-kirill-2008-2-' || a.id ELSE 'popov-kirill-2008-2' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Попов' AND first_name = 'Кирилл' AND middle_name = 'Александрович' AND birth_year = 2008 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'maymakov-kadyr-2009' AND s.athlete_id <> a.id)
              THEN 'maymakov-kadyr-2009-' || a.id ELSE 'maymakov-kadyr-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Маймаков' AND first_name = 'Кадыр' AND middle_name = 'Миратович' AND birth_year = 2009 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lyaukin-kirill-1999' AND s.athlete_id <> a.id)
              THEN 'lyaukin-kirill-1999-' || a.id ELSE 'lyaukin-kirill-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ляукин' AND first_name = 'Кирилл' AND middle_name = 'Сергеевич' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'petuhov-aleksey-2003' AND s.athlete_id <> a.id)
              THEN 'petuhov-aleksey-2003-' || a.id ELSE 'petuhov-aleksey-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Петухов' AND first_name = 'Алексей' AND middle_name = 'Петрович' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'uglov-nikita-2008' AND s.athlete_id <> a.id)
              THEN 'uglov-nikita-2008-' || a.id ELSE 'uglov-nikita-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Углов' AND first_name = 'Никита' AND middle_name = 'Константинович' AND birth_year = 2008 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'hasanov-rustam-1980' AND s.athlete_id <> a.id)
              THEN 'hasanov-rustam-1980-' || a.id ELSE 'hasanov-rustam-1980' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Хасанов' AND first_name = 'Рустам' AND middle_name = 'Фаридович' AND birth_year = 1980 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'dobrovolskiy-pavel-2009' AND s.athlete_id <> a.id)
              THEN 'dobrovolskiy-pavel-2009-' || a.id ELSE 'dobrovolskiy-pavel-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Добровольский' AND first_name = 'Павел' AND middle_name = 'Иванович' AND birth_year = 2009 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'nursafin-denis-1990' AND s.athlete_id <> a.id)
              THEN 'nursafin-denis-1990-' || a.id ELSE 'nursafin-denis-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Нурсафин' AND first_name = 'Денис' AND middle_name = 'Рафаэльевич' AND birth_year = 1990 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'konstantinov-aleksandr-2007' AND s.athlete_id <> a.id)
              THEN 'konstantinov-aleksandr-2007-' || a.id ELSE 'konstantinov-aleksandr-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Константинов' AND first_name = 'Александр' AND middle_name = 'Иванович' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'mihaylov-denis-1987' AND s.athlete_id <> a.id)
              THEN 'mihaylov-denis-1987-' || a.id ELSE 'mihaylov-denis-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Михайлов' AND first_name = 'Денис' AND middle_name = 'Витальевич' AND birth_year = 1987 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kozhevatova-vasilisa-2002' AND s.athlete_id <> a.id)
              THEN 'kozhevatova-vasilisa-2002-' || a.id ELSE 'kozhevatova-vasilisa-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кожеватова' AND first_name = 'Василиса' AND middle_name = 'Егоровна' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'yulusova-veronika-2009' AND s.athlete_id <> a.id)
              THEN 'yulusova-veronika-2009-' || a.id ELSE 'yulusova-veronika-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Юлусова' AND first_name = 'Вероника' AND middle_name = 'Николаевна' AND birth_year = 2009 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'liluashvili-viktoriya-2010' AND s.athlete_id <> a.id)
              THEN 'liluashvili-viktoriya-2010-' || a.id ELSE 'liluashvili-viktoriya-2010' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Лилуашвили' AND first_name = 'Виктория' AND middle_name = 'Важаевна' AND birth_year = 2010 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'burlina-alena-2010' AND s.athlete_id <> a.id)
              THEN 'burlina-alena-2010-' || a.id ELSE 'burlina-alena-2010' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бурлина' AND first_name = 'Алена' AND middle_name = 'Викторовна' AND birth_year = 2010 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'bubencova-sofya-2009' AND s.athlete_id <> a.id)
              THEN 'bubencova-sofya-2009-' || a.id ELSE 'bubencova-sofya-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бубенцова' AND first_name = 'Софья' AND middle_name = 'Алексеевна' AND birth_year = 2009 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kovaleva-milena-2012' AND s.athlete_id <> a.id)
              THEN 'kovaleva-milena-2012-' || a.id ELSE 'kovaleva-milena-2012' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ковалева' AND first_name = 'Милена' AND middle_name = 'Витальевна' AND birth_year = 2012 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'uvarova-nelli-2009' AND s.athlete_id <> a.id)
              THEN 'uvarova-nelli-2009-' || a.id ELSE 'uvarova-nelli-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Уварова' AND first_name = 'Нелли' AND middle_name = 'Валерьевна' AND birth_year = 2009 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'karbovskaya-angelina-2010' AND s.athlete_id <> a.id)
              THEN 'karbovskaya-angelina-2010-' || a.id ELSE 'karbovskaya-angelina-2010' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Карбовская' AND first_name = 'Ангелина' AND middle_name = 'Юрьевна' AND birth_year = 2010 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'simdyanova-sofiya-2006' AND s.athlete_id <> a.id)
              THEN 'simdyanova-sofiya-2006-' || a.id ELSE 'simdyanova-sofiya-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Симдянова' AND first_name = 'София' AND middle_name = 'Михайловна' AND birth_year = 2006 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'dmitrieva-sofya-2008' AND s.athlete_id <> a.id)
              THEN 'dmitrieva-sofya-2008-' || a.id ELSE 'dmitrieva-sofya-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Дмитриева' AND first_name = 'Софья' AND middle_name = 'Александровна' AND birth_year = 2008 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'burmakina-ekaterina-2005' AND s.athlete_id <> a.id)
              THEN 'burmakina-ekaterina-2005-' || a.id ELSE 'burmakina-ekaterina-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бурмакина' AND first_name = 'Екатерина' AND middle_name = 'Сергеевна' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'voronova-natalya-2006' AND s.athlete_id <> a.id)
              THEN 'voronova-natalya-2006-' || a.id ELSE 'voronova-natalya-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Воронова' AND first_name = 'Наталья' AND middle_name = 'Александровна' AND birth_year = 2006 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'malyushina-mariya-2009' AND s.athlete_id <> a.id)
              THEN 'malyushina-mariya-2009-' || a.id ELSE 'malyushina-mariya-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Малюшина' AND first_name = 'Мария' AND middle_name = 'Алексеевна' AND birth_year = 2009 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kozlova-irina-2006' AND s.athlete_id <> a.id)
              THEN 'kozlova-irina-2006-' || a.id ELSE 'kozlova-irina-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Козлова' AND first_name = 'Ирина' AND middle_name = 'Дмитриевна' AND birth_year = 2006 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'dubovik-svetlana-2009' AND s.athlete_id <> a.id)
              THEN 'dubovik-svetlana-2009-' || a.id ELSE 'dubovik-svetlana-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Дубовик' AND first_name = 'Светлана' AND middle_name = 'Сергеевна' AND birth_year = 2009 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'cherezova-aleksandra-2011' AND s.athlete_id <> a.id)
              THEN 'cherezova-aleksandra-2011-' || a.id ELSE 'cherezova-aleksandra-2011' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Черезова' AND first_name = 'Александра' AND middle_name = 'Дмитриевна' AND birth_year = 2011 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kalugina-irina-2008' AND s.athlete_id <> a.id)
              THEN 'kalugina-irina-2008-' || a.id ELSE 'kalugina-irina-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Калугина' AND first_name = 'Ирина' AND middle_name = 'Вячеславовна' AND birth_year = 2008 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'plechova-karina-2007' AND s.athlete_id <> a.id)
              THEN 'plechova-karina-2007-' || a.id ELSE 'plechova-karina-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Плечова' AND first_name = 'Карина' AND middle_name = 'Юрьевна' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kuzmicheva-ekaterina-2004' AND s.athlete_id <> a.id)
              THEN 'kuzmicheva-ekaterina-2004-' || a.id ELSE 'kuzmicheva-ekaterina-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кузьмичева' AND first_name = 'Екатерина' AND middle_name = 'Сергеевна' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'imaeva-guzel-2004' AND s.athlete_id <> a.id)
              THEN 'imaeva-guzel-2004-' || a.id ELSE 'imaeva-guzel-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Имаева' AND first_name = 'Гузель' AND middle_name = 'Мунировна' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'morogina-natalya-1972' AND s.athlete_id <> a.id)
              THEN 'morogina-natalya-1972-' || a.id ELSE 'morogina-natalya-1972' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Морогина' AND first_name = 'Наталья' AND middle_name = 'Леонидовна' AND birth_year = 1972 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lavrinov-valeriy-1980' AND s.athlete_id <> a.id)
              THEN 'lavrinov-valeriy-1980-' || a.id ELSE 'lavrinov-valeriy-1980' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Лавринов' AND first_name = 'Валерий' AND middle_name = 'Александрович' AND birth_year = 1980 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'polovnikov-pavel-2002' AND s.athlete_id <> a.id)
              THEN 'polovnikov-pavel-2002-' || a.id ELSE 'polovnikov-pavel-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Половников' AND first_name = 'Павел' AND middle_name = 'Викторович' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'afanasev-daniil-2009' AND s.athlete_id <> a.id)
              THEN 'afanasev-daniil-2009-' || a.id ELSE 'afanasev-daniil-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Афанасьев' AND first_name = 'Даниил' AND middle_name = 'Петрович' AND birth_year = 2009 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'cyupko-egor-2007' AND s.athlete_id <> a.id)
              THEN 'cyupko-egor-2007-' || a.id ELSE 'cyupko-egor-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Цюпко' AND first_name = 'Егор' AND middle_name = 'Александрович' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'basharov-islam-2007' AND s.athlete_id <> a.id)
              THEN 'basharov-islam-2007-' || a.id ELSE 'basharov-islam-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Башаров' AND first_name = 'Ислам' AND middle_name = 'Нурисламович' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'basharov-aryslan-2007' AND s.athlete_id <> a.id)
              THEN 'basharov-aryslan-2007-' || a.id ELSE 'basharov-aryslan-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Башаров' AND first_name = 'Арыслан' AND middle_name = 'Нурисламович' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'paklin-pavel-1990' AND s.athlete_id <> a.id)
              THEN 'paklin-pavel-1990-' || a.id ELSE 'paklin-pavel-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Паклин' AND first_name = 'Павел' AND middle_name = 'Алексеевич' AND birth_year = 1990 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ermakov-igor-1992' AND s.athlete_id <> a.id)
              THEN 'ermakov-igor-1992-' || a.id ELSE 'ermakov-igor-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ермаков' AND first_name = 'Игорь' AND middle_name = 'Анатольевич' AND birth_year = 1992 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'alekseev-radif-1989' AND s.athlete_id <> a.id)
              THEN 'alekseev-radif-1989-' || a.id ELSE 'alekseev-radif-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Алексеев' AND first_name = 'Радиф' AND middle_name = 'Дамирович' AND birth_year = 1989 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'tretyakov-vladislav-1989' AND s.athlete_id <> a.id)
              THEN 'tretyakov-vladislav-1989-' || a.id ELSE 'tretyakov-vladislav-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Третьяков' AND first_name = 'Владислав' AND middle_name = 'Владимирович' AND birth_year = 1989 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'burkov-yuriy-1987' AND s.athlete_id <> a.id)
              THEN 'burkov-yuriy-1987-' || a.id ELSE 'burkov-yuriy-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бурков' AND first_name = 'Юрий' AND middle_name = 'Михайлович' AND birth_year = 1987 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'haybullin-razyap-2007' AND s.athlete_id <> a.id)
              THEN 'haybullin-razyap-2007-' || a.id ELSE 'haybullin-razyap-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Хайбуллин' AND first_name = 'Разяп' AND middle_name = 'Ринатович' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'gocko-roman-2006' AND s.athlete_id <> a.id)
              THEN 'gocko-roman-2006-' || a.id ELSE 'gocko-roman-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Гоцко' AND first_name = 'Роман' AND middle_name = 'Иванович' AND birth_year = 2006 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'krestyaninov-viktor-2000' AND s.athlete_id <> a.id)
              THEN 'krestyaninov-viktor-2000-' || a.id ELSE 'krestyaninov-viktor-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Крестьянинов' AND first_name = 'Виктор' AND middle_name = 'Александрович' AND birth_year = 2000 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'bahtov-ilya-1989' AND s.athlete_id <> a.id)
              THEN 'bahtov-ilya-1989-' || a.id ELSE 'bahtov-ilya-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бахтов' AND first_name = 'Илья' AND middle_name = 'Владимирович' AND birth_year = 1989 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'voloshin-valentin-2007' AND s.athlete_id <> a.id)
              THEN 'voloshin-valentin-2007-' || a.id ELSE 'voloshin-valentin-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Волошин' AND first_name = 'Валентин' AND middle_name = 'Иванович' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'pavlov-aleksandr-1994' AND s.athlete_id <> a.id)
              THEN 'pavlov-aleksandr-1994-' || a.id ELSE 'pavlov-aleksandr-1994' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Павлов' AND first_name = 'Александр' AND middle_name = 'Станиславович' AND birth_year = 1994 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'bulagasov-eduard-1991' AND s.athlete_id <> a.id)
              THEN 'bulagasov-eduard-1991-' || a.id ELSE 'bulagasov-eduard-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Булагасов' AND first_name = 'Эдуард' AND middle_name = 'Олегович' AND birth_year = 1991 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'caregorodcev-dmitriy-1981' AND s.athlete_id <> a.id)
              THEN 'caregorodcev-dmitriy-1981-' || a.id ELSE 'caregorodcev-dmitriy-1981' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Царегородцев' AND first_name = 'Дмитрий' AND middle_name = 'Владимирович' AND birth_year = 1981 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'konstantinov-aleksandr-2003' AND s.athlete_id <> a.id)
              THEN 'konstantinov-aleksandr-2003-' || a.id ELSE 'konstantinov-aleksandr-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Константинов' AND first_name = 'Александр' AND middle_name = 'Иванович' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kukzhanov-diyas-2007' AND s.athlete_id <> a.id)
              THEN 'kukzhanov-diyas-2007-' || a.id ELSE 'kukzhanov-diyas-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кукжанов' AND first_name = 'Дияс' AND middle_name = 'Канатович' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lyapin-kirill-2009' AND s.athlete_id <> a.id)
              THEN 'lyapin-kirill-2009-' || a.id ELSE 'lyapin-kirill-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ляпин' AND first_name = 'Кирилл' AND middle_name = 'Алексеевич' AND birth_year = 2009 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'noskov-andrey-1993' AND s.athlete_id <> a.id)
              THEN 'noskov-andrey-1993-' || a.id ELSE 'noskov-andrey-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Носков' AND first_name = 'Андрей' AND middle_name = 'Николаевич' AND birth_year = 1993 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'basharov-nurislam-1983' AND s.athlete_id <> a.id)
              THEN 'basharov-nurislam-1983-' || a.id ELSE 'basharov-nurislam-1983' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Башаров' AND first_name = 'Нурислам' AND middle_name = 'Максумович' AND birth_year = 1983 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kabanov-rinat-1994' AND s.athlete_id <> a.id)
              THEN 'kabanov-rinat-1994-' || a.id ELSE 'kabanov-rinat-1994' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кабанов' AND first_name = 'Ринат' AND middle_name = 'Камилович' AND birth_year = 1994 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'pirozhnikov-aleksandr-1987' AND s.athlete_id <> a.id)
              THEN 'pirozhnikov-aleksandr-1987-' || a.id ELSE 'pirozhnikov-aleksandr-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Пирожников' AND first_name = 'Александр' AND middle_name = 'Андреевич' AND birth_year = 1987 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ipatov-evgeniy-1994' AND s.athlete_id <> a.id)
              THEN 'ipatov-evgeniy-1994-' || a.id ELSE 'ipatov-evgeniy-1994' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ипатов' AND first_name = 'Евгений' AND middle_name = 'Николаевич' AND birth_year = 1994 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'simdyanov-mihail-1981' AND s.athlete_id <> a.id)
              THEN 'simdyanov-mihail-1981-' || a.id ELSE 'simdyanov-mihail-1981' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Симдянов' AND first_name = 'Михаил' AND middle_name = 'Владимирович' AND birth_year = 1981 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);

INSERT INTO results (id, category_id, athlete_id, place, total_reps, points, body_weight_kg, rank_achieved_id, discipline_id, bell_kg, hands, time_limit_min, competition_id, event_date, raw_name, raw_club, raw_region, protocol_id, source_page) VALUES
  (4001, 4001, (SELECT id FROM athletes WHERE last_name = 'Матвеева' AND first_name = 'Елена' AND middle_name = 'Евгеньевна' AND birth_year = 1974 LIMIT 1), 1, 42, NULL, 62.55, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 4001, '2026-04-02', 'Матвеева Елена Евгеньевна', 'КОГАУ "СШОР "Юность"', 'Кировская область', 4001, 21),
  (4002, 4001, (SELECT id FROM athletes WHERE last_name = 'Пузанкова' AND first_name = 'Анастасия' AND middle_name = 'Константиновна' AND birth_year = 2006 LIMIT 1), 2, 21, NULL, 62.1, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 4001, '2026-04-02', 'Пузанкова Анастасия Константиновна', 'МБОУ ДО СШ Татнефть Олимп', 'Республика Татарстан', 4001, 21),
  (4003, 4002, (SELECT id FROM athletes WHERE last_name = 'Филимонова' AND first_name = 'Карина' AND middle_name = 'Денисовна' AND birth_year = 2006 LIMIT 1), 1, 82, NULL, 84.3, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 4001, '2026-04-02', 'Филимонова Карина Денисовна', 'КОГАУ "СШОР "Юность"', 'Кировская область', 4001, 23),
  (4004, 4002, (SELECT id FROM athletes WHERE last_name = 'Попова' AND first_name = 'Мария' AND middle_name = 'Алексеевна' AND birth_year = 2005 LIMIT 1), 2, 75, NULL, 81.15, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 4001, '2026-04-02', 'Попова Мария Алексеевна', 'Кит "на спорте"', 'Пермский край', 4001, 23),
  (4005, 4002, (SELECT id FROM athletes WHERE last_name = 'Новикова' AND first_name = 'Полина' AND middle_name = 'Феликсовна' AND birth_year = 2012 LIMIT 1), 3, 53, NULL, 89.15, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 4001, '2026-04-02', 'Новикова Полина Феликсовна', 'КОГАУ "СШОР "Юность"', 'Кировская область', 4001, 23),
  (4006, 4002, (SELECT id FROM athletes WHERE last_name = 'Махкамова' AND first_name = 'Парвина' AND middle_name = 'Маруфовна' AND birth_year = 2007 LIMIT 1), 4, 45, NULL, 89.55, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 4001, '2026-04-02', 'Махкамова Парвина Маруфовна', 'МАУ ДО СШ "Прикамье"', 'Пермский край', 4001, 23),
  (4007, 4002, (SELECT id FROM athletes WHERE last_name = 'Кузьмичева' AND first_name = 'Ксения' AND middle_name = 'Сергеевна' AND birth_year = 2004 LIMIT 1), 5, 36, NULL, 78.45, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 4001, '2026-04-02', 'Кузьмичева Ксения Сергеевна', 'СШ № 1 им Л.Д. Ковалевского', 'Оренбургская область', 4001, 23),
  (4008, 4002, (SELECT id FROM athletes WHERE last_name = 'Герцева' AND first_name = 'Ульяна' AND middle_name = 'Денисовна' AND birth_year = 2011 LIMIT 1), 6, 32, NULL, 75.35, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 4001, '2026-04-02', 'Герцева Ульяна Денисовна', 'СШ № 1 им Л.Д. Ковалевского', 'Оренбургская область', 4001, 23),
  (4009, 4002, (SELECT id FROM athletes WHERE last_name = 'Хасанова' AND first_name = 'Алсу' AND middle_name = 'Саматовна' AND birth_year = 1995 LIMIT 1), 7, 4, NULL, 78.7, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 4001, '2026-04-02', 'Хасанова Алсу Саматовна', 'Отдел образования г. Стерлитамак', 'Республика Башкортостан', 4001, 23),
  (4010, 4003, (SELECT id FROM athletes WHERE last_name = 'Сиразетдинов' AND first_name = 'Данил' AND middle_name = 'Ильфатович' AND birth_year = 2007 LIMIT 1), 1, 84, NULL, 62.85, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 4001, '2026-04-02', 'Сиразетдинов Данил Ильфатович', 'МАУ ДО СШ "Прикамье"', 'Пермский край', 4001, 13),
  (4011, 4003, (SELECT id FROM athletes WHERE last_name = 'Бервин' AND first_name = 'Матвей' AND middle_name = 'Витальевич' AND birth_year = 2010 LIMIT 1), 2, 62, NULL, 61.95, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 4001, '2026-04-02', 'Бервин Матвей Витальевич', 'МАУ СШ "Свобода" г. Орск', 'Оренбургская область', 4001, 13),
  (4012, 4003, (SELECT id FROM athletes WHERE last_name = 'Утев' AND first_name = 'Руслан' AND middle_name = 'Андреевич' AND birth_year = 2005 LIMIT 1), 3, 61, NULL, 62.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 4001, '2026-04-02', 'Утев Руслан Андреевич', 'МБУ ДО "ДЮСШ "Спарт"', 'Пермский край', 4001, 13),
  (4013, 4003, (SELECT id FROM athletes WHERE last_name = 'Старков' AND first_name = 'Георгий' AND middle_name = 'Альбертович' AND birth_year = 2007 LIMIT 1), 4, 58, NULL, 59.66, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 4001, '2026-04-02', 'Старков Георгий Альбертович', 'МАУ ДО СШОР', 'Республика Башкортостан', 4001, 13),
  (4014, 4003, (SELECT id FROM athletes WHERE last_name = 'Кылосов' AND first_name = 'Владимир' AND middle_name = 'Андреевич' AND birth_year = 2008 LIMIT 1), 5, 57, NULL, 61.3, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 4001, '2026-04-02', 'Кылосов Владимир Андреевич', 'МБУ ДО "ДЮСШ "Спарт"', 'Пермский край', 4001, 13),
  (4015, 4003, (SELECT id FROM athletes WHERE last_name = 'Митюкевич' AND first_name = 'Станислав' AND middle_name = 'Николаевич' AND birth_year = 2008 LIMIT 1), 6, 56, NULL, 61.85, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 4001, '2026-04-02', 'Митюкевич Станислав Николаевич', 'МАУ ДО СШОР', 'Республика Башкортостан', 4001, 13),
  (4016, 4003, (SELECT id FROM athletes WHERE last_name = 'Токарев' AND first_name = 'Артем' AND middle_name = 'Дмитриевич' AND birth_year = 2009 LIMIT 1), 7, 28, NULL, 61.7, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 4001, '2026-04-02', 'Токарев Артем Дмитриевич', 'СШ Новорского р-на', 'Оренбургская область', 4001, 13),
  (4017, 4004, (SELECT id FROM athletes WHERE last_name = 'Узюкин' AND first_name = 'Анатолий' AND middle_name = 'Эдуардович' AND birth_year = 2000 LIMIT 1), 1, 115, NULL, 67.55, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 4001, '2026-04-02', 'Узюкин Анатолий Эдуардович', 'СШ Энергия', 'Чувашская Республика', 4001, 14),
  (4018, 4004, (SELECT id FROM athletes WHERE last_name = 'Громов' AND first_name = 'Алексей' AND middle_name = 'Николаевич' AND birth_year = 1995 LIMIT 1), 2, 75, NULL, 67.6, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 4001, '2026-04-02', 'Громов Алексей Николаевич', '-', 'Удмуртская область', 4001, 14),
  (4019, 4004, (SELECT id FROM athletes WHERE last_name = 'Лучинин' AND first_name = 'Илья' AND middle_name = 'Михайлович' AND birth_year = 2008 LIMIT 1), 3, 71, NULL, 67.75, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 4001, '2026-04-02', 'Лучинин Илья Михайлович', 'КОГАУ "СШОР "Юность"', 'Кировская область', 4001, 14),
  (4020, 4004, (SELECT id FROM athletes WHERE last_name = 'Киякин' AND first_name = 'Александр' AND middle_name = 'Александрович' AND birth_year = 2001 LIMIT 1), 4, 71, NULL, 68.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 4001, '2026-04-02', 'Киякин Александр Александрович', 'СШ № 1 им Л.Д. Ковалевского', 'Оренбургская область', 4001, 14),
  (4021, 4004, (SELECT id FROM athletes WHERE last_name = 'Сафаргалин' AND first_name = 'Рамазан' AND middle_name = 'Марселевич' AND birth_year = 2007 LIMIT 1), 5, 63, NULL, 67.9, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 4001, '2026-04-02', 'Сафаргалин Рамазан Марселевич', 'МАУ ДО СШОР', 'Республика Башкортостан', 4001, 14),
  (4022, 4004, (SELECT id FROM athletes WHERE last_name = 'Мелюхин' AND first_name = 'Кирилл' AND middle_name = 'Александрович' AND birth_year = 2011 LIMIT 1), 6, 57, NULL, 66.85, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 4001, '2026-04-02', 'Мелюхин Кирилл Александрович', 'МБУ ДО "ДЮСШ "Спарт"', 'Пермский край', 4001, 14),
  (4023, 4005, (SELECT id FROM athletes WHERE last_name = 'Балдин' AND first_name = 'Александр' AND middle_name = 'Васильевич' AND birth_year = 1993 LIMIT 1), 1, 104, NULL, 71.3, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 4001, '2026-04-02', 'Балдин Александр Васильевич', 'РО ООО "ВФГС" СО', 'Самарская область', 4001, 15),
  (4024, 4005, (SELECT id FROM athletes WHERE last_name = 'Гарифуллин' AND first_name = 'Константин' AND middle_name = 'Фардатович' AND birth_year = 1999 LIMIT 1), 2, 76, NULL, 73.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 4001, '2026-04-02', 'Гарифуллин Константин Фардатович', '-', 'Удмуртская Республика', 4001, 15),
  (4025, 4005, (SELECT id FROM athletes WHERE last_name = 'Попов' AND first_name = 'Кирилл' AND middle_name = 'Максимович' AND birth_year = 2008 LIMIT 1), 3, 69, NULL, 71.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 4001, '2026-04-02', 'Попов Кирилл Максимович', 'МБУ ДО "ДЮСШ "Спарт"', 'Пермский край', 4001, 15),
  (4026, 4005, (SELECT id FROM athletes WHERE last_name = 'Гареев' AND first_name = 'Денис' AND middle_name = 'Александрович' AND birth_year = 2005 LIMIT 1), 4, 69, NULL, 72.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 4001, '2026-04-02', 'Гареев Денис Александрович', 'СШ "Буревестник"', 'Республика Башкортостан', 4001, 15),
  (4027, 4005, (SELECT id FROM athletes WHERE last_name = 'Хвалев' AND first_name = 'Кирилл' AND middle_name = 'Александрович' AND birth_year = 1998 LIMIT 1), 5, 67, NULL, 72.85, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 4001, '2026-04-02', 'Хвалев Кирилл Александрович', 'СШ № 1 им Л.Д. Ковалевского', 'Оренбургская область', 4001, 15),
  (4028, 4005, (SELECT id FROM athletes WHERE last_name = 'Сычёв' AND first_name = 'Алексей' AND middle_name = 'Андреевич' AND birth_year = 2006 LIMIT 1), 6, 55, NULL, 72.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 4001, '2026-04-02', 'Сычёв Алексей Андреевич', 'МАУ ДО СШ "Прикамье"', 'Пермский край', 4001, 15),
  (4029, 4005, (SELECT id FROM athletes WHERE last_name = 'Янгуатов' AND first_name = 'Вячеслав' AND middle_name = 'Эдуардович' AND birth_year = 2005 LIMIT 1), 7, 52, NULL, 71.95, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 4001, '2026-04-02', 'Янгуатов Вячеслав Эдуардович', 'СШ "Буревестник"', 'Республика Башкортостан', 4001, 15),
  (4030, 4005, (SELECT id FROM athletes WHERE last_name = 'Ярусов' AND first_name = 'Константин' AND middle_name = 'Леонидович' AND birth_year = 2006 LIMIT 1), 8, 42, NULL, 71.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 4001, '2026-04-02', 'Ярусов Константин Леонидович', 'МБУ ДО "ДЮСШ "Спарт"', 'Пермский край', 4001, 15),
  (4031, 4005, (SELECT id FROM athletes WHERE last_name = 'Шишков' AND first_name = 'Игорь' AND middle_name = 'Викторович' AND birth_year = 2010 LIMIT 1), 9, 40, NULL, 72.75, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 4001, '2026-04-02', 'Шишков Игорь Викторович', 'ЦСР г. Мелеуз', 'Республика Башкортостан', 4001, 15),
  (4032, 4006, (SELECT id FROM athletes WHERE last_name = 'Порцев' AND first_name = 'Роман' AND middle_name = 'Геннадьевич' AND birth_year = 1987 LIMIT 1), 1, 124, NULL, 77.95, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 4001, '2026-04-02', 'Порцев Роман Геннадьевич', 'МАУ ДО СШ "Прикамье"', 'Пермский край', 4001, 16),
  (4033, 4006, (SELECT id FROM athletes WHERE last_name = 'Герцев' AND first_name = 'Артем' AND middle_name = 'Николаевич' AND birth_year = 2010 LIMIT 1), 2, 94, NULL, 77.35, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 4001, '2026-04-02', 'Герцев Артем Николаевич', 'МБУ ДО "СШ" Сорочинского МО', 'Оренбургская область', 4001, 16),
  (4034, 4006, (SELECT id FROM athletes WHERE last_name = 'Свотин' AND first_name = 'Алексей' AND middle_name = 'Юрьевич' AND birth_year = 1997 LIMIT 1), 3, 90, NULL, 76.75, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 4001, '2026-04-02', 'Свотин Алексей Юрьевич', 'СШ № 1 им Л.Д. Ковалевского', 'Оренбургская область', 4001, 16),
  (4035, 4006, (SELECT id FROM athletes WHERE last_name = 'Рудаков' AND first_name = 'Никита' AND middle_name = 'Евгеньевич' AND birth_year = 2008 LIMIT 1), 4, 38, NULL, 77.35, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 4001, '2026-04-02', 'Рудаков Никита Евгеньевич', 'СШ № 1 им Л.Д. Ковалевского', 'Оренбургская область', 4001, 16),
  (4036, 4007, (SELECT id FROM athletes WHERE last_name = 'Маликов' AND first_name = 'Данил' AND middle_name = 'Дамирович' AND birth_year = 2001 LIMIT 1), 1, 144, NULL, 84.85, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 4001, '2026-04-02', 'Маликов Данил Дамирович', 'ДС СШ "Прикамье"', 'Пермский край', 4001, 17),
  (4037, 4007, (SELECT id FROM athletes WHERE last_name = 'Пешков' AND first_name = 'Виталий' AND middle_name = 'Юрьевич' AND birth_year = 1998 LIMIT 1), 2, 109, NULL, 83.65, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 4001, '2026-04-02', 'Пешков Виталий Юрьевич', 'СШ № 1 им Л.Д. Ковалевского', 'Оренбургская область', 4001, 17),
  (4038, 4007, (SELECT id FROM athletes WHERE last_name = 'Салихов' AND first_name = 'Рустам' AND middle_name = 'Ренатович' AND birth_year = 1982 LIMIT 1), 3, 108, NULL, 83.6, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 4001, '2026-04-02', 'Салихов Рустам Ренатович', 'СШ № 1 им Л.Д. Ковалевского', 'Оренбургская область', 4001, 17),
  (4039, 4007, (SELECT id FROM athletes WHERE last_name = 'Акульшин' AND first_name = 'Алексей' AND middle_name = 'Сергеевич' AND birth_year = 1994 LIMIT 1), 4, 100, NULL, 84.45, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 4001, '2026-04-02', 'Акульшин Алексей Сергеевич', 'СШ № 1 им Л.Д. Ковалевского', 'Оренбургская область', 4001, 17),
  (4040, 4007, (SELECT id FROM athletes WHERE last_name = 'Миллер' AND first_name = 'Максим' AND middle_name = 'Сергеевич' AND birth_year = 2007 LIMIT 1), 5, 60, NULL, 81.1, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 4001, '2026-04-02', 'Миллер Максим Сергеевич', 'РО ООО "ВФГС" СО', 'Самарская область', 4001, 17),
  (4041, 4007, (SELECT id FROM athletes WHERE last_name = 'Файзулин' AND first_name = 'Данис' AND middle_name = 'Марсэлевич' AND birth_year = 2012 LIMIT 1), 6, 29, NULL, 82.55, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 4001, '2026-04-02', 'Файзулин Данис Марсэлевич', 'МБУДО "СШ" Сорочинского МО', 'Оренбургская область', 4001, 17),
  (4042, 4008, (SELECT id FROM athletes WHERE last_name = 'Соболев' AND first_name = 'Никита' AND middle_name = 'Александрович' AND birth_year = 2006 LIMIT 1), 1, 104, NULL, 111.5, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 4001, '2026-04-02', 'Соболев Никита Александрович', '-', 'Удмуртская Республика', 4001, 19),
  (4043, 4008, (SELECT id FROM athletes WHERE last_name = 'Усатов' AND first_name = 'Николай' AND middle_name = 'Владимирович' AND birth_year = 1988 LIMIT 1), 2, 100, NULL, 105.3, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 4001, '2026-04-02', 'Усатов Николай Владимирович', 'РО ООО "ВФГС" СО', 'Самарская область', 4001, 19),
  (4044, 4008, (SELECT id FROM athletes WHERE last_name = 'Казаков' AND first_name = 'Сергей' AND middle_name = 'Денисович' AND birth_year = 2007 LIMIT 1), 3, 49, NULL, 115.55, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 4001, '2026-04-02', 'Казаков Сергей Денисович', 'СШ № 1 им Л.Д. Ковалевского', 'Оренбургская область', 4001, 19),
  (4045, 4009, (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Александр' AND middle_name = 'Сергеевич' AND birth_year = 2008 LIMIT 1), 1, 112, NULL, 91.8, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 4001, '2026-04-02', 'Иванов Александр Сергеевич', 'МАУ ДО СШ "Чемпион"', 'Республика Башкортостан', 4001, 18),
  (4046, 4009, (SELECT id FROM athletes WHERE last_name = 'Заварзин' AND first_name = 'Павел' AND middle_name = 'Александрович' AND birth_year = 2000 LIMIT 1), 2, 89, NULL, 87.85, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 4001, '2026-04-02', 'Заварзин Павел Александрович', 'СШ № 1 им Л.Д. Ковалевского', 'Оренбургская область', 4001, 18),
  (4047, 4009, (SELECT id FROM athletes WHERE last_name = 'Зуев' AND first_name = 'Илья' AND middle_name = 'Александрович' AND birth_year = 2007 LIMIT 1), 3, 65, NULL, 94.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 4001, '2026-04-02', 'Зуев Илья Александрович', 'МАУ ДО СШ "Прикамье"', 'Пермский край', 4001, 18),
  (4048, 4009, (SELECT id FROM athletes WHERE last_name = 'Кодиров' AND first_name = 'Абдумаъруф' AND middle_name = 'Абдукодирович' AND birth_year = 2000 LIMIT 1), 4, 62, NULL, 87.85, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 4001, '2026-04-02', 'Кодиров Абдумаъруф Абдукодирович', 'ДС СШ "Прикамье"', 'Пермский край', 4001, 18),
  (4049, 4009, (SELECT id FROM athletes WHERE last_name = 'Головин' AND first_name = 'Кирилл' AND middle_name = 'Денисович' AND birth_year = 2006 LIMIT 1), 5, 42, NULL, 85.15, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 4001, '2026-04-02', 'Головин Кирилл Денисович', 'СШ № 1 им Л.Д. Ковалевского', 'Оренбургская область', 4001, 18),
  (4050, 4010, (SELECT id FROM athletes WHERE last_name = 'Матвеева' AND first_name = 'Елена' AND middle_name = 'Евгеньевна' AND birth_year = 1974 LIMIT 1), 1, 45, NULL, 61.95, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 4001, '2026-04-02', 'Матвеева Елена Евгеньевна', 'КОГАУ "СШОР "Юность"', 'Кировская область', 4001, 9),
  (4051, 4011, (SELECT id FROM athletes WHERE last_name = 'Филимонова' AND first_name = 'Карина' AND middle_name = 'Денисовна' AND birth_year = 2006 LIMIT 1), 1, 61, NULL, 83.95, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 4001, '2026-04-02', 'Филимонова Карина Денисовна', 'КОГАУ "СШОР "Юность"', 'Кировская область', 4001, 10),
  (4052, 4011, (SELECT id FROM athletes WHERE last_name = 'Попова' AND first_name = 'Мария' AND middle_name = 'Алексеевна' AND birth_year = 2005 LIMIT 1), 2, 40, NULL, 81.45, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 4001, '2026-04-02', 'Попова Мария Алексеевна', 'Кит "на спорте"', 'Пермский край', 4001, 10),
  (4053, 4011, (SELECT id FROM athletes WHERE last_name = 'Герцева' AND first_name = 'Ульяна' AND middle_name = 'Денисовна' AND birth_year = 2011 LIMIT 1), 3, 26, NULL, 74.6, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 4001, '2026-04-02', 'Герцева Ульяна Денисовна', 'МБУДО "СШ" Сорочинского МО', 'Оренбургская область', 4001, 10),
  (4054, 4011, (SELECT id FROM athletes WHERE last_name = 'Махкамова' AND first_name = 'Парвина' AND middle_name = 'Маруфовна' AND birth_year = 2007 LIMIT 1), 4, 21, NULL, 89.3, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 4001, '2026-04-02', 'Махкамова Парвина Маруфовна', 'МАУ ДО СШ "Прикамье"', 'Пермский край', 4001, 10),
  (4055, 4011, (SELECT id FROM athletes WHERE last_name = 'Кузьмичева' AND first_name = 'Ксения' AND middle_name = 'Сергеевна' AND birth_year = 2004 LIMIT 1), 5, 16, NULL, 78.9, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 4001, '2026-04-02', 'Кузьмичева Ксения Сергеевна', 'СШ № 1 им Л.Д. Ковалевского', 'Оренбургская область', 4001, 10),
  (4056, 4011, (SELECT id FROM athletes WHERE last_name = 'Хасанова' AND first_name = 'Алсу' AND middle_name = 'Саматовна' AND birth_year = 1995 LIMIT 1), NULL, 0, NULL, 78.45, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 4001, '2026-04-02', 'Хасанова Алсу Саматовна', 'Отдел образования г. Стерлитамак', 'Республика Башкортостан', 4001, 10),
  (4057, 4012, (SELECT id FROM athletes WHERE last_name = 'Сиразетдинов' AND first_name = 'Данил' AND middle_name = 'Ильфатович' AND birth_year = 2007 LIMIT 1), 1, 63, NULL, 62.8, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 4001, '2026-04-02', 'Сиразетдинов Данил Ильфатович', 'МАУ ДО СШ "Прикамье"', 'Пермский край', 4001, 2),
  (4058, 4012, (SELECT id FROM athletes WHERE last_name = 'Кылосов' AND first_name = 'Владимир' AND middle_name = 'Андреевич' AND birth_year = 2008 LIMIT 1), 2, 35, NULL, 60.75, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 4001, '2026-04-02', 'Кылосов Владимир Андреевич', 'МБУ ДО "ДЮСШ "Спарт"', 'Пермский край', 4001, 2),
  (4059, 4012, (SELECT id FROM athletes WHERE last_name = 'Мангул' AND first_name = 'Никита' AND middle_name = 'Алексеевич' AND birth_year = 2007 LIMIT 1), 3, 20, NULL, 62.9, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 4001, '2026-04-02', 'Мангул Никита Алексеевич', 'МАУ СШ "Свобода" г. Орска', 'Оренбургская область', 4001, 2),
  (4060, 4013, (SELECT id FROM athletes WHERE last_name = 'Киякин' AND first_name = 'Александр' AND middle_name = 'Александрович' AND birth_year = 2001 LIMIT 1), 1, 42, NULL, 67.75, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 4001, '2026-04-02', 'Киякин Александр Александрович', 'СШ № 1 им Л.Д. Ковалевского', 'Оренбургская область', 4001, 3),
  (4061, 4013, (SELECT id FROM athletes WHERE last_name = 'Лучинин' AND first_name = 'Илья' AND middle_name = 'Михайлович' AND birth_year = 2008 LIMIT 1), 2, 39, NULL, 67.65, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 4001, '2026-04-02', 'Лучинин Илья Михайлович', 'КОГАУ "СШОР "Юность"', 'Кировская область', 4001, 3),
  (4062, 4013, (SELECT id FROM athletes WHERE last_name = 'Мелюхин' AND first_name = 'Кирилл' AND middle_name = 'Александрович' AND birth_year = 2011 LIMIT 1), 3, 36, NULL, 66.25, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 4001, '2026-04-02', 'Мелюхин Кирилл Александрович', 'МБУ ДО "ДЮСШ "Спарт"', 'Пермский край', 4001, 3),
  (4063, 4013, (SELECT id FROM athletes WHERE last_name = 'Орлов' AND first_name = 'Максим' AND middle_name = 'Вадимович' AND birth_year = 2007 LIMIT 1), 4, 10, NULL, 67.55, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 4001, '2026-04-02', 'Орлов Максим Вадимович', 'МАУ СШ "Свобода" г. Орска', 'Оренбургская область', 4001, 3),
  (4064, 4014, (SELECT id FROM athletes WHERE last_name = 'Новоселов' AND first_name = 'Андрей' AND middle_name = 'Евгеньевич' AND birth_year = 2004 LIMIT 1), 1, 65, NULL, 72.85, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 4001, '2026-04-02', 'Новоселов Андрей Евгеньевич', 'КОГАУ "СШОР "Юность"', 'Кировская область', 4001, 4),
  (4065, 4014, (SELECT id FROM athletes WHERE last_name = 'Шамкаев' AND first_name = 'Радик' AND middle_name = 'Мусаевич' AND birth_year = 1990 LIMIT 1), 2, 55, NULL, 72.75, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 4001, '2026-04-02', 'Шамкаев Радик Мусаевич', 'СШ № 1 им Л.Д. Ковалевского', 'Оренбургская область', 4001, 4),
  (4066, 4014, (SELECT id FROM athletes WHERE last_name = 'Ярусов' AND first_name = 'Константин' AND middle_name = 'Леонидович' AND birth_year = 2006 LIMIT 1), 3, 49, NULL, 70.8, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 4001, '2026-04-02', 'Ярусов Константин Леонидович', 'МБУ ДО "ДЮСШ "Спарт"', 'Пермский край', 4001, 4),
  (4067, 4014, (SELECT id FROM athletes WHERE last_name = 'Попов' AND first_name = 'Кирилл' AND middle_name = 'Александрович' AND birth_year = 2008 LIMIT 1), 4, 48, NULL, 70.6, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 4001, '2026-04-02', 'Попов Кирилл Александрович', 'МБУ ДО "ДЮСШ "Спарт"', 'Пермский край', 4001, 4),
  (4068, 4014, (SELECT id FROM athletes WHERE last_name = 'Маймаков' AND first_name = 'Кадыр' AND middle_name = 'Миратович' AND birth_year = 2009 LIMIT 1), 5, 23, NULL, 72.55, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 4001, '2026-04-02', 'Маймаков Кадыр Миратович', 'СШ Новорского р-на', 'Оренбургская область', 4001, 4),
  (4069, 4014, (SELECT id FROM athletes WHERE last_name = 'Сычёв' AND first_name = 'Алексей' AND middle_name = 'Андреевич' AND birth_year = 2006 LIMIT 1), 6, 15, NULL, 71.55, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 4001, '2026-04-02', 'Сычёв Алексей Андреевич', 'МАУ ДО СШ "Прикамье"', 'Пермский край', 4001, 4),
  (4070, 4015, (SELECT id FROM athletes WHERE last_name = 'Ляукин' AND first_name = 'Кирилл' AND middle_name = 'Сергеевич' AND birth_year = 1999 LIMIT 1), 1, 81, NULL, 78.0, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 4001, '2026-04-02', 'Ляукин Кирилл Сергеевич', '', 'Республика Татарстан', 4001, 5),
  (4071, 4015, (SELECT id FROM athletes WHERE last_name = 'Порцев' AND first_name = 'Роман' AND middle_name = 'Геннадьевич' AND birth_year = 1987 LIMIT 1), 2, 73, NULL, 77.2, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 4001, '2026-04-02', 'Порцев Роман Геннадьевич', 'МАУ ДО СШ "Прикамье"', 'Периский край', 4001, 5),
  (4072, 4015, (SELECT id FROM athletes WHERE last_name = 'Петухов' AND first_name = 'Алексей' AND middle_name = 'Петрович' AND birth_year = 2003 LIMIT 1), 3, 34, NULL, 76.9, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 4001, '2026-04-02', 'Петухов Алексей Петрович', 'СШ Энергия', 'Чувашская Республика', 4001, 5),
  (4073, 4015, (SELECT id FROM athletes WHERE last_name = 'Герцев' AND first_name = 'Артем' AND middle_name = 'Николаевич' AND birth_year = 2010 LIMIT 1), 4, 33, NULL, 77.65, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 4001, '2026-04-02', 'Герцев Артем Николаевич', 'МБУ ДО "СШ" Сорочинского МО', 'Оренбургская область', 4001, 5),
  (4074, 4015, (SELECT id FROM athletes WHERE last_name = 'Углов' AND first_name = 'Никита' AND middle_name = 'Константинович' AND birth_year = 2008 LIMIT 1), 5, 25, NULL, 76.1, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 4001, '2026-04-02', 'Углов Никита Константинович', 'МАУ СШ "Свобода" г. Орска', 'Оренбургская область', 4001, 5),
  (4075, 4015, (SELECT id FROM athletes WHERE last_name = 'Хасанов' AND first_name = 'Рустам' AND middle_name = 'Фаридович' AND birth_year = 1980 LIMIT 1), 6, 17, NULL, 77.85, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 4001, '2026-04-02', 'Хасанов Рустам Фаридович', 'ВФСО "Динамо"', 'Республика Башкортостан', 4001, 5),
  (4076, 4016, (SELECT id FROM athletes WHERE last_name = 'Акульшин' AND first_name = 'Алексей' AND middle_name = 'Сергеевич' AND birth_year = 1994 LIMIT 1), 1, 72, NULL, 84.75, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 4001, '2026-04-02', 'Акульшин Алексей Сергеевич', 'СШ № 1 им Л.Д. Ковалевского', 'Оренбургская область', 4001, 6),
  (4077, 4016, (SELECT id FROM athletes WHERE last_name = 'Пешков' AND first_name = 'Виталий' AND middle_name = 'Юрьевич' AND birth_year = 1998 LIMIT 1), 2, 64, NULL, 83.38, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 4001, '2026-04-02', 'Пешков Виталий Юрьевич', 'СШ № 1 им Л.Д. Ковалевского', 'Оренбургская область', 4001, 6),
  (4078, 4016, (SELECT id FROM athletes WHERE last_name = 'Добровольский' AND first_name = 'Павел' AND middle_name = 'Иванович' AND birth_year = 2009 LIMIT 1), 3, 34, NULL, 81.05, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 4001, '2026-04-02', 'Добровольский Павел Иванович', 'МАУ СШ "Свобода" г. Орск', 'Оренбургская область', 4001, 6),
  (4079, 4016, (SELECT id FROM athletes WHERE last_name = 'Нурсафин' AND first_name = 'Денис' AND middle_name = 'Рафаэльевич' AND birth_year = 1990 LIMIT 1), 4, 34, NULL, 83.75, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 4001, '2026-04-02', 'Нурсафин Денис Рафаэльевич', 'РО ООО "ВФГС" СО', 'Самарская область', 4001, 6),
  (4080, 4017, (SELECT id FROM athletes WHERE last_name = 'Казаков' AND first_name = 'Сергей' AND middle_name = 'Денисович' AND birth_year = 2007 LIMIT 1), 1, 30, NULL, 116.75, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 4001, '2026-04-02', 'Казаков Сергей Денисович', 'СШ № 1 им Л.Д. Ковалевского', 'Оренбургская область', 4001, 8),
  (4081, 4017, (SELECT id FROM athletes WHERE last_name = 'Константинов' AND first_name = 'Александр' AND middle_name = 'Иванович' AND birth_year = 2007 LIMIT 1), 2, 14, NULL, 125.65, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 4001, '2026-04-02', 'Константинов Александр Иванович', 'СШ Энергия', 'Чувашская Республика', 4001, 8),
  (4082, 4018, (SELECT id FROM athletes WHERE last_name = 'Заварзин' AND first_name = 'Павел' AND middle_name = 'Александрович' AND birth_year = 2000 LIMIT 1), 1, 70, NULL, 93.8, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 4001, '2026-04-02', 'Заварзин Павел Александрович', 'СШ № 1 им Л.Д. Ковалевского', 'Оренбургская область', 4001, 7),
  (4083, 4018, (SELECT id FROM athletes WHERE last_name = 'Зуев' AND first_name = 'Илья' AND middle_name = 'Александрович' AND birth_year = 2007 LIMIT 1), 2, 64, NULL, 93.8, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 4001, '2026-04-02', 'Зуев Илья Александрович', 'МАУ ДО СШ "Прикамье"', 'Пермский край', 4001, 7),
  (4084, 4018, (SELECT id FROM athletes WHERE last_name = 'Михайлов' AND first_name = 'Денис' AND middle_name = 'Витальевич' AND birth_year = 1987 LIMIT 1), 3, 50, NULL, 92.95, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 4001, '2026-04-02', 'Михайлов Денис Витальевич', 'СШ Энергия', 'Чувашская Республика', 4001, 7),
  (4085, 4018, (SELECT id FROM athletes WHERE last_name = 'Кодиров' AND first_name = 'Абдумаъруф' AND middle_name = 'Абдукодирович' AND birth_year = 2000 LIMIT 1), 4, 20, NULL, 88.35, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 4001, '2026-04-02', 'Кодиров Абдумаъруф Абдукодирович', 'ДС СШ "Прикамье"', 'Пермский край', 4001, 7),
  (4086, 4019, (SELECT id FROM athletes WHERE last_name = 'Кожеватова' AND first_name = 'Василиса' AND middle_name = 'Егоровна' AND birth_year = 2002 LIMIT 1), 1, 109, NULL, 57.8, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 4001, '2026-04-02', 'Кожеватова Василиса Егоровна', 'СШ № 1 им Л.Д. Ковалевского', 'Оренбургская область', 4001, 31),
  (4087, 4019, (SELECT id FROM athletes WHERE last_name = 'Юлусова' AND first_name = 'Вероника' AND middle_name = 'Николаевна' AND birth_year = 2009 LIMIT 1), 2, 84, NULL, 57.35, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 4001, '2026-04-02', 'Юлусова Вероника Николаевна', 'СШ № 1 им Л.Д. Ковалевского', 'Оренбургская область', 4001, 31),
  (4088, 4019, (SELECT id FROM athletes WHERE last_name = 'Лилуашвили' AND first_name = 'Виктория' AND middle_name = 'Важаевна' AND birth_year = 2010 LIMIT 1), 3, 83, NULL, 55.6, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 4001, '2026-04-02', 'Лилуашвили Виктория Важаевна', 'МБУДО "СШ" Сорочинского МО', 'Оренбургская область', 4001, 31),
  (4089, 4019, (SELECT id FROM athletes WHERE last_name = 'Бурлина' AND first_name = 'Алена' AND middle_name = 'Викторовна' AND birth_year = 2010 LIMIT 1), 4, 78, NULL, 57.1, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 4001, '2026-04-02', 'Бурлина Алена Викторовна', 'МБУ ДО Саракташского р-на', 'Оренбургская область', 4001, 31),
  (4090, 4019, (SELECT id FROM athletes WHERE last_name = 'Бубенцова' AND first_name = 'Софья' AND middle_name = 'Алексеевна' AND birth_year = 2009 LIMIT 1), 5, 67, NULL, 54.55, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 4001, '2026-04-02', 'Бубенцова Софья Алексеевна', 'РО ООО "ВФГС" СО', 'Самарская область', 4001, 31),
  (4091, 4019, (SELECT id FROM athletes WHERE last_name = 'Ковалева' AND first_name = 'Милена' AND middle_name = 'Витальевна' AND birth_year = 2012 LIMIT 1), 6, 58, NULL, 48.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 4001, '2026-04-02', 'Ковалева Милена Витальевна', 'МБУДО "Акбулаксая СШ"', 'Оренбургская область', 4001, 31),
  (4092, 4019, (SELECT id FROM athletes WHERE last_name = 'Уварова' AND first_name = 'Нелли' AND middle_name = 'Валерьевна' AND birth_year = 2009 LIMIT 1), 7, 46, NULL, 55.2, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 4001, '2026-04-02', 'Уварова Нелли Валерьевна', 'СШ "Буревестник"', 'Республика Башкортостан', 4001, 31),
  (4093, 4019, (SELECT id FROM athletes WHERE last_name = 'Карбовская' AND first_name = 'Ангелина' AND middle_name = 'Юрьевна' AND birth_year = 2010 LIMIT 1), 8, 42, NULL, 52.05, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 4001, '2026-04-02', 'Карбовская Ангелина Юрьевна', 'МБУДО "Акбулаксая СШ"', 'Оренбургская область', 4001, 31),
  (4094, 4019, (SELECT id FROM athletes WHERE last_name = 'Симдянова' AND first_name = 'София' AND middle_name = 'Михайловна' AND birth_year = 2006 LIMIT 1), 9, 27, NULL, 57.9, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 4001, '2026-04-02', 'Симдянова София Михайловна', 'МБУ ДО ДЮСШ Чамзинского МО', 'Республика Мордовия', 4001, 31),
  (4095, 4019, (SELECT id FROM athletes WHERE last_name = 'Дмитриева' AND first_name = 'Софья' AND middle_name = 'Александровна' AND birth_year = 2008 LIMIT 1), 10, 12, NULL, 57.05, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 4001, '2026-04-02', 'Дмитриева Софья Александровна', 'МАУ СШ "Свобода" г. Орска', 'Оренбургская область', 4001, 31),
  (4096, 4020, (SELECT id FROM athletes WHERE last_name = 'Бурмакина' AND first_name = 'Екатерина' AND middle_name = 'Сергеевна' AND birth_year = 2005 LIMIT 1), 1, 165, NULL, 62.8, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 4001, '2026-04-02', 'Бурмакина Екатерина Сергеевна', '-', 'Республика Татарстан', 4001, 32),
  (4097, 4020, (SELECT id FROM athletes WHERE last_name = 'Матвеева' AND first_name = 'Елена' AND middle_name = 'Евгеньевна' AND birth_year = 1974 LIMIT 1), 2, 139, NULL, 62.0, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 4001, '2026-04-02', 'Матвеева Елена Евгеньевна', 'КОГАУ "СШОР "Юность"', 'Кировская область', 4001, 32),
  (4098, 4020, (SELECT id FROM athletes WHERE last_name = 'Воронова' AND first_name = 'Наталья' AND middle_name = 'Александровна' AND birth_year = 2006 LIMIT 1), 3, 104, NULL, 62.2, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 4001, '2026-04-02', 'Воронова Наталья Александровна', 'СШ № 1 им Л.Д. Ковалевского', 'Оренбургская область', 4001, 32),
  (4099, 4020, (SELECT id FROM athletes WHERE last_name = 'Малюшина' AND first_name = 'Мария' AND middle_name = 'Алексеевна' AND birth_year = 2009 LIMIT 1), 4, 103, NULL, 60.75, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 4001, '2026-04-02', 'Малюшина Мария Алексеевна', 'МБУДО "СШ" Сорочинского МО', 'Оренбургская область', 4001, 32),
  (4100, 4020, (SELECT id FROM athletes WHERE last_name = 'Козлова' AND first_name = 'Ирина' AND middle_name = 'Дмитриевна' AND birth_year = 2006 LIMIT 1), 5, 26, NULL, 62.8, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 4001, '2026-04-02', 'Козлова Ирина Дмитриевна', 'СШ "Буревестник"', 'Республика Башкортостан', 4001, 32),
  (4101, 4021, (SELECT id FROM athletes WHERE last_name = 'Кузьмичева' AND first_name = 'Ксения' AND middle_name = 'Сергеевна' AND birth_year = 2004 LIMIT 1), 1, 145, NULL, 78.1, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 4001, '2026-04-02', 'Кузьмичева Ксения Сергеевна', 'СШ № 1 им Л.Д. Ковалевского', 'Оренбургская область', 4001, 34),
  (4102, 4021, (SELECT id FROM athletes WHERE last_name = 'Филимонова' AND first_name = 'Карина' AND middle_name = 'Денисовна' AND birth_year = 2006 LIMIT 1), 2, 136, NULL, 85.4, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 4001, '2026-04-02', 'Филимонова Карина Денисовна', 'КОГАУ "СШОР "Юность"', 'Кировская область', 4001, 34),
  (4103, 4021, (SELECT id FROM athletes WHERE last_name = 'Дубовик' AND first_name = 'Светлана' AND middle_name = 'Сергеевна' AND birth_year = 2009 LIMIT 1), 3, 94, NULL, 78.35, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 4001, '2026-04-02', 'Дубовик Светлана Сергеевна', 'МБУ ДО "СШ" Красногвардейского МО', 'Оренбургская область', 4001, 34),
  (4104, 4021, (SELECT id FROM athletes WHERE last_name = 'Черезова' AND first_name = 'Александра' AND middle_name = 'Дмитриевна' AND birth_year = 2011 LIMIT 1), 4, 88, NULL, 74.35, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 4001, '2026-04-02', 'Черезова Александра Дмитриевна', 'КОГАУ "СШОР "Юность"', 'Кировская область', 4001, 34),
  (4105, 4021, (SELECT id FROM athletes WHERE last_name = 'Новикова' AND first_name = 'Полина' AND middle_name = 'Феликсовна' AND birth_year = 2012 LIMIT 1), 5, 86, NULL, 88.15, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 4001, '2026-04-02', 'Новикова Полина Феликсовна', 'КОГАУ "СШОР "Юность"', 'Кировская область', 4001, 34),
  (4106, 4021, (SELECT id FROM athletes WHERE last_name = 'Попова' AND first_name = 'Мария' AND middle_name = 'Алексеевна' AND birth_year = 2005 LIMIT 1), 6, 71, NULL, 80.9, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 4001, '2026-04-02', 'Попова Мария Алексеевна', 'Кит "на спорте"', 'Пермский край', 4001, 34),
  (4107, 4021, (SELECT id FROM athletes WHERE last_name = 'Махкамова' AND first_name = 'Парвина' AND middle_name = 'Маруфовна' AND birth_year = 2007 LIMIT 1), 7, 55, NULL, 89.1, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 4001, '2026-04-02', 'Махкамова Парвина Маруфовна', 'МАУ ДО СШ "Прикамье"', 'Пермский край', 4001, 34),
  (4108, 4021, (SELECT id FROM athletes WHERE last_name = 'Хасанова' AND first_name = 'Алсу' AND middle_name = 'Саматовна' AND birth_year = 1995 LIMIT 1), 8, 35, NULL, 79.1, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 4001, '2026-04-02', 'Хасанова Алсу Саматовна', 'Отдел образования г. Стерлитамак', 'Республика Башкортостан', 4001, 34),
  (4109, 4022, (SELECT id FROM athletes WHERE last_name = 'Калугина' AND first_name = 'Ирина' AND middle_name = 'Вячеславовна' AND birth_year = 2008 LIMIT 1), 1, 123, NULL, 65.8, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 4001, '2026-04-02', 'Калугина Ирина Вячеславовна', 'СШ № 1 им Л.Д. Ковалевского', 'Оренбургская область', 4001, 33),
  (4110, 4022, (SELECT id FROM athletes WHERE last_name = 'Плечова' AND first_name = 'Карина' AND middle_name = 'Юрьевна' AND birth_year = 2007 LIMIT 1), 2, 122, NULL, 65.95, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 4001, '2026-04-02', 'Плечова Карина Юрьевна', 'СШ Энергия', 'Чувашская Республика', 4001, 33),
  (4111, 4022, (SELECT id FROM athletes WHERE last_name = 'Кузьмичева' AND first_name = 'Екатерина' AND middle_name = 'Сергеевна' AND birth_year = 2004 LIMIT 1), 3, 95, NULL, 67.65, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 4001, '2026-04-02', 'Кузьмичева Екатерина Сергеевна', 'СШ № 1 им Л.Д. Ковалевского', 'Оренбургская область', 4001, 33),
  (4112, 4022, (SELECT id FROM athletes WHERE last_name = 'Имаева' AND first_name = 'Гузель' AND middle_name = 'Мунировна' AND birth_year = 2004 LIMIT 1), 4, 68, NULL, 66.7, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 4001, '2026-04-02', 'Имаева Гузель Мунировна', 'СШ "Буревестник"', 'Республика Башкортостан', 4001, 33),
  (4113, 4022, (SELECT id FROM athletes WHERE last_name = 'Морогина' AND first_name = 'Наталья' AND middle_name = 'Леонидовна' AND birth_year = 1972 LIMIT 1), 5, 67, NULL, 67.35, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 4001, '2026-04-02', 'Морогина Наталья Леонидовна', 'РО ООО "ВФГС" в Кировской обл.', 'Кировская область', 4001, 33),
  (4114, 4023, (SELECT id FROM athletes WHERE last_name = 'Сиразетдинов' AND first_name = 'Данил' AND middle_name = 'Ильфатович' AND birth_year = 2007 LIMIT 1), 1, 155, NULL, 63.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Сиразетдинов Данил Ильфатович', 'МАУ ДО СШ "Прикамье"', 'Пермский край', 4001, 24),
  (4115, 4023, (SELECT id FROM athletes WHERE last_name = 'Лавринов' AND first_name = 'Валерий' AND middle_name = 'Александрович' AND birth_year = 1980 LIMIT 1), 2, 104, NULL, 62.5, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Лавринов Валерий Александрович', 'СШ № 1 им Л.Д. Ковалевского', 'Оренбургская область', 4001, 24),
  (4116, 4023, (SELECT id FROM athletes WHERE last_name = 'Половников' AND first_name = 'Павел' AND middle_name = 'Викторович' AND birth_year = 2002 LIMIT 1), 3, 98, NULL, 61.85, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Половников Павел Викторович', 'МБУ ДО "ДЮСШ "Спарт"', 'Пермский край', 4001, 24),
  (4117, 4023, (SELECT id FROM athletes WHERE last_name = 'Афанасьев' AND first_name = 'Даниил' AND middle_name = 'Петрович' AND birth_year = 2009 LIMIT 1), 4, 33, NULL, 58.96, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Афанасьев Даниил Петрович', 'МБУ ДО "Грачевская СШ"', 'Оренбургская область', 4001, 24),
  (4118, 4024, (SELECT id FROM athletes WHERE last_name = 'Узюкин' AND first_name = 'Анатолий' AND middle_name = 'Эдуардович' AND birth_year = 2000 LIMIT 1), 1, 175, NULL, 67.9, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Узюкин Анатолий Эдуардович', 'СШ Энергия', 'Чувашская Республика', 4001, 25),
  (4119, 4024, (SELECT id FROM athletes WHERE last_name = 'Цюпко' AND first_name = 'Егор' AND middle_name = 'Александрович' AND birth_year = 2007 LIMIT 1), 2, 115, NULL, 66.6, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Цюпко Егор Александрович', 'МАУ ДШ "Чемпион"', 'Республика Башкортостан', 4001, 25),
  (4120, 4024, (SELECT id FROM athletes WHERE last_name = 'Башаров' AND first_name = 'Ислам' AND middle_name = 'Нурисламович' AND birth_year = 2007 LIMIT 1), 3, 111, NULL, 67.9, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Башаров Ислам Нурисламович', '-', 'Республика Татарстан', 4001, 25),
  (4121, 4024, (SELECT id FROM athletes WHERE last_name = 'Громов' AND first_name = 'Алексей' AND middle_name = 'Николаевич' AND birth_year = 1995 LIMIT 1), 4, 100, NULL, 67.45, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Громов Алексей Николаевич', '-', 'Удмуртская область', 4001, 25),
  (4122, 4024, (SELECT id FROM athletes WHERE last_name = 'Башаров' AND first_name = 'Арыслан' AND middle_name = 'Нурисламович' AND birth_year = 2007 LIMIT 1), 5, 95, NULL, 68.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Башаров Арыслан Нурисламович', '-', 'Республика Татарстан', 4001, 25),
  (4123, 4024, (SELECT id FROM athletes WHERE last_name = 'Лучинин' AND first_name = 'Илья' AND middle_name = 'Михайлович' AND birth_year = 2008 LIMIT 1), 6, 90, NULL, 68.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Лучинин Илья Михайлович', 'КОГАУ "СШОР "Юность"', 'Кировская область', 4001, 25),
  (4124, 4025, (SELECT id FROM athletes WHERE last_name = 'Балдин' AND first_name = 'Александр' AND middle_name = 'Васильевич' AND birth_year = 1993 LIMIT 1), 1, 176, NULL, 72.25, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Балдин Александр Васильевич', 'РО ООО "ВФГС" СО', 'Самарская область', 4001, 26),
  (4125, 4025, (SELECT id FROM athletes WHERE last_name = 'Паклин' AND first_name = 'Павел' AND middle_name = 'Алексеевич' AND birth_year = 1990 LIMIT 1), 2, 140, NULL, 72.6, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Паклин Павел Алексеевич', 'МАУ ДО СШ "Прикамье"', 'Пермский край', 4001, 26),
  (4126, 4025, (SELECT id FROM athletes WHERE last_name = 'Гарифуллин' AND first_name = 'Константин' AND middle_name = 'Фардатович' AND birth_year = 1999 LIMIT 1), 3, 128, NULL, 73.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Гарифуллин Константин Фардатович', '-', 'Удмуртская Республика', 4001, 26),
  (4127, 4025, (SELECT id FROM athletes WHERE last_name = 'Шамкаев' AND first_name = 'Радик' AND middle_name = 'Мусаевич' AND birth_year = 1990 LIMIT 1), 4, 120, NULL, 72.95, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Шамкаев Радик Мусаевич', 'СШ № 1 им Л.Д. Ковалевского', 'Оренбургская область', 4001, 26),
  (4128, 4025, (SELECT id FROM athletes WHERE last_name = 'Ермаков' AND first_name = 'Игорь' AND middle_name = 'Анатольевич' AND birth_year = 1992 LIMIT 1), 5, 85, NULL, 72.3, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Ермаков Игорь Анатольевич', 'МАУ ДО СШ "Прикамье"', 'Пермский край', 4001, 26),
  (4129, 4026, (SELECT id FROM athletes WHERE last_name = 'Алексеев' AND first_name = 'Радиф' AND middle_name = 'Дамирович' AND birth_year = 1989 LIMIT 1), 1, 180, NULL, 77.4, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Алексеев Радиф Дамирович', 'СШ Энергия', 'Чувашская Республика', 4001, 27),
  (4130, 4026, (SELECT id FROM athletes WHERE last_name = 'Третьяков' AND first_name = 'Владислав' AND middle_name = 'Владимирович' AND birth_year = 1989 LIMIT 1), 2, 176, NULL, 77.4, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Третьяков Владислав Владимирович', 'СШ № 1 им Л.Д. Ковалевского', 'Оренбургская область', 4001, 27),
  (4131, 4026, (SELECT id FROM athletes WHERE last_name = 'Бурков' AND first_name = 'Юрий' AND middle_name = 'Михайлович' AND birth_year = 1987 LIMIT 1), 3, 120, NULL, 77.9, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Бурков Юрий Михайлович', '-', 'Удмуртская Республика', 4001, 27),
  (4132, 4026, (SELECT id FROM athletes WHERE last_name = 'Петухов' AND first_name = 'Алексей' AND middle_name = 'Петрович' AND birth_year = 2003 LIMIT 1), 4, 111, NULL, 77.3, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Петухов Алексей Петрович', 'СШ Энергия', 'Чувашская Республика', 4001, 27),
  (4133, 4026, (SELECT id FROM athletes WHERE last_name = 'Хасанов' AND first_name = 'Рустам' AND middle_name = 'Фаридович' AND birth_year = 1980 LIMIT 1), 5, 105, NULL, 78.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Хасанов Рустам Фаридович', 'ВФСО "Динамо"', 'Республика Башкортостан', 4001, 27),
  (4134, 4026, (SELECT id FROM athletes WHERE last_name = 'Хайбуллин' AND first_name = 'Разяп' AND middle_name = 'Ринатович' AND birth_year = 2007 LIMIT 1), 6, 93, NULL, 76.25, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Хайбуллин Разяп Ринатович', '-', 'Республика Татарстан', 4001, 27),
  (4135, 4026, (SELECT id FROM athletes WHERE last_name = 'Гоцко' AND first_name = 'Роман' AND middle_name = 'Иванович' AND birth_year = 2006 LIMIT 1), 7, 92, NULL, 77.65, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Гоцко Роман Иванович', '-', 'Удмуртская Республика', 4001, 27),
  (4136, 4026, (SELECT id FROM athletes WHERE last_name = 'Порцев' AND first_name = 'Роман' AND middle_name = 'Геннадьевич' AND birth_year = 1987 LIMIT 1), 8, 90, NULL, 77.9, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Порцев Роман Геннадьевич', 'МАУ ДО СШ "Прикамье"', 'Пермский край', 4001, 27),
  (4137, 4027, (SELECT id FROM athletes WHERE last_name = 'Крестьянинов' AND first_name = 'Виктор' AND middle_name = 'Александрович' AND birth_year = 2000 LIMIT 1), 1, 170, NULL, 83.75, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Крестьянинов Виктор Александрович', 'МАУ ДО СШ "Прикамье"', 'Пермский край', 4001, 28),
  (4138, 4027, (SELECT id FROM athletes WHERE last_name = 'Бахтов' AND first_name = 'Илья' AND middle_name = 'Владимирович' AND birth_year = 1989 LIMIT 1), 2, 134, NULL, 83.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Бахтов Илья Владимирович', 'РО ООО "ВФГС" СО', 'Самарская область', 4001, 28),
  (4139, 4027, (SELECT id FROM athletes WHERE last_name = 'Салихов' AND first_name = 'Рустам' AND middle_name = 'Ренатович' AND birth_year = 1982 LIMIT 1), 3, 106, NULL, 84.5, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Салихов Рустам Ренатович', '-', 'Оренбургская область', 4001, 28),
  (4140, 4027, (SELECT id FROM athletes WHERE last_name = 'Добровольский' AND first_name = 'Павел' AND middle_name = 'Иванович' AND birth_year = 2009 LIMIT 1), 4, 85, NULL, 81.55, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Добровольский Павел Иванович', 'МАУ СШ "Свобода" г. Орск', 'Оренбургская область', 4001, 28),
  (4141, 4027, (SELECT id FROM athletes WHERE last_name = 'Файзулин' AND first_name = 'Данис' AND middle_name = 'Марсэлевич' AND birth_year = 2012 LIMIT 1), 5, 60, NULL, 83.1, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Файзулин Данис Марсэлевич', 'МБУДО"СШ" Сорочинского МО', 'Оренбургская область', 4001, 28),
  (4142, 4027, (SELECT id FROM athletes WHERE last_name = 'Волошин' AND first_name = 'Валентин' AND middle_name = 'Иванович' AND birth_year = 2007 LIMIT 1), 6, 60, NULL, 83.55, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Волошин Валентин Иванович', 'МАУ ДО СШ "Прикамье"', 'Пермский край', 4001, 28),
  (4143, 4028, (SELECT id FROM athletes WHERE last_name = 'Павлов' AND first_name = 'Александр' AND middle_name = 'Станиславович' AND birth_year = 1994 LIMIT 1), 1, 181, NULL, 112.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Павлов Александр Станиславович', 'СШ Энергия', 'Чувашская Республика', 4001, 30),
  (4144, 4028, (SELECT id FROM athletes WHERE last_name = 'Булагасов' AND first_name = 'Эдуард' AND middle_name = 'Олегович' AND birth_year = 1991 LIMIT 1), 2, 174, NULL, 99.6, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Булагасов Эдуард Олегович', 'СШ № 1 им Л.Д. Ковалевского', 'Оренбургская область', 4001, 30),
  (4145, 4028, (SELECT id FROM athletes WHERE last_name = 'Усатов' AND first_name = 'Николай' AND middle_name = 'Владимирович' AND birth_year = 1988 LIMIT 1), 3, 161, NULL, 105.95, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Усатов Николай Владимирович', 'РО ООО "ВФГС" СО', 'Самарская область', 4001, 30),
  (4146, 4028, (SELECT id FROM athletes WHERE last_name = 'Царегородцев' AND first_name = 'Дмитрий' AND middle_name = 'Владимирович' AND birth_year = 1981 LIMIT 1), 4, 123, NULL, 104.3, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Царегородцев Дмитрий Владимирович', 'МБУ ДО СШ "Лидер" Слободского р-на', 'Кировская область', 4001, 30),
  (4147, 4028, (SELECT id FROM athletes WHERE last_name = 'Константинов' AND first_name = 'Александр' AND middle_name = 'Иванович' AND birth_year = 2003 LIMIT 1), 5, 121, NULL, 125.7, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Константинов Александр Иванович', 'СШ Энергия', 'Чувашская Республика', 4001, 30),
  (4148, 4028, (SELECT id FROM athletes WHERE last_name = 'Кукжанов' AND first_name = 'Дияс' AND middle_name = 'Канатович' AND birth_year = 2007 LIMIT 1), 6, 107, NULL, 115.55, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Кукжанов Дияс Канатович', 'СШ № 1 им Л.Д. Ковалевского', 'Оренбургская область', 4001, 30),
  (4149, 4028, (SELECT id FROM athletes WHERE last_name = 'Соболев' AND first_name = 'Никита' AND middle_name = 'Александрович' AND birth_year = 2006 LIMIT 1), 7, 106, NULL, 111.25, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Соболев Никита Александрович', '-', 'Удмуртская Республика', 4001, 30),
  (4150, 4028, (SELECT id FROM athletes WHERE last_name = 'Ляпин' AND first_name = 'Кирилл' AND middle_name = 'Алексеевич' AND birth_year = 2009 LIMIT 1), 8, 45, NULL, 131.6, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Ляпин Кирилл Алексеевич', 'СШ № 1 им Л.Д. Ковалевского', 'Оренбургская область', 4001, 30),
  (4151, 4029, (SELECT id FROM athletes WHERE last_name = 'Носков' AND first_name = 'Андрей' AND middle_name = 'Николаевич' AND birth_year = 1993 LIMIT 1), 1, 201, NULL, 94.4, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Носков Андрей Николаевич', 'МАУ ДО СШ "Прикамье"', 'Пермский край', 4001, 29),
  (4152, 4029, (SELECT id FROM athletes WHERE last_name = 'Башаров' AND first_name = 'Нурислам' AND middle_name = 'Максумович' AND birth_year = 1983 LIMIT 1), 2, 161, NULL, 92.5, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Башаров Нурислам Максумович', '-', 'Республика Татарстан', 4001, 29),
  (4153, 4029, (SELECT id FROM athletes WHERE last_name = 'Кабанов' AND first_name = 'Ринат' AND middle_name = 'Камилович' AND birth_year = 1994 LIMIT 1), 3, 151, NULL, 94.05, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Кабанов Ринат Камилович', 'СШ № 1 им Л.Д. Ковалевского', 'Оренбургская область', 4001, 29),
  (4154, 4029, (SELECT id FROM athletes WHERE last_name = 'Кодиров' AND first_name = 'Абдумаъруф' AND middle_name = 'Абдукодирович' AND birth_year = 2000 LIMIT 1), 4, 141, NULL, 88.3, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Кодиров Абдумаъруф Абдукодирович', 'ДС СШ "Прикамье"', 'Пермский край', 4001, 29),
  (4155, 4029, (SELECT id FROM athletes WHERE last_name = 'Пирожников' AND first_name = 'Александр' AND middle_name = 'Андреевич' AND birth_year = 1987 LIMIT 1), 5, 139, NULL, 95.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Пирожников Александр Андреевич', 'ДС СШ "Прикамье"', 'Пермский край', 4001, 29),
  (4156, 4029, (SELECT id FROM athletes WHERE last_name = 'Ипатов' AND first_name = 'Евгений' AND middle_name = 'Николаевич' AND birth_year = 1994 LIMIT 1), 6, 127, NULL, 93.85, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Ипатов Евгений Николаевич', '-', 'Удмуртская Республика', 4001, 29),
  (4157, 4029, (SELECT id FROM athletes WHERE last_name = 'Симдянов' AND first_name = 'Михаил' AND middle_name = 'Владимирович' AND birth_year = 1981 LIMIT 1), 7, 69, NULL, 94.5, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 4001, '2026-04-02', 'Симдянов Михаил Владимирович', 'МБУ ДО ДЮСШ Чамзинского МО', 'Республика Мордовия', 4001, 29);

INSERT INTO result_reps (id, result_id, exercise, hand, reps) VALUES
  (4001, 4001, 'jerk', 'both', 42),
  (4002, 4002, 'jerk', 'both', 21),
  (4003, 4003, 'jerk', 'both', 82),
  (4004, 4004, 'jerk', 'both', 75),
  (4005, 4005, 'jerk', 'both', 53),
  (4006, 4006, 'jerk', 'both', 45),
  (4007, 4007, 'jerk', 'both', 36),
  (4008, 4008, 'jerk', 'both', 32),
  (4009, 4009, 'jerk', 'both', 4),
  (4010, 4010, 'jerk', 'both', 84),
  (4011, 4011, 'jerk', 'both', 62),
  (4012, 4012, 'jerk', 'both', 61),
  (4013, 4013, 'jerk', 'both', 58),
  (4014, 4014, 'jerk', 'both', 57),
  (4015, 4015, 'jerk', 'both', 56),
  (4016, 4016, 'jerk', 'both', 28),
  (4017, 4017, 'jerk', 'both', 115),
  (4018, 4018, 'jerk', 'both', 75),
  (4019, 4019, 'jerk', 'both', 71),
  (4020, 4020, 'jerk', 'both', 71),
  (4021, 4021, 'jerk', 'both', 63),
  (4022, 4022, 'jerk', 'both', 57),
  (4023, 4023, 'jerk', 'both', 104),
  (4024, 4024, 'jerk', 'both', 76),
  (4025, 4025, 'jerk', 'both', 69),
  (4026, 4026, 'jerk', 'both', 69),
  (4027, 4027, 'jerk', 'both', 67),
  (4028, 4028, 'jerk', 'both', 55),
  (4029, 4029, 'jerk', 'both', 52),
  (4030, 4030, 'jerk', 'both', 42),
  (4031, 4031, 'jerk', 'both', 40),
  (4032, 4032, 'jerk', 'both', 124),
  (4033, 4033, 'jerk', 'both', 94),
  (4034, 4034, 'jerk', 'both', 90),
  (4035, 4035, 'jerk', 'both', 38),
  (4036, 4036, 'jerk', 'both', 144),
  (4037, 4037, 'jerk', 'both', 109),
  (4038, 4038, 'jerk', 'both', 108),
  (4039, 4039, 'jerk', 'both', 100),
  (4040, 4040, 'jerk', 'both', 60),
  (4041, 4041, 'jerk', 'both', 29),
  (4042, 4042, 'jerk', 'both', 104),
  (4043, 4043, 'jerk', 'both', 100),
  (4044, 4044, 'jerk', 'both', 49),
  (4045, 4045, 'jerk', 'both', 112),
  (4046, 4046, 'jerk', 'both', 89),
  (4047, 4047, 'jerk', 'both', 65),
  (4048, 4048, 'jerk', 'both', 62),
  (4049, 4049, 'jerk', 'both', 42),
  (4050, 4050, 'long_cycle', 'both', 45),
  (4051, 4051, 'long_cycle', 'both', 61),
  (4052, 4052, 'long_cycle', 'both', 40),
  (4053, 4053, 'long_cycle', 'both', 26),
  (4054, 4054, 'long_cycle', 'both', 21),
  (4055, 4055, 'long_cycle', 'both', 16),
  (4056, 4056, 'long_cycle', 'both', 0),
  (4057, 4057, 'long_cycle', 'both', 63),
  (4058, 4058, 'long_cycle', 'both', 35),
  (4059, 4059, 'long_cycle', 'both', 20),
  (4060, 4060, 'long_cycle', 'both', 42),
  (4061, 4061, 'long_cycle', 'both', 39),
  (4062, 4062, 'long_cycle', 'both', 36),
  (4063, 4063, 'long_cycle', 'both', 10),
  (4064, 4064, 'long_cycle', 'both', 65),
  (4065, 4065, 'long_cycle', 'both', 55),
  (4066, 4066, 'long_cycle', 'both', 49),
  (4067, 4067, 'long_cycle', 'both', 48),
  (4068, 4068, 'long_cycle', 'both', 23),
  (4069, 4069, 'long_cycle', 'both', 15),
  (4070, 4070, 'long_cycle', 'both', 81),
  (4071, 4071, 'long_cycle', 'both', 73),
  (4072, 4072, 'long_cycle', 'both', 34),
  (4073, 4073, 'long_cycle', 'both', 33),
  (4074, 4074, 'long_cycle', 'both', 25),
  (4075, 4075, 'long_cycle', 'both', 17),
  (4076, 4076, 'long_cycle', 'both', 72),
  (4077, 4077, 'long_cycle', 'both', 64),
  (4078, 4078, 'long_cycle', 'both', 34),
  (4079, 4079, 'long_cycle', 'both', 34),
  (4080, 4080, 'long_cycle', 'both', 30),
  (4081, 4081, 'long_cycle', 'both', 14),
  (4082, 4082, 'long_cycle', 'both', 70),
  (4083, 4083, 'long_cycle', 'both', 64),
  (4084, 4084, 'long_cycle', 'both', 50),
  (4085, 4085, 'long_cycle', 'both', 20),
  (4086, 4086, 'snatch', 'both', 109),
  (4087, 4087, 'snatch', 'both', 84),
  (4088, 4088, 'snatch', 'both', 83),
  (4089, 4089, 'snatch', 'both', 78),
  (4090, 4090, 'snatch', 'both', 67),
  (4091, 4091, 'snatch', 'both', 58),
  (4092, 4092, 'snatch', 'both', 46),
  (4093, 4093, 'snatch', 'both', 42),
  (4094, 4094, 'snatch', 'both', 27),
  (4095, 4095, 'snatch', 'both', 12),
  (4096, 4096, 'snatch', 'both', 165),
  (4097, 4097, 'snatch', 'both', 139),
  (4098, 4098, 'snatch', 'both', 104),
  (4099, 4099, 'snatch', 'both', 103),
  (4100, 4100, 'snatch', 'both', 26),
  (4101, 4101, 'snatch', 'both', 145),
  (4102, 4102, 'snatch', 'both', 136),
  (4103, 4103, 'snatch', 'both', 94),
  (4104, 4104, 'snatch', 'both', 88),
  (4105, 4105, 'snatch', 'both', 86),
  (4106, 4106, 'snatch', 'both', 71),
  (4107, 4107, 'snatch', 'both', 55),
  (4108, 4108, 'snatch', 'both', 35),
  (4109, 4109, 'snatch', 'both', 123),
  (4110, 4110, 'snatch', 'both', 122),
  (4111, 4111, 'snatch', 'both', 95),
  (4112, 4112, 'snatch', 'both', 68),
  (4113, 4113, 'snatch', 'both', 67),
  (4114, 4114, 'snatch', 'both', 155),
  (4115, 4115, 'snatch', 'both', 104),
  (4116, 4116, 'snatch', 'both', 98),
  (4117, 4117, 'snatch', 'both', 33),
  (4118, 4118, 'snatch', 'both', 175),
  (4119, 4119, 'snatch', 'both', 115),
  (4120, 4120, 'snatch', 'both', 111),
  (4121, 4121, 'snatch', 'both', 100),
  (4122, 4122, 'snatch', 'both', 95),
  (4123, 4123, 'snatch', 'both', 90),
  (4124, 4124, 'snatch', 'both', 176),
  (4125, 4125, 'snatch', 'both', 140),
  (4126, 4126, 'snatch', 'both', 128),
  (4127, 4127, 'snatch', 'both', 120),
  (4128, 4128, 'snatch', 'both', 85),
  (4129, 4129, 'snatch', 'both', 180),
  (4130, 4130, 'snatch', 'both', 176),
  (4131, 4131, 'snatch', 'both', 120),
  (4132, 4132, 'snatch', 'both', 111),
  (4133, 4133, 'snatch', 'both', 105),
  (4134, 4134, 'snatch', 'both', 93),
  (4135, 4135, 'snatch', 'both', 92),
  (4136, 4136, 'snatch', 'both', 90),
  (4137, 4137, 'snatch', 'both', 170),
  (4138, 4138, 'snatch', 'both', 134),
  (4139, 4139, 'snatch', 'both', 106),
  (4140, 4140, 'snatch', 'both', 85),
  (4141, 4141, 'snatch', 'both', 60),
  (4142, 4142, 'snatch', 'both', 60),
  (4143, 4143, 'snatch', 'both', 181),
  (4144, 4144, 'snatch', 'both', 174),
  (4145, 4145, 'snatch', 'both', 161),
  (4146, 4146, 'snatch', 'both', 123),
  (4147, 4147, 'snatch', 'both', 121),
  (4148, 4148, 'snatch', 'both', 107),
  (4149, 4149, 'snatch', 'both', 106),
  (4150, 4150, 'snatch', 'both', 45),
  (4151, 4151, 'snatch', 'both', 201),
  (4152, 4152, 'snatch', 'both', 161),
  (4153, 4153, 'snatch', 'both', 151),
  (4154, 4154, 'snatch', 'both', 141),
  (4155, 4155, 'snatch', 'both', 139),
  (4156, 4156, 'snatch', 'both', 127),
  (4157, 4157, 'snatch', 'both', 69);

