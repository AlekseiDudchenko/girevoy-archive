-- Чемпионат России 2024, Улан-Удэ, 2024-06-13—2024-06-17.
-- Сгенерировано scripts/gen_seed.py из data/chempionat-rossii-2024.json, не править руками.
-- Источник — официальная Excel-книга чемпионата России 2024. В протоколе у спортсменов указаны только фамилия и имя, без отчества; для сопоставления с архивом используется фамилия + имя + год рождения. Импортируется по одной категории с отдельным коммитом и деплоем. По указанию администратора эстафеты и командные очки не импортируются. Жонглирование не импортируется: дисциплина пока не поддержана текущей схемой. Импортированы все категории длинного цикла; женский рывок: 58, 63, 68, 68+ кг.
-- В исходнике нет отчеств: спортсмены сопоставляются по фамилии, имени и году рождения.
-- Данные извлечены из протокола моделью; сверка человеком не проводилась,
-- поэтому results.verified_by остаётся пустым (FR-A14).

INSERT OR IGNORE INTO regions (name, country) VALUES
  ('Новосибирская область', 'RU'),
  ('Республика Бурятия', 'RU'),
  ('г. Санкт-Петербург', 'RU'),
  ('Оренбургская область', 'RU'),
  ('ЯНАО', 'RU'),
  ('Омская область', 'RU'),
  ('Смоленская область', 'RU'),
  ('Пермский край', 'RU'),
  ('ХМАО-Югра', 'RU'),
  ('Кировская область', 'RU'),
  ('Томская область', 'RU'),
  ('Красноярский край', 'RU'),
  ('Республика Саха (Якутия)', 'RU'),
  ('Калужская область', 'RU'),
  ('Республика Татарстан', 'RU'),
  ('Тюменская область', 'RU'),
  ('Курганская область', 'RU'),
  ('Ростовская область', 'RU'),
  ('Кемеровская область', 'RU'),
  ('г. Москва', 'RU'),
  ('Рязанская область', 'RU'),
  ('Челябинская область', 'RU'),
  ('Брянская область', 'RU'),
  ('Иркутская область', 'RU'),
  ('Свердловская область', 'RU'),
  ('Ярославская область', 'RU'),
  ('Воронежская область', 'RU'),
  ('Астраханская область', 'RU'),
  ('Белгородская область', 'RU'),
  ('Самарская область', 'RU'),
  ('Краснодарский край', 'RU'),
  ('ЯНАО/Омская область', 'RU'),
  ('Удмуртская республика', 'RU'),
  ('Омская обл./Р.Бурятия', 'RU'),
  ('Республика Чувашия', 'RU'),
  ('Архангельская область', 'RU'),
  ('Республика Коми', 'RU'),
  ('Ставропольский край', 'RU');

INSERT OR IGNORE INTO clubs (name, region_id) VALUES
  ('-', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')),
  ('ВС', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')),
  ('-', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')),
  ('СШ №1 им. Л.Д. Ковалевского', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')),
  ('СШОРСВС им. В.Ф. Краевского', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')),
  ('МБУ ДО СШ «Зенит»', (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU')),
  ('ВС', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')),
  ('КСШ №1/ВС', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')),
  ('-', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')),
  ('МБУ ДО «ДЮСШ «Спарт»', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')),
  ('ДО ДС ДЮ «Прикамье»', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')),
  ('-', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')),
  ('-', (SELECT id FROM regions WHERE name = 'ХМАО-Югра' AND country = 'RU')),
  ('КСШ №1/ ВС', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')),
  ('КСК «Факел»', (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU')),
  ('КОГАУ «СШОР «Юность»', (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU')),
  ('МАУ ДО СШ  "Геолог"', (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU')),
  ('-', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')),
  ('-', (SELECT id FROM regions WHERE name = 'Красноярский край' AND country = 'RU')),
  ('-', (SELECT id FROM regions WHERE name = 'Республика Саха (Якутия)' AND country = 'RU')),
  ('СШОР "Маршал"', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')),
  ('РОО «ФГС РТ»', (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU')),
  ('ВС', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Ростовская область' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Кемеровская область' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')),
  ('ДДЮ «Алые Паруса»', (SELECT id FROM regions WHERE name = 'Рязанская область' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')),
  ('СШОР "Олимп"', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'ХМАО-Югра' AND country = 'RU')),
  ('Профсоюзы', (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')),
  ('КСШ №1 /ВС', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')),
  ('МБУ ДО СШ  «Уренгоец»', (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Красноярский край' AND country = 'RU')),
  ('СШОР "Атлет"', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')),
  ('"Динамо"', (SELECT id FROM regions WHERE name = 'Иркутская область' AND country = 'RU')),
  ('ДСО "Урожай"', (SELECT id FROM regions WHERE name = 'Свердловская область' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU')),
  ('МБУ ДО СШ «Уренгоец»', (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU')),
  ('МКУ ДО «Бобровская СШ им. В.Л. Паткина»', (SELECT id FROM regions WHERE name = 'Воронежская область' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Астраханская область' AND country = 'RU')),
  ('Газпром добыча Уренгой', (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU')),
  ('ССК "Китнаспорте"', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')),
  ('СШ «Юность', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Самарская область' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')),
  ('ВС', (SELECT id FROM regions WHERE name = 'ХМАО-Югра' AND country = 'RU')),
  ('МБУ ДО СШ «Татнефть Олимп» Чистопольского района РТ', (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU')),
  ('ЦСФМР ', (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU')),
  ('КОГАУ "СШОР "Юность"', (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU')),
  ('СШ "Юность"', (SELECT id FROM regions WHERE name = 'Краснодарский край' AND country = 'RU')),
  ('МБУ ДО "Центр Поиск"', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')),
  ('ВС', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')),
  ('СШ "Снежинка"', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')),
  ('МБУ ДО СШ пгт Тужа', (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU')),
  ('МБУ ДО СШ «Уренгоец»', (SELECT id FROM regions WHERE name = 'ЯНАО/Омская область' AND country = 'RU')),
  ('Газпром трансгаз Сургут', (SELECT id FROM regions WHERE name = 'ХМАО-Югра' AND country = 'RU')),
  ('ВС РФ', (SELECT id FROM regions WHERE name = 'Воронежская область' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Удмуртская республика' AND country = 'RU')),
  ('ВС', (SELECT id FROM regions WHERE name = 'Краснодарский край' AND country = 'RU')),
  (' СШ  «Геолог»', (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Омская обл./Р.Бурятия' AND country = 'RU')),
  ('СО "Динамо"', (SELECT id FROM regions WHERE name = 'Свердловская область' AND country = 'RU')),
  ('СШ "Энергия"', (SELECT id FROM regions WHERE name = 'Республика Чувашия' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Архангельская область' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Республика Чувашия' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Республика Коми' AND country = 'RU')),
  ('МАУ ДО ДС ДЮ "Прикамье"', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')),
  ('Газпром переработка', (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU')),
  ('НИУ БелГУ', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')),
  ('СШ г.Светлоград', (SELECT id FROM regions WHERE name = 'Ставропольский край' AND country = 'RU')),
  ('ДДЮ "Алые Паруса"', (SELECT id FROM regions WHERE name = 'Рязанская область' AND country = 'RU')),
  ('МАОУ "ЦРКМиС ПМО"', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'));

INSERT OR IGNORE INTO federations (name, short_name, country) VALUES
  ('Всероссийская федерация гиревого спорта', 'ВФГС', 'RU');

INSERT INTO competitions (id, slug, name, date_start, date_end, city, country, competition_rank_id, federation_id, source_url, is_published) VALUES
  (2001, 'chempionat-rossii-2024', 'Чемпионат России 2024', '2024-06-13', '2024-06-17', 'Улан-Удэ', 'RU', (SELECT id FROM competition_ranks WHERE code = 'national_ch'), (SELECT id FROM federations WHERE name = 'Всероссийская федерация гиревого спорта'), NULL, 1);

INSERT INTO protocols (id, competition_id, r2_key, filename, page_count, is_scan, status, published_at) VALUES
  (2001, 2001, 'protocols/chempionat-rossii-2024.pdf', 'chr-2024 (1).xlsx', 31, 0, 'published', '2024-06-13');

INSERT INTO categories (id, competition_id, discipline_id, sex, age_group_id, division_id, bell_kg, hands, time_limit_min, weight_class_raw, weight_class_kg, weight_class_is_open, participants_declared, is_deferred, sort_order) VALUES
  (2001, 2001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '63', 63, 0, 14, 0, 1),
  (2002, 2001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '68', 68, 0, 7, 0, 2),
  (2003, 2001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '73', 73, 0, 9, 0, 3),
  (2004, 2001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '78', 78, 0, 8, 0, 4),
  (2005, 2001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '85', 85, 0, 9, 0, 5),
  (2006, 2001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '95', 95, 0, 9, 0, 6),
  (2007, 2001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '95+', 95, 1, 13, 0, 7),
  (2008, 2001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '58', 58, 0, 8, 0, 8),
  (2009, 2001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '63', 63, 0, 7, 0, 9),
  (2010, 2001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '68', 68, 0, 8, 0, 10),
  (2011, 2001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '68+', 68, 1, 7, 0, 11),
  (2012, 2001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'one', 10, '58', 58, 0, 13, 0, 12),
  (2013, 2001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'one', 10, '63', 63, 0, 13, 0, 13),
  (2014, 2001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'one', 10, '68', 68, 0, 10, 0, 14),
  (2015, 2001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'one', 10, '68+', 68, 1, 12, 0, 15),
  (2016, 2001, (SELECT id FROM disciplines WHERE code = 'biathlon'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '63', 63, 0, 9, 0, 16),
  (2017, 2001, (SELECT id FROM disciplines WHERE code = 'biathlon'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '68', 68, 0, 12, 0, 17),
  (2018, 2001, (SELECT id FROM disciplines WHERE code = 'biathlon'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '73', 73, 0, 16, 0, 18),
  (2019, 2001, (SELECT id FROM disciplines WHERE code = 'biathlon'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '78', 78, 0, 10, 0, 19),
  (2020, 2001, (SELECT id FROM disciplines WHERE code = 'biathlon'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '85', 85, 0, 13, 0, 20),
  (2021, 2001, (SELECT id FROM disciplines WHERE code = 'biathlon'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '95+', 95, 1, 10, 0, 21),
  (2022, 2001, (SELECT id FROM disciplines WHERE code = 'biathlon'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '95', 95, 0, 14, 0, 22);

INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бутенко', 'Евгений', NULL, 1995, 'm', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Бутенко А.А.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бутенко' AND a.first_name = 'Евгений' AND a.birth_year = 1995 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Недорезов', 'Василий', NULL, 1992, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Рассадин А.А., Леонов С.Т.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Недорезов' AND a.first_name = 'Василий' AND a.birth_year = 1992 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Руднев', 'Руслан', NULL, 1994, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Руднев С.Л.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Руднев' AND a.first_name = 'Руслан' AND a.birth_year = 1994 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Якушев', 'Роман', NULL, 2002, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Любимский С.А., Коломин Д.А., Леонов С.Т.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Якушев' AND a.first_name = 'Роман' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Курунов', 'Анатолий', NULL, 1999, 'm', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ №1 им. Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Павлов С.П.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Курунов' AND a.first_name = 'Анатолий' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Захаров', 'Кирилл', NULL, 2007, 'm', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Бутенко И.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Захаров' AND a.first_name = 'Кирилл' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Черепанов', 'Антон', NULL, 2003, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Барков А.П.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Черепанов' AND a.first_name = 'Антон' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Жбанов', 'Алексей', NULL, 1986, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Барков А.П.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Жбанов' AND a.first_name = 'Алексей' AND a.birth_year = 1986 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Тананин', 'Вячеслав', NULL, 1997, 'm', (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ «Зенит»' AND region_id = (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU')), 'Латыпов Е.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Тананин' AND a.first_name = 'Вячеслав' AND a.birth_year = 1997 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ильясов', 'Какен', NULL, 1993, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Анасенко А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ильясов' AND a.first_name = 'Какен' AND a.birth_year = 1993 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Цвик', 'Данил', NULL, 2003, 'm', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КСШ №1/ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')), 'Сергеев С.В., Леонов С.Т.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Цвик' AND a.first_name = 'Данил' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Козин', 'Егор', NULL, 2006, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Каргин Я.Л.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Козин' AND a.first_name = 'Егор' AND a.birth_year = 2006 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Половников', 'Павел', NULL, 2002, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО «ДЮСШ «Спарт»' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Маматов Г.Т.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Половников' AND a.first_name = 'Павел' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Останин', 'Даниил', NULL, 2005, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ДО ДС ДЮ «Прикамье»' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Мошев Д.И', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Останин' AND a.first_name = 'Даниил' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Морозович', 'Владислав', NULL, 1999, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Сагандыков К.К.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Морозович' AND a.first_name = 'Владислав' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Рябков', 'Алексей', NULL, 1993, 'm', (SELECT id FROM regions WHERE name = 'ХМАО-Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'ХМАО-Югра' AND country = 'RU')), 'Шпартко М.А, Алтухов Д.В.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Рябков' AND a.first_name = 'Алексей' AND a.birth_year = 1993 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Иванов', 'Евгений', NULL, 1997, 'm', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КСШ №1/ ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')), 'Шванев В.Б.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Иванов' AND a.first_name = 'Евгений' AND a.birth_year = 1997 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Усольцев', 'Александр', NULL, 1992, 'm', (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КСК «Факел»' AND region_id = (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU')), 'Емельянов Н.А. Ефимов А.В.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Усольцев' AND a.first_name = 'Александр' AND a.birth_year = 1992 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Сергеев', 'Алексей', NULL, 2001, 'm', (SELECT id FROM regions WHERE name = 'ХМАО-Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'ХМАО-Югра' AND country = 'RU')), 'Трофимова А.А, Садыков Р. И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Сергеев' AND a.first_name = 'Алексей' AND a.birth_year = 2001 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Новоселов', 'Андрей', NULL, 2004, 'm', (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КОГАУ «СШОР «Юность»' AND region_id = (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU')), 'Малков Е.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Новоселов' AND a.first_name = 'Андрей' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Куликов', 'Сергей', NULL, 1985, 'm', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Самостоятельно', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Куликов' AND a.first_name = 'Сергей' AND a.birth_year = 1985 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Беляев', 'Иван', NULL, 1992, 'm', (SELECT id FROM regions WHERE name = 'ХМАО-Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'ХМАО-Югра' AND country = 'RU')), 'Шпартко М.А., Власов А.П., Меркулин С.В.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Беляев' AND a.first_name = 'Иван' AND a.birth_year = 1992 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Каргин', 'Сергей', NULL, 1998, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Рассадин А.А., Каргин Я.Л., Леонов С.Т.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Каргин' AND a.first_name = 'Сергей' AND a.birth_year = 1998 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Коломин', 'Дмитрий', NULL, 1999, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Рассадин А.А., Хлебодаров А.Г., Леонов С.Т.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Коломин' AND a.first_name = 'Дмитрий' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Баев', 'Константин', NULL, 1993, 'm', (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШ  "Геолог"' AND region_id = (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU')), 'Щекотов И.В.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Баев' AND a.first_name = 'Константин' AND a.birth_year = 1993 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Иванов', 'Евгений', NULL, 1987, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Ажермачев А.Б., Рябков А.Б.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Иванов' AND a.first_name = 'Евгений' AND a.birth_year = 1987 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Голиков', 'Роман', NULL, 1990, 'm', (SELECT id FROM regions WHERE name = 'Красноярский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'Красноярский край' AND country = 'RU')), 'Рябков А.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Голиков' AND a.first_name = 'Роман' AND a.birth_year = 1990 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Оленов', 'Владимир', NULL, 1991, 'm', (SELECT id FROM regions WHERE name = 'Республика Саха (Якутия)' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Саха (Якутия)' AND country = 'RU')), 'Дьячковский В.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Оленов' AND a.first_name = 'Владимир' AND a.birth_year = 1991 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Рожин', 'Егор', NULL, 1987, 'm', (SELECT id FROM regions WHERE name = 'Республика Саха (Якутия)' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Саха (Якутия)' AND country = 'RU')), 'Оленов В.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Рожин' AND a.first_name = 'Егор' AND a.birth_year = 1987 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Васин', 'Артем', NULL, 2007, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Маршал"' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Пянко И.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Васин' AND a.first_name = 'Артем' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Сарсембаев', 'Ильяс', NULL, 1999, 'm', (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ «Зенит»' AND region_id = (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU')), 'Латыпов Е.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Сарсембаев' AND a.first_name = 'Ильяс' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ляукин', 'Кирилл', NULL, 1999, 'm', (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РОО «ФГС РТ»' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU')), 'Низамова А.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ляукин' AND a.first_name = 'Кирилл' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Майер', 'Олег', NULL, 2002, 'm', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')), 'Андреев И.Г.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Майер' AND a.first_name = 'Олег' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Молчанов', 'Дианисий', NULL, 2005, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Катаев И.В., Бирюков С.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Молчанов' AND a.first_name = 'Дианисий' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Порцев', 'Роман', NULL, 1987, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ДО ДС ДЮ «Прикамье»' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Мошев Д.И', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Порцев' AND a.first_name = 'Роман' AND a.birth_year = 1987 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Любимский', 'Сергей', NULL, 1992, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Трофимов М.А., Блохин И.А., Леонов С.Т.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Любимский' AND a.first_name = 'Сергей' AND a.birth_year = 1992 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Дубель', 'Алексей', NULL, 1990, 'm', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')), 'Самостоятельно', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Дубель' AND a.first_name = 'Алексей' AND a.birth_year = 1990 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Алцыбеев', 'Никита', NULL, 2003, 'm', (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КОГАУ «СШОР «Юность»' AND region_id = (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU')), 'Малков Е.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Алцыбеев' AND a.first_name = 'Никита' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бородынкин', 'Олег', NULL, 2002, 'm', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Бутенко И.А., Баер П.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бородынкин' AND a.first_name = 'Олег' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Чуев', 'Павел', NULL, 1997, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Кириллов С.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Чуев' AND a.first_name = 'Павел' AND a.birth_year = 1997 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Самочернов', 'Иван', NULL, 1998, 'm', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')), 'Стрекаловских С.К.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Самочернов' AND a.first_name = 'Иван' AND a.birth_year = 1998 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Рысник', 'Сергей', NULL, 1995, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Елисеев В.С., Переверзев Н.И.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Рысник' AND a.first_name = 'Сергей' AND a.birth_year = 1995 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Лопин', 'Илья', NULL, 2005, 'm', (SELECT id FROM regions WHERE name = 'Ростовская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Ростовская область' AND country = 'RU')), 'Пестов В.М.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Лопин' AND a.first_name = 'Илья' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Минуллин', 'Марсель', NULL, 2000, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Елисеев В.С., Гарифуллин Р.Ф.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Минуллин' AND a.first_name = 'Марсель' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Тюленев', 'Дмитрий', NULL, 1985, 'm', (SELECT id FROM regions WHERE name = 'Кемеровская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Кемеровская область' AND country = 'RU')), 'Рябченко А.В., Меньшинин А.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Тюленев' AND a.first_name = 'Дмитрий' AND a.birth_year = 1985 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ефремов', 'Сергей', NULL, 1997, 'm', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Бутенко А.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ефремов' AND a.first_name = 'Сергей' AND a.birth_year = 1997 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ветров', 'Денис', NULL, 1989, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Самостоятельно', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ветров' AND a.first_name = 'Денис' AND a.birth_year = 1989 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кулаков', 'Иван', NULL, 1998, 'm', (SELECT id FROM regions WHERE name = 'Рязанская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ДДЮ «Алые Паруса»' AND region_id = (SELECT id FROM regions WHERE name = 'Рязанская область' AND country = 'RU')), 'Шматов И.Б.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кулаков' AND a.first_name = 'Иван' AND a.birth_year = 1998 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Черкашин', 'Иван', NULL, 1999, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Тимофеев Н.А., Черкашин Д.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Черкашин' AND a.first_name = 'Иван' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Клепиков', 'Артём', NULL, 1998, 'm', (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КОГАУ «СШОР «Юность»' AND region_id = (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU')), 'Малков Е.И.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Клепиков' AND a.first_name = 'Артём' AND a.birth_year = 1998 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Селиверстов', 'Семен', NULL, 1989, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Олимп"' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Нестеренко Д.В., Ташланов И.С.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Селиверстов' AND a.first_name = 'Семен' AND a.birth_year = 1989 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кирюхин', 'Роман', NULL, 1997, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Соловьев А.В., Ландин А.Ю.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кирюхин' AND a.first_name = 'Роман' AND a.birth_year = 1997 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кудашев', 'Денис', NULL, 1988, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Леонов С.Т.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кудашев' AND a.first_name = 'Денис' AND a.birth_year = 1988 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Николаев', 'Аркадий', NULL, 2002, 'm', (SELECT id FROM regions WHERE name = 'ХМАО-Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'ХМАО-Югра' AND country = 'RU')), 'Шпартко М.А, Рябков А.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Николаев' AND a.first_name = 'Аркадий' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Гуров', 'Владимир', NULL, 1978, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Маршал"' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Трофимов М.А.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Гуров' AND a.first_name = 'Владимир' AND a.birth_year = 1978 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Мухитов', 'Андрей', NULL, 1999, 'm', (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Профсоюзы' AND region_id = (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU')), 'Гомонов В.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Мухитов' AND a.first_name = 'Андрей' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Балабанов', 'Сергей', NULL, 1996, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Пастухов И.В.,Трофимов М.А., Леонов С.Т.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Балабанов' AND a.first_name = 'Сергей' AND a.birth_year = 1996 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Шевелёв', 'Дмитрий', NULL, 1989, 'm', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Рябченко А.В.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Шевелёв' AND a.first_name = 'Дмитрий' AND a.birth_year = 1989 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Стаханов', 'Валентин', NULL, 1990, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Анасенко А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Стаханов' AND a.first_name = 'Валентин' AND a.birth_year = 1990 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Чирков', 'Леонид', NULL, 2003, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Трофимов М.А., Гуров В.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Чирков' AND a.first_name = 'Леонид' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Калистратов', 'Артем', NULL, 1992, 'm', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КСШ №1 /ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')), 'Сергеев С.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Калистратов' AND a.first_name = 'Артем' AND a.birth_year = 1992 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кичимаев', 'Николай', NULL, 1987, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Семенов А.Н.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кичимаев' AND a.first_name = 'Николай' AND a.birth_year = 1987 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Июльский', 'Дмитрий', NULL, 1993, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Салов П.С., Алфёрова В.Я., Ландин А.Ю.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Июльский' AND a.first_name = 'Дмитрий' AND a.birth_year = 1993 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Юдин', 'Дмитрий', NULL, 1989, 'm', (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ  «Уренгоец»' AND region_id = (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU')), 'Бабичев М.А. Горбачёв В.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Юдин' AND a.first_name = 'Дмитрий' AND a.birth_year = 1989 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Медведев', 'Николай', NULL, 2006, 'm', (SELECT id FROM regions WHERE name = 'Ростовская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Ростовская область' AND country = 'RU')), 'Ковач В.З.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Медведев' AND a.first_name = 'Николай' AND a.birth_year = 2006 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Захаров', 'Андрей', NULL, 1993, 'm', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Петухов А.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Захаров' AND a.first_name = 'Андрей' AND a.birth_year = 1993 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бутин', 'Алексей', NULL, 1985, 'm', (SELECT id FROM regions WHERE name = 'Красноярский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Красноярский край' AND country = 'RU')), 'Григорчук С.С.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бутин' AND a.first_name = 'Алексей' AND a.birth_year = 1985 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Денисов', 'Иван', NULL, 1982, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Атлет"' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Симушин А.М.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Денисов' AND a.first_name = 'Иван' AND a.birth_year = 1982 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Верочкин', 'Денис', NULL, 1980, 'm', (SELECT id FROM regions WHERE name = 'Иркутская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '"Динамо"' AND region_id = (SELECT id FROM regions WHERE name = 'Иркутская область' AND country = 'RU')), 'Руднев С.Л.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Верочкин' AND a.first_name = 'Денис' AND a.birth_year = 1980 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Трофимова', 'Милена', NULL, 2007, 'f', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Маршал"' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Пянко И.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Трофимова' AND a.first_name = 'Милена' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Прохорова', 'Ангелина', NULL, 2005, 'f', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Бутенко И.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Прохорова' AND a.first_name = 'Ангелина' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Сатлыкова', 'Эльвира', NULL, 2000, 'f', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ №1 им. Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Павлов С.П.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Сатлыкова' AND a.first_name = 'Эльвира' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Лазарева', 'Анастасия', NULL, 1991, 'f', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Петров В.М.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Лазарева' AND a.first_name = 'Анастасия' AND a.birth_year = 1991 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Семирунняя', 'Александра', NULL, 2006, 'f', (SELECT id FROM regions WHERE name = 'Ростовская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Ростовская область' AND country = 'RU')), 'Семирунний В.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Семирунняя' AND a.first_name = 'Александра' AND a.birth_year = 2006 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Белевич', 'Елизавета', NULL, 2005, 'f', (SELECT id FROM regions WHERE name = 'Свердловская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ДСО "Урожай"' AND region_id = (SELECT id FROM regions WHERE name = 'Свердловская область' AND country = 'RU')), 'Чагаев А.Е.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Белевич' AND a.first_name = 'Елизавета' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Трофимова', 'Алена', NULL, 2001, 'f', (SELECT id FROM regions WHERE name = 'ХМАО-Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'ХМАО-Югра' AND country = 'RU')), 'Садыков Р. И., Лепехов Г.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Трофимова' AND a.first_name = 'Алена' AND a.birth_year = 2001 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Подольская', 'Анастасия', NULL, 2005, 'f', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Соловьев А.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Подольская' AND a.first_name = 'Анастасия' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Барбакова', 'Александра', NULL, 2004, 'f', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Маршал"' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Пянко И.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Барбакова' AND a.first_name = 'Александра' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Гаврилова', 'Виктория', NULL, 2003, 'f', (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU')), 'Кузнецов О.Г.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Гаврилова' AND a.first_name = 'Виктория' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Фирулева', 'Василиса', NULL, 2004, 'f', (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ «Уренгоец»' AND region_id = (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU')), 'Бабичев М.А., Анасенко А.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Фирулева' AND a.first_name = 'Василиса' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Альянова', 'Виктория', NULL, 2004, 'f', (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Профсоюзы' AND region_id = (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU')), 'Гомонов В.Н., Лукьянчиков Ю.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Альянова' AND a.first_name = 'Виктория' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кутенкова', 'Анастасия', NULL, 1997, 'f', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Любимский С.А., Леонов С.Т', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кутенкова' AND a.first_name = 'Анастасия' AND a.birth_year = 1997 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Переплетова', 'Яна', NULL, 2009, 'f', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Соловьев А.В.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Переплетова' AND a.first_name = 'Яна' AND a.birth_year = 2009 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Карпушенко', 'Ульяна', NULL, 2002, 'f', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Атлет"' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Денисов И.Н., Ташланов И.С.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Карпушенко' AND a.first_name = 'Ульяна' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Воропаева', 'Виктория', NULL, 2004, 'f', (SELECT id FROM regions WHERE name = 'Воронежская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МКУ ДО «Бобровская СШ им. В.Л. Паткина»' AND region_id = (SELECT id FROM regions WHERE name = 'Воронежская область' AND country = 'RU')), 'Сорокин Н. Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Воропаева' AND a.first_name = 'Виктория' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Мартынова', 'Любовь', NULL, 2007, 'f', (SELECT id FROM regions WHERE name = 'Астраханская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Астраханская область' AND country = 'RU')), 'Бирюков С.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Мартынова' AND a.first_name = 'Любовь' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Матвеева', 'Елена', NULL, 1974, 'f', (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КОГАУ «СШОР «Юность»' AND region_id = (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU')), 'Малков Е.И.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Матвеева' AND a.first_name = 'Елена' AND a.birth_year = 1974 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кошурникова', 'Анастасия', NULL, 2003, 'f', (SELECT id FROM regions WHERE name = 'ХМАО-Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'ХМАО-Югра' AND country = 'RU')), 'Шпартко М.А', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кошурникова' AND a.first_name = 'Анастасия' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ельчанинова', 'Вероника', NULL, 2003, 'f', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Елисеева Н.А., Переверзев Н.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ельчанинова' AND a.first_name = 'Вероника' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Башарова', 'Виктория', NULL, 1993, 'f', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Каргин С.Я., Рассадин А.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Башарова' AND a.first_name = 'Виктория' AND a.birth_year = 1993 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Походяева', 'Александра', NULL, 1990, 'f', (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Газпром добыча Уренгой' AND region_id = (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU')), 'Жилин А.В., Руднев С.Л.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Походяева' AND a.first_name = 'Александра' AND a.birth_year = 1990 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Куцанова', 'Анастасия', NULL, 2006, 'f', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Панов А.А., Новиков А.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Куцанова' AND a.first_name = 'Анастасия' AND a.birth_year = 2006 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Мартынова', 'Ирина', NULL, 1999, 'f', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Маршал"' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Трофимов М.А', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Мартынова' AND a.first_name = 'Ирина' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Полякова', 'Полина', NULL, 1999, 'f', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Барков А.П., Садыков Р.И., Мартьянов А.В.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Полякова' AND a.first_name = 'Полина' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ландина', 'Алена', NULL, 2006, 'f', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Ландин А.Ю.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ландина' AND a.first_name = 'Алена' AND a.birth_year = 2006 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Врубель', 'Дарья', NULL, 2000, 'f', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Сагандыков К.К., Переверзев Н.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Врубель' AND a.first_name = 'Дарья' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кузьмичева', 'Ксения', NULL, 2004, 'f', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ №1 им. Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Павлов С.П.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кузьмичева' AND a.first_name = 'Ксения' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Попова', 'Мария', NULL, 2005, 'f', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ССК "Китнаспорте"' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Паклин П.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Попова' AND a.first_name = 'Мария' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бадашкова', 'Нина', NULL, 1991, 'f', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Филимонов М.О., Бутенко И.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бадашкова' AND a.first_name = 'Нина' AND a.birth_year = 1991 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Щербина', 'Джанита', NULL, 1991, 'f', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Никифоров А.В.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Щербина' AND a.first_name = 'Джанита' AND a.birth_year = 1991 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Жура', 'Александра', NULL, 1988, 'f', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Кириллов С.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Жура' AND a.first_name = 'Александра' AND a.birth_year = 1988 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Беликова', 'Олеся', NULL, 2004, 'f', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ «Юность' AND region_id = (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')), 'Власов А.П., Вильган А.П.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Беликова' AND a.first_name = 'Олеся' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Мажаева', 'Наталия', NULL, 1999, 'f', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Барков А.П.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Мажаева' AND a.first_name = 'Наталия' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бахтова', 'Ирина', NULL, 1999, 'f', (SELECT id FROM regions WHERE name = 'Самарская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Самарская область' AND country = 'RU')), 'Бахтов И.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бахтова' AND a.first_name = 'Ирина' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Хуснудинова', 'Мария', NULL, 2004, 'f', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Олимп"' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Потапов О.Ю., Хуснудинов А.З.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Хуснудинова' AND a.first_name = 'Мария' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Суханова', 'Анастасия', NULL, 2007, 'f', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')), 'Безбородов А.Г.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Суханова' AND a.first_name = 'Анастасия' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Коптяева', 'Карина', NULL, 2007, 'f', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')), 'Калмаков С.И., Айдбаев И.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Коптяева' AND a.first_name = 'Карина' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ныныч', 'Маргарита', NULL, 1996, 'f', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Рассадин А.А., Трофимов М.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ныныч' AND a.first_name = 'Маргарита' AND a.birth_year = 1996 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кожеватова', 'Василиса', NULL, 2002, 'f', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ №1 им. Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Павлов С.П.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кожеватова' AND a.first_name = 'Василиса' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Тарвердиева', 'Мария', NULL, 1986, 'f', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Семенов А.Н. Руднев С.Л.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Тарвердиева' AND a.first_name = 'Мария' AND a.birth_year = 1986 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Степанова', 'Оксана', NULL, 1990, 'f', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Атлет"' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Денисов И.Н., Степанов С.В.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Степанова' AND a.first_name = 'Оксана' AND a.birth_year = 1990 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Дедюхина', 'Ксения', NULL, 1990, 'f', (SELECT id FROM regions WHERE name = 'ХМАО-Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'ХМАО-Югра' AND country = 'RU')), 'Шпартко М.А, Дедюхин И.В.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Дедюхина' AND a.first_name = 'Ксения' AND a.birth_year = 1990 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бурмакина', 'Екатерина', NULL, 2005, 'f', (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ «Татнефть Олимп» Чистопольского района РТ' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU')), 'Гиниатуллин А.З.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бурмакина' AND a.first_name = 'Екатерина' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Мицурина', 'Оксана', NULL, 1999, 'f', (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ЦСФМР ' AND region_id = (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU')), 'Крикунов В.В., Жилин А.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Мицурина' AND a.first_name = 'Оксана' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Карпушенко', 'Ульяна', NULL, 2001, 'f', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Атлет"' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Денисов И.Н., Ташланов И.С.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Карпушенко' AND a.first_name = 'Ульяна' AND a.birth_year = 2001 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Шевелева', 'Олеся', NULL, 2005, 'f', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Суворов И.В., Житихин В.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Шевелева' AND a.first_name = 'Олеся' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Сергеева', 'Юлия', NULL, 1980, 'f', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Трофимов М.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Сергеева' AND a.first_name = 'Юлия' AND a.birth_year = 1980 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Шангина', 'Светлана', NULL, 1973, 'f', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Овсянникова Е.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Шангина' AND a.first_name = 'Светлана' AND a.birth_year = 1973 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Воробьева', 'Надежда', NULL, 2000, 'f', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Башарова В.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Воробьева' AND a.first_name = 'Надежда' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бенидзе', 'Елизавета', NULL, 2002, 'f', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Бенидзе А.А., Вильган А.П., Огарев В.Я.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бенидзе' AND a.first_name = 'Елизавета' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Васькина', 'Алина', NULL, 1999, 'f', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КСШ №1/ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')), 'Шванев В.Б.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Васькина' AND a.first_name = 'Алина' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Барбакова', 'Наталья', NULL, 1984, 'f', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Маршал"' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Трофимов М.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Барбакова' AND a.first_name = 'Наталья' AND a.birth_year = 1984 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Фирса', 'Анна', NULL, 2003, 'f', (SELECT id FROM regions WHERE name = 'Краснодарский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ "Юность"' AND region_id = (SELECT id FROM regions WHERE name = 'Краснодарский край' AND country = 'RU')), 'Труш А.В.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Фирса' AND a.first_name = 'Анна' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бойко', 'Ксения', NULL, 2005, 'f', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО "Центр Поиск"' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Бойко В.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бойко' AND a.first_name = 'Ксения' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Каприна', 'Наталья', NULL, 1980, 'f', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Хвостов А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Каприна' AND a.first_name = 'Наталья' AND a.birth_year = 1980 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Карагаева', 'Ксения', NULL, 1999, 'f', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Филимонов М. О.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Карагаева' AND a.first_name = 'Ксения' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кухарева', 'Мария', NULL, 1989, 'f', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Хвостов А.В. ', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кухарева' AND a.first_name = 'Мария' AND a.birth_year = 1989 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Островская', 'Надежда', NULL, 1985, 'f', (SELECT id FROM regions WHERE name = 'ХМАО-Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'ХМАО-Югра' AND country = 'RU')), 'Шпартко М.А, Бакум К.Е.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Островская' AND a.first_name = 'Надежда' AND a.birth_year = 1985 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ходунова', 'Ирина', NULL, 1985, 'f', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КСШ №1/ ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')), 'Шванев В.Б.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ходунова' AND a.first_name = 'Ирина' AND a.birth_year = 1985 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Насонова', 'Виктория', NULL, 1999, 'f', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Чепуштанов И.В., Шаров Н.Ф.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Насонова' AND a.first_name = 'Виктория' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Копылова', 'Регина', NULL, 2001, 'f', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Баер П.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Копылова' AND a.first_name = 'Регина' AND a.birth_year = 2001 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Алферова', 'Валентина', NULL, 1985, 'f', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ "Снежинка"' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Самостоятельно ', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Алферова' AND a.first_name = 'Валентина' AND a.birth_year = 1985 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Дербенева', 'Ольга', NULL, 1970, 'f', (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ пгт Тужа' AND region_id = (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU')), 'Платунов В.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Дербенева' AND a.first_name = 'Ольга' AND a.birth_year = 1970 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бенидзе', 'Джони', NULL, 1990, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Кириллов С.А.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бенидзе' AND a.first_name = 'Джони' AND a.birth_year = 1990 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Смагулов', 'Нурсултан', NULL, 1999, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Катаев И.В.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Смагулов' AND a.first_name = 'Нурсултан' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ховалко', 'Василий', NULL, 1993, 'm', (SELECT id FROM regions WHERE name = 'ЯНАО/Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ «Уренгоец»' AND region_id = (SELECT id FROM regions WHERE name = 'ЯНАО/Омская область' AND country = 'RU')), 'Бабичев М.А. Донских А.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ховалко' AND a.first_name = 'Василий' AND a.birth_year = 1993 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Манаков', 'Трофим', NULL, 2000, 'm', (SELECT id FROM regions WHERE name = 'ХМАО-Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Газпром трансгаз Сургут' AND region_id = (SELECT id FROM regions WHERE name = 'ХМАО-Югра' AND country = 'RU')), 'Садыков Р. И, Дементьев А.Ф.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Манаков' AND a.first_name = 'Трофим' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Карнаухов', 'Никита', NULL, 2008, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Хлебодаров А.Г.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Карнаухов' AND a.first_name = 'Никита' AND a.birth_year = 2008 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Зуев', 'Владислав', NULL, 2000, 'm', (SELECT id FROM regions WHERE name = 'Воронежская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС РФ' AND region_id = (SELECT id FROM regions WHERE name = 'Воронежская область' AND country = 'RU')), 'Колесниченко Н.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Зуев' AND a.first_name = 'Владислав' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Щербин', 'Олег', NULL, 1989, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Никифоров А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Щербин' AND a.first_name = 'Олег' AND a.birth_year = 1989 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Шаров', 'Максим', NULL, 2000, 'm', (SELECT id FROM regions WHERE name = 'Рязанская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ДДЮ «Алые Паруса»' AND region_id = (SELECT id FROM regions WHERE name = 'Рязанская область' AND country = 'RU')), 'Кулаков И.И. Шматов И.Б.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Шаров' AND a.first_name = 'Максим' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Василевич', 'Добрыня', NULL, 2000, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Рассадин А.А., Сабодажев В.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Василевич' AND a.first_name = 'Добрыня' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Карнаухов', 'Даниил', NULL, 2001, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Рассадин А.А., Хлебодаров А.Г.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Карнаухов' AND a.first_name = 'Даниил' AND a.birth_year = 2001 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бенидзе', 'Спартак', NULL, 2002, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Бенидзе А.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бенидзе' AND a.first_name = 'Спартак' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Айдбаев', 'Ильфат', NULL, 1989, 'm', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')), 'Калмаков С.И.', NULL
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Айдбаев' AND a.first_name = 'Ильфат' AND a.birth_year = 1989 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Громов', 'Алексей', NULL, 1995, 'm', (SELECT id FROM regions WHERE name = 'Удмуртская республика' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Удмуртская республика' AND country = 'RU')), 'Шиляев И.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Громов' AND a.first_name = 'Алексей' AND a.birth_year = 1995 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Маскайкин', 'Никита', NULL, 2002, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Атлет"' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Симушин А.М.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Маскайкин' AND a.first_name = 'Никита' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Рассадин', 'Андрей', NULL, 1989, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Леонов С.Т., Руднев С.Л.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Рассадин' AND a.first_name = 'Андрей' AND a.birth_year = 1989 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Баранов', 'Егор', NULL, 1992, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Самостоятельно', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Баранов' AND a.first_name = 'Егор' AND a.birth_year = 1992 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Балдин', 'Александр', NULL, 1993, 'm', (SELECT id FROM regions WHERE name = 'Самарская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Самарская область' AND country = 'RU')), 'Бахтов И.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Балдин' AND a.first_name = 'Александр' AND a.birth_year = 1993 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Сулейманов', 'Мовсар', NULL, 1989, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Маршал"' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Трофимов М.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Сулейманов' AND a.first_name = 'Мовсар' AND a.birth_year = 1989 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Мащенко', 'Олег', NULL, 1983, 'm', (SELECT id FROM regions WHERE name = 'Краснодарский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Краснодарский край' AND country = 'RU')), 'Мащенко В.С.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Мащенко' AND a.first_name = 'Олег' AND a.birth_year = 1983 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Карагаев', 'Юрий', NULL, 1994, 'm', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Бутенко А.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Карагаев' AND a.first_name = 'Юрий' AND a.birth_year = 1994 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Панов', 'Алексей', NULL, 1991, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Самостоятельно', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Панов' AND a.first_name = 'Алексей' AND a.birth_year = 1991 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Волдаев', 'Александр', NULL, 2000, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Ажермачев А.Б., Перемитин Ф.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Волдаев' AND a.first_name = 'Александр' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кожевников', 'Сергей', NULL, 2008, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Алексеев В.И., Якушев Р.В., Коломин Д.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кожевников' AND a.first_name = 'Сергей' AND a.birth_year = 2008 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Гарифуллин', 'Константин', NULL, 1999, 'm', (SELECT id FROM regions WHERE name = 'Удмуртская республика' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Удмуртская республика' AND country = 'RU')), 'Шиляев И.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Гарифуллин' AND a.first_name = 'Константин' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бурков', 'Юрий', NULL, 1987, 'm', (SELECT id FROM regions WHERE name = 'Удмуртская республика' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Удмуртская республика' AND country = 'RU')), 'Шиляев И.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бурков' AND a.first_name = 'Юрий' AND a.birth_year = 1987 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Чойнжуров', 'Леонид', NULL, 2004, 'm', (SELECT id FROM regions WHERE name = 'Омская обл./Р.Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Омская обл./Р.Бурятия' AND country = 'RU')), 'Коломин Д., Хлебодаров А.Г., Анасенко А.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Чойнжуров' AND a.first_name = 'Леонид' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Квашнин', 'Михаил', NULL, 1988, 'm', (SELECT id FROM regions WHERE name = 'Свердловская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СО "Динамо"' AND region_id = (SELECT id FROM regions WHERE name = 'Свердловская область' AND country = 'RU')), 'Хвостов А.В., Чагаев А.Е.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Квашнин' AND a.first_name = 'Михаил' AND a.birth_year = 1988 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ташланов', 'Илья', NULL, 1987, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Атлет"' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Денисов И.Н.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ташланов' AND a.first_name = 'Илья' AND a.birth_year = 1987 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Иванов', 'Алексей', NULL, 1995, 'm', (SELECT id FROM regions WHERE name = 'Республика Чувашия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ "Энергия"' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Чувашия' AND country = 'RU')), 'Глинкин Б.Н.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Иванов' AND a.first_name = 'Алексей' AND a.birth_year = 1995 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Степанов', 'Сергей', NULL, 1993, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Атлет"' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Степанова О.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Степанов' AND a.first_name = 'Сергей' AND a.birth_year = 1993 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Иванов', 'Виталий', NULL, 1978, 'm', (SELECT id FROM regions WHERE name = 'ХМАО-Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'ХМАО-Югра' AND country = 'RU')), 'Шпартко М.А, Шульга Н.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Иванов' AND a.first_name = 'Виталий' AND a.birth_year = 1978 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Серебряков', 'Александр', NULL, 1991, 'm', (SELECT id FROM regions WHERE name = 'Архангельская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Архангельская область' AND country = 'RU')), 'самостоятельно', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Серебряков' AND a.first_name = 'Александр' AND a.birth_year = 1991 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Алексеев', 'Радиф', NULL, 1989, 'm', (SELECT id FROM regions WHERE name = 'Республика Чувашия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Чувашия' AND country = 'RU')), 'Бронюков Ю.А., Максимов С.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Алексеев' AND a.first_name = 'Радиф' AND a.birth_year = 1989 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ладе', 'Роман', NULL, 1991, 'm', (SELECT id FROM regions WHERE name = 'Республика Коми' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Коми' AND country = 'RU')), 'Петровичев Д.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ладе' AND a.first_name = 'Роман' AND a.birth_year = 1991 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кодиров', 'Абдумаъруф', NULL, 2000, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО ДС ДЮ "Прикамье"' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Мошев Д.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кодиров' AND a.first_name = 'Абдумаъруф' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Черкашин', 'Дмитрий', NULL, 1999, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Тимофеев Н.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Черкашин' AND a.first_name = 'Дмитрий' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Плотников', 'Вячеслав', NULL, 1998, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Атлет"' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Потапов О.Ю., Симушин А.М., Денисов И.Н.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Плотников' AND a.first_name = 'Вячеслав' AND a.birth_year = 1998 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Маликов', 'Данил', NULL, 2001, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ДО ДС ДЮ «Прикамье»' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Мошев Д.И., Панфилов Г.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Маликов' AND a.first_name = 'Данил' AND a.birth_year = 2001 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Шиляев', 'Иван', NULL, 1996, 'm', (SELECT id FROM regions WHERE name = 'Удмуртская республика' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Удмуртская республика' AND country = 'RU')), 'Несмелов В.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Шиляев' AND a.first_name = 'Иван' AND a.birth_year = 1996 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бревнов', 'Евгений', NULL, 1974, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Самостоятельно', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бревнов' AND a.first_name = 'Евгений' AND a.birth_year = 1974 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Минибаев', 'Альзаф', NULL, 1987, 'm', (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Газпром переработка' AND region_id = (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU')), 'Минибаев А.М. ', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Минибаев' AND a.first_name = 'Альзаф' AND a.birth_year = 1987 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Крестьянинов', 'Виктор', NULL, 2000, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ДО ДС ДЮ «Прикамье»' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Мошев Д.И., Панфилов Г.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Крестьянинов' AND a.first_name = 'Виктор' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Лавриков', 'Вячеслав', NULL, 2005, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Новиков А.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Лавриков' AND a.first_name = 'Вячеслав' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Марков', 'Иван', NULL, 1995, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Семенов А.Н.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Марков' AND a.first_name = 'Иван' AND a.birth_year = 1995 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Розмазнин', 'Илья', NULL, 2000, 'm', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'НИУ БелГУ' AND region_id = (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')), 'Сылка С.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Розмазнин' AND a.first_name = 'Илья' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Орлов', 'Сергей', NULL, 2005, 'm', (SELECT id FROM regions WHERE name = 'Ставропольский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ г.Светлоград' AND region_id = (SELECT id FROM regions WHERE name = 'Ставропольский край' AND country = 'RU')), 'Петров В.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Орлов' AND a.first_name = 'Сергей' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Шендо', 'Никита', NULL, 1998, 'm', (SELECT id FROM regions WHERE name = 'Красноярский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Красноярский край' AND country = 'RU')), 'Самостоятельно', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Шендо' AND a.first_name = 'Никита' AND a.birth_year = 1998 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Шабунин', 'Никита', NULL, 2001, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Елесов Е.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Шабунин' AND a.first_name = 'Никита' AND a.birth_year = 2001 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Тимушев', 'Олег', NULL, 1990, 'm', (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КОГАУ «СШОР «Юность»' AND region_id = (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU')), 'Малков Е.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Тимушев' AND a.first_name = 'Олег' AND a.birth_year = 1990 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Юрастов', 'Станислав', NULL, 1983, 'm', (SELECT id FROM regions WHERE name = 'Ростовская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Ростовская область' AND country = 'RU')), 'Потапов С.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Юрастов' AND a.first_name = 'Станислав' AND a.birth_year = 1983 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Филиппов', 'Максим', NULL, 1993, 'm', (SELECT id FROM regions WHERE name = 'Краснодарский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Краснодарский край' AND country = 'RU')), 'Труш А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Филиппов' AND a.first_name = 'Максим' AND a.birth_year = 1993 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Пивень', 'Андрей', NULL, 2003, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Расссадин А.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Пивень' AND a.first_name = 'Андрей' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Булдаков', 'Никита', NULL, 1997, 'm', (SELECT id FROM regions WHERE name = 'Удмуртская республика' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Удмуртская республика' AND country = 'RU')), 'Веретенников С.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Булдаков' AND a.first_name = 'Никита' AND a.birth_year = 1997 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Житихин', 'Владислав', NULL, 1994, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Балагуров С.В., Леонов С.Т.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Житихин' AND a.first_name = 'Владислав' AND a.birth_year = 1994 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Турищев', 'Дмитрий', NULL, 1992, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Бирюков А.С., Винтовкин Н.В.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Турищев' AND a.first_name = 'Дмитрий' AND a.birth_year = 1992 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Спичкин', 'Алексей', NULL, 1994, 'm', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Бобров В.С.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Спичкин' AND a.first_name = 'Алексей' AND a.birth_year = 1994 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Курдюков', 'Василий', NULL, 1997, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Анасенко А.В., Климов А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Курдюков' AND a.first_name = 'Василий' AND a.birth_year = 1997 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бардин', 'Максим', NULL, 1990, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАОУ "ЦРКМиС ПМО"' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Лунев А.Г., Мошев Д.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бардин' AND a.first_name = 'Максим' AND a.birth_year = 1990 LIMIT 1);

INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'butenko-evgeniy-1995' AND s.athlete_id <> a.id)
              THEN 'butenko-evgeniy-1995-' || a.id ELSE 'butenko-evgeniy-1995' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бутенко' AND first_name = 'Евгений' AND birth_year = 1995 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'nedorezov-vasiliy-1992' AND s.athlete_id <> a.id)
              THEN 'nedorezov-vasiliy-1992-' || a.id ELSE 'nedorezov-vasiliy-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Недорезов' AND first_name = 'Василий' AND birth_year = 1992 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'rudnev-ruslan-1994' AND s.athlete_id <> a.id)
              THEN 'rudnev-ruslan-1994-' || a.id ELSE 'rudnev-ruslan-1994' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Руднев' AND first_name = 'Руслан' AND birth_year = 1994 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'yakushev-roman-2002' AND s.athlete_id <> a.id)
              THEN 'yakushev-roman-2002-' || a.id ELSE 'yakushev-roman-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Якушев' AND first_name = 'Роман' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kurunov-anatoliy-1999' AND s.athlete_id <> a.id)
              THEN 'kurunov-anatoliy-1999-' || a.id ELSE 'kurunov-anatoliy-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Курунов' AND first_name = 'Анатолий' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zaharov-kirill-2007' AND s.athlete_id <> a.id)
              THEN 'zaharov-kirill-2007-' || a.id ELSE 'zaharov-kirill-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Захаров' AND first_name = 'Кирилл' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'cherepanov-anton-2003' AND s.athlete_id <> a.id)
              THEN 'cherepanov-anton-2003-' || a.id ELSE 'cherepanov-anton-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Черепанов' AND first_name = 'Антон' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zhbanov-aleksey-1986' AND s.athlete_id <> a.id)
              THEN 'zhbanov-aleksey-1986-' || a.id ELSE 'zhbanov-aleksey-1986' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Жбанов' AND first_name = 'Алексей' AND birth_year = 1986 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'tananin-vyacheslav-1997' AND s.athlete_id <> a.id)
              THEN 'tananin-vyacheslav-1997-' || a.id ELSE 'tananin-vyacheslav-1997' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Тананин' AND first_name = 'Вячеслав' AND birth_year = 1997 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ilyasov-kaken-1993' AND s.athlete_id <> a.id)
              THEN 'ilyasov-kaken-1993-' || a.id ELSE 'ilyasov-kaken-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ильясов' AND first_name = 'Какен' AND birth_year = 1993 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'cvik-danil-2003' AND s.athlete_id <> a.id)
              THEN 'cvik-danil-2003-' || a.id ELSE 'cvik-danil-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Цвик' AND first_name = 'Данил' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kozin-egor-2006' AND s.athlete_id <> a.id)
              THEN 'kozin-egor-2006-' || a.id ELSE 'kozin-egor-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Козин' AND first_name = 'Егор' AND birth_year = 2006 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'polovnikov-pavel-2002' AND s.athlete_id <> a.id)
              THEN 'polovnikov-pavel-2002-' || a.id ELSE 'polovnikov-pavel-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Половников' AND first_name = 'Павел' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ostanin-daniil-2005' AND s.athlete_id <> a.id)
              THEN 'ostanin-daniil-2005-' || a.id ELSE 'ostanin-daniil-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Останин' AND first_name = 'Даниил' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'morozovich-vladislav-1999' AND s.athlete_id <> a.id)
              THEN 'morozovich-vladislav-1999-' || a.id ELSE 'morozovich-vladislav-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Морозович' AND first_name = 'Владислав' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ryabkov-aleksey-1993' AND s.athlete_id <> a.id)
              THEN 'ryabkov-aleksey-1993-' || a.id ELSE 'ryabkov-aleksey-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Рябков' AND first_name = 'Алексей' AND birth_year = 1993 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ivanov-evgeniy-1997' AND s.athlete_id <> a.id)
              THEN 'ivanov-evgeniy-1997-' || a.id ELSE 'ivanov-evgeniy-1997' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Евгений' AND birth_year = 1997 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'usolcev-aleksandr-1992' AND s.athlete_id <> a.id)
              THEN 'usolcev-aleksandr-1992-' || a.id ELSE 'usolcev-aleksandr-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Усольцев' AND first_name = 'Александр' AND birth_year = 1992 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sergeev-aleksey-2001' AND s.athlete_id <> a.id)
              THEN 'sergeev-aleksey-2001-' || a.id ELSE 'sergeev-aleksey-2001' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Сергеев' AND first_name = 'Алексей' AND birth_year = 2001 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'novoselov-andrey-2004' AND s.athlete_id <> a.id)
              THEN 'novoselov-andrey-2004-' || a.id ELSE 'novoselov-andrey-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Новоселов' AND first_name = 'Андрей' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kulikov-sergey-1985' AND s.athlete_id <> a.id)
              THEN 'kulikov-sergey-1985-' || a.id ELSE 'kulikov-sergey-1985' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Куликов' AND first_name = 'Сергей' AND birth_year = 1985 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'belyaev-ivan-1992' AND s.athlete_id <> a.id)
              THEN 'belyaev-ivan-1992-' || a.id ELSE 'belyaev-ivan-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Беляев' AND first_name = 'Иван' AND birth_year = 1992 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kargin-sergey-1998' AND s.athlete_id <> a.id)
              THEN 'kargin-sergey-1998-' || a.id ELSE 'kargin-sergey-1998' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Каргин' AND first_name = 'Сергей' AND birth_year = 1998 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kolomin-dmitriy-1999' AND s.athlete_id <> a.id)
              THEN 'kolomin-dmitriy-1999-' || a.id ELSE 'kolomin-dmitriy-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Коломин' AND first_name = 'Дмитрий' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'baev-konstantin-1993' AND s.athlete_id <> a.id)
              THEN 'baev-konstantin-1993-' || a.id ELSE 'baev-konstantin-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Баев' AND first_name = 'Константин' AND birth_year = 1993 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ivanov-evgeniy-1987' AND s.athlete_id <> a.id)
              THEN 'ivanov-evgeniy-1987-' || a.id ELSE 'ivanov-evgeniy-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Евгений' AND birth_year = 1987 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'golikov-roman-1990' AND s.athlete_id <> a.id)
              THEN 'golikov-roman-1990-' || a.id ELSE 'golikov-roman-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Голиков' AND first_name = 'Роман' AND birth_year = 1990 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'olenov-vladimir-1991' AND s.athlete_id <> a.id)
              THEN 'olenov-vladimir-1991-' || a.id ELSE 'olenov-vladimir-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Оленов' AND first_name = 'Владимир' AND birth_year = 1991 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'rozhin-egor-1987' AND s.athlete_id <> a.id)
              THEN 'rozhin-egor-1987-' || a.id ELSE 'rozhin-egor-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Рожин' AND first_name = 'Егор' AND birth_year = 1987 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'vasin-artem-2007' AND s.athlete_id <> a.id)
              THEN 'vasin-artem-2007-' || a.id ELSE 'vasin-artem-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Васин' AND first_name = 'Артем' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sarsembaev-ilyas-1999' AND s.athlete_id <> a.id)
              THEN 'sarsembaev-ilyas-1999-' || a.id ELSE 'sarsembaev-ilyas-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Сарсембаев' AND first_name = 'Ильяс' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lyaukin-kirill-1999' AND s.athlete_id <> a.id)
              THEN 'lyaukin-kirill-1999-' || a.id ELSE 'lyaukin-kirill-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ляукин' AND first_name = 'Кирилл' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'mayer-oleg-2002' AND s.athlete_id <> a.id)
              THEN 'mayer-oleg-2002-' || a.id ELSE 'mayer-oleg-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Майер' AND first_name = 'Олег' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'molchanov-dianisiy-2005' AND s.athlete_id <> a.id)
              THEN 'molchanov-dianisiy-2005-' || a.id ELSE 'molchanov-dianisiy-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Молчанов' AND first_name = 'Дианисий' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'porcev-roman-1987' AND s.athlete_id <> a.id)
              THEN 'porcev-roman-1987-' || a.id ELSE 'porcev-roman-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Порцев' AND first_name = 'Роман' AND birth_year = 1987 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lyubimskiy-sergey-1992' AND s.athlete_id <> a.id)
              THEN 'lyubimskiy-sergey-1992-' || a.id ELSE 'lyubimskiy-sergey-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Любимский' AND first_name = 'Сергей' AND birth_year = 1992 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'dubel-aleksey-1990' AND s.athlete_id <> a.id)
              THEN 'dubel-aleksey-1990-' || a.id ELSE 'dubel-aleksey-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Дубель' AND first_name = 'Алексей' AND birth_year = 1990 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'alcybeev-nikita-2003' AND s.athlete_id <> a.id)
              THEN 'alcybeev-nikita-2003-' || a.id ELSE 'alcybeev-nikita-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Алцыбеев' AND first_name = 'Никита' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'borodynkin-oleg-2002' AND s.athlete_id <> a.id)
              THEN 'borodynkin-oleg-2002-' || a.id ELSE 'borodynkin-oleg-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бородынкин' AND first_name = 'Олег' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'chuev-pavel-1997' AND s.athlete_id <> a.id)
              THEN 'chuev-pavel-1997-' || a.id ELSE 'chuev-pavel-1997' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Чуев' AND first_name = 'Павел' AND birth_year = 1997 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'samochernov-ivan-1998' AND s.athlete_id <> a.id)
              THEN 'samochernov-ivan-1998-' || a.id ELSE 'samochernov-ivan-1998' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Самочернов' AND first_name = 'Иван' AND birth_year = 1998 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'rysnik-sergey-1995' AND s.athlete_id <> a.id)
              THEN 'rysnik-sergey-1995-' || a.id ELSE 'rysnik-sergey-1995' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Рысник' AND first_name = 'Сергей' AND birth_year = 1995 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lopin-ilya-2005' AND s.athlete_id <> a.id)
              THEN 'lopin-ilya-2005-' || a.id ELSE 'lopin-ilya-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Лопин' AND first_name = 'Илья' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'minullin-marsel-2000' AND s.athlete_id <> a.id)
              THEN 'minullin-marsel-2000-' || a.id ELSE 'minullin-marsel-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Минуллин' AND first_name = 'Марсель' AND birth_year = 2000 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'tyulenev-dmitriy-1985' AND s.athlete_id <> a.id)
              THEN 'tyulenev-dmitriy-1985-' || a.id ELSE 'tyulenev-dmitriy-1985' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Тюленев' AND first_name = 'Дмитрий' AND birth_year = 1985 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'efremov-sergey-1997' AND s.athlete_id <> a.id)
              THEN 'efremov-sergey-1997-' || a.id ELSE 'efremov-sergey-1997' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ефремов' AND first_name = 'Сергей' AND birth_year = 1997 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'vetrov-denis-1989' AND s.athlete_id <> a.id)
              THEN 'vetrov-denis-1989-' || a.id ELSE 'vetrov-denis-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ветров' AND first_name = 'Денис' AND birth_year = 1989 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kulakov-ivan-1998' AND s.athlete_id <> a.id)
              THEN 'kulakov-ivan-1998-' || a.id ELSE 'kulakov-ivan-1998' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кулаков' AND first_name = 'Иван' AND birth_year = 1998 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'cherkashin-ivan-1999' AND s.athlete_id <> a.id)
              THEN 'cherkashin-ivan-1999-' || a.id ELSE 'cherkashin-ivan-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Черкашин' AND first_name = 'Иван' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'klepikov-artem-1998' AND s.athlete_id <> a.id)
              THEN 'klepikov-artem-1998-' || a.id ELSE 'klepikov-artem-1998' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Клепиков' AND first_name = 'Артём' AND birth_year = 1998 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'seliverstov-semen-1989' AND s.athlete_id <> a.id)
              THEN 'seliverstov-semen-1989-' || a.id ELSE 'seliverstov-semen-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Селиверстов' AND first_name = 'Семен' AND birth_year = 1989 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kiryuhin-roman-1997' AND s.athlete_id <> a.id)
              THEN 'kiryuhin-roman-1997-' || a.id ELSE 'kiryuhin-roman-1997' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кирюхин' AND first_name = 'Роман' AND birth_year = 1997 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kudashev-denis-1988' AND s.athlete_id <> a.id)
              THEN 'kudashev-denis-1988-' || a.id ELSE 'kudashev-denis-1988' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кудашев' AND first_name = 'Денис' AND birth_year = 1988 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'nikolaev-arkadiy-2002' AND s.athlete_id <> a.id)
              THEN 'nikolaev-arkadiy-2002-' || a.id ELSE 'nikolaev-arkadiy-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Николаев' AND first_name = 'Аркадий' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'gurov-vladimir-1978' AND s.athlete_id <> a.id)
              THEN 'gurov-vladimir-1978-' || a.id ELSE 'gurov-vladimir-1978' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Гуров' AND first_name = 'Владимир' AND birth_year = 1978 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'muhitov-andrey-1999' AND s.athlete_id <> a.id)
              THEN 'muhitov-andrey-1999-' || a.id ELSE 'muhitov-andrey-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Мухитов' AND first_name = 'Андрей' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'balabanov-sergey-1996' AND s.athlete_id <> a.id)
              THEN 'balabanov-sergey-1996-' || a.id ELSE 'balabanov-sergey-1996' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Балабанов' AND first_name = 'Сергей' AND birth_year = 1996 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'shevelev-dmitriy-1989' AND s.athlete_id <> a.id)
              THEN 'shevelev-dmitriy-1989-' || a.id ELSE 'shevelev-dmitriy-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Шевелёв' AND first_name = 'Дмитрий' AND birth_year = 1989 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'stahanov-valentin-1990' AND s.athlete_id <> a.id)
              THEN 'stahanov-valentin-1990-' || a.id ELSE 'stahanov-valentin-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Стаханов' AND first_name = 'Валентин' AND birth_year = 1990 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'chirkov-leonid-2003' AND s.athlete_id <> a.id)
              THEN 'chirkov-leonid-2003-' || a.id ELSE 'chirkov-leonid-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Чирков' AND first_name = 'Леонид' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kalistratov-artem-1992' AND s.athlete_id <> a.id)
              THEN 'kalistratov-artem-1992-' || a.id ELSE 'kalistratov-artem-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Калистратов' AND first_name = 'Артем' AND birth_year = 1992 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kichimaev-nikolay-1987' AND s.athlete_id <> a.id)
              THEN 'kichimaev-nikolay-1987-' || a.id ELSE 'kichimaev-nikolay-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кичимаев' AND first_name = 'Николай' AND birth_year = 1987 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'iyulskiy-dmitriy-1993' AND s.athlete_id <> a.id)
              THEN 'iyulskiy-dmitriy-1993-' || a.id ELSE 'iyulskiy-dmitriy-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Июльский' AND first_name = 'Дмитрий' AND birth_year = 1993 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'yudin-dmitriy-1989' AND s.athlete_id <> a.id)
              THEN 'yudin-dmitriy-1989-' || a.id ELSE 'yudin-dmitriy-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Юдин' AND first_name = 'Дмитрий' AND birth_year = 1989 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'medvedev-nikolay-2006' AND s.athlete_id <> a.id)
              THEN 'medvedev-nikolay-2006-' || a.id ELSE 'medvedev-nikolay-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Медведев' AND first_name = 'Николай' AND birth_year = 2006 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zaharov-andrey-1993' AND s.athlete_id <> a.id)
              THEN 'zaharov-andrey-1993-' || a.id ELSE 'zaharov-andrey-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Захаров' AND first_name = 'Андрей' AND birth_year = 1993 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'butin-aleksey-1985' AND s.athlete_id <> a.id)
              THEN 'butin-aleksey-1985-' || a.id ELSE 'butin-aleksey-1985' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бутин' AND first_name = 'Алексей' AND birth_year = 1985 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'denisov-ivan-1982' AND s.athlete_id <> a.id)
              THEN 'denisov-ivan-1982-' || a.id ELSE 'denisov-ivan-1982' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Денисов' AND first_name = 'Иван' AND birth_year = 1982 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'verochkin-denis-1980' AND s.athlete_id <> a.id)
              THEN 'verochkin-denis-1980-' || a.id ELSE 'verochkin-denis-1980' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Верочкин' AND first_name = 'Денис' AND birth_year = 1980 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'trofimova-milena-2007' AND s.athlete_id <> a.id)
              THEN 'trofimova-milena-2007-' || a.id ELSE 'trofimova-milena-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Трофимова' AND first_name = 'Милена' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'prohorova-angelina-2005' AND s.athlete_id <> a.id)
              THEN 'prohorova-angelina-2005-' || a.id ELSE 'prohorova-angelina-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Прохорова' AND first_name = 'Ангелина' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'satlykova-elvira-2000' AND s.athlete_id <> a.id)
              THEN 'satlykova-elvira-2000-' || a.id ELSE 'satlykova-elvira-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Сатлыкова' AND first_name = 'Эльвира' AND birth_year = 2000 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lazareva-anastasiya-1991' AND s.athlete_id <> a.id)
              THEN 'lazareva-anastasiya-1991-' || a.id ELSE 'lazareva-anastasiya-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Лазарева' AND first_name = 'Анастасия' AND birth_year = 1991 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'semirunnyaya-aleksandra-2006' AND s.athlete_id <> a.id)
              THEN 'semirunnyaya-aleksandra-2006-' || a.id ELSE 'semirunnyaya-aleksandra-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Семирунняя' AND first_name = 'Александра' AND birth_year = 2006 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'belevich-elizaveta-2005' AND s.athlete_id <> a.id)
              THEN 'belevich-elizaveta-2005-' || a.id ELSE 'belevich-elizaveta-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Белевич' AND first_name = 'Елизавета' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'trofimova-alena-2001' AND s.athlete_id <> a.id)
              THEN 'trofimova-alena-2001-' || a.id ELSE 'trofimova-alena-2001' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Трофимова' AND first_name = 'Алена' AND birth_year = 2001 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'podolskaya-anastasiya-2005' AND s.athlete_id <> a.id)
              THEN 'podolskaya-anastasiya-2005-' || a.id ELSE 'podolskaya-anastasiya-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Подольская' AND first_name = 'Анастасия' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'barbakova-aleksandra-2004' AND s.athlete_id <> a.id)
              THEN 'barbakova-aleksandra-2004-' || a.id ELSE 'barbakova-aleksandra-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Барбакова' AND first_name = 'Александра' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'gavrilova-viktoriya-2003' AND s.athlete_id <> a.id)
              THEN 'gavrilova-viktoriya-2003-' || a.id ELSE 'gavrilova-viktoriya-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Гаврилова' AND first_name = 'Виктория' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'firuleva-vasilisa-2004' AND s.athlete_id <> a.id)
              THEN 'firuleva-vasilisa-2004-' || a.id ELSE 'firuleva-vasilisa-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Фирулева' AND first_name = 'Василиса' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'alyanova-viktoriya-2004' AND s.athlete_id <> a.id)
              THEN 'alyanova-viktoriya-2004-' || a.id ELSE 'alyanova-viktoriya-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Альянова' AND first_name = 'Виктория' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kutenkova-anastasiya-1997' AND s.athlete_id <> a.id)
              THEN 'kutenkova-anastasiya-1997-' || a.id ELSE 'kutenkova-anastasiya-1997' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кутенкова' AND first_name = 'Анастасия' AND birth_year = 1997 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'perepletova-yana-2009' AND s.athlete_id <> a.id)
              THEN 'perepletova-yana-2009-' || a.id ELSE 'perepletova-yana-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Переплетова' AND first_name = 'Яна' AND birth_year = 2009 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'karpushenko-ulyana-2002' AND s.athlete_id <> a.id)
              THEN 'karpushenko-ulyana-2002-' || a.id ELSE 'karpushenko-ulyana-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Карпушенко' AND first_name = 'Ульяна' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'voropaeva-viktoriya-2004' AND s.athlete_id <> a.id)
              THEN 'voropaeva-viktoriya-2004-' || a.id ELSE 'voropaeva-viktoriya-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Воропаева' AND first_name = 'Виктория' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'martynova-lyubov-2007' AND s.athlete_id <> a.id)
              THEN 'martynova-lyubov-2007-' || a.id ELSE 'martynova-lyubov-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Мартынова' AND first_name = 'Любовь' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'matveeva-elena-1974' AND s.athlete_id <> a.id)
              THEN 'matveeva-elena-1974-' || a.id ELSE 'matveeva-elena-1974' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Матвеева' AND first_name = 'Елена' AND birth_year = 1974 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'koshurnikova-anastasiya-2003' AND s.athlete_id <> a.id)
              THEN 'koshurnikova-anastasiya-2003-' || a.id ELSE 'koshurnikova-anastasiya-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кошурникова' AND first_name = 'Анастасия' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'elchaninova-veronika-2003' AND s.athlete_id <> a.id)
              THEN 'elchaninova-veronika-2003-' || a.id ELSE 'elchaninova-veronika-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ельчанинова' AND first_name = 'Вероника' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'basharova-viktoriya-1993' AND s.athlete_id <> a.id)
              THEN 'basharova-viktoriya-1993-' || a.id ELSE 'basharova-viktoriya-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Башарова' AND first_name = 'Виктория' AND birth_year = 1993 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'pohodyaeva-aleksandra-1990' AND s.athlete_id <> a.id)
              THEN 'pohodyaeva-aleksandra-1990-' || a.id ELSE 'pohodyaeva-aleksandra-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Походяева' AND first_name = 'Александра' AND birth_year = 1990 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kucanova-anastasiya-2006' AND s.athlete_id <> a.id)
              THEN 'kucanova-anastasiya-2006-' || a.id ELSE 'kucanova-anastasiya-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Куцанова' AND first_name = 'Анастасия' AND birth_year = 2006 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'martynova-irina-1999' AND s.athlete_id <> a.id)
              THEN 'martynova-irina-1999-' || a.id ELSE 'martynova-irina-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Мартынова' AND first_name = 'Ирина' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'polyakova-polina-1999' AND s.athlete_id <> a.id)
              THEN 'polyakova-polina-1999-' || a.id ELSE 'polyakova-polina-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Полякова' AND first_name = 'Полина' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'landina-alena-2006' AND s.athlete_id <> a.id)
              THEN 'landina-alena-2006-' || a.id ELSE 'landina-alena-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ландина' AND first_name = 'Алена' AND birth_year = 2006 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'vrubel-darya-2000' AND s.athlete_id <> a.id)
              THEN 'vrubel-darya-2000-' || a.id ELSE 'vrubel-darya-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Врубель' AND first_name = 'Дарья' AND birth_year = 2000 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kuzmicheva-kseniya-2004' AND s.athlete_id <> a.id)
              THEN 'kuzmicheva-kseniya-2004-' || a.id ELSE 'kuzmicheva-kseniya-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кузьмичева' AND first_name = 'Ксения' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'popova-mariya-2005' AND s.athlete_id <> a.id)
              THEN 'popova-mariya-2005-' || a.id ELSE 'popova-mariya-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Попова' AND first_name = 'Мария' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'badashkova-nina-1991' AND s.athlete_id <> a.id)
              THEN 'badashkova-nina-1991-' || a.id ELSE 'badashkova-nina-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бадашкова' AND first_name = 'Нина' AND birth_year = 1991 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'scherbina-dzhanita-1991' AND s.athlete_id <> a.id)
              THEN 'scherbina-dzhanita-1991-' || a.id ELSE 'scherbina-dzhanita-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Щербина' AND first_name = 'Джанита' AND birth_year = 1991 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zhura-aleksandra-1988' AND s.athlete_id <> a.id)
              THEN 'zhura-aleksandra-1988-' || a.id ELSE 'zhura-aleksandra-1988' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Жура' AND first_name = 'Александра' AND birth_year = 1988 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'belikova-olesya-2004' AND s.athlete_id <> a.id)
              THEN 'belikova-olesya-2004-' || a.id ELSE 'belikova-olesya-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Беликова' AND first_name = 'Олеся' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'mazhaeva-nataliya-1999' AND s.athlete_id <> a.id)
              THEN 'mazhaeva-nataliya-1999-' || a.id ELSE 'mazhaeva-nataliya-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Мажаева' AND first_name = 'Наталия' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'bahtova-irina-1999' AND s.athlete_id <> a.id)
              THEN 'bahtova-irina-1999-' || a.id ELSE 'bahtova-irina-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бахтова' AND first_name = 'Ирина' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'husnudinova-mariya-2004' AND s.athlete_id <> a.id)
              THEN 'husnudinova-mariya-2004-' || a.id ELSE 'husnudinova-mariya-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Хуснудинова' AND first_name = 'Мария' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'suhanova-anastasiya-2007' AND s.athlete_id <> a.id)
              THEN 'suhanova-anastasiya-2007-' || a.id ELSE 'suhanova-anastasiya-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Суханова' AND first_name = 'Анастасия' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'koptyaeva-karina-2007' AND s.athlete_id <> a.id)
              THEN 'koptyaeva-karina-2007-' || a.id ELSE 'koptyaeva-karina-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Коптяева' AND first_name = 'Карина' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'nynych-margarita-1996' AND s.athlete_id <> a.id)
              THEN 'nynych-margarita-1996-' || a.id ELSE 'nynych-margarita-1996' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ныныч' AND first_name = 'Маргарита' AND birth_year = 1996 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kozhevatova-vasilisa-2002' AND s.athlete_id <> a.id)
              THEN 'kozhevatova-vasilisa-2002-' || a.id ELSE 'kozhevatova-vasilisa-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кожеватова' AND first_name = 'Василиса' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'tarverdieva-mariya-1986' AND s.athlete_id <> a.id)
              THEN 'tarverdieva-mariya-1986-' || a.id ELSE 'tarverdieva-mariya-1986' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Тарвердиева' AND first_name = 'Мария' AND birth_year = 1986 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'stepanova-oksana-1990' AND s.athlete_id <> a.id)
              THEN 'stepanova-oksana-1990-' || a.id ELSE 'stepanova-oksana-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Степанова' AND first_name = 'Оксана' AND birth_year = 1990 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'dedyuhina-kseniya-1990' AND s.athlete_id <> a.id)
              THEN 'dedyuhina-kseniya-1990-' || a.id ELSE 'dedyuhina-kseniya-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Дедюхина' AND first_name = 'Ксения' AND birth_year = 1990 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'burmakina-ekaterina-2005' AND s.athlete_id <> a.id)
              THEN 'burmakina-ekaterina-2005-' || a.id ELSE 'burmakina-ekaterina-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бурмакина' AND first_name = 'Екатерина' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'micurina-oksana-1999' AND s.athlete_id <> a.id)
              THEN 'micurina-oksana-1999-' || a.id ELSE 'micurina-oksana-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Мицурина' AND first_name = 'Оксана' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'karpushenko-ulyana-2001' AND s.athlete_id <> a.id)
              THEN 'karpushenko-ulyana-2001-' || a.id ELSE 'karpushenko-ulyana-2001' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Карпушенко' AND first_name = 'Ульяна' AND birth_year = 2001 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sheveleva-olesya-2005' AND s.athlete_id <> a.id)
              THEN 'sheveleva-olesya-2005-' || a.id ELSE 'sheveleva-olesya-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Шевелева' AND first_name = 'Олеся' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sergeeva-yuliya-1980' AND s.athlete_id <> a.id)
              THEN 'sergeeva-yuliya-1980-' || a.id ELSE 'sergeeva-yuliya-1980' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Сергеева' AND first_name = 'Юлия' AND birth_year = 1980 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'shangina-svetlana-1973' AND s.athlete_id <> a.id)
              THEN 'shangina-svetlana-1973-' || a.id ELSE 'shangina-svetlana-1973' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Шангина' AND first_name = 'Светлана' AND birth_year = 1973 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'vorobeva-nadezhda-2000' AND s.athlete_id <> a.id)
              THEN 'vorobeva-nadezhda-2000-' || a.id ELSE 'vorobeva-nadezhda-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Воробьева' AND first_name = 'Надежда' AND birth_year = 2000 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'benidze-elizaveta-2002' AND s.athlete_id <> a.id)
              THEN 'benidze-elizaveta-2002-' || a.id ELSE 'benidze-elizaveta-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бенидзе' AND first_name = 'Елизавета' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'vaskina-alina-1999' AND s.athlete_id <> a.id)
              THEN 'vaskina-alina-1999-' || a.id ELSE 'vaskina-alina-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Васькина' AND first_name = 'Алина' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'barbakova-natalya-1984' AND s.athlete_id <> a.id)
              THEN 'barbakova-natalya-1984-' || a.id ELSE 'barbakova-natalya-1984' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Барбакова' AND first_name = 'Наталья' AND birth_year = 1984 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'firsa-anna-2003' AND s.athlete_id <> a.id)
              THEN 'firsa-anna-2003-' || a.id ELSE 'firsa-anna-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Фирса' AND first_name = 'Анна' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'boyko-kseniya-2005' AND s.athlete_id <> a.id)
              THEN 'boyko-kseniya-2005-' || a.id ELSE 'boyko-kseniya-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бойко' AND first_name = 'Ксения' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kaprina-natalya-1980' AND s.athlete_id <> a.id)
              THEN 'kaprina-natalya-1980-' || a.id ELSE 'kaprina-natalya-1980' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Каприна' AND first_name = 'Наталья' AND birth_year = 1980 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'karagaeva-kseniya-1999' AND s.athlete_id <> a.id)
              THEN 'karagaeva-kseniya-1999-' || a.id ELSE 'karagaeva-kseniya-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Карагаева' AND first_name = 'Ксения' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kuhareva-mariya-1989' AND s.athlete_id <> a.id)
              THEN 'kuhareva-mariya-1989-' || a.id ELSE 'kuhareva-mariya-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кухарева' AND first_name = 'Мария' AND birth_year = 1989 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ostrovskaya-nadezhda-1985' AND s.athlete_id <> a.id)
              THEN 'ostrovskaya-nadezhda-1985-' || a.id ELSE 'ostrovskaya-nadezhda-1985' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Островская' AND first_name = 'Надежда' AND birth_year = 1985 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'hodunova-irina-1985' AND s.athlete_id <> a.id)
              THEN 'hodunova-irina-1985-' || a.id ELSE 'hodunova-irina-1985' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ходунова' AND first_name = 'Ирина' AND birth_year = 1985 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'nasonova-viktoriya-1999' AND s.athlete_id <> a.id)
              THEN 'nasonova-viktoriya-1999-' || a.id ELSE 'nasonova-viktoriya-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Насонова' AND first_name = 'Виктория' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kopylova-regina-2001' AND s.athlete_id <> a.id)
              THEN 'kopylova-regina-2001-' || a.id ELSE 'kopylova-regina-2001' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Копылова' AND first_name = 'Регина' AND birth_year = 2001 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'alferova-valentina-1985' AND s.athlete_id <> a.id)
              THEN 'alferova-valentina-1985-' || a.id ELSE 'alferova-valentina-1985' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Алферова' AND first_name = 'Валентина' AND birth_year = 1985 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'derbeneva-olga-1970' AND s.athlete_id <> a.id)
              THEN 'derbeneva-olga-1970-' || a.id ELSE 'derbeneva-olga-1970' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Дербенева' AND first_name = 'Ольга' AND birth_year = 1970 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'benidze-dzhoni-1990' AND s.athlete_id <> a.id)
              THEN 'benidze-dzhoni-1990-' || a.id ELSE 'benidze-dzhoni-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бенидзе' AND first_name = 'Джони' AND birth_year = 1990 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'smagulov-nursultan-1999' AND s.athlete_id <> a.id)
              THEN 'smagulov-nursultan-1999-' || a.id ELSE 'smagulov-nursultan-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Смагулов' AND first_name = 'Нурсултан' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'hovalko-vasiliy-1993' AND s.athlete_id <> a.id)
              THEN 'hovalko-vasiliy-1993-' || a.id ELSE 'hovalko-vasiliy-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ховалко' AND first_name = 'Василий' AND birth_year = 1993 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'manakov-trofim-2000' AND s.athlete_id <> a.id)
              THEN 'manakov-trofim-2000-' || a.id ELSE 'manakov-trofim-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Манаков' AND first_name = 'Трофим' AND birth_year = 2000 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'karnauhov-nikita-2008' AND s.athlete_id <> a.id)
              THEN 'karnauhov-nikita-2008-' || a.id ELSE 'karnauhov-nikita-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Карнаухов' AND first_name = 'Никита' AND birth_year = 2008 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zuev-vladislav-2000' AND s.athlete_id <> a.id)
              THEN 'zuev-vladislav-2000-' || a.id ELSE 'zuev-vladislav-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Зуев' AND first_name = 'Владислав' AND birth_year = 2000 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'scherbin-oleg-1989' AND s.athlete_id <> a.id)
              THEN 'scherbin-oleg-1989-' || a.id ELSE 'scherbin-oleg-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Щербин' AND first_name = 'Олег' AND birth_year = 1989 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sharov-maksim-2000' AND s.athlete_id <> a.id)
              THEN 'sharov-maksim-2000-' || a.id ELSE 'sharov-maksim-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Шаров' AND first_name = 'Максим' AND birth_year = 2000 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'vasilevich-dobrynya-2000' AND s.athlete_id <> a.id)
              THEN 'vasilevich-dobrynya-2000-' || a.id ELSE 'vasilevich-dobrynya-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Василевич' AND first_name = 'Добрыня' AND birth_year = 2000 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'karnauhov-daniil-2001' AND s.athlete_id <> a.id)
              THEN 'karnauhov-daniil-2001-' || a.id ELSE 'karnauhov-daniil-2001' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Карнаухов' AND first_name = 'Даниил' AND birth_year = 2001 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'benidze-spartak-2002' AND s.athlete_id <> a.id)
              THEN 'benidze-spartak-2002-' || a.id ELSE 'benidze-spartak-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бенидзе' AND first_name = 'Спартак' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'aydbaev-ilfat-1989' AND s.athlete_id <> a.id)
              THEN 'aydbaev-ilfat-1989-' || a.id ELSE 'aydbaev-ilfat-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Айдбаев' AND first_name = 'Ильфат' AND birth_year = 1989 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'gromov-aleksey-1995' AND s.athlete_id <> a.id)
              THEN 'gromov-aleksey-1995-' || a.id ELSE 'gromov-aleksey-1995' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Громов' AND first_name = 'Алексей' AND birth_year = 1995 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'maskaykin-nikita-2002' AND s.athlete_id <> a.id)
              THEN 'maskaykin-nikita-2002-' || a.id ELSE 'maskaykin-nikita-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Маскайкин' AND first_name = 'Никита' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'rassadin-andrey-1989' AND s.athlete_id <> a.id)
              THEN 'rassadin-andrey-1989-' || a.id ELSE 'rassadin-andrey-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Рассадин' AND first_name = 'Андрей' AND birth_year = 1989 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'baranov-egor-1992' AND s.athlete_id <> a.id)
              THEN 'baranov-egor-1992-' || a.id ELSE 'baranov-egor-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Баранов' AND first_name = 'Егор' AND birth_year = 1992 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'baldin-aleksandr-1993' AND s.athlete_id <> a.id)
              THEN 'baldin-aleksandr-1993-' || a.id ELSE 'baldin-aleksandr-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Балдин' AND first_name = 'Александр' AND birth_year = 1993 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'suleymanov-movsar-1989' AND s.athlete_id <> a.id)
              THEN 'suleymanov-movsar-1989-' || a.id ELSE 'suleymanov-movsar-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Сулейманов' AND first_name = 'Мовсар' AND birth_year = 1989 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'maschenko-oleg-1983' AND s.athlete_id <> a.id)
              THEN 'maschenko-oleg-1983-' || a.id ELSE 'maschenko-oleg-1983' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Мащенко' AND first_name = 'Олег' AND birth_year = 1983 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'karagaev-yuriy-1994' AND s.athlete_id <> a.id)
              THEN 'karagaev-yuriy-1994-' || a.id ELSE 'karagaev-yuriy-1994' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Карагаев' AND first_name = 'Юрий' AND birth_year = 1994 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'panov-aleksey-1991' AND s.athlete_id <> a.id)
              THEN 'panov-aleksey-1991-' || a.id ELSE 'panov-aleksey-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Панов' AND first_name = 'Алексей' AND birth_year = 1991 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'voldaev-aleksandr-2000' AND s.athlete_id <> a.id)
              THEN 'voldaev-aleksandr-2000-' || a.id ELSE 'voldaev-aleksandr-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Волдаев' AND first_name = 'Александр' AND birth_year = 2000 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kozhevnikov-sergey-2008' AND s.athlete_id <> a.id)
              THEN 'kozhevnikov-sergey-2008-' || a.id ELSE 'kozhevnikov-sergey-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кожевников' AND first_name = 'Сергей' AND birth_year = 2008 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'garifullin-konstantin-1999' AND s.athlete_id <> a.id)
              THEN 'garifullin-konstantin-1999-' || a.id ELSE 'garifullin-konstantin-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Гарифуллин' AND first_name = 'Константин' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'burkov-yuriy-1987' AND s.athlete_id <> a.id)
              THEN 'burkov-yuriy-1987-' || a.id ELSE 'burkov-yuriy-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бурков' AND first_name = 'Юрий' AND birth_year = 1987 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'choynzhurov-leonid-2004' AND s.athlete_id <> a.id)
              THEN 'choynzhurov-leonid-2004-' || a.id ELSE 'choynzhurov-leonid-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Чойнжуров' AND first_name = 'Леонид' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kvashnin-mihail-1988' AND s.athlete_id <> a.id)
              THEN 'kvashnin-mihail-1988-' || a.id ELSE 'kvashnin-mihail-1988' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Квашнин' AND first_name = 'Михаил' AND birth_year = 1988 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'tashlanov-ilya-1987' AND s.athlete_id <> a.id)
              THEN 'tashlanov-ilya-1987-' || a.id ELSE 'tashlanov-ilya-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ташланов' AND first_name = 'Илья' AND birth_year = 1987 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ivanov-aleksey-1995' AND s.athlete_id <> a.id)
              THEN 'ivanov-aleksey-1995-' || a.id ELSE 'ivanov-aleksey-1995' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Алексей' AND birth_year = 1995 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'stepanov-sergey-1993' AND s.athlete_id <> a.id)
              THEN 'stepanov-sergey-1993-' || a.id ELSE 'stepanov-sergey-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Степанов' AND first_name = 'Сергей' AND birth_year = 1993 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ivanov-vitaliy-1978' AND s.athlete_id <> a.id)
              THEN 'ivanov-vitaliy-1978-' || a.id ELSE 'ivanov-vitaliy-1978' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Виталий' AND birth_year = 1978 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'serebryakov-aleksandr-1991' AND s.athlete_id <> a.id)
              THEN 'serebryakov-aleksandr-1991-' || a.id ELSE 'serebryakov-aleksandr-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Серебряков' AND first_name = 'Александр' AND birth_year = 1991 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'alekseev-radif-1989' AND s.athlete_id <> a.id)
              THEN 'alekseev-radif-1989-' || a.id ELSE 'alekseev-radif-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Алексеев' AND first_name = 'Радиф' AND birth_year = 1989 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lade-roman-1991' AND s.athlete_id <> a.id)
              THEN 'lade-roman-1991-' || a.id ELSE 'lade-roman-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ладе' AND first_name = 'Роман' AND birth_year = 1991 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kodirov-abdumaruf-2000' AND s.athlete_id <> a.id)
              THEN 'kodirov-abdumaruf-2000-' || a.id ELSE 'kodirov-abdumaruf-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кодиров' AND first_name = 'Абдумаъруф' AND birth_year = 2000 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'cherkashin-dmitriy-1999' AND s.athlete_id <> a.id)
              THEN 'cherkashin-dmitriy-1999-' || a.id ELSE 'cherkashin-dmitriy-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Черкашин' AND first_name = 'Дмитрий' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'plotnikov-vyacheslav-1998' AND s.athlete_id <> a.id)
              THEN 'plotnikov-vyacheslav-1998-' || a.id ELSE 'plotnikov-vyacheslav-1998' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Плотников' AND first_name = 'Вячеслав' AND birth_year = 1998 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'malikov-danil-2001' AND s.athlete_id <> a.id)
              THEN 'malikov-danil-2001-' || a.id ELSE 'malikov-danil-2001' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Маликов' AND first_name = 'Данил' AND birth_year = 2001 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'shilyaev-ivan-1996' AND s.athlete_id <> a.id)
              THEN 'shilyaev-ivan-1996-' || a.id ELSE 'shilyaev-ivan-1996' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Шиляев' AND first_name = 'Иван' AND birth_year = 1996 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'brevnov-evgeniy-1974' AND s.athlete_id <> a.id)
              THEN 'brevnov-evgeniy-1974-' || a.id ELSE 'brevnov-evgeniy-1974' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бревнов' AND first_name = 'Евгений' AND birth_year = 1974 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'minibaev-alzaf-1987' AND s.athlete_id <> a.id)
              THEN 'minibaev-alzaf-1987-' || a.id ELSE 'minibaev-alzaf-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Минибаев' AND first_name = 'Альзаф' AND birth_year = 1987 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'krestyaninov-viktor-2000' AND s.athlete_id <> a.id)
              THEN 'krestyaninov-viktor-2000-' || a.id ELSE 'krestyaninov-viktor-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Крестьянинов' AND first_name = 'Виктор' AND birth_year = 2000 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lavrikov-vyacheslav-2005' AND s.athlete_id <> a.id)
              THEN 'lavrikov-vyacheslav-2005-' || a.id ELSE 'lavrikov-vyacheslav-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Лавриков' AND first_name = 'Вячеслав' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'markov-ivan-1995' AND s.athlete_id <> a.id)
              THEN 'markov-ivan-1995-' || a.id ELSE 'markov-ivan-1995' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Марков' AND first_name = 'Иван' AND birth_year = 1995 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'rozmaznin-ilya-2000' AND s.athlete_id <> a.id)
              THEN 'rozmaznin-ilya-2000-' || a.id ELSE 'rozmaznin-ilya-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Розмазнин' AND first_name = 'Илья' AND birth_year = 2000 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'orlov-sergey-2005' AND s.athlete_id <> a.id)
              THEN 'orlov-sergey-2005-' || a.id ELSE 'orlov-sergey-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Орлов' AND first_name = 'Сергей' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'shendo-nikita-1998' AND s.athlete_id <> a.id)
              THEN 'shendo-nikita-1998-' || a.id ELSE 'shendo-nikita-1998' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Шендо' AND first_name = 'Никита' AND birth_year = 1998 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'shabunin-nikita-2001' AND s.athlete_id <> a.id)
              THEN 'shabunin-nikita-2001-' || a.id ELSE 'shabunin-nikita-2001' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Шабунин' AND first_name = 'Никита' AND birth_year = 2001 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'timushev-oleg-1990' AND s.athlete_id <> a.id)
              THEN 'timushev-oleg-1990-' || a.id ELSE 'timushev-oleg-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Тимушев' AND first_name = 'Олег' AND birth_year = 1990 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'yurastov-stanislav-1983' AND s.athlete_id <> a.id)
              THEN 'yurastov-stanislav-1983-' || a.id ELSE 'yurastov-stanislav-1983' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Юрастов' AND first_name = 'Станислав' AND birth_year = 1983 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'filippov-maksim-1993' AND s.athlete_id <> a.id)
              THEN 'filippov-maksim-1993-' || a.id ELSE 'filippov-maksim-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Филиппов' AND first_name = 'Максим' AND birth_year = 1993 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'piven-andrey-2003' AND s.athlete_id <> a.id)
              THEN 'piven-andrey-2003-' || a.id ELSE 'piven-andrey-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Пивень' AND first_name = 'Андрей' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'buldakov-nikita-1997' AND s.athlete_id <> a.id)
              THEN 'buldakov-nikita-1997-' || a.id ELSE 'buldakov-nikita-1997' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Булдаков' AND first_name = 'Никита' AND birth_year = 1997 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zhitihin-vladislav-1994' AND s.athlete_id <> a.id)
              THEN 'zhitihin-vladislav-1994-' || a.id ELSE 'zhitihin-vladislav-1994' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Житихин' AND first_name = 'Владислав' AND birth_year = 1994 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'turischev-dmitriy-1992' AND s.athlete_id <> a.id)
              THEN 'turischev-dmitriy-1992-' || a.id ELSE 'turischev-dmitriy-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Турищев' AND first_name = 'Дмитрий' AND birth_year = 1992 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'spichkin-aleksey-1994' AND s.athlete_id <> a.id)
              THEN 'spichkin-aleksey-1994-' || a.id ELSE 'spichkin-aleksey-1994' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Спичкин' AND first_name = 'Алексей' AND birth_year = 1994 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kurdyukov-vasiliy-1997' AND s.athlete_id <> a.id)
              THEN 'kurdyukov-vasiliy-1997-' || a.id ELSE 'kurdyukov-vasiliy-1997' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Курдюков' AND first_name = 'Василий' AND birth_year = 1997 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'bardin-maksim-1990' AND s.athlete_id <> a.id)
              THEN 'bardin-maksim-1990-' || a.id ELSE 'bardin-maksim-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бардин' AND first_name = 'Максим' AND birth_year = 1990 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);

INSERT INTO results (id, category_id, athlete_id, place, total_reps, points, body_weight_kg, rank_achieved_id, discipline_id, bell_kg, hands, time_limit_min, competition_id, event_date, raw_name, raw_club, raw_region, protocol_id, source_page) VALUES
  (2001, 2001, (SELECT id FROM athletes WHERE last_name = 'Бутенко' AND first_name = 'Евгений' AND birth_year = 1995 LIMIT 1), 1, 76, NULL, 62.7, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Бутенко Евгений', '-', 'Новосибирская область', 2001, NULL),
  (2002, 2001, (SELECT id FROM athletes WHERE last_name = 'Недорезов' AND first_name = 'Василий' AND birth_year = 1992 LIMIT 1), 2, 59, NULL, 62.6, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Недорезов Василий', 'ВС', 'Республика Бурятия', 2001, NULL),
  (2003, 2001, (SELECT id FROM athletes WHERE last_name = 'Руднев' AND first_name = 'Руслан' AND birth_year = 1994 LIMIT 1), 3, 56, NULL, 61.8, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Руднев Руслан', '-', 'г. Санкт-Петербург', 2001, NULL),
  (2004, 2001, (SELECT id FROM athletes WHERE last_name = 'Якушев' AND first_name = 'Роман' AND birth_year = 2002 LIMIT 1), 4, 54, NULL, 63.0, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Якушев Роман', 'ВС', 'Республика Бурятия', 2001, NULL),
  (2005, 2001, (SELECT id FROM athletes WHERE last_name = 'Курунов' AND first_name = 'Анатолий' AND birth_year = 1999 LIMIT 1), 5, 50, NULL, 62.55, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Курунов Анатолий', 'СШ №1 им. Л.Д. Ковалевского', 'Оренбургская область', 2001, NULL),
  (2006, 2001, (SELECT id FROM athletes WHERE last_name = 'Захаров' AND first_name = 'Кирилл' AND birth_year = 2007 LIMIT 1), 6, 45, NULL, 61.85, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Захаров Кирилл', '-', 'Новосибирская область', 2001, NULL),
  (2007, 2001, (SELECT id FROM athletes WHERE last_name = 'Черепанов' AND first_name = 'Антон' AND birth_year = 2003 LIMIT 1), 7, 44, NULL, 62.95, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Черепанов Антон', 'СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 2001, NULL),
  (2008, 2001, (SELECT id FROM athletes WHERE last_name = 'Жбанов' AND first_name = 'Алексей' AND birth_year = 1986 LIMIT 1), 8, 40, NULL, 63.0, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Жбанов Алексей', 'СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 2001, NULL),
  (2009, 2001, (SELECT id FROM athletes WHERE last_name = 'Тананин' AND first_name = 'Вячеслав' AND birth_year = 1997 LIMIT 1), 9, 37, NULL, 62.75, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Тананин Вячеслав', 'МБУ ДО СШ «Зенит»', 'ЯНАО', 2001, NULL),
  (2010, 2001, (SELECT id FROM athletes WHERE last_name = 'Ильясов' AND first_name = 'Какен' AND birth_year = 1993 LIMIT 1), 10, 36, NULL, 63.0, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Ильясов Какен', 'ВС', 'Омская область', 2001, NULL),
  (2011, 2001, (SELECT id FROM athletes WHERE last_name = 'Цвик' AND first_name = 'Данил' AND birth_year = 2003 LIMIT 1), 11, 29, NULL, 63.0, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Цвик Данил', 'КСШ №1/ВС', 'Смоленская область', 2001, NULL),
  (2012, 2001, (SELECT id FROM athletes WHERE last_name = 'Козин' AND first_name = 'Егор' AND birth_year = 2006 LIMIT 1), 12, 23, NULL, 62.55, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Козин Егор', '-', 'Республика Бурятия', 2001, NULL),
  (2013, 2001, (SELECT id FROM athletes WHERE last_name = 'Половников' AND first_name = 'Павел' AND birth_year = 2002 LIMIT 1), 13, 20, NULL, 59.58, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Половников Павел', 'МБУ ДО «ДЮСШ «Спарт»', 'Пермский край', 2001, NULL),
  (2014, 2001, (SELECT id FROM athletes WHERE last_name = 'Останин' AND first_name = 'Даниил' AND birth_year = 2005 LIMIT 1), 14, 8, NULL, 55.9, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Останин Даниил', 'ДО ДС ДЮ «Прикамье»', 'Пермский край', 2001, NULL),
  (2015, 2002, (SELECT id FROM athletes WHERE last_name = 'Морозович' AND first_name = 'Владислав' AND birth_year = 1999 LIMIT 1), 1, 76, NULL, 67.85, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Морозович Владислав', '-', 'Омская область', 2001, NULL),
  (2016, 2002, (SELECT id FROM athletes WHERE last_name = 'Рябков' AND first_name = 'Алексей' AND birth_year = 1993 LIMIT 1), 2, 74, NULL, 68.0, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Рябков Алексей', '-', 'ХМАО-Югра', 2001, NULL),
  (2017, 2002, (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Евгений' AND birth_year = 1997 LIMIT 1), 3, 66, NULL, 67.8, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Иванов Евгений', 'КСШ №1/ ВС', 'Смоленская область', 2001, NULL),
  (2018, 2002, (SELECT id FROM athletes WHERE last_name = 'Усольцев' AND first_name = 'Александр' AND birth_year = 1992 LIMIT 1), 4, 65, NULL, 67.6, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Усольцев Александр', 'КСК «Факел»', 'ЯНАО', 2001, NULL),
  (2019, 2002, (SELECT id FROM athletes WHERE last_name = 'Сергеев' AND first_name = 'Алексей' AND birth_year = 2001 LIMIT 1), 5, 60, NULL, 67.4, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Сергеев Алексей', '-', 'ХМАО-Югра', 2001, NULL),
  (2020, 2002, (SELECT id FROM athletes WHERE last_name = 'Новоселов' AND first_name = 'Андрей' AND birth_year = 2004 LIMIT 1), 6, 37, NULL, 68.0, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Новоселов Андрей', 'КОГАУ «СШОР «Юность»', 'Кировская область', 2001, NULL),
  (2021, 2002, (SELECT id FROM athletes WHERE last_name = 'Куликов' AND first_name = 'Сергей' AND birth_year = 1985 LIMIT 1), 7, 33, NULL, 65.45, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Куликов Сергей', '-', 'Новосибирская область', 2001, NULL),
  (2022, 2003, (SELECT id FROM athletes WHERE last_name = 'Беляев' AND first_name = 'Иван' AND birth_year = 1992 LIMIT 1), 1, 82, NULL, 72.5, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Беляев Иван', '-', 'ХМАО-Югра', 2001, NULL),
  (2023, 2003, (SELECT id FROM athletes WHERE last_name = 'Каргин' AND first_name = 'Сергей' AND birth_year = 1998 LIMIT 1), 2, 74, NULL, 72.7, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Каргин Сергей', 'ВС', 'Республика Бурятия', 2001, NULL),
  (2024, 2003, (SELECT id FROM athletes WHERE last_name = 'Коломин' AND first_name = 'Дмитрий' AND birth_year = 1999 LIMIT 1), 3, 65, NULL, 71.7, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Коломин Дмитрий', 'ВС', 'Республика Бурятия', 2001, NULL),
  (2025, 2003, (SELECT id FROM athletes WHERE last_name = 'Баев' AND first_name = 'Константин' AND birth_year = 1993 LIMIT 1), 4, 62, NULL, 72.8, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Баев Константин', 'МАУ ДО СШ  "Геолог"', 'ЯНАО', 2001, NULL),
  (2026, 2003, (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Евгений' AND birth_year = 1987 LIMIT 1), 5, 60, NULL, 72.5, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Иванов Евгений', '-', 'Томская область', 2001, NULL),
  (2027, 2003, (SELECT id FROM athletes WHERE last_name = 'Голиков' AND first_name = 'Роман' AND birth_year = 1990 LIMIT 1), 6, 58, NULL, 69.9, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Голиков Роман', '-', 'Красноярский край', 2001, NULL),
  (2028, 2003, (SELECT id FROM athletes WHERE last_name = 'Оленов' AND first_name = 'Владимир' AND birth_year = 1991 LIMIT 1), 7, 48, NULL, 72.75, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Оленов Владимир', '-', 'Республика Саха (Якутия)', 2001, NULL),
  (2029, 2003, (SELECT id FROM athletes WHERE last_name = 'Рожин' AND first_name = 'Егор' AND birth_year = 1987 LIMIT 1), 8, 36, NULL, 73.0, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Рожин Егор', '-', 'Республика Саха (Якутия)', 2001, NULL),
  (2030, 2003, (SELECT id FROM athletes WHERE last_name = 'Васин' AND first_name = 'Артем' AND birth_year = 2007 LIMIT 1), 9, 35, NULL, 72.15, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Васин Артем', 'СШОР "Маршал"', 'Калужская область', 2001, NULL),
  (2031, 2004, (SELECT id FROM athletes WHERE last_name = 'Сарсембаев' AND first_name = 'Ильяс' AND birth_year = 1999 LIMIT 1), 1, 79, NULL, 77.45, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Сарсембаев Ильяс', 'МБУ ДО СШ «Зенит»', 'ЯНАО', 2001, NULL),
  (2032, 2004, (SELECT id FROM athletes WHERE last_name = 'Ляукин' AND first_name = 'Кирилл' AND birth_year = 1999 LIMIT 1), 2, 77, NULL, 77.65, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Ляукин Кирилл', 'РОО «ФГС РТ»', 'Республика Татарстан', 2001, NULL),
  (2033, 2004, (SELECT id FROM athletes WHERE last_name = 'Майер' AND first_name = 'Олег' AND birth_year = 2002 LIMIT 1), 3, 77, NULL, 77.75, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Майер Олег', 'ВС', 'Тюменская область', 2001, NULL),
  (2034, 2004, (SELECT id FROM athletes WHERE last_name = 'Молчанов' AND first_name = 'Дианисий' AND birth_year = 2005 LIMIT 1), 4, 76, NULL, 77.2, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Молчанов Дианисий', 'СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 2001, NULL),
  (2035, 2004, (SELECT id FROM athletes WHERE last_name = 'Порцев' AND first_name = 'Роман' AND birth_year = 1987 LIMIT 1), 5, 74, NULL, 76.85, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Порцев Роман', 'ДО ДС ДЮ «Прикамье»', 'Пермский край', 2001, NULL),
  (2036, 2004, (SELECT id FROM athletes WHERE last_name = 'Любимский' AND first_name = 'Сергей' AND birth_year = 1992 LIMIT 1), 6, 70, NULL, 77.4, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Любимский Сергей', 'ВС', 'Республика Бурятия', 2001, NULL),
  (2037, 2004, (SELECT id FROM athletes WHERE last_name = 'Дубель' AND first_name = 'Алексей' AND birth_year = 1990 LIMIT 1), 7, 63, NULL, 77.95, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Дубель Алексей', '', 'Курганская область', 2001, NULL),
  (2038, 2004, (SELECT id FROM athletes WHERE last_name = 'Алцыбеев' AND first_name = 'Никита' AND birth_year = 2003 LIMIT 1), 8, 38, NULL, 78.0, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Алцыбеев Никита', 'КОГАУ «СШОР «Юность»', 'Кировская область', 2001, NULL),
  (2039, 2005, (SELECT id FROM athletes WHERE last_name = 'Бородынкин' AND first_name = 'Олег' AND birth_year = 2002 LIMIT 1), 1, 87, NULL, 84.7, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Бородынкин Олег', '', 'Новосибирская область', 2001, NULL),
  (2040, 2005, (SELECT id FROM athletes WHERE last_name = 'Чуев' AND first_name = 'Павел' AND birth_year = 1997 LIMIT 1), 2, 85, NULL, 84.9, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Чуев Павел', 'СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 2001, NULL),
  (2041, 2005, (SELECT id FROM athletes WHERE last_name = 'Самочернов' AND first_name = 'Иван' AND birth_year = 1998 LIMIT 1), 3, 78, NULL, 84.45, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Самочернов Иван ', '', 'Курганская область', 2001, NULL),
  (2042, 2005, (SELECT id FROM athletes WHERE last_name = 'Рысник' AND first_name = 'Сергей' AND birth_year = 1995 LIMIT 1), 4, 66, NULL, 84.85, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Рысник Сергей', 'ВС', 'Омская область', 2001, NULL),
  (2043, 2005, (SELECT id FROM athletes WHERE last_name = 'Лопин' AND first_name = 'Илья' AND birth_year = 2005 LIMIT 1), 5, 65, NULL, 79.3, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Лопин Илья', '', 'Ростовская область', 2001, NULL),
  (2044, 2005, (SELECT id FROM athletes WHERE last_name = 'Минуллин' AND first_name = 'Марсель' AND birth_year = 2000 LIMIT 1), 6, 60, NULL, 82.75, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Минуллин Марсель', '', 'Омская область', 2001, NULL),
  (2045, 2005, (SELECT id FROM athletes WHERE last_name = 'Тюленев' AND first_name = 'Дмитрий' AND birth_year = 1985 LIMIT 1), 7, 47, NULL, 81.35, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Тюленев Дмитрий', '', 'Кемеровская область', 2001, NULL),
  (2046, 2005, (SELECT id FROM athletes WHERE last_name = 'Ефремов' AND first_name = 'Сергей' AND birth_year = 1997 LIMIT 1), 8, 44, NULL, 84.3, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Ефремов  Сергей', '', 'Новосибирская область', 2001, NULL),
  (2047, 2005, (SELECT id FROM athletes WHERE last_name = 'Ветров' AND first_name = 'Денис' AND birth_year = 1989 LIMIT 1), 9, 35, NULL, 84.45, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Ветров Денис ', '', 'г. Москва', 2001, NULL),
  (2048, 2006, (SELECT id FROM athletes WHERE last_name = 'Кулаков' AND first_name = 'Иван' AND birth_year = 1998 LIMIT 1), 1, 100, NULL, 94.05, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Кулаков Иван ', 'ДДЮ «Алые Паруса»', 'Рязанская область', 2001, NULL),
  (2049, 2006, (SELECT id FROM athletes WHERE last_name = 'Черкашин' AND first_name = 'Иван' AND birth_year = 1999 LIMIT 1), 2, 82, NULL, 92.5, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Черкашин Иван ', '', 'Томская область', 2001, NULL),
  (2050, 2006, (SELECT id FROM athletes WHERE last_name = 'Клепиков' AND first_name = 'Артём' AND birth_year = 1998 LIMIT 1), 3, 81, NULL, 91.1, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Клепиков Артём', 'КОГАУ «СШОР «Юность»', 'Кировская область', 2001, NULL),
  (2051, 2006, (SELECT id FROM athletes WHERE last_name = 'Селиверстов' AND first_name = 'Семен' AND birth_year = 1989 LIMIT 1), 4, 74, NULL, 85.2, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Селиверстов Семен ', 'СШОР "Олимп"', 'Челябинская область ', 2001, NULL),
  (2052, 2006, (SELECT id FROM athletes WHERE last_name = 'Кирюхин' AND first_name = 'Роман' AND birth_year = 1997 LIMIT 1), 5, 73, NULL, 93.7, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Кирюхин Роман', '', 'г. Москва', 2001, NULL),
  (2053, 2006, (SELECT id FROM athletes WHERE last_name = 'Кудашев' AND first_name = 'Денис' AND birth_year = 1988 LIMIT 1), 6, 71, NULL, 92.45, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Кудашев Денис', 'ВС', 'Республика Бурятия', 2001, NULL),
  (2054, 2006, (SELECT id FROM athletes WHERE last_name = 'Николаев' AND first_name = 'Аркадий' AND birth_year = 2002 LIMIT 1), 7, 65, NULL, 86.9, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Николаев Аркадий ', '', 'ХМАО-Югра', 2001, NULL),
  (2055, 2006, (SELECT id FROM athletes WHERE last_name = 'Гуров' AND first_name = 'Владимир' AND birth_year = 1978 LIMIT 1), 8, 55, NULL, 93.1, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Гуров Владимир', 'СШОР "Маршал"', 'Калужская область', 2001, NULL),
  (2056, 2006, (SELECT id FROM athletes WHERE last_name = 'Мухитов' AND first_name = 'Андрей' AND birth_year = 1999 LIMIT 1), 9, 52, NULL, 91.25, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Мухитов Андрей', 'Профсоюзы', 'Брянская область', 2001, NULL),
  (2057, 2007, (SELECT id FROM athletes WHERE last_name = 'Балабанов' AND first_name = 'Сергей' AND birth_year = 1996 LIMIT 1), 1, 90, NULL, 102.55, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Балабанов Сергей', '', 'Республика Бурятия', 2001, NULL),
  (2058, 2007, (SELECT id FROM athletes WHERE last_name = 'Шевелёв' AND first_name = 'Дмитрий' AND birth_year = 1989 LIMIT 1), 2, 81, NULL, 116.35, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Шевелёв Дмитрий ', '', 'Новосибирская область', 2001, NULL),
  (2059, 2007, (SELECT id FROM athletes WHERE last_name = 'Стаханов' AND first_name = 'Валентин' AND birth_year = 1990 LIMIT 1), 3, 80, NULL, 95.1, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Стаханов Валентин', 'ВС', 'Омская область', 2001, NULL),
  (2060, 2007, (SELECT id FROM athletes WHERE last_name = 'Чирков' AND first_name = 'Леонид' AND birth_year = 2003 LIMIT 1), 4, 75, NULL, 112.65, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Чирков Леонид', '', 'Калужская область', 2001, NULL),
  (2061, 2007, (SELECT id FROM athletes WHERE last_name = 'Калистратов' AND first_name = 'Артем' AND birth_year = 1992 LIMIT 1), 5, 71, NULL, 104.7, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Калистратов Артем ', 'КСШ №1 /ВС', 'Смоленская область', 2001, NULL),
  (2062, 2007, (SELECT id FROM athletes WHERE last_name = 'Кичимаев' AND first_name = 'Николай' AND birth_year = 1987 LIMIT 1), 6, 64, NULL, 109.75, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Кичимаев Николай', 'СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 2001, NULL),
  (2063, 2007, (SELECT id FROM athletes WHERE last_name = 'Июльский' AND first_name = 'Дмитрий' AND birth_year = 1993 LIMIT 1), 7, 64, NULL, 111.3, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Июльский Дмитрий ', '', 'г. Москва', 2001, NULL),
  (2064, 2007, (SELECT id FROM athletes WHERE last_name = 'Юдин' AND first_name = 'Дмитрий' AND birth_year = 1989 LIMIT 1), 8, 61, NULL, 114.8, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Юдин Дмитрий', 'МБУ ДО СШ  «Уренгоец»', 'ЯНАО', 2001, NULL),
  (2065, 2007, (SELECT id FROM athletes WHERE last_name = 'Медведев' AND first_name = 'Николай' AND birth_year = 2006 LIMIT 1), 9, 58, NULL, 108.75, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Медведев Николай', '', 'Ростовская область', 2001, NULL),
  (2066, 2007, (SELECT id FROM athletes WHERE last_name = 'Захаров' AND first_name = 'Андрей' AND birth_year = 1993 LIMIT 1), 10, 53, NULL, 98.75, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Захаров Андрей', '', 'Новосибирская область', 2001, NULL),
  (2067, 2007, (SELECT id FROM athletes WHERE last_name = 'Бутин' AND first_name = 'Алексей' AND birth_year = 1985 LIMIT 1), 11, 41, NULL, 101.85, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Бутин Алексей ', '', 'Красноярский край', 2001, NULL),
  (2068, 2007, (SELECT id FROM athletes WHERE last_name = 'Денисов' AND first_name = 'Иван' AND birth_year = 1982 LIMIT 1), 12, 32, NULL, 113.05, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Денисов Иван ', 'СШОР "Атлет"', 'Челябинская область ', 2001, NULL),
  (2069, 2007, (SELECT id FROM athletes WHERE last_name = 'Верочкин' AND first_name = 'Денис' AND birth_year = 1980 LIMIT 1), 13, 31, NULL, 108.65, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 2001, '2024-06-13', 'Верочкин Денис', '"Динамо"', 'Иркутская область', 2001, NULL),
  (2070, 2008, (SELECT id FROM athletes WHERE last_name = 'Трофимова' AND first_name = 'Милена' AND birth_year = 2007 LIMIT 1), 1, 59, NULL, 57.44, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 2001, '2024-06-13', 'Трофимова Милена', 'СШОР "Маршал"', 'Калужская область', 2001, NULL),
  (2071, 2008, (SELECT id FROM athletes WHERE last_name = 'Прохорова' AND first_name = 'Ангелина' AND birth_year = 2005 LIMIT 1), 2, 53, NULL, 55.44, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 2001, '2024-06-13', 'Прохорова  Ангелина', '', 'Новосибирская область', 2001, NULL),
  (2072, 2008, (SELECT id FROM athletes WHERE last_name = 'Сатлыкова' AND first_name = 'Эльвира' AND birth_year = 2000 LIMIT 1), 3, 52, NULL, 58.0, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 2001, '2024-06-13', 'Сатлыкова Эльвира', 'СШ №1 им. Л.Д. Ковалевского', 'Оренбургская область', 2001, NULL),
  (2073, 2008, (SELECT id FROM athletes WHERE last_name = 'Лазарева' AND first_name = 'Анастасия' AND birth_year = 1991 LIMIT 1), 4, 46, NULL, 54.82, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 2001, '2024-06-13', 'Лазарева Анастасия', 'СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 2001, NULL),
  (2074, 2008, (SELECT id FROM athletes WHERE last_name = 'Семирунняя' AND first_name = 'Александра' AND birth_year = 2006 LIMIT 1), 5, 28, NULL, 52.28, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 2001, '2024-06-13', 'Семирунняя Александра', '', 'Ростовская область', 2001, NULL),
  (2075, 2008, (SELECT id FROM athletes WHERE last_name = 'Белевич' AND first_name = 'Елизавета' AND birth_year = 2005 LIMIT 1), 6, 21, NULL, 57.35, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 2001, '2024-06-13', 'Белевич Елизавета ', 'ДСО "Урожай"', 'Свердловская область', 2001, NULL),
  (2076, 2008, (SELECT id FROM athletes WHERE last_name = 'Трофимова' AND first_name = 'Алена' AND birth_year = 2001 LIMIT 1), 7, 14, NULL, 55.44, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 2001, '2024-06-13', 'Трофимова  Алена ', '', 'ХМАО-Югра', 2001, NULL),
  (2077, 2008, (SELECT id FROM athletes WHERE last_name = 'Подольская' AND first_name = 'Анастасия' AND birth_year = 2005 LIMIT 1), 8, 14, NULL, 56.88, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 2001, '2024-06-13', 'Подольская Анастасия ', '', 'г. Москва', 2001, NULL),
  (2078, 2009, (SELECT id FROM athletes WHERE last_name = 'Барбакова' AND first_name = 'Александра' AND birth_year = 2004 LIMIT 1), 1, 68, NULL, 58.66, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 2001, '2024-06-13', 'Барбакова Александра', 'СШОР "Маршал"', 'Калужская область', 2001, NULL),
  (2079, 2009, (SELECT id FROM athletes WHERE last_name = 'Гаврилова' AND first_name = 'Виктория' AND birth_year = 2003 LIMIT 1), 2, 40, NULL, 61.95, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 2001, '2024-06-13', 'Гаврилова Виктория', '', 'Ярославская область', 2001, NULL),
  (2080, 2009, (SELECT id FROM athletes WHERE last_name = 'Фирулева' AND first_name = 'Василиса' AND birth_year = 2004 LIMIT 1), 3, 39, NULL, 61.7, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 2001, '2024-06-13', 'Фирулева Василиса', 'МБУ ДО СШ «Уренгоец»', 'ЯНАО', 2001, NULL),
  (2081, 2009, (SELECT id FROM athletes WHERE last_name = 'Альянова' AND first_name = 'Виктория' AND birth_year = 2004 LIMIT 1), 4, 35, NULL, 62.25, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 2001, '2024-06-13', 'Альянова Виктория', 'Профсоюзы', 'Брянская область', 2001, NULL),
  (2082, 2009, (SELECT id FROM athletes WHERE last_name = 'Кутенкова' AND first_name = 'Анастасия' AND birth_year = 1997 LIMIT 1), 5, 20, NULL, 62.9, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 2001, '2024-06-13', 'Кутенкова Анастасия', '', 'Республика Бурятия', 2001, NULL),
  (2083, 2009, (SELECT id FROM athletes WHERE last_name = 'Переплетова' AND first_name = 'Яна' AND birth_year = 2009 LIMIT 1), 6, 18, NULL, 59.44, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 2001, '2024-06-13', 'Переплетова Яна ', '', 'г. Москва', 2001, NULL),
  (2084, 2009, (SELECT id FROM athletes WHERE last_name = 'Карпушенко' AND first_name = 'Ульяна' AND birth_year = 2002 LIMIT 1), 7, 15, NULL, 62.85, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 2001, '2024-06-13', 'Карпушенко Ульяна', 'СШОР "Атлет"', 'Челябинская область ', 2001, NULL),
  (2085, 2010, (SELECT id FROM athletes WHERE last_name = 'Воропаева' AND first_name = 'Виктория' AND birth_year = 2004 LIMIT 1), 1, 56, NULL, 67.5, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 2001, '2024-06-13', 'Воропаева Виктория', 'МКУ ДО «Бобровская СШ им. В.Л. Паткина»', 'Воронежская область', 2001, NULL),
  (2086, 2010, (SELECT id FROM athletes WHERE last_name = 'Мартынова' AND first_name = 'Любовь' AND birth_year = 2007 LIMIT 1), 2, 49, NULL, 64.2, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 2001, '2024-06-13', 'Мартынова Любовь', '', 'Астраханская область', 2001, NULL),
  (2087, 2010, (SELECT id FROM athletes WHERE last_name = 'Матвеева' AND first_name = 'Елена' AND birth_year = 1974 LIMIT 1), 3, 48, NULL, 63.95, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 2001, '2024-06-13', 'Матвеева Елена', 'КОГАУ «СШОР «Юность»', 'Кировская область', 2001, NULL),
  (2088, 2010, (SELECT id FROM athletes WHERE last_name = 'Кошурникова' AND first_name = 'Анастасия' AND birth_year = 2003 LIMIT 1), 4, 42, NULL, 64.35, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 2001, '2024-06-13', 'Кошурникова Анастасия ', '', 'ХМАО-Югра', 2001, NULL),
  (2089, 2010, (SELECT id FROM athletes WHERE last_name = 'Ельчанинова' AND first_name = 'Вероника' AND birth_year = 2003 LIMIT 1), 5, 36, NULL, 67.75, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 2001, '2024-06-13', 'Ельчанинова Вероника', '', 'Омская область', 2001, NULL),
  (2090, 2010, (SELECT id FROM athletes WHERE last_name = 'Башарова' AND first_name = 'Виктория' AND birth_year = 1993 LIMIT 1), 6, 31, NULL, 67.7, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 2001, '2024-06-13', 'Башарова Виктория', 'ВС', 'Республика Бурятия', 2001, NULL),
  (2091, 2010, (SELECT id FROM athletes WHERE last_name = 'Походяева' AND first_name = 'Александра' AND birth_year = 1990 LIMIT 1), 7, 21, NULL, 65.65, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 2001, '2024-06-13', 'Походяева Александра', 'Газпром добыча Уренгой', 'ЯНАО', 2001, NULL),
  (2092, 2010, (SELECT id FROM athletes WHERE last_name = 'Куцанова' AND first_name = 'Анастасия' AND birth_year = 2006 LIMIT 1), 8, 17, NULL, 66.95, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 2001, '2024-06-13', 'Куцанова Анастасия', '', 'Томская область', 2001, NULL),
  (2093, 2011, (SELECT id FROM athletes WHERE last_name = 'Мартынова' AND first_name = 'Ирина' AND birth_year = 1999 LIMIT 1), 1, 84, NULL, 82.95, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 2001, '2024-06-13', 'Мартынова Ирина ', 'СШОР "Маршал"', 'Калужская область', 2001, NULL),
  (2094, 2011, (SELECT id FROM athletes WHERE last_name = 'Полякова' AND first_name = 'Полина' AND birth_year = 1999 LIMIT 1), 2, 67, NULL, 83.9, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 2001, '2024-06-13', 'Полякова Полина', 'СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 2001, NULL),
  (2095, 2011, (SELECT id FROM athletes WHERE last_name = 'Ландина' AND first_name = 'Алена' AND birth_year = 2006 LIMIT 1), 3, 58, NULL, 82.55, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 2001, '2024-06-13', 'Ландина Алена', '', 'г. Москва', 2001, NULL),
  (2096, 2011, (SELECT id FROM athletes WHERE last_name = 'Врубель' AND first_name = 'Дарья' AND birth_year = 2000 LIMIT 1), 4, 50, NULL, 101.8, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 2001, '2024-06-13', 'Врубель Дарья', '', 'Омская область', 2001, NULL),
  (2097, 2011, (SELECT id FROM athletes WHERE last_name = 'Кузьмичева' AND first_name = 'Ксения' AND birth_year = 2004 LIMIT 1), 5, 35, NULL, 86.6, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 2001, '2024-06-13', 'Кузьмичева Ксения', 'СШ №1 им. Л.Д. Ковалевского', 'Оренбургская область', 2001, NULL),
  (2098, 2011, (SELECT id FROM athletes WHERE last_name = 'Попова' AND first_name = 'Мария' AND birth_year = 2005 LIMIT 1), 6, 32, NULL, 79.75, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 2001, '2024-06-13', 'Попова Мария', 'ССК "Китнаспорте"', 'Пермский край', 2001, NULL),
  (2099, 2011, (SELECT id FROM athletes WHERE last_name = 'Бадашкова' AND first_name = 'Нина' AND birth_year = 1991 LIMIT 1), 7, 19, NULL, 79.4, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 2001, '2024-06-13', 'Бадашкова Нина', '', 'Новосибирская область', 2001, NULL),
  (2100, 2012, (SELECT id FROM athletes WHERE last_name = 'Щербина' AND first_name = 'Джанита' AND birth_year = 1991 LIMIT 1), 1, 181, NULL, 54.48, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Щербина Джанита', 'СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 2001, NULL),
  (2101, 2012, (SELECT id FROM athletes WHERE last_name = 'Жура' AND first_name = 'Александра' AND birth_year = 1988 LIMIT 1), 2, 177, NULL, 56.74, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Жура Александра', 'СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 2001, NULL),
  (2102, 2012, (SELECT id FROM athletes WHERE last_name = 'Беликова' AND first_name = 'Олеся' AND birth_year = 2004 LIMIT 1), 3, 168, NULL, 57.6, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Беликова Олеся', 'СШ «Юность', 'Белгородская область', 2001, NULL),
  (2103, 2012, (SELECT id FROM athletes WHERE last_name = 'Мажаева' AND first_name = 'Наталия' AND birth_year = 1999 LIMIT 1), 4, 166, NULL, 55.7, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Мажаева Наталия', 'СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 2001, NULL),
  (2104, 2012, (SELECT id FROM athletes WHERE last_name = 'Бахтова' AND first_name = 'Ирина' AND birth_year = 1999 LIMIT 1), 5, 153, NULL, 56.65, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Бахтова Ирина', '', 'Самарская область', 2001, NULL),
  (2105, 2012, (SELECT id FROM athletes WHERE last_name = 'Хуснудинова' AND first_name = 'Мария' AND birth_year = 2004 LIMIT 1), 6, 131, NULL, 55.24, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Хуснудинова Мария', 'СШОР "Олимп"', 'Челябинская область ', 2001, NULL),
  (2106, 2012, (SELECT id FROM athletes WHERE last_name = 'Суханова' AND first_name = 'Анастасия' AND birth_year = 2007 LIMIT 1), 7, 121, NULL, 50.1, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Суханова  Анастасия ', '', 'Тюменская область', 2001, NULL),
  (2107, 2012, (SELECT id FROM athletes WHERE last_name = 'Коптяева' AND first_name = 'Карина' AND birth_year = 2007 LIMIT 1), 8, 120, NULL, 57.84, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Коптяева Карина ', '', 'Тюменская область', 2001, NULL),
  (2108, 2012, (SELECT id FROM athletes WHERE last_name = 'Ныныч' AND first_name = 'Маргарита' AND birth_year = 1996 LIMIT 1), 9, 118, NULL, 56.72, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Ныныч Маргарита', '', 'Республика Бурятия', 2001, NULL),
  (2109, 2012, (SELECT id FROM athletes WHERE last_name = 'Кожеватова' AND first_name = 'Василиса' AND birth_year = 2002 LIMIT 1), 10, 115, NULL, 56.46, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Кожеватова Василиса', 'СШ №1 им. Л.Д. Ковалевского', 'Оренбургская область', 2001, NULL),
  (2110, 2012, (SELECT id FROM athletes WHERE last_name = 'Трофимова' AND first_name = 'Милена' AND birth_year = 2007 LIMIT 1), 11, 93, NULL, 57.9, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Трофимова Милена', 'СШОР "Маршал"', 'Калужская область', 2001, NULL),
  (2111, 2012, (SELECT id FROM athletes WHERE last_name = 'Подольская' AND first_name = 'Анастасия' AND birth_year = 2005 LIMIT 1), 12, 72, NULL, 57, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Подольская Анастасия', '', 'г. Москва', 2001, NULL),
  (2112, 2012, (SELECT id FROM athletes WHERE last_name = 'Семирунняя' AND first_name = 'Александра' AND birth_year = 2006 LIMIT 1), 13, 67, NULL, 51.68, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Семирунняя Александра', '', 'Ростовская область', 2001, NULL),
  (2113, 2013, (SELECT id FROM athletes WHERE last_name = 'Тарвердиева' AND first_name = 'Мария' AND birth_year = 1986 LIMIT 1), 1, 192, NULL, 62.35, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Тарвердиева Мария', 'СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 2001, NULL),
  (2114, 2013, (SELECT id FROM athletes WHERE last_name = 'Степанова' AND first_name = 'Оксана' AND birth_year = 1990 LIMIT 1), 2, 180, NULL, 62.9, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Степанова Оксана', 'СШОР "Атлет"', 'Челябинская область ', 2001, NULL),
  (2115, 2013, (SELECT id FROM athletes WHERE last_name = 'Дедюхина' AND first_name = 'Ксения' AND birth_year = 1990 LIMIT 1), 3, 177, NULL, 62.15, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Дедюхина Ксения', 'ВС', 'ХМАО-Югра', 2001, NULL),
  (2116, 2013, (SELECT id FROM athletes WHERE last_name = 'Кутенкова' AND first_name = 'Анастасия' AND birth_year = 1997 LIMIT 1), 4, 171, NULL, 62.8, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Кутенкова Анастасия', 'ВС', 'Республика Бурятия', 2001, NULL),
  (2117, 2013, (SELECT id FROM athletes WHERE last_name = 'Барбакова' AND first_name = 'Александра' AND birth_year = 2004 LIMIT 1), 5, 136, NULL, 58.14, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Барбакова Александра', 'СШОР "Маршал"', 'Калужская область', 2001, NULL),
  (2118, 2013, (SELECT id FROM athletes WHERE last_name = 'Бурмакина' AND first_name = 'Екатерина' AND birth_year = 2005 LIMIT 1), 6, 129, NULL, 60.65, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Бурмакина Екатерина', 'МБУ ДО СШ «Татнефть Олимп» Чистопольского района РТ', 'Республика Татарстан', 2001, NULL),
  (2119, 2013, (SELECT id FROM athletes WHERE last_name = 'Мицурина' AND first_name = 'Оксана' AND birth_year = 1999 LIMIT 1), 7, 128, NULL, 62.75, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Мицурина Оксана ', 'ЦСФМР ', 'ЯНАО', 2001, NULL),
  (2120, 2013, (SELECT id FROM athletes WHERE last_name = 'Карпушенко' AND first_name = 'Ульяна' AND birth_year = 2001 LIMIT 1), 8, 102, NULL, 63, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Карпушенко Ульяна ', 'СШОР "Атлет"', 'Челябинская область ', 2001, NULL),
  (2121, 2013, (SELECT id FROM athletes WHERE last_name = 'Шевелева' AND first_name = 'Олеся' AND birth_year = 2005 LIMIT 1), 9, 93, NULL, 62.35, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Шевелева Олеся', '', 'Республика Бурятия', 2001, NULL),
  (2122, 2013, (SELECT id FROM athletes WHERE last_name = 'Сергеева' AND first_name = 'Юлия' AND birth_year = 1980 LIMIT 1), 10, 89, NULL, 62.55, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Сергеева Юлия ', '', 'г. Москва', 2001, NULL),
  (2123, 2013, (SELECT id FROM athletes WHERE last_name = 'Переплетова' AND first_name = 'Яна' AND birth_year = 2009 LIMIT 1), 11, 82, NULL, 59.38, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Переплетова Яна ', '', 'г. Москва', 2001, NULL),
  (2124, 2013, (SELECT id FROM athletes WHERE last_name = 'Шангина' AND first_name = 'Светлана' AND birth_year = 1973 LIMIT 1), 12, 69, NULL, 61.4, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Шангина Светлана', '', 'Республика Бурятия', 2001, NULL),
  (2125, 2013, (SELECT id FROM athletes WHERE last_name = 'Воробьева' AND first_name = 'Надежда' AND birth_year = 2000 LIMIT 1), 13, 28, NULL, 60.7, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Воробьева Надежда', '', 'Республика Бурятия', 2001, NULL),
  (2126, 2014, (SELECT id FROM athletes WHERE last_name = 'Бенидзе' AND first_name = 'Елизавета' AND birth_year = 2002 LIMIT 1), 1, 197, NULL, 67.55, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Бенидзе Елизавета', 'СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 2001, NULL),
  (2127, 2014, (SELECT id FROM athletes WHERE last_name = 'Васькина' AND first_name = 'Алина' AND birth_year = 1999 LIMIT 1), 2, 190, NULL, 65.15, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Васькина Алина ', 'КСШ №1/ВС', 'Смоленская область', 2001, NULL),
  (2128, 2014, (SELECT id FROM athletes WHERE last_name = 'Башарова' AND first_name = 'Виктория' AND birth_year = 1993 LIMIT 1), 3, 180, NULL, 67.7, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Башарова Виктория', 'ВС', 'Республика Бурятия', 2001, NULL),
  (2129, 2014, (SELECT id FROM athletes WHERE last_name = 'Барбакова' AND first_name = 'Наталья' AND birth_year = 1984 LIMIT 1), 4, 176, NULL, 66.25, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Барбакова Наталья', 'СШОР "Маршал"', 'Калужская область', 2001, NULL),
  (2130, 2014, (SELECT id FROM athletes WHERE last_name = 'Матвеева' AND first_name = 'Елена' AND birth_year = 1974 LIMIT 1), 5, 150, NULL, 64.35, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Матвеева Елена', 'КОГАУ "СШОР "Юность"', 'Кировская область', 2001, NULL),
  (2131, 2014, (SELECT id FROM athletes WHERE last_name = 'Фирса' AND first_name = 'Анна' AND birth_year = 2003 LIMIT 1), 6, 150, NULL, 67, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Фирса Анна', 'СШ "Юность"', 'Краснодарский край', 2001, NULL),
  (2132, 2014, (SELECT id FROM athletes WHERE last_name = 'Бойко' AND first_name = 'Ксения' AND birth_year = 2005 LIMIT 1), 7, 120, NULL, 66.05, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Бойко Ксения ', 'МБУ ДО "Центр Поиск"', 'Томская область', 2001, NULL),
  (2133, 2014, (SELECT id FROM athletes WHERE last_name = 'Ельчанинова' AND first_name = 'Вероника' AND birth_year = 2003 LIMIT 1), 8, 110, NULL, 68, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Ельчанинова Вероника', '', 'Омская область', 2001, NULL),
  (2134, 2014, (SELECT id FROM athletes WHERE last_name = 'Каприна' AND first_name = 'Наталья' AND birth_year = 1980 LIMIT 1), 9, 100, NULL, 66.05, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Каприна Наталья', '', 'г. Москва', 2001, NULL),
  (2135, 2014, (SELECT id FROM athletes WHERE last_name = 'Карагаева' AND first_name = 'Ксения' AND birth_year = 1999 LIMIT 1), 10, 71, NULL, 67.85, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Карагаева Ксения ', '', 'Новосибирская область', 2001, NULL),
  (2136, 2015, (SELECT id FROM athletes WHERE last_name = 'Полякова' AND first_name = 'Полина' AND birth_year = 1999 LIMIT 1), 1, 213, NULL, 83.05, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Полякова Полина', 'СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 2001, NULL),
  (2137, 2015, (SELECT id FROM athletes WHERE last_name = 'Мартынова' AND first_name = 'Ирина' AND birth_year = 1999 LIMIT 1), 2, 210, NULL, 84.1, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Мартынова Ирина ', 'СШОР "Маршал"', 'Калужская область', 2001, NULL),
  (2138, 2015, (SELECT id FROM athletes WHERE last_name = 'Кухарева' AND first_name = 'Мария' AND birth_year = 1989 LIMIT 1), 3, 200, NULL, 77.1, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Кухарева Мария', 'ВС', 'г. Санкт-Петербург', 2001, NULL),
  (2139, 2015, (SELECT id FROM athletes WHERE last_name = 'Островская' AND first_name = 'Надежда' AND birth_year = 1985 LIMIT 1), 4, 196, NULL, 87.15, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Островская Надежда ', '', 'ХМАО-Югра', 2001, NULL),
  (2140, 2015, (SELECT id FROM athletes WHERE last_name = 'Ходунова' AND first_name = 'Ирина' AND birth_year = 1985 LIMIT 1), 5, 178, NULL, 79.85, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Ходунова Ирина ', 'КСШ №1/ ВС', 'Смоленская область', 2001, NULL),
  (2141, 2015, (SELECT id FROM athletes WHERE last_name = 'Насонова' AND first_name = 'Виктория' AND birth_year = 1999 LIMIT 1), 6, 157, NULL, 95.3, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Насонова Виктория ', '', 'Томская область', 2001, NULL),
  (2142, 2015, (SELECT id FROM athletes WHERE last_name = 'Врубель' AND first_name = 'Дарья' AND birth_year = 2000 LIMIT 1), 7, 155, NULL, 103.05, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Врубель Дарья', '', 'Омская область', 2001, NULL),
  (2143, 2015, (SELECT id FROM athletes WHERE last_name = 'Копылова' AND first_name = 'Регина' AND birth_year = 2001 LIMIT 1), 8, 149, NULL, 96.65, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Копылова  Регина', '', 'Новосибирская область', 2001, NULL),
  (2144, 2015, (SELECT id FROM athletes WHERE last_name = 'Кузьмичева' AND first_name = 'Ксения' AND birth_year = 2004 LIMIT 1), 9, 139, NULL, 86.3, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Кузьмичева Ксения', 'СШ №1 им. Л.Д. Ковалевского', 'Оренбургская область', 2001, NULL),
  (2145, 2015, (SELECT id FROM athletes WHERE last_name = 'Алферова' AND first_name = 'Валентина' AND birth_year = 1985 LIMIT 1), 10, 117, NULL, 89.95, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Алферова Валентина ', 'СШ "Снежинка"', 'Челябинская область ', 2001, NULL),
  (2146, 2015, (SELECT id FROM athletes WHERE last_name = 'Ландина' AND first_name = 'Алена' AND birth_year = 2006 LIMIT 1), 11, 100, NULL, 80.7, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Ландина Алена', '', 'г. Москва', 2001, NULL),
  (2147, 2015, (SELECT id FROM athletes WHERE last_name = 'Дербенева' AND first_name = 'Ольга' AND birth_year = 1970 LIMIT 1), 12, 95, NULL, 110.15, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 2001, '2024-06-13', 'Дербенева Ольга', 'МБУ ДО СШ пгт Тужа', 'Кировская область', 2001, NULL),
  (2148, 2016, (SELECT id FROM athletes WHERE last_name = 'Бутенко' AND first_name = 'Евгений' AND birth_year = 1995 LIMIT 1), 1, NULL, 212.5, 62.6, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Бутенко Евгений ', '', 'Новосибирская область', 2001, NULL),
  (2149, 2016, (SELECT id FROM athletes WHERE last_name = 'Бенидзе' AND first_name = 'Джони' AND birth_year = 1990 LIMIT 1), 2, NULL, 188.5, 62.75, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Бенидзе Джони', 'СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 2001, NULL),
  (2150, 2016, (SELECT id FROM athletes WHERE last_name = 'Смагулов' AND first_name = 'Нурсултан' AND birth_year = 1999 LIMIT 1), 3, NULL, 182, 63, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Смагулов Нурсултан', 'СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 2001, NULL),
  (2151, 2016, (SELECT id FROM athletes WHERE last_name = 'Ховалко' AND first_name = 'Василий' AND birth_year = 1993 LIMIT 1), 4, NULL, 146, 62.05, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Ховалко Василий', 'МБУ ДО СШ «Уренгоец»', 'ЯНАО/Омская область', 2001, NULL),
  (2152, 2016, (SELECT id FROM athletes WHERE last_name = 'Захаров' AND first_name = 'Кирилл' AND birth_year = 2007 LIMIT 1), 5, NULL, 130.5, 62.3, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Захаров Кирилл ', '', 'Новосибирская область', 2001, NULL),
  (2153, 2016, (SELECT id FROM athletes WHERE last_name = 'Манаков' AND first_name = 'Трофим' AND birth_year = 2000 LIMIT 1), 6, NULL, 126, 62.9, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Манаков Трофим ', 'Газпром трансгаз Сургут', 'ХМАО-Югра', 2001, NULL),
  (2154, 2016, (SELECT id FROM athletes WHERE last_name = 'Ильясов' AND first_name = 'Какен' AND birth_year = 1993 LIMIT 1), 7, NULL, 112.5, 62.9, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Ильясов Какен', 'ВС', 'Омская область', 2001, NULL),
  (2155, 2016, (SELECT id FROM athletes WHERE last_name = 'Карнаухов' AND first_name = 'Никита' AND birth_year = 2008 LIMIT 1), 8, NULL, 68, 62.3, NULL, (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Карнаухов Никита', '', 'Республика Бурятия', 2001, NULL),
  (2156, 2016, (SELECT id FROM athletes WHERE last_name = 'Останин' AND first_name = 'Даниил' AND birth_year = 2005 LIMIT 1), 9, NULL, 27, 56.24, NULL, (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Останин Даниил', 'ДО ДС ДЮ «Прикамье»', 'Пермский край', 2001, NULL),
  (2157, 2017, (SELECT id FROM athletes WHERE last_name = 'Зуев' AND first_name = 'Владислав' AND birth_year = 2000 LIMIT 1), 1, NULL, 216, 68, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Зуев Владислав', 'ВС РФ', 'Воронежская область', 2001, NULL),
  (2158, 2017, (SELECT id FROM athletes WHERE last_name = 'Щербин' AND first_name = 'Олег' AND birth_year = 1989 LIMIT 1), 2, NULL, 211.5, 67.45, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Щербин Олег', 'СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 2001, NULL),
  (2159, 2017, (SELECT id FROM athletes WHERE last_name = 'Рябков' AND first_name = 'Алексей' AND birth_year = 1993 LIMIT 1), 3, NULL, 211, 67.8, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Рябков Алексей', 'ВС', 'ХМАО-Югра', 2001, NULL),
  (2160, 2017, (SELECT id FROM athletes WHERE last_name = 'Морозович' AND first_name = 'Владислав' AND birth_year = 1999 LIMIT 1), 4, NULL, 202, 68, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Морозович Владислав', 'ВС', 'Омская область', 2001, NULL),
  (2161, 2017, (SELECT id FROM athletes WHERE last_name = 'Шаров' AND first_name = 'Максим' AND birth_year = 2000 LIMIT 1), 5, NULL, 198, 67, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Шаров Максим ', 'ДДЮ «Алые Паруса»', 'Рязанская область', 2001, NULL),
  (2162, 2017, (SELECT id FROM athletes WHERE last_name = 'Василевич' AND first_name = 'Добрыня' AND birth_year = 2000 LIMIT 1), 6, NULL, 190, 67.5, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Василевич Добрыня', 'ВС', 'Республика Бурятия', 2001, NULL),
  (2163, 2017, (SELECT id FROM athletes WHERE last_name = 'Карнаухов' AND first_name = 'Даниил' AND birth_year = 2001 LIMIT 1), 7, NULL, 169.5, 68, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Карнаухов Даниил', '', 'Республика Бурятия', 2001, NULL),
  (2164, 2017, (SELECT id FROM athletes WHERE last_name = 'Бенидзе' AND first_name = 'Спартак' AND birth_year = 2002 LIMIT 1), 8, NULL, 152.5, 67.85, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Бенидзе Спартак', 'СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 2001, NULL),
  (2165, 2017, (SELECT id FROM athletes WHERE last_name = 'Усольцев' AND first_name = 'Александр' AND birth_year = 1992 LIMIT 1), 9, NULL, 143.5, 67.8, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Усольцев Александр', 'КСК «Факел»', 'ЯНАО', 2001, NULL),
  (2166, 2017, (SELECT id FROM athletes WHERE last_name = 'Айдбаев' AND first_name = 'Ильфат' AND birth_year = 1989 LIMIT 1), 10, NULL, 106, 66.65, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Айдбаев Ильфат ', '', 'Тюменская область', 2001, NULL),
  (2167, 2017, (SELECT id FROM athletes WHERE last_name = 'Громов' AND first_name = 'Алексей' AND birth_year = 1995 LIMIT 1), 11, NULL, 102.5, 67.75, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Громов Алексей', '', 'Удмуртская республика', 2001, NULL),
  (2168, 2017, (SELECT id FROM athletes WHERE last_name = 'Маскайкин' AND first_name = 'Никита' AND birth_year = 2002 LIMIT 1), 12, NULL, 99, 68, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Маскайкин Никита', 'СШОР "Атлет"', 'Челябинская область ', 2001, NULL),
  (2169, 2018, (SELECT id FROM athletes WHERE last_name = 'Рассадин' AND first_name = 'Андрей' AND birth_year = 1989 LIMIT 1), 1, NULL, 231, 73, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Рассадин Андрей', 'ВС', 'Республика Бурятия', 2001, NULL),
  (2170, 2018, (SELECT id FROM athletes WHERE last_name = 'Баранов' AND first_name = 'Егор' AND birth_year = 1992 LIMIT 1), 2, NULL, 212.5, 73, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Баранов Егор ', '', 'г. Москва', 2001, NULL),
  (2171, 2018, (SELECT id FROM athletes WHERE last_name = 'Балдин' AND first_name = 'Александр' AND birth_year = 1993 LIMIT 1), 3, NULL, 196.5, 72.15, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Балдин Александр', '', 'Самарская область', 2001, NULL),
  (2172, 2018, (SELECT id FROM athletes WHERE last_name = 'Сулейманов' AND first_name = 'Мовсар' AND birth_year = 1989 LIMIT 1), 4, NULL, 195, 73, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Сулейманов Мовсар ', 'СШОР "Маршал"', 'Калужская область', 2001, NULL),
  (2173, 2018, (SELECT id FROM athletes WHERE last_name = 'Мащенко' AND first_name = 'Олег' AND birth_year = 1983 LIMIT 1), 5, NULL, 187.5, 72.4, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Мащенко Олег', 'ВС', 'Краснодарский край', 2001, NULL),
  (2174, 2018, (SELECT id FROM athletes WHERE last_name = 'Карагаев' AND first_name = 'Юрий' AND birth_year = 1994 LIMIT 1), 6, NULL, 184, 72.95, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Карагаев Юрий ', '', 'Новосибирская область', 2001, NULL),
  (2175, 2018, (SELECT id FROM athletes WHERE last_name = 'Коломин' AND first_name = 'Дмитрий' AND birth_year = 1999 LIMIT 1), 7, NULL, 181.5, 72, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Коломин Дмитрий', 'ВС', 'Республика Бурятия', 2001, NULL),
  (2176, 2018, (SELECT id FROM athletes WHERE last_name = 'Панов' AND first_name = 'Алексей' AND birth_year = 1991 LIMIT 1), 8, NULL, 171.5, 72.95, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Панов Алексей', '', 'Томская область', 2001, NULL),
  (2177, 2018, (SELECT id FROM athletes WHERE last_name = 'Волдаев' AND first_name = 'Александр' AND birth_year = 2000 LIMIT 1), 9, NULL, 171.5, 72.7, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Волдаев Александр ', '', 'Томская область', 2001, NULL),
  (2178, 2018, (SELECT id FROM athletes WHERE last_name = 'Кожевников' AND first_name = 'Сергей' AND birth_year = 2008 LIMIT 1), 10, NULL, 163, 72.4, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Кожевников Сергей', '', 'Республика Бурятия', 2001, NULL),
  (2179, 2018, (SELECT id FROM athletes WHERE last_name = 'Голиков' AND first_name = 'Роман' AND birth_year = 1990 LIMIT 1), 11, NULL, 162, 69.9, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Голиков Роман', '', 'Красноярский край', 2001, NULL),
  (2180, 2018, (SELECT id FROM athletes WHERE last_name = 'Васин' AND first_name = 'Артем' AND birth_year = 2007 LIMIT 1), 12, NULL, 145.5, 71.5, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Васин Артем', 'СШОР "Маршал"', 'Калужская область', 2001, NULL),
  (2181, 2018, (SELECT id FROM athletes WHERE last_name = 'Баев' AND first_name = 'Константин' AND birth_year = 1993 LIMIT 1), 13, NULL, 122.5, 73, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Баев Константин', ' СШ  «Геолог»', 'ЯНАО', 2001, NULL),
  (2182, 2018, (SELECT id FROM athletes WHERE last_name = 'Гарифуллин' AND first_name = 'Константин' AND birth_year = 1999 LIMIT 1), 14, NULL, 120, 72.2, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Гарифуллин Константин ', '', 'Удмуртская республика', 2001, NULL),
  (2183, 2018, (SELECT id FROM athletes WHERE last_name = 'Бурков' AND first_name = 'Юрий' AND birth_year = 1987 LIMIT 1), 15, NULL, 108, 72.9, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Бурков Юрий', '', 'Удмуртская республика', 2001, NULL),
  (2184, 2018, (SELECT id FROM athletes WHERE last_name = 'Чойнжуров' AND first_name = 'Леонид' AND birth_year = 2004 LIMIT 1), 16, NULL, 100, 72.05, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Чойнжуров Леонид', '', 'Омская обл./Р.Бурятия', 2001, NULL),
  (2185, 2019, (SELECT id FROM athletes WHERE last_name = 'Квашнин' AND first_name = 'Михаил' AND birth_year = 1988 LIMIT 1), 1, NULL, 246, 77.95, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Квашнин Михаил ', 'СО "Динамо"', 'Свердловская область', 2001, NULL),
  (2186, 2019, (SELECT id FROM athletes WHERE last_name = 'Ташланов' AND first_name = 'Илья' AND birth_year = 1987 LIMIT 1), 2, NULL, 215, 77.7, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Ташланов Илья ', 'СШОР "Атлет"', 'Челябинская область ', 2001, NULL),
  (2187, 2019, (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Алексей' AND birth_year = 1995 LIMIT 1), 3, NULL, 209.5, 78, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Иванов Алексей', 'СШ "Энергия"', 'Республика Чувашия', 2001, NULL),
  (2188, 2019, (SELECT id FROM athletes WHERE last_name = 'Сарсембаев' AND first_name = 'Ильяс' AND birth_year = 1999 LIMIT 1), 4, NULL, 192.5, 77.75, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Сарсембаев Ильяс', 'МБУ ДО СШ «Зенит»', 'ЯНАО', 2001, NULL),
  (2189, 2019, (SELECT id FROM athletes WHERE last_name = 'Степанов' AND first_name = 'Сергей' AND birth_year = 1993 LIMIT 1), 5, NULL, 188, 77.55, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Степанов Сергей ', 'СШОР "Атлет"', 'Челябинская область ', 2001, NULL),
  (2190, 2019, (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Виталий' AND birth_year = 1978 LIMIT 1), 6, NULL, 171, 77.65, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Иванов Виталий', '', 'ХМАО-Югра', 2001, NULL),
  (2191, 2019, (SELECT id FROM athletes WHERE last_name = 'Серебряков' AND first_name = 'Александр' AND birth_year = 1991 LIMIT 1), 7, NULL, 142, 78, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Серебряков Александр', '', 'Архангельская область', 2001, NULL),
  (2192, 2019, (SELECT id FROM athletes WHERE last_name = 'Алексеев' AND first_name = 'Радиф' AND birth_year = 1989 LIMIT 1), 8, NULL, 139.5, 76.65, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Алексеев Радиф', '', 'Республика Чувашия', 2001, NULL),
  (2193, 2019, (SELECT id FROM athletes WHERE last_name = 'Ладе' AND first_name = 'Роман' AND birth_year = 1991 LIMIT 1), 9, NULL, 137, 77.9, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Ладе Роман', '', 'Республика Коми', 2001, NULL),
  (2194, 2019, (SELECT id FROM athletes WHERE last_name = 'Кодиров' AND first_name = 'Абдумаъруф' AND birth_year = 2000 LIMIT 1), 10, NULL, 128, 78, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Кодиров Абдумаъруф', 'МАУ ДО ДС ДЮ "Прикамье"', 'Пермский край', 2001, NULL),
  (2195, 2020, (SELECT id FROM athletes WHERE last_name = 'Черкашин' AND first_name = 'Дмитрий' AND birth_year = 1999 LIMIT 1), 1, NULL, 249, 85, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Черкашин Дмитрий', '', 'Томская область', 2001, NULL),
  (2196, 2020, (SELECT id FROM athletes WHERE last_name = 'Плотников' AND first_name = 'Вячеслав' AND birth_year = 1998 LIMIT 1), 2, NULL, 236, 81.1, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Плотников Вячеслав ', 'СШОР "Атлет"', 'Челябинская область ', 2001, NULL),
  (2197, 2020, (SELECT id FROM athletes WHERE last_name = 'Маликов' AND first_name = 'Данил' AND birth_year = 2001 LIMIT 1), 3, NULL, 227, 84.15, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Маликов Данил', 'ДО ДС ДЮ «Прикамье»', 'Пермский край', 2001, NULL),
  (2198, 2020, (SELECT id FROM athletes WHERE last_name = 'Шиляев' AND first_name = 'Иван' AND birth_year = 1996 LIMIT 1), 4, NULL, 220, 82.05, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Шиляев Иван ', '', 'Удмуртская республика', 2001, NULL),
  (2199, 2020, (SELECT id FROM athletes WHERE last_name = 'Бревнов' AND first_name = 'Евгений' AND birth_year = 1974 LIMIT 1), 5, NULL, 191.5, 83.15, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Бревнов Евгений', '', 'Омская область', 2001, NULL),
  (2200, 2020, (SELECT id FROM athletes WHERE last_name = 'Минибаев' AND first_name = 'Альзаф' AND birth_year = 1987 LIMIT 1), 6, NULL, 183.5, 84.7, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Минибаев Альзаф', 'Газпром переработка', 'ЯНАО', 2001, NULL),
  (2201, 2020, (SELECT id FROM athletes WHERE last_name = 'Крестьянинов' AND first_name = 'Виктор' AND birth_year = 2000 LIMIT 1), 7, NULL, 180, 83.95, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Крестьянинов Виктор', 'ДО ДС ДЮ «Прикамье»', 'Пермский край', 2001, NULL),
  (2202, 2020, (SELECT id FROM athletes WHERE last_name = 'Лавриков' AND first_name = 'Вячеслав' AND birth_year = 2005 LIMIT 1), 8, NULL, 171, 82.55, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Лавриков Вячеслав', '', 'Томская область', 2001, NULL),
  (2203, 2020, (SELECT id FROM athletes WHERE last_name = 'Бородынкин' AND first_name = 'Олег' AND birth_year = 2002 LIMIT 1), 9, NULL, 166.5, 84.9, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Бородынкин Олег', '', 'Новосибирская область', 2001, NULL),
  (2204, 2020, (SELECT id FROM athletes WHERE last_name = 'Минуллин' AND first_name = 'Марсель' AND birth_year = 2000 LIMIT 1), 10, NULL, 157, 84.2, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Минуллин Марсель', '', 'Омская область', 2001, NULL),
  (2205, 2020, (SELECT id FROM athletes WHERE last_name = 'Рысник' AND first_name = 'Сергей' AND birth_year = 1995 LIMIT 1), 11, NULL, 156, 84.9, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Рысник Сергей', 'ВС', 'Омская область', 2001, NULL),
  (2206, 2020, (SELECT id FROM athletes WHERE last_name = 'Ветров' AND first_name = 'Денис' AND birth_year = 1989 LIMIT 1), 12, NULL, 149.5, 84.7, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Ветров Денис ', '', 'г. Москва', 2001, NULL),
  (2207, 2020, (SELECT id FROM athletes WHERE last_name = 'Тюленев' AND first_name = 'Дмитрий' AND birth_year = 1985 LIMIT 1), 13, NULL, 125.5, 80.5, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Тюленев Дмитрий', '', 'Кемеровская область', 2001, NULL),
  (2208, 2021, (SELECT id FROM athletes WHERE last_name = 'Марков' AND first_name = 'Иван' AND birth_year = 1995 LIMIT 1), 1, NULL, 279.5, 100.25, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Марков Иван', 'СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 2001, NULL),
  (2209, 2021, (SELECT id FROM athletes WHERE last_name = 'Розмазнин' AND first_name = 'Илья' AND birth_year = 2000 LIMIT 1), 2, NULL, 233.5, 108.05, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Розмазнин Илья', 'НИУ БелГУ', 'Белгородская область', 2001, NULL),
  (2210, 2021, (SELECT id FROM athletes WHERE last_name = 'Шевелёв' AND first_name = 'Дмитрий' AND birth_year = 1989 LIMIT 1), 3, NULL, 211.5, 117.2, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Шевелёв Дмитрий', '', 'Новосибирская область', 2001, NULL),
  (2211, 2021, (SELECT id FROM athletes WHERE last_name = 'Орлов' AND first_name = 'Сергей' AND birth_year = 2005 LIMIT 1), 4, NULL, 209.5, 120.15, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Орлов Сергей', 'СШ г.Светлоград', 'Ставропольский край', 2001, NULL),
  (2212, 2021, (SELECT id FROM athletes WHERE last_name = 'Июльский' AND first_name = 'Дмитрий' AND birth_year = 1993 LIMIT 1), 5, NULL, 200, 111.2, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Июльский Дмитрий', '', 'г. Москва', 2001, NULL),
  (2213, 2021, (SELECT id FROM athletes WHERE last_name = 'Шендо' AND first_name = 'Никита' AND birth_year = 1998 LIMIT 1), 6, NULL, 170, 100.95, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Шендо Никита', '', 'Красноярский край', 2001, NULL),
  (2214, 2021, (SELECT id FROM athletes WHERE last_name = 'Шабунин' AND first_name = 'Никита' AND birth_year = 2001 LIMIT 1), 7, NULL, 164.5, 115.1, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Шабунин Никита', '', 'Томская область', 2001, NULL),
  (2215, 2021, (SELECT id FROM athletes WHERE last_name = 'Чирков' AND first_name = 'Леонид' AND birth_year = 2003 LIMIT 1), 8, NULL, 158.5, 112.2, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Чирков Леонид', '', 'Калужская область', 2001, NULL),
  (2216, 2021, (SELECT id FROM athletes WHERE last_name = 'Медведев' AND first_name = 'Николай' AND birth_year = 2006 LIMIT 1), 9, NULL, 147.5, 108.6, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Медведев Николай', '', 'Ростовская область', 2001, NULL),
  (2217, 2021, (SELECT id FROM athletes WHERE last_name = 'Тимушев' AND first_name = 'Олег' AND birth_year = 1990 LIMIT 1), 10, NULL, 139.5, 105.6, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Тимушев Олег', 'КОГАУ «СШОР «Юность»', 'Кировская область', 2001, NULL),
  (2218, 2022, (SELECT id FROM athletes WHERE last_name = 'Кулаков' AND first_name = 'Иван' AND birth_year = 1998 LIMIT 1), 1, NULL, 235.5, 94, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Кулаков Иван ', 'ДДЮ "Алые Паруса"', 'Рязанская область', 2001, NULL),
  (2219, 2022, (SELECT id FROM athletes WHERE last_name = 'Гуров' AND first_name = 'Владимир' AND birth_year = 1978 LIMIT 1), 2, NULL, 229, 91.9, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Гуров Владимир', 'СШОР "Маршал"', 'Калужская область', 2001, NULL),
  (2220, 2022, (SELECT id FROM athletes WHERE last_name = 'Юрастов' AND first_name = 'Станислав' AND birth_year = 1983 LIMIT 1), 3, NULL, 224, 92, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Юрастов Станислав', '', 'Ростовская область', 2001, NULL),
  (2221, 2022, (SELECT id FROM athletes WHERE last_name = 'Филиппов' AND first_name = 'Максим' AND birth_year = 1993 LIMIT 1), 4, NULL, 221.5, 93.15, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Филиппов Максим', 'ВС', 'Краснодарский край', 2001, NULL),
  (2222, 2022, (SELECT id FROM athletes WHERE last_name = 'Пивень' AND first_name = 'Андрей' AND birth_year = 2003 LIMIT 1), 5, NULL, 208.5, 87.25, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Пивень Андрей', '', 'Республика Бурятия', 2001, NULL),
  (2223, 2022, (SELECT id FROM athletes WHERE last_name = 'Черкашин' AND first_name = 'Иван' AND birth_year = 1999 LIMIT 1), 6, NULL, 205.5, 93.8, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Черкашин Иван ', '', 'Томская область', 2001, NULL),
  (2224, 2022, (SELECT id FROM athletes WHERE last_name = 'Булдаков' AND first_name = 'Никита' AND birth_year = 1997 LIMIT 1), 7, NULL, 203, 88.95, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Булдаков Никита', '', 'Удмуртская республика', 2001, NULL),
  (2225, 2022, (SELECT id FROM athletes WHERE last_name = 'Николаев' AND first_name = 'Аркадий' AND birth_year = 2002 LIMIT 1), 8, NULL, 200, 88.15, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Николаев Аркадий', '', 'ХМАО-Югра', 2001, NULL),
  (2226, 2022, (SELECT id FROM athletes WHERE last_name = 'Житихин' AND first_name = 'Владислав' AND birth_year = 1994 LIMIT 1), 9, NULL, 189.5, 93.65, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Житихин Владислав', '', 'Республика Бурятия', 2001, NULL),
  (2227, 2022, (SELECT id FROM athletes WHERE last_name = 'Турищев' AND first_name = 'Дмитрий' AND birth_year = 1992 LIMIT 1), 10, NULL, 187.5, 94.8, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Турищев Дмитрий', '', 'г. Москва', 2001, NULL),
  (2228, 2022, (SELECT id FROM athletes WHERE last_name = 'Спичкин' AND first_name = 'Алексей' AND birth_year = 1994 LIMIT 1), 11, NULL, 180.5, 91.6, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Спичкин Алексей ', '', 'Новосибирская область', 2001, NULL),
  (2229, 2022, (SELECT id FROM athletes WHERE last_name = 'Кирюхин' AND first_name = 'Роман' AND birth_year = 1997 LIMIT 1), 12, NULL, 176, 94.1, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Кирюхин Роман ', '', 'г. Москва', 2001, NULL),
  (2230, 2022, (SELECT id FROM athletes WHERE last_name = 'Курдюков' AND first_name = 'Василий' AND birth_year = 1997 LIMIT 1), 13, NULL, 167.5, 85.1, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Курдюков Василий', '', 'Омская область', 2001, NULL),
  (2231, 2022, (SELECT id FROM athletes WHERE last_name = 'Бардин' AND first_name = 'Максим' AND birth_year = 1990 LIMIT 1), NULL, NULL, NULL, NULL, NULL, (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 2001, '2024-06-13', 'Бардин Максим', 'МАОУ "ЦРКМиС ПМО"', 'Пермский край', 2001, NULL);

INSERT INTO result_reps (id, result_id, exercise, hand, reps) VALUES
  (2001, 2001, 'long_cycle', 'both', 76),
  (2002, 2002, 'long_cycle', 'both', 59),
  (2003, 2003, 'long_cycle', 'both', 56),
  (2004, 2004, 'long_cycle', 'both', 54),
  (2005, 2005, 'long_cycle', 'both', 50),
  (2006, 2006, 'long_cycle', 'both', 45),
  (2007, 2007, 'long_cycle', 'both', 44),
  (2008, 2008, 'long_cycle', 'both', 40),
  (2009, 2009, 'long_cycle', 'both', 37),
  (2010, 2010, 'long_cycle', 'both', 36),
  (2011, 2011, 'long_cycle', 'both', 29),
  (2012, 2012, 'long_cycle', 'both', 23),
  (2013, 2013, 'long_cycle', 'both', 20),
  (2014, 2014, 'long_cycle', 'both', 8),
  (2015, 2015, 'long_cycle', 'both', 76),
  (2016, 2016, 'long_cycle', 'both', 74),
  (2017, 2017, 'long_cycle', 'both', 66),
  (2018, 2018, 'long_cycle', 'both', 65),
  (2019, 2019, 'long_cycle', 'both', 60),
  (2020, 2020, 'long_cycle', 'both', 37),
  (2021, 2021, 'long_cycle', 'both', 33),
  (2022, 2022, 'long_cycle', 'both', 82),
  (2023, 2023, 'long_cycle', 'both', 74),
  (2024, 2024, 'long_cycle', 'both', 65),
  (2025, 2025, 'long_cycle', 'both', 62),
  (2026, 2026, 'long_cycle', 'both', 60),
  (2027, 2027, 'long_cycle', 'both', 58),
  (2028, 2028, 'long_cycle', 'both', 48),
  (2029, 2029, 'long_cycle', 'both', 36),
  (2030, 2030, 'long_cycle', 'both', 35),
  (2031, 2031, 'long_cycle', 'both', 79),
  (2032, 2032, 'long_cycle', 'both', 77),
  (2033, 2033, 'long_cycle', 'both', 77),
  (2034, 2034, 'long_cycle', 'both', 76),
  (2035, 2035, 'long_cycle', 'both', 74),
  (2036, 2036, 'long_cycle', 'both', 70),
  (2037, 2037, 'long_cycle', 'both', 63),
  (2038, 2038, 'long_cycle', 'both', 38),
  (2039, 2039, 'long_cycle', 'both', 87),
  (2040, 2040, 'long_cycle', 'both', 85),
  (2041, 2041, 'long_cycle', 'both', 78),
  (2042, 2042, 'long_cycle', 'both', 66),
  (2043, 2043, 'long_cycle', 'both', 65),
  (2044, 2044, 'long_cycle', 'both', 60),
  (2045, 2045, 'long_cycle', 'both', 47),
  (2046, 2046, 'long_cycle', 'both', 44),
  (2047, 2047, 'long_cycle', 'both', 35),
  (2048, 2048, 'long_cycle', 'both', 100),
  (2049, 2049, 'long_cycle', 'both', 82),
  (2050, 2050, 'long_cycle', 'both', 81),
  (2051, 2051, 'long_cycle', 'both', 74),
  (2052, 2052, 'long_cycle', 'both', 73),
  (2053, 2053, 'long_cycle', 'both', 71),
  (2054, 2054, 'long_cycle', 'both', 65),
  (2055, 2055, 'long_cycle', 'both', 55),
  (2056, 2056, 'long_cycle', 'both', 52),
  (2057, 2057, 'long_cycle', 'both', 90),
  (2058, 2058, 'long_cycle', 'both', 81),
  (2059, 2059, 'long_cycle', 'both', 80),
  (2060, 2060, 'long_cycle', 'both', 75),
  (2061, 2061, 'long_cycle', 'both', 71),
  (2062, 2062, 'long_cycle', 'both', 64),
  (2063, 2063, 'long_cycle', 'both', 64),
  (2064, 2064, 'long_cycle', 'both', 61),
  (2065, 2065, 'long_cycle', 'both', 58),
  (2066, 2066, 'long_cycle', 'both', 53),
  (2067, 2067, 'long_cycle', 'both', 41),
  (2068, 2068, 'long_cycle', 'both', 32),
  (2069, 2069, 'long_cycle', 'both', 31),
  (2070, 2070, 'long_cycle', 'both', 59),
  (2071, 2071, 'long_cycle', 'both', 53),
  (2072, 2072, 'long_cycle', 'both', 52),
  (2073, 2073, 'long_cycle', 'both', 46),
  (2074, 2074, 'long_cycle', 'both', 28),
  (2075, 2075, 'long_cycle', 'both', 21),
  (2076, 2076, 'long_cycle', 'both', 14),
  (2077, 2077, 'long_cycle', 'both', 14),
  (2078, 2078, 'long_cycle', 'both', 68),
  (2079, 2079, 'long_cycle', 'both', 40),
  (2080, 2080, 'long_cycle', 'both', 39),
  (2081, 2081, 'long_cycle', 'both', 35),
  (2082, 2082, 'long_cycle', 'both', 20),
  (2083, 2083, 'long_cycle', 'both', 18),
  (2084, 2084, 'long_cycle', 'both', 15),
  (2085, 2085, 'long_cycle', 'both', 56),
  (2086, 2086, 'long_cycle', 'both', 49),
  (2087, 2087, 'long_cycle', 'both', 48),
  (2088, 2088, 'long_cycle', 'both', 42),
  (2089, 2089, 'long_cycle', 'both', 36),
  (2090, 2090, 'long_cycle', 'both', 31),
  (2091, 2091, 'long_cycle', 'both', 21),
  (2092, 2092, 'long_cycle', 'both', 17),
  (2093, 2093, 'long_cycle', 'both', 84),
  (2094, 2094, 'long_cycle', 'both', 67),
  (2095, 2095, 'long_cycle', 'both', 58),
  (2096, 2096, 'long_cycle', 'both', 50),
  (2097, 2097, 'long_cycle', 'both', 35),
  (2098, 2098, 'long_cycle', 'both', 32),
  (2099, 2099, 'long_cycle', 'both', 19),
  (2100, 2100, 'snatch', 'both', 181),
  (2101, 2101, 'snatch', 'both', 177),
  (2102, 2102, 'snatch', 'both', 168),
  (2103, 2103, 'snatch', 'both', 166),
  (2104, 2104, 'snatch', 'both', 153),
  (2105, 2105, 'snatch', 'both', 131),
  (2106, 2106, 'snatch', 'both', 121),
  (2107, 2107, 'snatch', 'both', 120),
  (2108, 2108, 'snatch', 'both', 118),
  (2109, 2109, 'snatch', 'both', 115),
  (2110, 2110, 'snatch', 'both', 93),
  (2111, 2111, 'snatch', 'both', 72),
  (2112, 2112, 'snatch', 'both', 67),
  (2113, 2113, 'snatch', 'both', 192),
  (2114, 2114, 'snatch', 'both', 180),
  (2115, 2115, 'snatch', 'both', 177),
  (2116, 2116, 'snatch', 'both', 171),
  (2117, 2117, 'snatch', 'both', 136),
  (2118, 2118, 'snatch', 'both', 129),
  (2119, 2119, 'snatch', 'both', 128),
  (2120, 2120, 'snatch', 'both', 102),
  (2121, 2121, 'snatch', 'both', 93),
  (2122, 2122, 'snatch', 'both', 89),
  (2123, 2123, 'snatch', 'both', 82),
  (2124, 2124, 'snatch', 'both', 69),
  (2125, 2125, 'snatch', 'both', 28),
  (2126, 2126, 'snatch', 'both', 197),
  (2127, 2127, 'snatch', 'both', 190),
  (2128, 2128, 'snatch', 'both', 180),
  (2129, 2129, 'snatch', 'both', 176),
  (2130, 2130, 'snatch', 'both', 150),
  (2131, 2131, 'snatch', 'both', 150),
  (2132, 2132, 'snatch', 'both', 120),
  (2133, 2133, 'snatch', 'both', 110),
  (2134, 2134, 'snatch', 'both', 100),
  (2135, 2135, 'snatch', 'both', 71),
  (2136, 2136, 'snatch', 'both', 213),
  (2137, 2137, 'snatch', 'both', 210),
  (2138, 2138, 'snatch', 'both', 200),
  (2139, 2139, 'snatch', 'both', 196),
  (2140, 2140, 'snatch', 'both', 178),
  (2141, 2141, 'snatch', 'both', 157),
  (2142, 2142, 'snatch', 'both', 155),
  (2143, 2143, 'snatch', 'both', 149),
  (2144, 2144, 'snatch', 'both', 139),
  (2145, 2145, 'snatch', 'both', 117),
  (2146, 2146, 'snatch', 'both', 100),
  (2147, 2147, 'snatch', 'both', 95),
  (2148, 2148, 'jerk', 'both', 130),
  (2149, 2148, 'snatch', 'both', 165),
  (2150, 2149, 'jerk', 'both', 126),
  (2151, 2149, 'snatch', 'both', 125),
  (2152, 2150, 'jerk', 'both', 101),
  (2153, 2150, 'snatch', 'both', 162),
  (2154, 2151, 'jerk', 'both', 76),
  (2155, 2151, 'snatch', 'both', 140),
  (2156, 2152, 'jerk', 'both', 84),
  (2157, 2152, 'snatch', 'both', 93),
  (2158, 2153, 'jerk', 'both', 77),
  (2159, 2153, 'snatch', 'both', 98),
  (2160, 2154, 'jerk', 'both', 48),
  (2161, 2154, 'snatch', 'both', 129),
  (2162, 2155, 'jerk', 'both', 33),
  (2163, 2155, 'snatch', 'both', 70),
  (2164, 2156, 'jerk', 'both', 12),
  (2165, 2156, 'snatch', 'both', 30),
  (2166, 2157, 'jerk', 'both', 132),
  (2167, 2157, 'snatch', 'both', 168),
  (2168, 2158, 'jerk', 'both', 122),
  (2169, 2158, 'snatch', 'both', 179),
  (2170, 2159, 'jerk', 'both', 130),
  (2171, 2159, 'snatch', 'both', 162),
  (2172, 2160, 'jerk', 'both', 102),
  (2173, 2160, 'snatch', 'both', 200),
  (2174, 2161, 'jerk', 'both', 103),
  (2175, 2161, 'snatch', 'both', 190),
  (2176, 2162, 'jerk', 'both', 109),
  (2177, 2162, 'snatch', 'both', 162),
  (2178, 2163, 'jerk', 'both', 86),
  (2179, 2163, 'snatch', 'both', 167),
  (2180, 2164, 'jerk', 'both', 67),
  (2181, 2164, 'snatch', 'both', 171),
  (2182, 2165, 'jerk', 'both', 91),
  (2183, 2165, 'snatch', 'both', 105),
  (2184, 2166, 'jerk', 'both', 62),
  (2185, 2166, 'snatch', 'both', 88),
  (2186, 2167, 'jerk', 'both', 63),
  (2187, 2167, 'snatch', 'both', 79),
  (2188, 2168, 'jerk', 'both', 49),
  (2189, 2168, 'snatch', 'both', 100),
  (2190, 2169, 'jerk', 'both', 134),
  (2191, 2169, 'snatch', 'both', 194),
  (2192, 2170, 'jerk', 'both', 125),
  (2193, 2170, 'snatch', 'both', 175),
  (2194, 2171, 'jerk', 'both', 107),
  (2195, 2171, 'snatch', 'both', 179),
  (2196, 2172, 'jerk', 'both', 128),
  (2197, 2172, 'snatch', 'both', 134),
  (2198, 2173, 'jerk', 'both', 102),
  (2199, 2173, 'snatch', 'both', 171),
  (2200, 2174, 'jerk', 'both', 111),
  (2201, 2174, 'snatch', 'both', 146),
  (2202, 2175, 'jerk', 'both', 109),
  (2203, 2175, 'snatch', 'both', 145),
  (2204, 2176, 'jerk', 'both', 90),
  (2205, 2176, 'snatch', 'both', 163),
  (2206, 2177, 'jerk', 'both', 100),
  (2207, 2177, 'snatch', 'both', 143),
  (2208, 2178, 'jerk', 'both', 105),
  (2209, 2178, 'snatch', 'both', 116),
  (2210, 2179, 'jerk', 'both', 119),
  (2211, 2179, 'snatch', 'both', 86),
  (2212, 2180, 'jerk', 'both', 90),
  (2213, 2180, 'snatch', 'both', 111),
  (2214, 2181, 'jerk', 'both', 66),
  (2215, 2181, 'snatch', 'both', 113),
  (2216, 2182, 'jerk', 'both', 70),
  (2217, 2182, 'snatch', 'both', 100),
  (2218, 2183, 'jerk', 'both', 45),
  (2219, 2183, 'snatch', 'both', 126),
  (2220, 2184, 'jerk', 'both', 50),
  (2221, 2184, 'snatch', 'both', 100),
  (2222, 2185, 'jerk', 'both', 145),
  (2223, 2185, 'snatch', 'both', 202),
  (2224, 2186, 'jerk', 'both', 140),
  (2225, 2186, 'snatch', 'both', 150),
  (2226, 2187, 'jerk', 'both', 111),
  (2227, 2187, 'snatch', 'both', 197),
  (2228, 2188, 'jerk', 'both', 130),
  (2229, 2188, 'snatch', 'both', 125),
  (2230, 2189, 'jerk', 'both', 108),
  (2231, 2189, 'snatch', 'both', 160),
  (2232, 2190, 'jerk', 'both', 92),
  (2233, 2190, 'snatch', 'both', 158),
  (2234, 2191, 'jerk', 'both', 79),
  (2235, 2191, 'snatch', 'both', 126),
  (2236, 2192, 'jerk', 'both', 69),
  (2237, 2192, 'snatch', 'both', 141),
  (2238, 2193, 'jerk', 'both', 82),
  (2239, 2193, 'snatch', 'both', 110),
  (2240, 2194, 'jerk', 'both', 92),
  (2241, 2194, 'snatch', 'both', 72),
  (2242, 2195, 'jerk', 'both', 153),
  (2243, 2195, 'snatch', 'both', 192),
  (2244, 2196, 'jerk', 'both', 135),
  (2245, 2196, 'snatch', 'both', 202),
  (2246, 2197, 'jerk', 'both', 149),
  (2247, 2197, 'snatch', 'both', 156),
  (2248, 2198, 'jerk', 'both', 135),
  (2249, 2198, 'snatch', 'both', 170),
  (2250, 2199, 'jerk', 'both', 104),
  (2251, 2199, 'snatch', 'both', 175),
  (2252, 2200, 'jerk', 'both', 108),
  (2253, 2200, 'snatch', 'both', 151),
  (2254, 2201, 'jerk', 'both', 95),
  (2255, 2201, 'snatch', 'both', 170),
  (2256, 2202, 'jerk', 'both', 116),
  (2257, 2202, 'snatch', 'both', 110),
  (2258, 2203, 'jerk', 'both', 86),
  (2259, 2203, 'snatch', 'both', 161),
  (2260, 2204, 'jerk', 'both', 97),
  (2261, 2204, 'snatch', 'both', 120),
  (2262, 2205, 'jerk', 'both', 55),
  (2263, 2205, 'snatch', 'both', 202),
  (2264, 2206, 'jerk', 'both', 86),
  (2265, 2206, 'snatch', 'both', 127),
  (2266, 2207, 'jerk', 'both', 59),
  (2267, 2207, 'snatch', 'both', 133),
  (2268, 2208, 'jerk', 'both', 170),
  (2269, 2208, 'snatch', 'both', 219),
  (2270, 2209, 'jerk', 'both', 151),
  (2271, 2209, 'snatch', 'both', 165),
  (2272, 2210, 'jerk', 'both', 111),
  (2273, 2210, 'snatch', 'both', 201),
  (2274, 2211, 'jerk', 'both', 110),
  (2275, 2211, 'snatch', 'both', 199),
  (2276, 2212, 'jerk', 'both', 117),
  (2277, 2212, 'snatch', 'both', 166),
  (2278, 2213, 'jerk', 'both', 95),
  (2279, 2213, 'snatch', 'both', 150),
  (2280, 2214, 'jerk', 'both', 73),
  (2281, 2214, 'snatch', 'both', 183),
  (2282, 2215, 'jerk', 'both', 95),
  (2283, 2215, 'snatch', 'both', 127),
  (2284, 2216, 'jerk', 'both', 86),
  (2285, 2216, 'snatch', 'both', 123),
  (2286, 2217, 'jerk', 'both', 82),
  (2287, 2217, 'snatch', 'both', 115),
  (2288, 2218, 'jerk', 'both', 144),
  (2289, 2218, 'snatch', 'both', 183),
  (2290, 2219, 'jerk', 'both', 143),
  (2291, 2219, 'snatch', 'both', 172),
  (2292, 2220, 'jerk', 'both', 138),
  (2293, 2220, 'snatch', 'both', 172),
  (2294, 2221, 'jerk', 'both', 138),
  (2295, 2221, 'snatch', 'both', 167),
  (2296, 2222, 'jerk', 'both', 121),
  (2297, 2222, 'snatch', 'both', 175),
  (2298, 2223, 'jerk', 'both', 121),
  (2299, 2223, 'snatch', 'both', 169),
  (2300, 2224, 'jerk', 'both', 120),
  (2301, 2224, 'snatch', 'both', 166),
  (2302, 2225, 'jerk', 'both', 127),
  (2303, 2225, 'snatch', 'both', 146),
  (2304, 2226, 'jerk', 'both', 119),
  (2305, 2226, 'snatch', 'both', 141),
  (2306, 2227, 'jerk', 'both', 134),
  (2307, 2227, 'snatch', 'both', 107),
  (2308, 2228, 'jerk', 'both', 95),
  (2309, 2228, 'snatch', 'both', 171),
  (2310, 2229, 'jerk', 'both', 85),
  (2311, 2229, 'snatch', 'both', 182),
  (2312, 2230, 'jerk', 'both', 102),
  (2313, 2230, 'snatch', 'both', 131);

