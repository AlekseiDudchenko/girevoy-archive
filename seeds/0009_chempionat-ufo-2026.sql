-- Чемпионат Уральского федерального округа 2026, Губкинский, 2026-04-08—2026-04-12.
-- Сгенерировано scripts/gen_seed.py из data/chempionat-ufo-2026.json, не править руками.
-- Источник — скан официальных протоколов чемпионата Уральского федерального округа 2026 (PDF без текстового слоя). ФИО с отчеством, дата рождения полная. Импорт ведётся по одной индивидуальной категории отдельным merge и deploy. Эстафеты (стр. 1–2), командный зачёт (стр. 37–38) и командные очки отдельных протоколов не импортируются. Жонглирование (стр. 36) не поддержано текущей схемой. Список судей (стр. 39) в модель импорта протоколов не входит.
-- Данные извлечены из протокола моделью; сверка человеком не проводилась,
-- поэтому results.verified_by остаётся пустым (FR-A14).

INSERT OR IGNORE INTO regions (name, country) VALUES
  ('Ханты-Мансийский АО - Югра', 'RU'),
  ('Ямало-Ненецкий автономный округ', 'RU'),
  ('Челябинская область', 'RU'),
  ('Курганская область', 'RU'),
  ('Тюменская область', 'RU'),
  ('Свердловская область', 'RU');

INSERT OR IGNORE INTO clubs (name, region_id) VALUES
  ('МБУ ДО СШОР «Югория» им. А.А. Пилюгина', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')),
  ('МАУ ДО СШ "Геолог"', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')),
  ('СШОР "Атлет"', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')),
  ('ВФГС ЯНАО', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')),
  ('МБУДО "Каргапольская ДЮСШ"', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')),
  ('ТРО ООО «ВФГС»', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')),
  ('Спортивная школа города Ялуторовска', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')),
  ('МАУ ДО "Спортивная школа"', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')),
  ('ООО «Газпром добыча Уренгой»', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')),
  ('МАУ ДО «Спортивная школа №2» Сургутского р-на', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')),
  ('РО ООО ВФГС в Челябинской области', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')),
  ('МАУ ДО "СШ № 1" г.Тобольска', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')),
  ('СШОР "Старт"', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')),
  ('МБУ ДО "Лебяжьевская ДЮСШ"', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')),
  ('МАУ ДО ДЮЦ "Старт" города Тюмени', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')),
  ('ВС', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')),
  ('МБУ ДО СШ "Зенит"', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')),
  ('МАУ «Районное управление спортивных сооружений»', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')),
  ('МБУ ЦРФКИС', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')),
  ('ООО "Газпром переработка"', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')),
  ('МБУДО "Куртамышская ДЮСШ"', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')),
  ('КСК Факел', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')),
  ('МАУ "ЦФОР-Ритм"', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')),
  ('Федерация гиревого спорта СО', (SELECT id FROM regions WHERE name = 'Свердловская область' AND country = 'RU')),
  ('МАУ "ЦСФР" города Ялуторовска', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')),
  ('МБУ ДО "Варгашинская СШ"', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')),
  ('МАУ ДО ДЮСШ Юность', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')),
  ('МАУ ДО "Спортивная школа №2" Сургутского р-на', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')),
  ('РООО ВФГС в Челябинской области', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')),
  ('МБУДО "Варгашинская СШ"', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')),
  ('Федоровский Спортивно оздоровительный центр', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')),
  ('"СШ Олимп" г.Челябинска', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')),
  ('БУ СУРГПУ, Спортивный клуб.', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')),
  ('СК "Олимп"', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')),
  ('ТРО ООО ВФГС', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')),
  ('РО ООО ВФГС в КО', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')),
  ('МАУ ДО «Спортивная школа «Югория» г. Нягань', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')),
  ('МАУ ДО «Абалакский центр спорта и творчества»', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')),
  ('МБУ ДО "Каргапольская ДЮСШ"', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')),
  ('ООО "ТТЮ"', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')),
  ('МАУ ДО ДЮСШ "Старт" города Тюмени', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')),
  ('ФГУП "ПСЗ" г. ТРЕХГОРНЫЙ', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')),
  ('-', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')),
  ('КСК Факел Газпром добыча Ноябрьск', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')),
  ('РОО "ВФГС Курганской области"', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')),
  ('МАУ СОК "Звездный"', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')),
  ('АО Роспан Интернешнл', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'));

INSERT OR IGNORE INTO federations (name, short_name, country) VALUES
  ('Всероссийская федерация гиревого спорта', 'ВФГС', 'RU');

INSERT INTO competitions (id, slug, name, date_start, date_end, city, country, competition_rank_id, federation_id, source_url, is_published) VALUES
  (6001, 'chempionat-ufo-2026', 'Чемпионат Уральского федерального округа 2026', '2026-04-08', '2026-04-12', 'Губкинский', 'RU', (SELECT id FROM competition_ranks WHERE code = 'federal_district'), (SELECT id FROM federations WHERE name = 'Всероссийская федерация гиревого спорта'), NULL, 1);

INSERT INTO protocols (id, competition_id, r2_key, filename, page_count, is_scan, status, published_at) VALUES
  (6001, 6001, 'protocols/chempionat-ufo-2026.pdf', 'protokoly-ufo.pdf', 39, 1, 'published', '2026-04-08');

INSERT INTO categories (id, competition_id, discipline_id, sex, age_group_id, division_id, bell_kg, hands, time_limit_min, weight_class_raw, weight_class_kg, weight_class_is_open, participants_declared, is_deferred, sort_order) VALUES
  (6001, 6001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '58', 58, 0, 2, 0, 1),
  (6002, 6001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '63', 63, 0, 3, 0, 2),
  (6003, 6001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '68+', 68, 1, 5, 0, 3),
  (6004, 6001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '68', 68, 0, 3, 0, 4),
  (6005, 6001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '63', 63, 0, 4, 0, 5),
  (6006, 6001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '68', 68, 0, 3, 0, 6),
  (6007, 6001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '73', 73, 0, 7, 0, 7),
  (6008, 6001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '78', 78, 0, 6, 0, 8),
  (6009, 6001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '85', 85, 0, 8, 0, 9),
  (6010, 6001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '95+', 95, 1, 3, 0, 10),
  (6011, 6001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '95', 95, 0, 8, 0, 11),
  (6012, 6001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '58', 58, 0, 3, 0, 12),
  (6013, 6001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '63', 63, 0, 1, 0, 13),
  (6014, 6001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '68+', 68, 1, 4, 0, 14),
  (6015, 6001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '68', 68, 0, 2, 0, 15),
  (6016, 6001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '63', 63, 0, 6, 0, 16),
  (6017, 6001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '68', 68, 0, 3, 0, 17),
  (6018, 6001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '73', 73, 0, 5, 0, 18),
  (6019, 6001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '78', 78, 0, 8, 0, 19),
  (6020, 6001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '85', 85, 0, 8, 0, 20),
  (6021, 6001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '95+', 95, 1, 2, 0, 21),
  (6022, 6001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '95', 95, 0, 4, 0, 22),
  (6023, 6001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'one', 10, '58', 58, 0, 14, 0, 23),
  (6024, 6001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'one', 10, '63', 63, 0, 7, 0, 24),
  (6025, 6001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'one', 10, '68+', 68, 1, 7, 0, 25),
  (6026, 6001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'one', 10, '68', 68, 0, 6, 0, 26),
  (6027, 6001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '63', 63, 0, 8, 0, 27),
  (6028, 6001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '68', 68, 0, 10, 0, 28),
  (6029, 6001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '73', 73, 0, 11, 0, 29),
  (6030, 6001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '78', 78, 0, 13, 0, 30),
  (6031, 6001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '85', 85, 0, 8, 0, 31),
  (6032, 6001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '95+', 95, 1, 8, 0, 32),
  (6033, 6001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '95', 95, 0, 11, 0, 33);

INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кошурникова', 'Валерия', 'Александровна', 2012, 'f', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР «Югория» им. А.А. Пилюгина' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Шпартко М.А.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кошурникова' AND a.first_name = 'Валерия' AND a.middle_name = 'Александровна' AND a.birth_year = 2012 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Трофимова', 'Александра', 'Александровна', 2008, 'f', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШ "Геолог"' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Бабичев М.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Трофимова' AND a.first_name = 'Александра' AND a.middle_name = 'Александровна' AND a.birth_year = 2008 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Степанова', 'Оксана', 'Анатольевна', 1990, 'f', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Атлет"' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Степанов С.В., Денисов И.Н., Трофимов М.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Степанова' AND a.first_name = 'Оксана' AND a.middle_name = 'Анатольевна' AND a.birth_year = 1990 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бахтина', 'Виктория', 'Викторовна', 1999, 'f', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВФГС ЯНАО' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Ашенов Т.К.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бахтина' AND a.first_name = 'Виктория' AND a.middle_name = 'Викторовна' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Белоглазова', 'Елизавета', 'Александровна', 2002, 'f', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУДО "Каргапольская ДЮСШ"' AND region_id = (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')), 'Стрекаловских С.К.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Белоглазова' AND a.first_name = 'Елизавета' AND a.middle_name = 'Александровна' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Полякова', 'Полина', 'Сергеевна', 1999, 'f', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ТРО ООО «ВФГС»' AND region_id = (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')), 'Мартьянов А.В., Барков А.П., Садыков Р.И.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Полякова' AND a.first_name = 'Полина' AND a.middle_name = 'Сергеевна' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Фируглева', 'Василиса', 'Владимировна', 2004, 'f', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШ "Геолог"' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Бабичев М.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Фируглева' AND a.first_name = 'Василиса' AND a.middle_name = 'Владимировна' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Дубровина', 'Татьяна', 'Александровна', 2003, 'f', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Спортивная школа города Ялуторовска' AND region_id = (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')), 'Спасенников А.В., Садыков Р.И.', (SELECT id FROM sport_ranks WHERE code = 'ii')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Дубровина' AND a.first_name = 'Татьяна' AND a.middle_name = 'Александровна' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Баранова', 'Дарья', 'Андреевна', 2008, 'f', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО "Спортивная школа"' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Рябоконь О.Н.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Баранова' AND a.first_name = 'Дарья' AND a.middle_name = 'Андреевна' AND a.birth_year = 2008 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Шарыгина', 'Юлия', 'Дмитриевна', 2003, 'f', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ТРО ООО «ВФГС»' AND region_id = (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')), 'Мартьянов А.В., Полякова П.С.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Шарыгина' AND a.first_name = 'Юлия' AND a.middle_name = 'Дмитриевна' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кошурникова', 'Анастасия', 'Александровна', 2003, 'f', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР «Югория» им. А.А. Пилюгина' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Шпартко М.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кошурникова' AND a.first_name = 'Анастасия' AND a.middle_name = 'Александровна' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Подпрятова', 'Марина', 'Сергеевна', 1992, 'f', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВФГС ЯНАО' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Ашенов Т.К.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Подпрятова' AND a.first_name = 'Марина' AND a.middle_name = 'Сергеевна' AND a.birth_year = 1992 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Походяева', 'Александра', 'Андреевна', 1990, 'f', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ООО «Газпром добыча Уренгой»' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Жилин А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Походяева' AND a.first_name = 'Александра' AND a.middle_name = 'Андреевна' AND a.birth_year = 1990 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ховалко', 'Василий', 'Михайлович', 1993, 'm', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШ "Геолог"' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Бабичев М.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ховалко' AND a.first_name = 'Василий' AND a.middle_name = 'Михайлович' AND a.birth_year = 1993 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Манаков', 'Трофим', 'Анатольевич', 2000, 'm', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО «Спортивная школа №2» Сургутского р-на' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Трофимова А.А., Садыков Р.И., Дементьев А.Ф.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Манаков' AND a.first_name = 'Трофим' AND a.middle_name = 'Анатольевич' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Жалов', 'Ярослав', 'Борисович', 2007, 'm', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР «Югория» им. А.А. Пилюгина' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Шпартко М.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Жалов' AND a.first_name = 'Ярослав' AND a.middle_name = 'Борисович' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Клявлин', 'Андрей', 'Викторович', 2006, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО ВФГС в Челябинской области' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Симушин А.М., Дедюхин И.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Клявлин' AND a.first_name = 'Андрей' AND a.middle_name = 'Викторович' AND a.birth_year = 2006 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Айдбаев', 'Ильфат', 'Наильевич', 1989, 'm', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО "СШ № 1" г.Тобольска' AND region_id = (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')), 'Калмаков С.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Айдбаев' AND a.first_name = 'Ильфат' AND a.middle_name = 'Наильевич' AND a.birth_year = 1989 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Малев', 'Родион', 'Александрович', 2011, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Старт"' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Хуснудинов А.З.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Малев' AND a.first_name = 'Родион' AND a.middle_name = 'Александрович' AND a.birth_year = 2011 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ноздрин', 'Егор', 'Андреевич', 2010, 'm', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО "Лебяжьевская ДЮСШ"' AND region_id = (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')), 'Яхнич Е.В.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ноздрин' AND a.first_name = 'Егор' AND a.middle_name = 'Андреевич' AND a.birth_year = 2010 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Рябков', 'Алексей', 'Игоревич', 1993, 'm', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР «Югория» им. А.А. Пилюгина' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Шпартко М.А., Алтухов Д.В.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Рябков' AND a.first_name = 'Алексей' AND a.middle_name = 'Игоревич' AND a.birth_year = 1993 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Тимошенко', 'Дмитрий', 'Евгеньевич', 2011, 'm', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО "Лебяжьевская ДЮСШ"' AND region_id = (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')), 'Яхнич Е.В.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Тимошенко' AND a.first_name = 'Дмитрий' AND a.middle_name = 'Евгеньевич' AND a.birth_year = 2011 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Подгорный', 'Иван', 'Юрьевич', 2003, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Атлет"' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Денисов И.Н., Степанов В.А., Кашпур С.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Подгорный' AND a.first_name = 'Иван' AND a.middle_name = 'Юрьевич' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Леонов', 'Дмитрий', 'Алексеевич', 2003, 'm', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО ДЮЦ "Старт" города Тюмени' AND region_id = (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')), 'Санатин Д.С., Бобров В.С.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Леонов' AND a.first_name = 'Дмитрий' AND a.middle_name = 'Алексеевич' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Аксентьев', 'Данил', 'Андреевич', 2003, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Атлет"' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Денисов И.Н., Хлебодаров А.Г.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Аксентьев' AND a.first_name = 'Данил' AND a.middle_name = 'Андреевич' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ашенов', 'Тимерзан', 'Каирбулатович', 1994, 'm', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВФГС ЯНАО' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Сагандыков К.К.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ашенов' AND a.first_name = 'Тимерзан' AND a.middle_name = 'Каирбулатович' AND a.birth_year = 1994 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Глазырин', 'Роман', 'Николаевич', 2005, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО ВФГС в Челябинской области' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Нестеренко Д.В., Потапов О.Ю.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Глазырин' AND a.first_name = 'Роман' AND a.middle_name = 'Николаевич' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бобров', 'Владимир', 'Сергеевич', 1989, 'm', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')), 'Лесников П.Я., Бакум К.Е.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бобров' AND a.first_name = 'Владимир' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1989 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Сарсембаев', 'Ильяс', 'Асхатович', 1999, 'm', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ "Зенит"' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Латыпов Е.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Сарсембаев' AND a.first_name = 'Ильяс' AND a.middle_name = 'Асхатович' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ташланов', 'Илья', 'Станиславович', 1987, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Атлет"' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Денисов И.Н.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ташланов' AND a.first_name = 'Илья' AND a.middle_name = 'Станиславович' AND a.birth_year = 1987 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Степанов', 'Сергей', 'Владимирович', 1993, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Атлет"' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Степанова О.А., Трофимов М.А., Денисов И.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Степанов' AND a.first_name = 'Сергей' AND a.middle_name = 'Владимирович' AND a.birth_year = 1993 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Согоян', 'Артем', 'Ражденович', 1988, 'm', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ «Районное управление спортивных сооружений»' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Петров В.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Согоян' AND a.first_name = 'Артем' AND a.middle_name = 'Ражденович' AND a.birth_year = 1988 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Баландин', 'Андрей', 'Александрович', 1996, 'm', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУДО "Каргапольская ДЮСШ"' AND region_id = (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')), 'Стрекаловских С.К.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Баландин' AND a.first_name = 'Андрей' AND a.middle_name = 'Александрович' AND a.birth_year = 1996 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Самочернов', 'Иван', 'Николаевич', 1998, 'm', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУДО "Каргапольская ДЮСШ"' AND region_id = (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')), 'Стрекаловских С.К., Садыков Р.И.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Самочернов' AND a.first_name = 'Иван' AND a.middle_name = 'Николаевич' AND a.birth_year = 1998 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Плотников', 'Вячеслав', 'Евгеньевич', 1998, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО ВФГС в Челябинской области' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Симушин А.М.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Плотников' AND a.first_name = 'Вячеслав' AND a.middle_name = 'Евгеньевич' AND a.birth_year = 1998 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Рамазанов', 'Вадим', 'Русланович', 2007, 'm', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ "Зенит"' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Латыпов Е.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Рамазанов' AND a.first_name = 'Вадим' AND a.middle_name = 'Русланович' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Тимоненков', 'Станислав', 'Олегович', 2005, 'm', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО «Спортивная школа №2» Сургутского р-на' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Трофимова А.А., Лепехов Г.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Тимоненков' AND a.first_name = 'Станислав' AND a.middle_name = 'Олегович' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Густомясов', 'Георгий', 'Денисович', 2006, 'm', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО «Спортивная школа №2» Сургутского р-на' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Лепехов Г.А., Скакунов И.С.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Густомясов' AND a.first_name = 'Георгий' AND a.middle_name = 'Денисович' AND a.birth_year = 2006 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Иксанов', 'Ярослав', 'Вячеславович', 2006, 'm', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО "Спортивная школа"' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Рябоконь О.Н.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Иксанов' AND a.first_name = 'Ярослав' AND a.middle_name = 'Вячеславович' AND a.birth_year = 2006 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Гнилоузубов', 'Никита', 'Вячеславович', 2008, 'm', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО «Спортивная школа №2» Сургутского р-на' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Петров В.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Гнилоузубов' AND a.first_name = 'Никита' AND a.middle_name = 'Вячеславович' AND a.birth_year = 2008 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Тэсида', 'Владимир', 'Владимирович', 2007, 'm', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ЦРФКИС' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Харючи Р.В.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Тэсида' AND a.first_name = 'Владимир' AND a.middle_name = 'Владимирович' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Вдовенко', 'Александр', 'Андреевич', 1995, 'm', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУДО "Каргапольская ДЮСШ"' AND region_id = (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')), 'Стрекаловских С.К., Стрекаловских Н.С.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Вдовенко' AND a.first_name = 'Александр' AND a.middle_name = 'Андреевич' AND a.birth_year = 1995 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Цыбулевский', 'Сергей', 'Алексеевич', 2007, 'm', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО «Спортивная школа №2» Сургутского р-на' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Петров В.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Цыбулевский' AND a.first_name = 'Сергей' AND a.middle_name = 'Алексеевич' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Харючи', 'Родион', 'Викторович', 1993, 'm', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ЦРФКИС' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Тихонов Д.В., Плотников В.Е.', (SELECT id FROM sport_ranks WHERE code = 'ii')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Харючи' AND a.first_name = 'Родион' AND a.middle_name = 'Викторович' AND a.birth_year = 1993 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Николаев', 'Аркадий', 'Анатольевич', 2002, 'm', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР «Югория» им. А.А. Пилюгина' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Шпартко М.А., Рябоконь А.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Николаев' AND a.first_name = 'Аркадий' AND a.middle_name = 'Анатольевич' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Минибаев', 'Альзаф', 'Альбертович', 1987, 'm', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ООО "Газпром переработка"' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Минибаев А.М.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Минибаев' AND a.first_name = 'Альзаф' AND a.middle_name = 'Альбертович' AND a.birth_year = 1987 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Битков', 'Антон', 'Николаевич', 1994, 'm', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУДО "Куртамышская ДЮСШ"' AND region_id = (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')), 'Самостоятельно', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Битков' AND a.first_name = 'Антон' AND a.middle_name = 'Николаевич' AND a.birth_year = 1994 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Самохвалов', 'Илья', 'Дмитриевич', 2007, 'm', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШ "Геолог"' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Бабичев М.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Самохвалов' AND a.first_name = 'Илья' AND a.middle_name = 'Дмитриевич' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Емельянов', 'Николай', 'Анатольевич', 1983, 'm', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КСК Факел' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Мартьянов А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Емельянов' AND a.first_name = 'Николай' AND a.middle_name = 'Анатольевич' AND a.birth_year = 1983 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ткачёв', 'Роман', 'Антонович', 2006, 'm', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ "ЦФОР-Ритм"' AND region_id = (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')), 'Даричев Е.Н.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ткачёв' AND a.first_name = 'Роман' AND a.middle_name = 'Антонович' AND a.birth_year = 2006 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Медведев', 'Виктор', 'Алексеевич', 2003, 'm', (SELECT id FROM regions WHERE name = 'Свердловская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Федерация гиревого спорта СО' AND region_id = (SELECT id FROM regions WHERE name = 'Свердловская область' AND country = 'RU')), 'Чагаев А.Е.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Медведев' AND a.first_name = 'Виктор' AND a.middle_name = 'Алексеевич' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Дашкевич', 'Владимир', 'Олегович', 1984, 'm', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ «Районное управление спортивных сооружений»' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Петров В.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Дашкевич' AND a.first_name = 'Владимир' AND a.middle_name = 'Олегович' AND a.birth_year = 1984 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Спасенникова', 'Валерия', 'Витальевна', 2008, 'f', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ "ЦСФР" города Ялуторовска' AND region_id = (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')), 'Спасенников А.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Спасенникова' AND a.first_name = 'Валерия' AND a.middle_name = 'Витальевна' AND a.birth_year = 2008 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Тананин', 'Вячеслав', 'Олегович', 1997, 'm', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ "Зенит"' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Латыпов Е.А.', (SELECT id FROM sport_ranks WHERE code = 'ii')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Тананин' AND a.first_name = 'Вячеслав' AND a.middle_name = 'Олегович' AND a.birth_year = 1997 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Павленко', 'Дмитрий', 'Николаевич', 2010, 'm', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО "Варгашинская СШ"' AND region_id = (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')), 'Дубель А.В.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Павленко' AND a.first_name = 'Дмитрий' AND a.middle_name = 'Николаевич' AND a.birth_year = 2010 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Середа', 'Матвей', 'Сергеевич', 2009, 'm', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО ДЮСШ Юность' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Середа С.П., Казацкий В.Ю.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Середа' AND a.first_name = 'Матвей' AND a.middle_name = 'Сергеевич' AND a.birth_year = 2009 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ганеев', 'Константин', 'Эдвардович', 1973, 'm', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВФГС ЯНАО' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Баев К.С.', (SELECT id FROM sport_ranks WHERE code = 'ii')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ганеев' AND a.first_name = 'Константин' AND a.middle_name = 'Эдвардович' AND a.birth_year = 1973 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Волошин', 'Александр', 'Анатольевич', 1995, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Атлет"' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Симушин А.М.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Волошин' AND a.first_name = 'Александр' AND a.middle_name = 'Анатольевич' AND a.birth_year = 1995 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Усольцев', 'Александр', 'Николаевич', 1992, 'm', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КСК Факел' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Емельянов Н.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Усольцев' AND a.first_name = 'Александр' AND a.middle_name = 'Николаевич' AND a.birth_year = 1992 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Сергеев', 'Алексей', 'Вячеславович', 2001, 'm', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО "Спортивная школа №2" Сургутского р-на' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Трофимова А.А., Садыков Р.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Сергеев' AND a.first_name = 'Алексей' AND a.middle_name = 'Вячеславович' AND a.birth_year = 2001 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Айбаев', 'Ильфат', 'Наильевич', 1989, 'm', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО "СШ № 1" г.Тобольска' AND region_id = (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')), 'Калмаков С.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Айбаев' AND a.first_name = 'Ильфат' AND a.middle_name = 'Наильевич' AND a.birth_year = 1989 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Беляев', 'Иван', 'Сергеевич', 1992, 'm', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР «Югория» им. А.А. Пилюгина' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Шпартко М.А.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Беляев' AND a.first_name = 'Иван' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1992 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Яхнич', 'Ефим', 'Владимирович', 1989, 'm', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО "Лебяжьевская ДЮСШ"' AND region_id = (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')), 'Самостоятельно', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Яхнич' AND a.first_name = 'Ефим' AND a.middle_name = 'Владимирович' AND a.birth_year = 1989 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Семенов', 'Никита', 'Андреевич', 1993, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РООО ВФГС в Челябинской области' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Симушин А.М.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Семенов' AND a.first_name = 'Никита' AND a.middle_name = 'Андреевич' AND a.birth_year = 1993 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Драчев', 'Глеб', 'Никитич', 2011, 'm', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО ДЮЦ "Старт" города Тюмени' AND region_id = (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')), 'Бобров В.С.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Драчев' AND a.first_name = 'Глеб' AND a.middle_name = 'Никитич' AND a.birth_year = 2011 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Дубель', 'Алексей', 'Викторович', 1990, 'm', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУДО "Варгашинская СШ"' AND region_id = (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')), 'Стрекаловских С.К.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Дубель' AND a.first_name = 'Алексей' AND a.middle_name = 'Викторович' AND a.birth_year = 1990 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Иванов', 'Виталий', 'Викторович', 1978, 'm', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР «Югория» им. А.А. Пилюгина' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Шпартко М.А. Шульга Н.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Иванов' AND a.first_name = 'Виталий' AND a.middle_name = 'Викторович' AND a.birth_year = 1978 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кобзарь', 'Кирилл', 'Николаевич', 2002, 'm', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ООО «Газпром добыча Уренгой»' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Походяева А.А., Чеботарёв Ю.Ю.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кобзарь' AND a.first_name = 'Кирилл' AND a.middle_name = 'Николаевич' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Лукин', 'Дмитрий', 'Алексеевич', 2011, 'm', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО ДЮЦ "Старт" города Тюмени' AND region_id = (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')), 'Бобров В.С.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Лукин' AND a.first_name = 'Дмитрий' AND a.middle_name = 'Алексеевич' AND a.birth_year = 2011 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Густомясов', 'Денис', 'Алексеевич', 1982, 'm', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Федоровский Спортивно оздоровительный центр' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Лепехов Г.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Густомясов' AND a.first_name = 'Денис' AND a.middle_name = 'Алексеевич' AND a.birth_year = 1982 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Селиверстов', 'Семён', 'Васильевич', 1989, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '"СШ Олимп" г.Челябинска' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Нестеренко Д.В., Ташланов И.С.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Селиверстов' AND a.first_name = 'Семён' AND a.middle_name = 'Васильевич' AND a.birth_year = 1989 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Денисов', 'Иван', 'Николаевич', 1982, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Атлет"' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Симушин А.М.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Денисов' AND a.first_name = 'Иван' AND a.middle_name = 'Николаевич' AND a.birth_year = 1982 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Юдин', 'Дмитрий', 'Петрович', 1989, 'm', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШ "Геолог"' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Бабичев М.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Юдин' AND a.first_name = 'Дмитрий' AND a.middle_name = 'Петрович' AND a.birth_year = 1989 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Пупин', 'Роман', 'Сергеевич', 1998, 'm', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ "Зенит"' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Сарсембаев И.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Пупин' AND a.first_name = 'Роман' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1998 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Хуснудинова', 'Мария', 'Петровна', 2004, 'f', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '"СШ Олимп" г.Челябинска' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Потапов О.Ю., Хуснудинов А.З.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Хуснудинова' AND a.first_name = 'Мария' AND a.middle_name = 'Петровна' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Гладышева', 'Дарья', 'Алексеевна', 2004, 'f', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУДО "Куртамышская ДЮСШ"' AND region_id = (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')), 'Битков А.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Гладышева' AND a.first_name = 'Дарья' AND a.middle_name = 'Алексеевна' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Белоус', 'Анна', 'Сергеевна', 2001, 'f', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР «Югория» им. А.А. Пилюгина' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Шпартко М.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Белоус' AND a.first_name = 'Анна' AND a.middle_name = 'Сергеевна' AND a.birth_year = 2001 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Дементьева', 'Наталья', 'Сергеевна', 2010, 'f', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Старт"' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Хуснудинов А.З.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Дементьева' AND a.first_name = 'Наталья' AND a.middle_name = 'Сергеевна' AND a.birth_year = 2010 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Уржумцева', 'Светлана', 'Алексеевна', 1992, 'f', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Атлет"' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Дедюхин И.В., Денисов И.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Уржумцева' AND a.first_name = 'Светлана' AND a.middle_name = 'Алексеевна' AND a.birth_year = 1992 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Аллоярова', 'Милана', 'Борисовна', 2002, 'f', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ТРО ООО «ВФГС»' AND region_id = (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')), 'Айдбаев И.Н., Бобров В.С., Полякова П.С.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Аллоярова' AND a.first_name = 'Милана' AND a.middle_name = 'Борисовна' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Седова', 'Марина', 'Сергеевна', 2009, 'f', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Старт"' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Хуснудинов А.З.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Седова' AND a.first_name = 'Марина' AND a.middle_name = 'Сергеевна' AND a.birth_year = 2009 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Огий', 'Анна', NULL, 2006, 'f', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'БУ СУРГПУ, Спортивный клуб.' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Садыков Р.И., Коснов М.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Огий' AND a.first_name = 'Анна' AND a.middle_name IS NULL AND a.birth_year = 2006 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Плешкова', 'Анастасия', 'Александровна', 2005, 'f', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Атлет"' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Денисов И.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Плешкова' AND a.first_name = 'Анастасия' AND a.middle_name = 'Александровна' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Пасичная', 'Ольга', 'Анатольевна', 1981, 'f', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ "Зенит"' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Латыпов Е.А.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Пасичная' AND a.first_name = 'Ольга' AND a.middle_name = 'Анатольевна' AND a.birth_year = 1981 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Камышанская', 'Евгения', 'Дмитриевна', 2009, 'f', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО "Спортивная школа"' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Рябоконь О.Н.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Камышанская' AND a.first_name = 'Евгения' AND a.middle_name = 'Дмитриевна' AND a.birth_year = 2009 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Вахрушева', 'Карина', 'Владимировна', 2010, 'f', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО "Спортивная школа"' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Рябоконь О.Н.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Вахрушева' AND a.first_name = 'Карина' AND a.middle_name = 'Владимировна' AND a.birth_year = 2010 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Дедюхина', 'Ксения', 'Игоревна', 1990, 'f', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР «Югория» им. А.А. Пилюгина' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Шпартко М.А., Дедюхин И.В.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Дедюхина' AND a.first_name = 'Ксения' AND a.middle_name = 'Игоревна' AND a.birth_year = 1990 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ташланова', 'Ульяна', 'Павловна', 2001, 'f', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО ВФГС в Челябинской области' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Денисов И.Н., Ташланов И.С.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ташланова' AND a.first_name = 'Ульяна' AND a.middle_name = 'Павловна' AND a.birth_year = 2001 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Федоресва', 'Диана', 'Всеволодовна', 1993, 'f', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СК "Олимп"' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Хуснудинова М.П., Потапов О.Ю.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Федоресва' AND a.first_name = 'Диана' AND a.middle_name = 'Всеволодовна' AND a.birth_year = 1993 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Габбасова', 'Камила', 'Руслановна', 2003, 'f', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ "Зенит"' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Латыпов Е.А.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Габбасова' AND a.first_name = 'Камила' AND a.middle_name = 'Руслановна' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Островская', 'Надежда', 'Аркадьевна', 1985, 'f', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР «Югория» им. А.А. Пилюгина' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Шпартко М.А., Бакум К.Е.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Островская' AND a.first_name = 'Надежда' AND a.middle_name = 'Аркадьевна' AND a.birth_year = 1985 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Захарова', 'Татьяна', 'Вадимовна', 2006, 'f', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ТРО ООО «ВФГС»' AND region_id = (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')), 'Шарыпов Д.Т., Мартьянов А.В.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Захарова' AND a.first_name = 'Татьяна' AND a.middle_name = 'Вадимовна' AND a.birth_year = 2006 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Таева', 'Нагима', 'Сериковна', 1991, 'f', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ООО «Газпром добыча Уренгой»' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Походяева А.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Таева' AND a.first_name = 'Нагима' AND a.middle_name = 'Сериковна' AND a.birth_year = 1991 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Белошапкина', 'Татьяна', 'Владимировна', 1979, 'f', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШ "Геолог"' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Бабичев М.А.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Белошапкина' AND a.first_name = 'Татьяна' AND a.middle_name = 'Владимировна' AND a.birth_year = 1979 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Умарова', 'Олеся', 'Васильевна', 1983, 'f', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ООО «Газпром добыча Уренгой»' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Походяева А.А.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Умарова' AND a.first_name = 'Олеся' AND a.middle_name = 'Васильевна' AND a.birth_year = 1983 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Потапова', 'Анастасия', 'Михайловна', 2004, 'f', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО ДЮЦ "Старт" города Тюмени' AND region_id = (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')), 'Лесников П.Я., Бобров В.С.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Потапова' AND a.first_name = 'Анастасия' AND a.middle_name = 'Михайловна' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Миронова', 'Василиса', 'Александровна', 2004, 'f', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ТРО ООО ВФГС' AND region_id = (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')), 'Губарев К.А., Бобров В.С.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Миронова' AND a.first_name = 'Василиса' AND a.middle_name = 'Александровна' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Лебедева', 'Ирина', 'Михайловна', 1968, 'f', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО ВФГС в КО' AND region_id = (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')), 'Стрекаловских С.К.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Лебедева' AND a.first_name = 'Ирина' AND a.middle_name = 'Михайловна' AND a.birth_year = 1968 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Хвостов', 'Владислав', 'Денисович', 2006, 'm', (SELECT id FROM regions WHERE name = 'Свердловская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Федерация гиревого спорта СО' AND region_id = (SELECT id FROM regions WHERE name = 'Свердловская область' AND country = 'RU')), 'Чагаев А.Е., Садыков Р.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Хвостов' AND a.first_name = 'Владислав' AND a.middle_name = 'Денисович' AND a.birth_year = 2006 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Потапов', 'Данил', 'Алексеевич', 2002, 'm', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО "Лебяжьевская ДЮСШ"' AND region_id = (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')), 'Яхнич Е.В., Руднев С.Л.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Потапов' AND a.first_name = 'Данил' AND a.middle_name = 'Алексеевич' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бабичев', 'Иван', 'Александрович', 1996, 'm', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШ "Геолог"' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Бабичев М.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бабичев' AND a.first_name = 'Иван' AND a.middle_name = 'Александрович' AND a.birth_year = 1996 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Пстелин', 'Александр', 'Владимирович', 1987, 'm', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО «Абалакский центр спорта и творчества»' AND region_id = (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')), 'Колмаков С.И., Айдбаев И.Н., Усольцев А.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Пстелин' AND a.first_name = 'Александр' AND a.middle_name = 'Владимирович' AND a.birth_year = 1987 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Тухватуллин', 'Ринат', 'Самигуллович', 1994, 'm', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ООО «Газпром добыча Уренгой»' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Походеева А.А.', (SELECT id FROM sport_ranks WHERE code = 'ii')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Тухватуллин' AND a.first_name = 'Ринат' AND a.middle_name = 'Самигуллович' AND a.birth_year = 1994 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Солодченко', 'Владимир', 'Иванович', 1984, 'm', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВФГС ЯНАО' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Руднев С.Л.', (SELECT id FROM sport_ranks WHERE code = 'ii')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Солодченко' AND a.first_name = 'Владимир' AND a.middle_name = 'Иванович' AND a.birth_year = 1984 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Сафонов', 'Алексей', 'Андреевич', 1990, 'm', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Шпартко М.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Сафонов' AND a.first_name = 'Алексей' AND a.middle_name = 'Андреевич' AND a.birth_year = 1990 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Муртазин', 'Василий', 'Васильевич', 1971, 'm', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВФГС ЯНАО' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Баев К.С.', (SELECT id FROM sport_ranks WHERE code = 'ii')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Муртазин' AND a.first_name = 'Василий' AND a.middle_name = 'Васильевич' AND a.birth_year = 1971 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Суслов', 'Александр', 'Владимирович', 1986, 'm', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО "Каргапольская ДЮСШ"' AND region_id = (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')), 'Стрекаловских С.К.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Суслов' AND a.first_name = 'Александр' AND a.middle_name = 'Владимирович' AND a.birth_year = 1986 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Стрекаловских', 'Николай', 'Сергеевич', 1993, 'm', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО "Каргапольская ДЮСШ"' AND region_id = (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')), 'Стрекаловских С.К.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Стрекаловских' AND a.first_name = 'Николай' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1993 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Потапов', 'Владислав', 'Владимирович', 1978, 'm', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ООО "ТТЮ"' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Урывский Ю.М.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Потапов' AND a.first_name = 'Владислав' AND a.middle_name = 'Владимирович' AND a.birth_year = 1978 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Полторыгий', 'Иван', 'Юрьевич', 2003, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Атлет"' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Денисов И.Н., Степанов В.А., Кашпур С.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Полторыгий' AND a.first_name = 'Иван' AND a.middle_name = 'Юрьевич' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Белесов', 'Иван', 'Сергеевич', 1992, 'm', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР «Югория» им. А.А. Пилюгина' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Шпартко М.А.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Белесов' AND a.first_name = 'Иван' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1992 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Хуснудинов', 'Арслан', 'Закеевич', 1985, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Старт"' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Хуснудинова М.П.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Хуснудинов' AND a.first_name = 'Арслан' AND a.middle_name = 'Закеевич' AND a.birth_year = 1985 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Семёнов', 'Андрей', 'Владимирович', 1991, 'm', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ООО «Газпром добыча Уренгой»' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Походяева А.А., Козленко В.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Семёнов' AND a.first_name = 'Андрей' AND a.middle_name = 'Владимирович' AND a.birth_year = 1991 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Токарев', 'Тимофей', 'Дмитриевич', 2003, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО ВФГС в Челябинской области' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Симушин А.М.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Токарев' AND a.first_name = 'Тимофей' AND a.middle_name = 'Дмитриевич' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Москвичев', 'Максим', 'Вячеславович', 1991, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ФГУП "ПСЗ" г. ТРЕХГОРНЫЙ' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Загребин И.М.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Москвичев' AND a.first_name = 'Максим' AND a.middle_name = 'Вячеславович' AND a.birth_year = 1991 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Горбань', 'Кирилл', NULL, 2007, 'm', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'БУ СУРГПУ, Спортивный клуб.' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Садыков Р.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Горбань' AND a.first_name = 'Кирилл' AND a.middle_name IS NULL AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Гамов', 'Андрей', 'Сергеевич', 1988, 'm', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ "Зенит"' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Сарсембаев И.А.', (SELECT id FROM sport_ranks WHERE code = 'ii')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Гамов' AND a.first_name = 'Андрей' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1988 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Плетнёв', 'Виталий', 'Владимирович', 1983, 'm', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КСК Факел' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Емельянов Н.А.', (SELECT id FROM sport_ranks WHERE code = 'ii')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Плетнёв' AND a.first_name = 'Виталий' AND a.middle_name = 'Владимирович' AND a.birth_year = 1983 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бондарев', 'Дмитрий', 'Александрович', 1986, 'm', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Гельмель Д.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бондарев' AND a.first_name = 'Дмитрий' AND a.middle_name = 'Александрович' AND a.birth_year = 1986 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Шляхтин', 'Александр', 'Сергеевич', 1980, 'm', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КСК Факел Газпром добыча Ноябрьск' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Усольцев А.Н., Емельянов Н.А.', (SELECT id FROM sport_ranks WHERE code = 'ii')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Шляхтин' AND a.first_name = 'Александр' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1980 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Солодов', 'Дмитрий', 'Юрьевич', 1995, 'm', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ "Зенит"' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Латыпов Е.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Солодов' AND a.first_name = 'Дмитрий' AND a.middle_name = 'Юрьевич' AND a.birth_year = 1995 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кудряров', 'Роман', 'Альбертович', 2006, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Старт"' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Хуснудинов А.З.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кудряров' AND a.first_name = 'Роман' AND a.middle_name = 'Альбертович' AND a.birth_year = 2006 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Сукманов', 'Александр', 'Александрович', 1985, 'm', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РОО "ВФГС Курганской области"' AND region_id = (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')), 'Баландин А.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Сукманов' AND a.first_name = 'Александр' AND a.middle_name = 'Александрович' AND a.birth_year = 1985 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Куликов', 'Владислав', 'Александрович', 2006, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '"СШ Олимп" г.Челябинска' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Потапов О.Ю.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Куликов' AND a.first_name = 'Владислав' AND a.middle_name = 'Александрович' AND a.birth_year = 2006 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Григорьев', 'Андрей', 'Анатольевич', 1987, 'm', (SELECT id FROM regions WHERE name = 'Свердловская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Федерация гиревого спорта СО' AND region_id = (SELECT id FROM regions WHERE name = 'Свердловская область' AND country = 'RU')), 'Гребенщиков Д.С.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Григорьев' AND a.first_name = 'Андрей' AND a.middle_name = 'Анатольевич' AND a.birth_year = 1987 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Мингазединов', 'Вячеслав', 'Равильевич', 1984, 'm', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КСК Факел' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Усольцев А.Н.', (SELECT id FROM sport_ranks WHERE code = 'ii')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Мингазединов' AND a.first_name = 'Вячеслав' AND a.middle_name = 'Равильевич' AND a.birth_year = 1984 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Панаитов', 'Иосиф', 'Михайлович', 1981, 'm', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ СОК "Звездный"' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Рябоконь О.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Панаитов' AND a.first_name = 'Иосиф' AND a.middle_name = 'Михайлович' AND a.birth_year = 1981 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Московских', 'Алексей', 'Сергеевич', 1994, 'm', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ООО «Газпром добыча Уренгой»' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Походяева А.А.', (SELECT id FROM sport_ranks WHERE code = 'ii')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Московских' AND a.first_name = 'Алексей' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1994 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Мацюк', 'Кирилл', 'Станиславович', 1996, 'm', (SELECT id FROM regions WHERE name = 'Свердловская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Федерация гиревого спорта СО' AND region_id = (SELECT id FROM regions WHERE name = 'Свердловская область' AND country = 'RU')), 'Белоус А.С.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Мацюк' AND a.first_name = 'Кирилл' AND a.middle_name = 'Станиславович' AND a.birth_year = 1996 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Гулов', 'Фарход', 'Абдурахмонович', 1997, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '"СШ Олимп" г.Челябинска' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Нестеренко Д.В., Романов И.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Гулов' AND a.first_name = 'Фарход' AND a.middle_name = 'Абдурахмонович' AND a.birth_year = 1997 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Калимуллин', 'Ильнур', 'Ринатович', 1985, 'm', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'АО Роспан Интернешнл' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Походяева А.А.', (SELECT id FROM sport_ranks WHERE code = 'ii')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Калимуллин' AND a.first_name = 'Ильнур' AND a.middle_name = 'Ринатович' AND a.birth_year = 1985 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ключкин', 'Роман', 'Викторович', 1985, 'm', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КСК Факел' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Емельянов Н.А.', (SELECT id FROM sport_ranks WHERE code = 'ii')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ключкин' AND a.first_name = 'Роман' AND a.middle_name = 'Викторович' AND a.birth_year = 1985 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Максимов', 'Андрей', 'Владимирович', 1988, 'm', (SELECT id FROM regions WHERE name = 'Свердловская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Федерация гиревого спорта СО' AND region_id = (SELECT id FROM regions WHERE name = 'Свердловская область' AND country = 'RU')), 'Самостоятельно', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Максимов' AND a.first_name = 'Андрей' AND a.middle_name = 'Владимирович' AND a.birth_year = 1988 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Хлань', 'Анатолий', 'Анатольевич', 1981, 'm', (SELECT id FROM regions WHERE name = 'Свердловская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Федерация гиревого спорта СО' AND region_id = (SELECT id FROM regions WHERE name = 'Свердловская область' AND country = 'RU')), 'Гребенщиков Д.С.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Хлань' AND a.first_name = 'Анатолий' AND a.middle_name = 'Анатольевич' AND a.birth_year = 1981 LIMIT 1);

INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'koshurnikova-valeriya-2012' AND s.athlete_id <> a.id)
              THEN 'koshurnikova-valeriya-2012-' || a.id ELSE 'koshurnikova-valeriya-2012' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кошурникова' AND first_name = 'Валерия' AND middle_name = 'Александровна' AND birth_year = 2012 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'trofimova-aleksandra-2008' AND s.athlete_id <> a.id)
              THEN 'trofimova-aleksandra-2008-' || a.id ELSE 'trofimova-aleksandra-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Трофимова' AND first_name = 'Александра' AND middle_name = 'Александровна' AND birth_year = 2008 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'stepanova-oksana-1990' AND s.athlete_id <> a.id)
              THEN 'stepanova-oksana-1990-' || a.id ELSE 'stepanova-oksana-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Степанова' AND first_name = 'Оксана' AND middle_name = 'Анатольевна' AND birth_year = 1990 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'bahtina-viktoriya-1999' AND s.athlete_id <> a.id)
              THEN 'bahtina-viktoriya-1999-' || a.id ELSE 'bahtina-viktoriya-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бахтина' AND first_name = 'Виктория' AND middle_name = 'Викторовна' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'beloglazova-elizaveta-2002' AND s.athlete_id <> a.id)
              THEN 'beloglazova-elizaveta-2002-' || a.id ELSE 'beloglazova-elizaveta-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Белоглазова' AND first_name = 'Елизавета' AND middle_name = 'Александровна' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'polyakova-polina-1999' AND s.athlete_id <> a.id)
              THEN 'polyakova-polina-1999-' || a.id ELSE 'polyakova-polina-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Полякова' AND first_name = 'Полина' AND middle_name = 'Сергеевна' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'firugleva-vasilisa-2004' AND s.athlete_id <> a.id)
              THEN 'firugleva-vasilisa-2004-' || a.id ELSE 'firugleva-vasilisa-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Фируглева' AND first_name = 'Василиса' AND middle_name = 'Владимировна' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'dubrovina-tatyana-2003' AND s.athlete_id <> a.id)
              THEN 'dubrovina-tatyana-2003-' || a.id ELSE 'dubrovina-tatyana-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Дубровина' AND first_name = 'Татьяна' AND middle_name = 'Александровна' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'baranova-darya-2008' AND s.athlete_id <> a.id)
              THEN 'baranova-darya-2008-' || a.id ELSE 'baranova-darya-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Баранова' AND first_name = 'Дарья' AND middle_name = 'Андреевна' AND birth_year = 2008 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sharygina-yuliya-2003' AND s.athlete_id <> a.id)
              THEN 'sharygina-yuliya-2003-' || a.id ELSE 'sharygina-yuliya-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Шарыгина' AND first_name = 'Юлия' AND middle_name = 'Дмитриевна' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'koshurnikova-anastasiya-2003' AND s.athlete_id <> a.id)
              THEN 'koshurnikova-anastasiya-2003-' || a.id ELSE 'koshurnikova-anastasiya-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кошурникова' AND first_name = 'Анастасия' AND middle_name = 'Александровна' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'podpryatova-marina-1992' AND s.athlete_id <> a.id)
              THEN 'podpryatova-marina-1992-' || a.id ELSE 'podpryatova-marina-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Подпрятова' AND first_name = 'Марина' AND middle_name = 'Сергеевна' AND birth_year = 1992 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'pohodyaeva-aleksandra-1990' AND s.athlete_id <> a.id)
              THEN 'pohodyaeva-aleksandra-1990-' || a.id ELSE 'pohodyaeva-aleksandra-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Походяева' AND first_name = 'Александра' AND middle_name = 'Андреевна' AND birth_year = 1990 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'hovalko-vasiliy-1993' AND s.athlete_id <> a.id)
              THEN 'hovalko-vasiliy-1993-' || a.id ELSE 'hovalko-vasiliy-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ховалко' AND first_name = 'Василий' AND middle_name = 'Михайлович' AND birth_year = 1993 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'manakov-trofim-2000' AND s.athlete_id <> a.id)
              THEN 'manakov-trofim-2000-' || a.id ELSE 'manakov-trofim-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Манаков' AND first_name = 'Трофим' AND middle_name = 'Анатольевич' AND birth_year = 2000 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zhalov-yaroslav-2007' AND s.athlete_id <> a.id)
              THEN 'zhalov-yaroslav-2007-' || a.id ELSE 'zhalov-yaroslav-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Жалов' AND first_name = 'Ярослав' AND middle_name = 'Борисович' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'klyavlin-andrey-2006' AND s.athlete_id <> a.id)
              THEN 'klyavlin-andrey-2006-' || a.id ELSE 'klyavlin-andrey-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Клявлин' AND first_name = 'Андрей' AND middle_name = 'Викторович' AND birth_year = 2006 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'aydbaev-ilfat-1989' AND s.athlete_id <> a.id)
              THEN 'aydbaev-ilfat-1989-' || a.id ELSE 'aydbaev-ilfat-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Айдбаев' AND first_name = 'Ильфат' AND middle_name = 'Наильевич' AND birth_year = 1989 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'malev-rodion-2011' AND s.athlete_id <> a.id)
              THEN 'malev-rodion-2011-' || a.id ELSE 'malev-rodion-2011' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Малев' AND first_name = 'Родион' AND middle_name = 'Александрович' AND birth_year = 2011 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'nozdrin-egor-2010' AND s.athlete_id <> a.id)
              THEN 'nozdrin-egor-2010-' || a.id ELSE 'nozdrin-egor-2010' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ноздрин' AND first_name = 'Егор' AND middle_name = 'Андреевич' AND birth_year = 2010 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ryabkov-aleksey-1993' AND s.athlete_id <> a.id)
              THEN 'ryabkov-aleksey-1993-' || a.id ELSE 'ryabkov-aleksey-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Рябков' AND first_name = 'Алексей' AND middle_name = 'Игоревич' AND birth_year = 1993 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'timoshenko-dmitriy-2011' AND s.athlete_id <> a.id)
              THEN 'timoshenko-dmitriy-2011-' || a.id ELSE 'timoshenko-dmitriy-2011' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Тимошенко' AND first_name = 'Дмитрий' AND middle_name = 'Евгеньевич' AND birth_year = 2011 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'podgornyy-ivan-2003' AND s.athlete_id <> a.id)
              THEN 'podgornyy-ivan-2003-' || a.id ELSE 'podgornyy-ivan-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Подгорный' AND first_name = 'Иван' AND middle_name = 'Юрьевич' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'leonov-dmitriy-2003' AND s.athlete_id <> a.id)
              THEN 'leonov-dmitriy-2003-' || a.id ELSE 'leonov-dmitriy-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Леонов' AND first_name = 'Дмитрий' AND middle_name = 'Алексеевич' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'aksentev-danil-2003' AND s.athlete_id <> a.id)
              THEN 'aksentev-danil-2003-' || a.id ELSE 'aksentev-danil-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Аксентьев' AND first_name = 'Данил' AND middle_name = 'Андреевич' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ashenov-timerzan-1994' AND s.athlete_id <> a.id)
              THEN 'ashenov-timerzan-1994-' || a.id ELSE 'ashenov-timerzan-1994' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ашенов' AND first_name = 'Тимерзан' AND middle_name = 'Каирбулатович' AND birth_year = 1994 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'glazyrin-roman-2005' AND s.athlete_id <> a.id)
              THEN 'glazyrin-roman-2005-' || a.id ELSE 'glazyrin-roman-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Глазырин' AND first_name = 'Роман' AND middle_name = 'Николаевич' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'bobrov-vladimir-1989' AND s.athlete_id <> a.id)
              THEN 'bobrov-vladimir-1989-' || a.id ELSE 'bobrov-vladimir-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бобров' AND first_name = 'Владимир' AND middle_name = 'Сергеевич' AND birth_year = 1989 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sarsembaev-ilyas-1999' AND s.athlete_id <> a.id)
              THEN 'sarsembaev-ilyas-1999-' || a.id ELSE 'sarsembaev-ilyas-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Сарсембаев' AND first_name = 'Ильяс' AND middle_name = 'Асхатович' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'tashlanov-ilya-1987' AND s.athlete_id <> a.id)
              THEN 'tashlanov-ilya-1987-' || a.id ELSE 'tashlanov-ilya-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ташланов' AND first_name = 'Илья' AND middle_name = 'Станиславович' AND birth_year = 1987 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'stepanov-sergey-1993' AND s.athlete_id <> a.id)
              THEN 'stepanov-sergey-1993-' || a.id ELSE 'stepanov-sergey-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Степанов' AND first_name = 'Сергей' AND middle_name = 'Владимирович' AND birth_year = 1993 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sogoyan-artem-1988' AND s.athlete_id <> a.id)
              THEN 'sogoyan-artem-1988-' || a.id ELSE 'sogoyan-artem-1988' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Согоян' AND first_name = 'Артем' AND middle_name = 'Ражденович' AND birth_year = 1988 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'balandin-andrey-1996' AND s.athlete_id <> a.id)
              THEN 'balandin-andrey-1996-' || a.id ELSE 'balandin-andrey-1996' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Баландин' AND first_name = 'Андрей' AND middle_name = 'Александрович' AND birth_year = 1996 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'samochernov-ivan-1998' AND s.athlete_id <> a.id)
              THEN 'samochernov-ivan-1998-' || a.id ELSE 'samochernov-ivan-1998' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Самочернов' AND first_name = 'Иван' AND middle_name = 'Николаевич' AND birth_year = 1998 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'plotnikov-vyacheslav-1998' AND s.athlete_id <> a.id)
              THEN 'plotnikov-vyacheslav-1998-' || a.id ELSE 'plotnikov-vyacheslav-1998' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Плотников' AND first_name = 'Вячеслав' AND middle_name = 'Евгеньевич' AND birth_year = 1998 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ramazanov-vadim-2007' AND s.athlete_id <> a.id)
              THEN 'ramazanov-vadim-2007-' || a.id ELSE 'ramazanov-vadim-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Рамазанов' AND first_name = 'Вадим' AND middle_name = 'Русланович' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'timonenkov-stanislav-2005' AND s.athlete_id <> a.id)
              THEN 'timonenkov-stanislav-2005-' || a.id ELSE 'timonenkov-stanislav-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Тимоненков' AND first_name = 'Станислав' AND middle_name = 'Олегович' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'gustomyasov-georgiy-2006' AND s.athlete_id <> a.id)
              THEN 'gustomyasov-georgiy-2006-' || a.id ELSE 'gustomyasov-georgiy-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Густомясов' AND first_name = 'Георгий' AND middle_name = 'Денисович' AND birth_year = 2006 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'iksanov-yaroslav-2006' AND s.athlete_id <> a.id)
              THEN 'iksanov-yaroslav-2006-' || a.id ELSE 'iksanov-yaroslav-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Иксанов' AND first_name = 'Ярослав' AND middle_name = 'Вячеславович' AND birth_year = 2006 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'gnilouzubov-nikita-2008' AND s.athlete_id <> a.id)
              THEN 'gnilouzubov-nikita-2008-' || a.id ELSE 'gnilouzubov-nikita-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Гнилоузубов' AND first_name = 'Никита' AND middle_name = 'Вячеславович' AND birth_year = 2008 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'tesida-vladimir-2007' AND s.athlete_id <> a.id)
              THEN 'tesida-vladimir-2007-' || a.id ELSE 'tesida-vladimir-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Тэсида' AND first_name = 'Владимир' AND middle_name = 'Владимирович' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'vdovenko-aleksandr-1995' AND s.athlete_id <> a.id)
              THEN 'vdovenko-aleksandr-1995-' || a.id ELSE 'vdovenko-aleksandr-1995' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Вдовенко' AND first_name = 'Александр' AND middle_name = 'Андреевич' AND birth_year = 1995 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'cybulevskiy-sergey-2007' AND s.athlete_id <> a.id)
              THEN 'cybulevskiy-sergey-2007-' || a.id ELSE 'cybulevskiy-sergey-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Цыбулевский' AND first_name = 'Сергей' AND middle_name = 'Алексеевич' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'haryuchi-rodion-1993' AND s.athlete_id <> a.id)
              THEN 'haryuchi-rodion-1993-' || a.id ELSE 'haryuchi-rodion-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Харючи' AND first_name = 'Родион' AND middle_name = 'Викторович' AND birth_year = 1993 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'nikolaev-arkadiy-2002' AND s.athlete_id <> a.id)
              THEN 'nikolaev-arkadiy-2002-' || a.id ELSE 'nikolaev-arkadiy-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Николаев' AND first_name = 'Аркадий' AND middle_name = 'Анатольевич' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'minibaev-alzaf-1987' AND s.athlete_id <> a.id)
              THEN 'minibaev-alzaf-1987-' || a.id ELSE 'minibaev-alzaf-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Минибаев' AND first_name = 'Альзаф' AND middle_name = 'Альбертович' AND birth_year = 1987 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'bitkov-anton-1994' AND s.athlete_id <> a.id)
              THEN 'bitkov-anton-1994-' || a.id ELSE 'bitkov-anton-1994' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Битков' AND first_name = 'Антон' AND middle_name = 'Николаевич' AND birth_year = 1994 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'samohvalov-ilya-2007' AND s.athlete_id <> a.id)
              THEN 'samohvalov-ilya-2007-' || a.id ELSE 'samohvalov-ilya-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Самохвалов' AND first_name = 'Илья' AND middle_name = 'Дмитриевич' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'emelyanov-nikolay-1983' AND s.athlete_id <> a.id)
              THEN 'emelyanov-nikolay-1983-' || a.id ELSE 'emelyanov-nikolay-1983' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Емельянов' AND first_name = 'Николай' AND middle_name = 'Анатольевич' AND birth_year = 1983 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'tkachev-roman-2006' AND s.athlete_id <> a.id)
              THEN 'tkachev-roman-2006-' || a.id ELSE 'tkachev-roman-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ткачёв' AND first_name = 'Роман' AND middle_name = 'Антонович' AND birth_year = 2006 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'medvedev-viktor-2003' AND s.athlete_id <> a.id)
              THEN 'medvedev-viktor-2003-' || a.id ELSE 'medvedev-viktor-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Медведев' AND first_name = 'Виктор' AND middle_name = 'Алексеевич' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'dashkevich-vladimir-1984' AND s.athlete_id <> a.id)
              THEN 'dashkevich-vladimir-1984-' || a.id ELSE 'dashkevich-vladimir-1984' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Дашкевич' AND first_name = 'Владимир' AND middle_name = 'Олегович' AND birth_year = 1984 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'spasennikova-valeriya-2008' AND s.athlete_id <> a.id)
              THEN 'spasennikova-valeriya-2008-' || a.id ELSE 'spasennikova-valeriya-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Спасенникова' AND first_name = 'Валерия' AND middle_name = 'Витальевна' AND birth_year = 2008 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'tananin-vyacheslav-1997' AND s.athlete_id <> a.id)
              THEN 'tananin-vyacheslav-1997-' || a.id ELSE 'tananin-vyacheslav-1997' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Тананин' AND first_name = 'Вячеслав' AND middle_name = 'Олегович' AND birth_year = 1997 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'pavlenko-dmitriy-2010' AND s.athlete_id <> a.id)
              THEN 'pavlenko-dmitriy-2010-' || a.id ELSE 'pavlenko-dmitriy-2010' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Павленко' AND first_name = 'Дмитрий' AND middle_name = 'Николаевич' AND birth_year = 2010 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sereda-matvey-2009' AND s.athlete_id <> a.id)
              THEN 'sereda-matvey-2009-' || a.id ELSE 'sereda-matvey-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Середа' AND first_name = 'Матвей' AND middle_name = 'Сергеевич' AND birth_year = 2009 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ganeev-konstantin-1973' AND s.athlete_id <> a.id)
              THEN 'ganeev-konstantin-1973-' || a.id ELSE 'ganeev-konstantin-1973' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ганеев' AND first_name = 'Константин' AND middle_name = 'Эдвардович' AND birth_year = 1973 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'voloshin-aleksandr-1995' AND s.athlete_id <> a.id)
              THEN 'voloshin-aleksandr-1995-' || a.id ELSE 'voloshin-aleksandr-1995' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Волошин' AND first_name = 'Александр' AND middle_name = 'Анатольевич' AND birth_year = 1995 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'usolcev-aleksandr-1992' AND s.athlete_id <> a.id)
              THEN 'usolcev-aleksandr-1992-' || a.id ELSE 'usolcev-aleksandr-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Усольцев' AND first_name = 'Александр' AND middle_name = 'Николаевич' AND birth_year = 1992 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sergeev-aleksey-2001' AND s.athlete_id <> a.id)
              THEN 'sergeev-aleksey-2001-' || a.id ELSE 'sergeev-aleksey-2001' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Сергеев' AND first_name = 'Алексей' AND middle_name = 'Вячеславович' AND birth_year = 2001 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'aybaev-ilfat-1989' AND s.athlete_id <> a.id)
              THEN 'aybaev-ilfat-1989-' || a.id ELSE 'aybaev-ilfat-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Айбаев' AND first_name = 'Ильфат' AND middle_name = 'Наильевич' AND birth_year = 1989 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'belyaev-ivan-1992' AND s.athlete_id <> a.id)
              THEN 'belyaev-ivan-1992-' || a.id ELSE 'belyaev-ivan-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Беляев' AND first_name = 'Иван' AND middle_name = 'Сергеевич' AND birth_year = 1992 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'yahnich-efim-1989' AND s.athlete_id <> a.id)
              THEN 'yahnich-efim-1989-' || a.id ELSE 'yahnich-efim-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Яхнич' AND first_name = 'Ефим' AND middle_name = 'Владимирович' AND birth_year = 1989 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'semenov-nikita-1993' AND s.athlete_id <> a.id)
              THEN 'semenov-nikita-1993-' || a.id ELSE 'semenov-nikita-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Семенов' AND first_name = 'Никита' AND middle_name = 'Андреевич' AND birth_year = 1993 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'drachev-gleb-2011' AND s.athlete_id <> a.id)
              THEN 'drachev-gleb-2011-' || a.id ELSE 'drachev-gleb-2011' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Драчев' AND first_name = 'Глеб' AND middle_name = 'Никитич' AND birth_year = 2011 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'dubel-aleksey-1990' AND s.athlete_id <> a.id)
              THEN 'dubel-aleksey-1990-' || a.id ELSE 'dubel-aleksey-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Дубель' AND first_name = 'Алексей' AND middle_name = 'Викторович' AND birth_year = 1990 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ivanov-vitaliy-1978' AND s.athlete_id <> a.id)
              THEN 'ivanov-vitaliy-1978-' || a.id ELSE 'ivanov-vitaliy-1978' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Виталий' AND middle_name = 'Викторович' AND birth_year = 1978 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kobzar-kirill-2002' AND s.athlete_id <> a.id)
              THEN 'kobzar-kirill-2002-' || a.id ELSE 'kobzar-kirill-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кобзарь' AND first_name = 'Кирилл' AND middle_name = 'Николаевич' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lukin-dmitriy-2011' AND s.athlete_id <> a.id)
              THEN 'lukin-dmitriy-2011-' || a.id ELSE 'lukin-dmitriy-2011' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Лукин' AND first_name = 'Дмитрий' AND middle_name = 'Алексеевич' AND birth_year = 2011 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'gustomyasov-denis-1982' AND s.athlete_id <> a.id)
              THEN 'gustomyasov-denis-1982-' || a.id ELSE 'gustomyasov-denis-1982' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Густомясов' AND first_name = 'Денис' AND middle_name = 'Алексеевич' AND birth_year = 1982 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'seliverstov-semen-1989' AND s.athlete_id <> a.id)
              THEN 'seliverstov-semen-1989-' || a.id ELSE 'seliverstov-semen-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Селиверстов' AND first_name = 'Семён' AND middle_name = 'Васильевич' AND birth_year = 1989 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'denisov-ivan-1982' AND s.athlete_id <> a.id)
              THEN 'denisov-ivan-1982-' || a.id ELSE 'denisov-ivan-1982' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Денисов' AND first_name = 'Иван' AND middle_name = 'Николаевич' AND birth_year = 1982 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'yudin-dmitriy-1989' AND s.athlete_id <> a.id)
              THEN 'yudin-dmitriy-1989-' || a.id ELSE 'yudin-dmitriy-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Юдин' AND first_name = 'Дмитрий' AND middle_name = 'Петрович' AND birth_year = 1989 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'pupin-roman-1998' AND s.athlete_id <> a.id)
              THEN 'pupin-roman-1998-' || a.id ELSE 'pupin-roman-1998' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Пупин' AND first_name = 'Роман' AND middle_name = 'Сергеевич' AND birth_year = 1998 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'husnudinova-mariya-2004' AND s.athlete_id <> a.id)
              THEN 'husnudinova-mariya-2004-' || a.id ELSE 'husnudinova-mariya-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Хуснудинова' AND first_name = 'Мария' AND middle_name = 'Петровна' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'gladysheva-darya-2004' AND s.athlete_id <> a.id)
              THEN 'gladysheva-darya-2004-' || a.id ELSE 'gladysheva-darya-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Гладышева' AND first_name = 'Дарья' AND middle_name = 'Алексеевна' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'belous-anna-2001' AND s.athlete_id <> a.id)
              THEN 'belous-anna-2001-' || a.id ELSE 'belous-anna-2001' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Белоус' AND first_name = 'Анна' AND middle_name = 'Сергеевна' AND birth_year = 2001 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'dementeva-natalya-2010' AND s.athlete_id <> a.id)
              THEN 'dementeva-natalya-2010-' || a.id ELSE 'dementeva-natalya-2010' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Дементьева' AND first_name = 'Наталья' AND middle_name = 'Сергеевна' AND birth_year = 2010 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'urzhumceva-svetlana-1992' AND s.athlete_id <> a.id)
              THEN 'urzhumceva-svetlana-1992-' || a.id ELSE 'urzhumceva-svetlana-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Уржумцева' AND first_name = 'Светлана' AND middle_name = 'Алексеевна' AND birth_year = 1992 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'alloyarova-milana-2002' AND s.athlete_id <> a.id)
              THEN 'alloyarova-milana-2002-' || a.id ELSE 'alloyarova-milana-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Аллоярова' AND first_name = 'Милана' AND middle_name = 'Борисовна' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sedova-marina-2009' AND s.athlete_id <> a.id)
              THEN 'sedova-marina-2009-' || a.id ELSE 'sedova-marina-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Седова' AND first_name = 'Марина' AND middle_name = 'Сергеевна' AND birth_year = 2009 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ogiy-anna-2006' AND s.athlete_id <> a.id)
              THEN 'ogiy-anna-2006-' || a.id ELSE 'ogiy-anna-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Огий' AND first_name = 'Анна' AND middle_name IS NULL AND birth_year = 2006 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'pleshkova-anastasiya-2005' AND s.athlete_id <> a.id)
              THEN 'pleshkova-anastasiya-2005-' || a.id ELSE 'pleshkova-anastasiya-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Плешкова' AND first_name = 'Анастасия' AND middle_name = 'Александровна' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'pasichnaya-olga-1981' AND s.athlete_id <> a.id)
              THEN 'pasichnaya-olga-1981-' || a.id ELSE 'pasichnaya-olga-1981' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Пасичная' AND first_name = 'Ольга' AND middle_name = 'Анатольевна' AND birth_year = 1981 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kamyshanskaya-evgeniya-2009' AND s.athlete_id <> a.id)
              THEN 'kamyshanskaya-evgeniya-2009-' || a.id ELSE 'kamyshanskaya-evgeniya-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Камышанская' AND first_name = 'Евгения' AND middle_name = 'Дмитриевна' AND birth_year = 2009 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'vahrusheva-karina-2010' AND s.athlete_id <> a.id)
              THEN 'vahrusheva-karina-2010-' || a.id ELSE 'vahrusheva-karina-2010' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Вахрушева' AND first_name = 'Карина' AND middle_name = 'Владимировна' AND birth_year = 2010 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'dedyuhina-kseniya-1990' AND s.athlete_id <> a.id)
              THEN 'dedyuhina-kseniya-1990-' || a.id ELSE 'dedyuhina-kseniya-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Дедюхина' AND first_name = 'Ксения' AND middle_name = 'Игоревна' AND birth_year = 1990 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'tashlanova-ulyana-2001' AND s.athlete_id <> a.id)
              THEN 'tashlanova-ulyana-2001-' || a.id ELSE 'tashlanova-ulyana-2001' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ташланова' AND first_name = 'Ульяна' AND middle_name = 'Павловна' AND birth_year = 2001 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'fedoresva-diana-1993' AND s.athlete_id <> a.id)
              THEN 'fedoresva-diana-1993-' || a.id ELSE 'fedoresva-diana-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Федоресва' AND first_name = 'Диана' AND middle_name = 'Всеволодовна' AND birth_year = 1993 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'gabbasova-kamila-2003' AND s.athlete_id <> a.id)
              THEN 'gabbasova-kamila-2003-' || a.id ELSE 'gabbasova-kamila-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Габбасова' AND first_name = 'Камила' AND middle_name = 'Руслановна' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ostrovskaya-nadezhda-1985' AND s.athlete_id <> a.id)
              THEN 'ostrovskaya-nadezhda-1985-' || a.id ELSE 'ostrovskaya-nadezhda-1985' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Островская' AND first_name = 'Надежда' AND middle_name = 'Аркадьевна' AND birth_year = 1985 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zaharova-tatyana-2006' AND s.athlete_id <> a.id)
              THEN 'zaharova-tatyana-2006-' || a.id ELSE 'zaharova-tatyana-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Захарова' AND first_name = 'Татьяна' AND middle_name = 'Вадимовна' AND birth_year = 2006 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'taeva-nagima-1991' AND s.athlete_id <> a.id)
              THEN 'taeva-nagima-1991-' || a.id ELSE 'taeva-nagima-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Таева' AND first_name = 'Нагима' AND middle_name = 'Сериковна' AND birth_year = 1991 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'beloshapkina-tatyana-1979' AND s.athlete_id <> a.id)
              THEN 'beloshapkina-tatyana-1979-' || a.id ELSE 'beloshapkina-tatyana-1979' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Белошапкина' AND first_name = 'Татьяна' AND middle_name = 'Владимировна' AND birth_year = 1979 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'umarova-olesya-1983' AND s.athlete_id <> a.id)
              THEN 'umarova-olesya-1983-' || a.id ELSE 'umarova-olesya-1983' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Умарова' AND first_name = 'Олеся' AND middle_name = 'Васильевна' AND birth_year = 1983 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'potapova-anastasiya-2004' AND s.athlete_id <> a.id)
              THEN 'potapova-anastasiya-2004-' || a.id ELSE 'potapova-anastasiya-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Потапова' AND first_name = 'Анастасия' AND middle_name = 'Михайловна' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'mironova-vasilisa-2004' AND s.athlete_id <> a.id)
              THEN 'mironova-vasilisa-2004-' || a.id ELSE 'mironova-vasilisa-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Миронова' AND first_name = 'Василиса' AND middle_name = 'Александровна' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lebedeva-irina-1968' AND s.athlete_id <> a.id)
              THEN 'lebedeva-irina-1968-' || a.id ELSE 'lebedeva-irina-1968' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Лебедева' AND first_name = 'Ирина' AND middle_name = 'Михайловна' AND birth_year = 1968 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'hvostov-vladislav-2006' AND s.athlete_id <> a.id)
              THEN 'hvostov-vladislav-2006-' || a.id ELSE 'hvostov-vladislav-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Хвостов' AND first_name = 'Владислав' AND middle_name = 'Денисович' AND birth_year = 2006 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'potapov-danil-2002' AND s.athlete_id <> a.id)
              THEN 'potapov-danil-2002-' || a.id ELSE 'potapov-danil-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Потапов' AND first_name = 'Данил' AND middle_name = 'Алексеевич' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'babichev-ivan-1996' AND s.athlete_id <> a.id)
              THEN 'babichev-ivan-1996-' || a.id ELSE 'babichev-ivan-1996' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бабичев' AND first_name = 'Иван' AND middle_name = 'Александрович' AND birth_year = 1996 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'pstelin-aleksandr-1987' AND s.athlete_id <> a.id)
              THEN 'pstelin-aleksandr-1987-' || a.id ELSE 'pstelin-aleksandr-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Пстелин' AND first_name = 'Александр' AND middle_name = 'Владимирович' AND birth_year = 1987 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'tuhvatullin-rinat-1994' AND s.athlete_id <> a.id)
              THEN 'tuhvatullin-rinat-1994-' || a.id ELSE 'tuhvatullin-rinat-1994' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Тухватуллин' AND first_name = 'Ринат' AND middle_name = 'Самигуллович' AND birth_year = 1994 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'solodchenko-vladimir-1984' AND s.athlete_id <> a.id)
              THEN 'solodchenko-vladimir-1984-' || a.id ELSE 'solodchenko-vladimir-1984' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Солодченко' AND first_name = 'Владимир' AND middle_name = 'Иванович' AND birth_year = 1984 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'safonov-aleksey-1990' AND s.athlete_id <> a.id)
              THEN 'safonov-aleksey-1990-' || a.id ELSE 'safonov-aleksey-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Сафонов' AND first_name = 'Алексей' AND middle_name = 'Андреевич' AND birth_year = 1990 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'murtazin-vasiliy-1971' AND s.athlete_id <> a.id)
              THEN 'murtazin-vasiliy-1971-' || a.id ELSE 'murtazin-vasiliy-1971' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Муртазин' AND first_name = 'Василий' AND middle_name = 'Васильевич' AND birth_year = 1971 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'suslov-aleksandr-1986' AND s.athlete_id <> a.id)
              THEN 'suslov-aleksandr-1986-' || a.id ELSE 'suslov-aleksandr-1986' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Суслов' AND first_name = 'Александр' AND middle_name = 'Владимирович' AND birth_year = 1986 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'strekalovskih-nikolay-1993' AND s.athlete_id <> a.id)
              THEN 'strekalovskih-nikolay-1993-' || a.id ELSE 'strekalovskih-nikolay-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Стрекаловских' AND first_name = 'Николай' AND middle_name = 'Сергеевич' AND birth_year = 1993 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'potapov-vladislav-1978' AND s.athlete_id <> a.id)
              THEN 'potapov-vladislav-1978-' || a.id ELSE 'potapov-vladislav-1978' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Потапов' AND first_name = 'Владислав' AND middle_name = 'Владимирович' AND birth_year = 1978 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'poltorygiy-ivan-2003' AND s.athlete_id <> a.id)
              THEN 'poltorygiy-ivan-2003-' || a.id ELSE 'poltorygiy-ivan-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Полторыгий' AND first_name = 'Иван' AND middle_name = 'Юрьевич' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'belesov-ivan-1992' AND s.athlete_id <> a.id)
              THEN 'belesov-ivan-1992-' || a.id ELSE 'belesov-ivan-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Белесов' AND first_name = 'Иван' AND middle_name = 'Сергеевич' AND birth_year = 1992 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'husnudinov-arslan-1985' AND s.athlete_id <> a.id)
              THEN 'husnudinov-arslan-1985-' || a.id ELSE 'husnudinov-arslan-1985' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Хуснудинов' AND first_name = 'Арслан' AND middle_name = 'Закеевич' AND birth_year = 1985 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'semenov-andrey-1991' AND s.athlete_id <> a.id)
              THEN 'semenov-andrey-1991-' || a.id ELSE 'semenov-andrey-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Семёнов' AND first_name = 'Андрей' AND middle_name = 'Владимирович' AND birth_year = 1991 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'tokarev-timofey-2003' AND s.athlete_id <> a.id)
              THEN 'tokarev-timofey-2003-' || a.id ELSE 'tokarev-timofey-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Токарев' AND first_name = 'Тимофей' AND middle_name = 'Дмитриевич' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'moskvichev-maksim-1991' AND s.athlete_id <> a.id)
              THEN 'moskvichev-maksim-1991-' || a.id ELSE 'moskvichev-maksim-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Москвичев' AND first_name = 'Максим' AND middle_name = 'Вячеславович' AND birth_year = 1991 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'gorban-kirill-2007' AND s.athlete_id <> a.id)
              THEN 'gorban-kirill-2007-' || a.id ELSE 'gorban-kirill-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Горбань' AND first_name = 'Кирилл' AND middle_name IS NULL AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'gamov-andrey-1988' AND s.athlete_id <> a.id)
              THEN 'gamov-andrey-1988-' || a.id ELSE 'gamov-andrey-1988' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Гамов' AND first_name = 'Андрей' AND middle_name = 'Сергеевич' AND birth_year = 1988 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'pletnev-vitaliy-1983' AND s.athlete_id <> a.id)
              THEN 'pletnev-vitaliy-1983-' || a.id ELSE 'pletnev-vitaliy-1983' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Плетнёв' AND first_name = 'Виталий' AND middle_name = 'Владимирович' AND birth_year = 1983 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'bondarev-dmitriy-1986' AND s.athlete_id <> a.id)
              THEN 'bondarev-dmitriy-1986-' || a.id ELSE 'bondarev-dmitriy-1986' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бондарев' AND first_name = 'Дмитрий' AND middle_name = 'Александрович' AND birth_year = 1986 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'shlyahtin-aleksandr-1980' AND s.athlete_id <> a.id)
              THEN 'shlyahtin-aleksandr-1980-' || a.id ELSE 'shlyahtin-aleksandr-1980' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Шляхтин' AND first_name = 'Александр' AND middle_name = 'Сергеевич' AND birth_year = 1980 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'solodov-dmitriy-1995' AND s.athlete_id <> a.id)
              THEN 'solodov-dmitriy-1995-' || a.id ELSE 'solodov-dmitriy-1995' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Солодов' AND first_name = 'Дмитрий' AND middle_name = 'Юрьевич' AND birth_year = 1995 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kudryarov-roman-2006' AND s.athlete_id <> a.id)
              THEN 'kudryarov-roman-2006-' || a.id ELSE 'kudryarov-roman-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кудряров' AND first_name = 'Роман' AND middle_name = 'Альбертович' AND birth_year = 2006 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sukmanov-aleksandr-1985' AND s.athlete_id <> a.id)
              THEN 'sukmanov-aleksandr-1985-' || a.id ELSE 'sukmanov-aleksandr-1985' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Сукманов' AND first_name = 'Александр' AND middle_name = 'Александрович' AND birth_year = 1985 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kulikov-vladislav-2006' AND s.athlete_id <> a.id)
              THEN 'kulikov-vladislav-2006-' || a.id ELSE 'kulikov-vladislav-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Куликов' AND first_name = 'Владислав' AND middle_name = 'Александрович' AND birth_year = 2006 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'grigorev-andrey-1987' AND s.athlete_id <> a.id)
              THEN 'grigorev-andrey-1987-' || a.id ELSE 'grigorev-andrey-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Григорьев' AND first_name = 'Андрей' AND middle_name = 'Анатольевич' AND birth_year = 1987 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'mingazedinov-vyacheslav-1984' AND s.athlete_id <> a.id)
              THEN 'mingazedinov-vyacheslav-1984-' || a.id ELSE 'mingazedinov-vyacheslav-1984' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Мингазединов' AND first_name = 'Вячеслав' AND middle_name = 'Равильевич' AND birth_year = 1984 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'panaitov-iosif-1981' AND s.athlete_id <> a.id)
              THEN 'panaitov-iosif-1981-' || a.id ELSE 'panaitov-iosif-1981' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Панаитов' AND first_name = 'Иосиф' AND middle_name = 'Михайлович' AND birth_year = 1981 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'moskovskih-aleksey-1994' AND s.athlete_id <> a.id)
              THEN 'moskovskih-aleksey-1994-' || a.id ELSE 'moskovskih-aleksey-1994' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Московских' AND first_name = 'Алексей' AND middle_name = 'Сергеевич' AND birth_year = 1994 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'macyuk-kirill-1996' AND s.athlete_id <> a.id)
              THEN 'macyuk-kirill-1996-' || a.id ELSE 'macyuk-kirill-1996' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Мацюк' AND first_name = 'Кирилл' AND middle_name = 'Станиславович' AND birth_year = 1996 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'gulov-farhod-1997' AND s.athlete_id <> a.id)
              THEN 'gulov-farhod-1997-' || a.id ELSE 'gulov-farhod-1997' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Гулов' AND first_name = 'Фарход' AND middle_name = 'Абдурахмонович' AND birth_year = 1997 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kalimullin-ilnur-1985' AND s.athlete_id <> a.id)
              THEN 'kalimullin-ilnur-1985-' || a.id ELSE 'kalimullin-ilnur-1985' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Калимуллин' AND first_name = 'Ильнур' AND middle_name = 'Ринатович' AND birth_year = 1985 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'klyuchkin-roman-1985' AND s.athlete_id <> a.id)
              THEN 'klyuchkin-roman-1985-' || a.id ELSE 'klyuchkin-roman-1985' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ключкин' AND first_name = 'Роман' AND middle_name = 'Викторович' AND birth_year = 1985 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'maksimov-andrey-1988' AND s.athlete_id <> a.id)
              THEN 'maksimov-andrey-1988-' || a.id ELSE 'maksimov-andrey-1988' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Максимов' AND first_name = 'Андрей' AND middle_name = 'Владимирович' AND birth_year = 1988 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'hlan-anatoliy-1981' AND s.athlete_id <> a.id)
              THEN 'hlan-anatoliy-1981-' || a.id ELSE 'hlan-anatoliy-1981' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Хлань' AND first_name = 'Анатолий' AND middle_name = 'Анатольевич' AND birth_year = 1981 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);

INSERT INTO results (id, category_id, athlete_id, place, total_reps, points, body_weight_kg, rank_achieved_id, discipline_id, bell_kg, hands, time_limit_min, competition_id, event_date, raw_name, raw_club, raw_region, protocol_id, source_page) VALUES
  (6001, 6001, (SELECT id FROM athletes WHERE last_name = 'Кошурникова' AND first_name = 'Валерия' AND middle_name = 'Александровна' AND birth_year = 2012 LIMIT 1), 1, 32, NULL, 53.5, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 6001, '2026-04-08', 'Кошурникова Валерия Александровна', 'МБУ ДО СШОР «Югория» им. А.А. Пилюгина', 'Ханты-Мансийский АО - Югра', 6001, 21),
  (6002, 6001, (SELECT id FROM athletes WHERE last_name = 'Трофимова' AND first_name = 'Александра' AND middle_name = 'Александровна' AND birth_year = 2008 LIMIT 1), 2, 15, NULL, 53.56, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 6001, '2026-04-08', 'Трофимова Александра Александровна', 'МАУ ДО СШ "Геолог"', 'Ямало-Ненецкий автономный округ', 6001, 21),
  (6003, 6002, (SELECT id FROM athletes WHERE last_name = 'Степанова' AND first_name = 'Оксана' AND middle_name = 'Анатольевна' AND birth_year = 1990 LIMIT 1), 1, 20, NULL, 62.9, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 6001, '2026-04-08', 'Степанова Оксана Анатольевна', 'СШОР "Атлет"', 'Челябинская область', 6001, 22),
  (6004, 6002, (SELECT id FROM athletes WHERE last_name = 'Бахтина' AND first_name = 'Виктория' AND middle_name = 'Викторовна' AND birth_year = 1999 LIMIT 1), 2, 15, NULL, 61.55, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 6001, '2026-04-08', 'Бахтина Виктория Викторовна', 'ВФГС ЯНАО', 'Ямало-Ненецкий автономный округ', 6001, 22),
  (6005, 6002, (SELECT id FROM athletes WHERE last_name = 'Белоглазова' AND first_name = 'Елизавета' AND middle_name = 'Александровна' AND birth_year = 2002 LIMIT 1), 3, 3, NULL, 62.4, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 6001, '2026-04-08', 'Белоглазова Елизавета Александровна', 'МБУДО "Каргапольская ДЮСШ"', 'Курганская область', 6001, 22),
  (6006, 6003, (SELECT id FROM athletes WHERE last_name = 'Полякова' AND first_name = 'Полина' AND middle_name = 'Сергеевна' AND birth_year = 1999 LIMIT 1), 1, 111, NULL, 92.35, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 6001, '2026-04-08', 'Полякова Полина Сергеевна', 'ТРО ООО «ВФГС»', 'Тюменская область', 6001, 24),
  (6007, 6003, (SELECT id FROM athletes WHERE last_name = 'Фируглева' AND first_name = 'Василиса' AND middle_name = 'Владимировна' AND birth_year = 2004 LIMIT 1), 2, 62, NULL, 68.9, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 6001, '2026-04-08', 'Фируглева Василиса Владимировна', 'МАУ ДО СШ "Геолог"', 'Ямало-Ненецкий автономный округ', 6001, 24),
  (6008, 6003, (SELECT id FROM athletes WHERE last_name = 'Дубровина' AND first_name = 'Татьяна' AND middle_name = 'Александровна' AND birth_year = 2003 LIMIT 1), 3, 33, NULL, 88.6, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 6001, '2026-04-08', 'Дубровина Татьяна Александровна', 'Спортивная школа города Ялуторовска', 'Тюменская область', 6001, 24),
  (6009, 6003, (SELECT id FROM athletes WHERE last_name = 'Баранова' AND first_name = 'Дарья' AND middle_name = 'Андреевна' AND birth_year = 2008 LIMIT 1), 4, 26, NULL, 69.1, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 6001, '2026-04-08', 'Баранова Дарья Андреевна', 'МАУ ДО "Спортивная школа"', 'Ханты-Мансийский АО - Югра', 6001, 24),
  (6010, 6003, (SELECT id FROM athletes WHERE last_name = 'Шарыгина' AND first_name = 'Юлия' AND middle_name = 'Дмитриевна' AND birth_year = 2003 LIMIT 1), 5, 2, NULL, 75.5, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 6001, '2026-04-08', 'Шарыгина Юлия Дмитриевна', 'ТРО ООО «ВФГС»', 'Тюменская область', 6001, 24),
  (6011, 6004, (SELECT id FROM athletes WHERE last_name = 'Кошурникова' AND first_name = 'Анастасия' AND middle_name = 'Александровна' AND birth_year = 2003 LIMIT 1), 1, 73, NULL, 64.2, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 6001, '2026-04-08', 'Кошурникова Анастасия Александровна', 'МБУ ДО СШОР «Югория» им. А.А. Пилюгина', 'Ханты-Мансийский АО - Югра', 6001, 23),
  (6012, 6004, (SELECT id FROM athletes WHERE last_name = 'Подпрятова' AND first_name = 'Марина' AND middle_name = 'Сергеевна' AND birth_year = 1992 LIMIT 1), 2, 22, NULL, 68.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 6001, '2026-04-08', 'Подпрятова Марина Сергеевна', 'ВФГС ЯНАО', 'Ямало-Ненецкий автономный округ', 6001, 23),
  (6013, 6004, (SELECT id FROM athletes WHERE last_name = 'Походяева' AND first_name = 'Александра' AND middle_name = 'Андреевна' AND birth_year = 1990 LIMIT 1), 3, 21, NULL, 66.95, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 6001, '2026-04-08', 'Походяева Александра Андреевна', 'ООО «Газпром добыча Уренгой»', 'Ямало-Ненецкий автономный округ', 6001, 23),
  (6014, 6005, (SELECT id FROM athletes WHERE last_name = 'Ховалко' AND first_name = 'Василий' AND middle_name = 'Михайлович' AND birth_year = 1993 LIMIT 1), 1, 77, NULL, 62.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 6001, '2026-04-08', 'Ховалко Василий Михайлович', 'МАУ ДО СШ "Геолог"', 'Ямало-Ненецкий автономный округ', 6001, 14),
  (6015, 6005, (SELECT id FROM athletes WHERE last_name = 'Манаков' AND first_name = 'Трофим' AND middle_name = 'Анатольевич' AND birth_year = 2000 LIMIT 1), 2, 71, NULL, 62.95, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 6001, '2026-04-08', 'Манаков Трофим Анатольевич', 'МАУ ДО «Спортивная школа №2» Сургутского р-на', 'Ханты-Мансийский АО - Югра', 6001, 14),
  (6016, 6005, (SELECT id FROM athletes WHERE last_name = 'Жалов' AND first_name = 'Ярослав' AND middle_name = 'Борисович' AND birth_year = 2007 LIMIT 1), 3, 58, NULL, 62.2, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 6001, '2026-04-08', 'Жалов Ярослав Борисович', 'МБУ ДО СШОР «Югория» им. А.А. Пилюгина', 'Ханты-Мансийский АО - Югра', 6001, 14),
  (6017, 6005, (SELECT id FROM athletes WHERE last_name = 'Клявлин' AND first_name = 'Андрей' AND middle_name = 'Викторович' AND birth_year = 2006 LIMIT 1), 4, 52, NULL, 63.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 6001, '2026-04-08', 'Клявлин Андрей Викторович', 'РО ООО ВФГС в Челябинской области', 'Челябинская область', 6001, 14),
  (6018, 6006, (SELECT id FROM athletes WHERE last_name = 'Айдбаев' AND first_name = 'Ильфат' AND middle_name = 'Наильевич' AND birth_year = 1989 LIMIT 1), 1, 69, NULL, 66.3, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 6001, '2026-04-08', 'Айдбаев Ильфат Наильевич', 'МАУ ДО "СШ № 1" г.Тобольска', 'Тюменская область', 6001, 15),
  (6019, 6006, (SELECT id FROM athletes WHERE last_name = 'Малев' AND first_name = 'Родион' AND middle_name = 'Александрович' AND birth_year = 2011 LIMIT 1), 2, 56, NULL, 67.55, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 6001, '2026-04-08', 'Малев Родион Александрович', 'СШОР "Старт"', 'Челябинская область', 6001, 15),
  (6020, 6006, (SELECT id FROM athletes WHERE last_name = 'Ноздрин' AND first_name = 'Егор' AND middle_name = 'Андреевич' AND birth_year = 2010 LIMIT 1), 3, 44, NULL, 67.9, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 6001, '2026-04-08', 'Ноздрин Егор Андреевич', 'МБУ ДО "Лебяжьевская ДЮСШ"', 'Курганская область', 6001, 15),
  (6021, 6007, (SELECT id FROM athletes WHERE last_name = 'Рябков' AND first_name = 'Алексей' AND middle_name = 'Игоревич' AND birth_year = 1993 LIMIT 1), 1, 145, NULL, 73.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 6001, '2026-04-08', 'Рябков Алексей Игоревич', 'МБУ ДО СШОР «Югория» им. А.А. Пилюгина', 'Ханты-Мансийский АО - Югра', 6001, 16),
  (6022, 6007, (SELECT id FROM athletes WHERE last_name = 'Тимошенко' AND first_name = 'Дмитрий' AND middle_name = 'Евгеньевич' AND birth_year = 2011 LIMIT 1), 2, 86, NULL, 72.15, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 6001, '2026-04-08', 'Тимошенко Дмитрий Евгеньевич', 'МБУ ДО "Лебяжьевская ДЮСШ"', 'Курганская область', 6001, 16),
  (6023, 6007, (SELECT id FROM athletes WHERE last_name = 'Подгорный' AND first_name = 'Иван' AND middle_name = 'Юрьевич' AND birth_year = 2003 LIMIT 1), 3, 86, NULL, 72.6, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 6001, '2026-04-08', 'Подгорный Иван Юрьевич', 'СШОР "Атлет"', 'Челябинская область', 6001, 16),
  (6024, 6007, (SELECT id FROM athletes WHERE last_name = 'Леонов' AND first_name = 'Дмитрий' AND middle_name = 'Алексеевич' AND birth_year = 2003 LIMIT 1), 4, 82, NULL, 71.6, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 6001, '2026-04-08', 'Леонов Дмитрий Алексеевич', 'МАУ ДО ДЮЦ "Старт" города Тюмени', 'Тюменская область', 6001, 16),
  (6025, 6007, (SELECT id FROM athletes WHERE last_name = 'Аксентьев' AND first_name = 'Данил' AND middle_name = 'Андреевич' AND birth_year = 2003 LIMIT 1), 5, 78, NULL, 72.85, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 6001, '2026-04-08', 'Аксентьев Данил Андреевич', 'СШОР "Атлет"', 'Челябинская область', 6001, 16),
  (6026, 6007, (SELECT id FROM athletes WHERE last_name = 'Ашенов' AND first_name = 'Тимерзан' AND middle_name = 'Каирбулатович' AND birth_year = 1994 LIMIT 1), 6, 56, NULL, 72.95, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 6001, '2026-04-08', 'Ашенов Тимерзан Каирбулатович', 'ВФГС ЯНАО', 'Ямало-Ненецкий автономный округ', 6001, 16),
  (6027, 6007, (SELECT id FROM athletes WHERE last_name = 'Глазырин' AND first_name = 'Роман' AND middle_name = 'Николаевич' AND birth_year = 2005 LIMIT 1), 7, 30, NULL, 70.5, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 6001, '2026-04-08', 'Глазырин Роман Николаевич', 'РО ООО ВФГС в Челябинской области', 'Челябинская область', 6001, 16),
  (6028, 6008, (SELECT id FROM athletes WHERE last_name = 'Бобров' AND first_name = 'Владимир' AND middle_name = 'Сергеевич' AND birth_year = 1989 LIMIT 1), 1, 130, NULL, 77.7, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 6001, '2026-04-08', 'Бобров Владимир Сергеевич', 'ВС', 'Тюменская область', 6001, 17),
  (6029, 6008, (SELECT id FROM athletes WHERE last_name = 'Сарсембаев' AND first_name = 'Ильяс' AND middle_name = 'Асхатович' AND birth_year = 1999 LIMIT 1), 2, 118, NULL, 77.4, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 6001, '2026-04-08', 'Сарсембаев Ильяс Асхатович', 'МБУ ДО СШ "Зенит"', 'Ямало-Ненецкий автономный округ', 6001, 17),
  (6030, 6008, (SELECT id FROM athletes WHERE last_name = 'Ташланов' AND first_name = 'Илья' AND middle_name = 'Станиславович' AND birth_year = 1987 LIMIT 1), 3, 105, NULL, 78.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 6001, '2026-04-08', 'Ташланов Илья Станиславович', 'СШОР "Атлет"', 'Челябинская область', 6001, 17),
  (6031, 6008, (SELECT id FROM athletes WHERE last_name = 'Степанов' AND first_name = 'Сергей' AND middle_name = 'Владимирович' AND birth_year = 1993 LIMIT 1), 4, 104, NULL, 77.7, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 6001, '2026-04-08', 'Степанов Сергей Владимирович', 'СШОР "Атлет"', 'Челябинская область', 6001, 17),
  (6032, 6008, (SELECT id FROM athletes WHERE last_name = 'Согоян' AND first_name = 'Артем' AND middle_name = 'Ражденович' AND birth_year = 1988 LIMIT 1), 5, 89, NULL, 77.65, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 6001, '2026-04-08', 'Согоян Артем Ражденович', 'МАУ «Районное управление спортивных сооружений»', 'Ханты-Мансийский АО - Югра', 6001, 17),
  (6033, 6008, (SELECT id FROM athletes WHERE last_name = 'Баландин' AND first_name = 'Андрей' AND middle_name = 'Александрович' AND birth_year = 1996 LIMIT 1), 6, 65, NULL, 77.95, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 6001, '2026-04-08', 'Баландин Андрей Александрович', 'МБУДО "Каргапольская ДЮСШ"', 'Курганская область', 6001, 17),
  (6034, 6009, (SELECT id FROM athletes WHERE last_name = 'Самочернов' AND first_name = 'Иван' AND middle_name = 'Николаевич' AND birth_year = 1998 LIMIT 1), 1, 146, NULL, 84.85, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 6001, '2026-04-08', 'Самочернов Иван Николаевич', 'МБУДО "Каргапольская ДЮСШ"', 'Курганская область', 6001, 18),
  (6035, 6009, (SELECT id FROM athletes WHERE last_name = 'Плотников' AND first_name = 'Вячеслав' AND middle_name = 'Евгеньевич' AND birth_year = 1998 LIMIT 1), 2, 141, NULL, 84.2, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 6001, '2026-04-08', 'Плотников Вячеслав Евгеньевич', 'РО ООО ВФГС в Челябинской области', 'Челябинская область', 6001, 18),
  (6036, 6009, (SELECT id FROM athletes WHERE last_name = 'Рамазанов' AND first_name = 'Вадим' AND middle_name = 'Русланович' AND birth_year = 2007 LIMIT 1), 3, 85, NULL, 82.85, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 6001, '2026-04-08', 'Рамазанов Вадим Русланович', 'МБУ ДО СШ "Зенит"', 'Ямало-Ненецкий автономный округ', 6001, 18),
  (6037, 6009, (SELECT id FROM athletes WHERE last_name = 'Тимоненков' AND first_name = 'Станислав' AND middle_name = 'Олегович' AND birth_year = 2005 LIMIT 1), 4, 66, NULL, 81.95, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 6001, '2026-04-08', 'Тимоненков Станислав Олегович', 'МАУ ДО «Спортивная школа №2» Сургутского р-на', 'Ханты-Мансийский АО - Югра', 6001, 18),
  (6038, 6009, (SELECT id FROM athletes WHERE last_name = 'Густомясов' AND first_name = 'Георгий' AND middle_name = 'Денисович' AND birth_year = 2006 LIMIT 1), 5, 60, NULL, 83.65, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 6001, '2026-04-08', 'Густомясов Георгий Денисович', 'МАУ ДО «Спортивная школа №2» Сургутского р-на', 'Ханты-Мансийский АО - Югра', 6001, 18),
  (6039, 6009, (SELECT id FROM athletes WHERE last_name = 'Иксанов' AND first_name = 'Ярослав' AND middle_name = 'Вячеславович' AND birth_year = 2006 LIMIT 1), 6, 60, NULL, 84.05, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 6001, '2026-04-08', 'Иксанов Ярослав Вячеславович', 'МАУ ДО "Спортивная школа"', 'Ханты-Мансийский АО - Югра', 6001, 18),
  (6040, 6009, (SELECT id FROM athletes WHERE last_name = 'Гнилоузубов' AND first_name = 'Никита' AND middle_name = 'Вячеславович' AND birth_year = 2008 LIMIT 1), 7, 52, NULL, 82.05, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 6001, '2026-04-08', 'Гнилоузубов Никита Вячеславович', 'МАУ ДО «Спортивная школа №2» Сургутского р-на', 'Ханты-Мансийский АО - Югра', 6001, 18),
  (6041, 6009, (SELECT id FROM athletes WHERE last_name = 'Тэсида' AND first_name = 'Владимир' AND middle_name = 'Владимирович' AND birth_year = 2007 LIMIT 1), 8, 20, NULL, 83.75, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 6001, '2026-04-08', 'Тэсида Владимир Владимирович', 'МБУ ЦРФКИС', 'Ямало-Ненецкий автономный округ', 6001, 18),
  (6042, 6010, (SELECT id FROM athletes WHERE last_name = 'Вдовенко' AND first_name = 'Александр' AND middle_name = 'Андреевич' AND birth_year = 1995 LIMIT 1), 1, 100, NULL, 106.7, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 6001, '2026-04-08', 'Вдовенко Александр Андреевич', 'МБУДО "Каргапольская ДЮСШ"', 'Курганская область', 6001, 20),
  (6043, 6010, (SELECT id FROM athletes WHERE last_name = 'Цыбулевский' AND first_name = 'Сергей' AND middle_name = 'Алексеевич' AND birth_year = 2007 LIMIT 1), 2, 67, NULL, 100.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 6001, '2026-04-08', 'Цыбулевский Сергей Алексеевич', 'МАУ ДО «Спортивная школа №2» Сургутского р-на', 'Ханты-Мансийский АО - Югра', 6001, 20),
  (6044, 6010, (SELECT id FROM athletes WHERE last_name = 'Харючи' AND first_name = 'Родион' AND middle_name = 'Викторович' AND birth_year = 1993 LIMIT 1), 3, 63, NULL, 105.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 6001, '2026-04-08', 'Харючи Родион Викторович', 'МБУ ЦРФКИС', 'Ямало-Ненецкий автономный округ', 6001, 20),
  (6045, 6011, (SELECT id FROM athletes WHERE last_name = 'Николаев' AND first_name = 'Аркадий' AND middle_name = 'Анатольевич' AND birth_year = 2002 LIMIT 1), 1, 142, NULL, 90.65, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 6001, '2026-04-08', 'Николаев Аркадий Анатольевич', 'МБУ ДО СШОР «Югория» им. А.А. Пилюгина', 'Ханты-Мансийский АО - Югра', 6001, 19),
  (6046, 6011, (SELECT id FROM athletes WHERE last_name = 'Минибаев' AND first_name = 'Альзаф' AND middle_name = 'Альбертович' AND birth_year = 1987 LIMIT 1), 2, 110, NULL, 89.3, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 6001, '2026-04-08', 'Минибаев Альзаф Альбертович', 'ООО "Газпром переработка"', 'Ямало-Ненецкий автономный округ', 6001, 19),
  (6047, 6011, (SELECT id FROM athletes WHERE last_name = 'Битков' AND first_name = 'Антон' AND middle_name = 'Николаевич' AND birth_year = 1994 LIMIT 1), 3, 99, NULL, 86.5, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 6001, '2026-04-08', 'Битков Антон Николаевич', 'МБУДО "Куртамышская ДЮСШ"', 'Курганская область', 6001, 19),
  (6048, 6011, (SELECT id FROM athletes WHERE last_name = 'Самохвалов' AND first_name = 'Илья' AND middle_name = 'Дмитриевич' AND birth_year = 2007 LIMIT 1), 4, 99, NULL, 90.2, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 6001, '2026-04-08', 'Самохвалов Илья Дмитриевич', 'МАУ ДО СШ "Геолог"', 'Ямало-Ненецкий автономный округ', 6001, 19),
  (6049, 6011, (SELECT id FROM athletes WHERE last_name = 'Емельянов' AND first_name = 'Николай' AND middle_name = 'Анатольевич' AND birth_year = 1983 LIMIT 1), 5, 98, NULL, 88.4, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 6001, '2026-04-08', 'Емельянов Николай Анатольевич', 'КСК Факел', 'Ямало-Ненецкий автономный округ', 6001, 19),
  (6050, 6011, (SELECT id FROM athletes WHERE last_name = 'Ткачёв' AND first_name = 'Роман' AND middle_name = 'Антонович' AND birth_year = 2006 LIMIT 1), 6, 85, NULL, 87.1, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 6001, '2026-04-08', 'Ткачёв Роман Антонович', 'МАУ "ЦФОР-Ритм"', 'Тюменская область', 6001, 19),
  (6051, 6011, (SELECT id FROM athletes WHERE last_name = 'Медведев' AND first_name = 'Виктор' AND middle_name = 'Алексеевич' AND birth_year = 2003 LIMIT 1), 7, 76, NULL, 91.45, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 6001, '2026-04-08', 'Медведев Виктор Алексеевич', 'Федерация гиревого спорта СО', 'Свердловская область', 6001, 19),
  (6052, 6011, (SELECT id FROM athletes WHERE last_name = 'Дашкевич' AND first_name = 'Владимир' AND middle_name = 'Олегович' AND birth_year = 1984 LIMIT 1), 8, 57, NULL, 87.3, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 6001, '2026-04-08', 'Дашкевич Владимир Олегович', 'МАУ «Районное управление спортивных сооружений»', 'Ханты-Мансийский АО - Югра', 6001, 19),
  (6053, 6012, (SELECT id FROM athletes WHERE last_name = 'Кошурникова' AND first_name = 'Валерия' AND middle_name = 'Александровна' AND birth_year = 2012 LIMIT 1), 1, 27, NULL, 53.18, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 6001, '2026-04-08', 'Кошурникова Валерия Александровна', 'МБУ ДО СШОР «Югория» им. А.А. Пилюгина', 'Ханты-Мансийский АО - Югра', 6001, 10),
  (6054, 6012, (SELECT id FROM athletes WHERE last_name = 'Спасенникова' AND first_name = 'Валерия' AND middle_name = 'Витальевна' AND birth_year = 2008 LIMIT 1), 2, 20, NULL, 57.26, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 6001, '2026-04-08', 'Спасенникова Валерия Витальевна', 'МАУ "ЦСФР" города Ялуторовска', 'Тюменская область', 6001, 10),
  (6055, 6012, (SELECT id FROM athletes WHERE last_name = 'Трофимова' AND first_name = 'Александра' AND middle_name = 'Александровна' AND birth_year = 2008 LIMIT 1), 3, 10, NULL, 53.4, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 6001, '2026-04-08', 'Трофимова Александра Александровна', 'МАУ ДО СШ "Геолог"', 'Ямало-Ненецкий автономный округ', 6001, 10),
  (6056, 6013, (SELECT id FROM athletes WHERE last_name = 'Степанова' AND first_name = 'Оксана' AND middle_name = 'Анатольевна' AND birth_year = 1990 LIMIT 1), 1, 14, NULL, 62.95, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 6001, '2026-04-08', 'Степанова Оксана Анатольевна', 'СШОР "Атлет"', 'Челябинская область', 6001, 11),
  (6057, 6014, (SELECT id FROM athletes WHERE last_name = 'Полякова' AND first_name = 'Полина' AND middle_name = 'Сергеевна' AND birth_year = 1999 LIMIT 1), 1, 56, NULL, 92.8, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 6001, '2026-04-08', 'Полякова Полина Сергеевна', 'ТРО ООО «ВФГС»', 'Тюменская область', 6001, 13),
  (6058, 6014, (SELECT id FROM athletes WHERE last_name = 'Фируглева' AND first_name = 'Василиса' AND middle_name = 'Владимировна' AND birth_year = 2004 LIMIT 1), 2, 41, NULL, 68.7, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 6001, '2026-04-08', 'Фируглева Василиса Владимировна', 'МАУ ДО СШ "Геолог"', 'Ямало-Ненецкий автономный округ', 6001, 13),
  (6059, 6014, (SELECT id FROM athletes WHERE last_name = 'Баранова' AND first_name = 'Дарья' AND middle_name = 'Андреевна' AND birth_year = 2008 LIMIT 1), 3, 31, NULL, 68.95, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 6001, '2026-04-08', 'Баранова Дарья Андреевна', 'МАУ ДО "Спортивная школа"', 'Ханты-Мансийский АО - Югра', 6001, 13),
  (6060, 6014, (SELECT id FROM athletes WHERE last_name = 'Дубровина' AND first_name = 'Татьяна' AND middle_name = 'Александровна' AND birth_year = 2003 LIMIT 1), 4, 27, NULL, 88.05, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 6001, '2026-04-08', 'Дубровина Татьяна Александровна', 'Спортивная школа города Ялуторовска', 'Тюменская область', 6001, 13),
  (6061, 6015, (SELECT id FROM athletes WHERE last_name = 'Кошурникова' AND first_name = 'Анастасия' AND middle_name = 'Александровна' AND birth_year = 2003 LIMIT 1), 1, 63, NULL, 63.25, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 6001, '2026-04-08', 'Кошурникова Анастасия Александровна', 'МБУ ДО СШОР «Югория» им. А.А. Пилюгина', 'Ханты-Мансийский АО - Югра', 6001, 12),
  (6062, 6015, (SELECT id FROM athletes WHERE last_name = 'Походяева' AND first_name = 'Александра' AND middle_name = 'Андреевна' AND birth_year = 1990 LIMIT 1), 2, 12, NULL, 67.5, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 6001, '2026-04-08', 'Походяева Александра Андреевна', 'ООО «Газпром добыча Уренгой»', 'Ямало-Ненецкий автономный округ', 6001, 12),
  (6063, 6016, (SELECT id FROM athletes WHERE last_name = 'Тананин' AND first_name = 'Вячеслав' AND middle_name = 'Олегович' AND birth_year = 1997 LIMIT 1), 1, 35, NULL, 62.23, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 6001, '2026-04-08', 'Тананин Вячеслав Олегович', 'МБУ ДО СШ "Зенит"', 'Ямало-Ненецкий автономный округ', 6001, 3),
  (6064, 6016, (SELECT id FROM athletes WHERE last_name = 'Жалов' AND first_name = 'Ярослав' AND middle_name = 'Борисович' AND birth_year = 2007 LIMIT 1), 2, 35, NULL, 62.25, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 6001, '2026-04-08', 'Жалов Ярослав Борисович', 'МБУ ДО СШОР «Югория» им. А.А. Пилюгина', 'Ханты-Мансийский АО - Югра', 6001, 3),
  (6065, 6016, (SELECT id FROM athletes WHERE last_name = 'Павленко' AND first_name = 'Дмитрий' AND middle_name = 'Николаевич' AND birth_year = 2010 LIMIT 1), 3, 20, NULL, 62.55, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 6001, '2026-04-08', 'Павленко Дмитрий Николаевич', 'МБУ ДО "Варгашинская СШ"', 'Курганская область', 6001, 3),
  (6066, 6016, (SELECT id FROM athletes WHERE last_name = 'Середа' AND first_name = 'Матвей' AND middle_name = 'Сергеевич' AND birth_year = 2009 LIMIT 1), 4, 18, NULL, 61.5, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 6001, '2026-04-08', 'Середа Матвей Сергеевич', 'МАУ ДО ДЮСШ Юность', 'Ханты-Мансийский АО - Югра', 6001, 3),
  (6067, 6016, (SELECT id FROM athletes WHERE last_name = 'Ганеев' AND first_name = 'Константин' AND middle_name = 'Эдвардович' AND birth_year = 1973 LIMIT 1), 5, 16, NULL, 62.35, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 6001, '2026-04-08', 'Ганеев Константин Эдвардович', 'ВФГС ЯНАО', 'Ямало-Ненецкий автономный округ', 6001, 3),
  (6068, 6016, (SELECT id FROM athletes WHERE last_name = 'Волошин' AND first_name = 'Александр' AND middle_name = 'Анатольевич' AND birth_year = 1995 LIMIT 1), 6, 15, NULL, 63.0, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 6001, '2026-04-08', 'Волошин Александр Анатольевич', 'СШОР "Атлет"', 'Челябинская область', 6001, 3),
  (6069, 6017, (SELECT id FROM athletes WHERE last_name = 'Усольцев' AND first_name = 'Александр' AND middle_name = 'Николаевич' AND birth_year = 1992 LIMIT 1), 1, 67, NULL, 67.1, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 6001, '2026-04-08', 'Усольцев Александр Николаевич', 'КСК Факел', 'Ямало-Ненецкий автономный округ', 6001, 4),
  (6070, 6017, (SELECT id FROM athletes WHERE last_name = 'Сергеев' AND first_name = 'Алексей' AND middle_name = 'Вячеславович' AND birth_year = 2001 LIMIT 1), 2, 61, NULL, 67.75, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 6001, '2026-04-08', 'Сергеев Алексей Вячеславович', 'МАУ ДО "Спортивная школа №2" Сургутского р-на', 'Ханты-Мансийский АО - Югра', 6001, 4),
  (6071, 6017, (SELECT id FROM athletes WHERE last_name = 'Айбаев' AND first_name = 'Ильфат' AND middle_name = 'Наильевич' AND birth_year = 1989 LIMIT 1), 3, 24, NULL, 67.0, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 6001, '2026-04-08', 'Айбаев Ильфат Наильевич', 'МАУ ДО "СШ № 1" г.Тобольска', 'Тюменская область', 6001, 4),
  (6072, 6018, (SELECT id FROM athletes WHERE last_name = 'Рябков' AND first_name = 'Алексей' AND middle_name = 'Игоревич' AND birth_year = 1993 LIMIT 1), 1, 82, NULL, 72.95, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 6001, '2026-04-08', 'Рябков Алексей Игоревич', 'МБУ ДО СШОР «Югория» им. А.А. Пилюгина', 'Ханты-Мансийский АО - Югра', 6001, 5),
  (6073, 6018, (SELECT id FROM athletes WHERE last_name = 'Беляев' AND first_name = 'Иван' AND middle_name = 'Сергеевич' AND birth_year = 1992 LIMIT 1), 2, 82, NULL, 73.0, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 6001, '2026-04-08', 'Беляев Иван Сергеевич', 'МБУ ДО СШОР «Югория» им. А.А. Пилюгина', 'Ханты-Мансийский АО - Югра', 6001, 5),
  (6074, 6018, (SELECT id FROM athletes WHERE last_name = 'Яхнич' AND first_name = 'Ефим' AND middle_name = 'Владимирович' AND birth_year = 1989 LIMIT 1), 3, 62, NULL, 72.15, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 6001, '2026-04-08', 'Яхнич Ефим Владимирович', 'МБУ ДО "Лебяжьевская ДЮСШ"', 'Курганская область', 6001, 5),
  (6075, 6018, (SELECT id FROM athletes WHERE last_name = 'Семенов' AND first_name = 'Никита' AND middle_name = 'Андреевич' AND birth_year = 1993 LIMIT 1), 4, 60, NULL, 71.15, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 6001, '2026-04-08', 'Семенов Никита Андреевич', 'РООО ВФГС в Челябинской области', 'Челябинская область', 6001, 5),
  (6076, 6018, (SELECT id FROM athletes WHERE last_name = 'Драчев' AND first_name = 'Глеб' AND middle_name = 'Никитич' AND birth_year = 2011 LIMIT 1), 5, 38, NULL, 72.45, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 6001, '2026-04-08', 'Драчев Глеб Никитич', 'МАУ ДО ДЮЦ "Старт" города Тюмени', 'Тюменская область', 6001, 5),
  (6077, 6019, (SELECT id FROM athletes WHERE last_name = 'Сарсембаев' AND first_name = 'Ильяс' AND middle_name = 'Асхатович' AND birth_year = 1999 LIMIT 1), 1, 81, NULL, 77.3, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 6001, '2026-04-08', 'Сарсембаев Ильяс Асхатович', 'МБУ ДО СШ "Зенит"', 'Ямало-Ненецкий автономный округ', 6001, 6),
  (6078, 6019, (SELECT id FROM athletes WHERE last_name = 'Баландин' AND first_name = 'Андрей' AND middle_name = 'Александрович' AND birth_year = 1996 LIMIT 1), 2, 65, NULL, 77.8, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 6001, '2026-04-08', 'Баландин Андрей Александрович', 'МБУДО "Каргапольская ДЮСШ"', 'Курганская область', 6001, 6),
  (6079, 6019, (SELECT id FROM athletes WHERE last_name = 'Дубель' AND first_name = 'Алексей' AND middle_name = 'Викторович' AND birth_year = 1990 LIMIT 1), 3, 60, NULL, 77.6, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 6001, '2026-04-08', 'Дубель Алексей Викторович', 'МБУДО "Варгашинская СШ"', 'Курганская область', 6001, 6),
  (6080, 6019, (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Виталий' AND middle_name = 'Викторович' AND birth_year = 1978 LIMIT 1), 4, 53, NULL, 77.9, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 6001, '2026-04-08', 'Иванов Виталий Викторович', 'МБУ ДО СШОР «Югория» им. А.А. Пилюгина', 'Ханты-Мансийский АО - Югра', 6001, 6),
  (6081, 6019, (SELECT id FROM athletes WHERE last_name = 'Согоян' AND first_name = 'Артем' AND middle_name = 'Ражденович' AND birth_year = 1988 LIMIT 1), 5, 52, NULL, 77.9, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 6001, '2026-04-08', 'Согоян Артем Ражденович', 'МАУ «Районное управление спортивных сооружений»', 'Ханты-Мансийский АО - Югра', 6001, 6),
  (6082, 6019, (SELECT id FROM athletes WHERE last_name = 'Кобзарь' AND first_name = 'Кирилл' AND middle_name = 'Николаевич' AND birth_year = 2002 LIMIT 1), 6, 40, NULL, 74.15, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 6001, '2026-04-08', 'Кобзарь Кирилл Николаевич', 'ООО «Газпром добыча Уренгой»', 'Ямало-Ненецкий автономный округ', 6001, 6),
  (6083, 6019, (SELECT id FROM athletes WHERE last_name = 'Лукин' AND first_name = 'Дмитрий' AND middle_name = 'Алексеевич' AND birth_year = 2011 LIMIT 1), 7, 38, NULL, 78.0, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 6001, '2026-04-08', 'Лукин Дмитрий Алексеевич', 'МАУ ДО ДЮЦ "Старт" города Тюмени', 'Тюменская область', 6001, 6),
  (6084, 6019, (SELECT id FROM athletes WHERE last_name = 'Густомясов' AND first_name = 'Денис' AND middle_name = 'Алексеевич' AND birth_year = 1982 LIMIT 1), 8, 20, NULL, 76.45, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 6001, '2026-04-08', 'Густомясов Денис Алексеевич', 'Федоровский Спортивно оздоровительный центр', 'Ханты-Мансийский АО - Югра', 6001, 6),
  (6085, 6020, (SELECT id FROM athletes WHERE last_name = 'Самочернов' AND first_name = 'Иван' AND middle_name = 'Николаевич' AND birth_year = 1998 LIMIT 1), 1, 82, NULL, 84.9, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 6001, '2026-04-08', 'Самочернов Иван Николаевич', 'МБУДО "Каргапольская ДЮСШ"', 'Курганская область', 6001, 7),
  (6086, 6020, (SELECT id FROM athletes WHERE last_name = 'Селиверстов' AND first_name = 'Семён' AND middle_name = 'Васильевич' AND birth_year = 1989 LIMIT 1), 2, 79, NULL, 84.95, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 6001, '2026-04-08', 'Селиверстов Семён Васильевич', '"СШ Олимп" г.Челябинска', 'Челябинская область', 6001, 7),
  (6087, 6020, (SELECT id FROM athletes WHERE last_name = 'Рамазанов' AND first_name = 'Вадим' AND middle_name = 'Русланович' AND birth_year = 2007 LIMIT 1), 3, 59, NULL, 83.1, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 6001, '2026-04-08', 'Рамазанов Вадим Русланович', 'МБУ ДО СШ "Зенит"', 'Ямало-Ненецкий автономный округ', 6001, 7),
  (6088, 6020, (SELECT id FROM athletes WHERE last_name = 'Тимоненков' AND first_name = 'Станислав' AND middle_name = 'Олегович' AND birth_year = 2005 LIMIT 1), 4, 46, NULL, 81.6, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 6001, '2026-04-08', 'Тимоненков Станислав Олегович', 'МАУ ДО «Спортивная школа №2» Сургутского р-на', 'Ханты-Мансийский АО - Югра', 6001, 7),
  (6089, 6020, (SELECT id FROM athletes WHERE last_name = 'Густомясов' AND first_name = 'Георгий' AND middle_name = 'Денисович' AND birth_year = 2006 LIMIT 1), 5, 45, NULL, 82.7, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 6001, '2026-04-08', 'Густомясов Георгий Денисович', 'МАУ ДО «Спортивная школа №2» Сургутского р-на', 'Ханты-Мансийский АО - Югра', 6001, 7),
  (6090, 6020, (SELECT id FROM athletes WHERE last_name = 'Иксанов' AND first_name = 'Ярослав' AND middle_name = 'Вячеславович' AND birth_year = 2006 LIMIT 1), 6, 40, NULL, 85.0, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 6001, '2026-04-08', 'Иксанов Ярослав Вячеславович', 'МАУ ДО "Спортивная школа"', 'Ханты-Мансийский АО - Югра', 6001, 7),
  (6091, 6020, (SELECT id FROM athletes WHERE last_name = 'Гнилоузубов' AND first_name = 'Никита' AND middle_name = 'Вячеславович' AND birth_year = 2008 LIMIT 1), 7, 27, NULL, 82.1, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 6001, '2026-04-08', 'Гнилоузубов Никита Вячеславович', 'МАУ ДО «Спортивная школа №2» Сургутского р-на', 'Ханты-Мансийский АО - Югра', 6001, 7),
  (6092, 6020, (SELECT id FROM athletes WHERE last_name = 'Тэсида' AND first_name = 'Владимир' AND middle_name = 'Владимирович' AND birth_year = 2007 LIMIT 1), 8, 23, NULL, 83.35, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 6001, '2026-04-08', 'Тэсида Владимир Владимирович', 'МБУ ЦРФКИС', 'Ямало-Ненецкий автономный округ', 6001, 7),
  (6093, 6021, (SELECT id FROM athletes WHERE last_name = 'Денисов' AND first_name = 'Иван' AND middle_name = 'Николаевич' AND birth_year = 1982 LIMIT 1), 1, 36, NULL, 118.85, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 6001, '2026-04-08', 'Денисов Иван Николаевич', 'СШОР "Атлет"', 'Челябинская область', 6001, 9),
  (6094, 6021, (SELECT id FROM athletes WHERE last_name = 'Юдин' AND first_name = 'Дмитрий' AND middle_name = 'Петрович' AND birth_year = 1989 LIMIT 1), 2, 15, NULL, 119.45, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 6001, '2026-04-08', 'Юдин Дмитрий Петрович', 'МАУ ДО СШ "Геолог"', 'Ямало-Ненецкий автономный округ', 6001, 9),
  (6095, 6022, (SELECT id FROM athletes WHERE last_name = 'Николаев' AND first_name = 'Аркадий' AND middle_name = 'Анатольевич' AND birth_year = 2002 LIMIT 1), 1, 81, NULL, 90.4, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 6001, '2026-04-08', 'Николаев Аркадий Анатольевич', 'МБУ ДО СШОР «Югория» им. А.А. Пилюгина', 'Ханты-Мансийский АО - Югра', 6001, 8),
  (6096, 6022, (SELECT id FROM athletes WHERE last_name = 'Пупин' AND first_name = 'Роман' AND middle_name = 'Сергеевич' AND birth_year = 1998 LIMIT 1), 2, 51, NULL, 93.95, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 6001, '2026-04-08', 'Пупин Роман Сергеевич', 'МБУ ДО СШ "Зенит"', 'Ямало-Ненецкий автономный округ', 6001, 8),
  (6097, 6022, (SELECT id FROM athletes WHERE last_name = 'Дашкевич' AND first_name = 'Владимир' AND middle_name = 'Олегович' AND birth_year = 1984 LIMIT 1), 3, 49, NULL, 87.2, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 6001, '2026-04-08', 'Дашкевич Владимир Олегович', 'МАУ «Районное управление спортивных сооружений»', 'Ханты-Мансийский АО - Югра', 6001, 8),
  (6098, 6022, (SELECT id FROM athletes WHERE last_name = 'Ткачёв' AND first_name = 'Роман' AND middle_name = 'Антонович' AND birth_year = 2006 LIMIT 1), 4, 46, NULL, 87.15, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 6001, '2026-04-08', 'Ткачёв Роман Антонович', 'МАУ "ЦФОР-Ритм"', 'Тюменская область', 6001, 8),
  (6099, 6023, (SELECT id FROM athletes WHERE last_name = 'Хуснудинова' AND first_name = 'Мария' AND middle_name = 'Петровна' AND birth_year = 2004 LIMIT 1), 1, 130, NULL, 53.9, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 6001, '2026-04-08', 'Хуснудинова Мария Петровна', '"СШ Олимп" г.Челябинска', 'Челябинская область', 6001, 32),
  (6100, 6023, (SELECT id FROM athletes WHERE last_name = 'Гладышева' AND first_name = 'Дарья' AND middle_name = 'Алексеевна' AND birth_year = 2004 LIMIT 1), 2, 126, NULL, 55.86, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 6001, '2026-04-08', 'Гладышева Дарья Алексеевна', 'МБУДО "Куртамышская ДЮСШ"', 'Курганская область', 6001, 32),
  (6101, 6023, (SELECT id FROM athletes WHERE last_name = 'Белоус' AND first_name = 'Анна' AND middle_name = 'Сергеевна' AND birth_year = 2001 LIMIT 1), 3, 111, NULL, 56.88, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 6001, '2026-04-08', 'Белоус Анна Сергеевна', 'МБУ ДО СШОР «Югория» им. А.А. Пилюгина', 'Ханты-Мансийский АО - Югра', 6001, 32),
  (6102, 6023, (SELECT id FROM athletes WHERE last_name = 'Дементьева' AND first_name = 'Наталья' AND middle_name = 'Сергеевна' AND birth_year = 2010 LIMIT 1), 4, 102, NULL, 56.08, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 6001, '2026-04-08', 'Дементьева Наталья Сергеевна', 'СШОР "Старт"', 'Челябинская область', 6001, 32),
  (6103, 6023, (SELECT id FROM athletes WHERE last_name = 'Уржумцева' AND first_name = 'Светлана' AND middle_name = 'Алексеевна' AND birth_year = 1992 LIMIT 1), 5, 102, NULL, 57.25, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 6001, '2026-04-08', 'Уржумцева Светлана Алексеевна', 'СШОР "Атлет"', 'Челябинская область', 6001, 32),
  (6104, 6023, (SELECT id FROM athletes WHERE last_name = 'Аллоярова' AND first_name = 'Милана' AND middle_name = 'Борисовна' AND birth_year = 2002 LIMIT 1), 6, 101, NULL, 56.42, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 6001, '2026-04-08', 'Аллоярова Милана Борисовна', 'ТРО ООО «ВФГС»', 'Тюменская область', 6001, 32),
  (6105, 6023, (SELECT id FROM athletes WHERE last_name = 'Спасенникова' AND first_name = 'Валерия' AND middle_name = 'Витальевна' AND birth_year = 2008 LIMIT 1), 7, 94, NULL, 58.0, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 6001, '2026-04-08', 'Спасенникова Валерия Витальевна', 'МАУ "ЦСФР" города Ялуторовска', 'Тюменская область', 6001, 32),
  (6106, 6023, (SELECT id FROM athletes WHERE last_name = 'Седова' AND first_name = 'Марина' AND middle_name = 'Сергеевна' AND birth_year = 2009 LIMIT 1), 8, 81, NULL, 55.18, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 6001, '2026-04-08', 'Седова Марина Сергеевна', 'СШОР "Старт"', 'Челябинская область', 6001, 32),
  (6107, 6023, (SELECT id FROM athletes WHERE last_name = 'Трофимова' AND first_name = 'Александра' AND middle_name = 'Александровна' AND birth_year = 2008 LIMIT 1), 9, 71, NULL, 53.46, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 6001, '2026-04-08', 'Трофимова Александра Александровна', 'МАУ ДО СШ "Геолог"', 'Ямало-Ненецкий автономный округ', 6001, 32),
  (6108, 6023, (SELECT id FROM athletes WHERE last_name = 'Огий' AND first_name = 'Анна' AND middle_name IS NULL AND birth_year = 2006 LIMIT 1), 10, 66, NULL, 56.66, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 6001, '2026-04-08', 'Огий Анна', 'БУ СУРГПУ, Спортивный клуб.', 'Ханты-Мансийский АО - Югра', 6001, 32),
  (6109, 6023, (SELECT id FROM athletes WHERE last_name = 'Плешкова' AND first_name = 'Анастасия' AND middle_name = 'Александровна' AND birth_year = 2005 LIMIT 1), 11, 55, NULL, 57.1, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 6001, '2026-04-08', 'Плешкова Анастасия Александровна', 'СШОР "Атлет"', 'Челябинская область', 6001, 32),
  (6110, 6023, (SELECT id FROM athletes WHERE last_name = 'Пасичная' AND first_name = 'Ольга' AND middle_name = 'Анатольевна' AND birth_year = 1981 LIMIT 1), 12, 48, NULL, 55.58, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 6001, '2026-04-08', 'Пасичная Ольга Анатольевна', 'МБУ ДО СШ "Зенит"', 'Ямало-Ненецкий автономный округ', 6001, 32),
  (6111, 6023, (SELECT id FROM athletes WHERE last_name = 'Камышанская' AND first_name = 'Евгения' AND middle_name = 'Дмитриевна' AND birth_year = 2009 LIMIT 1), 13, 39, NULL, 51.7, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 6001, '2026-04-08', 'Камышанская Евгения Дмитриевна', 'МАУ ДО "Спортивная школа"', 'Ханты-Мансийский АО - Югра', 6001, 32),
  (6112, 6023, (SELECT id FROM athletes WHERE last_name = 'Вахрушева' AND first_name = 'Карина' AND middle_name = 'Владимировна' AND birth_year = 2010 LIMIT 1), 14, 25, NULL, 51.4, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 6001, '2026-04-08', 'Вахрушева Карина Владимировна', 'МАУ ДО "Спортивная школа"', 'Ханты-Мансийский АО - Югра', 6001, 32),
  (6113, 6024, (SELECT id FROM athletes WHERE last_name = 'Степанова' AND first_name = 'Оксана' AND middle_name = 'Анатольевна' AND birth_year = 1990 LIMIT 1), 1, 203, NULL, 62.95, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 6001, '2026-04-08', 'Степанова Оксана Анатольевна', 'СШОР "Атлет"', 'Челябинская область', 6001, 33),
  (6114, 6024, (SELECT id FROM athletes WHERE last_name = 'Дедюхина' AND first_name = 'Ксения' AND middle_name = 'Игоревна' AND birth_year = 1990 LIMIT 1), 2, 200, NULL, 62.55, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 6001, '2026-04-08', 'Дедюхина Ксения Игоревна', 'МБУ ДО СШОР «Югория» им. А.А. Пилюгина', 'Ханты-Мансийский АО - Югра', 6001, 33),
  (6115, 6024, (SELECT id FROM athletes WHERE last_name = 'Ташланова' AND first_name = 'Ульяна' AND middle_name = 'Павловна' AND birth_year = 2001 LIMIT 1), 3, 100, NULL, 61.65, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 6001, '2026-04-08', 'Ташланова Ульяна Павловна', 'РО ООО ВФГС в Челябинской области', 'Челябинская область', 6001, 33),
  (6116, 6024, (SELECT id FROM athletes WHERE last_name = 'Федоресва' AND first_name = 'Диана' AND middle_name = 'Всеволодовна' AND birth_year = 1993 LIMIT 1), 4, 89, NULL, 59.5, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 6001, '2026-04-08', 'Федоресва Диана Всеволодовна', 'СК "Олимп"', 'Челябинская область', 6001, 33),
  (6117, 6024, (SELECT id FROM athletes WHERE last_name = 'Бахтина' AND first_name = 'Виктория' AND middle_name = 'Викторовна' AND birth_year = 1999 LIMIT 1), 5, 58, NULL, 61.4, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 6001, '2026-04-08', 'Бахтина Виктория Викторовна', 'ВФГС ЯНАО', 'Ямало-Ненецкий автономный округ', 6001, 33),
  (6118, 6024, (SELECT id FROM athletes WHERE last_name = 'Белоглазова' AND first_name = 'Елизавета' AND middle_name = 'Александровна' AND birth_year = 2002 LIMIT 1), 6, 47, NULL, 62.45, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 6001, '2026-04-08', 'Белоглазова Елизавета Александровна', 'МБУДО "Каргапольская ДЮСШ"', 'Курганская область', 6001, 33),
  (6119, 6024, (SELECT id FROM athletes WHERE last_name = 'Габбасова' AND first_name = 'Камила' AND middle_name = 'Руслановна' AND birth_year = 2003 LIMIT 1), 7, 28, NULL, 61.35, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 6001, '2026-04-08', 'Габбасова Камила Руслановна', 'МБУ ДО СШ "Зенит"', 'Ямало-Ненецкий автономный округ', 6001, 33),
  (6120, 6025, (SELECT id FROM athletes WHERE last_name = 'Полякова' AND first_name = 'Полина' AND middle_name = 'Сергеевна' AND birth_year = 1999 LIMIT 1), 1, 201, NULL, 92.7, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 6001, '2026-04-08', 'Полякова Полина Сергеевна', 'ТРО ООО «ВФГС»', 'Тюменская область', 6001, 35),
  (6121, 6025, (SELECT id FROM athletes WHERE last_name = 'Островская' AND first_name = 'Надежда' AND middle_name = 'Аркадьевна' AND birth_year = 1985 LIMIT 1), 2, 188, NULL, 93.3, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 6001, '2026-04-08', 'Островская Надежда Аркадьевна', 'МБУ ДО СШОР «Югория» им. А.А. Пилюгина', 'Ханты-Мансийский АО - Югра', 6001, 35),
  (6122, 6025, (SELECT id FROM athletes WHERE last_name = 'Захарова' AND first_name = 'Татьяна' AND middle_name = 'Вадимовна' AND birth_year = 2006 LIMIT 1), 3, 76, NULL, 79.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 6001, '2026-04-08', 'Захарова Татьяна Вадимовна', 'ТРО ООО «ВФГС»', 'Тюменская область', 6001, 35),
  (6123, 6025, (SELECT id FROM athletes WHERE last_name = 'Таева' AND first_name = 'Нагима' AND middle_name = 'Сериковна' AND birth_year = 1991 LIMIT 1), 4, 73, NULL, 77.95, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 6001, '2026-04-08', 'Таева Нагима Сериковна', 'ООО «Газпром добыча Уренгой»', 'Ямало-Ненецкий автономный округ', 6001, 35),
  (6124, 6025, (SELECT id FROM athletes WHERE last_name = 'Шарыгина' AND first_name = 'Юлия' AND middle_name = 'Дмитриевна' AND birth_year = 2003 LIMIT 1), 5, 72, NULL, 75.75, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 6001, '2026-04-08', 'Шарыгина Юлия Дмитриевна', 'ТРО ООО «ВФГС»', 'Тюменская область', 6001, 35),
  (6125, 6025, (SELECT id FROM athletes WHERE last_name = 'Белошапкина' AND first_name = 'Татьяна' AND middle_name = 'Владимировна' AND birth_year = 1979 LIMIT 1), 6, 51, NULL, 95.45, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 6001, '2026-04-08', 'Белошапкина Татьяна Владимировна', 'МАУ ДО СШ "Геолог"', 'Ямало-Ненецкий автономный округ', 6001, 35),
  (6126, 6025, (SELECT id FROM athletes WHERE last_name = 'Умарова' AND first_name = 'Олеся' AND middle_name = 'Васильевна' AND birth_year = 1983 LIMIT 1), 7, 32, NULL, 111.25, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 6001, '2026-04-08', 'Умарова Олеся Васильевна', 'ООО «Газпром добыча Уренгой»', 'Ямало-Ненецкий автономный округ', 6001, 35),
  (6127, 6026, (SELECT id FROM athletes WHERE last_name = 'Потапова' AND first_name = 'Анастасия' AND middle_name = 'Михайловна' AND birth_year = 2004 LIMIT 1), 1, 150, NULL, 66.45, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 6001, '2026-04-08', 'Потапова Анастасия Михайловна', 'МАУ ДО ДЮЦ "Старт" города Тюмени', 'Тюменская область', 6001, 34),
  (6128, 6026, (SELECT id FROM athletes WHERE last_name = 'Походяева' AND first_name = 'Александра' AND middle_name = 'Андреевна' AND birth_year = 1990 LIMIT 1), 2, 120, NULL, 67.25, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 6001, '2026-04-08', 'Походяева Александра Андреевна', 'ООО «Газпром добыча Уренгой»', 'Ямало-Ненецкий автономный округ', 6001, 34),
  (6129, 6026, (SELECT id FROM athletes WHERE last_name = 'Кошурникова' AND first_name = 'Анастасия' AND middle_name = 'Александровна' AND birth_year = 2003 LIMIT 1), 3, 111, NULL, 65.35, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 6001, '2026-04-08', 'Кошурникова Анастасия Александровна', 'МБУ ДО СШОР «Югория» им. А.А. Пилюгина', 'Ханты-Мансийский АО - Югра', 6001, 34),
  (6130, 6026, (SELECT id FROM athletes WHERE last_name = 'Подпрятова' AND first_name = 'Марина' AND middle_name = 'Сергеевна' AND birth_year = 1992 LIMIT 1), 4, 83, NULL, 67.45, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 6001, '2026-04-08', 'Подпрятова Марина Сергеевна', 'ВФГС ЯНАО', 'Ямало-Ненецкий автономный округ', 6001, 34),
  (6131, 6026, (SELECT id FROM athletes WHERE last_name = 'Миронова' AND first_name = 'Василиса' AND middle_name = 'Александровна' AND birth_year = 2004 LIMIT 1), 5, 71, NULL, 66.95, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 6001, '2026-04-08', 'Миронова Василиса Александровна', 'ТРО ООО ВФГС', 'Тюменская область', 6001, 34),
  (6132, 6026, (SELECT id FROM athletes WHERE last_name = 'Лебедева' AND first_name = 'Ирина' AND middle_name = 'Михайловна' AND birth_year = 1968 LIMIT 1), 6, 65, NULL, 63.4, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 6001, '2026-04-08', 'Лебедева Ирина Михайловна', 'РО ООО ВФГС в КО', 'Курганская область', 6001, 34),
  (6133, 6027, (SELECT id FROM athletes WHERE last_name = 'Ховалко' AND first_name = 'Василий' AND middle_name = 'Михайлович' AND birth_year = 1993 LIMIT 1), 1, 152, NULL, 62.65, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Ховалко Василий Михайлович', 'МАУ ДО СШ "Геолог"', 'Ямало-Ненецкий автономный округ', 6001, 25),
  (6134, 6027, (SELECT id FROM athletes WHERE last_name = 'Манаков' AND first_name = 'Трофим' AND middle_name = 'Анатольевич' AND birth_year = 2000 LIMIT 1), 2, 104, NULL, 62.9, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Манаков Трофим Анатольевич', 'МАУ ДО «Спортивная школа «Югория» г. Нягань', 'Ханты-Мансийский АО - Югра', 6001, 25),
  (6135, 6027, (SELECT id FROM athletes WHERE last_name = 'Тананин' AND first_name = 'Вячеслав' AND middle_name = 'Олегович' AND birth_year = 1997 LIMIT 1), 3, 99, NULL, 61.4, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Тананин Вячеслав Олегович', 'МБУ ДО СШ "Зенит"', 'Ямало-Ненецкий автономный округ', 6001, 25),
  (6136, 6027, (SELECT id FROM athletes WHERE last_name = 'Середа' AND first_name = 'Матвей' AND middle_name = 'Сергеевич' AND birth_year = 2009 LIMIT 1), 4, 86, NULL, 61.5, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Середа Матвей Сергеевич', 'МАУ ДО ДЮСШ Юность', 'Ханты-Мансийский АО - Югра', 6001, 25),
  (6137, 6027, (SELECT id FROM athletes WHERE last_name = 'Волошин' AND first_name = 'Александр' AND middle_name = 'Анатольевич' AND birth_year = 1995 LIMIT 1), 5, 78, NULL, 63.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Волошин Александр Анатольевич', 'СШОР "Атлет"', 'Челябинская область', 6001, 25),
  (6138, 6027, (SELECT id FROM athletes WHERE last_name = 'Жалов' AND first_name = 'Ярослав' AND middle_name = 'Борисович' AND birth_year = 2007 LIMIT 1), 6, 69, NULL, 62.45, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Жалов Ярослав Борисович', 'МБУ ДО СШОР «Югория» им. А.А. Пилюгина', 'Ханты-Мансийский АО - Югра', 6001, 25),
  (6139, 6027, (SELECT id FROM athletes WHERE last_name = 'Павленко' AND first_name = 'Дмитрий' AND middle_name = 'Николаевич' AND birth_year = 2010 LIMIT 1), 7, 57, NULL, 62.8, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Павленко Дмитрий Николаевич', 'МБУ ДО "Варгашинская СШ"', 'Курганская область', 6001, 25),
  (6140, 6027, (SELECT id FROM athletes WHERE last_name = 'Ганеев' AND first_name = 'Константин' AND middle_name = 'Эдвардович' AND birth_year = 1973 LIMIT 1), 8, 55, NULL, 62.35, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Ганеев Константин Эдвардович', 'ВФГС ЯНАО', 'Ямало-Ненецкий автономный округ', 6001, 25),
  (6141, 6028, (SELECT id FROM athletes WHERE last_name = 'Хвостов' AND first_name = 'Владислав' AND middle_name = 'Денисович' AND birth_year = 2006 LIMIT 1), 1, 163, NULL, 66.2, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Хвостов Владислав Денисович', 'Федерация гиревого спорта СО', 'Свердловская область', 6001, 26),
  (6142, 6028, (SELECT id FROM athletes WHERE last_name = 'Усольцев' AND first_name = 'Александр' AND middle_name = 'Николаевич' AND birth_year = 1992 LIMIT 1), 2, 158, NULL, 67.65, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Усольцев Александр Николаевич', 'КСК Факел', 'Ямало-Ненецкий автономный округ', 6001, 26),
  (6143, 6028, (SELECT id FROM athletes WHERE last_name = 'Потапов' AND first_name = 'Данил' AND middle_name = 'Алексеевич' AND birth_year = 2002 LIMIT 1), 3, 140, NULL, 67.7, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Потапов Данил Алексеевич', 'МБУ ДО "Лебяжьевская ДЮСШ"', 'Курганская область', 6001, 26),
  (6144, 6028, (SELECT id FROM athletes WHERE last_name = 'Бабичев' AND first_name = 'Иван' AND middle_name = 'Александрович' AND birth_year = 1996 LIMIT 1), 4, 134, NULL, 67.35, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Бабичев Иван Александрович', 'МАУ ДО СШ "Геолог"', 'Ямало-Ненецкий автономный округ', 6001, 26),
  (6145, 6028, (SELECT id FROM athletes WHERE last_name = 'Пстелин' AND first_name = 'Александр' AND middle_name = 'Владимирович' AND birth_year = 1987 LIMIT 1), 5, 130, NULL, 67.35, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Пстелин Александр Владимирович', 'МАУ ДО «Абалакский центр спорта и творчества»', 'Тюменская область', 6001, 26),
  (6146, 6028, (SELECT id FROM athletes WHERE last_name = 'Ноздрин' AND first_name = 'Егор' AND middle_name = 'Андреевич' AND birth_year = 2010 LIMIT 1), 6, 99, NULL, 67.7, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Ноздрин Егор Андреевич', 'МБУ ДО "Лебяжьевская ДЮСШ"', 'Курганская область', 6001, 26),
  (6147, 6028, (SELECT id FROM athletes WHERE last_name = 'Тухватуллин' AND first_name = 'Ринат' AND middle_name = 'Самигуллович' AND birth_year = 1994 LIMIT 1), 7, 96, NULL, 67.3, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Тухватуллин Ринат Самигуллович', 'ООО «Газпром добыча Уренгой»', 'Ямало-Ненецкий автономный округ', 6001, 26),
  (6148, 6028, (SELECT id FROM athletes WHERE last_name = 'Солодченко' AND first_name = 'Владимир' AND middle_name = 'Иванович' AND birth_year = 1984 LIMIT 1), 8, 94, NULL, 65.25, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Солодченко Владимир Иванович', 'ВФГС ЯНАО', 'Ямало-Ненецкий автономный округ', 6001, 26),
  (6149, 6028, (SELECT id FROM athletes WHERE last_name = 'Сафонов' AND first_name = 'Алексей' AND middle_name = 'Андреевич' AND birth_year = 1990 LIMIT 1), 9, 85, NULL, 67.75, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Сафонов Алексей Андреевич', '', 'Ханты-Мансийский АО - Югра', 6001, 26),
  (6150, 6028, (SELECT id FROM athletes WHERE last_name = 'Муртазин' AND first_name = 'Василий' AND middle_name = 'Васильевич' AND birth_year = 1971 LIMIT 1), 10, 72, NULL, 68.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Муртазин Василий Васильевич', 'ВФГС ЯНАО', 'Ямало-Ненецкий автономный округ', 6001, 26),
  (6151, 6029, (SELECT id FROM athletes WHERE last_name = 'Суслов' AND first_name = 'Александр' AND middle_name = 'Владимирович' AND birth_year = 1986 LIMIT 1), 1, 164, NULL, 72.45, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Суслов Александр Владимирович', 'МБУ ДО "Каргапольская ДЮСШ"', 'Курганская область', 6001, 27),
  (6152, 6029, (SELECT id FROM athletes WHERE last_name = 'Яхнич' AND first_name = 'Ефим' AND middle_name = 'Владимирович' AND birth_year = 1989 LIMIT 1), 2, 149, NULL, 71.85, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Яхнич Ефим Владимирович', 'МБУ ДО "Лебяжьевская ДЮСШ"', 'Курганская область', 6001, 27),
  (6153, 6029, (SELECT id FROM athletes WHERE last_name = 'Стрекаловских' AND first_name = 'Николай' AND middle_name = 'Сергеевич' AND birth_year = 1993 LIMIT 1), 3, 146, NULL, 72.9, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Стрекаловских Николай Сергеевич', 'МБУ ДО "Каргапольская ДЮСШ"', 'Курганская область', 6001, 27),
  (6154, 6029, (SELECT id FROM athletes WHERE last_name = 'Потапов' AND first_name = 'Владислав' AND middle_name = 'Владимирович' AND birth_year = 1978 LIMIT 1), 4, 143, NULL, 72.4, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Потапов Владислав Владимирович', 'ООО "ТТЮ"', 'Ямало-Ненецкий автономный округ', 6001, 27),
  (6155, 6029, (SELECT id FROM athletes WHERE last_name = 'Аксентьев' AND first_name = 'Данил' AND middle_name = 'Андреевич' AND birth_year = 2003 LIMIT 1), 5, 140, NULL, 73.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Аксентьев Данил Андреевич', 'СШОР "Атлет"', 'Челябинская область', 6001, 27),
  (6156, 6029, (SELECT id FROM athletes WHERE last_name = 'Полторыгий' AND first_name = 'Иван' AND middle_name = 'Юрьевич' AND birth_year = 2003 LIMIT 1), 6, 128, NULL, 72.9, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Полторыгий Иван Юрьевич', 'СШОР "Атлет"', 'Челябинская область', 6001, 27),
  (6157, 6029, (SELECT id FROM athletes WHERE last_name = 'Ашенов' AND first_name = 'Тимерзан' AND middle_name = 'Каирбулатович' AND birth_year = 1994 LIMIT 1), 7, 120, NULL, 72.7, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Ашенов Тимерзан Каирбулатович', 'ВФГС ЯНАО', 'Ямало-Ненецкий автономный округ', 6001, 27),
  (6158, 6029, (SELECT id FROM athletes WHERE last_name = 'Леонов' AND first_name = 'Дмитрий' AND middle_name = 'Алексеевич' AND birth_year = 2003 LIMIT 1), 8, 88, NULL, 72.05, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Леонов Дмитрий Алексеевич', 'МАУ ДО ДЮСШ "Старт" города Тюмени', 'Тюменская область', 6001, 27),
  (6159, 6029, (SELECT id FROM athletes WHERE last_name = 'Белесов' AND first_name = 'Иван' AND middle_name = 'Сергеевич' AND birth_year = 1992 LIMIT 1), 9, 88, NULL, 72.8, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Белесов Иван Сергеевич', 'МБУ ДО СШОР «Югория» им. А.А. Пилюгина', 'Ханты-Мансийский АО - Югра', 6001, 27),
  (6160, 6029, (SELECT id FROM athletes WHERE last_name = 'Драчев' AND first_name = 'Глеб' AND middle_name = 'Никитич' AND birth_year = 2011 LIMIT 1), 10, 80, NULL, 72.6, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Драчев Глеб Никитич', 'МАУ ДО ДЮСШ "Старт" города Тюмени', 'Тюменская область', 6001, 27),
  (6161, 6029, (SELECT id FROM athletes WHERE last_name = 'Хуснудинов' AND first_name = 'Арслан' AND middle_name = 'Закеевич' AND birth_year = 1985 LIMIT 1), 11, 50, NULL, 69.7, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Хуснудинов Арслан Закеевич', 'СШОР "Старт"', 'Челябинская область', 6001, 27),
  (6162, 6030, (SELECT id FROM athletes WHERE last_name = 'Бобров' AND first_name = 'Владимир' AND middle_name = 'Сергеевич' AND birth_year = 1989 LIMIT 1), 1, 185, NULL, 77.35, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Бобров Владимир Сергеевич', 'ВС', 'Тюменская область', 6001, 28),
  (6163, 6030, (SELECT id FROM athletes WHERE last_name = 'Дубель' AND first_name = 'Алексей' AND middle_name = 'Викторович' AND birth_year = 1990 LIMIT 1), 2, 169, NULL, 77.9, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Дубель Алексей Викторович', 'МБУДО "Варгашинская СШ"', 'Курганская область', 6001, 28),
  (6164, 6030, (SELECT id FROM athletes WHERE last_name = 'Семёнов' AND first_name = 'Андрей' AND middle_name = 'Владимирович' AND birth_year = 1991 LIMIT 1), 3, 166, NULL, 77.45, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Семёнов Андрей Владимирович', 'ООО «Газпром добыча Уренгой»', 'Ямало-Ненецкий автономный округ', 6001, 28),
  (6165, 6030, (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Виталий' AND middle_name = 'Викторович' AND birth_year = 1978 LIMIT 1), 4, 165, NULL, 77.95, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Иванов Виталий Викторович', 'МБУ ДО СШОР «Югория» им. А.А. Пилюгина', 'Ханты-Мансийский АО - Югра', 6001, 28),
  (6166, 6030, (SELECT id FROM athletes WHERE last_name = 'Степанов' AND first_name = 'Сергей' AND middle_name = 'Владимирович' AND birth_year = 1993 LIMIT 1), 5, 163, NULL, 77.4, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Степанов Сергей Владимирович', 'СШОР "Атлет"', 'Челябинская область', 6001, 28),
  (6167, 6030, (SELECT id FROM athletes WHERE last_name = 'Токарев' AND first_name = 'Тимофей' AND middle_name = 'Дмитриевич' AND birth_year = 2003 LIMIT 1), 6, 136, NULL, 77.9, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Токарев Тимофей Дмитриевич', 'РО ООО ВФГС в Челябинской области', 'Челябинская область', 6001, 28),
  (6168, 6030, (SELECT id FROM athletes WHERE last_name = 'Лукин' AND first_name = 'Дмитрий' AND middle_name = 'Алексеевич' AND birth_year = 2011 LIMIT 1), 7, 130, NULL, 77.9, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Лукин Дмитрий Алексеевич', 'МАУ ДО ДЮЦ "Старт" города Тюмени', 'Тюменская область', 6001, 28),
  (6169, 6030, (SELECT id FROM athletes WHERE last_name = 'Москвичев' AND first_name = 'Максим' AND middle_name = 'Вячеславович' AND birth_year = 1991 LIMIT 1), 8, 127, NULL, 74.85, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Москвичев Максим Вячеславович', 'ФГУП "ПСЗ" г. ТРЕХГОРНЫЙ', 'Челябинская область', 6001, 28),
  (6170, 6030, (SELECT id FROM athletes WHERE last_name = 'Горбань' AND first_name = 'Кирилл' AND middle_name IS NULL AND birth_year = 2007 LIMIT 1), 9, 120, NULL, 77.15, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Горбань Кирилл', 'БУ СУРГПУ, Спортивный клуб.', 'Ханты-Мансийский АО - Югра', 6001, 28),
  (6171, 6030, (SELECT id FROM athletes WHERE last_name = 'Гамов' AND first_name = 'Андрей' AND middle_name = 'Сергеевич' AND birth_year = 1988 LIMIT 1), 10, 101, NULL, 76.9, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Гамов Андрей Сергеевич', 'МБУ ДО СШ "Зенит"', 'Ямало-Ненецкий автономный округ', 6001, 28),
  (6172, 6030, (SELECT id FROM athletes WHERE last_name = 'Густомясов' AND first_name = 'Денис' AND middle_name = 'Алексеевич' AND birth_year = 1982 LIMIT 1), 11, 89, NULL, 76.2, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Густомясов Денис Алексеевич', 'Федоровский Спортивно оздоровительный центр', 'Ханты-Мансийский АО - Югра', 6001, 28),
  (6173, 6030, (SELECT id FROM athletes WHERE last_name = 'Согоян' AND first_name = 'Артем' AND middle_name = 'Ражденович' AND birth_year = 1988 LIMIT 1), 12, 84, NULL, 78.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Согоян Артем Ражденович', 'МАУ «Районное управление спортивных сооружений»', 'Ханты-Мансийский АО - Югра', 6001, 28),
  (6174, 6030, (SELECT id FROM athletes WHERE last_name = 'Плетнёв' AND first_name = 'Виталий' AND middle_name = 'Владимирович' AND birth_year = 1983 LIMIT 1), 13, 62, NULL, 76.3, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Плетнёв Виталий Владимирович', 'КСК Факел', 'Ямало-Ненецкий автономный округ', 6001, 28),
  (6175, 6031, (SELECT id FROM athletes WHERE last_name = 'Плотников' AND first_name = 'Вячеслав' AND middle_name = 'Евгеньевич' AND birth_year = 1998 LIMIT 1), 1, 216, NULL, 84.7, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Плотников Вячеслав Евгеньевич', 'РО ООО ВФГС в Челябинской области', 'Челябинская область', 6001, 29),
  (6176, 6031, (SELECT id FROM athletes WHERE last_name = 'Бондарев' AND first_name = 'Дмитрий' AND middle_name = 'Александрович' AND birth_year = 1986 LIMIT 1), 2, 164, NULL, 82.45, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Бондарев Дмитрий Александрович', '-', 'Ханты-Мансийский АО - Югра', 6001, 29),
  (6177, 6031, (SELECT id FROM athletes WHERE last_name = 'Шляхтин' AND first_name = 'Александр' AND middle_name = 'Сергеевич' AND birth_year = 1980 LIMIT 1), 3, 146, NULL, 83.5, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Шляхтин Александр Сергеевич', 'КСК Факел Газпром добыча Ноябрьск', 'Ямало-Ненецкий автономный округ', 6001, 29),
  (6178, 6031, (SELECT id FROM athletes WHERE last_name = 'Густомясов' AND first_name = 'Георгий' AND middle_name = 'Денисович' AND birth_year = 2006 LIMIT 1), 4, 111, NULL, 83.7, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Густомясов Георгий Денисович', 'МАУ ДО «Спортивная школа №2» Сургутского р-на', 'Ханты-Мансийский АО - Югра', 6001, 29),
  (6179, 6031, (SELECT id FROM athletes WHERE last_name = 'Солодов' AND first_name = 'Дмитрий' AND middle_name = 'Юрьевич' AND birth_year = 1995 LIMIT 1), 5, 100, NULL, 82.1, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Солодов Дмитрий Юрьевич', 'МБУ ДО СШ "Зенит"', 'Ямало-Ненецкий автономный округ', 6001, 29),
  (6180, 6031, (SELECT id FROM athletes WHERE last_name = 'Кудряров' AND first_name = 'Роман' AND middle_name = 'Альбертович' AND birth_year = 2006 LIMIT 1), 6, 97, NULL, 84.15, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Кудряров Роман Альбертович', 'СШОР "Старт"', 'Челябинская область', 6001, 29),
  (6181, 6031, (SELECT id FROM athletes WHERE last_name = 'Тимоненков' AND first_name = 'Станислав' AND middle_name = 'Олегович' AND birth_year = 2005 LIMIT 1), 7, 92, NULL, 81.5, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Тимоненков Станислав Олегович', 'МАУ ДО «Спортивная школа №2» Сургутского р-на', 'Ханты-Мансийский АО - Югра', 6001, 29),
  (6182, 6031, (SELECT id FROM athletes WHERE last_name = 'Иксанов' AND first_name = 'Ярослав' AND middle_name = 'Вячеславович' AND birth_year = 2006 LIMIT 1), 8, 73, NULL, 85.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Иксанов Ярослав Вячеславович', 'МАУ ДО "Спортивная школа"', 'Ханты-Мансийский АО - Югра', 6001, 29),
  (6183, 6032, (SELECT id FROM athletes WHERE last_name = 'Денисов' AND first_name = 'Иван' AND middle_name = 'Николаевич' AND birth_year = 1982 LIMIT 1), 1, 194, NULL, 118.85, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Денисов Иван Николаевич', 'СШОР "Атлет"', 'Челябинская область', 6001, 31),
  (6184, 6032, (SELECT id FROM athletes WHERE last_name = 'Сукманов' AND first_name = 'Александр' AND middle_name = 'Александрович' AND birth_year = 1985 LIMIT 1), 2, 189, NULL, 125.4, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Сукманов Александр Александрович', 'РОО "ВФГС Курганской области"', 'Курганская область', 6001, 31),
  (6185, 6032, (SELECT id FROM athletes WHERE last_name = 'Куликов' AND first_name = 'Владислав' AND middle_name = 'Александрович' AND birth_year = 2006 LIMIT 1), 3, 172, NULL, 123.59, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Куликов Владислав Александрович', '"СШ Олимп" г.Челябинска', 'Челябинская область', 6001, 31),
  (6186, 6032, (SELECT id FROM athletes WHERE last_name = 'Григорьев' AND first_name = 'Андрей' AND middle_name = 'Анатольевич' AND birth_year = 1987 LIMIT 1), 4, 149, NULL, 103.95, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Григорьев Андрей Анатольевич', 'Федерация гиревого спорта СО', 'Свердловская область', 6001, 31),
  (6187, 6032, (SELECT id FROM athletes WHERE last_name = 'Мингазединов' AND first_name = 'Вячеслав' AND middle_name = 'Равильевич' AND birth_year = 1984 LIMIT 1), 5, 120, NULL, 114.15, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Мингазединов Вячеслав Равильевич', 'КСК Факел', 'Ямало-Ненецкий автономный округ', 6001, 31),
  (6188, 6032, (SELECT id FROM athletes WHERE last_name = 'Панаитов' AND first_name = 'Иосиф' AND middle_name = 'Михайлович' AND birth_year = 1981 LIMIT 1), 6, 115, NULL, 102.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Панаитов Иосиф Михайлович', 'МАУ СОК "Звездный"', 'Ханты-Мансийский АО - Югра', 6001, 31),
  (6189, 6032, (SELECT id FROM athletes WHERE last_name = 'Цыбулевский' AND first_name = 'Сергей' AND middle_name = 'Алексеевич' AND birth_year = 2007 LIMIT 1), 7, 100, NULL, 99.25, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Цыбулевский Сергей Алексеевич', 'МАУ ДО «Спортивная школа №2» Сургутского р-на', 'Ханты-Мансийский АО - Югра', 6001, 31),
  (6190, 6032, (SELECT id FROM athletes WHERE last_name = 'Московских' AND first_name = 'Алексей' AND middle_name = 'Сергеевич' AND birth_year = 1994 LIMIT 1), 8, 43, NULL, 100.3, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Московских Алексей Сергеевич', 'ООО «Газпром добыча Уренгой»', 'Ямало-Ненецкий автономный округ', 6001, 31),
  (6191, 6033, (SELECT id FROM athletes WHERE last_name = 'Николаев' AND first_name = 'Аркадий' AND middle_name = 'Анатольевич' AND birth_year = 2002 LIMIT 1), 1, 163, NULL, 91.55, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Николаев Аркадий Анатольевич', 'МБУ ДО СШОР «Югория» им. А.А. Пилюгина', 'Ханты-Мансийский АО - Югра', 6001, 30),
  (6192, 6033, (SELECT id FROM athletes WHERE last_name = 'Битков' AND first_name = 'Антон' AND middle_name = 'Николаевич' AND birth_year = 1994 LIMIT 1), 2, 148, NULL, 86.3, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Битков Антон Николаевич', 'МБУДО "Куртамышская ДЮСШ"', 'Курганская область', 6001, 30),
  (6193, 6033, (SELECT id FROM athletes WHERE last_name = 'Емельянов' AND first_name = 'Николай' AND middle_name = 'Анатольевич' AND birth_year = 1983 LIMIT 1), 3, 145, NULL, 88.95, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Емельянов Николай Анатольевич', 'КСК Факел', 'Ямало-Ненецкий автономный округ', 6001, 30),
  (6194, 6033, (SELECT id FROM athletes WHERE last_name = 'Минибаев' AND first_name = 'Альзаф' AND middle_name = 'Альбертович' AND birth_year = 1987 LIMIT 1), 4, 145, NULL, 89.8, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Минибаев Альзаф Альбертович', 'ООО "Газпром переработка"', 'Ямало-Ненецкий автономный округ', 6001, 30),
  (6195, 6033, (SELECT id FROM athletes WHERE last_name = 'Мацюк' AND first_name = 'Кирилл' AND middle_name = 'Станиславович' AND birth_year = 1996 LIMIT 1), 5, 144, NULL, 92.6, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Мацюк Кирилл Станиславович', 'Федерация гиревого спорта СО', 'Свердловская область', 6001, 30),
  (6196, 6033, (SELECT id FROM athletes WHERE last_name = 'Гулов' AND first_name = 'Фарход' AND middle_name = 'Абдурахмонович' AND birth_year = 1997 LIMIT 1), 6, 128, NULL, 94.9, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Гулов Фарход Абдурахмонович', '"СШ Олимп" г.Челябинска', 'Челябинская область', 6001, 30),
  (6197, 6033, (SELECT id FROM athletes WHERE last_name = 'Калимуллин' AND first_name = 'Ильнур' AND middle_name = 'Ринатович' AND birth_year = 1985 LIMIT 1), 7, 114, NULL, 94.25, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Калимуллин Ильнур Ринатович', 'АО Роспан Интернешнл', 'Ямало-Ненецкий автономный округ', 6001, 30),
  (6198, 6033, (SELECT id FROM athletes WHERE last_name = 'Ключкин' AND first_name = 'Роман' AND middle_name = 'Викторович' AND birth_year = 1985 LIMIT 1), 8, 106, NULL, 93.6, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Ключкин Роман Викторович', 'КСК Факел', 'Ямало-Ненецкий автономный округ', 6001, 30),
  (6199, 6033, (SELECT id FROM athletes WHERE last_name = 'Дашкевич' AND first_name = 'Владимир' AND middle_name = 'Олегович' AND birth_year = 1984 LIMIT 1), 9, 101, NULL, 88.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Дашкевич Владимир Олегович', 'МАУ «Районное управление спортивных сооружений»', 'Ханты-Мансийский АО - Югра', 6001, 30),
  (6200, 6033, (SELECT id FROM athletes WHERE last_name = 'Максимов' AND first_name = 'Андрей' AND middle_name = 'Владимирович' AND birth_year = 1988 LIMIT 1), 10, 95, NULL, 93.7, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Максимов Андрей Владимирович', 'Федерация гиревого спорта СО', 'Свердловская область', 6001, 30),
  (6201, 6033, (SELECT id FROM athletes WHERE last_name = 'Хлань' AND first_name = 'Анатолий' AND middle_name = 'Анатольевич' AND birth_year = 1981 LIMIT 1), 11, 65, NULL, 94.15, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 6001, '2026-04-08', 'Хлань Анатолий Анатольевич', 'Федерация гиревого спорта СО', 'Свердловская область', 6001, 30);

INSERT INTO result_reps (id, result_id, exercise, hand, reps) VALUES
  (6001, 6001, 'jerk', 'both', 32),
  (6002, 6002, 'jerk', 'both', 15),
  (6003, 6003, 'jerk', 'both', 20),
  (6004, 6004, 'jerk', 'both', 15),
  (6005, 6005, 'jerk', 'both', 3),
  (6006, 6006, 'jerk', 'both', 111),
  (6007, 6007, 'jerk', 'both', 62),
  (6008, 6008, 'jerk', 'both', 33),
  (6009, 6009, 'jerk', 'both', 26),
  (6010, 6010, 'jerk', 'both', 2),
  (6011, 6011, 'jerk', 'both', 73),
  (6012, 6012, 'jerk', 'both', 22),
  (6013, 6013, 'jerk', 'both', 21),
  (6014, 6014, 'jerk', 'both', 77),
  (6015, 6015, 'jerk', 'both', 71),
  (6016, 6016, 'jerk', 'both', 58),
  (6017, 6017, 'jerk', 'both', 52),
  (6018, 6018, 'jerk', 'both', 69),
  (6019, 6019, 'jerk', 'both', 56),
  (6020, 6020, 'jerk', 'both', 44),
  (6021, 6021, 'jerk', 'both', 145),
  (6022, 6022, 'jerk', 'both', 86),
  (6023, 6023, 'jerk', 'both', 86),
  (6024, 6024, 'jerk', 'both', 82),
  (6025, 6025, 'jerk', 'both', 78),
  (6026, 6026, 'jerk', 'both', 56),
  (6027, 6027, 'jerk', 'both', 30),
  (6028, 6028, 'jerk', 'both', 130),
  (6029, 6029, 'jerk', 'both', 118),
  (6030, 6030, 'jerk', 'both', 105),
  (6031, 6031, 'jerk', 'both', 104),
  (6032, 6032, 'jerk', 'both', 89),
  (6033, 6033, 'jerk', 'both', 65),
  (6034, 6034, 'jerk', 'both', 146),
  (6035, 6035, 'jerk', 'both', 141),
  (6036, 6036, 'jerk', 'both', 85),
  (6037, 6037, 'jerk', 'both', 66),
  (6038, 6038, 'jerk', 'both', 60),
  (6039, 6039, 'jerk', 'both', 60),
  (6040, 6040, 'jerk', 'both', 52),
  (6041, 6041, 'jerk', 'both', 20),
  (6042, 6042, 'jerk', 'both', 100),
  (6043, 6043, 'jerk', 'both', 67),
  (6044, 6044, 'jerk', 'both', 63),
  (6045, 6045, 'jerk', 'both', 142),
  (6046, 6046, 'jerk', 'both', 110),
  (6047, 6047, 'jerk', 'both', 99),
  (6048, 6048, 'jerk', 'both', 99),
  (6049, 6049, 'jerk', 'both', 98),
  (6050, 6050, 'jerk', 'both', 85),
  (6051, 6051, 'jerk', 'both', 76),
  (6052, 6052, 'jerk', 'both', 57),
  (6053, 6053, 'long_cycle', 'both', 27),
  (6054, 6054, 'long_cycle', 'both', 20),
  (6055, 6055, 'long_cycle', 'both', 10),
  (6056, 6056, 'long_cycle', 'both', 14),
  (6057, 6057, 'long_cycle', 'both', 56),
  (6058, 6058, 'long_cycle', 'both', 41),
  (6059, 6059, 'long_cycle', 'both', 31),
  (6060, 6060, 'long_cycle', 'both', 27),
  (6061, 6061, 'long_cycle', 'both', 63),
  (6062, 6062, 'long_cycle', 'both', 12),
  (6063, 6063, 'long_cycle', 'both', 35),
  (6064, 6064, 'long_cycle', 'both', 35),
  (6065, 6065, 'long_cycle', 'both', 20),
  (6066, 6066, 'long_cycle', 'both', 18),
  (6067, 6067, 'long_cycle', 'both', 16),
  (6068, 6068, 'long_cycle', 'both', 15),
  (6069, 6069, 'long_cycle', 'both', 67),
  (6070, 6070, 'long_cycle', 'both', 61),
  (6071, 6071, 'long_cycle', 'both', 24),
  (6072, 6072, 'long_cycle', 'both', 82),
  (6073, 6073, 'long_cycle', 'both', 82),
  (6074, 6074, 'long_cycle', 'both', 62),
  (6075, 6075, 'long_cycle', 'both', 60),
  (6076, 6076, 'long_cycle', 'both', 38),
  (6077, 6077, 'long_cycle', 'both', 81),
  (6078, 6078, 'long_cycle', 'both', 65),
  (6079, 6079, 'long_cycle', 'both', 60),
  (6080, 6080, 'long_cycle', 'both', 53),
  (6081, 6081, 'long_cycle', 'both', 52),
  (6082, 6082, 'long_cycle', 'both', 40),
  (6083, 6083, 'long_cycle', 'both', 38),
  (6084, 6084, 'long_cycle', 'both', 20),
  (6085, 6085, 'long_cycle', 'both', 82),
  (6086, 6086, 'long_cycle', 'both', 79),
  (6087, 6087, 'long_cycle', 'both', 59),
  (6088, 6088, 'long_cycle', 'both', 46),
  (6089, 6089, 'long_cycle', 'both', 45),
  (6090, 6090, 'long_cycle', 'both', 40),
  (6091, 6091, 'long_cycle', 'both', 27),
  (6092, 6092, 'long_cycle', 'both', 23),
  (6093, 6093, 'long_cycle', 'both', 36),
  (6094, 6094, 'long_cycle', 'both', 15),
  (6095, 6095, 'long_cycle', 'both', 81),
  (6096, 6096, 'long_cycle', 'both', 51),
  (6097, 6097, 'long_cycle', 'both', 49),
  (6098, 6098, 'long_cycle', 'both', 46),
  (6099, 6099, 'snatch', 'both', 130),
  (6100, 6100, 'snatch', 'both', 126),
  (6101, 6101, 'snatch', 'both', 111),
  (6102, 6102, 'snatch', 'both', 102),
  (6103, 6103, 'snatch', 'both', 102),
  (6104, 6104, 'snatch', 'both', 101),
  (6105, 6105, 'snatch', 'both', 94),
  (6106, 6106, 'snatch', 'both', 81),
  (6107, 6107, 'snatch', 'both', 71),
  (6108, 6108, 'snatch', 'both', 66),
  (6109, 6109, 'snatch', 'both', 55),
  (6110, 6110, 'snatch', 'both', 48),
  (6111, 6111, 'snatch', 'both', 39),
  (6112, 6112, 'snatch', 'both', 25),
  (6113, 6113, 'snatch', 'both', 203),
  (6114, 6114, 'snatch', 'both', 200),
  (6115, 6115, 'snatch', 'both', 100),
  (6116, 6116, 'snatch', 'both', 89),
  (6117, 6117, 'snatch', 'both', 58),
  (6118, 6118, 'snatch', 'both', 47),
  (6119, 6119, 'snatch', 'both', 28),
  (6120, 6120, 'snatch', 'both', 201),
  (6121, 6121, 'snatch', 'both', 188),
  (6122, 6122, 'snatch', 'both', 76),
  (6123, 6123, 'snatch', 'both', 73),
  (6124, 6124, 'snatch', 'both', 72),
  (6125, 6125, 'snatch', 'both', 51),
  (6126, 6126, 'snatch', 'both', 32),
  (6127, 6127, 'snatch', 'both', 150),
  (6128, 6128, 'snatch', 'both', 120),
  (6129, 6129, 'snatch', 'both', 111),
  (6130, 6130, 'snatch', 'both', 83),
  (6131, 6131, 'snatch', 'both', 71),
  (6132, 6132, 'snatch', 'both', 65),
  (6133, 6133, 'snatch', 'both', 152),
  (6134, 6134, 'snatch', 'both', 104),
  (6135, 6135, 'snatch', 'both', 99),
  (6136, 6136, 'snatch', 'both', 86),
  (6137, 6137, 'snatch', 'both', 78),
  (6138, 6138, 'snatch', 'both', 69),
  (6139, 6139, 'snatch', 'both', 57),
  (6140, 6140, 'snatch', 'both', 55),
  (6141, 6141, 'snatch', 'both', 163),
  (6142, 6142, 'snatch', 'both', 158),
  (6143, 6143, 'snatch', 'both', 140),
  (6144, 6144, 'snatch', 'both', 134),
  (6145, 6145, 'snatch', 'both', 130),
  (6146, 6146, 'snatch', 'both', 99),
  (6147, 6147, 'snatch', 'both', 96),
  (6148, 6148, 'snatch', 'both', 94),
  (6149, 6149, 'snatch', 'both', 85),
  (6150, 6150, 'snatch', 'both', 72),
  (6151, 6151, 'snatch', 'both', 164),
  (6152, 6152, 'snatch', 'both', 149),
  (6153, 6153, 'snatch', 'both', 146),
  (6154, 6154, 'snatch', 'both', 143),
  (6155, 6155, 'snatch', 'both', 140),
  (6156, 6156, 'snatch', 'both', 128),
  (6157, 6157, 'snatch', 'both', 120),
  (6158, 6158, 'snatch', 'both', 88),
  (6159, 6159, 'snatch', 'both', 88),
  (6160, 6160, 'snatch', 'both', 80),
  (6161, 6161, 'snatch', 'both', 50),
  (6162, 6162, 'snatch', 'both', 185),
  (6163, 6163, 'snatch', 'both', 169),
  (6164, 6164, 'snatch', 'both', 166),
  (6165, 6165, 'snatch', 'both', 165),
  (6166, 6166, 'snatch', 'both', 163),
  (6167, 6167, 'snatch', 'both', 136),
  (6168, 6168, 'snatch', 'both', 130),
  (6169, 6169, 'snatch', 'both', 127),
  (6170, 6170, 'snatch', 'both', 120),
  (6171, 6171, 'snatch', 'both', 101),
  (6172, 6172, 'snatch', 'both', 89),
  (6173, 6173, 'snatch', 'both', 84),
  (6174, 6174, 'snatch', 'both', 62),
  (6175, 6175, 'snatch', 'both', 216),
  (6176, 6176, 'snatch', 'both', 164),
  (6177, 6177, 'snatch', 'both', 146),
  (6178, 6178, 'snatch', 'both', 111),
  (6179, 6179, 'snatch', 'both', 100),
  (6180, 6180, 'snatch', 'both', 97),
  (6181, 6181, 'snatch', 'both', 92),
  (6182, 6182, 'snatch', 'both', 73),
  (6183, 6183, 'snatch', 'both', 194),
  (6184, 6184, 'snatch', 'both', 189),
  (6185, 6185, 'snatch', 'both', 172),
  (6186, 6186, 'snatch', 'both', 149),
  (6187, 6187, 'snatch', 'both', 120),
  (6188, 6188, 'snatch', 'both', 115),
  (6189, 6189, 'snatch', 'both', 100),
  (6190, 6190, 'snatch', 'both', 43),
  (6191, 6191, 'snatch', 'both', 163),
  (6192, 6192, 'snatch', 'both', 148),
  (6193, 6193, 'snatch', 'both', 145),
  (6194, 6194, 'snatch', 'both', 145),
  (6195, 6195, 'snatch', 'both', 144),
  (6196, 6196, 'snatch', 'both', 128),
  (6197, 6197, 'snatch', 'both', 114),
  (6198, 6198, 'snatch', 'both', 106),
  (6199, 6199, 'snatch', 'both', 101),
  (6200, 6200, 'snatch', 'both', 95),
  (6201, 6201, 'snatch', 'both', 65);

