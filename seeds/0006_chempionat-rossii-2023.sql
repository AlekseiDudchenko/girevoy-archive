-- Чемпионат России 2023, Санкт-Петербург, 2023-06-08—2023-06-12.
-- Сгенерировано scripts/gen_seed.py из data/chempionat-rossii-2023.json, не править руками.
-- Источник — официальная Excel-книга чемпионата России 2023. В протоколе у спортсменов указаны только фамилия и имя, без отчества; дата рождения дана годом. Импорт ведётся по одной индивидуальной категории с отдельным merge и deploy. Эстафеты, командные очки и итоговый командный зачёт не импортируются; жонглирование не поддержано текущей схемой. По указанию администратора строки «снят врачом» и «не явка» в спортивном результате сохраняются как 0.
-- В исходнике нет отчеств: спортсмены сопоставляются по фамилии, имени и году рождения.
-- Данные извлечены из протокола моделью; сверка человеком не проводилась,
-- поэтому results.verified_by остаётся пустым (FR-A14).

INSERT OR IGNORE INTO regions (name, country) VALUES
  ('г. Санкт-Петербург', 'RU'),
  ('Новосибирская область', 'RU'),
  ('г.Москва', 'RU'),
  ('ЯНАО', 'RU'),
  ('Омская область', 'RU'),
  ('Курганская область', 'RU'),
  ('Тюменская область', 'RU'),
  ('ХМАО-Югра', 'RU'),
  ('Воронежская область', 'RU'),
  ('Рязанская область', 'RU'),
  ('Республика Бурятия', 'RU'),
  ('Кировская обл.', 'RU'),
  ('Калужская область', 'RU'),
  ('Томская область', 'RU'),
  ('Республика Хакасия', 'RU'),
  ('Краснодарский край', 'RU'),
  ('Самарская обл.', 'RU'),
  ('Красноярский край', 'RU'),
  ('Смоленская область', 'RU'),
  ('Челябинская область', 'RU'),
  ('Свердловская область', 'RU'),
  ('Чувашская Республика', 'RU'),
  ('Белгородская область', 'RU'),
  ('Пермский край', 'RU'),
  ('Архангельская обл.', 'RU'),
  ('Ставропольский край', 'RU'),
  ('Ярославская область', 'RU'),
  ('Нижегородская обл.', 'RU'),
  ('Алтайский край', 'RU'),
  ('Ленинградская обл.', 'RU'),
  ('Ростовская область', 'RU'),
  ('Владимирская область', 'RU'),
  ('Оренбургская обл.', 'RU'),
  ('Брянская область', 'RU'),
  ('Республика Саха (Якутия)', 'RU'),
  ('г. Санкт-Петербург+Омская обл.', 'RU'),
  ('Республика Башкортостан', 'RU'),
  ('Ивановская область', 'RU'),
  ('Республика Дагестан', 'RU'),
  ('Республика Татарстан', 'RU'),
  ('г. Санкт-Петербург+ Томская область', 'RU'),
  ('Удмуртская Республика', 'RU'),
  ('Псковская обл.', 'RU'),
  ('Вологодская обл.', 'RU'),
  ('Новгородская обл.', 'RU'),
  ('Кемеровская обл.-Кузбасс', 'RU'),
  ('Липецкая область', 'RU');

INSERT OR IGNORE INTO clubs (name, region_id) VALUES
  ('', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')),
  ('РЦСП СКиСР НСО', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')),
  ('СШОР им. В.Ф. Краевского', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'г.Москва' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU')),
  ('ВС', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'ХМАО-Югра' AND country = 'RU')),
  ('ВС РФ', (SELECT id FROM regions WHERE name = 'Воронежская область' AND country = 'RU')),
  ('ДДЮ «Алые Паруса»', (SELECT id FROM regions WHERE name = 'Рязанская область' AND country = 'RU')),
  ('ВС', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')),
  ('КОГАУ "СШОР "Юность"', (SELECT id FROM regions WHERE name = 'Кировская обл.' AND country = 'RU')),
  ('СШОР "Маршал"', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')),
  ('сш', (SELECT id FROM regions WHERE name = 'Республика Хакасия' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')),
  ('ВС', (SELECT id FROM regions WHERE name = 'Краснодарский край' AND country = 'RU')),
  ('ЦВР', (SELECT id FROM regions WHERE name = 'Самарская обл.' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Красноярский край' AND country = 'RU')),
  ('ВС РФ', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Свердловская область' AND country = 'RU')),
  ('СШ "Энергия"', (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU')),
  ('СШОР№5 г. Белгород', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')),
  ('ДС ДЮ "Прикамье"', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Архангельская обл.' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')),
  ('НИУ БелГУ', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Ставропольский край' AND country = 'RU')),
  ('ДЮСШ №2', (SELECT id FROM regions WHERE name = 'Краснодарский край' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Нижегородская обл.' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Ленинградская обл.' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Ростовская область' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Владимирская область' AND country = 'RU')),
  ('СШ № 1 им Л.Д. Ковалевского', (SELECT id FROM regions WHERE name = 'Оренбургская обл.' AND country = 'RU')),
  ('Профсоюзы', (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU')),
  ('СШОР№1,ВС', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')),
  ('ДЮСШ"Юность"', (SELECT id FROM regions WHERE name = 'Краснодарский край' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Республика Хакасия' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Воронежская область' AND country = 'RU')),
  ('МБУ ДО СШ «Старт»', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')),
  ('СШОР Губкин', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Республика Саха (Якутия)' AND country = 'RU')),
  ('СШОР№5 г. Белгород / 
СШ «Юность»', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург+Омская обл.' AND country = 'RU')),
  ('СШ  ', (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Ивановская область' AND country = 'RU')),
  ('ГБУ РД "СШ Белиджи"', (SELECT id FROM regions WHERE name = 'Республика Дагестан' AND country = 'RU')),
  ('ВС РФ', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU')),
  ('ДЮСШ№2', (SELECT id FROM regions WHERE name = 'Краснодарский край' AND country = 'RU')),
  ('Росгвардия', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург+ Томская область' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Удмуртская Республика' AND country = 'RU')),
  ('СШОР им. В.Ф. Краевского', (SELECT id FROM regions WHERE name = 'Псковская обл.' AND country = 'RU')),
  ('ВС', (SELECT id FROM regions WHERE name = 'Ростовская область' AND country = 'RU')),
  ('ВС', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')),
  ('Динамо', (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU')),
  ('ДС ДЮ Прикамье', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Вологодская обл.' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Новгородская обл.' AND country = 'RU')),
  ('СШ «Юность»', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')),
  ('СШОР№1', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')),
  ('СШ"Юность"', (SELECT id FROM regions WHERE name = 'Краснодарский край' AND country = 'RU')),
  ('ДЮСШ Татнефть "Олимп"', (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU')),
  ('МАУ СШ', (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Краснодарский край' AND country = 'RU')),
  ('МАУ ДО "Тюльганская ДЮСШ"', (SELECT id FROM regions WHERE name = 'Оренбургская обл.' AND country = 'RU')),
  ('СШ', (SELECT id FROM regions WHERE name = 'Республика Хакасия' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Кемеровская обл.-Кузбасс' AND country = 'RU')),
  ('', (SELECT id FROM regions WHERE name = 'Липецкая область' AND country = 'RU')),
  ('МАУ ДО Тюльганская ДЮСШ', (SELECT id FROM regions WHERE name = 'Оренбургская обл.' AND country = 'RU'));

INSERT OR IGNORE INTO federations (name, short_name, country) VALUES
  ('Всероссийская федерация гиревого спорта', 'ВФГС', 'RU');

INSERT INTO competitions (id, slug, name, date_start, date_end, city, country, competition_rank_id, federation_id, source_url, is_published) VALUES
  (3001, 'chempionat-rossii-2023', 'Чемпионат России 2023', '2023-06-08', '2023-06-12', 'Санкт-Петербург', 'RU', (SELECT id FROM competition_ranks WHERE code = 'national_ch'), (SELECT id FROM federations WHERE name = 'Всероссийская федерация гиревого спорта'), NULL, 1);

INSERT INTO protocols (id, competition_id, r2_key, filename, page_count, is_scan, status, published_at) VALUES
  (3001, 3001, 'protocols/chempionat-rossii-2023.pdf', 'chempionat-rossii-2023.xlsx', 29, 0, 'published', '2023-06-08');

INSERT INTO categories (id, competition_id, discipline_id, sex, age_group_id, division_id, bell_kg, hands, time_limit_min, weight_class_raw, weight_class_kg, weight_class_is_open, participants_declared, is_deferred, sort_order) VALUES
  (3001, 3001, (SELECT id FROM disciplines WHERE code = 'biathlon'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '63', 63, 0, 12, 0, 1),
  (3002, 3001, (SELECT id FROM disciplines WHERE code = 'biathlon'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '68', 68, 0, 14, 0, 2),
  (3003, 3001, (SELECT id FROM disciplines WHERE code = 'biathlon'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '73', 73, 0, 18, 0, 3),
  (3004, 3001, (SELECT id FROM disciplines WHERE code = 'biathlon'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '78', 78, 0, 16, 0, 4),
  (3005, 3001, (SELECT id FROM disciplines WHERE code = 'biathlon'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '85', 85, 0, 14, 0, 5),
  (3006, 3001, (SELECT id FROM disciplines WHERE code = 'biathlon'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '95+', 95, 1, 11, 0, 6),
  (3007, 3001, (SELECT id FROM disciplines WHERE code = 'biathlon'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '95', 95, 0, 15, 0, 7),
  (3008, 3001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '58', 58, 0, 8, 0, 8),
  (3009, 3001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '63', 63, 0, 6, 0, 9),
  (3010, 3001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '68+', 68, 1, 10, 0, 10),
  (3011, 3001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '68', 68, 0, 9, 0, 11),
  (3012, 3001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '63', 63, 0, 14, 0, 12),
  (3013, 3001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '68', 68, 0, 17, 0, 13),
  (3014, 3001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '73', 73, 0, 12, 0, 14),
  (3015, 3001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '78', 78, 0, 17, 0, 15),
  (3016, 3001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '85', 85, 0, 17, 0, 16),
  (3017, 3001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '95+', 95, 1, 12, 0, 17),
  (3018, 3001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '95', 95, 0, 10, 0, 18),
  (3019, 3001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'one', 10, '58', 58, 0, 18, 0, 19),
  (3020, 3001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'one', 10, '63', 63, 0, 14, 0, 20),
  (3021, 3001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'one', 10, '68+', 68, 1, 15, 0, 21),
  (3022, 3001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'one', 10, '68', 68, 0, 14, 0, 22);

INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бенидзе', 'Джони', NULL, 1990, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Кириллов С.А.Огарев В.Я', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бенидзе' AND a.first_name = 'Джони' AND a.birth_year = 1990 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бутенко', 'Евгений', NULL, 1995, 'm', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РЦСП СКиСР НСО' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Бутенко А.А., Бутенко И.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бутенко' AND a.first_name = 'Евгений' AND a.birth_year = 1995 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Смагулов', 'Нурсултан', NULL, 1999, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Катаев И.В., Смагулов Ш.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Смагулов' AND a.first_name = 'Нурсултан' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Маринкин', 'Егор', NULL, 2003, 'm', (SELECT id FROM regions WHERE name = 'г.Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г.Москва' AND country = 'RU')), 'Никольский С.А.Бирюков С.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Маринкин' AND a.first_name = 'Егор' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ховалко', 'Василий', NULL, 1993, 'm', (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU')), 'Донских А.И., Бабичев М.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ховалко' AND a.first_name = 'Василий' AND a.birth_year = 1993 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Уметбаев', 'Денислам', NULL, 1994, 'm', (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU')), 'Походяева А.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Уметбаев' AND a.first_name = 'Денислам' AND a.birth_year = 1994 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ильясов', 'Какен', NULL, 1993, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Анасенко А.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ильясов' AND a.first_name = 'Какен' AND a.birth_year = 1993 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Манаков', 'Трофим', NULL, 2000, 'm', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')), 'Дементьев А.Ф.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Манаков' AND a.first_name = 'Трофим' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Обаранчук', 'Ростислав', NULL, 2003, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Сотников Е.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Обаранчук' AND a.first_name = 'Ростислав' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Петелин', 'Александр', NULL, 1987, 'm', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')), 'Калмаков С.И., Айдбаев И.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Петелин' AND a.first_name = 'Александр' AND a.birth_year = 1987 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Галеев', 'Роман', NULL, 2005, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Резонов А.В.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Галеев' AND a.first_name = 'Роман' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Барков', 'Егор', NULL, 2005, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Барков А.П.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Барков' AND a.first_name = 'Егор' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Рябков', 'Алексей', NULL, 1993, 'm', (SELECT id FROM regions WHERE name = 'ХМАО-Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'ХМАО-Югра' AND country = 'RU')), 'Шпартко М.А., Алтухов Д.В., Войнов А.Б.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Рябков' AND a.first_name = 'Алексей' AND a.birth_year = 1993 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Щербин', 'Олег', NULL, 1989, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Никифоров А.В.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Щербин' AND a.first_name = 'Олег' AND a.birth_year = 1989 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Зуев', 'Владислав', NULL, 2000, 'm', (SELECT id FROM regions WHERE name = 'Воронежская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС РФ' AND region_id = (SELECT id FROM regions WHERE name = 'Воронежская область' AND country = 'RU')), 'Колесниченко Н.А., Частихин А.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Зуев' AND a.first_name = 'Владислав' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Шаров', 'Максим', NULL, 2000, 'm', (SELECT id FROM regions WHERE name = 'Рязанская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ДДЮ «Алые Паруса»' AND region_id = (SELECT id FROM regions WHERE name = 'Рязанская область' AND country = 'RU')), 'Кулаков И.И.,Шматов И.Б.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Шаров' AND a.first_name = 'Максим' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Усольцев', 'Александр', NULL, 1992, 'm', (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU')), 'Ефимов А.В., Емельянов Н.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Усольцев' AND a.first_name = 'Александр' AND a.birth_year = 1992 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Коломин', 'Дмитрий', NULL, 1999, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Рассадин А.А., Хлебодаров А.Г., Леонов С.Т.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Коломин' AND a.first_name = 'Дмитрий' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Егоров', 'Иван', NULL, 1989, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Руднев С.Л.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Егоров' AND a.first_name = 'Иван' AND a.birth_year = 1989 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Морозович', 'Владислав', NULL, 1999, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Сагандыков К.К.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Морозович' AND a.first_name = 'Владислав' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Подволоцкий', 'Сергей', NULL, 1997, 'm', (SELECT id FROM regions WHERE name = 'Кировская обл.' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КОГАУ "СШОР "Юность"' AND region_id = (SELECT id FROM regions WHERE name = 'Кировская обл.' AND country = 'RU')), 'Малков Е.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Подволоцкий' AND a.first_name = 'Сергей' AND a.birth_year = 1997 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Остриков', 'Максим', NULL, 2005, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Маршал"' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Пянко И.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Остриков' AND a.first_name = 'Максим' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Иванов', 'Евгений', NULL, 1987, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Хвостов А.Ф., Руднев С.Л., Ажермачев А.Б.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Иванов' AND a.first_name = 'Евгений' AND a.birth_year = 1987 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Чендылов', 'Александр', NULL, 2001, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Катаев И.В.,Сагандыков К.К.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Чендылов' AND a.first_name = 'Александр' AND a.birth_year = 2001 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Метелёв', 'Никита', NULL, 2005, 'm', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')), 'Бобров В.С.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Метелёв' AND a.first_name = 'Никита' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бенидзе', 'Спартак', NULL, 2002, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Бенидзе А.А.Огарев В.Я', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бенидзе' AND a.first_name = 'Спартак' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Рассадин', 'Андрей', NULL, 1989, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Леонов С.Т., Руднев С.Л.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Рассадин' AND a.first_name = 'Андрей' AND a.birth_year = 1989 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Сулейманов', 'Мовсар', NULL, 1989, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Маршал"' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Трофимов М.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Сулейманов' AND a.first_name = 'Мовсар' AND a.birth_year = 1989 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Жибинов', 'Федор', NULL, 2004, 'm', (SELECT id FROM regions WHERE name = 'Республика Хакасия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'сш' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Хакасия' AND country = 'RU')), 'Жибинов К.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Жибинов' AND a.first_name = 'Федор' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Карагаев', 'Юрий', NULL, 1994, 'm', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Бутенко А.А., Шевелев Д.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Карагаев' AND a.first_name = 'Юрий' AND a.birth_year = 1994 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Мащенко', 'Олег', NULL, 1983, 'm', (SELECT id FROM regions WHERE name = 'Краснодарский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Краснодарский край' AND country = 'RU')), 'Мащенко В.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Мащенко' AND a.first_name = 'Олег' AND a.birth_year = 1983 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Балдин', 'Александр', NULL, 1993, 'm', (SELECT id FROM regions WHERE name = 'Самарская обл.' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ЦВР' AND region_id = (SELECT id FROM regions WHERE name = 'Самарская обл.' AND country = 'RU')), 'Бахтов И.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Балдин' AND a.first_name = 'Александр' AND a.birth_year = 1993 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Стрекаловских', 'Николай', NULL, 1993, 'm', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')), 'Стрекаловских С.К., Садыков Р.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Стрекаловских' AND a.first_name = 'Николай' AND a.birth_year = 1993 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Семёнов', 'Андрей', NULL, 1991, 'm', (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU')), 'Походяева А.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Семёнов' AND a.first_name = 'Андрей' AND a.birth_year = 1991 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Буянов', 'Станислав', NULL, 2000, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Сотников Е.,Гнездилов В.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Буянов' AND a.first_name = 'Станислав' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Воронов', 'Иван', NULL, 1991, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Кудашев Д.А., Балагуров С.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Воронов' AND a.first_name = 'Иван' AND a.birth_year = 1991 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Каргин', 'Сергей', NULL, 1998, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Рассадин А.А., Каргин Я.Л., Леонов С.Т.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Каргин' AND a.first_name = 'Сергей' AND a.birth_year = 1998 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Васин', 'Артем', NULL, 2007, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Маршал"' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Пянко И.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Васин' AND a.first_name = 'Артем' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Голиков', 'Роман', NULL, 1990, 'm', (SELECT id FROM regions WHERE name = 'Красноярский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Красноярский край' AND country = 'RU')), 'Рябков А.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Голиков' AND a.first_name = 'Роман' AND a.birth_year = 1990 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Волдаев', 'Александр', NULL, 2000, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Ажермачев А.Б., Перемитин Ф.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Волдаев' AND a.first_name = 'Александр' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Лаптев', 'Александр', NULL, 2002, 'm', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС РФ' AND region_id = (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')), 'Калякин С.В., Леонов С.Т.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Лаптев' AND a.first_name = 'Александр' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Подгорный', 'Иван', NULL, 2003, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Денисов И.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Подгорный' AND a.first_name = 'Иван' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Карнаухов', 'Даниил', NULL, 2001, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Рассадин А.А., Хлебодаров А.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Карнаухов' AND a.first_name = 'Даниил' AND a.birth_year = 2001 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Юров', 'Евгений', NULL, 2004, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Трофимов С.Н.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Юров' AND a.first_name = 'Евгений' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Квашнин', 'Михаил', NULL, 1988, 'm', (SELECT id FROM regions WHERE name = 'Свердловская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Свердловская область' AND country = 'RU')), 'Хвостов А.В., Чагаев А.Е.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Квашнин' AND a.first_name = 'Михаил' AND a.birth_year = 1988 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Баранов', 'Егор', NULL, 1992, 'm', (SELECT id FROM regions WHERE name = 'г.Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г.Москва' AND country = 'RU')), 'Шаповалов Е.Г.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Баранов' AND a.first_name = 'Егор' AND a.birth_year = 1992 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ташланов', 'Илья', NULL, 1987, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Денисов И.Н.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ташланов' AND a.first_name = 'Илья' AND a.birth_year = 1987 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бобров', 'Владимир', NULL, 1989, 'm', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')), 'Лесников П.Я., Бакум К.Е.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бобров' AND a.first_name = 'Владимир' AND a.birth_year = 1989 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Иванов', 'Алексей', NULL, 1995, 'm', (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ "Энергия"' AND region_id = (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU')), 'Глинкин Б.Н.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Иванов' AND a.first_name = 'Алексей' AND a.birth_year = 1995 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кед', 'Максим', NULL, 2002, 'm', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')), 'Бобров В.С.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кед' AND a.first_name = 'Максим' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Павлов', 'Валерий', NULL, 1987, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Ажермачев А.Б.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Павлов' AND a.first_name = 'Валерий' AND a.birth_year = 1987 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Баев', 'Константин', NULL, 1993, 'm', (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU')), 'Щекотов И.В.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Баев' AND a.first_name = 'Константин' AND a.birth_year = 1993 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ванин', 'Виктор', NULL, 1991, 'm', (SELECT id FROM regions WHERE name = 'Рязанская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ДДЮ «Алые Паруса»' AND region_id = (SELECT id FROM regions WHERE name = 'Рязанская область' AND country = 'RU')), 'Шматов И.Б.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ванин' AND a.first_name = 'Виктор' AND a.birth_year = 1991 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Любимский', 'Сергей', NULL, 1992, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Ташланов И.С., Блохин И.А., Леонов С.Т.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Любимский' AND a.first_name = 'Сергей' AND a.birth_year = 1992 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Щетков', 'Иван', NULL, 2003, 'm', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')), 'Бобров В.С.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Щетков' AND a.first_name = 'Иван' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Фомин', 'Федор', NULL, 2004, 'm', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР№5 г. Белгород' AND region_id = (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')), 'Меркулин С.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Фомин' AND a.first_name = 'Федор' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Береза', 'Егор', NULL, 2003, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Маршал"' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Пянко И.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Береза' AND a.first_name = 'Егор' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Вахонин', 'Егор', NULL, 2005, 'm', (SELECT id FROM regions WHERE name = 'Кировская обл.' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КОГАУ "СШОР "Юность"' AND region_id = (SELECT id FROM regions WHERE name = 'Кировская обл.' AND country = 'RU')), 'Малков Е.И. ', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Вахонин' AND a.first_name = 'Егор' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Майоров', 'Иван', NULL, 2000, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Дубровин Д.А.  Кириллов С.А', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Майоров' AND a.first_name = 'Иван' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Микшин', 'Сергей', NULL, 2000, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Сотников Е', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Микшин' AND a.first_name = 'Сергей' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Черкашин', 'Дмитрий', NULL, 1999, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Тимофеев Н.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Черкашин' AND a.first_name = 'Дмитрий' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Плотников', 'Вячеслав', NULL, 1998, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Потапов О.Ю., Симушин А.М.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Плотников' AND a.first_name = 'Вячеслав' AND a.birth_year = 1998 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Маликов', 'Данил', NULL, 2001, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ДС ДЮ "Прикамье"' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Мошев Д.И., Панфилов Г.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Маликов' AND a.first_name = 'Данил' AND a.birth_year = 2001 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Анасенко', 'Антон', NULL, 1979, 'm', (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU')), 'Жилин А.В., Козленко В.Н.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Анасенко' AND a.first_name = 'Антон' AND a.birth_year = 1979 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ефремов', 'Сергей', NULL, 1997, 'm', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Бутенко А.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ефремов' AND a.first_name = 'Сергей' AND a.birth_year = 1997 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ветров', 'Денис', NULL, 1989, 'm', (SELECT id FROM regions WHERE name = 'г.Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г.Москва' AND country = 'RU')), 'Самостоятельно', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ветров' AND a.first_name = 'Денис' AND a.birth_year = 1989 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Козлов', 'Дмитрий', NULL, 2000, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Дубровин Д.А.  Кириллов С.А', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Козлов' AND a.first_name = 'Дмитрий' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Поздеев', 'Андрей', NULL, 1990, 'm', (SELECT id FROM regions WHERE name = 'Архангельская обл.' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Архангельская обл.' AND country = 'RU')), 'Хвостов А.В., Сахаров Н.Л', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Поздеев' AND a.first_name = 'Андрей' AND a.birth_year = 1990 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Николаев', 'Аркадий', NULL, 2002, 'm', (SELECT id FROM regions WHERE name = 'ХМАО-Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'ХМАО-Югра' AND country = 'RU')), 'Шпартко М.А., Рябков А.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Николаев' AND a.first_name = 'Аркадий' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Клочек', 'Александр', NULL, 2001, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Ажермачев А.Б.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Клочек' AND a.first_name = 'Александр' AND a.birth_year = 2001 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Житихин', 'Владислав', NULL, 1994, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Балагуров С.В., Кудашев Д.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Житихин' AND a.first_name = 'Владислав' AND a.birth_year = 1994 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Курдюков', 'Василий', NULL, 1997, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Анасенко А.В., Климов А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Курдюков' AND a.first_name = 'Василий' AND a.birth_year = 1997 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Дьячков', 'Олег', NULL, 1995, 'm', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР№5 г. Белгород' AND region_id = (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')), 'Меркулин С.В.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Дьячков' AND a.first_name = 'Олег' AND a.birth_year = 1995 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кодиров', 'Абдумаъруф', NULL, 2000, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ДС ДЮ "Прикамье"' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Мошев Д.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кодиров' AND a.first_name = 'Абдумаъруф' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Марков', 'Иван', NULL, 1995, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Семёнов А.Н., Фадеев А.С.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Марков' AND a.first_name = 'Иван' AND a.birth_year = 1995 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Розмазнин', 'Илья', NULL, 2000, 'm', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'НИУ БелГУ' AND region_id = (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')), 'Сылка С.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Розмазнин' AND a.first_name = 'Илья' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Июльский', 'Дмитрий', NULL, 1993, 'm', (SELECT id FROM regions WHERE name = 'г.Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г.Москва' AND country = 'RU')), 'Салов П.С.Алфёрова В.Я.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Июльский' AND a.first_name = 'Дмитрий' AND a.birth_year = 1993 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Орлов', 'Сергей', NULL, 2005, 'm', (SELECT id FROM regions WHERE name = 'Ставропольский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Ставропольский край' AND country = 'RU')), 'Петров В.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Орлов' AND a.first_name = 'Сергей' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бурлака', 'Сергей', NULL, 1998, 'm', (SELECT id FROM regions WHERE name = 'Краснодарский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ДЮСШ №2' AND region_id = (SELECT id FROM regions WHERE name = 'Краснодарский край' AND country = 'RU')), 'Голиков В.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бурлака' AND a.first_name = 'Сергей' AND a.birth_year = 1998 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Чирков', 'Леонид', NULL, 2003, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Трофимов М.А.,Гуров В.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Чирков' AND a.first_name = 'Леонид' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Потатуев', 'Артем', NULL, 1992, 'm', (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU')), 'Егоров В.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Потатуев' AND a.first_name = 'Артем' AND a.birth_year = 1992 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Афонин', 'Игорь', NULL, 1992, 'm', (SELECT id FROM regions WHERE name = 'Нижегородская обл.' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Нижегородская обл.' AND country = 'RU')), 'Разживин А.Е.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Афонин' AND a.first_name = 'Игорь' AND a.birth_year = 1992 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Куваев', 'Дмитрий', NULL, 1985, 'm', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')), 'самостоятельно', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Куваев' AND a.first_name = 'Дмитрий' AND a.birth_year = 1985 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Климков', 'Дмитрий', NULL, 1985, 'm', (SELECT id FROM regions WHERE name = 'Ленинградская обл.' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Ленинградская обл.' AND country = 'RU')), 'Давыдов А.А.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Климков' AND a.first_name = 'Дмитрий' AND a.birth_year = 1985 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Донских', 'Александр', NULL, 1990, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Анасенко А.В.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Донских' AND a.first_name = 'Александр' AND a.birth_year = 1990 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Турищев', 'Дмитрий', NULL, 1992, 'm', (SELECT id FROM regions WHERE name = 'г.Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г.Москва' AND country = 'RU')), 'Бирюков А.С.Винтовкин Н.В.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Турищев' AND a.first_name = 'Дмитрий' AND a.birth_year = 1992 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Гуров', 'Владимир', NULL, 1978, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Маршал"' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Трофимов М.А.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Гуров' AND a.first_name = 'Владимир' AND a.birth_year = 1978 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Филиппов', 'Максим', NULL, 1993, 'm', (SELECT id FROM regions WHERE name = 'Краснодарский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Краснодарский край' AND country = 'RU')), 'Труш А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Филиппов' AND a.first_name = 'Максим' AND a.birth_year = 1993 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кирюхин', 'Роман', NULL, 1997, 'm', (SELECT id FROM regions WHERE name = 'г.Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г.Москва' AND country = 'RU')), 'Соловьев А.В.Ландин А.Ю.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кирюхин' AND a.first_name = 'Роман' AND a.birth_year = 1997 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Черкашин', 'Иван', NULL, 1999, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Тимофеев Н.А., Черкашин Д.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Черкашин' AND a.first_name = 'Иван' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Брюханов', 'Данила', NULL, 1995, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Литвинко В.С', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Брюханов' AND a.first_name = 'Данила' AND a.birth_year = 1995 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Пивень', 'Андрей', NULL, 2003, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Рассадин А.А., Корягин П.С.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Пивень' AND a.first_name = 'Андрей' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Юрастов', 'Станислав', NULL, 1983, 'm', (SELECT id FROM regions WHERE name = 'Ростовская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Ростовская область' AND country = 'RU')), 'Потапов С.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Юрастов' AND a.first_name = 'Станислав' AND a.birth_year = 1983 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Антипов', 'Пётр', NULL, 1993, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Битунов Г.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Антипов' AND a.first_name = 'Пётр' AND a.birth_year = 1993 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Дунаев', 'Дмитрий', NULL, 2000, 'm', (SELECT id FROM regions WHERE name = 'Кировская обл.' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КОГАУ "СШОР "Юность"' AND region_id = (SELECT id FROM regions WHERE name = 'Кировская обл.' AND country = 'RU')), 'Малков Е.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Дунаев' AND a.first_name = 'Дмитрий' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Дубков', 'Артем', NULL, 1994, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Елисеев В.С., Барков А.П., Ажермачев А.Б.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Дубков' AND a.first_name = 'Артем' AND a.birth_year = 1994 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Минибаев', 'Альзаф', NULL, 1987, 'm', (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU')), 'Минибаев А.М., Жилин А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Минибаев' AND a.first_name = 'Альзаф' AND a.birth_year = 1987 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Сисейкин', 'Максим', NULL, 1993, 'm', (SELECT id FROM regions WHERE name = 'Владимирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Владимирская область' AND country = 'RU')), 'Арифулин А.Н.,Крупин А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Сисейкин' AND a.first_name = 'Максим' AND a.birth_year = 1993 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Давыдов', 'Антон', NULL, 1982, 'm', (SELECT id FROM regions WHERE name = 'Ленинградская обл.' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Ленинградская обл.' AND country = 'RU')), 'Виноградов М.Е.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Давыдов' AND a.first_name = 'Антон' AND a.birth_year = 1982 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ломов', 'Михаил', NULL, 2002, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Фадеев А.С.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ломов' AND a.first_name = 'Михаил' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Трофимова', 'Милена', NULL, 2007, 'f', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Маршал"' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Пянко И.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Трофимова' AND a.first_name = 'Милена' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Сатлыкова', 'Эльвира', NULL, 2000, 'f', (SELECT id FROM regions WHERE name = 'Оренбургская обл.' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ № 1 им Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская обл.' AND country = 'RU')), 'Баранов В.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Сатлыкова' AND a.first_name = 'Эльвира' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Лазарева', 'Анастасия', NULL, 1991, 'f', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Петров В.М.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Лазарева' AND a.first_name = 'Анастасия' AND a.birth_year = 1991 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Матвеева', 'Елена', NULL, 1974, 'f', (SELECT id FROM regions WHERE name = 'Кировская обл.' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КОГАУ "СШОР "Юность"' AND region_id = (SELECT id FROM regions WHERE name = 'Кировская обл.' AND country = 'RU')), 'Малков Е.И.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Матвеева' AND a.first_name = 'Елена' AND a.birth_year = 1974 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Прохорова', 'Ангелина', NULL, 2005, 'f', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Бутенко И.А.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Прохорова' AND a.first_name = 'Ангелина' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Пестерева', 'Алена', NULL, 2001, 'f', (SELECT id FROM regions WHERE name = 'ХМАО-Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'ХМАО-Югра' AND country = 'RU')), 'Садыков Р. И., Лепехов Г.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Пестерева' AND a.first_name = 'Алена' AND a.birth_year = 2001 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Семирунняя', 'Александра', NULL, 2006, 'f', (SELECT id FROM regions WHERE name = 'Ростовская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Ростовская область' AND country = 'RU')), 'Семирунний В.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Семирунняя' AND a.first_name = 'Александра' AND a.birth_year = 2006 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Фукс', 'Карина', NULL, 2002, 'f', (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Профсоюзы' AND region_id = (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU')), 'Гомонов В.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Фукс' AND a.first_name = 'Карина' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Барбакова', 'Александра', NULL, 2004, 'f', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Маршал"' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Пянко И.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Барбакова' AND a.first_name = 'Александра' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Гаврилова', 'Виктория', NULL, 2003, 'f', (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU')), 'Кузнецов О.Г.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Гаврилова' AND a.first_name = 'Виктория' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Васькина', 'Алина', NULL, 1999, 'f', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР№1,ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')), 'Шванев В.Б.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Васькина' AND a.first_name = 'Алина' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Берчатова', 'Мария', NULL, 2005, 'f', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')), 'Шарипов Д.Т.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Берчатова' AND a.first_name = 'Мария' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Походяева', 'Александра', NULL, 1990, 'f', (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU')), 'Жилин А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Походяева' AND a.first_name = 'Александра' AND a.birth_year = 1990 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кутенкова', 'Анастасия', NULL, 1997, 'f', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Рассадин А.А., Леонов С.Т.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кутенкова' AND a.first_name = 'Анастасия' AND a.birth_year = 1997 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Мартынова', 'Ирина', NULL, 1999, 'f', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Маршал"' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Трофимов М.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Мартынова' AND a.first_name = 'Ирина' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Полякова', 'Полина', NULL, 1999, 'f', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Барков А.П.  Мартьянов А.В. Садыков Р.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Полякова' AND a.first_name = 'Полина' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Круглова', 'Виктория', NULL, 2004, 'f', (SELECT id FROM regions WHERE name = 'Краснодарский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ДЮСШ"Юность"' AND region_id = (SELECT id FROM regions WHERE name = 'Краснодарский край' AND country = 'RU')), 'Кацюба А.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Круглова' AND a.first_name = 'Виктория' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ландина', 'Алена', NULL, 2006, 'f', (SELECT id FROM regions WHERE name = 'г.Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г.Москва' AND country = 'RU')), 'Ландин А.Ю.,Турищев Д.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ландина' AND a.first_name = 'Алена' AND a.birth_year = 2006 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Врубель', 'Дарья', NULL, 2000, 'f', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Сагандыков К.К., Переверзев Н.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Врубель' AND a.first_name = 'Дарья' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Иванова', 'Анна', NULL, 2003, 'f', (SELECT id FROM regions WHERE name = 'Республика Хакасия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Хакасия' AND country = 'RU')), 'Жибинов К.В.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Иванова' AND a.first_name = 'Анна' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Берест', 'Александра', NULL, 2002, 'f', (SELECT id FROM regions WHERE name = 'Оренбургская обл.' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ № 1 им Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская обл.' AND country = 'RU')), 'Баранов В.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Берест' AND a.first_name = 'Александра' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Насонова', 'Виктория', NULL, 1999, 'f', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Шаров Н.Ф., Чепуштанов И.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Насонова' AND a.first_name = 'Виктория' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Лысенко', 'Дарья', NULL, 2005, 'f', (SELECT id FROM regions WHERE name = 'Ростовская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Ростовская область' AND country = 'RU')), 'Семирунний В.А.', (SELECT id FROM sport_ranks WHERE code = 'ii')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Лысенко' AND a.first_name = 'Дарья' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Яськова', 'Елена', NULL, 2003, 'f', (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Профсоюзы' AND region_id = (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU')), 'Гомонов В.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Яськова' AND a.first_name = 'Елена' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Воропаева', 'Виктория', NULL, 2004, 'f', (SELECT id FROM regions WHERE name = 'Воронежская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Воронежская область' AND country = 'RU')), 'Сорокин Н. Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Воропаева' AND a.first_name = 'Виктория' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Билибина', 'Елизавета', NULL, 2004, 'f', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ «Старт»' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Кадыков П.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Билибина' AND a.first_name = 'Елизавета' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Фирулева', 'Василиса', NULL, 2004, 'f', (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU')), 'Бабичев М.А.,Анасенко А.В', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Фирулева' AND a.first_name = 'Василиса' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Куцанова', 'Анастасия', NULL, 2006, 'f', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Панов А.А., Новиков А.В.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Куцанова' AND a.first_name = 'Анастасия' AND a.birth_year = 2006 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ельчанинова', 'Вероника', NULL, 2003, 'f', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Елисеева Н.А., Переверзев Н.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ельчанинова' AND a.first_name = 'Вероника' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Башарова', 'Виктория', NULL, 1993, 'f', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Каргин С.Я., Рассадин А.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Башарова' AND a.first_name = 'Виктория' AND a.birth_year = 1993 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кошурникова', 'Анастасия', NULL, 2003, 'f', (SELECT id FROM regions WHERE name = 'ХМАО-Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'ХМАО-Югра' AND country = 'RU')), 'Шпартко М.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кошурникова' AND a.first_name = 'Анастасия' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бадашкова', 'Нина', NULL, 1991, 'f', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Бутенко И.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бадашкова' AND a.first_name = 'Нина' AND a.birth_year = 1991 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Альянова', 'Виктория', NULL, 2004, 'f', (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Профсоюзы' AND region_id = (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU')), 'Гомонов В.Н.Лукьянчиков Ю.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Альянова' AND a.first_name = 'Виктория' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Недорезов', 'Василий', NULL, 1992, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Рассадин А.А., Любимский С.А., Леонов С.Т.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Недорезов' AND a.first_name = 'Василий' AND a.birth_year = 1992 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Курунов', 'Анатолий', NULL, 1999, 'm', (SELECT id FROM regions WHERE name = 'Оренбургская обл.' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ № 1 им Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская обл.' AND country = 'RU')), 'Баранов В.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Курунов' AND a.first_name = 'Анатолий' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Руднев', 'Руслан', NULL, 1994, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Руднев С.Л.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Руднев' AND a.first_name = 'Руслан' AND a.birth_year = 1994 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Жбанов', 'Алексей', NULL, 1986, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Барков А.П.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Жбанов' AND a.first_name = 'Алексей' AND a.birth_year = 1986 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Черепанов', 'Антон', NULL, 2003, 'm', (SELECT id FROM regions WHERE name = 'ХМАО-Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'ХМАО-Югра' AND country = 'RU')), 'Пестерева А.А., Садыков Р.И., Барков А.П.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Черепанов' AND a.first_name = 'Антон' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бедный', 'Даниил', NULL, 2005, 'm', (SELECT id FROM regions WHERE name = 'Краснодарский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ДЮСШ"Юность"' AND region_id = (SELECT id FROM regions WHERE name = 'Краснодарский край' AND country = 'RU')), 'Кацюба А.И.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бедный' AND a.first_name = 'Даниил' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Якушев', 'Роман', NULL, 2002, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Любимский С.А., Леонов С.Т.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Якушев' AND a.first_name = 'Роман' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Сухинин', 'Арсений', NULL, 2002, 'm', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')), 'Айдбаев И.Н.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Сухинин' AND a.first_name = 'Арсений' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Тананин', 'Вячеслав', NULL, 1997, 'm', (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU')), 'Латыпов Е.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Тананин' AND a.first_name = 'Вячеслав' AND a.birth_year = 1997 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Цвик', 'Данил', NULL, 2003, 'm', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР№1,ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')), 'Сергеев С.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Цвик' AND a.first_name = 'Данил' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Лупандин', 'Сергей', NULL, 1997, 'm', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР Губкин' AND region_id = (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')), 'Конев А.В.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Лупандин' AND a.first_name = 'Сергей' AND a.birth_year = 1997 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кривко', 'Никита', NULL, 2002, 'm', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР№5 г. Белгород' AND region_id = (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')), 'Вильган А.П.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кривко' AND a.first_name = 'Никита' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Неверов', 'Аким', NULL, 2000, 'm', (SELECT id FROM regions WHERE name = 'Кировская обл.' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КОГАУ "СШОР "Юность"' AND region_id = (SELECT id FROM regions WHERE name = 'Кировская обл.' AND country = 'RU')), 'Малков Е.И.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Неверов' AND a.first_name = 'Аким' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Иванов', 'Евгений', NULL, 1997, 'm', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР№1,ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')), 'Шванев В.Б.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Иванов' AND a.first_name = 'Евгений' AND a.birth_year = 1997 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Новоселов', 'Андрей', NULL, 2004, 'm', (SELECT id FROM regions WHERE name = 'Кировская обл.' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КОГАУ "СШОР "Юность"' AND region_id = (SELECT id FROM regions WHERE name = 'Кировская обл.' AND country = 'RU')), 'Малков Е.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Новоселов' AND a.first_name = 'Андрей' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Оленов', 'Владимир', NULL, 1991, 'm', (SELECT id FROM regions WHERE name = 'Республика Саха (Якутия)' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Саха (Якутия)' AND country = 'RU')), 'Меркулин С.В., Дьячковский В.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Оленов' AND a.first_name = 'Владимир' AND a.birth_year = 1991 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Сергеев', 'Алексей', NULL, 2001, 'm', (SELECT id FROM regions WHERE name = 'ХМАО-Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'ХМАО-Югра' AND country = 'RU')), 'Пестерева А.А., Садыков Р. И. ', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Сергеев' AND a.first_name = 'Алексей' AND a.birth_year = 2001 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Гаврик', 'Вячеслав', NULL, 2002, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Катаев И.В.Бирюков С.Н.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Гаврик' AND a.first_name = 'Вячеслав' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кананцов', 'Михаил', NULL, 1997, 'm', (SELECT id FROM regions WHERE name = 'Воронежская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС РФ' AND region_id = (SELECT id FROM regions WHERE name = 'Воронежская область' AND country = 'RU')), 'Карпов Ф.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кананцов' AND a.first_name = 'Михаил' AND a.birth_year = 1997 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Абдразаков', 'Рафик', NULL, 2002, 'm', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР№1,ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')), 'Сергеев С.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Абдразаков' AND a.first_name = 'Рафик' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ермолаев', 'Артем', NULL, 2002, 'm', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР№5 г. Белгород / 
СШ «Юность»' AND region_id = (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')), 'Власов А.П., Меркулин С.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ермолаев' AND a.first_name = 'Артем' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Жумадилов', 'Аслан', NULL, 2004, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург+Омская обл.' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург+Омская обл.' AND country = 'RU')), 'Сагандыков К.К,Фадеев А.С.Катаев И .В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Жумадилов' AND a.first_name = 'Аслан' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Гетман', 'Максим', NULL, 2005, 'm', (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ  ' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU')), 'Абзалова И.В., Абзалов В.М.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Гетман' AND a.first_name = 'Максим' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Балашов', 'Максим', NULL, 1990, 'm', (SELECT id FROM regions WHERE name = 'Ивановская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Ивановская область' AND country = 'RU')), 'Самостоятельно', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Балашов' AND a.first_name = 'Максим' AND a.birth_year = 1990 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Камардин', 'Максим', NULL, 2002, 'm', (SELECT id FROM regions WHERE name = 'Оренбургская обл.' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ № 1 им Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская обл.' AND country = 'RU')), 'Баранов В.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Камардин' AND a.first_name = 'Максим' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Неженцев', 'Владислав', NULL, 1997, 'm', (SELECT id FROM regions WHERE name = 'г.Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г.Москва' AND country = 'RU')), 'Шаповалов Е.Г.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Неженцев' AND a.first_name = 'Владислав' AND a.birth_year = 1997 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ажермачев', 'Данил', NULL, 2001, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Ажермачев А.Б.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ажермачев' AND a.first_name = 'Данил' AND a.birth_year = 2001 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Жутенков', 'Игорь', NULL, 2002, 'm', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР№1,ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')), 'Сергеев С.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Жутенков' AND a.first_name = 'Игорь' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Перминов', 'Максим', NULL, 1994, 'm', (SELECT id FROM regions WHERE name = 'Кировская обл.' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КОГАУ "СШОР "Юность"' AND region_id = (SELECT id FROM regions WHERE name = 'Кировская обл.' AND country = 'RU')), 'Малков Е.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Перминов' AND a.first_name = 'Максим' AND a.birth_year = 1994 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Гусев', 'Владимир', NULL, 2004, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Сотников Е.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Гусев' AND a.first_name = 'Владимир' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Зверев', 'Рафаель', NULL, 2002, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Катаев И.В.Бирюков С.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Зверев' AND a.first_name = 'Рафаель' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Агабеков', 'Рустам', NULL, 2004, 'm', (SELECT id FROM regions WHERE name = 'Республика Дагестан' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ГБУ РД "СШ Белиджи"' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Дагестан' AND country = 'RU')), 'Саидов М.С.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Агабеков' AND a.first_name = 'Рустам' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Сарсембаев', 'Ильяс', NULL, 1999, 'm', (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'ЯНАО' AND country = 'RU')), 'Латыпов Е.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Сарсембаев' AND a.first_name = 'Ильяс' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Порцев', 'Роман', NULL, 1987, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ДС ДЮ "Прикамье"' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Мошев Д.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Порцев' AND a.first_name = 'Роман' AND a.birth_year = 1987 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Синицын', 'Сергей', NULL, 2001, 'm', (SELECT id FROM regions WHERE name = 'Воронежская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС РФ' AND region_id = (SELECT id FROM regions WHERE name = 'Воронежская область' AND country = 'RU')), 'Колесниченко Н.А., Частихин А.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Синицын' AND a.first_name = 'Сергей' AND a.birth_year = 2001 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ляукин', 'Кирилл', NULL, 1999, 'm', (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU')), 'Низамова А.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ляукин' AND a.first_name = 'Кирилл' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Молчанов', 'Дианисий', NULL, 2005, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Катаев И.В.Бирюков С.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Молчанов' AND a.first_name = 'Дианисий' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Сарлаев', 'Андрей', NULL, 2003, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Козленко В.Н., Чудаков Ф.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Сарлаев' AND a.first_name = 'Андрей' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Астахов', 'Евгений', NULL, 2002, 'm', (SELECT id FROM regions WHERE name = 'г.Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г.Москва' AND country = 'RU')), 'Турищев Д.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Астахов' AND a.first_name = 'Евгений' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Дубель', 'Алексей', NULL, 1990, 'm', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')), 'Самостоятельно', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Дубель' AND a.first_name = 'Алексей' AND a.birth_year = 1990 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Косухин', 'Владислав', NULL, 2004, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Дубровин Д.А., Бирюков С.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Косухин' AND a.first_name = 'Владислав' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Коломеец', 'Владислав', NULL, 1999, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Сагандыков К.К., Бабичев М.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Коломеец' AND a.first_name = 'Владислав' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Лобанов', 'Илья', NULL, 2002, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Фадеев А.С.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Лобанов' AND a.first_name = 'Илья' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Тимошаров', 'Кирилл', NULL, 2006, 'm', (SELECT id FROM regions WHERE name = 'Краснодарский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ДЮСШ№2' AND region_id = (SELECT id FROM regions WHERE name = 'Краснодарский край' AND country = 'RU')), 'Танаев А.Ю.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Тимошаров' AND a.first_name = 'Кирилл' AND a.birth_year = 2006 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Алцыбеев', 'Никита', NULL, 2003, 'm', (SELECT id FROM regions WHERE name = 'Кировская обл.' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КОГАУ "СШОР "Юность"' AND region_id = (SELECT id FROM regions WHERE name = 'Кировская обл.' AND country = 'RU')), 'Малков Е.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Алцыбеев' AND a.first_name = 'Никита' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Заварзин', 'Павел', NULL, 2000, 'm', (SELECT id FROM regions WHERE name = 'Оренбургская обл.' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ № 1 им Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская обл.' AND country = 'RU')), 'Баранов В.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Заварзин' AND a.first_name = 'Павел' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бородынкин', 'Олег', NULL, 2002, 'm', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Баер П.А., Бутенко И.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бородынкин' AND a.first_name = 'Олег' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Чуев', 'Павел', NULL, 1997, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Кириллов С.А', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Чуев' AND a.first_name = 'Павел' AND a.birth_year = 1997 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Самочернов', 'Иван', NULL, 1998, 'm', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')), 'Стрекаловских С.К.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Самочернов' AND a.first_name = 'Иван' AND a.birth_year = 1998 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Загороднев', 'Максим', NULL, 1992, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Росгвардия' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Дягилев А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Загороднев' AND a.first_name = 'Максим' AND a.birth_year = 1992 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Янголенко', 'Даниил', NULL, 2000, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург+ Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург+ Томская область' AND country = 'RU')), 'Сотников Е.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Янголенко' AND a.first_name = 'Даниил' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Разживин', 'Андрей', NULL, 1986, 'm', (SELECT id FROM regions WHERE name = 'Нижегородская обл.' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Нижегородская обл.' AND country = 'RU')), 'самостоятельно', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Разживин' AND a.first_name = 'Андрей' AND a.birth_year = 1986 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Пешков', 'Виталий', NULL, 1998, 'm', (SELECT id FROM regions WHERE name = 'Оренбургская обл.' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ № 1 им Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская обл.' AND country = 'RU')), 'Лавринов В.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Пешков' AND a.first_name = 'Виталий' AND a.birth_year = 1998 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ахмедов', 'Эдик', NULL, 1999, 'm', (SELECT id FROM regions WHERE name = 'Республика Дагестан' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ГБУ РД "СШ Белиджи"' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Дагестан' AND country = 'RU')), 'Саидов М.С.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ахмедов' AND a.first_name = 'Эдик' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Булдаков', 'Никита', NULL, 1997, 'm', (SELECT id FROM regions WHERE name = 'Удмуртская Республика' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Удмуртская Республика' AND country = 'RU')), 'Веретенников С.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Булдаков' AND a.first_name = 'Никита' AND a.birth_year = 1997 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Минуллин', 'Марсель', NULL, 2000, 'm', (SELECT id FROM regions WHERE name = 'ХМАО-Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'ХМАО-Югра' AND country = 'RU')), 'Гарифуллин Р.Ф., Лавринович Ю.Я.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Минуллин' AND a.first_name = 'Марсель' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Рассказов', 'Илья', NULL, 2005, 'm', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')), 'Даричев Е.Н., Чагин С.Г.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Рассказов' AND a.first_name = 'Илья' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Семедов', 'Давид', NULL, 1998, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Катаев И.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Семедов' AND a.first_name = 'Давид' AND a.birth_year = 1998 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Коршунов', 'Сергей', NULL, 1990, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'самостоятельно', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Коршунов' AND a.first_name = 'Сергей' AND a.birth_year = 1990 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Лапшин', 'Николай', NULL, 1984, 'm', (SELECT id FROM regions WHERE name = 'Псковская обл.' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'Псковская обл.' AND country = 'RU')), 'Кириллов С.А., Сливкин В.В.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Лапшин' AND a.first_name = 'Николай' AND a.birth_year = 1984 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Балабанов', 'Сергей', NULL, 1996, 'm', (SELECT id FROM regions WHERE name = 'Ростовская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Ростовская область' AND country = 'RU')), 'Пастухов И.В.,Трофимов М.А.,Потапов С.В.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Балабанов' AND a.first_name = 'Сергей' AND a.birth_year = 1996 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Шевелев', 'Дмитрий', NULL, 1989, 'm', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Бутенко А.А., Рябченко А.В.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Шевелев' AND a.first_name = 'Дмитрий' AND a.birth_year = 1989 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Калистратов', 'Артем', NULL, 1992, 'm', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР№1,ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')), 'Сергеев С.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Калистратов' AND a.first_name = 'Артем' AND a.birth_year = 1992 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Сукманов', 'Александр', NULL, 1985, 'm', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')), 'Баландин А.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Сукманов' AND a.first_name = 'Александр' AND a.birth_year = 1985 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Тихомиров', 'Владислав', NULL, 1996, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Дубровин Д.А., Кириллов С.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Тихомиров' AND a.first_name = 'Владислав' AND a.birth_year = 1996 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Проничев', 'Сергей', NULL, 1983, 'm', (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Динамо' AND region_id = (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU')), 'Гомонов В.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Проничев' AND a.first_name = 'Сергей' AND a.birth_year = 1983 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Константинов', 'Александр', NULL, 2003, 'm', (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ "Энергия"' AND region_id = (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU')), 'Глинкин Б.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Константинов' AND a.first_name = 'Александр' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Пирожников', 'Александр', NULL, 1987, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ДС ДЮ Прикамье' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Мошев Д.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Пирожников' AND a.first_name = 'Александр' AND a.birth_year = 1987 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бутин', 'Алексей', NULL, 1985, 'm', (SELECT id FROM regions WHERE name = 'Красноярский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Красноярский край' AND country = 'RU')), 'Шевелев Д.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бутин' AND a.first_name = 'Алексей' AND a.birth_year = 1985 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Станкович', 'Боян', NULL, 1988, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'самостоятельно', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Станкович' AND a.first_name = 'Боян' AND a.birth_year = 1988 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Лежнев', 'Даниил', NULL, 2003, 'm', (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU')), 'Федулов А.Ю.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Лежнев' AND a.first_name = 'Даниил' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кулаков', 'Иван', NULL, 1998, 'm', (SELECT id FROM regions WHERE name = 'Рязанская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ДДЮ «Алые Паруса»' AND region_id = (SELECT id FROM regions WHERE name = 'Рязанская область' AND country = 'RU')), 'Шматов И.Б.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кулаков' AND a.first_name = 'Иван' AND a.birth_year = 1998 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Клепиков', 'Артем', NULL, 1998, 'm', (SELECT id FROM regions WHERE name = 'Кировская обл.' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КОГАУ "СШОР "Юность"' AND region_id = (SELECT id FROM regions WHERE name = 'Кировская обл.' AND country = 'RU')), 'Малков Е.И.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Клепиков' AND a.first_name = 'Артем' AND a.birth_year = 1998 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Селиверстов', 'Семен', NULL, 1989, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Нестеренко Д.В., Ташланов И.С.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Селиверстов' AND a.first_name = 'Семен' AND a.birth_year = 1989 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Мухитов', 'Андрей', NULL, 1999, 'm', (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Профсоюзы' AND region_id = (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU')), 'Гомонов В.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Мухитов' AND a.first_name = 'Андрей' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кудашев', 'Денис', NULL, 1988, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Леонов С.Т.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кудашев' AND a.first_name = 'Денис' AND a.birth_year = 1988 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бурлаков', 'Егор', NULL, 1998, 'm', (SELECT id FROM regions WHERE name = 'Вологодская обл.' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Вологодская обл.' AND country = 'RU')), 'Маклаков В.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бурлаков' AND a.first_name = 'Егор' AND a.birth_year = 1998 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Олехнович', 'Олег', NULL, 1991, 'm', (SELECT id FROM regions WHERE name = 'Новгородская обл.' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Новгородская обл.' AND country = 'RU')), 'Трофимов С.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Олехнович' AND a.first_name = 'Олег' AND a.birth_year = 1991 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Стаханов', 'Валентин', NULL, 1990, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Анасенко А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Стаханов' AND a.first_name = 'Валентин' AND a.birth_year = 1990 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Беликова', 'Олеся', NULL, 2004, 'f', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ «Юность»' AND region_id = (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')), 'Власов А.П., 
Вильган А.П.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Беликова' AND a.first_name = 'Олеся' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Щербина', 'Джанита', NULL, 1991, 'f', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Никифоров А.В.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Щербина' AND a.first_name = 'Джанита' AND a.birth_year = 1991 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бахтова', 'Ирина', NULL, 1999, 'f', (SELECT id FROM regions WHERE name = 'Самарская обл.' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ЦВР' AND region_id = (SELECT id FROM regions WHERE name = 'Самарская обл.' AND country = 'RU')), 'Бахтов И.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бахтова' AND a.first_name = 'Ирина' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Мажаева', 'Наталия', NULL, 1999, 'f', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Барков А.П., Рябоконь О.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Мажаева' AND a.first_name = 'Наталия' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Карпова', 'Анна', NULL, 2003, 'f', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')), 'Даричев Е.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Карпова' AND a.first_name = 'Анна' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Иванова', 'Алиса', NULL, 1997, 'f', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР№1' AND region_id = (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')), 'Шванев В.Б.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Иванова' AND a.first_name = 'Алиса' AND a.birth_year = 1997 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Постникова', 'Анастасия', NULL, 2007, 'f', (SELECT id FROM regions WHERE name = 'Краснодарский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ"Юность"' AND region_id = (SELECT id FROM regions WHERE name = 'Краснодарский край' AND country = 'RU')), 'Труш А.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Постникова' AND a.first_name = 'Анастасия' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Коптяева', 'Карина', NULL, 2007, 'f', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')), 'Калмаков С.И.,Айдбаев И.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Коптяева' AND a.first_name = 'Карина' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бурмакина', 'Екатерина', NULL, 2005, 'f', (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ДЮСШ Татнефть "Олимп"' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU')), 'Гиниатуллин А.З.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бурмакина' AND a.first_name = 'Екатерина' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Карцова', 'Татьяна', NULL, 1981, 'f', (SELECT id FROM regions WHERE name = 'г.Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г.Москва' AND country = 'RU')), 'Ландин А.Ю.,Шаповалов Е.Г.,Сергеев В.В', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Карцова' AND a.first_name = 'Татьяна' AND a.birth_year = 1981 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кожеватова', 'Василиса', NULL, 2002, 'f', (SELECT id FROM regions WHERE name = 'Оренбургская обл.' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ № 1 им Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская обл.' AND country = 'RU')), 'Баранов В.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кожеватова' AND a.first_name = 'Василиса' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Грибанова', 'Ирина', NULL, 2004, 'f', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР№1' AND region_id = (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')), 'Шванев В.Б.,Алферова В.Я.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Грибанова' AND a.first_name = 'Ирина' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ныныч', 'Маргарита', NULL, 1996, 'f', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Рассадин А.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ныныч' AND a.first_name = 'Маргарита' AND a.birth_year = 1996 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Иванова', 'Елена', NULL, 1986, 'f', (SELECT id FROM regions WHERE name = 'Республика Саха (Якутия)' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Саха (Якутия)' AND country = 'RU')), 'Дьячковский В.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Иванова' AND a.first_name = 'Елена' AND a.birth_year = 1986 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кулик', 'Елена', NULL, 1984, 'f', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Семёнов А.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кулик' AND a.first_name = 'Елена' AND a.birth_year = 1984 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кречун', 'Елена', NULL, 2007, 'f', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Резонов А.В', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кречун' AND a.first_name = 'Елена' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Тарвердиева', 'Мария', NULL, 1986, 'f', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Семёнов А.Н., Руднев С.Л.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Тарвердиева' AND a.first_name = 'Мария' AND a.birth_year = 1986 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Степанова', 'Оксана', NULL, 1990, 'f', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Денисов И.Н., Степанов С.В.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Степанова' AND a.first_name = 'Оксана' AND a.birth_year = 1990 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кашапова', 'Розана', NULL, 2001, 'f', (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ СШ' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU')), 'Минибаев Р.М.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кашапова' AND a.first_name = 'Розана' AND a.birth_year = 2001 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Рязанова', 'Алёна', NULL, 1997, 'f', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Семёнов А.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Рязанова' AND a.first_name = 'Алёна' AND a.birth_year = 1997 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Сорокина', 'Ольга', NULL, 2003, 'f', (SELECT id FROM regions WHERE name = 'Нижегородская обл.' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Нижегородская обл.' AND country = 'RU')), 'Афонин И.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Сорокина' AND a.first_name = 'Ольга' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Уржумцева', 'Светлана', NULL, 1992, 'f', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Дедюхин И.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Уржумцева' AND a.first_name = 'Светлана' AND a.birth_year = 1992 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Горячкина', 'Лусине', NULL, 1984, 'f', (SELECT id FROM regions WHERE name = 'Краснодарский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Краснодарский край' AND country = 'RU')), 'Руднев С.Л.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Горячкина' AND a.first_name = 'Лусине' AND a.birth_year = 1984 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Сергеева', 'Юлия', NULL, 1980, 'f', (SELECT id FROM regions WHERE name = 'г.Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г.Москва' AND country = 'RU')), 'Самостоятельно', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Сергеева' AND a.first_name = 'Юлия' AND a.birth_year = 1980 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Камалова', 'Зарина', NULL, 2008, 'f', (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ДЮСШ Татнефть "Олимп"' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU')), 'Гиниатуллин А.З.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Камалова' AND a.first_name = 'Зарина' AND a.birth_year = 2008 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Минина', 'Марина', NULL, 1990, 'f', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Бенидзе Д.Б.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Минина' AND a.first_name = 'Марина' AND a.birth_year = 1990 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Островская', 'Надежда', NULL, 1985, 'f', (SELECT id FROM regions WHERE name = 'ХМАО-Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'ХМАО-Югра' AND country = 'RU')), 'Шпартко М.А., Бакум К.Е.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Островская' AND a.first_name = 'Надежда' AND a.birth_year = 1985 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ходунова', 'Ирина', NULL, 1985, 'f', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР№1,ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')), 'Шванев В.Б.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ходунова' AND a.first_name = 'Ирина' AND a.birth_year = 1985 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Пименова', 'Татьяна', NULL, 1997, 'f', (SELECT id FROM regions WHERE name = 'Архангельская обл.' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Архангельская обл.' AND country = 'RU')), 'Марков И.Э., Читадзе З.Л.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Пименова' AND a.first_name = 'Татьяна' AND a.birth_year = 1997 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Шмидт', 'Татьяна', NULL, 1988, 'f', (SELECT id FROM regions WHERE name = 'Красноярский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Красноярский край' AND country = 'RU')), 'Блынду А.С., Шмидт С.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Шмидт' AND a.first_name = 'Татьяна' AND a.birth_year = 1988 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Евдокимова', 'Елизавета', NULL, 1999, 'f', (SELECT id FROM regions WHERE name = 'Архангельская обл.' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Архангельская обл.' AND country = 'RU')), 'Денисов И.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Евдокимова' AND a.first_name = 'Елизавета' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кузьмичева', 'Ксения', NULL, 2004, 'f', (SELECT id FROM regions WHERE name = 'Оренбургская обл.' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО "Тюльганская ДЮСШ"' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская обл.' AND country = 'RU')), 'Ерохин А.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кузьмичева' AND a.first_name = 'Ксения' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Дербенева', 'Ольга', NULL, 1970, 'f', (SELECT id FROM regions WHERE name = 'Кировская обл.' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КОГАУ "СШОР "Юность"' AND region_id = (SELECT id FROM regions WHERE name = 'Кировская обл.' AND country = 'RU')), 'Платунов В.В.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Дербенева' AND a.first_name = 'Ольга' AND a.birth_year = 1970 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Хайруллина', 'Миляуша', NULL, 2006, 'f', (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ДЮСШ Татнефть "Олимп"' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU')), 'Гиниатуллин А.З.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Хайруллина' AND a.first_name = 'Миляуша' AND a.birth_year = 2006 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Вершинина', 'Дарья', NULL, 2009, 'f', (SELECT id FROM regions WHERE name = 'Кировская обл.' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КОГАУ "СШОР "Юность"' AND region_id = (SELECT id FROM regions WHERE name = 'Кировская обл.' AND country = 'RU')), 'Малков Е.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Вершинина' AND a.first_name = 'Дарья' AND a.birth_year = 2009 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бенидзе', 'Елизавета', NULL, 2002, 'f', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Бенидзе  А.А.,Огарев В.Я.Вильган А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бенидзе' AND a.first_name = 'Елизавета' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Барбакова', 'Наталья', NULL, 1984, 'f', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Маршал"' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Трофимов М.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Барбакова' AND a.first_name = 'Наталья' AND a.birth_year = 1984 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Фирса', 'Анна', NULL, 2003, 'f', (SELECT id FROM regions WHERE name = 'Краснодарский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ"Юность"' AND region_id = (SELECT id FROM regions WHERE name = 'Краснодарский край' AND country = 'RU')), 'Труш А.В.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Фирса' AND a.first_name = 'Анна' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Иванова', 'Нина', NULL, 1988, 'f', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Рассадин А.А., Руднев Р.С.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Иванова' AND a.first_name = 'Нина' AND a.birth_year = 1988 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Лизунова', 'Наталья', NULL, 1993, 'f', (SELECT id FROM regions WHERE name = 'Кемеровская обл.-Кузбасс' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Кемеровская обл.-Кузбасс' AND country = 'RU')), 'Полетаев Ф.И., Полетаев Н.И., Шевелев Д.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Лизунова' AND a.first_name = 'Наталья' AND a.birth_year = 1993 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Баранова', 'Ирина', NULL, 2006, 'f', (SELECT id FROM regions WHERE name = 'Липецкая область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '' AND region_id = (SELECT id FROM regions WHERE name = 'Липецкая область' AND country = 'RU')), 'Баранов П.Г', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Баранова' AND a.first_name = 'Ирина' AND a.birth_year = 2006 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кузьмичева', 'Екатерина', NULL, 2004, 'f', (SELECT id FROM regions WHERE name = 'Оренбургская обл.' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО Тюльганская ДЮСШ' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская обл.' AND country = 'RU')), 'Ерохин А.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кузьмичева' AND a.first_name = 'Екатерина' AND a.birth_year = 2004 LIMIT 1);

INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'benidze-dzhoni-1990' AND s.athlete_id <> a.id)
              THEN 'benidze-dzhoni-1990-' || a.id ELSE 'benidze-dzhoni-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бенидзе' AND first_name = 'Джони' AND birth_year = 1990 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'butenko-evgeniy-1995' AND s.athlete_id <> a.id)
              THEN 'butenko-evgeniy-1995-' || a.id ELSE 'butenko-evgeniy-1995' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бутенко' AND first_name = 'Евгений' AND birth_year = 1995 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'smagulov-nursultan-1999' AND s.athlete_id <> a.id)
              THEN 'smagulov-nursultan-1999-' || a.id ELSE 'smagulov-nursultan-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Смагулов' AND first_name = 'Нурсултан' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'marinkin-egor-2003' AND s.athlete_id <> a.id)
              THEN 'marinkin-egor-2003-' || a.id ELSE 'marinkin-egor-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Маринкин' AND first_name = 'Егор' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'hovalko-vasiliy-1993' AND s.athlete_id <> a.id)
              THEN 'hovalko-vasiliy-1993-' || a.id ELSE 'hovalko-vasiliy-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ховалко' AND first_name = 'Василий' AND birth_year = 1993 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'umetbaev-denislam-1994' AND s.athlete_id <> a.id)
              THEN 'umetbaev-denislam-1994-' || a.id ELSE 'umetbaev-denislam-1994' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Уметбаев' AND first_name = 'Денислам' AND birth_year = 1994 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ilyasov-kaken-1993' AND s.athlete_id <> a.id)
              THEN 'ilyasov-kaken-1993-' || a.id ELSE 'ilyasov-kaken-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ильясов' AND first_name = 'Какен' AND birth_year = 1993 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'manakov-trofim-2000' AND s.athlete_id <> a.id)
              THEN 'manakov-trofim-2000-' || a.id ELSE 'manakov-trofim-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Манаков' AND first_name = 'Трофим' AND birth_year = 2000 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'obaranchuk-rostislav-2003' AND s.athlete_id <> a.id)
              THEN 'obaranchuk-rostislav-2003-' || a.id ELSE 'obaranchuk-rostislav-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Обаранчук' AND first_name = 'Ростислав' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'petelin-aleksandr-1987' AND s.athlete_id <> a.id)
              THEN 'petelin-aleksandr-1987-' || a.id ELSE 'petelin-aleksandr-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Петелин' AND first_name = 'Александр' AND birth_year = 1987 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'galeev-roman-2005' AND s.athlete_id <> a.id)
              THEN 'galeev-roman-2005-' || a.id ELSE 'galeev-roman-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Галеев' AND first_name = 'Роман' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'barkov-egor-2005' AND s.athlete_id <> a.id)
              THEN 'barkov-egor-2005-' || a.id ELSE 'barkov-egor-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Барков' AND first_name = 'Егор' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ryabkov-aleksey-1993' AND s.athlete_id <> a.id)
              THEN 'ryabkov-aleksey-1993-' || a.id ELSE 'ryabkov-aleksey-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Рябков' AND first_name = 'Алексей' AND birth_year = 1993 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'scherbin-oleg-1989' AND s.athlete_id <> a.id)
              THEN 'scherbin-oleg-1989-' || a.id ELSE 'scherbin-oleg-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Щербин' AND first_name = 'Олег' AND birth_year = 1989 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zuev-vladislav-2000' AND s.athlete_id <> a.id)
              THEN 'zuev-vladislav-2000-' || a.id ELSE 'zuev-vladislav-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Зуев' AND first_name = 'Владислав' AND birth_year = 2000 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sharov-maksim-2000' AND s.athlete_id <> a.id)
              THEN 'sharov-maksim-2000-' || a.id ELSE 'sharov-maksim-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Шаров' AND first_name = 'Максим' AND birth_year = 2000 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'usolcev-aleksandr-1992' AND s.athlete_id <> a.id)
              THEN 'usolcev-aleksandr-1992-' || a.id ELSE 'usolcev-aleksandr-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Усольцев' AND first_name = 'Александр' AND birth_year = 1992 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kolomin-dmitriy-1999' AND s.athlete_id <> a.id)
              THEN 'kolomin-dmitriy-1999-' || a.id ELSE 'kolomin-dmitriy-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Коломин' AND first_name = 'Дмитрий' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'egorov-ivan-1989' AND s.athlete_id <> a.id)
              THEN 'egorov-ivan-1989-' || a.id ELSE 'egorov-ivan-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Егоров' AND first_name = 'Иван' AND birth_year = 1989 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'morozovich-vladislav-1999' AND s.athlete_id <> a.id)
              THEN 'morozovich-vladislav-1999-' || a.id ELSE 'morozovich-vladislav-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Морозович' AND first_name = 'Владислав' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'podvolockiy-sergey-1997' AND s.athlete_id <> a.id)
              THEN 'podvolockiy-sergey-1997-' || a.id ELSE 'podvolockiy-sergey-1997' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Подволоцкий' AND first_name = 'Сергей' AND birth_year = 1997 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ostrikov-maksim-2005' AND s.athlete_id <> a.id)
              THEN 'ostrikov-maksim-2005-' || a.id ELSE 'ostrikov-maksim-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Остриков' AND first_name = 'Максим' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ivanov-evgeniy-1987' AND s.athlete_id <> a.id)
              THEN 'ivanov-evgeniy-1987-' || a.id ELSE 'ivanov-evgeniy-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Евгений' AND birth_year = 1987 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'chendylov-aleksandr-2001' AND s.athlete_id <> a.id)
              THEN 'chendylov-aleksandr-2001-' || a.id ELSE 'chendylov-aleksandr-2001' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Чендылов' AND first_name = 'Александр' AND birth_year = 2001 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'metelev-nikita-2005' AND s.athlete_id <> a.id)
              THEN 'metelev-nikita-2005-' || a.id ELSE 'metelev-nikita-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Метелёв' AND first_name = 'Никита' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'benidze-spartak-2002' AND s.athlete_id <> a.id)
              THEN 'benidze-spartak-2002-' || a.id ELSE 'benidze-spartak-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бенидзе' AND first_name = 'Спартак' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'rassadin-andrey-1989' AND s.athlete_id <> a.id)
              THEN 'rassadin-andrey-1989-' || a.id ELSE 'rassadin-andrey-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Рассадин' AND first_name = 'Андрей' AND birth_year = 1989 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'suleymanov-movsar-1989' AND s.athlete_id <> a.id)
              THEN 'suleymanov-movsar-1989-' || a.id ELSE 'suleymanov-movsar-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Сулейманов' AND first_name = 'Мовсар' AND birth_year = 1989 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zhibinov-fedor-2004' AND s.athlete_id <> a.id)
              THEN 'zhibinov-fedor-2004-' || a.id ELSE 'zhibinov-fedor-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Жибинов' AND first_name = 'Федор' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'karagaev-yuriy-1994' AND s.athlete_id <> a.id)
              THEN 'karagaev-yuriy-1994-' || a.id ELSE 'karagaev-yuriy-1994' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Карагаев' AND first_name = 'Юрий' AND birth_year = 1994 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'maschenko-oleg-1983' AND s.athlete_id <> a.id)
              THEN 'maschenko-oleg-1983-' || a.id ELSE 'maschenko-oleg-1983' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Мащенко' AND first_name = 'Олег' AND birth_year = 1983 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'baldin-aleksandr-1993' AND s.athlete_id <> a.id)
              THEN 'baldin-aleksandr-1993-' || a.id ELSE 'baldin-aleksandr-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Балдин' AND first_name = 'Александр' AND birth_year = 1993 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'strekalovskih-nikolay-1993' AND s.athlete_id <> a.id)
              THEN 'strekalovskih-nikolay-1993-' || a.id ELSE 'strekalovskih-nikolay-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Стрекаловских' AND first_name = 'Николай' AND birth_year = 1993 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'semenov-andrey-1991' AND s.athlete_id <> a.id)
              THEN 'semenov-andrey-1991-' || a.id ELSE 'semenov-andrey-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Семёнов' AND first_name = 'Андрей' AND birth_year = 1991 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'buyanov-stanislav-2000' AND s.athlete_id <> a.id)
              THEN 'buyanov-stanislav-2000-' || a.id ELSE 'buyanov-stanislav-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Буянов' AND first_name = 'Станислав' AND birth_year = 2000 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'voronov-ivan-1991' AND s.athlete_id <> a.id)
              THEN 'voronov-ivan-1991-' || a.id ELSE 'voronov-ivan-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Воронов' AND first_name = 'Иван' AND birth_year = 1991 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kargin-sergey-1998' AND s.athlete_id <> a.id)
              THEN 'kargin-sergey-1998-' || a.id ELSE 'kargin-sergey-1998' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Каргин' AND first_name = 'Сергей' AND birth_year = 1998 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'vasin-artem-2007' AND s.athlete_id <> a.id)
              THEN 'vasin-artem-2007-' || a.id ELSE 'vasin-artem-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Васин' AND first_name = 'Артем' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'golikov-roman-1990' AND s.athlete_id <> a.id)
              THEN 'golikov-roman-1990-' || a.id ELSE 'golikov-roman-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Голиков' AND first_name = 'Роман' AND birth_year = 1990 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'voldaev-aleksandr-2000' AND s.athlete_id <> a.id)
              THEN 'voldaev-aleksandr-2000-' || a.id ELSE 'voldaev-aleksandr-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Волдаев' AND first_name = 'Александр' AND birth_year = 2000 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'laptev-aleksandr-2002' AND s.athlete_id <> a.id)
              THEN 'laptev-aleksandr-2002-' || a.id ELSE 'laptev-aleksandr-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Лаптев' AND first_name = 'Александр' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'podgornyy-ivan-2003' AND s.athlete_id <> a.id)
              THEN 'podgornyy-ivan-2003-' || a.id ELSE 'podgornyy-ivan-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Подгорный' AND first_name = 'Иван' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'karnauhov-daniil-2001' AND s.athlete_id <> a.id)
              THEN 'karnauhov-daniil-2001-' || a.id ELSE 'karnauhov-daniil-2001' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Карнаухов' AND first_name = 'Даниил' AND birth_year = 2001 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'yurov-evgeniy-2004' AND s.athlete_id <> a.id)
              THEN 'yurov-evgeniy-2004-' || a.id ELSE 'yurov-evgeniy-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Юров' AND first_name = 'Евгений' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kvashnin-mihail-1988' AND s.athlete_id <> a.id)
              THEN 'kvashnin-mihail-1988-' || a.id ELSE 'kvashnin-mihail-1988' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Квашнин' AND first_name = 'Михаил' AND birth_year = 1988 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'baranov-egor-1992' AND s.athlete_id <> a.id)
              THEN 'baranov-egor-1992-' || a.id ELSE 'baranov-egor-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Баранов' AND first_name = 'Егор' AND birth_year = 1992 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'tashlanov-ilya-1987' AND s.athlete_id <> a.id)
              THEN 'tashlanov-ilya-1987-' || a.id ELSE 'tashlanov-ilya-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ташланов' AND first_name = 'Илья' AND birth_year = 1987 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'bobrov-vladimir-1989' AND s.athlete_id <> a.id)
              THEN 'bobrov-vladimir-1989-' || a.id ELSE 'bobrov-vladimir-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бобров' AND first_name = 'Владимир' AND birth_year = 1989 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ivanov-aleksey-1995' AND s.athlete_id <> a.id)
              THEN 'ivanov-aleksey-1995-' || a.id ELSE 'ivanov-aleksey-1995' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Алексей' AND birth_year = 1995 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ked-maksim-2002' AND s.athlete_id <> a.id)
              THEN 'ked-maksim-2002-' || a.id ELSE 'ked-maksim-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кед' AND first_name = 'Максим' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'pavlov-valeriy-1987' AND s.athlete_id <> a.id)
              THEN 'pavlov-valeriy-1987-' || a.id ELSE 'pavlov-valeriy-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Павлов' AND first_name = 'Валерий' AND birth_year = 1987 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'baev-konstantin-1993' AND s.athlete_id <> a.id)
              THEN 'baev-konstantin-1993-' || a.id ELSE 'baev-konstantin-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Баев' AND first_name = 'Константин' AND birth_year = 1993 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'vanin-viktor-1991' AND s.athlete_id <> a.id)
              THEN 'vanin-viktor-1991-' || a.id ELSE 'vanin-viktor-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ванин' AND first_name = 'Виктор' AND birth_year = 1991 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lyubimskiy-sergey-1992' AND s.athlete_id <> a.id)
              THEN 'lyubimskiy-sergey-1992-' || a.id ELSE 'lyubimskiy-sergey-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Любимский' AND first_name = 'Сергей' AND birth_year = 1992 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'schetkov-ivan-2003' AND s.athlete_id <> a.id)
              THEN 'schetkov-ivan-2003-' || a.id ELSE 'schetkov-ivan-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Щетков' AND first_name = 'Иван' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'fomin-fedor-2004' AND s.athlete_id <> a.id)
              THEN 'fomin-fedor-2004-' || a.id ELSE 'fomin-fedor-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Фомин' AND first_name = 'Федор' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'bereza-egor-2003' AND s.athlete_id <> a.id)
              THEN 'bereza-egor-2003-' || a.id ELSE 'bereza-egor-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Береза' AND first_name = 'Егор' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'vahonin-egor-2005' AND s.athlete_id <> a.id)
              THEN 'vahonin-egor-2005-' || a.id ELSE 'vahonin-egor-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Вахонин' AND first_name = 'Егор' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'mayorov-ivan-2000' AND s.athlete_id <> a.id)
              THEN 'mayorov-ivan-2000-' || a.id ELSE 'mayorov-ivan-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Майоров' AND first_name = 'Иван' AND birth_year = 2000 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'mikshin-sergey-2000' AND s.athlete_id <> a.id)
              THEN 'mikshin-sergey-2000-' || a.id ELSE 'mikshin-sergey-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Микшин' AND first_name = 'Сергей' AND birth_year = 2000 LIMIT 1)
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
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'anasenko-anton-1979' AND s.athlete_id <> a.id)
              THEN 'anasenko-anton-1979-' || a.id ELSE 'anasenko-anton-1979' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Анасенко' AND first_name = 'Антон' AND birth_year = 1979 LIMIT 1)
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
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kozlov-dmitriy-2000' AND s.athlete_id <> a.id)
              THEN 'kozlov-dmitriy-2000-' || a.id ELSE 'kozlov-dmitriy-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Козлов' AND first_name = 'Дмитрий' AND birth_year = 2000 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'pozdeev-andrey-1990' AND s.athlete_id <> a.id)
              THEN 'pozdeev-andrey-1990-' || a.id ELSE 'pozdeev-andrey-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Поздеев' AND first_name = 'Андрей' AND birth_year = 1990 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'nikolaev-arkadiy-2002' AND s.athlete_id <> a.id)
              THEN 'nikolaev-arkadiy-2002-' || a.id ELSE 'nikolaev-arkadiy-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Николаев' AND first_name = 'Аркадий' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'klochek-aleksandr-2001' AND s.athlete_id <> a.id)
              THEN 'klochek-aleksandr-2001-' || a.id ELSE 'klochek-aleksandr-2001' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Клочек' AND first_name = 'Александр' AND birth_year = 2001 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zhitihin-vladislav-1994' AND s.athlete_id <> a.id)
              THEN 'zhitihin-vladislav-1994-' || a.id ELSE 'zhitihin-vladislav-1994' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Житихин' AND first_name = 'Владислав' AND birth_year = 1994 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kurdyukov-vasiliy-1997' AND s.athlete_id <> a.id)
              THEN 'kurdyukov-vasiliy-1997-' || a.id ELSE 'kurdyukov-vasiliy-1997' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Курдюков' AND first_name = 'Василий' AND birth_year = 1997 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'dyachkov-oleg-1995' AND s.athlete_id <> a.id)
              THEN 'dyachkov-oleg-1995-' || a.id ELSE 'dyachkov-oleg-1995' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Дьячков' AND first_name = 'Олег' AND birth_year = 1995 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kodirov-abdumaruf-2000' AND s.athlete_id <> a.id)
              THEN 'kodirov-abdumaruf-2000-' || a.id ELSE 'kodirov-abdumaruf-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кодиров' AND first_name = 'Абдумаъруф' AND birth_year = 2000 LIMIT 1)
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
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'iyulskiy-dmitriy-1993' AND s.athlete_id <> a.id)
              THEN 'iyulskiy-dmitriy-1993-' || a.id ELSE 'iyulskiy-dmitriy-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Июльский' AND first_name = 'Дмитрий' AND birth_year = 1993 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'orlov-sergey-2005' AND s.athlete_id <> a.id)
              THEN 'orlov-sergey-2005-' || a.id ELSE 'orlov-sergey-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Орлов' AND first_name = 'Сергей' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'burlaka-sergey-1998' AND s.athlete_id <> a.id)
              THEN 'burlaka-sergey-1998-' || a.id ELSE 'burlaka-sergey-1998' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бурлака' AND first_name = 'Сергей' AND birth_year = 1998 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'chirkov-leonid-2003' AND s.athlete_id <> a.id)
              THEN 'chirkov-leonid-2003-' || a.id ELSE 'chirkov-leonid-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Чирков' AND first_name = 'Леонид' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'potatuev-artem-1992' AND s.athlete_id <> a.id)
              THEN 'potatuev-artem-1992-' || a.id ELSE 'potatuev-artem-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Потатуев' AND first_name = 'Артем' AND birth_year = 1992 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'afonin-igor-1992' AND s.athlete_id <> a.id)
              THEN 'afonin-igor-1992-' || a.id ELSE 'afonin-igor-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Афонин' AND first_name = 'Игорь' AND birth_year = 1992 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kuvaev-dmitriy-1985' AND s.athlete_id <> a.id)
              THEN 'kuvaev-dmitriy-1985-' || a.id ELSE 'kuvaev-dmitriy-1985' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Куваев' AND first_name = 'Дмитрий' AND birth_year = 1985 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'klimkov-dmitriy-1985' AND s.athlete_id <> a.id)
              THEN 'klimkov-dmitriy-1985-' || a.id ELSE 'klimkov-dmitriy-1985' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Климков' AND first_name = 'Дмитрий' AND birth_year = 1985 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'donskih-aleksandr-1990' AND s.athlete_id <> a.id)
              THEN 'donskih-aleksandr-1990-' || a.id ELSE 'donskih-aleksandr-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Донских' AND first_name = 'Александр' AND birth_year = 1990 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'turischev-dmitriy-1992' AND s.athlete_id <> a.id)
              THEN 'turischev-dmitriy-1992-' || a.id ELSE 'turischev-dmitriy-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Турищев' AND first_name = 'Дмитрий' AND birth_year = 1992 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'gurov-vladimir-1978' AND s.athlete_id <> a.id)
              THEN 'gurov-vladimir-1978-' || a.id ELSE 'gurov-vladimir-1978' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Гуров' AND first_name = 'Владимир' AND birth_year = 1978 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'filippov-maksim-1993' AND s.athlete_id <> a.id)
              THEN 'filippov-maksim-1993-' || a.id ELSE 'filippov-maksim-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Филиппов' AND first_name = 'Максим' AND birth_year = 1993 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kiryuhin-roman-1997' AND s.athlete_id <> a.id)
              THEN 'kiryuhin-roman-1997-' || a.id ELSE 'kiryuhin-roman-1997' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кирюхин' AND first_name = 'Роман' AND birth_year = 1997 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'cherkashin-ivan-1999' AND s.athlete_id <> a.id)
              THEN 'cherkashin-ivan-1999-' || a.id ELSE 'cherkashin-ivan-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Черкашин' AND first_name = 'Иван' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'bryuhanov-danila-1995' AND s.athlete_id <> a.id)
              THEN 'bryuhanov-danila-1995-' || a.id ELSE 'bryuhanov-danila-1995' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Брюханов' AND first_name = 'Данила' AND birth_year = 1995 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'piven-andrey-2003' AND s.athlete_id <> a.id)
              THEN 'piven-andrey-2003-' || a.id ELSE 'piven-andrey-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Пивень' AND first_name = 'Андрей' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'yurastov-stanislav-1983' AND s.athlete_id <> a.id)
              THEN 'yurastov-stanislav-1983-' || a.id ELSE 'yurastov-stanislav-1983' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Юрастов' AND first_name = 'Станислав' AND birth_year = 1983 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'antipov-petr-1993' AND s.athlete_id <> a.id)
              THEN 'antipov-petr-1993-' || a.id ELSE 'antipov-petr-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Антипов' AND first_name = 'Пётр' AND birth_year = 1993 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'dunaev-dmitriy-2000' AND s.athlete_id <> a.id)
              THEN 'dunaev-dmitriy-2000-' || a.id ELSE 'dunaev-dmitriy-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Дунаев' AND first_name = 'Дмитрий' AND birth_year = 2000 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'dubkov-artem-1994' AND s.athlete_id <> a.id)
              THEN 'dubkov-artem-1994-' || a.id ELSE 'dubkov-artem-1994' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Дубков' AND first_name = 'Артем' AND birth_year = 1994 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'minibaev-alzaf-1987' AND s.athlete_id <> a.id)
              THEN 'minibaev-alzaf-1987-' || a.id ELSE 'minibaev-alzaf-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Минибаев' AND first_name = 'Альзаф' AND birth_year = 1987 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'siseykin-maksim-1993' AND s.athlete_id <> a.id)
              THEN 'siseykin-maksim-1993-' || a.id ELSE 'siseykin-maksim-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Сисейкин' AND first_name = 'Максим' AND birth_year = 1993 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'davydov-anton-1982' AND s.athlete_id <> a.id)
              THEN 'davydov-anton-1982-' || a.id ELSE 'davydov-anton-1982' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Давыдов' AND first_name = 'Антон' AND birth_year = 1982 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lomov-mihail-2002' AND s.athlete_id <> a.id)
              THEN 'lomov-mihail-2002-' || a.id ELSE 'lomov-mihail-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ломов' AND first_name = 'Михаил' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'trofimova-milena-2007' AND s.athlete_id <> a.id)
              THEN 'trofimova-milena-2007-' || a.id ELSE 'trofimova-milena-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Трофимова' AND first_name = 'Милена' AND birth_year = 2007 LIMIT 1)
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
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'matveeva-elena-1974' AND s.athlete_id <> a.id)
              THEN 'matveeva-elena-1974-' || a.id ELSE 'matveeva-elena-1974' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Матвеева' AND first_name = 'Елена' AND birth_year = 1974 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'prohorova-angelina-2005' AND s.athlete_id <> a.id)
              THEN 'prohorova-angelina-2005-' || a.id ELSE 'prohorova-angelina-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Прохорова' AND first_name = 'Ангелина' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'pestereva-alena-2001' AND s.athlete_id <> a.id)
              THEN 'pestereva-alena-2001-' || a.id ELSE 'pestereva-alena-2001' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Пестерева' AND first_name = 'Алена' AND birth_year = 2001 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'semirunnyaya-aleksandra-2006' AND s.athlete_id <> a.id)
              THEN 'semirunnyaya-aleksandra-2006-' || a.id ELSE 'semirunnyaya-aleksandra-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Семирунняя' AND first_name = 'Александра' AND birth_year = 2006 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'fuks-karina-2002' AND s.athlete_id <> a.id)
              THEN 'fuks-karina-2002-' || a.id ELSE 'fuks-karina-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Фукс' AND first_name = 'Карина' AND birth_year = 2002 LIMIT 1)
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
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'vaskina-alina-1999' AND s.athlete_id <> a.id)
              THEN 'vaskina-alina-1999-' || a.id ELSE 'vaskina-alina-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Васькина' AND first_name = 'Алина' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'berchatova-mariya-2005' AND s.athlete_id <> a.id)
              THEN 'berchatova-mariya-2005-' || a.id ELSE 'berchatova-mariya-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Берчатова' AND first_name = 'Мария' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'pohodyaeva-aleksandra-1990' AND s.athlete_id <> a.id)
              THEN 'pohodyaeva-aleksandra-1990-' || a.id ELSE 'pohodyaeva-aleksandra-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Походяева' AND first_name = 'Александра' AND birth_year = 1990 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kutenkova-anastasiya-1997' AND s.athlete_id <> a.id)
              THEN 'kutenkova-anastasiya-1997-' || a.id ELSE 'kutenkova-anastasiya-1997' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кутенкова' AND first_name = 'Анастасия' AND birth_year = 1997 LIMIT 1)
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
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kruglova-viktoriya-2004' AND s.athlete_id <> a.id)
              THEN 'kruglova-viktoriya-2004-' || a.id ELSE 'kruglova-viktoriya-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Круглова' AND first_name = 'Виктория' AND birth_year = 2004 LIMIT 1)
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
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ivanova-anna-2003' AND s.athlete_id <> a.id)
              THEN 'ivanova-anna-2003-' || a.id ELSE 'ivanova-anna-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Иванова' AND first_name = 'Анна' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'berest-aleksandra-2002' AND s.athlete_id <> a.id)
              THEN 'berest-aleksandra-2002-' || a.id ELSE 'berest-aleksandra-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Берест' AND first_name = 'Александра' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'nasonova-viktoriya-1999' AND s.athlete_id <> a.id)
              THEN 'nasonova-viktoriya-1999-' || a.id ELSE 'nasonova-viktoriya-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Насонова' AND first_name = 'Виктория' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lysenko-darya-2005' AND s.athlete_id <> a.id)
              THEN 'lysenko-darya-2005-' || a.id ELSE 'lysenko-darya-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Лысенко' AND first_name = 'Дарья' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'yaskova-elena-2003' AND s.athlete_id <> a.id)
              THEN 'yaskova-elena-2003-' || a.id ELSE 'yaskova-elena-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Яськова' AND first_name = 'Елена' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'voropaeva-viktoriya-2004' AND s.athlete_id <> a.id)
              THEN 'voropaeva-viktoriya-2004-' || a.id ELSE 'voropaeva-viktoriya-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Воропаева' AND first_name = 'Виктория' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'bilibina-elizaveta-2004' AND s.athlete_id <> a.id)
              THEN 'bilibina-elizaveta-2004-' || a.id ELSE 'bilibina-elizaveta-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Билибина' AND first_name = 'Елизавета' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'firuleva-vasilisa-2004' AND s.athlete_id <> a.id)
              THEN 'firuleva-vasilisa-2004-' || a.id ELSE 'firuleva-vasilisa-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Фирулева' AND first_name = 'Василиса' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kucanova-anastasiya-2006' AND s.athlete_id <> a.id)
              THEN 'kucanova-anastasiya-2006-' || a.id ELSE 'kucanova-anastasiya-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Куцанова' AND first_name = 'Анастасия' AND birth_year = 2006 LIMIT 1)
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
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'koshurnikova-anastasiya-2003' AND s.athlete_id <> a.id)
              THEN 'koshurnikova-anastasiya-2003-' || a.id ELSE 'koshurnikova-anastasiya-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кошурникова' AND first_name = 'Анастасия' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'badashkova-nina-1991' AND s.athlete_id <> a.id)
              THEN 'badashkova-nina-1991-' || a.id ELSE 'badashkova-nina-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бадашкова' AND first_name = 'Нина' AND birth_year = 1991 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'alyanova-viktoriya-2004' AND s.athlete_id <> a.id)
              THEN 'alyanova-viktoriya-2004-' || a.id ELSE 'alyanova-viktoriya-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Альянова' AND first_name = 'Виктория' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'nedorezov-vasiliy-1992' AND s.athlete_id <> a.id)
              THEN 'nedorezov-vasiliy-1992-' || a.id ELSE 'nedorezov-vasiliy-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Недорезов' AND first_name = 'Василий' AND birth_year = 1992 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kurunov-anatoliy-1999' AND s.athlete_id <> a.id)
              THEN 'kurunov-anatoliy-1999-' || a.id ELSE 'kurunov-anatoliy-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Курунов' AND first_name = 'Анатолий' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'rudnev-ruslan-1994' AND s.athlete_id <> a.id)
              THEN 'rudnev-ruslan-1994-' || a.id ELSE 'rudnev-ruslan-1994' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Руднев' AND first_name = 'Руслан' AND birth_year = 1994 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zhbanov-aleksey-1986' AND s.athlete_id <> a.id)
              THEN 'zhbanov-aleksey-1986-' || a.id ELSE 'zhbanov-aleksey-1986' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Жбанов' AND first_name = 'Алексей' AND birth_year = 1986 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'cherepanov-anton-2003' AND s.athlete_id <> a.id)
              THEN 'cherepanov-anton-2003-' || a.id ELSE 'cherepanov-anton-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Черепанов' AND first_name = 'Антон' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'bednyy-daniil-2005' AND s.athlete_id <> a.id)
              THEN 'bednyy-daniil-2005-' || a.id ELSE 'bednyy-daniil-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бедный' AND first_name = 'Даниил' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'yakushev-roman-2002' AND s.athlete_id <> a.id)
              THEN 'yakushev-roman-2002-' || a.id ELSE 'yakushev-roman-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Якушев' AND first_name = 'Роман' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'suhinin-arseniy-2002' AND s.athlete_id <> a.id)
              THEN 'suhinin-arseniy-2002-' || a.id ELSE 'suhinin-arseniy-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Сухинин' AND first_name = 'Арсений' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'tananin-vyacheslav-1997' AND s.athlete_id <> a.id)
              THEN 'tananin-vyacheslav-1997-' || a.id ELSE 'tananin-vyacheslav-1997' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Тананин' AND first_name = 'Вячеслав' AND birth_year = 1997 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'cvik-danil-2003' AND s.athlete_id <> a.id)
              THEN 'cvik-danil-2003-' || a.id ELSE 'cvik-danil-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Цвик' AND first_name = 'Данил' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lupandin-sergey-1997' AND s.athlete_id <> a.id)
              THEN 'lupandin-sergey-1997-' || a.id ELSE 'lupandin-sergey-1997' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Лупандин' AND first_name = 'Сергей' AND birth_year = 1997 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'krivko-nikita-2002' AND s.athlete_id <> a.id)
              THEN 'krivko-nikita-2002-' || a.id ELSE 'krivko-nikita-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кривко' AND first_name = 'Никита' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'neverov-akim-2000' AND s.athlete_id <> a.id)
              THEN 'neverov-akim-2000-' || a.id ELSE 'neverov-akim-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Неверов' AND first_name = 'Аким' AND birth_year = 2000 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ivanov-evgeniy-1997' AND s.athlete_id <> a.id)
              THEN 'ivanov-evgeniy-1997-' || a.id ELSE 'ivanov-evgeniy-1997' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Евгений' AND birth_year = 1997 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'novoselov-andrey-2004' AND s.athlete_id <> a.id)
              THEN 'novoselov-andrey-2004-' || a.id ELSE 'novoselov-andrey-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Новоселов' AND first_name = 'Андрей' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'olenov-vladimir-1991' AND s.athlete_id <> a.id)
              THEN 'olenov-vladimir-1991-' || a.id ELSE 'olenov-vladimir-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Оленов' AND first_name = 'Владимир' AND birth_year = 1991 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sergeev-aleksey-2001' AND s.athlete_id <> a.id)
              THEN 'sergeev-aleksey-2001-' || a.id ELSE 'sergeev-aleksey-2001' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Сергеев' AND first_name = 'Алексей' AND birth_year = 2001 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'gavrik-vyacheslav-2002' AND s.athlete_id <> a.id)
              THEN 'gavrik-vyacheslav-2002-' || a.id ELSE 'gavrik-vyacheslav-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Гаврик' AND first_name = 'Вячеслав' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kanancov-mihail-1997' AND s.athlete_id <> a.id)
              THEN 'kanancov-mihail-1997-' || a.id ELSE 'kanancov-mihail-1997' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кананцов' AND first_name = 'Михаил' AND birth_year = 1997 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'abdrazakov-rafik-2002' AND s.athlete_id <> a.id)
              THEN 'abdrazakov-rafik-2002-' || a.id ELSE 'abdrazakov-rafik-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Абдразаков' AND first_name = 'Рафик' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ermolaev-artem-2002' AND s.athlete_id <> a.id)
              THEN 'ermolaev-artem-2002-' || a.id ELSE 'ermolaev-artem-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ермолаев' AND first_name = 'Артем' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zhumadilov-aslan-2004' AND s.athlete_id <> a.id)
              THEN 'zhumadilov-aslan-2004-' || a.id ELSE 'zhumadilov-aslan-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Жумадилов' AND first_name = 'Аслан' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'getman-maksim-2005' AND s.athlete_id <> a.id)
              THEN 'getman-maksim-2005-' || a.id ELSE 'getman-maksim-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Гетман' AND first_name = 'Максим' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'balashov-maksim-1990' AND s.athlete_id <> a.id)
              THEN 'balashov-maksim-1990-' || a.id ELSE 'balashov-maksim-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Балашов' AND first_name = 'Максим' AND birth_year = 1990 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kamardin-maksim-2002' AND s.athlete_id <> a.id)
              THEN 'kamardin-maksim-2002-' || a.id ELSE 'kamardin-maksim-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Камардин' AND first_name = 'Максим' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'nezhencev-vladislav-1997' AND s.athlete_id <> a.id)
              THEN 'nezhencev-vladislav-1997-' || a.id ELSE 'nezhencev-vladislav-1997' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Неженцев' AND first_name = 'Владислав' AND birth_year = 1997 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'azhermachev-danil-2001' AND s.athlete_id <> a.id)
              THEN 'azhermachev-danil-2001-' || a.id ELSE 'azhermachev-danil-2001' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ажермачев' AND first_name = 'Данил' AND birth_year = 2001 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zhutenkov-igor-2002' AND s.athlete_id <> a.id)
              THEN 'zhutenkov-igor-2002-' || a.id ELSE 'zhutenkov-igor-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Жутенков' AND first_name = 'Игорь' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'perminov-maksim-1994' AND s.athlete_id <> a.id)
              THEN 'perminov-maksim-1994-' || a.id ELSE 'perminov-maksim-1994' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Перминов' AND first_name = 'Максим' AND birth_year = 1994 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'gusev-vladimir-2004' AND s.athlete_id <> a.id)
              THEN 'gusev-vladimir-2004-' || a.id ELSE 'gusev-vladimir-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Гусев' AND first_name = 'Владимир' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zverev-rafael-2002' AND s.athlete_id <> a.id)
              THEN 'zverev-rafael-2002-' || a.id ELSE 'zverev-rafael-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Зверев' AND first_name = 'Рафаель' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'agabekov-rustam-2004' AND s.athlete_id <> a.id)
              THEN 'agabekov-rustam-2004-' || a.id ELSE 'agabekov-rustam-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Агабеков' AND first_name = 'Рустам' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sarsembaev-ilyas-1999' AND s.athlete_id <> a.id)
              THEN 'sarsembaev-ilyas-1999-' || a.id ELSE 'sarsembaev-ilyas-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Сарсембаев' AND first_name = 'Ильяс' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'porcev-roman-1987' AND s.athlete_id <> a.id)
              THEN 'porcev-roman-1987-' || a.id ELSE 'porcev-roman-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Порцев' AND first_name = 'Роман' AND birth_year = 1987 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sinicyn-sergey-2001' AND s.athlete_id <> a.id)
              THEN 'sinicyn-sergey-2001-' || a.id ELSE 'sinicyn-sergey-2001' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Синицын' AND first_name = 'Сергей' AND birth_year = 2001 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lyaukin-kirill-1999' AND s.athlete_id <> a.id)
              THEN 'lyaukin-kirill-1999-' || a.id ELSE 'lyaukin-kirill-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ляукин' AND first_name = 'Кирилл' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'molchanov-dianisiy-2005' AND s.athlete_id <> a.id)
              THEN 'molchanov-dianisiy-2005-' || a.id ELSE 'molchanov-dianisiy-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Молчанов' AND first_name = 'Дианисий' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sarlaev-andrey-2003' AND s.athlete_id <> a.id)
              THEN 'sarlaev-andrey-2003-' || a.id ELSE 'sarlaev-andrey-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Сарлаев' AND first_name = 'Андрей' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'astahov-evgeniy-2002' AND s.athlete_id <> a.id)
              THEN 'astahov-evgeniy-2002-' || a.id ELSE 'astahov-evgeniy-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Астахов' AND first_name = 'Евгений' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'dubel-aleksey-1990' AND s.athlete_id <> a.id)
              THEN 'dubel-aleksey-1990-' || a.id ELSE 'dubel-aleksey-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Дубель' AND first_name = 'Алексей' AND birth_year = 1990 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kosuhin-vladislav-2004' AND s.athlete_id <> a.id)
              THEN 'kosuhin-vladislav-2004-' || a.id ELSE 'kosuhin-vladislav-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Косухин' AND first_name = 'Владислав' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kolomeec-vladislav-1999' AND s.athlete_id <> a.id)
              THEN 'kolomeec-vladislav-1999-' || a.id ELSE 'kolomeec-vladislav-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Коломеец' AND first_name = 'Владислав' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lobanov-ilya-2002' AND s.athlete_id <> a.id)
              THEN 'lobanov-ilya-2002-' || a.id ELSE 'lobanov-ilya-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Лобанов' AND first_name = 'Илья' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'timosharov-kirill-2006' AND s.athlete_id <> a.id)
              THEN 'timosharov-kirill-2006-' || a.id ELSE 'timosharov-kirill-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Тимошаров' AND first_name = 'Кирилл' AND birth_year = 2006 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'alcybeev-nikita-2003' AND s.athlete_id <> a.id)
              THEN 'alcybeev-nikita-2003-' || a.id ELSE 'alcybeev-nikita-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Алцыбеев' AND first_name = 'Никита' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zavarzin-pavel-2000' AND s.athlete_id <> a.id)
              THEN 'zavarzin-pavel-2000-' || a.id ELSE 'zavarzin-pavel-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Заварзин' AND first_name = 'Павел' AND birth_year = 2000 LIMIT 1)
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
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zagorodnev-maksim-1992' AND s.athlete_id <> a.id)
              THEN 'zagorodnev-maksim-1992-' || a.id ELSE 'zagorodnev-maksim-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Загороднев' AND first_name = 'Максим' AND birth_year = 1992 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'yangolenko-daniil-2000' AND s.athlete_id <> a.id)
              THEN 'yangolenko-daniil-2000-' || a.id ELSE 'yangolenko-daniil-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Янголенко' AND first_name = 'Даниил' AND birth_year = 2000 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'razzhivin-andrey-1986' AND s.athlete_id <> a.id)
              THEN 'razzhivin-andrey-1986-' || a.id ELSE 'razzhivin-andrey-1986' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Разживин' AND first_name = 'Андрей' AND birth_year = 1986 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'peshkov-vitaliy-1998' AND s.athlete_id <> a.id)
              THEN 'peshkov-vitaliy-1998-' || a.id ELSE 'peshkov-vitaliy-1998' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Пешков' AND first_name = 'Виталий' AND birth_year = 1998 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ahmedov-edik-1999' AND s.athlete_id <> a.id)
              THEN 'ahmedov-edik-1999-' || a.id ELSE 'ahmedov-edik-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ахмедов' AND first_name = 'Эдик' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'buldakov-nikita-1997' AND s.athlete_id <> a.id)
              THEN 'buldakov-nikita-1997-' || a.id ELSE 'buldakov-nikita-1997' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Булдаков' AND first_name = 'Никита' AND birth_year = 1997 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'minullin-marsel-2000' AND s.athlete_id <> a.id)
              THEN 'minullin-marsel-2000-' || a.id ELSE 'minullin-marsel-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Минуллин' AND first_name = 'Марсель' AND birth_year = 2000 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'rasskazov-ilya-2005' AND s.athlete_id <> a.id)
              THEN 'rasskazov-ilya-2005-' || a.id ELSE 'rasskazov-ilya-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Рассказов' AND first_name = 'Илья' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'semedov-david-1998' AND s.athlete_id <> a.id)
              THEN 'semedov-david-1998-' || a.id ELSE 'semedov-david-1998' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Семедов' AND first_name = 'Давид' AND birth_year = 1998 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'korshunov-sergey-1990' AND s.athlete_id <> a.id)
              THEN 'korshunov-sergey-1990-' || a.id ELSE 'korshunov-sergey-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Коршунов' AND first_name = 'Сергей' AND birth_year = 1990 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lapshin-nikolay-1984' AND s.athlete_id <> a.id)
              THEN 'lapshin-nikolay-1984-' || a.id ELSE 'lapshin-nikolay-1984' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Лапшин' AND first_name = 'Николай' AND birth_year = 1984 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'balabanov-sergey-1996' AND s.athlete_id <> a.id)
              THEN 'balabanov-sergey-1996-' || a.id ELSE 'balabanov-sergey-1996' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Балабанов' AND first_name = 'Сергей' AND birth_year = 1996 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'shevelev-dmitriy-1989' AND s.athlete_id <> a.id)
              THEN 'shevelev-dmitriy-1989-' || a.id ELSE 'shevelev-dmitriy-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Шевелев' AND first_name = 'Дмитрий' AND birth_year = 1989 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kalistratov-artem-1992' AND s.athlete_id <> a.id)
              THEN 'kalistratov-artem-1992-' || a.id ELSE 'kalistratov-artem-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Калистратов' AND first_name = 'Артем' AND birth_year = 1992 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sukmanov-aleksandr-1985' AND s.athlete_id <> a.id)
              THEN 'sukmanov-aleksandr-1985-' || a.id ELSE 'sukmanov-aleksandr-1985' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Сукманов' AND first_name = 'Александр' AND birth_year = 1985 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'tihomirov-vladislav-1996' AND s.athlete_id <> a.id)
              THEN 'tihomirov-vladislav-1996-' || a.id ELSE 'tihomirov-vladislav-1996' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Тихомиров' AND first_name = 'Владислав' AND birth_year = 1996 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'pronichev-sergey-1983' AND s.athlete_id <> a.id)
              THEN 'pronichev-sergey-1983-' || a.id ELSE 'pronichev-sergey-1983' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Проничев' AND first_name = 'Сергей' AND birth_year = 1983 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'konstantinov-aleksandr-2003' AND s.athlete_id <> a.id)
              THEN 'konstantinov-aleksandr-2003-' || a.id ELSE 'konstantinov-aleksandr-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Константинов' AND first_name = 'Александр' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'pirozhnikov-aleksandr-1987' AND s.athlete_id <> a.id)
              THEN 'pirozhnikov-aleksandr-1987-' || a.id ELSE 'pirozhnikov-aleksandr-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Пирожников' AND first_name = 'Александр' AND birth_year = 1987 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'butin-aleksey-1985' AND s.athlete_id <> a.id)
              THEN 'butin-aleksey-1985-' || a.id ELSE 'butin-aleksey-1985' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бутин' AND first_name = 'Алексей' AND birth_year = 1985 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'stankovich-boyan-1988' AND s.athlete_id <> a.id)
              THEN 'stankovich-boyan-1988-' || a.id ELSE 'stankovich-boyan-1988' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Станкович' AND first_name = 'Боян' AND birth_year = 1988 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lezhnev-daniil-2003' AND s.athlete_id <> a.id)
              THEN 'lezhnev-daniil-2003-' || a.id ELSE 'lezhnev-daniil-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Лежнев' AND first_name = 'Даниил' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kulakov-ivan-1998' AND s.athlete_id <> a.id)
              THEN 'kulakov-ivan-1998-' || a.id ELSE 'kulakov-ivan-1998' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кулаков' AND first_name = 'Иван' AND birth_year = 1998 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'klepikov-artem-1998' AND s.athlete_id <> a.id)
              THEN 'klepikov-artem-1998-' || a.id ELSE 'klepikov-artem-1998' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Клепиков' AND first_name = 'Артем' AND birth_year = 1998 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'seliverstov-semen-1989' AND s.athlete_id <> a.id)
              THEN 'seliverstov-semen-1989-' || a.id ELSE 'seliverstov-semen-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Селиверстов' AND first_name = 'Семен' AND birth_year = 1989 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'muhitov-andrey-1999' AND s.athlete_id <> a.id)
              THEN 'muhitov-andrey-1999-' || a.id ELSE 'muhitov-andrey-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Мухитов' AND first_name = 'Андрей' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kudashev-denis-1988' AND s.athlete_id <> a.id)
              THEN 'kudashev-denis-1988-' || a.id ELSE 'kudashev-denis-1988' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кудашев' AND first_name = 'Денис' AND birth_year = 1988 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'burlakov-egor-1998' AND s.athlete_id <> a.id)
              THEN 'burlakov-egor-1998-' || a.id ELSE 'burlakov-egor-1998' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бурлаков' AND first_name = 'Егор' AND birth_year = 1998 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'olehnovich-oleg-1991' AND s.athlete_id <> a.id)
              THEN 'olehnovich-oleg-1991-' || a.id ELSE 'olehnovich-oleg-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Олехнович' AND first_name = 'Олег' AND birth_year = 1991 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'stahanov-valentin-1990' AND s.athlete_id <> a.id)
              THEN 'stahanov-valentin-1990-' || a.id ELSE 'stahanov-valentin-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Стаханов' AND first_name = 'Валентин' AND birth_year = 1990 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'belikova-olesya-2004' AND s.athlete_id <> a.id)
              THEN 'belikova-olesya-2004-' || a.id ELSE 'belikova-olesya-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Беликова' AND first_name = 'Олеся' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'scherbina-dzhanita-1991' AND s.athlete_id <> a.id)
              THEN 'scherbina-dzhanita-1991-' || a.id ELSE 'scherbina-dzhanita-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Щербина' AND first_name = 'Джанита' AND birth_year = 1991 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'bahtova-irina-1999' AND s.athlete_id <> a.id)
              THEN 'bahtova-irina-1999-' || a.id ELSE 'bahtova-irina-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бахтова' AND first_name = 'Ирина' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'mazhaeva-nataliya-1999' AND s.athlete_id <> a.id)
              THEN 'mazhaeva-nataliya-1999-' || a.id ELSE 'mazhaeva-nataliya-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Мажаева' AND first_name = 'Наталия' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'karpova-anna-2003' AND s.athlete_id <> a.id)
              THEN 'karpova-anna-2003-' || a.id ELSE 'karpova-anna-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Карпова' AND first_name = 'Анна' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ivanova-alisa-1997' AND s.athlete_id <> a.id)
              THEN 'ivanova-alisa-1997-' || a.id ELSE 'ivanova-alisa-1997' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Иванова' AND first_name = 'Алиса' AND birth_year = 1997 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'postnikova-anastasiya-2007' AND s.athlete_id <> a.id)
              THEN 'postnikova-anastasiya-2007-' || a.id ELSE 'postnikova-anastasiya-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Постникова' AND first_name = 'Анастасия' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'koptyaeva-karina-2007' AND s.athlete_id <> a.id)
              THEN 'koptyaeva-karina-2007-' || a.id ELSE 'koptyaeva-karina-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Коптяева' AND first_name = 'Карина' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'burmakina-ekaterina-2005' AND s.athlete_id <> a.id)
              THEN 'burmakina-ekaterina-2005-' || a.id ELSE 'burmakina-ekaterina-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бурмакина' AND first_name = 'Екатерина' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'karcova-tatyana-1981' AND s.athlete_id <> a.id)
              THEN 'karcova-tatyana-1981-' || a.id ELSE 'karcova-tatyana-1981' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Карцова' AND first_name = 'Татьяна' AND birth_year = 1981 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kozhevatova-vasilisa-2002' AND s.athlete_id <> a.id)
              THEN 'kozhevatova-vasilisa-2002-' || a.id ELSE 'kozhevatova-vasilisa-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кожеватова' AND first_name = 'Василиса' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'gribanova-irina-2004' AND s.athlete_id <> a.id)
              THEN 'gribanova-irina-2004-' || a.id ELSE 'gribanova-irina-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Грибанова' AND first_name = 'Ирина' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'nynych-margarita-1996' AND s.athlete_id <> a.id)
              THEN 'nynych-margarita-1996-' || a.id ELSE 'nynych-margarita-1996' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ныныч' AND first_name = 'Маргарита' AND birth_year = 1996 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ivanova-elena-1986' AND s.athlete_id <> a.id)
              THEN 'ivanova-elena-1986-' || a.id ELSE 'ivanova-elena-1986' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Иванова' AND first_name = 'Елена' AND birth_year = 1986 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kulik-elena-1984' AND s.athlete_id <> a.id)
              THEN 'kulik-elena-1984-' || a.id ELSE 'kulik-elena-1984' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кулик' AND first_name = 'Елена' AND birth_year = 1984 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'krechun-elena-2007' AND s.athlete_id <> a.id)
              THEN 'krechun-elena-2007-' || a.id ELSE 'krechun-elena-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кречун' AND first_name = 'Елена' AND birth_year = 2007 LIMIT 1)
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
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kashapova-rozana-2001' AND s.athlete_id <> a.id)
              THEN 'kashapova-rozana-2001-' || a.id ELSE 'kashapova-rozana-2001' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кашапова' AND first_name = 'Розана' AND birth_year = 2001 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ryazanova-alena-1997' AND s.athlete_id <> a.id)
              THEN 'ryazanova-alena-1997-' || a.id ELSE 'ryazanova-alena-1997' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Рязанова' AND first_name = 'Алёна' AND birth_year = 1997 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sorokina-olga-2003' AND s.athlete_id <> a.id)
              THEN 'sorokina-olga-2003-' || a.id ELSE 'sorokina-olga-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Сорокина' AND first_name = 'Ольга' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'urzhumceva-svetlana-1992' AND s.athlete_id <> a.id)
              THEN 'urzhumceva-svetlana-1992-' || a.id ELSE 'urzhumceva-svetlana-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Уржумцева' AND first_name = 'Светлана' AND birth_year = 1992 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'goryachkina-lusine-1984' AND s.athlete_id <> a.id)
              THEN 'goryachkina-lusine-1984-' || a.id ELSE 'goryachkina-lusine-1984' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Горячкина' AND first_name = 'Лусине' AND birth_year = 1984 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sergeeva-yuliya-1980' AND s.athlete_id <> a.id)
              THEN 'sergeeva-yuliya-1980-' || a.id ELSE 'sergeeva-yuliya-1980' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Сергеева' AND first_name = 'Юлия' AND birth_year = 1980 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kamalova-zarina-2008' AND s.athlete_id <> a.id)
              THEN 'kamalova-zarina-2008-' || a.id ELSE 'kamalova-zarina-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Камалова' AND first_name = 'Зарина' AND birth_year = 2008 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'minina-marina-1990' AND s.athlete_id <> a.id)
              THEN 'minina-marina-1990-' || a.id ELSE 'minina-marina-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Минина' AND first_name = 'Марина' AND birth_year = 1990 LIMIT 1)
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
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'pimenova-tatyana-1997' AND s.athlete_id <> a.id)
              THEN 'pimenova-tatyana-1997-' || a.id ELSE 'pimenova-tatyana-1997' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Пименова' AND first_name = 'Татьяна' AND birth_year = 1997 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'shmidt-tatyana-1988' AND s.athlete_id <> a.id)
              THEN 'shmidt-tatyana-1988-' || a.id ELSE 'shmidt-tatyana-1988' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Шмидт' AND first_name = 'Татьяна' AND birth_year = 1988 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'evdokimova-elizaveta-1999' AND s.athlete_id <> a.id)
              THEN 'evdokimova-elizaveta-1999-' || a.id ELSE 'evdokimova-elizaveta-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Евдокимова' AND first_name = 'Елизавета' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kuzmicheva-kseniya-2004' AND s.athlete_id <> a.id)
              THEN 'kuzmicheva-kseniya-2004-' || a.id ELSE 'kuzmicheva-kseniya-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кузьмичева' AND first_name = 'Ксения' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'derbeneva-olga-1970' AND s.athlete_id <> a.id)
              THEN 'derbeneva-olga-1970-' || a.id ELSE 'derbeneva-olga-1970' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Дербенева' AND first_name = 'Ольга' AND birth_year = 1970 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'hayrullina-milyausha-2006' AND s.athlete_id <> a.id)
              THEN 'hayrullina-milyausha-2006-' || a.id ELSE 'hayrullina-milyausha-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Хайруллина' AND first_name = 'Миляуша' AND birth_year = 2006 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'vershinina-darya-2009' AND s.athlete_id <> a.id)
              THEN 'vershinina-darya-2009-' || a.id ELSE 'vershinina-darya-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Вершинина' AND first_name = 'Дарья' AND birth_year = 2009 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'benidze-elizaveta-2002' AND s.athlete_id <> a.id)
              THEN 'benidze-elizaveta-2002-' || a.id ELSE 'benidze-elizaveta-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бенидзе' AND first_name = 'Елизавета' AND birth_year = 2002 LIMIT 1)
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
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ivanova-nina-1988' AND s.athlete_id <> a.id)
              THEN 'ivanova-nina-1988-' || a.id ELSE 'ivanova-nina-1988' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Иванова' AND first_name = 'Нина' AND birth_year = 1988 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lizunova-natalya-1993' AND s.athlete_id <> a.id)
              THEN 'lizunova-natalya-1993-' || a.id ELSE 'lizunova-natalya-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Лизунова' AND first_name = 'Наталья' AND birth_year = 1993 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'baranova-irina-2006' AND s.athlete_id <> a.id)
              THEN 'baranova-irina-2006-' || a.id ELSE 'baranova-irina-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Баранова' AND first_name = 'Ирина' AND birth_year = 2006 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kuzmicheva-ekaterina-2004' AND s.athlete_id <> a.id)
              THEN 'kuzmicheva-ekaterina-2004-' || a.id ELSE 'kuzmicheva-ekaterina-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кузьмичева' AND first_name = 'Екатерина' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);

INSERT INTO results (id, category_id, athlete_id, place, total_reps, points, body_weight_kg, rank_achieved_id, discipline_id, bell_kg, hands, time_limit_min, competition_id, event_date, raw_name, raw_club, raw_region, protocol_id, source_page) VALUES
  (3001, 3001, (SELECT id FROM athletes WHERE last_name = 'Бенидзе' AND first_name = 'Джони' AND birth_year = 1990 LIMIT 1), 1, NULL, 215, 63, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Бенидзе Джони', '', 'г. Санкт-Петербург', 3001, NULL),
  (3002, 3001, (SELECT id FROM athletes WHERE last_name = 'Бутенко' AND first_name = 'Евгений' AND birth_year = 1995 LIMIT 1), 2, NULL, 211.5, 62.65, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Бутенко Евгений', 'РЦСП СКиСР НСО', 'Новосибирская область', 3001, NULL),
  (3003, 3001, (SELECT id FROM athletes WHERE last_name = 'Смагулов' AND first_name = 'Нурсултан' AND birth_year = 1999 LIMIT 1), 3, NULL, 194.5, 62.8, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Смагулов Нурсултан', 'СШОР им. В.Ф. Краевского', 'г. Санкт-Петербург', 3001, NULL),
  (3004, 3001, (SELECT id FROM athletes WHERE last_name = 'Маринкин' AND first_name = 'Егор' AND birth_year = 2003 LIMIT 1), 4, NULL, 152, 62.95, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Маринкин Егор', '', 'г.Москва', 3001, NULL),
  (3005, 3001, (SELECT id FROM athletes WHERE last_name = 'Ховалко' AND first_name = 'Василий' AND birth_year = 1993 LIMIT 1), 5, NULL, 147, 61.75, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Ховалко Василий ', '', 'ЯНАО', 3001, NULL),
  (3006, 3001, (SELECT id FROM athletes WHERE last_name = 'Уметбаев' AND first_name = 'Денислам' AND birth_year = 1994 LIMIT 1), 6, NULL, 146, 62.6, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Уметбаев Денислам ', '', 'ЯНАО', 3001, NULL),
  (3007, 3001, (SELECT id FROM athletes WHERE last_name = 'Ильясов' AND first_name = 'Какен' AND birth_year = 1993 LIMIT 1), 7, NULL, 123, 62.95, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Ильясов Какен', 'ВС', 'Омская область', 3001, NULL),
  (3008, 3001, (SELECT id FROM athletes WHERE last_name = 'Манаков' AND first_name = 'Трофим' AND birth_year = 2000 LIMIT 1), 8, NULL, 118.5, 62.75, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Манаков Трофим ', '', 'Курганская область', 3001, NULL),
  (3009, 3001, (SELECT id FROM athletes WHERE last_name = 'Обаранчук' AND first_name = 'Ростислав' AND birth_year = 2003 LIMIT 1), 9, NULL, 102, 62.95, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Обаранчук Ростислав', '', 'г. Санкт-Петербург', 3001, NULL),
  (3010, 3001, (SELECT id FROM athletes WHERE last_name = 'Петелин' AND first_name = 'Александр' AND birth_year = 1987 LIMIT 1), 10, NULL, 96.5, 62.75, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Петелин Александр ', '', 'Тюменская область', 3001, NULL),
  (3011, 3001, (SELECT id FROM athletes WHERE last_name = 'Галеев' AND first_name = 'Роман' AND birth_year = 2005 LIMIT 1), 11, NULL, 76, 62.65, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Галеев Роман', 'СШОР им. В.Ф. Краевского', 'г. Санкт-Петербург', 3001, NULL),
  (3012, 3001, (SELECT id FROM athletes WHERE last_name = 'Барков' AND first_name = 'Егор' AND birth_year = 2005 LIMIT 1), 12, NULL, 46.5, 55.1, NULL, (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Барков Егор', '', 'г. Санкт-Петербург', 3001, NULL),
  (3013, 3002, (SELECT id FROM athletes WHERE last_name = 'Рябков' AND first_name = 'Алексей' AND birth_year = 1993 LIMIT 1), 1, NULL, 227, 67.9, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Рябков Алексей ', '', 'ХМАО-Югра', 3001, NULL),
  (3014, 3002, (SELECT id FROM athletes WHERE last_name = 'Щербин' AND first_name = 'Олег' AND birth_year = 1989 LIMIT 1), 2, NULL, 222, 67.8, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Щербин Олег', '', 'г. Санкт-Петербург', 3001, NULL),
  (3015, 3002, (SELECT id FROM athletes WHERE last_name = 'Зуев' AND first_name = 'Владислав' AND birth_year = 2000 LIMIT 1), 3, NULL, 208, 67.95, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Зуев Владислав', 'ВС РФ', 'Воронежская область', 3001, NULL),
  (3016, 3002, (SELECT id FROM athletes WHERE last_name = 'Шаров' AND first_name = 'Максим' AND birth_year = 2000 LIMIT 1), 4, NULL, 195.5, 67.6, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Шаров Максим ', 'ДДЮ «Алые Паруса»', 'Рязанская область', 3001, NULL),
  (3017, 3002, (SELECT id FROM athletes WHERE last_name = 'Усольцев' AND first_name = 'Александр' AND birth_year = 1992 LIMIT 1), 5, NULL, 170.5, 68, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Усольцев Александр ', '', 'ЯНАО', 3001, NULL),
  (3018, 3002, (SELECT id FROM athletes WHERE last_name = 'Коломин' AND first_name = 'Дмитрий' AND birth_year = 1999 LIMIT 1), 6, NULL, 160.5, 67.8, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Коломин Дмитрий', 'ВС', 'Республика Бурятия', 3001, NULL),
  (3019, 3002, (SELECT id FROM athletes WHERE last_name = 'Егоров' AND first_name = 'Иван' AND birth_year = 1989 LIMIT 1), 7, NULL, 154.5, 67.8, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Егоров Иван', 'СШОР им. В.Ф. Краевского', 'г. Санкт-Петербург', 3001, NULL),
  (3020, 3002, (SELECT id FROM athletes WHERE last_name = 'Морозович' AND first_name = 'Владислав' AND birth_year = 1999 LIMIT 1), 8, NULL, 144, 67.8, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Морозович Владислав', 'ВС', 'Омская область', 3001, NULL),
  (3021, 3002, (SELECT id FROM athletes WHERE last_name = 'Подволоцкий' AND first_name = 'Сергей' AND birth_year = 1997 LIMIT 1), 9, NULL, 132.5, 68, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Подволоцкий Сергей ', 'КОГАУ "СШОР "Юность"', 'Кировская обл.', 3001, NULL),
  (3022, 3002, (SELECT id FROM athletes WHERE last_name = 'Остриков' AND first_name = 'Максим' AND birth_year = 2005 LIMIT 1), 10, NULL, 120, 67.75, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Остриков Максим', 'СШОР "Маршал"', 'Калужская область', 3001, NULL),
  (3023, 3002, (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Евгений' AND birth_year = 1987 LIMIT 1), 11, NULL, 115, 68, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Иванов Евгений', '', 'Томская область', 3001, NULL),
  (3024, 3002, (SELECT id FROM athletes WHERE last_name = 'Чендылов' AND first_name = 'Александр' AND birth_year = 2001 LIMIT 1), 12, NULL, 114, 67.15, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Чендылов Александр', '', 'г. Санкт-Петербург', 3001, NULL),
  (3025, 3002, (SELECT id FROM athletes WHERE last_name = 'Метелёв' AND first_name = 'Никита' AND birth_year = 2005 LIMIT 1), 13, NULL, 111, 67.8, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Метелёв Никита ', '', 'Тюменская область', 3001, NULL),
  (3026, 3002, (SELECT id FROM athletes WHERE last_name = 'Бенидзе' AND first_name = 'Спартак' AND birth_year = 2002 LIMIT 1), 14, NULL, 85.5, 67.6, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Бенидзе Спартак', '', 'г. Санкт-Петербург', 3001, NULL),
  (3027, 3003, (SELECT id FROM athletes WHERE last_name = 'Рассадин' AND first_name = 'Андрей' AND birth_year = 1989 LIMIT 1), 1, NULL, 220, 72.9, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Рассадин Андрей', 'ВС', 'Республика Бурятия', 3001, NULL),
  (3028, 3003, (SELECT id FROM athletes WHERE last_name = 'Сулейманов' AND first_name = 'Мовсар' AND birth_year = 1989 LIMIT 1), 2, NULL, 216.5, 72.95, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Сулейманов Мовсар ', 'СШОР "Маршал"', 'Калужская область', 3001, NULL),
  (3029, 3003, (SELECT id FROM athletes WHERE last_name = 'Жибинов' AND first_name = 'Федор' AND birth_year = 2004 LIMIT 1), 3, NULL, 207.5, 72.3, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Жибинов Федор', 'сш', 'Республика Хакасия', 3001, NULL),
  (3030, 3003, (SELECT id FROM athletes WHERE last_name = 'Карагаев' AND first_name = 'Юрий' AND birth_year = 1994 LIMIT 1), 4, NULL, 195, 72.7, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Карагаев Юрий', '', 'Новосибирская область', 3001, NULL),
  (3031, 3003, (SELECT id FROM athletes WHERE last_name = 'Мащенко' AND first_name = 'Олег' AND birth_year = 1983 LIMIT 1), 5, NULL, 194, 73, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Мащенко Олег', 'ВС', 'Краснодарский край', 3001, NULL),
  (3032, 3003, (SELECT id FROM athletes WHERE last_name = 'Балдин' AND first_name = 'Александр' AND birth_year = 1993 LIMIT 1), 6, NULL, 192.5, 71.85, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Балдин Александр', 'ЦВР', 'Самарская обл.', 3001, NULL),
  (3033, 3003, (SELECT id FROM athletes WHERE last_name = 'Стрекаловских' AND first_name = 'Николай' AND birth_year = 1993 LIMIT 1), 7, NULL, 178, 72.4, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Стрекаловских Николай ', '', 'Курганская область', 3001, NULL),
  (3034, 3003, (SELECT id FROM athletes WHERE last_name = 'Семёнов' AND first_name = 'Андрей' AND birth_year = 1991 LIMIT 1), 8, NULL, 178, 72.8, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Семёнов Андрей ', '', 'ЯНАО', 3001, NULL),
  (3035, 3003, (SELECT id FROM athletes WHERE last_name = 'Буянов' AND first_name = 'Станислав' AND birth_year = 2000 LIMIT 1), 9, NULL, 167, 72.7, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Буянов Станислав', '', 'г. Санкт-Петербург', 3001, NULL),
  (3036, 3003, (SELECT id FROM athletes WHERE last_name = 'Воронов' AND first_name = 'Иван' AND birth_year = 1991 LIMIT 1), 10, NULL, 166.5, 71.8, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Воронов Иван', 'ВС', 'Республика Бурятия', 3001, NULL),
  (3037, 3003, (SELECT id FROM athletes WHERE last_name = 'Каргин' AND first_name = 'Сергей' AND birth_year = 1998 LIMIT 1), 11, NULL, 161.5, 72.65, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Каргин Сергей', 'ВС', 'Республика Бурятия', 3001, NULL),
  (3038, 3003, (SELECT id FROM athletes WHERE last_name = 'Васин' AND first_name = 'Артем' AND birth_year = 2007 LIMIT 1), 12, NULL, 150.5, 71.95, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Васин Артем', 'СШОР "Маршал"', 'Калужская область', 3001, NULL),
  (3039, 3003, (SELECT id FROM athletes WHERE last_name = 'Голиков' AND first_name = 'Роман' AND birth_year = 1990 LIMIT 1), 13, NULL, 149, 70.65, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Голиков Роман', '', 'Красноярский край', 3001, NULL),
  (3040, 3003, (SELECT id FROM athletes WHERE last_name = 'Волдаев' AND first_name = 'Александр' AND birth_year = 2000 LIMIT 1), 14, NULL, 142.5, 72.65, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Волдаев Александр', '', 'Томская область', 3001, NULL),
  (3041, 3003, (SELECT id FROM athletes WHERE last_name = 'Лаптев' AND first_name = 'Александр' AND birth_year = 2002 LIMIT 1), 15, NULL, 136, 73, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Лаптев Александр', 'ВС РФ', 'Смоленская область', 3001, NULL),
  (3042, 3003, (SELECT id FROM athletes WHERE last_name = 'Подгорный' AND first_name = 'Иван' AND birth_year = 2003 LIMIT 1), 16, NULL, 135, 70.45, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Подгорный Иван ', '', 'Челябинская область', 3001, NULL),
  (3043, 3003, (SELECT id FROM athletes WHERE last_name = 'Карнаухов' AND first_name = 'Даниил' AND birth_year = 2001 LIMIT 1), 17, NULL, 113.5, 72.8, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Карнаухов Даниил', 'ВС', 'Республика Бурятия', 3001, NULL),
  (3044, 3003, (SELECT id FROM athletes WHERE last_name = 'Юров' AND first_name = 'Евгений' AND birth_year = 2004 LIMIT 1), 18, NULL, 95, 70.75, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Юров Евгений', '', 'г. Санкт-Петербург', 3001, NULL),
  (3045, 3004, (SELECT id FROM athletes WHERE last_name = 'Квашнин' AND first_name = 'Михаил' AND birth_year = 1988 LIMIT 1), 1, NULL, 249.5, 77.95, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Квашнин Михаил', '', 'Свердловская область', 3001, NULL),
  (3046, 3004, (SELECT id FROM athletes WHERE last_name = 'Баранов' AND first_name = 'Егор' AND birth_year = 1992 LIMIT 1), 2, NULL, 228.5, 77.2, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Баранов Егор', '', 'г.Москва', 3001, NULL),
  (3047, 3004, (SELECT id FROM athletes WHERE last_name = 'Ташланов' AND first_name = 'Илья' AND birth_year = 1987 LIMIT 1), 3, NULL, 224, 77.95, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Ташланов Илья ', '', 'Челябинская область', 3001, NULL),
  (3048, 3004, (SELECT id FROM athletes WHERE last_name = 'Бобров' AND first_name = 'Владимир' AND birth_year = 1989 LIMIT 1), 4, NULL, 218, 76.95, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Бобров Владимир ', '', 'Тюменская область', 3001, NULL),
  (3049, 3004, (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Алексей' AND birth_year = 1995 LIMIT 1), 5, NULL, 216, 78, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Иванов Алексей', 'СШ "Энергия"', 'Чувашская Республика', 3001, NULL),
  (3050, 3004, (SELECT id FROM athletes WHERE last_name = 'Кед' AND first_name = 'Максим' AND birth_year = 2002 LIMIT 1), 6, NULL, 211, 76.9, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Кед Максим ', '', 'Тюменская область', 3001, NULL),
  (3051, 3004, (SELECT id FROM athletes WHERE last_name = 'Павлов' AND first_name = 'Валерий' AND birth_year = 1987 LIMIT 1), 7, NULL, 206.5, 77.9, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Павлов Валерий', '', 'Томская область', 3001, NULL),
  (3052, 3004, (SELECT id FROM athletes WHERE last_name = 'Баев' AND first_name = 'Константин' AND birth_year = 1993 LIMIT 1), 8, NULL, 201.5, 77.7, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Баев Константин ', '', 'ЯНАО', 3001, NULL),
  (3053, 3004, (SELECT id FROM athletes WHERE last_name = 'Ванин' AND first_name = 'Виктор' AND birth_year = 1991 LIMIT 1), 9, NULL, 196.5, 75.6, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Ванин Виктор ', 'ДДЮ «Алые Паруса»', 'Рязанская область', 3001, NULL),
  (3054, 3004, (SELECT id FROM athletes WHERE last_name = 'Любимский' AND first_name = 'Сергей' AND birth_year = 1992 LIMIT 1), 10, NULL, 190.5, 77.6, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Любимский Сергей', 'ВС', 'Республика Бурятия', 3001, NULL),
  (3055, 3004, (SELECT id FROM athletes WHERE last_name = 'Щетков' AND first_name = 'Иван' AND birth_year = 2003 LIMIT 1), 11, NULL, 190, 77.6, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Щетков Иван ', '', 'Тюменская область', 3001, NULL),
  (3056, 3004, (SELECT id FROM athletes WHERE last_name = 'Фомин' AND first_name = 'Федор' AND birth_year = 2004 LIMIT 1), 12, NULL, 157.5, 75.5, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Фомин Федор', 'СШОР№5 г. Белгород', 'Белгородская область', 3001, NULL),
  (3057, 3004, (SELECT id FROM athletes WHERE last_name = 'Береза' AND first_name = 'Егор' AND birth_year = 2003 LIMIT 1), 13, NULL, 139.5, 75.7, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Береза Егор', 'СШОР "Маршал"', 'Калужская область', 3001, NULL),
  (3058, 3004, (SELECT id FROM athletes WHERE last_name = 'Вахонин' AND first_name = 'Егор' AND birth_year = 2005 LIMIT 1), 14, NULL, 132, 74.9, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Вахонин Егор', 'КОГАУ "СШОР "Юность"', 'Кировская обл.', 3001, NULL),
  (3059, 3004, (SELECT id FROM athletes WHERE last_name = 'Майоров' AND first_name = 'Иван' AND birth_year = 2000 LIMIT 1), 15, NULL, 121.5, 74.8, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Майоров Иван', '', 'г. Санкт-Петербург', 3001, NULL),
  (3060, 3004, (SELECT id FROM athletes WHERE last_name = 'Микшин' AND first_name = 'Сергей' AND birth_year = 2000 LIMIT 1), 16, NULL, 0, 78, NULL, (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Микшин  Сергей', '', 'г. Санкт-Петербург', 3001, NULL),
  (3061, 3005, (SELECT id FROM athletes WHERE last_name = 'Черкашин' AND first_name = 'Дмитрий' AND birth_year = 1999 LIMIT 1), 1, NULL, 248.5, 84.65, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Черкашин Дмитрий', '', 'Томская область', 3001, NULL),
  (3062, 3005, (SELECT id FROM athletes WHERE last_name = 'Плотников' AND first_name = 'Вячеслав' AND birth_year = 1998 LIMIT 1), 2, NULL, 234, 78.8, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Плотников Вячеслав ', '', 'Челябинская область', 3001, NULL),
  (3063, 3005, (SELECT id FROM athletes WHERE last_name = 'Маликов' AND first_name = 'Данил' AND birth_year = 2001 LIMIT 1), 3, NULL, 231.5, 84.45, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Маликов Данил', 'ДС ДЮ "Прикамье"', 'Пермский край', 3001, NULL),
  (3064, 3005, (SELECT id FROM athletes WHERE last_name = 'Анасенко' AND first_name = 'Антон' AND birth_year = 1979 LIMIT 1), 4, NULL, 231, 84.6, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Анасенко Антон ', '', 'ЯНАО', 3001, NULL),
  (3065, 3005, (SELECT id FROM athletes WHERE last_name = 'Ефремов' AND first_name = 'Сергей' AND birth_year = 1997 LIMIT 1), 5, NULL, 185, 84, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Ефремов Сергей', '', 'Новосибирская область', 3001, NULL),
  (3066, 3005, (SELECT id FROM athletes WHERE last_name = 'Ветров' AND first_name = 'Денис' AND birth_year = 1989 LIMIT 1), 6, NULL, 183.5, 84.25, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Ветров Денис', '', 'г.Москва', 3001, NULL),
  (3067, 3005, (SELECT id FROM athletes WHERE last_name = 'Козлов' AND first_name = 'Дмитрий' AND birth_year = 2000 LIMIT 1), 7, NULL, 180, 84.1, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Козлов Дмитрий', '', 'г. Санкт-Петербург', 3001, NULL),
  (3068, 3005, (SELECT id FROM athletes WHERE last_name = 'Поздеев' AND first_name = 'Андрей' AND birth_year = 1990 LIMIT 1), 8, NULL, 179.5, 84, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Поздеев Андрей', '', 'Архангельская обл.', 3001, NULL),
  (3069, 3005, (SELECT id FROM athletes WHERE last_name = 'Николаев' AND first_name = 'Аркадий' AND birth_year = 2002 LIMIT 1), 9, NULL, 171, 83.4, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Николаев Аркадий ', '', 'ХМАО-Югра', 3001, NULL),
  (3070, 3005, (SELECT id FROM athletes WHERE last_name = 'Клочек' AND first_name = 'Александр' AND birth_year = 2001 LIMIT 1), 10, NULL, 168.5, 83.9, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Клочек Александр', '', 'Томская область', 3001, NULL),
  (3071, 3005, (SELECT id FROM athletes WHERE last_name = 'Житихин' AND first_name = 'Владислав' AND birth_year = 1994 LIMIT 1), 11, NULL, 160.5, 85, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Житихин Владислав', '', 'Республика Бурятия', 3001, NULL),
  (3072, 3005, (SELECT id FROM athletes WHERE last_name = 'Курдюков' AND first_name = 'Василий' AND birth_year = 1997 LIMIT 1), 12, NULL, 155, 83.9, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Курдюков Василий', '', 'Омская область', 3001, NULL),
  (3073, 3005, (SELECT id FROM athletes WHERE last_name = 'Дьячков' AND first_name = 'Олег' AND birth_year = 1995 LIMIT 1), 13, NULL, 145, 84.75, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Дьячков Олег', 'СШОР№5 г. Белгород', 'Белгородская область', 3001, NULL),
  (3074, 3005, (SELECT id FROM athletes WHERE last_name = 'Кодиров' AND first_name = 'Абдумаъруф' AND birth_year = 2000 LIMIT 1), 14, NULL, 114, 83.85, NULL, (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Кодиров Абдумаъруф', 'ДС ДЮ "Прикамье"', 'Пермский край', 3001, NULL),
  (3075, 3006, (SELECT id FROM athletes WHERE last_name = 'Марков' AND first_name = 'Иван' AND birth_year = 1995 LIMIT 1), 1, NULL, 287, 100.05, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Марков Иван', 'СШОР им. В.Ф. Краевского', 'г. Санкт-Петербург', 3001, NULL),
  (3076, 3006, (SELECT id FROM athletes WHERE last_name = 'Розмазнин' AND first_name = 'Илья' AND birth_year = 2000 LIMIT 1), 2, NULL, 228, 112.4, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Розмазнин Илья', 'НИУ БелГУ', 'Белгородская область', 3001, NULL),
  (3077, 3006, (SELECT id FROM athletes WHERE last_name = 'Июльский' AND first_name = 'Дмитрий' AND birth_year = 1993 LIMIT 1), 3, NULL, 217, 113.7, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Июльский Дмитрий', '', 'г.Москва', 3001, NULL),
  (3078, 3006, (SELECT id FROM athletes WHERE last_name = 'Орлов' AND first_name = 'Сергей' AND birth_year = 2005 LIMIT 1), 4, NULL, 208, 111.5, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Орлов Сергей', '', 'Ставропольский край', 3001, NULL),
  (3079, 3006, (SELECT id FROM athletes WHERE last_name = 'Бурлака' AND first_name = 'Сергей' AND birth_year = 1998 LIMIT 1), 5, NULL, 200.5, 99.4, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Бурлака Сергей', 'ДЮСШ №2', 'Краснодарский край', 3001, NULL),
  (3080, 3006, (SELECT id FROM athletes WHERE last_name = 'Чирков' AND first_name = 'Леонид' AND birth_year = 2003 LIMIT 1), 6, NULL, 190.5, 110.2, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Чирков Леонид ', '', 'Калужская область', 3001, NULL),
  (3081, 3006, (SELECT id FROM athletes WHERE last_name = 'Потатуев' AND first_name = 'Артем' AND birth_year = 1992 LIMIT 1), 7, NULL, 190.5, 115.3, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Потатуев Артем', '', 'Ярославская область', 3001, NULL),
  (3082, 3006, (SELECT id FROM athletes WHERE last_name = 'Афонин' AND first_name = 'Игорь' AND birth_year = 1992 LIMIT 1), 8, NULL, 145.5, 101.75, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Афонин Игорь', '', 'Нижегородская обл.', 3001, NULL),
  (3083, 3006, (SELECT id FROM athletes WHERE last_name = 'Куваев' AND first_name = 'Дмитрий' AND birth_year = 1985 LIMIT 1), 9, NULL, 145, 103.1, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Куваев Дмитрий', '', 'Алтайский край', 3001, NULL),
  (3084, 3006, (SELECT id FROM athletes WHERE last_name = 'Климков' AND first_name = 'Дмитрий' AND birth_year = 1985 LIMIT 1), 10, NULL, 106, 98.7, NULL, (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Климков Дмитрий ', '', 'Ленинградская обл.', 3001, NULL),
  (3085, 3006, (SELECT id FROM athletes WHERE last_name = 'Донских' AND first_name = 'Александр' AND birth_year = 1990 LIMIT 1), 11, NULL, 101.5, 102.7, NULL, (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Донских Александр', 'ВС', 'Омская область', 3001, NULL),
  (3086, 3007, (SELECT id FROM athletes WHERE last_name = 'Турищев' AND first_name = 'Дмитрий' AND birth_year = 1992 LIMIT 1), 1, NULL, 260, 94.4, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Турищев Дмитрий', '', 'г.Москва', 3001, NULL),
  (3087, 3007, (SELECT id FROM athletes WHERE last_name = 'Гуров' AND first_name = 'Владимир' AND birth_year = 1978 LIMIT 1), 2, NULL, 254, 93.4, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Гуров Владимир', 'СШОР "Маршал"', 'Калужская область', 3001, NULL),
  (3088, 3007, (SELECT id FROM athletes WHERE last_name = 'Филиппов' AND first_name = 'Максим' AND birth_year = 1993 LIMIT 1), 3, NULL, 221.5, 91.1, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Филиппов Максим', 'ВС', 'Краснодарский край', 3001, NULL),
  (3089, 3007, (SELECT id FROM athletes WHERE last_name = 'Кирюхин' AND first_name = 'Роман' AND birth_year = 1997 LIMIT 1), 4, NULL, 219, 91.2, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Кирюхин Роман', '', 'г.Москва', 3001, NULL),
  (3090, 3007, (SELECT id FROM athletes WHERE last_name = 'Черкашин' AND first_name = 'Иван' AND birth_year = 1999 LIMIT 1), 5, NULL, 209, 94.05, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Черкашин Иван', '', 'Томская область', 3001, NULL),
  (3091, 3007, (SELECT id FROM athletes WHERE last_name = 'Брюханов' AND first_name = 'Данила' AND birth_year = 1995 LIMIT 1), 6, NULL, 205, 92, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Брюханов Данила', '', 'г. Санкт-Петербург', 3001, NULL),
  (3092, 3007, (SELECT id FROM athletes WHERE last_name = 'Пивень' AND first_name = 'Андрей' AND birth_year = 2003 LIMIT 1), 7, NULL, 203, 85.2, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Пивень Андрей', '', 'Республика Бурятия', 3001, NULL),
  (3093, 3007, (SELECT id FROM athletes WHERE last_name = 'Юрастов' AND first_name = 'Станислав' AND birth_year = 1983 LIMIT 1), 8, NULL, 188, 90.2, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Юрастов Станислав', '', 'Ростовская область', 3001, NULL),
  (3094, 3007, (SELECT id FROM athletes WHERE last_name = 'Антипов' AND first_name = 'Пётр' AND birth_year = 1993 LIMIT 1), 9, NULL, 179, 94.95, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Антипов Пётр ', '', 'г. Санкт-Петербург', 3001, NULL),
  (3095, 3007, (SELECT id FROM athletes WHERE last_name = 'Дунаев' AND first_name = 'Дмитрий' AND birth_year = 2000 LIMIT 1), 10, NULL, 177, 93.75, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Дунаев Дмитрий', 'КОГАУ "СШОР "Юность"', 'Кировская обл.', 3001, NULL),
  (3096, 3007, (SELECT id FROM athletes WHERE last_name = 'Дубков' AND first_name = 'Артем' AND birth_year = 1994 LIMIT 1), 11, NULL, 174, 92.9, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Дубков Артем', '', 'Омская область', 3001, NULL),
  (3097, 3007, (SELECT id FROM athletes WHERE last_name = 'Минибаев' AND first_name = 'Альзаф' AND birth_year = 1987 LIMIT 1), 12, NULL, 169.5, 85.25, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Минибаев Альзаф ', '', 'ЯНАО', 3001, NULL),
  (3098, 3007, (SELECT id FROM athletes WHERE last_name = 'Сисейкин' AND first_name = 'Максим' AND birth_year = 1993 LIMIT 1), 13, NULL, 164, 91.4, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Сисейкин Максим ', '', 'Владимирская область', 3001, NULL),
  (3099, 3007, (SELECT id FROM athletes WHERE last_name = 'Давыдов' AND first_name = 'Антон' AND birth_year = 1982 LIMIT 1), 14, NULL, 148, 89.1, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Давыдов Антон ', '', 'Ленинградская обл.', 3001, NULL),
  (3100, 3007, (SELECT id FROM athletes WHERE last_name = 'Ломов' AND first_name = 'Михаил' AND birth_year = 2002 LIMIT 1), 15, NULL, 91.5, 87, NULL, (SELECT id FROM disciplines WHERE code = 'biathlon'), 32, 'two', 10, 3001, '2023-06-08', 'Ломов Михаил', '', 'г. Санкт-Петербург', 3001, NULL),
  (3101, 3008, (SELECT id FROM athletes WHERE last_name = 'Трофимова' AND first_name = 'Милена' AND birth_year = 2007 LIMIT 1), 1, 61, NULL, 55.32, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 3001, '2023-06-08', 'Трофимова Милена', 'СШОР "Маршал"', 'Калужская область', 3001, NULL),
  (3102, 3008, (SELECT id FROM athletes WHERE last_name = 'Сатлыкова' AND first_name = 'Эльвира' AND birth_year = 2000 LIMIT 1), 2, 59, NULL, 57.94, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 3001, '2023-06-08', 'Сатлыкова Эльвира', 'СШ № 1 им Л.Д. Ковалевского', 'Оренбургская обл.', 3001, NULL),
  (3103, 3008, (SELECT id FROM athletes WHERE last_name = 'Лазарева' AND first_name = 'Анастасия' AND birth_year = 1991 LIMIT 1), 3, 40, NULL, 54.2, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 3001, '2023-06-08', 'Лазарева Анастасия', 'СШОР им. В.Ф. Краевского', 'г. Санкт-Петербург', 3001, NULL),
  (3104, 3008, (SELECT id FROM athletes WHERE last_name = 'Матвеева' AND first_name = 'Елена' AND birth_year = 1974 LIMIT 1), 4, 33, NULL, 57.62, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 3001, '2023-06-08', 'Матвеева Елена', 'КОГАУ "СШОР "Юность"', 'Кировская обл.', 3001, NULL),
  (3105, 3008, (SELECT id FROM athletes WHERE last_name = 'Прохорова' AND first_name = 'Ангелина' AND birth_year = 2005 LIMIT 1), 5, 32, NULL, 56.22, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 3001, '2023-06-08', 'Прохорова Ангелина', '', 'Новосибирская область', 3001, NULL),
  (3106, 3008, (SELECT id FROM athletes WHERE last_name = 'Пестерева' AND first_name = 'Алена' AND birth_year = 2001 LIMIT 1), 6, 30, NULL, 55.94, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 3001, '2023-06-08', 'Пестерева Алена ', '', 'ХМАО-Югра', 3001, NULL),
  (3107, 3008, (SELECT id FROM athletes WHERE last_name = 'Семирунняя' AND first_name = 'Александра' AND birth_year = 2006 LIMIT 1), 7, 28, NULL, 53.84, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 3001, '2023-06-08', 'Семирунняя Александра', '', 'Ростовская область', 3001, NULL),
  (3108, 3008, (SELECT id FROM athletes WHERE last_name = 'Фукс' AND first_name = 'Карина' AND birth_year = 2002 LIMIT 1), 8, 4, NULL, 57.26, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 3001, '2023-06-08', 'Фукс Карина', 'Профсоюзы', 'Брянская область', 3001, NULL),
  (3109, 3009, (SELECT id FROM athletes WHERE last_name = 'Барбакова' AND first_name = 'Александра' AND birth_year = 2004 LIMIT 1), 1, 66, NULL, 61.9, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 3001, '2023-06-08', 'Барбакова Александра ', 'СШОР "Маршал"', 'Калужская область', 3001, NULL),
  (3110, 3009, (SELECT id FROM athletes WHERE last_name = 'Гаврилова' AND first_name = 'Виктория' AND birth_year = 2003 LIMIT 1), 2, 40, NULL, 61.75, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 3001, '2023-06-08', 'Гаврилова Виктория', '', 'Ярославская область', 3001, NULL),
  (3111, 3009, (SELECT id FROM athletes WHERE last_name = 'Васькина' AND first_name = 'Алина' AND birth_year = 1999 LIMIT 1), 3, 30, NULL, 62.85, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 3001, '2023-06-08', 'Васькина Алина', 'СШОР№1,ВС', 'Смоленская область', 3001, NULL),
  (3112, 3009, (SELECT id FROM athletes WHERE last_name = 'Берчатова' AND first_name = 'Мария' AND birth_year = 2005 LIMIT 1), 4, 29, NULL, 62, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 3001, '2023-06-08', 'Берчатова Мария ', '', 'Тюменская область', 3001, NULL),
  (3113, 3009, (SELECT id FROM athletes WHERE last_name = 'Походяева' AND first_name = 'Александра' AND birth_year = 1990 LIMIT 1), 5, 8, NULL, 62.9, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 3001, '2023-06-08', 'Походяева Александра ', '', 'ЯНАО', 3001, NULL),
  (3114, 3009, (SELECT id FROM athletes WHERE last_name = 'Кутенкова' AND first_name = 'Анастасия' AND birth_year = 1997 LIMIT 1), 6, 4, NULL, 63, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 3001, '2023-06-08', 'Кутенкова Анастасия', 'ВС', 'Республика Бурятия', 3001, NULL),
  (3115, 3010, (SELECT id FROM athletes WHERE last_name = 'Мартынова' AND first_name = 'Ирина' AND birth_year = 1999 LIMIT 1), 1, 86, NULL, 83.95, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 3001, '2023-06-08', 'Мартынова Ирина ', 'СШОР "Маршал"', 'Калужская область', 3001, NULL),
  (3116, 3010, (SELECT id FROM athletes WHERE last_name = 'Полякова' AND first_name = 'Полина' AND birth_year = 1999 LIMIT 1), 2, 75, NULL, 78.85, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 3001, '2023-06-08', 'Полякова Полина', '', 'г. Санкт-Петербург', 3001, NULL),
  (3117, 3010, (SELECT id FROM athletes WHERE last_name = 'Круглова' AND first_name = 'Виктория' AND birth_year = 2004 LIMIT 1), 3, 57, NULL, 84.8, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 3001, '2023-06-08', 'Круглова Виктория', 'ДЮСШ"Юность"', 'Краснодарский край', 3001, NULL),
  (3118, 3010, (SELECT id FROM athletes WHERE last_name = 'Ландина' AND first_name = 'Алена' AND birth_year = 2006 LIMIT 1), 4, 51, NULL, 75.8, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 3001, '2023-06-08', 'Ландина Алена', '', 'г.Москва', 3001, NULL),
  (3119, 3010, (SELECT id FROM athletes WHERE last_name = 'Врубель' AND first_name = 'Дарья' AND birth_year = 2000 LIMIT 1), 5, 47, NULL, 106.3, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 3001, '2023-06-08', 'Врубель Дарья', '', 'Омская область', 3001, NULL),
  (3120, 3010, (SELECT id FROM athletes WHERE last_name = 'Иванова' AND first_name = 'Анна' AND birth_year = 2003 LIMIT 1), 6, 32, NULL, 79.2, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 3001, '2023-06-08', 'Иванова Анна', '', 'Республика Хакасия', 3001, NULL),
  (3121, 3010, (SELECT id FROM athletes WHERE last_name = 'Берест' AND first_name = 'Александра' AND birth_year = 2002 LIMIT 1), 7, 21, NULL, 73.9, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 3001, '2023-06-08', 'Берест Александра', 'СШ № 1 им Л.Д. Ковалевского', 'Оренбургская обл.', 3001, NULL),
  (3122, 3010, (SELECT id FROM athletes WHERE last_name = 'Насонова' AND first_name = 'Виктория' AND birth_year = 1999 LIMIT 1), 8, 18, NULL, 91.05, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 3001, '2023-06-08', 'Насонова Виктория', '', 'Томская область', 3001, NULL),
  (3123, 3010, (SELECT id FROM athletes WHERE last_name = 'Лысенко' AND first_name = 'Дарья' AND birth_year = 2005 LIMIT 1), 9, 13, NULL, 78.95, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 3001, '2023-06-08', 'Лысенко Дарья', '', 'Ростовская область', 3001, NULL),
  (3124, 3010, (SELECT id FROM athletes WHERE last_name = 'Яськова' AND first_name = 'Елена' AND birth_year = 2003 LIMIT 1), 10, 10, NULL, 90.65, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 3001, '2023-06-08', 'Яськова Елена', 'Профсоюзы', 'Брянская область', 3001, NULL),
  (3125, 3011, (SELECT id FROM athletes WHERE last_name = 'Воропаева' AND first_name = 'Виктория' AND birth_year = 2004 LIMIT 1), 1, 55, NULL, 66.55, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 3001, '2023-06-08', 'Воропаева Виктория', '', 'Воронежская область', 3001, NULL),
  (3126, 3011, (SELECT id FROM athletes WHERE last_name = 'Билибина' AND first_name = 'Елизавета' AND birth_year = 2004 LIMIT 1), 2, 42, NULL, 67.4, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 3001, '2023-06-08', 'Билибина Елизавета', 'МБУ ДО СШ «Старт»', 'Калужская область', 3001, NULL),
  (3127, 3011, (SELECT id FROM athletes WHERE last_name = 'Фирулева' AND first_name = 'Василиса' AND birth_year = 2004 LIMIT 1), 3, 38, NULL, 65.35, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 3001, '2023-06-08', 'Фирулева Василиса ', '', 'ЯНАО', 3001, NULL),
  (3128, 3011, (SELECT id FROM athletes WHERE last_name = 'Куцанова' AND first_name = 'Анастасия' AND birth_year = 2006 LIMIT 1), 4, 35, NULL, 67.45, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 3001, '2023-06-08', 'Куцанова Анастасия', '', 'Томская область', 3001, NULL),
  (3129, 3011, (SELECT id FROM athletes WHERE last_name = 'Ельчанинова' AND first_name = 'Вероника' AND birth_year = 2003 LIMIT 1), 5, 31, NULL, 68, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 3001, '2023-06-08', 'Ельчанинова Вероника', '', 'Омская область', 3001, NULL),
  (3130, 3011, (SELECT id FROM athletes WHERE last_name = 'Башарова' AND first_name = 'Виктория' AND birth_year = 1993 LIMIT 1), 6, 27, NULL, 68, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 3001, '2023-06-08', 'Башарова Виктория', 'ВС', 'Республика Бурятия', 3001, NULL),
  (3131, 3011, (SELECT id FROM athletes WHERE last_name = 'Кошурникова' AND first_name = 'Анастасия' AND birth_year = 2003 LIMIT 1), 7, 21, NULL, 64.1, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 3001, '2023-06-08', 'Кошурникова Анастасия ', '', 'ХМАО-Югра', 3001, NULL),
  (3132, 3011, (SELECT id FROM athletes WHERE last_name = 'Бадашкова' AND first_name = 'Нина' AND birth_year = 1991 LIMIT 1), 8, 20, NULL, 67.95, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 3001, '2023-06-08', 'Бадашкова Нина', '', 'Новосибирская область', 3001, NULL),
  (3133, 3011, (SELECT id FROM athletes WHERE last_name = 'Альянова' AND first_name = 'Виктория' AND birth_year = 2004 LIMIT 1), 9, 10, NULL, 66.85, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 3001, '2023-06-08', 'Альянова Виктория', 'Профсоюзы', 'Брянская область', 3001, NULL),
  (3134, 3012, (SELECT id FROM athletes WHERE last_name = 'Бутенко' AND first_name = 'Евгений' AND birth_year = 1995 LIMIT 1), 1, 74, NULL, 62.25, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Бутенко Евгений', 'РЦСП СКиСР НСО', 'Новосибирская область', 3001, NULL),
  (3135, 3012, (SELECT id FROM athletes WHERE last_name = 'Недорезов' AND first_name = 'Василий' AND birth_year = 1992 LIMIT 1), 2, 58, NULL, 62.65, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Недорезов Василий', 'ВС', 'Республика Бурятия', 3001, NULL),
  (3136, 3012, (SELECT id FROM athletes WHERE last_name = 'Курунов' AND first_name = 'Анатолий' AND birth_year = 1999 LIMIT 1), 3, 58, NULL, 63, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Курунов Анатолий', 'СШ № 1 им Л.Д. Ковалевского', 'Оренбургская обл.', 3001, NULL),
  (3137, 3012, (SELECT id FROM athletes WHERE last_name = 'Руднев' AND first_name = 'Руслан' AND birth_year = 1994 LIMIT 1), 4, 53, NULL, 62.65, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Руднев Руслан', '', 'г. Санкт-Петербург', 3001, NULL),
  (3138, 3012, (SELECT id FROM athletes WHERE last_name = 'Жбанов' AND first_name = 'Алексей' AND birth_year = 1986 LIMIT 1), 5, 51, NULL, 63, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Жбанов Алексей', 'СШОР им. В.Ф. Краевского', 'г. Санкт-Петербург', 3001, NULL),
  (3139, 3012, (SELECT id FROM athletes WHERE last_name = 'Черепанов' AND first_name = 'Антон' AND birth_year = 2003 LIMIT 1), 6, 45, NULL, 62.9, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Черепанов Антон ', '', 'ХМАО-Югра', 3001, NULL),
  (3140, 3012, (SELECT id FROM athletes WHERE last_name = 'Бедный' AND first_name = 'Даниил' AND birth_year = 2005 LIMIT 1), 7, 44, NULL, 61.4, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Бедный Даниил', 'ДЮСШ"Юность"', 'Краснодарский край', 3001, NULL),
  (3141, 3012, (SELECT id FROM athletes WHERE last_name = 'Якушев' AND first_name = 'Роман' AND birth_year = 2002 LIMIT 1), 8, 44, NULL, 62.75, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Якушев Роман', 'ВС', 'Республика Бурятия', 3001, NULL),
  (3142, 3012, (SELECT id FROM athletes WHERE last_name = 'Сухинин' AND first_name = 'Арсений' AND birth_year = 2002 LIMIT 1), 9, 35, NULL, 60.55, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Сухинин Арсений ', '', 'Тюменская область', 3001, NULL),
  (3143, 3012, (SELECT id FROM athletes WHERE last_name = 'Тананин' AND first_name = 'Вячеслав' AND birth_year = 1997 LIMIT 1), 10, 35, NULL, 62.25, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Тананин Вячеслав ', '', 'ЯНАО', 3001, NULL),
  (3144, 3012, (SELECT id FROM athletes WHERE last_name = 'Цвик' AND first_name = 'Данил' AND birth_year = 2003 LIMIT 1), 11, 33, NULL, 62.5, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Цвик Данил', 'СШОР№1,ВС', 'Смоленская область', 3001, NULL),
  (3145, 3012, (SELECT id FROM athletes WHERE last_name = 'Лупандин' AND first_name = 'Сергей' AND birth_year = 1997 LIMIT 1), 12, 30, NULL, 62.85, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Лупандин Сергей', 'СШОР Губкин', 'Белгородская область', 3001, NULL),
  (3146, 3012, (SELECT id FROM athletes WHERE last_name = 'Кривко' AND first_name = 'Никита' AND birth_year = 2002 LIMIT 1), 13, 29, NULL, 62.2, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Кривко Никита', 'СШОР№5 г. Белгород', 'Белгородская область', 3001, NULL),
  (3147, 3012, (SELECT id FROM athletes WHERE last_name = 'Неверов' AND first_name = 'Аким' AND birth_year = 2000 LIMIT 1), 14, 15, NULL, 63, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Неверов Аким', 'КОГАУ "СШОР "Юность"', 'Кировская обл.', 3001, NULL),
  (3148, 3013, (SELECT id FROM athletes WHERE last_name = 'Рябков' AND first_name = 'Алексей' AND birth_year = 1993 LIMIT 1), 1, 78, NULL, 67.95, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Рябков Алексей ', '', 'ХМАО-Югра', 3001, NULL),
  (3149, 3013, (SELECT id FROM athletes WHERE last_name = 'Усольцев' AND first_name = 'Александр' AND birth_year = 1992 LIMIT 1), 2, 74, NULL, 68, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Усольцев Александр ', '', 'ЯНАО', 3001, NULL),
  (3150, 3013, (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Евгений' AND birth_year = 1997 LIMIT 1), 3, 68, NULL, 67.65, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Иванов Евгений', 'СШОР№1,ВС', 'Смоленская область', 3001, NULL),
  (3151, 3013, (SELECT id FROM athletes WHERE last_name = 'Морозович' AND first_name = 'Владислав' AND birth_year = 1999 LIMIT 1), 4, 63, NULL, 68, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Морозович Владислав', 'ВС', 'Омская область', 3001, NULL),
  (3152, 3013, (SELECT id FROM athletes WHERE last_name = 'Коломин' AND first_name = 'Дмитрий' AND birth_year = 1999 LIMIT 1), 5, 63, NULL, 68, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Коломин Дмитрий', 'ВС', 'Республика Бурятия', 3001, NULL),
  (3153, 3013, (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Евгений' AND birth_year = 1987 LIMIT 1), 6, 61, NULL, 67.29, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Иванов Евгений', '', 'Томская область', 3001, NULL),
  (3154, 3013, (SELECT id FROM athletes WHERE last_name = 'Новоселов' AND first_name = 'Андрей' AND birth_year = 2004 LIMIT 1), 7, 60, NULL, 67.15, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Новоселов Андрей', 'КОГАУ "СШОР "Юность"', 'Кировская обл.', 3001, NULL),
  (3155, 3013, (SELECT id FROM athletes WHERE last_name = 'Оленов' AND first_name = 'Владимир' AND birth_year = 1991 LIMIT 1), 8, 60, NULL, 68, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Оленов Владимир', '', 'Республика Саха (Якутия)', 3001, NULL),
  (3156, 3013, (SELECT id FROM athletes WHERE last_name = 'Сергеев' AND first_name = 'Алексей' AND birth_year = 2001 LIMIT 1), 9, 54, NULL, 67, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Сергеев Алексей ', '', 'ХМАО-Югра', 3001, NULL),
  (3157, 3013, (SELECT id FROM athletes WHERE last_name = 'Гаврик' AND first_name = 'Вячеслав' AND birth_year = 2002 LIMIT 1), 10, 54, NULL, 68, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Гаврик  Вячеслав', 'СШОР им. В.Ф. Краевского', 'г. Санкт-Петербург', 3001, NULL),
  (3158, 3013, (SELECT id FROM athletes WHERE last_name = 'Кананцов' AND first_name = 'Михаил' AND birth_year = 1997 LIMIT 1), 11, 50, NULL, 66.75, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Кананцов Михаил', 'ВС РФ', 'Воронежская область', 3001, NULL),
  (3159, 3013, (SELECT id FROM athletes WHERE last_name = 'Абдразаков' AND first_name = 'Рафик' AND birth_year = 2002 LIMIT 1), 12, 46, NULL, 67.7, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Абдразаков Рафик', 'СШОР№1,ВС', 'Смоленская область', 3001, NULL),
  (3160, 3013, (SELECT id FROM athletes WHERE last_name = 'Остриков' AND first_name = 'Максим' AND birth_year = 2005 LIMIT 1), 13, 42, NULL, 67.7, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Остриков Максим', 'СШОР "Маршал"', 'Калужская область', 3001, NULL),
  (3161, 3013, (SELECT id FROM athletes WHERE last_name = 'Ермолаев' AND first_name = 'Артем' AND birth_year = 2002 LIMIT 1), 14, 40, NULL, 68, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Ермолаев Артем', 'СШОР№5 г. Белгород / 
СШ «Юность»', 'Белгородская область', 3001, NULL),
  (3162, 3013, (SELECT id FROM athletes WHERE last_name = 'Жумадилов' AND first_name = 'Аслан' AND birth_year = 2004 LIMIT 1), 15, 38, NULL, 67.95, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Жумадилов Аслан', '', 'г. Санкт-Петербург+Омская обл.', 3001, NULL),
  (3163, 3013, (SELECT id FROM athletes WHERE last_name = 'Гетман' AND first_name = 'Максим' AND birth_year = 2005 LIMIT 1), 16, 34, NULL, 67.1, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Гетман Максим', 'СШ  ', 'Республика Башкортостан', 3001, NULL),
  (3164, 3013, (SELECT id FROM athletes WHERE last_name = 'Балашов' AND first_name = 'Максим' AND birth_year = 1990 LIMIT 1), 17, 33, NULL, 67.7, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Балашов Максим ', '', 'Ивановская область', 3001, NULL),
  (3165, 3014, (SELECT id FROM athletes WHERE last_name = 'Каргин' AND first_name = 'Сергей' AND birth_year = 1998 LIMIT 1), 1, 76, NULL, 72.9, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Каргин Сергей', 'ВС', 'Республика Бурятия', 3001, NULL),
  (3166, 3014, (SELECT id FROM athletes WHERE last_name = 'Камардин' AND first_name = 'Максим' AND birth_year = 2002 LIMIT 1), 2, 71, NULL, 71.85, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Камардин Максим', 'СШ № 1 им Л.Д. Ковалевского', 'Оренбургская обл.', 3001, NULL),
  (3167, 3014, (SELECT id FROM athletes WHERE last_name = 'Неженцев' AND first_name = 'Владислав' AND birth_year = 1997 LIMIT 1), 3, 61, NULL, 71.9, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Неженцев Владислав', '', 'г.Москва', 3001, NULL),
  (3168, 3014, (SELECT id FROM athletes WHERE last_name = 'Ажермачев' AND first_name = 'Данил' AND birth_year = 2001 LIMIT 1), 4, 58, NULL, 73, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Ажермачев Данил', '', 'Томская область', 3001, NULL),
  (3169, 3014, (SELECT id FROM athletes WHERE last_name = 'Жутенков' AND first_name = 'Игорь' AND birth_year = 2002 LIMIT 1), 5, 52, NULL, 70.5, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Жутенков Игорь', 'СШОР№1,ВС', 'Смоленская область', 3001, NULL),
  (3170, 3014, (SELECT id FROM athletes WHERE last_name = 'Перминов' AND first_name = 'Максим' AND birth_year = 1994 LIMIT 1), 6, 52, NULL, 71.05, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Перминов Максим', 'КОГАУ "СШОР "Юность"', 'Кировская обл.', 3001, NULL),
  (3171, 3014, (SELECT id FROM athletes WHERE last_name = 'Васин' AND first_name = 'Артем' AND birth_year = 2007 LIMIT 1), 7, 52, NULL, 72, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Васин Артем', 'СШОР "Маршал"', 'Калужская область', 3001, NULL),
  (3172, 3014, (SELECT id FROM athletes WHERE last_name = 'Гусев' AND first_name = 'Владимир' AND birth_year = 2004 LIMIT 1), 8, 47, NULL, 73, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Гусев Владимир', '', 'г. Санкт-Петербург', 3001, NULL),
  (3173, 3014, (SELECT id FROM athletes WHERE last_name = 'Зверев' AND first_name = 'Рафаель' AND birth_year = 2002 LIMIT 1), 9, 45, NULL, 73, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Зверев Рафаель', '', 'г. Санкт-Петербург', 3001, NULL),
  (3174, 3014, (SELECT id FROM athletes WHERE last_name = 'Голиков' AND first_name = 'Роман' AND birth_year = 1990 LIMIT 1), 10, 43, NULL, 70.15, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Голиков Роман', '', 'Красноярский край', 3001, NULL),
  (3175, 3014, (SELECT id FROM athletes WHERE last_name = 'Агабеков' AND first_name = 'Рустам' AND birth_year = 2004 LIMIT 1), 11, 22, NULL, 72.15, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Агабеков Рустам', 'ГБУ РД "СШ Белиджи"', 'Республика Дагестан', 3001, NULL),
  (3176, 3014, (SELECT id FROM athletes WHERE last_name = 'Сарсембаев' AND first_name = 'Ильяс' AND birth_year = 1999 LIMIT 1), 12, 0, NULL, 73, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Сарсембаев Ильяс ', '', 'ЯНАО', 3001, NULL),
  (3177, 3015, (SELECT id FROM athletes WHERE last_name = 'Порцев' AND first_name = 'Роман' AND birth_year = 1987 LIMIT 1), 1, 82, NULL, 77.25, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Порцев Роман', 'ДС ДЮ "Прикамье"', 'Пермский край', 3001, NULL),
  (3178, 3015, (SELECT id FROM athletes WHERE last_name = 'Любимский' AND first_name = 'Сергей' AND birth_year = 1992 LIMIT 1), 2, 79, NULL, 77.95, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Любимский Сергей', 'ВС РФ', 'Республика Бурятия', 3001, NULL),
  (3179, 3015, (SELECT id FROM athletes WHERE last_name = 'Синицын' AND first_name = 'Сергей' AND birth_year = 2001 LIMIT 1), 3, 73, NULL, 73.5, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Синицын Сергей', 'ВС РФ', 'Воронежская область', 3001, NULL),
  (3180, 3015, (SELECT id FROM athletes WHERE last_name = 'Ляукин' AND first_name = 'Кирилл' AND birth_year = 1999 LIMIT 1), 4, 73, NULL, 76.85, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Ляукин Кирилл', '', 'Республика Татарстан', 3001, NULL),
  (3181, 3015, (SELECT id FROM athletes WHERE last_name = 'Молчанов' AND first_name = 'Дианисий' AND birth_year = 2005 LIMIT 1), 5, 71, NULL, 75.05, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Молчанов Дианисий', 'СШОР им. В.Ф. Краевского', 'г. Санкт-Петербург', 3001, NULL),
  (3182, 3015, (SELECT id FROM athletes WHERE last_name = 'Баев' AND first_name = 'Константин' AND birth_year = 1993 LIMIT 1), 6, 71, NULL, 76.95, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Баев Константин ', '', 'ЯНАО', 3001, NULL),
  (3183, 3015, (SELECT id FROM athletes WHERE last_name = 'Сарлаев' AND first_name = 'Андрей' AND birth_year = 2003 LIMIT 1), 7, 69, NULL, 78, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Сарлаев Андрей', '', 'Омская область', 3001, NULL),
  (3184, 3015, (SELECT id FROM athletes WHERE last_name = 'Астахов' AND first_name = 'Евгений' AND birth_year = 2002 LIMIT 1), 8, 65, NULL, 76.45, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Астахов Евгений', '', 'г.Москва', 3001, NULL),
  (3185, 3015, (SELECT id FROM athletes WHERE last_name = 'Береза' AND first_name = 'Егор' AND birth_year = 2003 LIMIT 1), 9, 63, NULL, 75.15, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Береза Егор ', 'СШОР "Маршал"', 'Калужская область', 3001, NULL),
  (3186, 3015, (SELECT id FROM athletes WHERE last_name = 'Дубель' AND first_name = 'Алексей' AND birth_year = 1990 LIMIT 1), 10, 62, NULL, 77.95, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Дубель Алексей ', '', 'Курганская область', 3001, NULL),
  (3187, 3015, (SELECT id FROM athletes WHERE last_name = 'Косухин' AND first_name = 'Владислав' AND birth_year = 2004 LIMIT 1), 11, 61, NULL, 77.1, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Косухин Владислав', 'СШОР им. В.Ф. Краевского', 'г. Санкт-Петербург', 3001, NULL),
  (3188, 3015, (SELECT id FROM athletes WHERE last_name = 'Коломеец' AND first_name = 'Владислав' AND birth_year = 1999 LIMIT 1), 12, 60, NULL, 77.75, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Коломеец Владислав', '', 'Омская область', 3001, NULL),
  (3189, 3015, (SELECT id FROM athletes WHERE last_name = 'Фомин' AND first_name = 'Федор' AND birth_year = 2004 LIMIT 1), 13, 57, NULL, 75.2, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Фомин Федор', 'СШОР№5 г. Белгород', 'Белгородская область', 3001, NULL),
  (3190, 3015, (SELECT id FROM athletes WHERE last_name = 'Лобанов' AND first_name = 'Илья' AND birth_year = 2002 LIMIT 1), 14, 53, NULL, 78, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Лобанов Илья', '', 'г. Санкт-Петербург', 3001, NULL),
  (3191, 3015, (SELECT id FROM athletes WHERE last_name = 'Тимошаров' AND first_name = 'Кирилл' AND birth_year = 2006 LIMIT 1), 15, 39, NULL, 77.3, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Тимошаров Кирилл', 'ДЮСШ№2', 'Краснодарский край', 3001, NULL),
  (3192, 3015, (SELECT id FROM athletes WHERE last_name = 'Алцыбеев' AND first_name = 'Никита' AND birth_year = 2003 LIMIT 1), 16, 37, NULL, 77.6, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Алцыбеев Никита', 'КОГАУ "СШОР "Юность"', 'Кировская обл.', 3001, NULL),
  (3193, 3015, (SELECT id FROM athletes WHERE last_name = 'Заварзин' AND first_name = 'Павел' AND birth_year = 2000 LIMIT 1), 17, 0, NULL, 78, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Заварзин Павел', 'СШ № 1 им Л.Д. Ковалевского', 'Оренбургская обл.', 3001, NULL),
  (3194, 3016, (SELECT id FROM athletes WHERE last_name = 'Бородынкин' AND first_name = 'Олег' AND birth_year = 2002 LIMIT 1), 1, 93, NULL, 84.15, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Бородынкин Олег', '', 'Новосибирская область', 3001, NULL),
  (3195, 3016, (SELECT id FROM athletes WHERE last_name = 'Чуев' AND first_name = 'Павел' AND birth_year = 1997 LIMIT 1), 2, 90, NULL, 84.15, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Чуев Павел', 'СШОР им. В.Ф. Краевского', 'г. Санкт-Петербург', 3001, NULL),
  (3196, 3016, (SELECT id FROM athletes WHERE last_name = 'Самочернов' AND first_name = 'Иван' AND birth_year = 1998 LIMIT 1), 3, 85, NULL, 84.95, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Самочернов Иван ', '', 'Курганская область', 3001, NULL),
  (3197, 3016, (SELECT id FROM athletes WHERE last_name = 'Загороднев' AND first_name = 'Максим' AND birth_year = 1992 LIMIT 1), 4, 80, NULL, 82.25, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Загороднев Максим', 'Росгвардия', 'Томская область', 3001, NULL),
  (3198, 3016, (SELECT id FROM athletes WHERE last_name = 'Янголенко' AND first_name = 'Даниил' AND birth_year = 2000 LIMIT 1), 5, 70, NULL, 84.4, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Янголенко Даниил', '', 'г. Санкт-Петербург+ Томская область', 3001, NULL),
  (3199, 3016, (SELECT id FROM athletes WHERE last_name = 'Ефремов' AND first_name = 'Сергей' AND birth_year = 1997 LIMIT 1), 6, 69, NULL, 84.25, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Ефремов Сергей', '', 'Новосибирская область', 3001, NULL),
  (3200, 3016, (SELECT id FROM athletes WHERE last_name = 'Разживин' AND first_name = 'Андрей' AND birth_year = 1986 LIMIT 1), 7, 68, NULL, 83.15, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Разживин Андрей', '', 'Нижегородская обл.', 3001, NULL),
  (3201, 3016, (SELECT id FROM athletes WHERE last_name = 'Пешков' AND first_name = 'Виталий' AND birth_year = 1998 LIMIT 1), 8, 67, NULL, 83.3, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Пешков Виталий', 'СШ № 1 им Л.Д. Ковалевского', 'Оренбургская обл.', 3001, NULL),
  (3202, 3016, (SELECT id FROM athletes WHERE last_name = 'Ахмедов' AND first_name = 'Эдик' AND birth_year = 1999 LIMIT 1), 9, 67, NULL, 84.15, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Ахмедов Эдик', 'ГБУ РД "СШ Белиджи"', 'Республика Дагестан', 3001, NULL),
  (3203, 3016, (SELECT id FROM athletes WHERE last_name = 'Булдаков' AND first_name = 'Никита' AND birth_year = 1997 LIMIT 1), 10, 66, NULL, 83.9, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Булдаков Никита', '', 'Удмуртская Республика', 3001, NULL),
  (3204, 3016, (SELECT id FROM athletes WHERE last_name = 'Минуллин' AND first_name = 'Марсель' AND birth_year = 2000 LIMIT 1), 11, 63, NULL, 83.1, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Минуллин Марсель ', '', 'ХМАО-Югра', 3001, NULL),
  (3205, 3016, (SELECT id FROM athletes WHERE last_name = 'Рассказов' AND first_name = 'Илья' AND birth_year = 2005 LIMIT 1), 12, 62, NULL, 84.15, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Рассказов Илья ', '', 'Тюменская область', 3001, NULL),
  (3206, 3016, (SELECT id FROM athletes WHERE last_name = 'Ветров' AND first_name = 'Денис' AND birth_year = 1989 LIMIT 1), 13, 61, NULL, 84.75, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Ветров Денис', '', 'г.Москва', 3001, NULL),
  (3207, 3016, (SELECT id FROM athletes WHERE last_name = 'Николаев' AND first_name = 'Аркадий' AND birth_year = 2002 LIMIT 1), 14, 60, NULL, 84.15, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Николаев Аркадий ', '', 'ХМАО-Югра', 3001, NULL),
  (3208, 3016, (SELECT id FROM athletes WHERE last_name = 'Семедов' AND first_name = 'Давид' AND birth_year = 1998 LIMIT 1), 15, 58, NULL, 84.6, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Семедов Давид', '', 'г. Санкт-Петербург', 3001, NULL),
  (3209, 3016, (SELECT id FROM athletes WHERE last_name = 'Коршунов' AND first_name = 'Сергей' AND birth_year = 1990 LIMIT 1), 16, 54, NULL, 85, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Коршунов Сергей', '', 'Томская область', 3001, NULL),
  (3210, 3016, (SELECT id FROM athletes WHERE last_name = 'Лапшин' AND first_name = 'Николай' AND birth_year = 1984 LIMIT 1), 17, 36, NULL, 83.7, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Лапшин Николай', 'СШОР им. В.Ф. Краевского', 'Псковская обл.', 3001, NULL),
  (3211, 3017, (SELECT id FROM athletes WHERE last_name = 'Балабанов' AND first_name = 'Сергей' AND birth_year = 1996 LIMIT 1), 1, 99, NULL, 105.55, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Балабанов Сергей', 'ВС', 'Ростовская область', 3001, NULL),
  (3212, 3017, (SELECT id FROM athletes WHERE last_name = 'Шевелев' AND first_name = 'Дмитрий' AND birth_year = 1989 LIMIT 1), 2, 83, NULL, 114.35, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Шевелев Дмитрий', 'ВС', 'Новосибирская область', 3001, NULL),
  (3213, 3017, (SELECT id FROM athletes WHERE last_name = 'Чирков' AND first_name = 'Леонид' AND birth_year = 2003 LIMIT 1), 3, 76, NULL, 111.6, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Чирков Леонид ', '', 'Калужская область', 3001, NULL),
  (3214, 3017, (SELECT id FROM athletes WHERE last_name = 'Калистратов' AND first_name = 'Артем' AND birth_year = 1992 LIMIT 1), 4, 75, NULL, 105, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Калистратов Артем', 'СШОР№1,ВС', 'Смоленская область', 3001, NULL),
  (3215, 3017, (SELECT id FROM athletes WHERE last_name = 'Сукманов' AND first_name = 'Александр' AND birth_year = 1985 LIMIT 1), 5, 75, NULL, 117.25, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Сукманов Александр ', '', 'Курганская область', 3001, NULL),
  (3216, 3017, (SELECT id FROM athletes WHERE last_name = 'Тихомиров' AND first_name = 'Владислав' AND birth_year = 1996 LIMIT 1), 6, 62, NULL, 101.25, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Тихомиров Владислав', 'СШОР им. В.Ф. Краевского', 'г. Санкт-Петербург', 3001, NULL),
  (3217, 3017, (SELECT id FROM athletes WHERE last_name = 'Проничев' AND first_name = 'Сергей' AND birth_year = 1983 LIMIT 1), 7, 59, NULL, 109.7, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Проничев Сергей', 'Динамо', 'Брянская область', 3001, NULL),
  (3218, 3017, (SELECT id FROM athletes WHERE last_name = 'Константинов' AND first_name = 'Александр' AND birth_year = 2003 LIMIT 1), 8, 56, NULL, 119.4, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Константинов Александр', 'СШ "Энергия"', 'Чувашская Республика', 3001, NULL),
  (3219, 3017, (SELECT id FROM athletes WHERE last_name = 'Пирожников' AND first_name = 'Александр' AND birth_year = 1987 LIMIT 1), 9, 47, NULL, 98.15, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Пирожников Александр', 'ДС ДЮ Прикамье', 'Пермский край', 3001, NULL),
  (3220, 3017, (SELECT id FROM athletes WHERE last_name = 'Бутин' AND first_name = 'Алексей' AND birth_year = 1985 LIMIT 1), 10, 43, NULL, 106, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Бутин Алексей', '', 'Красноярский край', 3001, NULL),
  (3221, 3017, (SELECT id FROM athletes WHERE last_name = 'Станкович' AND first_name = 'Боян' AND birth_year = 1988 LIMIT 1), 11, 25, NULL, 102.2, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Станкович Боян', '', 'г. Санкт-Петербург', 3001, NULL),
  (3222, 3017, (SELECT id FROM athletes WHERE last_name = 'Лежнев' AND first_name = 'Даниил' AND birth_year = 2003 LIMIT 1), 12, 24, NULL, 106.35, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Лежнев Даниил', '', 'Ярославская область', 3001, NULL),
  (3223, 3018, (SELECT id FROM athletes WHERE last_name = 'Кулаков' AND first_name = 'Иван' AND birth_year = 1998 LIMIT 1), 1, 102, NULL, 94.45, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Кулаков Иван ', 'ДДЮ «Алые Паруса»', 'Рязанская область', 3001, NULL),
  (3224, 3018, (SELECT id FROM athletes WHERE last_name = 'Клепиков' AND first_name = 'Артем' AND birth_year = 1998 LIMIT 1), 2, 83, NULL, 93.4, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Клепиков Артем', 'КОГАУ "СШОР "Юность"', 'Кировская обл.', 3001, NULL),
  (3225, 3018, (SELECT id FROM athletes WHERE last_name = 'Черкашин' AND first_name = 'Иван' AND birth_year = 1999 LIMIT 1), 3, 83, NULL, 94.65, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Черкашин Иван', '', 'Томская область', 3001, NULL),
  (3226, 3018, (SELECT id FROM athletes WHERE last_name = 'Селиверстов' AND first_name = 'Семен' AND birth_year = 1989 LIMIT 1), 4, 80, NULL, 88.1, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Селиверстов Семен ', '', 'Челябинская область', 3001, NULL),
  (3227, 3018, (SELECT id FROM athletes WHERE last_name = 'Гуров' AND first_name = 'Владимир' AND birth_year = 1978 LIMIT 1), 5, 77, NULL, 93, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Гуров Владимир', 'СШОР "Маршал"', 'Калужская область', 3001, NULL),
  (3228, 3018, (SELECT id FROM athletes WHERE last_name = 'Мухитов' AND first_name = 'Андрей' AND birth_year = 1999 LIMIT 1), 6, 76, NULL, 89.55, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Мухитов Андрей', 'Профсоюзы', 'Брянская область', 3001, NULL),
  (3229, 3018, (SELECT id FROM athletes WHERE last_name = 'Кудашев' AND first_name = 'Денис' AND birth_year = 1988 LIMIT 1), 7, 72, NULL, 88.6, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Кудашев Денис', 'ВС', 'Республика Бурятия', 3001, NULL),
  (3230, 3018, (SELECT id FROM athletes WHERE last_name = 'Бурлаков' AND first_name = 'Егор' AND birth_year = 1998 LIMIT 1), 8, 67, NULL, 92.1, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Бурлаков Егор', '', 'Вологодская обл.', 3001, NULL),
  (3231, 3018, (SELECT id FROM athletes WHERE last_name = 'Олехнович' AND first_name = 'Олег' AND birth_year = 1991 LIMIT 1), 9, 42, NULL, 86.3, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Олехнович Олег', '', 'Новгородская обл.', 3001, NULL),
  (3232, 3018, (SELECT id FROM athletes WHERE last_name = 'Стаханов' AND first_name = 'Валентин' AND birth_year = 1990 LIMIT 1), 10, 42, NULL, 93.7, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 3001, '2023-06-08', 'Стаханов Валентин', 'ВС', 'Омская область', 3001, NULL),
  (3233, 3019, (SELECT id FROM athletes WHERE last_name = 'Беликова' AND first_name = 'Олеся' AND birth_year = 2004 LIMIT 1), 1, 181, NULL, 57.55, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Беликова Олеся', 'СШ «Юность»', 'Белгородская область', 3001, NULL),
  (3234, 3019, (SELECT id FROM athletes WHERE last_name = 'Щербина' AND first_name = 'Джанита' AND birth_year = 1991 LIMIT 1), 2, 179, NULL, 53.58, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Щербина Джанита', '', 'г. Санкт-Петербург', 3001, NULL),
  (3235, 3019, (SELECT id FROM athletes WHERE last_name = 'Бахтова' AND first_name = 'Ирина' AND birth_year = 1999 LIMIT 1), 3, 177, NULL, 55.5, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Бахтова Ирина', 'ЦВР', 'Самарская обл.', 3001, NULL),
  (3236, 3019, (SELECT id FROM athletes WHERE last_name = 'Мажаева' AND first_name = 'Наталия' AND birth_year = 1999 LIMIT 1), 4, 174, NULL, 56.6, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Мажаева Наталия', 'СШОР им. В.Ф. Краевского', 'г. Санкт-Петербург', 3001, NULL),
  (3237, 3019, (SELECT id FROM athletes WHERE last_name = 'Карпова' AND first_name = 'Анна' AND birth_year = 2003 LIMIT 1), 5, 171, NULL, 57.8, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Карпова Анна ', '', 'Тюменская область', 3001, NULL),
  (3238, 3019, (SELECT id FROM athletes WHERE last_name = 'Иванова' AND first_name = 'Алиса' AND birth_year = 1997 LIMIT 1), 6, 150, NULL, 56.46, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Иванова Алиса', 'СШОР№1', 'Смоленская область', 3001, NULL),
  (3239, 3019, (SELECT id FROM athletes WHERE last_name = 'Постникова' AND first_name = 'Анастасия' AND birth_year = 2007 LIMIT 1), 7, 137, NULL, 57.66, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Постникова Анастасия', 'СШ"Юность"', 'Краснодарский край', 3001, NULL),
  (3240, 3019, (SELECT id FROM athletes WHERE last_name = 'Матвеева' AND first_name = 'Елена' AND birth_year = 1974 LIMIT 1), 8, 136, NULL, 57.48, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Матвеева Елена', 'КОГАУ "СШОР "Юность"', 'Кировская обл.', 3001, NULL),
  (3241, 3019, (SELECT id FROM athletes WHERE last_name = 'Коптяева' AND first_name = 'Карина' AND birth_year = 2007 LIMIT 1), 9, 132, NULL, 57.7, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Коптяева Карина ', '', 'Тюменская область', 3001, NULL),
  (3242, 3019, (SELECT id FROM athletes WHERE last_name = 'Бурмакина' AND first_name = 'Екатерина' AND birth_year = 2005 LIMIT 1), 10, 121, NULL, 57.84, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Бурмакина Екатерина', 'ДЮСШ Татнефть "Олимп"', 'Республика Татарстан', 3001, NULL),
  (3243, 3019, (SELECT id FROM athletes WHERE last_name = 'Карцова' AND first_name = 'Татьяна' AND birth_year = 1981 LIMIT 1), 11, 120, NULL, 57.22, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Карцова Татьяна', '', 'г.Москва', 3001, NULL),
  (3244, 3019, (SELECT id FROM athletes WHERE last_name = 'Кожеватова' AND first_name = 'Василиса' AND birth_year = 2002 LIMIT 1), 12, 115, NULL, 54.8, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Кожеватова Василиса', 'СШ № 1 им Л.Д. Ковалевского', 'Оренбургская обл.', 3001, NULL),
  (3245, 3019, (SELECT id FROM athletes WHERE last_name = 'Грибанова' AND first_name = 'Ирина' AND birth_year = 2004 LIMIT 1), 13, 99, NULL, 56.08, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Грибанова Ирина', 'СШОР№1', 'Смоленская область', 3001, NULL),
  (3246, 3019, (SELECT id FROM athletes WHERE last_name = 'Ныныч' AND first_name = 'Маргарита' AND birth_year = 1996 LIMIT 1), 14, 96, NULL, 56.88, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Ныныч Маргарита', '', 'Республика Бурятия', 3001, NULL),
  (3247, 3019, (SELECT id FROM athletes WHERE last_name = 'Иванова' AND first_name = 'Елена' AND birth_year = 1986 LIMIT 1), 15, 94, NULL, 57.9, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Иванова Елена', '', 'Республика Саха (Якутия)', 3001, NULL),
  (3248, 3019, (SELECT id FROM athletes WHERE last_name = 'Кулик' AND first_name = 'Елена' AND birth_year = 1984 LIMIT 1), 16, 84, NULL, 52.06, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Кулик Елена', '', 'г. Санкт-Петербург', 3001, NULL),
  (3249, 3019, (SELECT id FROM athletes WHERE last_name = 'Трофимова' AND first_name = 'Милена' AND birth_year = 2007 LIMIT 1), 17, 71, NULL, 55.68, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Трофимова Милена', 'СШОР "Маршал"', 'Калужская область', 3001, NULL),
  (3250, 3019, (SELECT id FROM athletes WHERE last_name = 'Кречун' AND first_name = 'Елена' AND birth_year = 2007 LIMIT 1), 18, 54, NULL, 53.2, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Кречун Елена', '', 'г. Санкт-Петербург', 3001, NULL),
  (3251, 3020, (SELECT id FROM athletes WHERE last_name = 'Тарвердиева' AND first_name = 'Мария' AND birth_year = 1986 LIMIT 1), 1, 188, NULL, 62.85, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Тарвердиева Мария', 'СШОР им. В.Ф. Краевского', 'г. Санкт-Петербург', 3001, NULL),
  (3252, 3020, (SELECT id FROM athletes WHERE last_name = 'Васькина' AND first_name = 'Алина' AND birth_year = 1999 LIMIT 1), 2, 188, NULL, 62.85, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Васькина Алина', 'СШОР№1,ВС', 'Смоленская область', 3001, NULL),
  (3253, 3020, (SELECT id FROM athletes WHERE last_name = 'Степанова' AND first_name = 'Оксана' AND birth_year = 1990 LIMIT 1), 3, 185, NULL, 62.2, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Степанова Оксана ', '', 'Челябинская область', 3001, NULL),
  (3254, 3020, (SELECT id FROM athletes WHERE last_name = 'Кашапова' AND first_name = 'Розана' AND birth_year = 2001 LIMIT 1), 4, 172, NULL, 63, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Кашапова Розана', 'МАУ СШ', 'Республика Башкортостан', 3001, NULL),
  (3255, 3020, (SELECT id FROM athletes WHERE last_name = 'Походяева' AND first_name = 'Александра' AND birth_year = 1990 LIMIT 1), 5, 141, NULL, 63, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Походяева Александра ', '', 'ЯНАО', 3001, NULL),
  (3256, 3020, (SELECT id FROM athletes WHERE last_name = 'Рязанова' AND first_name = 'Алёна' AND birth_year = 1997 LIMIT 1), 6, 131, NULL, 62.2, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Рязанова Алёна', '', 'г. Санкт-Петербург', 3001, NULL),
  (3257, 3020, (SELECT id FROM athletes WHERE last_name = 'Кутенкова' AND first_name = 'Анастасия' AND birth_year = 1997 LIMIT 1), 7, 130, NULL, 63, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Кутенкова Анастасия', 'ВС', 'Республика Бурятия', 3001, NULL),
  (3258, 3020, (SELECT id FROM athletes WHERE last_name = 'Сорокина' AND first_name = 'Ольга' AND birth_year = 2003 LIMIT 1), 8, 126, NULL, 62.4, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Сорокина Ольга', '', 'Нижегородская обл.', 3001, NULL),
  (3259, 3020, (SELECT id FROM athletes WHERE last_name = 'Уржумцева' AND first_name = 'Светлана' AND birth_year = 1992 LIMIT 1), 9, 121, NULL, 59.75, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Уржумцева Светлана ', '', 'Челябинская область', 3001, NULL),
  (3260, 3020, (SELECT id FROM athletes WHERE last_name = 'Барбакова' AND first_name = 'Александра' AND birth_year = 2004 LIMIT 1), 10, 120, NULL, 61.4, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Барбакова Александра ', 'СШОР "Маршал"', 'Калужская область', 3001, NULL),
  (3261, 3020, (SELECT id FROM athletes WHERE last_name = 'Горячкина' AND first_name = 'Лусине' AND birth_year = 1984 LIMIT 1), 11, 114, NULL, 60.3, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Горячкина Лусине', '', 'Краснодарский край', 3001, NULL),
  (3262, 3020, (SELECT id FROM athletes WHERE last_name = 'Сергеева' AND first_name = 'Юлия' AND birth_year = 1980 LIMIT 1), 12, 85, NULL, 61.7, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Сергеева Юлия', '', 'г.Москва', 3001, NULL),
  (3263, 3020, (SELECT id FROM athletes WHERE last_name = 'Камалова' AND first_name = 'Зарина' AND birth_year = 2008 LIMIT 1), 13, 66, NULL, 59.64, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Камалова Зарина', 'ДЮСШ Татнефть "Олимп"', 'Республика Татарстан', 3001, NULL),
  (3264, 3020, (SELECT id FROM athletes WHERE last_name = 'Минина' AND first_name = 'Марина' AND birth_year = 1990 LIMIT 1), 14, 53, NULL, 61.7, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Минина Марина', '', 'г. Санкт-Петербург', 3001, NULL),
  (3265, 3021, (SELECT id FROM athletes WHERE last_name = 'Мартынова' AND first_name = 'Ирина' AND birth_year = 1999 LIMIT 1), 1, 206, NULL, 83.4, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Мартынова Ирина ', 'СШОР "Маршал"', 'Калужская область', 3001, NULL),
  (3266, 3021, (SELECT id FROM athletes WHERE last_name = 'Полякова' AND first_name = 'Полина' AND birth_year = 1999 LIMIT 1), 2, 203, NULL, 79.25, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Полякова Полина', '', 'г. Санкт-Петербург', 3001, NULL),
  (3267, 3021, (SELECT id FROM athletes WHERE last_name = 'Островская' AND first_name = 'Надежда' AND birth_year = 1985 LIMIT 1), 3, 196, NULL, 94.8, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Островская Надежда ', '', 'ХМАО-Югра', 3001, NULL),
  (3268, 3021, (SELECT id FROM athletes WHERE last_name = 'Ходунова' AND first_name = 'Ирина' AND birth_year = 1985 LIMIT 1), 4, 191, NULL, 75.95, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Ходунова Ирина', 'СШОР№1,ВС', 'Смоленская область', 3001, NULL),
  (3269, 3021, (SELECT id FROM athletes WHERE last_name = 'Врубель' AND first_name = 'Дарья' AND birth_year = 2000 LIMIT 1), 5, 162, NULL, 105.5, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Врубель Дарья', '', 'Омская область', 3001, NULL),
  (3270, 3021, (SELECT id FROM athletes WHERE last_name = 'Пименова' AND first_name = 'Татьяна' AND birth_year = 1997 LIMIT 1), 6, 148, NULL, 70.35, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Пименова Татьяна', '', 'Архангельская обл.', 3001, NULL),
  (3271, 3021, (SELECT id FROM athletes WHERE last_name = 'Шмидт' AND first_name = 'Татьяна' AND birth_year = 1988 LIMIT 1), 7, 148, NULL, 121.75, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Шмидт Татьяна', '', 'Красноярский край', 3001, NULL),
  (3272, 3021, (SELECT id FROM athletes WHERE last_name = 'Евдокимова' AND first_name = 'Елизавета' AND birth_year = 1999 LIMIT 1), 8, 142, NULL, 70.8, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Евдокимова Елизавета', '', 'Архангельская обл.', 3001, NULL),
  (3273, 3021, (SELECT id FROM athletes WHERE last_name = 'Кузьмичева' AND first_name = 'Ксения' AND birth_year = 2004 LIMIT 1), 9, 133, NULL, 88.65, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Кузьмичева Ксения', 'МАУ ДО "Тюльганская ДЮСШ"', 'Оренбургская обл.', 3001, NULL),
  (3274, 3021, (SELECT id FROM athletes WHERE last_name = 'Насонова' AND first_name = 'Виктория' AND birth_year = 1999 LIMIT 1), 10, 126, NULL, 91.35, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Насонова Виктория', '', 'Томская область', 3001, NULL),
  (3275, 3021, (SELECT id FROM athletes WHERE last_name = 'Дербенева' AND first_name = 'Ольга' AND birth_year = 1970 LIMIT 1), 11, 103, NULL, 107.3, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Дербенева Ольга', 'КОГАУ "СШОР "Юность"', 'Кировская обл.', 3001, NULL),
  (3276, 3021, (SELECT id FROM athletes WHERE last_name = 'Ландина' AND first_name = 'Алена' AND birth_year = 2006 LIMIT 1), 12, 90, NULL, 75.75, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Ландина Алена', '', 'г.Москва', 3001, NULL),
  (3277, 3021, (SELECT id FROM athletes WHERE last_name = 'Хайруллина' AND first_name = 'Миляуша' AND birth_year = 2006 LIMIT 1), 13, 88, NULL, 100.65, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Хайруллина Миляуша', 'ДЮСШ Татнефть "Олимп"', 'Республика Татарстан', 3001, NULL),
  (3278, 3021, (SELECT id FROM athletes WHERE last_name = 'Вершинина' AND first_name = 'Дарья' AND birth_year = 2009 LIMIT 1), 14, 86, NULL, 74.7, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Вершинина Дарья', 'КОГАУ "СШОР "Юность"', 'Кировская обл.', 3001, NULL),
  (3279, 3021, (SELECT id FROM athletes WHERE last_name = 'Иванова' AND first_name = 'Анна' AND birth_year = 2003 LIMIT 1), 15, 63, NULL, 79.1, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Иванова Анна', 'СШ', 'Республика Хакасия', 3001, NULL),
  (3280, 3022, (SELECT id FROM athletes WHERE last_name = 'Бенидзе' AND first_name = 'Елизавета' AND birth_year = 2002 LIMIT 1), 1, 202, NULL, 67.15, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Бенидзе Елизавета', '', 'г. Санкт-Петербург', 3001, NULL),
  (3281, 3022, (SELECT id FROM athletes WHERE last_name = 'Барбакова' AND first_name = 'Наталья' AND birth_year = 1984 LIMIT 1), 2, 197, NULL, 65.25, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Барбакова Наталья ', 'СШОР "Маршал"', 'Калужская область', 3001, NULL),
  (3282, 3022, (SELECT id FROM athletes WHERE last_name = 'Башарова' AND first_name = 'Виктория' AND birth_year = 1993 LIMIT 1), 3, 180, NULL, 67.65, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Башарова Виктория', 'ВС', 'Республика Бурятия', 3001, NULL),
  (3283, 3022, (SELECT id FROM athletes WHERE last_name = 'Фирса' AND first_name = 'Анна' AND birth_year = 2003 LIMIT 1), 4, 164, NULL, 67.3, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Фирса Анна', 'СШ"Юность"', 'Краснодарский край', 3001, NULL),
  (3284, 3022, (SELECT id FROM athletes WHERE last_name = 'Иванова' AND first_name = 'Нина' AND birth_year = 1988 LIMIT 1), 5, 164, NULL, 67.65, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Иванова Нина', 'ВС', 'Республика Бурятия', 3001, NULL),
  (3285, 3022, (SELECT id FROM athletes WHERE last_name = 'Лизунова' AND first_name = 'Наталья' AND birth_year = 1993 LIMIT 1), 6, 136, NULL, 67, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Лизунова Наталья', '', 'Кемеровская обл.-Кузбасс', 3001, NULL),
  (3286, 3022, (SELECT id FROM athletes WHERE last_name = 'Баранова' AND first_name = 'Ирина' AND birth_year = 2006 LIMIT 1), 7, 120, NULL, 66.8, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Баранова Ирина ', '', 'Липецкая область', 3001, NULL),
  (3287, 3022, (SELECT id FROM athletes WHERE last_name = 'Кошурникова' AND first_name = 'Анастасия' AND birth_year = 2003 LIMIT 1), 8, 105, NULL, 64.35, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Кошурникова Анастасия ', '', 'ХМАО-Югра', 3001, NULL),
  (3288, 3022, (SELECT id FROM athletes WHERE last_name = 'Куцанова' AND first_name = 'Анастасия' AND birth_year = 2006 LIMIT 1), 9, 100, NULL, 67.75, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Куцанова Анастасия', '', 'Томская область', 3001, NULL),
  (3289, 3022, (SELECT id FROM athletes WHERE last_name = 'Фирулева' AND first_name = 'Василиса' AND birth_year = 2004 LIMIT 1), 10, 95, NULL, 66.35, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Фирулева Василиса ', '', 'ЯНАО', 3001, NULL),
  (3290, 3022, (SELECT id FROM athletes WHERE last_name = 'Ельчанинова' AND first_name = 'Вероника' AND birth_year = 2003 LIMIT 1), 11, 92, NULL, 68, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Ельчанинова Вероника', '', 'Омская область', 3001, NULL),
  (3291, 3022, (SELECT id FROM athletes WHERE last_name = 'Кузьмичева' AND first_name = 'Екатерина' AND birth_year = 2004 LIMIT 1), 12, 88, NULL, 68, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Кузьмичева Екатерина', 'МАУ ДО Тюльганская ДЮСШ', 'Оренбургская обл.', 3001, NULL),
  (3292, 3022, (SELECT id FROM athletes WHERE last_name = 'Бадашкова' AND first_name = 'Нина' AND birth_year = 1991 LIMIT 1), 13, 87, NULL, 67.95, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Бадашкова Нина', '', 'Новосибирская область', 3001, NULL),
  (3293, 3022, (SELECT id FROM athletes WHERE last_name = 'Билибина' AND first_name = 'Елизавета' AND birth_year = 2004 LIMIT 1), 14, 50, NULL, 67.35, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 3001, '2023-06-08', 'Билибина Елизавета', 'МБУ ДО СШ «Старт»', 'Калужская область', 3001, NULL);

INSERT INTO result_reps (id, result_id, exercise, hand, reps) VALUES
  (3001, 3001, 'jerk', 'both', 146),
  (3002, 3001, 'snatch', 'both', 138),
  (3003, 3002, 'jerk', 'both', 129),
  (3004, 3002, 'snatch', 'both', 165),
  (3005, 3003, 'jerk', 'both', 109),
  (3006, 3003, 'snatch', 'both', 171),
  (3007, 3004, 'jerk', 'both', 85),
  (3008, 3004, 'snatch', 'both', 134),
  (3009, 3005, 'jerk', 'both', 77),
  (3010, 3005, 'snatch', 'both', 140),
  (3011, 3006, 'jerk', 'both', 87),
  (3012, 3006, 'snatch', 'both', 118),
  (3013, 3007, 'jerk', 'both', 53),
  (3014, 3007, 'snatch', 'both', 140),
  (3015, 3008, 'jerk', 'both', 68),
  (3016, 3008, 'snatch', 'both', 101),
  (3017, 3009, 'jerk', 'both', 51),
  (3018, 3009, 'snatch', 'both', 102),
  (3019, 3010, 'jerk', 'both', 50),
  (3020, 3010, 'snatch', 'both', 93),
  (3021, 3011, 'jerk', 'both', 45),
  (3022, 3011, 'snatch', 'both', 62),
  (3023, 3012, 'jerk', 'both', 22),
  (3024, 3012, 'snatch', 'both', 49),
  (3025, 3013, 'jerk', 'both', 144),
  (3026, 3013, 'snatch', 'both', 166),
  (3027, 3014, 'jerk', 'both', 131),
  (3028, 3014, 'snatch', 'both', 182),
  (3029, 3015, 'jerk', 'both', 128),
  (3030, 3015, 'snatch', 'both', 160),
  (3031, 3016, 'jerk', 'both', 110),
  (3032, 3016, 'snatch', 'both', 171),
  (3033, 3017, 'jerk', 'both', 97),
  (3034, 3017, 'snatch', 'both', 147),
  (3035, 3018, 'jerk', 'both', 103),
  (3036, 3018, 'snatch', 'both', 115),
  (3037, 3019, 'jerk', 'both', 91),
  (3038, 3019, 'snatch', 'both', 127),
  (3039, 3020, 'jerk', 'both', 79),
  (3040, 3020, 'snatch', 'both', 130),
  (3041, 3021, 'jerk', 'both', 79),
  (3042, 3021, 'snatch', 'both', 107),
  (3043, 3022, 'jerk', 'both', 80),
  (3044, 3022, 'snatch', 'both', 80),
  (3045, 3023, 'jerk', 'both', 60),
  (3046, 3023, 'snatch', 'both', 110),
  (3047, 3024, 'jerk', 'both', 74),
  (3048, 3024, 'snatch', 'both', 80),
  (3049, 3025, 'jerk', 'both', 61),
  (3050, 3025, 'snatch', 'both', 100),
  (3051, 3026, 'jerk', 'both', 33),
  (3052, 3026, 'snatch', 'both', 105),
  (3053, 3027, 'jerk', 'both', 123),
  (3054, 3027, 'snatch', 'both', 194),
  (3055, 3028, 'jerk', 'both', 145),
  (3056, 3028, 'snatch', 'both', 143),
  (3057, 3029, 'jerk', 'both', 119),
  (3058, 3029, 'snatch', 'both', 177),
  (3059, 3030, 'jerk', 'both', 113),
  (3060, 3030, 'snatch', 'both', 164),
  (3061, 3031, 'jerk', 'both', 106),
  (3062, 3031, 'snatch', 'both', 176),
  (3063, 3032, 'jerk', 'both', 108),
  (3064, 3032, 'snatch', 'both', 169),
  (3065, 3033, 'jerk', 'both', 94),
  (3066, 3033, 'snatch', 'both', 168),
  (3067, 3034, 'jerk', 'both', 97),
  (3068, 3034, 'snatch', 'both', 162),
  (3069, 3035, 'jerk', 'both', 93),
  (3070, 3035, 'snatch', 'both', 148),
  (3071, 3036, 'jerk', 'both', 92),
  (3072, 3036, 'snatch', 'both', 149),
  (3073, 3037, 'jerk', 'both', 74),
  (3074, 3037, 'snatch', 'both', 175),
  (3075, 3038, 'jerk', 'both', 97),
  (3076, 3038, 'snatch', 'both', 107),
  (3077, 3039, 'jerk', 'both', 106),
  (3078, 3039, 'snatch', 'both', 86),
  (3079, 3040, 'jerk', 'both', 91),
  (3080, 3040, 'snatch', 'both', 103),
  (3081, 3041, 'jerk', 'both', 70),
  (3082, 3041, 'snatch', 'both', 132),
  (3083, 3042, 'jerk', 'both', 95),
  (3084, 3042, 'snatch', 'both', 80),
  (3085, 3043, 'jerk', 'both', 61),
  (3086, 3043, 'snatch', 'both', 105),
  (3087, 3044, 'jerk', 'both', 65),
  (3088, 3044, 'snatch', 'both', 60),
  (3089, 3045, 'jerk', 'both', 144),
  (3090, 3045, 'snatch', 'both', 211),
  (3091, 3046, 'jerk', 'both', 134),
  (3092, 3046, 'snatch', 'both', 189),
  (3093, 3047, 'jerk', 'both', 141),
  (3094, 3047, 'snatch', 'both', 166),
  (3095, 3048, 'jerk', 'both', 135),
  (3096, 3048, 'snatch', 'both', 166),
  (3097, 3049, 'jerk', 'both', 115),
  (3098, 3049, 'snatch', 'both', 202),
  (3099, 3050, 'jerk', 'both', 136),
  (3100, 3050, 'snatch', 'both', 150),
  (3101, 3051, 'jerk', 'both', 117),
  (3102, 3051, 'snatch', 'both', 179),
  (3103, 3052, 'jerk', 'both', 114),
  (3104, 3052, 'snatch', 'both', 175),
  (3105, 3053, 'jerk', 'both', 106),
  (3106, 3053, 'snatch', 'both', 181),
  (3107, 3054, 'jerk', 'both', 116),
  (3108, 3054, 'snatch', 'both', 149),
  (3109, 3055, 'jerk', 'both', 136),
  (3110, 3055, 'snatch', 'both', 108),
  (3111, 3056, 'jerk', 'both', 110),
  (3112, 3056, 'snatch', 'both', 95),
  (3113, 3057, 'jerk', 'both', 74),
  (3114, 3057, 'snatch', 'both', 131),
  (3115, 3058, 'jerk', 'both', 74),
  (3116, 3058, 'snatch', 'both', 116),
  (3117, 3059, 'jerk', 'both', 61),
  (3118, 3059, 'snatch', 'both', 121),
  (3119, 3060, 'jerk', 'both', 30),
  (3120, 3060, 'snatch', 'both', 0),
  (3121, 3061, 'jerk', 'both', 151),
  (3122, 3061, 'snatch', 'both', 195),
  (3123, 3062, 'jerk', 'both', 132),
  (3124, 3062, 'snatch', 'both', 204),
  (3125, 3063, 'jerk', 'both', 157),
  (3126, 3063, 'snatch', 'both', 149),
  (3127, 3064, 'jerk', 'both', 129),
  (3128, 3064, 'snatch', 'both', 204),
  (3129, 3065, 'jerk', 'both', 105),
  (3130, 3065, 'snatch', 'both', 160),
  (3131, 3066, 'jerk', 'both', 102),
  (3132, 3066, 'snatch', 'both', 163),
  (3133, 3067, 'jerk', 'both', 105),
  (3134, 3067, 'snatch', 'both', 150),
  (3135, 3068, 'jerk', 'both', 99),
  (3136, 3068, 'snatch', 'both', 161),
  (3137, 3069, 'jerk', 'both', 108),
  (3138, 3069, 'snatch', 'both', 126),
  (3139, 3070, 'jerk', 'both', 96),
  (3140, 3070, 'snatch', 'both', 145),
  (3141, 3071, 'jerk', 'both', 99),
  (3142, 3071, 'snatch', 'both', 123),
  (3143, 3072, 'jerk', 'both', 100),
  (3144, 3072, 'snatch', 'both', 110),
  (3145, 3073, 'jerk', 'both', 85),
  (3146, 3073, 'snatch', 'both', 120),
  (3147, 3074, 'jerk', 'both', 59),
  (3148, 3074, 'snatch', 'both', 110),
  (3149, 3075, 'jerk', 'both', 182),
  (3150, 3075, 'snatch', 'both', 210),
  (3151, 3076, 'jerk', 'both', 152),
  (3152, 3076, 'snatch', 'both', 152),
  (3153, 3077, 'jerk', 'both', 135),
  (3154, 3077, 'snatch', 'both', 164),
  (3155, 3078, 'jerk', 'both', 128),
  (3156, 3078, 'snatch', 'both', 160),
  (3157, 3079, 'jerk', 'both', 100),
  (3158, 3079, 'snatch', 'both', 201),
  (3159, 3080, 'jerk', 'both', 124),
  (3160, 3080, 'snatch', 'both', 133),
  (3161, 3081, 'jerk', 'both', 118),
  (3162, 3081, 'snatch', 'both', 145),
  (3163, 3082, 'jerk', 'both', 66),
  (3164, 3082, 'snatch', 'both', 159),
  (3165, 3083, 'jerk', 'both', 77),
  (3166, 3083, 'snatch', 'both', 136),
  (3167, 3084, 'jerk', 'both', 50),
  (3168, 3084, 'snatch', 'both', 112),
  (3169, 3085, 'jerk', 'both', 89),
  (3170, 3085, 'snatch', 'both', 25),
  (3171, 3086, 'jerk', 'both', 164),
  (3172, 3086, 'snatch', 'both', 192),
  (3173, 3087, 'jerk', 'both', 164),
  (3174, 3087, 'snatch', 'both', 180),
  (3175, 3088, 'jerk', 'both', 146),
  (3176, 3088, 'snatch', 'both', 151),
  (3177, 3089, 'jerk', 'both', 121),
  (3178, 3089, 'snatch', 'both', 196),
  (3179, 3090, 'jerk', 'both', 129),
  (3180, 3090, 'snatch', 'both', 160),
  (3181, 3091, 'jerk', 'both', 114),
  (3182, 3091, 'snatch', 'both', 182),
  (3183, 3092, 'jerk', 'both', 111),
  (3184, 3092, 'snatch', 'both', 184),
  (3185, 3093, 'jerk', 'both', 102),
  (3186, 3093, 'snatch', 'both', 172),
  (3187, 3094, 'jerk', 'both', 102),
  (3188, 3094, 'snatch', 'both', 154),
  (3189, 3095, 'jerk', 'both', 102),
  (3190, 3095, 'snatch', 'both', 150),
  (3191, 3096, 'jerk', 'both', 105),
  (3192, 3096, 'snatch', 'both', 138),
  (3193, 3097, 'jerk', 'both', 104),
  (3194, 3097, 'snatch', 'both', 131),
  (3195, 3098, 'jerk', 'both', 93),
  (3196, 3098, 'snatch', 'both', 142),
  (3197, 3099, 'jerk', 'both', 73),
  (3198, 3099, 'snatch', 'both', 150),
  (3199, 3100, 'jerk', 'both', 62),
  (3200, 3100, 'snatch', 'both', 59),
  (3201, 3101, 'long_cycle', 'both', 61),
  (3202, 3102, 'long_cycle', 'both', 59),
  (3203, 3103, 'long_cycle', 'both', 40),
  (3204, 3104, 'long_cycle', 'both', 33),
  (3205, 3105, 'long_cycle', 'both', 32),
  (3206, 3106, 'long_cycle', 'both', 30),
  (3207, 3107, 'long_cycle', 'both', 28),
  (3208, 3108, 'long_cycle', 'both', 4),
  (3209, 3109, 'long_cycle', 'both', 66),
  (3210, 3110, 'long_cycle', 'both', 40),
  (3211, 3111, 'long_cycle', 'both', 30),
  (3212, 3112, 'long_cycle', 'both', 29),
  (3213, 3113, 'long_cycle', 'both', 8),
  (3214, 3114, 'long_cycle', 'both', 4),
  (3215, 3115, 'long_cycle', 'both', 86),
  (3216, 3116, 'long_cycle', 'both', 75),
  (3217, 3117, 'long_cycle', 'both', 57),
  (3218, 3118, 'long_cycle', 'both', 51),
  (3219, 3119, 'long_cycle', 'both', 47),
  (3220, 3120, 'long_cycle', 'both', 32),
  (3221, 3121, 'long_cycle', 'both', 21),
  (3222, 3122, 'long_cycle', 'both', 18),
  (3223, 3123, 'long_cycle', 'both', 13),
  (3224, 3124, 'long_cycle', 'both', 10),
  (3225, 3125, 'long_cycle', 'both', 55),
  (3226, 3126, 'long_cycle', 'both', 42),
  (3227, 3127, 'long_cycle', 'both', 38),
  (3228, 3128, 'long_cycle', 'both', 35),
  (3229, 3129, 'long_cycle', 'both', 31),
  (3230, 3130, 'long_cycle', 'both', 27),
  (3231, 3131, 'long_cycle', 'both', 21),
  (3232, 3132, 'long_cycle', 'both', 20),
  (3233, 3133, 'long_cycle', 'both', 10),
  (3234, 3134, 'long_cycle', 'both', 74),
  (3235, 3135, 'long_cycle', 'both', 58),
  (3236, 3136, 'long_cycle', 'both', 58),
  (3237, 3137, 'long_cycle', 'both', 53),
  (3238, 3138, 'long_cycle', 'both', 51),
  (3239, 3139, 'long_cycle', 'both', 45),
  (3240, 3140, 'long_cycle', 'both', 44),
  (3241, 3141, 'long_cycle', 'both', 44),
  (3242, 3142, 'long_cycle', 'both', 35),
  (3243, 3143, 'long_cycle', 'both', 35),
  (3244, 3144, 'long_cycle', 'both', 33),
  (3245, 3145, 'long_cycle', 'both', 30),
  (3246, 3146, 'long_cycle', 'both', 29),
  (3247, 3147, 'long_cycle', 'both', 15),
  (3248, 3148, 'long_cycle', 'both', 78),
  (3249, 3149, 'long_cycle', 'both', 74),
  (3250, 3150, 'long_cycle', 'both', 68),
  (3251, 3151, 'long_cycle', 'both', 63),
  (3252, 3152, 'long_cycle', 'both', 63),
  (3253, 3153, 'long_cycle', 'both', 61),
  (3254, 3154, 'long_cycle', 'both', 60),
  (3255, 3155, 'long_cycle', 'both', 60),
  (3256, 3156, 'long_cycle', 'both', 54),
  (3257, 3157, 'long_cycle', 'both', 54),
  (3258, 3158, 'long_cycle', 'both', 50),
  (3259, 3159, 'long_cycle', 'both', 46),
  (3260, 3160, 'long_cycle', 'both', 42),
  (3261, 3161, 'long_cycle', 'both', 40),
  (3262, 3162, 'long_cycle', 'both', 38),
  (3263, 3163, 'long_cycle', 'both', 34),
  (3264, 3164, 'long_cycle', 'both', 33),
  (3265, 3165, 'long_cycle', 'both', 76),
  (3266, 3166, 'long_cycle', 'both', 71),
  (3267, 3167, 'long_cycle', 'both', 61),
  (3268, 3168, 'long_cycle', 'both', 58),
  (3269, 3169, 'long_cycle', 'both', 52),
  (3270, 3170, 'long_cycle', 'both', 52),
  (3271, 3171, 'long_cycle', 'both', 52),
  (3272, 3172, 'long_cycle', 'both', 47),
  (3273, 3173, 'long_cycle', 'both', 45),
  (3274, 3174, 'long_cycle', 'both', 43),
  (3275, 3175, 'long_cycle', 'both', 22),
  (3276, 3176, 'long_cycle', 'both', 0),
  (3277, 3177, 'long_cycle', 'both', 82),
  (3278, 3178, 'long_cycle', 'both', 79),
  (3279, 3179, 'long_cycle', 'both', 73),
  (3280, 3180, 'long_cycle', 'both', 73),
  (3281, 3181, 'long_cycle', 'both', 71),
  (3282, 3182, 'long_cycle', 'both', 71),
  (3283, 3183, 'long_cycle', 'both', 69),
  (3284, 3184, 'long_cycle', 'both', 65),
  (3285, 3185, 'long_cycle', 'both', 63),
  (3286, 3186, 'long_cycle', 'both', 62),
  (3287, 3187, 'long_cycle', 'both', 61),
  (3288, 3188, 'long_cycle', 'both', 60),
  (3289, 3189, 'long_cycle', 'both', 57),
  (3290, 3190, 'long_cycle', 'both', 53),
  (3291, 3191, 'long_cycle', 'both', 39),
  (3292, 3192, 'long_cycle', 'both', 37),
  (3293, 3193, 'long_cycle', 'both', 0),
  (3294, 3194, 'long_cycle', 'both', 93),
  (3295, 3195, 'long_cycle', 'both', 90),
  (3296, 3196, 'long_cycle', 'both', 85),
  (3297, 3197, 'long_cycle', 'both', 80),
  (3298, 3198, 'long_cycle', 'both', 70),
  (3299, 3199, 'long_cycle', 'both', 69),
  (3300, 3200, 'long_cycle', 'both', 68),
  (3301, 3201, 'long_cycle', 'both', 67),
  (3302, 3202, 'long_cycle', 'both', 67),
  (3303, 3203, 'long_cycle', 'both', 66),
  (3304, 3204, 'long_cycle', 'both', 63),
  (3305, 3205, 'long_cycle', 'both', 62),
  (3306, 3206, 'long_cycle', 'both', 61),
  (3307, 3207, 'long_cycle', 'both', 60),
  (3308, 3208, 'long_cycle', 'both', 58),
  (3309, 3209, 'long_cycle', 'both', 54),
  (3310, 3210, 'long_cycle', 'both', 36),
  (3311, 3211, 'long_cycle', 'both', 99),
  (3312, 3212, 'long_cycle', 'both', 83),
  (3313, 3213, 'long_cycle', 'both', 76),
  (3314, 3214, 'long_cycle', 'both', 75),
  (3315, 3215, 'long_cycle', 'both', 75),
  (3316, 3216, 'long_cycle', 'both', 62),
  (3317, 3217, 'long_cycle', 'both', 59),
  (3318, 3218, 'long_cycle', 'both', 56),
  (3319, 3219, 'long_cycle', 'both', 47),
  (3320, 3220, 'long_cycle', 'both', 43),
  (3321, 3221, 'long_cycle', 'both', 25),
  (3322, 3222, 'long_cycle', 'both', 24),
  (3323, 3223, 'long_cycle', 'both', 102),
  (3324, 3224, 'long_cycle', 'both', 83),
  (3325, 3225, 'long_cycle', 'both', 83),
  (3326, 3226, 'long_cycle', 'both', 80),
  (3327, 3227, 'long_cycle', 'both', 77),
  (3328, 3228, 'long_cycle', 'both', 76),
  (3329, 3229, 'long_cycle', 'both', 72),
  (3330, 3230, 'long_cycle', 'both', 67),
  (3331, 3231, 'long_cycle', 'both', 42),
  (3332, 3232, 'long_cycle', 'both', 42),
  (3333, 3233, 'snatch', 'both', 181),
  (3334, 3234, 'snatch', 'both', 179),
  (3335, 3235, 'snatch', 'both', 177),
  (3336, 3236, 'snatch', 'both', 174),
  (3337, 3237, 'snatch', 'both', 171),
  (3338, 3238, 'snatch', 'both', 150),
  (3339, 3239, 'snatch', 'both', 137),
  (3340, 3240, 'snatch', 'both', 136),
  (3341, 3241, 'snatch', 'both', 132),
  (3342, 3242, 'snatch', 'both', 121),
  (3343, 3243, 'snatch', 'both', 120),
  (3344, 3244, 'snatch', 'both', 115),
  (3345, 3245, 'snatch', 'both', 99),
  (3346, 3246, 'snatch', 'both', 96),
  (3347, 3247, 'snatch', 'both', 94),
  (3348, 3248, 'snatch', 'both', 84),
  (3349, 3249, 'snatch', 'both', 71),
  (3350, 3250, 'snatch', 'both', 54),
  (3351, 3251, 'snatch', 'both', 188),
  (3352, 3252, 'snatch', 'both', 188),
  (3353, 3253, 'snatch', 'both', 185),
  (3354, 3254, 'snatch', 'both', 172),
  (3355, 3255, 'snatch', 'both', 141),
  (3356, 3256, 'snatch', 'both', 131),
  (3357, 3257, 'snatch', 'both', 130),
  (3358, 3258, 'snatch', 'both', 126),
  (3359, 3259, 'snatch', 'both', 121),
  (3360, 3260, 'snatch', 'both', 120),
  (3361, 3261, 'snatch', 'both', 114),
  (3362, 3262, 'snatch', 'both', 85),
  (3363, 3263, 'snatch', 'both', 66),
  (3364, 3264, 'snatch', 'both', 53),
  (3365, 3265, 'snatch', 'both', 206),
  (3366, 3266, 'snatch', 'both', 203),
  (3367, 3267, 'snatch', 'both', 196),
  (3368, 3268, 'snatch', 'both', 191),
  (3369, 3269, 'snatch', 'both', 162),
  (3370, 3270, 'snatch', 'both', 148),
  (3371, 3271, 'snatch', 'both', 148),
  (3372, 3272, 'snatch', 'both', 142),
  (3373, 3273, 'snatch', 'both', 133),
  (3374, 3274, 'snatch', 'both', 126),
  (3375, 3275, 'snatch', 'both', 103),
  (3376, 3276, 'snatch', 'both', 90),
  (3377, 3277, 'snatch', 'both', 88),
  (3378, 3278, 'snatch', 'both', 86),
  (3379, 3279, 'snatch', 'both', 63),
  (3380, 3280, 'snatch', 'both', 202),
  (3381, 3281, 'snatch', 'both', 197),
  (3382, 3282, 'snatch', 'both', 180),
  (3383, 3283, 'snatch', 'both', 164),
  (3384, 3284, 'snatch', 'both', 164),
  (3385, 3285, 'snatch', 'both', 136),
  (3386, 3286, 'snatch', 'both', 120),
  (3387, 3287, 'snatch', 'both', 105),
  (3388, 3288, 'snatch', 'both', 100),
  (3389, 3289, 'snatch', 'both', 95),
  (3390, 3290, 'snatch', 'both', 92),
  (3391, 3291, 'snatch', 'both', 88),
  (3392, 3292, 'snatch', 'both', 87),
  (3393, 3293, 'snatch', 'both', 50);

