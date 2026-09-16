-- Чемпионат Дальневосточного и Сибирского федеральных округов 2026, Белово, 2026-04-08—2026-04-12.
-- Сгенерировано scripts/gen_seed.py из data/chempionat-dfo-sfo-2026.json, не править руками.
-- Источник — скан официальных протоколов чемпионата федерального округа 2026 (Дальневосточный и Сибирский федеральные округа), PDF без текстового слоя, страницы повёрнуты на 90°. ФИО с отчеством, дата рождения полная. Импорт ведётся по одной индивидуальной категории отдельным коммитом. Эстафеты длинного цикла (стр. 13–14) и командный зачёт (стр. 39) не импортируются: они вне MVP архива. Жонглирование (стр. 37–38) не поддержано текущей схемой. Командные очки сохраняются в JSON как напечатано, но в базу не попадают.
-- Данные извлечены из протокола моделью; сверка человеком не проводилась,
-- поэтому results.verified_by остаётся пустым (FR-A14).

INSERT OR IGNORE INTO regions (name, country) VALUES
  ('Кемеровская область - Кузбасс', 'RU'),
  ('Республика Бурятия', 'RU'),
  ('Томская область', 'RU'),
  ('Омская область', 'RU'),
  ('Алтайский край', 'RU'),
  ('Красноярский край', 'RU'),
  ('Республика Хакасия', 'RU'),
  ('Республика Саха (Якутия)', 'RU'),
  ('Забайкальский край', 'RU'),
  ('Иркутская область', 'RU');

INSERT OR IGNORE INTO clubs (name, region_id) VALUES
  ('МАУ ДО "КСШ КМО"', (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU')),
  ('3 спортивная школа город Улан-Удэ', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')),
  ('ДОО(П)Ц "Юниор"', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')),
  ('Спортивная школа 3, г. Улан-Удэ', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')),
  ('БУ ДО города Омска "СШОР № 33"', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')),
  ('-', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')),
  ('РО ООО «ВФГС» в Омской области', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')),
  ('БУ ДО г.Омска «СШОР 33»', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')),
  ('ДЮСШ "Олимп"Первомайского района', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')),
  ('ТРОО ФГС', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')),
  ('Алтайский край', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')),
  ('Спортивная школа №3,г.Улан-Удэ', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')),
  ('Спортивный клуб "АГАУ"', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')),
  ('КРСОО "Федерация гиревого спорта"', (SELECT id FROM regions WHERE name = 'Красноярский край' AND country = 'RU')),
  ('-', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')),
  ('Республика Бурятия', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')),
  ('Онохойская СШ', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')),
  ('ВФГС', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')),
  ('ДЮСШ Кулундинского района', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')),
  ('ТРОО  ФГС', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')),
  ('МБУ ДО СШ город Улан-Удэ', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')),
  ('Спортивная школа города Черногорска', (SELECT id FROM regions WHERE name = 'Республика Хакасия' AND country = 'RU')),
  ('Федерация гиревого спорта Томской области', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')),
  ('-', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')),
  ('БУ ДО СШОР 33', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')),
  ('ДЮСШ Кулундинского  района', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')),
  ('ВС', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')),
  ('Филиал СОУС г. Новоалтайск', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')),
  ('Республиканский центр национальных видов спорта', (SELECT id FROM regions WHERE name = 'Республика Саха (Якутия)' AND country = 'RU')),
  ('РЦСП Омской области', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')),
  ('МКУ ДО "Шегарская СШ", МКУ ФСЦ "Шегарского района"', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')),
  ('Кемеровская область', (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU')),
  ('МКУ ДО "Шегарская СШ"', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')),
  ('Филиал СГУПС в городе Новоалтайск', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')),
  ('МБУ КДЮСШ им. Ал. Бессмертных', (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU')),
  ('ТГПУ', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')),
  ('МБУ ДО СШОР "Олимп"', (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU')),
  ('МБУ ДО ОНОХОЙСКАЯ СШ', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')),
  ('ВЫГС Кемеровская область', (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU')),
  ('Филиал СГУПС в городе Новоалтайске', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')),
  ('ВС РФ', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')),
  ('ВС', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')),
  ('ООФГСАК', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')),
  ('Первомайская спортивная школа', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')),
  ('Спортивная школа 3', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')),
  ('ЦСП', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')),
  ('Федерация гиревого спорта Алтайского края', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')),
  ('СШОР №33 г. Омск', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')),
  ('РО ООО «ВФГС» в Омской Области', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')),
  ('ВС', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')),
  ('МБУ "ЦФК и  С"', (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU')),
  ('РО ООО ВФГС в Кемеровской области', (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU')),
  ('-', (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU')),
  ('БУ ДО города Омска "СШОР N° 33"', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')),
  ('МАУ ДО "Спортивная школа "Победа" Города Томска"', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')),
  ('Спортшкола "Олимп"', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')),
  ('ВФГС Кемеровской области', (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU')),
  ('МБУ ДО ДООФСЦ Оконешниково', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')),
  ('Роооо ВФГС в РБ', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')),
  ('Сборная Республики Бурятия', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')),
  ('СШОР 33 г Омск', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')),
  ('Динамо', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')),
  ('Центр Поиск', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')),
  ('Центр спорта и здоровья Омского ГАУ', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')),
  ('Федерация гиревого спорта г. Новокузнецка', (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU')),
  ('Гиревой спортклуб  Династия', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')),
  ('Вс рф', (SELECT id FROM regions WHERE name = 'Забайкальский край' AND country = 'RU')),
  ('МО РФ', (SELECT id FROM regions WHERE name = 'Иркутская область' AND country = 'RU')),
  ('ОО Федерация гиревого спорта г.Новокузнецк', (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU')),
  ('ВС', (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU')),
  ('Федерация гиревого спорта Новокузнецка', (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU')),
  ('Республиканский центр Национальных видов спорта', (SELECT id FROM regions WHERE name = 'Республика Саха (Якутия)' AND country = 'RU')),
  ('Газпром добыча Ноябрьск', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')),
  ('МБУ ДО "Спортивная школа города Черногорска"', (SELECT id FROM regions WHERE name = 'Республика Хакасия' AND country = 'RU')),
  ('Спорт школа', (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU')),
  ('БУ ДО г. Омска «СШОР N33»', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')),
  ('Онохойская Детская Юношеская спортивная школа', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')),
  ('ОАО РЖД ШЧ-2', (SELECT id FROM regions WHERE name = 'Иркутская область' AND country = 'RU')),
  ('Спортклуб «Ермак»', (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU')),
  ('СК "Сибиряк"', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')),
  ('Сибиряк', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')),
  ('ВФГС в городе Кемерово', (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU'));

INSERT OR IGNORE INTO federations (name, short_name, country) VALUES
  ('Всероссийская федерация гиревого спорта', 'ВФГС', 'RU');

INSERT INTO competitions (id, slug, name, date_start, date_end, city, country, competition_rank_id, federation_id, source_url, is_published) VALUES
  (5001, 'chempionat-dfo-sfo-2026', 'Чемпионат Дальневосточного и Сибирского федеральных округов 2026', '2026-04-08', '2026-04-12', 'Белово', 'RU', (SELECT id FROM competition_ranks WHERE code = 'federal_district'), (SELECT id FROM federations WHERE name = 'Всероссийская федерация гиревого спорта'), NULL, 1);

INSERT INTO protocols (id, competition_id, r2_key, filename, page_count, is_scan, status, published_at) VALUES
  (5001, 5001, 'protocols/chempionat-dfo-sfo-2026.pdf', 'protokoly_SFO_DFO_2026.pdf', 39, 1, 'published', '2026-04-08');

INSERT INTO categories (id, competition_id, discipline_id, sex, age_group_id, division_id, bell_kg, hands, time_limit_min, weight_class_raw, weight_class_kg, weight_class_is_open, participants_declared, is_deferred, sort_order) VALUES
  (5001, 5001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '58', 58, 0, 2, 0, 1),
  (5002, 5001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '63', 63, 0, 4, 0, 2),
  (5003, 5001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '68+', 68, 1, 3, 0, 3),
  (5004, 5001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '68', 68, 0, 2, 0, 4),
  (5005, 5001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '63', 63, 0, 5, 0, 5),
  (5006, 5001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '68', 68, 0, 5, 0, 6),
  (5007, 5001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '73', 73, 0, 10, 0, 7),
  (5008, 5001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '78', 78, 0, 8, 0, 8),
  (5009, 5001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '85', 85, 0, 5, 0, 9),
  (5010, 5001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '95+', 95, 1, 4, 0, 10),
  (5011, 5001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '95', 95, 0, 5, 0, 11),
  (5012, 5001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '58', 58, 0, 2, 0, 12),
  (5013, 5001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '63', 63, 0, 3, 0, 13),
  (5014, 5001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '68+', 68, 1, 4, 0, 14),
  (5015, 5001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '68', 68, 0, 1, 0, 15),
  (5016, 5001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '63', 63, 0, 4, 0, 16),
  (5017, 5001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '68', 68, 0, 3, 0, 17),
  (5018, 5001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '73', 73, 0, 6, 0, 18),
  (5019, 5001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '78', 78, 0, 8, 0, 19),
  (5020, 5001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '85', 85, 0, 6, 0, 20),
  (5021, 5001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '95+', 95, 1, 3, 0, 21),
  (5022, 5001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '95', 95, 0, 5, 0, 22),
  (5023, 5001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'one', 10, '58', 58, 0, 5, 0, 23),
  (5024, 5001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'one', 10, '63', 63, 0, 4, 0, 24),
  (5025, 5001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'one', 10, '68+', 68, 1, 11, 0, 25),
  (5026, 5001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'one', 10, '68', 68, 0, 6, 0, 26),
  (5027, 5001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '63', 63, 0, 5, 0, 27),
  (5028, 5001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '68', 68, 0, 9, 0, 28),
  (5029, 5001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '73', 73, 0, 10, 0, 29),
  (5030, 5001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '78', 78, 0, 16, 0, 30),
  (5031, 5001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '85', 85, 0, 11, 0, 31),
  (5032, 5001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '95+', 95, 1, 10, 0, 32),
  (5033, 5001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '95', 95, 0, 15, 0, 33);

INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Меденцева', 'Дарья', 'Александровна', 2004, 'f', (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО "КСШ КМО"' AND region_id = (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU')), 'Шляхова Д.П.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Меденцева' AND a.first_name = 'Дарья' AND a.middle_name = 'Александровна' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ныныч', 'Маргарита', 'Анатольевна', 1996, 'f', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '3 спортивная школа город Улан-Удэ' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Рассадин А.А., Трофимов М.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ныныч' AND a.first_name = 'Маргарита' AND a.middle_name = 'Анатольевна' AND a.birth_year = 1996 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Рындина', 'Владислава', 'Романовна', 2009, 'f', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ДОО(П)Ц "Юниор"' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Иванов Д.С.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Рындина' AND a.first_name = 'Владислава' AND a.middle_name = 'Романовна' AND a.birth_year = 2009 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Григорьева', 'Эмилия', 'Сергеевна', 2006, 'f', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Спортивная школа 3, г. Улан-Удэ' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Коломин Д.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Григорьева' AND a.first_name = 'Эмилия' AND a.middle_name = 'Сергеевна' AND a.birth_year = 2006 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Болотова', 'Елизавета', 'Сергеевна', 2007, 'f', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'БУ ДО города Омска "СШОР № 33"' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Сагандыков К.К.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Болотова' AND a.first_name = 'Елизавета' AND a.middle_name = 'Сергеевна' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Воробьёва', 'Надежда', 'Андреевна', 2000, 'f', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Башарова В.В.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Воробьёва' AND a.first_name = 'Надежда' AND a.middle_name = 'Андреевна' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Вяткина', 'Вера', 'Павловна', 1999, 'f', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО «ВФГС» в Омской области' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Сагандыков К.К.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Вяткина' AND a.first_name = 'Вера' AND a.middle_name = 'Павловна' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Врубель', 'Дарья', 'Васильевна', 2000, 'f', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'БУ ДО г.Омска «СШОР 33»' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Сагандыков К.К., Переверзев Н.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Врубель' AND a.first_name = 'Дарья' AND a.middle_name = 'Васильевна' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Маркова', 'Анна', 'Александровна', 2009, 'f', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ДЮСШ "Олимп"Первомайского района' AND region_id = (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')), 'Пожидаев В.В.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Маркова' AND a.first_name = 'Анна' AND a.middle_name = 'Александровна' AND a.birth_year = 2009 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ермолина', 'Ирина', 'Евгеньевна', 2008, 'f', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ТРОО ФГС' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Бажин А.М.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ермолина' AND a.first_name = 'Ирина' AND a.middle_name = 'Евгеньевна' AND a.birth_year = 2008 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Попова', 'Ольга', 'Сергеевна', 2002, 'f', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Алтайский край' AND region_id = (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')), 'Бреусов С.И.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Попова' AND a.first_name = 'Ольга' AND a.middle_name = 'Сергеевна' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кузнецов', 'Роман', 'Андреевич', 2009, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Спортивная школа №3,г.Улан-Удэ' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Коломин Д.А., Алексеев В.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кузнецов' AND a.first_name = 'Роман' AND a.middle_name = 'Андреевич' AND a.birth_year = 2009 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кашкаров', 'Артур', 'Анатольевич', 2005, 'm', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Спортивный клуб "АГАУ"' AND region_id = (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')), 'Платонов С.С.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кашкаров' AND a.first_name = 'Артур' AND a.middle_name = 'Анатольевич' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Филипьев', 'Владислав', 'Валерьевич', 2005, 'm', (SELECT id FROM regions WHERE name = 'Красноярский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КРСОО "Федерация гиревого спорта"' AND region_id = (SELECT id FROM regions WHERE name = 'Красноярский край' AND country = 'RU')), 'Григорчук С.С., Шмидт Т.А.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Филипьев' AND a.first_name = 'Владислав' AND a.middle_name = 'Валерьевич' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Фрис', 'Герман', 'Эдуардович', 2008, 'm', (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО "КСШ КМО"' AND region_id = (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU')), 'Шляхова Д.П., Кульга А.В.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Фрис' AND a.first_name = 'Герман' AND a.middle_name = 'Эдуардович' AND a.birth_year = 2008 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Масленников', 'Максим', 'Алексеевич', 2003, 'm', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')), 'Белова Н.Ю.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Масленников' AND a.first_name = 'Максим' AND a.middle_name = 'Алексеевич' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Василевич', 'Добрыня', 'Андреевич', 2000, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Республика Бурятия' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Рассадин А.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Василевич' AND a.first_name = 'Добрыня' AND a.middle_name = 'Андреевич' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Коломин', 'Дмитрий', 'Андреевич', 1999, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Онохойская СШ' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Рассадин А.А., Хлебодаров А.Г., Леонов С.Т.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Коломин' AND a.first_name = 'Дмитрий' AND a.middle_name = 'Андреевич' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Рыбский', 'Павел', 'Сергеевич', 2008, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВФГС' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Бажин А.М.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Рыбский' AND a.first_name = 'Павел' AND a.middle_name = 'Сергеевич' AND a.birth_year = 2008 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Аникусько', 'Семён', 'Сергеевич', 2009, 'm', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ДЮСШ Кулундинского района' AND region_id = (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')), 'Катаев И.Н.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Аникусько' AND a.first_name = 'Семён' AND a.middle_name = 'Сергеевич' AND a.birth_year = 2009 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Старцев', 'Вадим', 'Андреевич', 2007, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ТРОО  ФГС' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Полянский В.С., Елесов Е.Н.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Старцев' AND a.first_name = 'Вадим' AND a.middle_name = 'Андреевич' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Рассадин', 'Андрей', 'Андреевич', 1989, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ город Улан-Удэ' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Леонов С.Т., Руднев С.Л.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Рассадин' AND a.first_name = 'Андрей' AND a.middle_name = 'Андреевич' AND a.birth_year = 1989 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Жибинов', 'Фёдор', 'Васильевич', 2004, 'm', (SELECT id FROM regions WHERE name = 'Республика Хакасия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Спортивная школа города Черногорска' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Хакасия' AND country = 'RU')), 'Жибинов К.В., Жибинов В.В.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Жибинов' AND a.first_name = 'Фёдор' AND a.middle_name = 'Васильевич' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Волдаев', 'Александр', 'Владимирович', 2000, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Федерация гиревого спорта Томской области' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Ажермачев А.Б.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Волдаев' AND a.first_name = 'Александр' AND a.middle_name = 'Владимирович' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Григорчук', 'Сергей', 'Сергеевич', 2002, 'm', (SELECT id FROM regions WHERE name = 'Красноярский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КРСОО "Федерация гиревого спорта"' AND region_id = (SELECT id FROM regions WHERE name = 'Красноярский край' AND country = 'RU')), 'Морохин А.Ф.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Григорчук' AND a.first_name = 'Сергей' AND a.middle_name = 'Сергеевич' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Витрук', 'Лев', 'Борисович', 2008, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'ДягилевА.В.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Витрук' AND a.first_name = 'Лев' AND a.middle_name = 'Борисович' AND a.birth_year = 2008 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Седых', 'Илья', 'Александрович', 2004, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'БУ ДО СШОР 33' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Козленко В.Н., Чудаков В.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Седых' AND a.first_name = 'Илья' AND a.middle_name = 'Александрович' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Любин', 'Валентин', 'Сергеевич', 2009, 'm', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ДЮСШ Кулундинского  района' AND region_id = (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')), 'Катаев И.Н.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Любин' AND a.first_name = 'Валентин' AND a.middle_name = 'Сергеевич' AND a.birth_year = 2009 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Воронов', 'Иван', 'Андреевич', 1991, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Кудашев Д.А., Коломин Д.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Воронов' AND a.first_name = 'Иван' AND a.middle_name = 'Андреевич' AND a.birth_year = 1991 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Юнусов', 'Кирилл', 'Алексеевич', 2002, 'm', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Филиал СОУС г. Новоалтайск' AND region_id = (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')), 'Белова Н.Ю.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Юнусов' AND a.first_name = 'Кирилл' AND a.middle_name = 'Алексеевич' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Рожин', 'Егор', 'Иннокентьевич', 1987, 'm', (SELECT id FROM regions WHERE name = 'Республика Саха (Якутия)' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Республиканский центр национальных видов спорта' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Саха (Якутия)' AND country = 'RU')), 'Кардашевский Н.С., Оленов В.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Рожин' AND a.first_name = 'Егор' AND a.middle_name = 'Иннокентьевич' AND a.birth_year = 1987 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Курдюков', 'Василий', 'Сергеевич', 1997, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РЦСП Омской области' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Анасенко А.В., Климов А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Курдюков' AND a.first_name = 'Василий' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1997 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Черемушников', 'Максим', 'Викторович', 1998, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'БУ ДО СШОР 33' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Козленко В.Н., Чудаков В.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Черемушников' AND a.first_name = 'Максим' AND a.middle_name = 'Викторович' AND a.birth_year = 1998 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Панов', 'Алексей', 'Анатольевич', 1991, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МКУ ДО "Шегарская СШ", МКУ ФСЦ "Шегарского района"' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'самостоятельно', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Панов' AND a.first_name = 'Алексей' AND a.middle_name = 'Анатольевич' AND a.birth_year = 1991 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Зайдензал', 'Артём', 'Николаевич', 1987, 'm', (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Кемеровская область' AND region_id = (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU')), 'самостоятельно', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Зайдензал' AND a.first_name = 'Артём' AND a.middle_name = 'Николаевич' AND a.birth_year = 1987 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ильин', 'Александр', 'Сергеевич', 2008, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МКУ ДО "Шегарская СШ"' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Панов А.А.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ильин' AND a.first_name = 'Александр' AND a.middle_name = 'Сергеевич' AND a.birth_year = 2008 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Матэус', 'Владислав', 'Дмитриевич', 2001, 'm', (SELECT id FROM regions WHERE name = 'Красноярский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КРСОО "Федерация гиревого спорта"' AND region_id = (SELECT id FROM regions WHERE name = 'Красноярский край' AND country = 'RU')), 'Шмидт Т.А.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Матэус' AND a.first_name = 'Владислав' AND a.middle_name = 'Дмитриевич' AND a.birth_year = 2001 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Перевозчиков', 'Данил', 'Александрович', 2006, 'm', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Филиал СГУПС в городе Новоалтайск' AND region_id = (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')), 'Белова Н.Ю.', (SELECT id FROM sport_ranks WHERE code = 'ii')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Перевозчиков' AND a.first_name = 'Данил' AND a.middle_name = 'Александрович' AND a.birth_year = 2006 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Васильев', 'Андрей', 'Денисович', 2005, 'm', (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ КДЮСШ им. Ал. Бессмертных' AND region_id = (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU')), 'Азметзянов А.Р.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Васильев' AND a.first_name = 'Андрей' AND a.middle_name = 'Денисович' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Черкашин', 'Дмитрий', 'Андреевич', 1999, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ТРОО ФГС' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Тимофеев Н.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Черкашин' AND a.first_name = 'Дмитрий' AND a.middle_name = 'Андреевич' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Лавриков', 'Вячеслав', 'Дмитриевич', 2005, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ТГПУ' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Новиков А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Лавриков' AND a.first_name = 'Вячеслав' AND a.middle_name = 'Дмитриевич' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Литвинов', 'Виталий', 'Александрович', 1993, 'm', (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР "Олимп"' AND region_id = (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU')), 'Решетников М.Е.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Литвинов' AND a.first_name = 'Виталий' AND a.middle_name = 'Александрович' AND a.birth_year = 1993 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Зайцев', 'Александр', 'Алексеевич', 2007, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО ОНОХОЙСКАЯ СШ' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Житихин В.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Зайцев' AND a.first_name = 'Александр' AND a.middle_name = 'Алексеевич' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Новиков', 'Алексей', 'Романович', 2005, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ТРОО ФГС' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Полянский В.С.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Новиков' AND a.first_name = 'Алексей' AND a.middle_name = 'Романович' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Гредин', 'Анатолий', 'Алексеевич', 2008, 'm', (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВЫГС Кемеровская область' AND region_id = (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU')), 'Чернышов В.А.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Гредин' AND a.first_name = 'Анатолий' AND a.middle_name = 'Алексеевич' AND a.birth_year = 2008 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Закревский', 'Илья', 'Витальевич', 2005, 'm', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Филиал СГУПС в городе Новоалтайске' AND region_id = (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')), 'Белова Н.Ю.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Закревский' AND a.first_name = 'Илья' AND a.middle_name = 'Витальевич' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Пехтерев', 'Илья', 'Андреевич', 1987, 'm', (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Кемеровская область' AND region_id = (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU')), 'Опшин В.Г.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Пехтерев' AND a.first_name = 'Илья' AND a.middle_name = 'Андреевич' AND a.birth_year = 1987 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Путинцев', 'Леонид', 'Викторович', 1982, 'm', (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Кемеровская область' AND region_id = (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU')), 'Опшин В.Г.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Путинцев' AND a.first_name = 'Леонид' AND a.middle_name = 'Викторович' AND a.birth_year = 1982 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Черкашин', 'Иван', 'Андреевич', 1999, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ТРОО ФГС' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Тимофеев Н.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Черкашин' AND a.first_name = 'Иван' AND a.middle_name = 'Андреевич' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Пивень', 'Андрей', 'Владимирович', 2003, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Рассадин А.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Пивень' AND a.first_name = 'Андрей' AND a.middle_name = 'Владимирович' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Житихин', 'Владислав', 'Николаевич', 1994, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС РФ' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Рассадин А.А., Леонов С.Т., Балагуров С.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Житихин' AND a.first_name = 'Владислав' AND a.middle_name = 'Николаевич' AND a.birth_year = 1994 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Козлов', 'Дмитрий', 'Михайлович', 2000, 'm', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')), 'Соловьёв С.С.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Козлов' AND a.first_name = 'Дмитрий' AND a.middle_name = 'Михайлович' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Филиппов', 'Роман', 'Юрьевич', 2009, 'm', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ДЮСШ Кулундинского района' AND region_id = (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')), 'Катаев И.Н.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Филиппов' AND a.first_name = 'Роман' AND a.middle_name = 'Юрьевич' AND a.birth_year = 2009 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Семина', 'Елизавета', 'Александровна', 2002, 'f', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ООФГСАК' AND region_id = (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')), 'Алпеев П.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Семина' AND a.first_name = 'Елизавета' AND a.middle_name = 'Александровна' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Недорезов', 'Василий', 'Сергеевич', 1992, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Рассадин А.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Недорезов' AND a.first_name = 'Василий' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1992 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Якушев', 'Роман', 'Владимирович', 2002, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Любимский С.А., Алексеев В.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Якушев' AND a.first_name = 'Роман' AND a.middle_name = 'Владимирович' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Елесов', 'Михаил', 'Егорович', 2007, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Первомайская спортивная школа' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Тимофеев Н.А., Елесов Е.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Елесов' AND a.first_name = 'Михаил' AND a.middle_name = 'Егорович' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Морозович', 'Владислав', 'Павлович', 1999, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'БУ ДО г.Омска «СШОР 33»' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Сагандыков К.К.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Морозович' AND a.first_name = 'Владислав' AND a.middle_name = 'Павлович' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Оленов', 'Владимир', 'Владимирович', 1991, 'm', (SELECT id FROM regions WHERE name = 'Республика Саха (Якутия)' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Республиканский центр национальных видов спорта' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Саха (Якутия)' AND country = 'RU')), 'Дьячковский В.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Оленов' AND a.first_name = 'Владимир' AND a.middle_name = 'Владимирович' AND a.birth_year = 1991 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Никитенко', 'Богдан', 'Юрьевич', 2008, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Спортивная школа 3' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Коломин Д.А., Алексеев В.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Никитенко' AND a.first_name = 'Богдан' AND a.middle_name = 'Юрьевич' AND a.birth_year = 2008 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Каргин', 'Сергей', 'Ярославович', 1998, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ЦСП' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Рассадин А.А., Каргин Я.Л.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Каргин' AND a.first_name = 'Сергей' AND a.middle_name = 'Ярославович' AND a.birth_year = 1998 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Любимский', 'Сергей', 'Александрович', 1992, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Блохин И.А., Трофимов М.А., Леонов С.Т.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Любимский' AND a.first_name = 'Сергей' AND a.middle_name = 'Александрович' AND a.birth_year = 1992 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Филиппов', 'Евгений', 'Борисович', 1995, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО «ВФГС» в Омской области' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Анасенко А.В', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Филиппов' AND a.first_name = 'Евгений' AND a.middle_name = 'Борисович' AND a.birth_year = 1995 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кольмаер', 'Александр', 'Николаевич', 1982, 'm', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Федерация гиревого спорта Алтайского края' AND region_id = (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')), 'Попов А.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кольмаер' AND a.first_name = 'Александр' AND a.middle_name = 'Николаевич' AND a.birth_year = 1982 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Рысник', 'Сергей', 'Михайлович', 1995, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР №33 г. Омск' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Елисеев В.С., Переверзев Н.И.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Рысник' AND a.first_name = 'Сергей' AND a.middle_name = 'Михайлович' AND a.birth_year = 1995 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Полибин', 'Михаил', 'Леонидович', 2004, 'm', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Федерация гиревого спорта Алтайского края' AND region_id = (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')), 'Белова Н.Ю.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Полибин' AND a.first_name = 'Михаил' AND a.middle_name = 'Леонидович' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Минуллин', 'Марсель', 'Ринатович', 2000, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО «ВФГС» в Омской Области' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Елисеев В.С, Гарифуллин Р.Ф., Лавринович Ю.Я.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Минуллин' AND a.first_name = 'Марсель' AND a.middle_name = 'Ринатович' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Шигильдеев', 'Степан', 'Федорович', 2005, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ТРОО ФГС' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Новиков А.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Шигильдеев' AND a.first_name = 'Степан' AND a.middle_name = 'Федорович' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Балабанов', 'Сергей', 'Андреевич', 1996, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Леонов С.Т., Трофимов М.А., Гаденин А.Г.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Балабанов' AND a.first_name = 'Сергей' AND a.middle_name = 'Андреевич' AND a.birth_year = 1996 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Симашкевич', 'Евгений', 'Валентинович', 1991, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО «ВФГС» в Омской области' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Анасенко А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Симашкевич' AND a.first_name = 'Евгений' AND a.middle_name = 'Валентинович' AND a.birth_year = 1991 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Стаханов', 'Валентин', 'Викторович', 1990, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Анасенко А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Стаханов' AND a.first_name = 'Валентин' AND a.middle_name = 'Викторович' AND a.birth_year = 1990 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ткачёв', 'Виталий', 'Александрович', 1981, 'm', (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ "ЦФК и  С"' AND region_id = (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU')), 'Самостоятельно', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ткачёв' AND a.first_name = 'Виталий' AND a.middle_name = 'Александрович' AND a.birth_year = 1981 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Шендо', 'Никита', 'Сергеевич', 1998, 'm', (SELECT id FROM regions WHERE name = 'Красноярский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КРСОО "Федерация гиревого спорта"' AND region_id = (SELECT id FROM regions WHERE name = 'Красноярский край' AND country = 'RU')), 'Самостоятельно', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Шендо' AND a.first_name = 'Никита' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1998 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Береснева', 'Елена', 'Сергеевна', 1996, 'f', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Федерация гиревого спорта Томской области' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Полянский В.С.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Береснева' AND a.first_name = 'Елена' AND a.middle_name = 'Сергеевна' AND a.birth_year = 1996 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Донских', 'Маргарита', 'Александровна', 1989, 'f', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО «ВФГС» в Омской области' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Сагандыков К.К., Донских К.К., Анасенко МС.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Донских' AND a.first_name = 'Маргарита' AND a.middle_name = 'Александровна' AND a.birth_year = 1989 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Чернощук', 'Анастасия', 'Витальевна', 2009, 'f', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ДОО(П)Ц "Юниор"' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Иванов Д.С.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Чернощук' AND a.first_name = 'Анастасия' AND a.middle_name = 'Витальевна' AND a.birth_year = 2009 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Булатова', 'Наталья', 'Павловна', 2011, 'f', (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО ВФГС в Кемеровской области' AND region_id = (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU')), 'Булатов П.В.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Булатова' AND a.first_name = 'Наталья' AND a.middle_name = 'Павловна' AND a.birth_year = 2011 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Политова', 'София', 'Владимировна', 2010, 'f', (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU')), 'Чернышов В.А., Дедюхина К.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Политова' AND a.first_name = 'София' AND a.middle_name = 'Владимировна' AND a.birth_year = 2010 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Воронцова', 'Мария', 'Вячеславовна', 1990, 'f', (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU')), 'Чернышов В.А.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Воронцова' AND a.first_name = 'Мария' AND a.middle_name = 'Вячеславовна' AND a.birth_year = 1990 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Шмидт', 'Татьяна', 'Александровна', 1988, 'f', (SELECT id FROM regions WHERE name = 'Красноярский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КРСОО "Федерация гиревого спорта"' AND region_id = (SELECT id FROM regions WHERE name = 'Красноярский край' AND country = 'RU')), 'Блынду А.С., Шмидт С.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Шмидт' AND a.first_name = 'Татьяна' AND a.middle_name = 'Александровна' AND a.birth_year = 1988 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Лапшина', 'Наталья', 'Владимировна', 2003, 'f', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ООФГСАК' AND region_id = (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')), 'Алпеев П.Н., Пожидаев В.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Лапшина' AND a.first_name = 'Наталья' AND a.middle_name = 'Владимировна' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кравцова', 'Елизавета', 'Максимовна', 2009, 'f', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО "Спортивная школа "Победа" Города Томска"' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Чепуштанов И.В.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кравцова' AND a.first_name = 'Елизавета' AND a.middle_name = 'Максимовна' AND a.birth_year = 2009 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Зыбайло', 'Анастасия', 'Александровна', 2000, 'f', (SELECT id FROM regions WHERE name = 'Красноярский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КРСОО "Федерация гиревого спорта"' AND region_id = (SELECT id FROM regions WHERE name = 'Красноярский край' AND country = 'RU')), 'Зыбайло А.С.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Зыбайло' AND a.first_name = 'Анастасия' AND a.middle_name = 'Александровна' AND a.birth_year = 2000 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Вертинская', 'Анна', 'Алексеевна', 2009, 'f', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Спортшкола "Олимп"' AND region_id = (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')), 'Пожидаев В.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Вертинская' AND a.first_name = 'Анна' AND a.middle_name = 'Алексеевна' AND a.birth_year = 2009 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Булатова', 'Оксана', 'Сергеевна', 1980, 'f', (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО ВФГС в Кемеровской области' AND region_id = (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU')), 'Булатов П.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Булатова' AND a.first_name = 'Оксана' AND a.middle_name = 'Сергеевна' AND a.birth_year = 1980 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Гредина', 'Юлия', 'Евгеньевна', 1983, 'f', (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВФГС Кемеровской области' AND region_id = (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU')), 'Чернышов В.А.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Гредина' AND a.first_name = 'Юлия' AND a.middle_name = 'Евгеньевна' AND a.birth_year = 1983 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Демьянченко', 'Анжелика', 'Сергеевна', 1999, 'f', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО ДООФСЦ Оконешниково' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Демьянченко С.А.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Демьянченко' AND a.first_name = 'Анжелика' AND a.middle_name = 'Сергеевна' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Карачева', 'Татьяна', 'Сергеевна', 2008, 'f', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ТРОО ФГС' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'БажинА.М.', NULL
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Карачева' AND a.first_name = 'Татьяна' AND a.middle_name = 'Сергеевна' AND a.birth_year = 2008 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Башарова', 'Виктория', 'Васильевна', 1993, 'f', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Роооо ВФГС в РБ' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Барбакова Н.А., Рассадин А.А., Каргин С.Я', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Башарова' AND a.first_name = 'Виктория' AND a.middle_name = 'Васильевна' AND a.birth_year = 1993 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Иванова', 'Нина', 'Владимировна', 1988, 'f', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Сборная Республики Бурятия' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Рассадин А.А., Анасенко А.В., Руднев Р.С.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Иванова' AND a.first_name = 'Нина' AND a.middle_name = 'Владимировна' AND a.birth_year = 1988 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ельчанинова', 'Вероника', 'Сергеевна', 2003, 'f', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'БУ ДО г.Омска «СШОР 33»' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Сагандыков К.К.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ельчанинова' AND a.first_name = 'Вероника' AND a.middle_name = 'Сергеевна' AND a.birth_year = 2003 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Покатилова', 'Алиса', 'Константиновна', 1991, 'f', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ТРОО ФГС' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Елесов Е.Н., Полянский .Е.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Покатилова' AND a.first_name = 'Алиса' AND a.middle_name = 'Константиновна' AND a.birth_year = 1991 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Андросова', 'Марина', 'Евгеньевна', 2007, 'f', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Федерация гиревого спорта Алтайского края' AND region_id = (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')), 'Белова Н.Ю.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Андросова' AND a.first_name = 'Марина' AND a.middle_name = 'Евгеньевна' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ильясов', 'Какен', 'Канатович', 1993, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР 33 г Омск' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Анасенко А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ильясов' AND a.first_name = 'Какен' AND a.middle_name = 'Канатович' AND a.birth_year = 1993 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Абросов', 'Алексей', 'Владимирович', 1991, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Динамо' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Дягилев А.В.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Абросов' AND a.first_name = 'Алексей' AND a.middle_name = 'Владимирович' AND a.birth_year = 1991 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Крылов', 'Матвей', 'Сергеевич', 2006, 'm', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Федерация гиревого спорта Алтайского края' AND region_id = (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')), 'Белова Н.Ю.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Крылов' AND a.first_name = 'Матвей' AND a.middle_name = 'Сергеевич' AND a.birth_year = 2006 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Цыбаев', 'Илья', 'Алексеевич', 1999, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Центр Поиск' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Дягилев А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Цыбаев' AND a.first_name = 'Илья' AND a.middle_name = 'Алексеевич' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Чернышов', 'Владимир', 'Александрович', 1986, 'm', (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU')), 'Рябченко А.В.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Чернышов' AND a.first_name = 'Владимир' AND a.middle_name = 'Александрович' AND a.birth_year = 1986 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Демьянченко', 'Даниил', 'Сергеевич', 2006, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Центр спорта и здоровья Омского ГАУ' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Анасенко А.В.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Демьянченко' AND a.first_name = 'Даниил' AND a.middle_name = 'Сергеевич' AND a.birth_year = 2006 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Соловьев', 'Александр', 'Сергеевич', 1982, 'm', (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Федерация гиревого спорта г. Новокузнецка' AND region_id = (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU')), 'Тюленев Д.Т.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Соловьев' AND a.first_name = 'Александр' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1982 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Климанов', 'Алексей', 'Михайлович', 1991, 'm', (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU')), 'Решетников М.Е.', (SELECT id FROM sport_ranks WHERE code = 'ii')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Климанов' AND a.first_name = 'Алексей' AND a.middle_name = 'Михайлович' AND a.birth_year = 1991 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Некрасов', 'Глеб', 'Александрович', 2007, 'm', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Гиревой спортклуб  Династия' AND region_id = (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')), 'Белова Н.Ю.', (SELECT id FROM sport_ranks WHERE code = 'ii')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Некрасов' AND a.first_name = 'Глеб' AND a.middle_name = 'Александрович' AND a.birth_year = 2007 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Иванов', 'Евгений', 'Игоревич', 1987, 'm', (SELECT id FROM regions WHERE name = 'Забайкальский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Вс рф' AND region_id = (SELECT id FROM regions WHERE name = 'Забайкальский край' AND country = 'RU')), 'руднев сергей леонидович', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Иванов' AND a.first_name = 'Евгений' AND a.middle_name = 'Игоревич' AND a.birth_year = 1987 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Шерин', 'Роман', 'Витальевич', 1992, 'm', (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Кемеровская область' AND region_id = (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU')), 'Опшин В.Г.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Шерин' AND a.first_name = 'Роман' AND a.middle_name = 'Витальевич' AND a.birth_year = 1992 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Голубятников', 'Виталий', 'Сергеевич', 1996, 'm', (SELECT id FROM regions WHERE name = 'Иркутская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МО РФ' AND region_id = (SELECT id FROM regions WHERE name = 'Иркутская область' AND country = 'RU')), 'самостоятельно', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Голубятников' AND a.first_name = 'Виталий' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1996 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Тюленев', 'Дмитрий', 'Тимофеевич', 1985, 'm', (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ОО Федерация гиревого спорта г.Новокузнецк' AND region_id = (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU')), 'Руднев С.Л.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Тюленев' AND a.first_name = 'Дмитрий' AND a.middle_name = 'Тимофеевич' AND a.birth_year = 1985 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ковалев', 'Константин', 'Александрович', 2001, 'm', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Спортивный клуб "АГАУ"' AND region_id = (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')), 'Дергунов В.Г.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ковалев' AND a.first_name = 'Константин' AND a.middle_name = 'Александрович' AND a.birth_year = 2001 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Дураченко', 'Игорь', 'Васильевич', 1993, 'm', (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU')), 'Елисеев В.С.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Дураченко' AND a.first_name = 'Игорь' AND a.middle_name = 'Васильевич' AND a.birth_year = 1993 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Снопов', 'Владимир', 'Сергеевич', 1995, 'm', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')), 'Соловьев С.С.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Снопов' AND a.first_name = 'Владимир' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1995 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Рыков', 'Михаил', 'Александрович', 1996, 'm', (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Федерация гиревого спорта Новокузнецка' AND region_id = (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU')), 'Тюленев Д.Т.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Рыков' AND a.first_name = 'Михаил' AND a.middle_name = 'Александрович' AND a.birth_year = 1996 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Загороднев', 'Максим', 'Олегович', 1992, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Динамо' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Дягилев А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Загороднев' AND a.first_name = 'Максим' AND a.middle_name = 'Олегович' AND a.birth_year = 1992 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Цыбигей', 'Виталий', 'Геннадьевич', 1996, 'm', (SELECT id FROM regions WHERE name = 'Красноярский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КРСОО "Федерация гиревого спорта"' AND region_id = (SELECT id FROM regions WHERE name = 'Красноярский край' AND country = 'RU')), 'Руденко Д.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Цыбигей' AND a.first_name = 'Виталий' AND a.middle_name = 'Геннадьевич' AND a.birth_year = 1996 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Фатеев', 'Дмитрий', 'Алексеевич', 2005, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ТГПУ' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Новиков А.В., Комаров А.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Фатеев' AND a.first_name = 'Дмитрий' AND a.middle_name = 'Алексеевич' AND a.birth_year = 2005 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Стремедловский', 'Виталий', 'Владимирович', 1991, 'm', (SELECT id FROM regions WHERE name = 'Красноярский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КРСОО "Федерация гиревого спорта"' AND region_id = (SELECT id FROM regions WHERE name = 'Красноярский край' AND country = 'RU')), 'Байкалов Л.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Стремедловский' AND a.first_name = 'Виталий' AND a.middle_name = 'Владимирович' AND a.birth_year = 1991 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Лугинов', 'Руслан', 'Русланович', 1997, 'm', (SELECT id FROM regions WHERE name = 'Республика Саха (Якутия)' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Республиканский центр Национальных видов спорта' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Саха (Якутия)' AND country = 'RU')), 'Дьячковский В.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Лугинов' AND a.first_name = 'Руслан' AND a.middle_name = 'Русланович' AND a.birth_year = 1997 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Шабунин', 'Никита', 'Андреевич', 2001, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Газпром добыча Ноябрьск' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Елесов Е.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Шабунин' AND a.first_name = 'Никита' AND a.middle_name = 'Андреевич' AND a.birth_year = 2001 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Климов', 'Петр', 'Петрович', 2001, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ТРОО ФГС' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Чепуштанов И.В., Дмитриев С.Г.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Климов' AND a.first_name = 'Петр' AND a.middle_name = 'Петрович' AND a.birth_year = 2001 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Лесных', 'Павел', 'Алексеевич', 1977, 'm', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ООФГСАК' AND region_id = (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')), 'Соловьёв С.С.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Лесных' AND a.first_name = 'Павел' AND a.middle_name = 'Алексеевич' AND a.birth_year = 1977 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Афанасьев', 'Леонид', 'Александрович', 1980, 'm', (SELECT id FROM regions WHERE name = 'Республика Саха (Якутия)' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Республиканский центр национальных видов спорта' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Саха (Якутия)' AND country = 'RU')), 'Тимофеев Н.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Афанасьев' AND a.first_name = 'Леонид' AND a.middle_name = 'Александрович' AND a.birth_year = 1980 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Жибинов', 'Кирилл', 'Васильевич', 1991, 'm', (SELECT id FROM regions WHERE name = 'Республика Хакасия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО "Спортивная школа города Черногорска"' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Хакасия' AND country = 'RU')), 'Жибинов В.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Жибинов' AND a.first_name = 'Кирилл' AND a.middle_name = 'Васильевич' AND a.birth_year = 1991 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Плохотин', 'Павел', 'Александрович', 1999, 'm', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ООФГСАК' AND region_id = (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')), 'Плохотин А.И.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Плохотин' AND a.first_name = 'Павел' AND a.middle_name = 'Александрович' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Пантюхов', 'Владимир', 'Александрович', 1987, 'm', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')), 'Соловьёв С.С.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Пантюхов' AND a.first_name = 'Владимир' AND a.middle_name = 'Александрович' AND a.birth_year = 1987 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Яворский', 'Виктор', 'Викторович', 1999, 'm', (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Спорт школа' AND region_id = (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU')), 'Яворский В.Ф.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Яворский' AND a.first_name = 'Виктор' AND a.middle_name = 'Викторович' AND a.birth_year = 1999 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Купш', 'Денис', 'Аркадьевич', 2004, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'БУ ДО г. Омска «СШОР N33»' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Анасенко А.В., Козлов А.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Купш' AND a.first_name = 'Денис' AND a.middle_name = 'Аркадьевич' AND a.birth_year = 2004 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кудашев', 'Денис', 'Андреевич', 1988, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Онохойская Детская Юношеская спортивная школа' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Леонов С.Т.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кудашев' AND a.first_name = 'Денис' AND a.middle_name = 'Андреевич' AND a.birth_year = 1988 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Чупин', 'Никита', 'Владимирович', 1988, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Динамо' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Дягилев А.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Чупин' AND a.first_name = 'Никита' AND a.middle_name = 'Владимирович' AND a.birth_year = 1988 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Булатов', 'Павел', 'Владимирович', 1983, 'm', (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО ВФГС в Кемеровской области' AND region_id = (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU')), 'Опшин В.Г.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Булатов' AND a.first_name = 'Павел' AND a.middle_name = 'Владимирович' AND a.birth_year = 1983 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Барлетов', 'Евгений', 'Юрьевич', 1992, 'm', (SELECT id FROM regions WHERE name = 'Иркутская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ОАО РЖД ШЧ-2' AND region_id = (SELECT id FROM regions WHERE name = 'Иркутская область' AND country = 'RU')), 'Солонин А.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Барлетов' AND a.first_name = 'Евгений' AND a.middle_name = 'Юрьевич' AND a.birth_year = 1992 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Митичкин', 'Александр', 'Сергеевич', 1987, 'm', (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU')), 'Решетников М.Е., Литвиненко М.С.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Митичкин' AND a.first_name = 'Александр' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1987 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бояновский', 'Игорь', 'Евгеньевич', 1987, 'm', (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Спортклуб «Ермак»' AND region_id = (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU')), 'Булатов П.В.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бояновский' AND a.first_name = 'Игорь' AND a.middle_name = 'Евгеньевич' AND a.birth_year = 1987 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Уманец', 'Роман', 'Николаевич', 1987, 'm', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СК "Сибиряк"' AND region_id = (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')), 'Соловьев С.С.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Уманец' AND a.first_name = 'Роман' AND a.middle_name = 'Николаевич' AND a.birth_year = 1987 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Буриков', 'Роман', 'Александрович', 2002, 'm', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Сибиряк' AND region_id = (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')), 'Соловьев С.С.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Буриков' AND a.first_name = 'Роман' AND a.middle_name = 'Александрович' AND a.birth_year = 2002 LIMIT 1);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Рогонов', 'Павел', 'Владимирович', 1969, 'm', (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВФГС в городе Кемерово' AND region_id = (SELECT id FROM regions WHERE name = 'Кемеровская область - Кузбасс' AND country = 'RU')), 'самостоятельно', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Рогонов' AND a.first_name = 'Павел' AND a.middle_name = 'Владимирович' AND a.birth_year = 1969 LIMIT 1);

INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'medenceva-darya-2004' AND s.athlete_id <> a.id)
              THEN 'medenceva-darya-2004-' || a.id ELSE 'medenceva-darya-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Меденцева' AND first_name = 'Дарья' AND middle_name = 'Александровна' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'nynych-margarita-1996' AND s.athlete_id <> a.id)
              THEN 'nynych-margarita-1996-' || a.id ELSE 'nynych-margarita-1996' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ныныч' AND first_name = 'Маргарита' AND middle_name = 'Анатольевна' AND birth_year = 1996 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ryndina-vladislava-2009' AND s.athlete_id <> a.id)
              THEN 'ryndina-vladislava-2009-' || a.id ELSE 'ryndina-vladislava-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Рындина' AND first_name = 'Владислава' AND middle_name = 'Романовна' AND birth_year = 2009 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'grigoreva-emiliya-2006' AND s.athlete_id <> a.id)
              THEN 'grigoreva-emiliya-2006-' || a.id ELSE 'grigoreva-emiliya-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Григорьева' AND first_name = 'Эмилия' AND middle_name = 'Сергеевна' AND birth_year = 2006 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'bolotova-elizaveta-2007' AND s.athlete_id <> a.id)
              THEN 'bolotova-elizaveta-2007-' || a.id ELSE 'bolotova-elizaveta-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Болотова' AND first_name = 'Елизавета' AND middle_name = 'Сергеевна' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'vorobeva-nadezhda-2000' AND s.athlete_id <> a.id)
              THEN 'vorobeva-nadezhda-2000-' || a.id ELSE 'vorobeva-nadezhda-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Воробьёва' AND first_name = 'Надежда' AND middle_name = 'Андреевна' AND birth_year = 2000 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'vyatkina-vera-1999' AND s.athlete_id <> a.id)
              THEN 'vyatkina-vera-1999-' || a.id ELSE 'vyatkina-vera-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Вяткина' AND first_name = 'Вера' AND middle_name = 'Павловна' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'vrubel-darya-2000' AND s.athlete_id <> a.id)
              THEN 'vrubel-darya-2000-' || a.id ELSE 'vrubel-darya-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Врубель' AND first_name = 'Дарья' AND middle_name = 'Васильевна' AND birth_year = 2000 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'markova-anna-2009' AND s.athlete_id <> a.id)
              THEN 'markova-anna-2009-' || a.id ELSE 'markova-anna-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Маркова' AND first_name = 'Анна' AND middle_name = 'Александровна' AND birth_year = 2009 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ermolina-irina-2008' AND s.athlete_id <> a.id)
              THEN 'ermolina-irina-2008-' || a.id ELSE 'ermolina-irina-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ермолина' AND first_name = 'Ирина' AND middle_name = 'Евгеньевна' AND birth_year = 2008 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'popova-olga-2002' AND s.athlete_id <> a.id)
              THEN 'popova-olga-2002-' || a.id ELSE 'popova-olga-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Попова' AND first_name = 'Ольга' AND middle_name = 'Сергеевна' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kuznecov-roman-2009' AND s.athlete_id <> a.id)
              THEN 'kuznecov-roman-2009-' || a.id ELSE 'kuznecov-roman-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кузнецов' AND first_name = 'Роман' AND middle_name = 'Андреевич' AND birth_year = 2009 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kashkarov-artur-2005' AND s.athlete_id <> a.id)
              THEN 'kashkarov-artur-2005-' || a.id ELSE 'kashkarov-artur-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кашкаров' AND first_name = 'Артур' AND middle_name = 'Анатольевич' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'filipev-vladislav-2005' AND s.athlete_id <> a.id)
              THEN 'filipev-vladislav-2005-' || a.id ELSE 'filipev-vladislav-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Филипьев' AND first_name = 'Владислав' AND middle_name = 'Валерьевич' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'fris-german-2008' AND s.athlete_id <> a.id)
              THEN 'fris-german-2008-' || a.id ELSE 'fris-german-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Фрис' AND first_name = 'Герман' AND middle_name = 'Эдуардович' AND birth_year = 2008 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'maslennikov-maksim-2003' AND s.athlete_id <> a.id)
              THEN 'maslennikov-maksim-2003-' || a.id ELSE 'maslennikov-maksim-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Масленников' AND first_name = 'Максим' AND middle_name = 'Алексеевич' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'vasilevich-dobrynya-2000' AND s.athlete_id <> a.id)
              THEN 'vasilevich-dobrynya-2000-' || a.id ELSE 'vasilevich-dobrynya-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Василевич' AND first_name = 'Добрыня' AND middle_name = 'Андреевич' AND birth_year = 2000 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kolomin-dmitriy-1999' AND s.athlete_id <> a.id)
              THEN 'kolomin-dmitriy-1999-' || a.id ELSE 'kolomin-dmitriy-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Коломин' AND first_name = 'Дмитрий' AND middle_name = 'Андреевич' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'rybskiy-pavel-2008' AND s.athlete_id <> a.id)
              THEN 'rybskiy-pavel-2008-' || a.id ELSE 'rybskiy-pavel-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Рыбский' AND first_name = 'Павел' AND middle_name = 'Сергеевич' AND birth_year = 2008 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'anikusko-semen-2009' AND s.athlete_id <> a.id)
              THEN 'anikusko-semen-2009-' || a.id ELSE 'anikusko-semen-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Аникусько' AND first_name = 'Семён' AND middle_name = 'Сергеевич' AND birth_year = 2009 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'starcev-vadim-2007' AND s.athlete_id <> a.id)
              THEN 'starcev-vadim-2007-' || a.id ELSE 'starcev-vadim-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Старцев' AND first_name = 'Вадим' AND middle_name = 'Андреевич' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'rassadin-andrey-1989' AND s.athlete_id <> a.id)
              THEN 'rassadin-andrey-1989-' || a.id ELSE 'rassadin-andrey-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Рассадин' AND first_name = 'Андрей' AND middle_name = 'Андреевич' AND birth_year = 1989 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zhibinov-fedor-2004' AND s.athlete_id <> a.id)
              THEN 'zhibinov-fedor-2004-' || a.id ELSE 'zhibinov-fedor-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Жибинов' AND first_name = 'Фёдор' AND middle_name = 'Васильевич' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'voldaev-aleksandr-2000' AND s.athlete_id <> a.id)
              THEN 'voldaev-aleksandr-2000-' || a.id ELSE 'voldaev-aleksandr-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Волдаев' AND first_name = 'Александр' AND middle_name = 'Владимирович' AND birth_year = 2000 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'grigorchuk-sergey-2002' AND s.athlete_id <> a.id)
              THEN 'grigorchuk-sergey-2002-' || a.id ELSE 'grigorchuk-sergey-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Григорчук' AND first_name = 'Сергей' AND middle_name = 'Сергеевич' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'vitruk-lev-2008' AND s.athlete_id <> a.id)
              THEN 'vitruk-lev-2008-' || a.id ELSE 'vitruk-lev-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Витрук' AND first_name = 'Лев' AND middle_name = 'Борисович' AND birth_year = 2008 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sedyh-ilya-2004' AND s.athlete_id <> a.id)
              THEN 'sedyh-ilya-2004-' || a.id ELSE 'sedyh-ilya-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Седых' AND first_name = 'Илья' AND middle_name = 'Александрович' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lyubin-valentin-2009' AND s.athlete_id <> a.id)
              THEN 'lyubin-valentin-2009-' || a.id ELSE 'lyubin-valentin-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Любин' AND first_name = 'Валентин' AND middle_name = 'Сергеевич' AND birth_year = 2009 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'voronov-ivan-1991' AND s.athlete_id <> a.id)
              THEN 'voronov-ivan-1991-' || a.id ELSE 'voronov-ivan-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Воронов' AND first_name = 'Иван' AND middle_name = 'Андреевич' AND birth_year = 1991 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'yunusov-kirill-2002' AND s.athlete_id <> a.id)
              THEN 'yunusov-kirill-2002-' || a.id ELSE 'yunusov-kirill-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Юнусов' AND first_name = 'Кирилл' AND middle_name = 'Алексеевич' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'rozhin-egor-1987' AND s.athlete_id <> a.id)
              THEN 'rozhin-egor-1987-' || a.id ELSE 'rozhin-egor-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Рожин' AND first_name = 'Егор' AND middle_name = 'Иннокентьевич' AND birth_year = 1987 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kurdyukov-vasiliy-1997' AND s.athlete_id <> a.id)
              THEN 'kurdyukov-vasiliy-1997-' || a.id ELSE 'kurdyukov-vasiliy-1997' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Курдюков' AND first_name = 'Василий' AND middle_name = 'Сергеевич' AND birth_year = 1997 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'cheremushnikov-maksim-1998' AND s.athlete_id <> a.id)
              THEN 'cheremushnikov-maksim-1998-' || a.id ELSE 'cheremushnikov-maksim-1998' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Черемушников' AND first_name = 'Максим' AND middle_name = 'Викторович' AND birth_year = 1998 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'panov-aleksey-1991' AND s.athlete_id <> a.id)
              THEN 'panov-aleksey-1991-' || a.id ELSE 'panov-aleksey-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Панов' AND first_name = 'Алексей' AND middle_name = 'Анатольевич' AND birth_year = 1991 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zaydenzal-artem-1987' AND s.athlete_id <> a.id)
              THEN 'zaydenzal-artem-1987-' || a.id ELSE 'zaydenzal-artem-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Зайдензал' AND first_name = 'Артём' AND middle_name = 'Николаевич' AND birth_year = 1987 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ilin-aleksandr-2008' AND s.athlete_id <> a.id)
              THEN 'ilin-aleksandr-2008-' || a.id ELSE 'ilin-aleksandr-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ильин' AND first_name = 'Александр' AND middle_name = 'Сергеевич' AND birth_year = 2008 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'mateus-vladislav-2001' AND s.athlete_id <> a.id)
              THEN 'mateus-vladislav-2001-' || a.id ELSE 'mateus-vladislav-2001' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Матэус' AND first_name = 'Владислав' AND middle_name = 'Дмитриевич' AND birth_year = 2001 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'perevozchikov-danil-2006' AND s.athlete_id <> a.id)
              THEN 'perevozchikov-danil-2006-' || a.id ELSE 'perevozchikov-danil-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Перевозчиков' AND first_name = 'Данил' AND middle_name = 'Александрович' AND birth_year = 2006 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'vasilev-andrey-2005' AND s.athlete_id <> a.id)
              THEN 'vasilev-andrey-2005-' || a.id ELSE 'vasilev-andrey-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Васильев' AND first_name = 'Андрей' AND middle_name = 'Денисович' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'cherkashin-dmitriy-1999' AND s.athlete_id <> a.id)
              THEN 'cherkashin-dmitriy-1999-' || a.id ELSE 'cherkashin-dmitriy-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Черкашин' AND first_name = 'Дмитрий' AND middle_name = 'Андреевич' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lavrikov-vyacheslav-2005' AND s.athlete_id <> a.id)
              THEN 'lavrikov-vyacheslav-2005-' || a.id ELSE 'lavrikov-vyacheslav-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Лавриков' AND first_name = 'Вячеслав' AND middle_name = 'Дмитриевич' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'litvinov-vitaliy-1993' AND s.athlete_id <> a.id)
              THEN 'litvinov-vitaliy-1993-' || a.id ELSE 'litvinov-vitaliy-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Литвинов' AND first_name = 'Виталий' AND middle_name = 'Александрович' AND birth_year = 1993 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zaycev-aleksandr-2007' AND s.athlete_id <> a.id)
              THEN 'zaycev-aleksandr-2007-' || a.id ELSE 'zaycev-aleksandr-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Зайцев' AND first_name = 'Александр' AND middle_name = 'Алексеевич' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'novikov-aleksey-2005' AND s.athlete_id <> a.id)
              THEN 'novikov-aleksey-2005-' || a.id ELSE 'novikov-aleksey-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Новиков' AND first_name = 'Алексей' AND middle_name = 'Романович' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'gredin-anatoliy-2008' AND s.athlete_id <> a.id)
              THEN 'gredin-anatoliy-2008-' || a.id ELSE 'gredin-anatoliy-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Гредин' AND first_name = 'Анатолий' AND middle_name = 'Алексеевич' AND birth_year = 2008 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zakrevskiy-ilya-2005' AND s.athlete_id <> a.id)
              THEN 'zakrevskiy-ilya-2005-' || a.id ELSE 'zakrevskiy-ilya-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Закревский' AND first_name = 'Илья' AND middle_name = 'Витальевич' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'pehterev-ilya-1987' AND s.athlete_id <> a.id)
              THEN 'pehterev-ilya-1987-' || a.id ELSE 'pehterev-ilya-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Пехтерев' AND first_name = 'Илья' AND middle_name = 'Андреевич' AND birth_year = 1987 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'putincev-leonid-1982' AND s.athlete_id <> a.id)
              THEN 'putincev-leonid-1982-' || a.id ELSE 'putincev-leonid-1982' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Путинцев' AND first_name = 'Леонид' AND middle_name = 'Викторович' AND birth_year = 1982 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'cherkashin-ivan-1999' AND s.athlete_id <> a.id)
              THEN 'cherkashin-ivan-1999-' || a.id ELSE 'cherkashin-ivan-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Черкашин' AND first_name = 'Иван' AND middle_name = 'Андреевич' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'piven-andrey-2003' AND s.athlete_id <> a.id)
              THEN 'piven-andrey-2003-' || a.id ELSE 'piven-andrey-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Пивень' AND first_name = 'Андрей' AND middle_name = 'Владимирович' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zhitihin-vladislav-1994' AND s.athlete_id <> a.id)
              THEN 'zhitihin-vladislav-1994-' || a.id ELSE 'zhitihin-vladislav-1994' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Житихин' AND first_name = 'Владислав' AND middle_name = 'Николаевич' AND birth_year = 1994 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kozlov-dmitriy-2000' AND s.athlete_id <> a.id)
              THEN 'kozlov-dmitriy-2000-' || a.id ELSE 'kozlov-dmitriy-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Козлов' AND first_name = 'Дмитрий' AND middle_name = 'Михайлович' AND birth_year = 2000 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'filippov-roman-2009' AND s.athlete_id <> a.id)
              THEN 'filippov-roman-2009-' || a.id ELSE 'filippov-roman-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Филиппов' AND first_name = 'Роман' AND middle_name = 'Юрьевич' AND birth_year = 2009 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'semina-elizaveta-2002' AND s.athlete_id <> a.id)
              THEN 'semina-elizaveta-2002-' || a.id ELSE 'semina-elizaveta-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Семина' AND first_name = 'Елизавета' AND middle_name = 'Александровна' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'nedorezov-vasiliy-1992' AND s.athlete_id <> a.id)
              THEN 'nedorezov-vasiliy-1992-' || a.id ELSE 'nedorezov-vasiliy-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Недорезов' AND first_name = 'Василий' AND middle_name = 'Сергеевич' AND birth_year = 1992 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'yakushev-roman-2002' AND s.athlete_id <> a.id)
              THEN 'yakushev-roman-2002-' || a.id ELSE 'yakushev-roman-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Якушев' AND first_name = 'Роман' AND middle_name = 'Владимирович' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'elesov-mihail-2007' AND s.athlete_id <> a.id)
              THEN 'elesov-mihail-2007-' || a.id ELSE 'elesov-mihail-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Елесов' AND first_name = 'Михаил' AND middle_name = 'Егорович' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'morozovich-vladislav-1999' AND s.athlete_id <> a.id)
              THEN 'morozovich-vladislav-1999-' || a.id ELSE 'morozovich-vladislav-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Морозович' AND first_name = 'Владислав' AND middle_name = 'Павлович' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'olenov-vladimir-1991' AND s.athlete_id <> a.id)
              THEN 'olenov-vladimir-1991-' || a.id ELSE 'olenov-vladimir-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Оленов' AND first_name = 'Владимир' AND middle_name = 'Владимирович' AND birth_year = 1991 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'nikitenko-bogdan-2008' AND s.athlete_id <> a.id)
              THEN 'nikitenko-bogdan-2008-' || a.id ELSE 'nikitenko-bogdan-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Никитенко' AND first_name = 'Богдан' AND middle_name = 'Юрьевич' AND birth_year = 2008 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kargin-sergey-1998' AND s.athlete_id <> a.id)
              THEN 'kargin-sergey-1998-' || a.id ELSE 'kargin-sergey-1998' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Каргин' AND first_name = 'Сергей' AND middle_name = 'Ярославович' AND birth_year = 1998 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lyubimskiy-sergey-1992' AND s.athlete_id <> a.id)
              THEN 'lyubimskiy-sergey-1992-' || a.id ELSE 'lyubimskiy-sergey-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Любимский' AND first_name = 'Сергей' AND middle_name = 'Александрович' AND birth_year = 1992 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'filippov-evgeniy-1995' AND s.athlete_id <> a.id)
              THEN 'filippov-evgeniy-1995-' || a.id ELSE 'filippov-evgeniy-1995' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Филиппов' AND first_name = 'Евгений' AND middle_name = 'Борисович' AND birth_year = 1995 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kolmaer-aleksandr-1982' AND s.athlete_id <> a.id)
              THEN 'kolmaer-aleksandr-1982-' || a.id ELSE 'kolmaer-aleksandr-1982' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кольмаер' AND first_name = 'Александр' AND middle_name = 'Николаевич' AND birth_year = 1982 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'rysnik-sergey-1995' AND s.athlete_id <> a.id)
              THEN 'rysnik-sergey-1995-' || a.id ELSE 'rysnik-sergey-1995' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Рысник' AND first_name = 'Сергей' AND middle_name = 'Михайлович' AND birth_year = 1995 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'polibin-mihail-2004' AND s.athlete_id <> a.id)
              THEN 'polibin-mihail-2004-' || a.id ELSE 'polibin-mihail-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Полибин' AND first_name = 'Михаил' AND middle_name = 'Леонидович' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'minullin-marsel-2000' AND s.athlete_id <> a.id)
              THEN 'minullin-marsel-2000-' || a.id ELSE 'minullin-marsel-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Минуллин' AND first_name = 'Марсель' AND middle_name = 'Ринатович' AND birth_year = 2000 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'shigildeev-stepan-2005' AND s.athlete_id <> a.id)
              THEN 'shigildeev-stepan-2005-' || a.id ELSE 'shigildeev-stepan-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Шигильдеев' AND first_name = 'Степан' AND middle_name = 'Федорович' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'balabanov-sergey-1996' AND s.athlete_id <> a.id)
              THEN 'balabanov-sergey-1996-' || a.id ELSE 'balabanov-sergey-1996' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Балабанов' AND first_name = 'Сергей' AND middle_name = 'Андреевич' AND birth_year = 1996 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'simashkevich-evgeniy-1991' AND s.athlete_id <> a.id)
              THEN 'simashkevich-evgeniy-1991-' || a.id ELSE 'simashkevich-evgeniy-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Симашкевич' AND first_name = 'Евгений' AND middle_name = 'Валентинович' AND birth_year = 1991 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'stahanov-valentin-1990' AND s.athlete_id <> a.id)
              THEN 'stahanov-valentin-1990-' || a.id ELSE 'stahanov-valentin-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Стаханов' AND first_name = 'Валентин' AND middle_name = 'Викторович' AND birth_year = 1990 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'tkachev-vitaliy-1981' AND s.athlete_id <> a.id)
              THEN 'tkachev-vitaliy-1981-' || a.id ELSE 'tkachev-vitaliy-1981' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ткачёв' AND first_name = 'Виталий' AND middle_name = 'Александрович' AND birth_year = 1981 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'shendo-nikita-1998' AND s.athlete_id <> a.id)
              THEN 'shendo-nikita-1998-' || a.id ELSE 'shendo-nikita-1998' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Шендо' AND first_name = 'Никита' AND middle_name = 'Сергеевич' AND birth_year = 1998 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'beresneva-elena-1996' AND s.athlete_id <> a.id)
              THEN 'beresneva-elena-1996-' || a.id ELSE 'beresneva-elena-1996' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Береснева' AND first_name = 'Елена' AND middle_name = 'Сергеевна' AND birth_year = 1996 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'donskih-margarita-1989' AND s.athlete_id <> a.id)
              THEN 'donskih-margarita-1989-' || a.id ELSE 'donskih-margarita-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Донских' AND first_name = 'Маргарита' AND middle_name = 'Александровна' AND birth_year = 1989 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'chernoschuk-anastasiya-2009' AND s.athlete_id <> a.id)
              THEN 'chernoschuk-anastasiya-2009-' || a.id ELSE 'chernoschuk-anastasiya-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Чернощук' AND first_name = 'Анастасия' AND middle_name = 'Витальевна' AND birth_year = 2009 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'bulatova-natalya-2011' AND s.athlete_id <> a.id)
              THEN 'bulatova-natalya-2011-' || a.id ELSE 'bulatova-natalya-2011' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Булатова' AND first_name = 'Наталья' AND middle_name = 'Павловна' AND birth_year = 2011 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'politova-sofiya-2010' AND s.athlete_id <> a.id)
              THEN 'politova-sofiya-2010-' || a.id ELSE 'politova-sofiya-2010' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Политова' AND first_name = 'София' AND middle_name = 'Владимировна' AND birth_year = 2010 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'voroncova-mariya-1990' AND s.athlete_id <> a.id)
              THEN 'voroncova-mariya-1990-' || a.id ELSE 'voroncova-mariya-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Воронцова' AND first_name = 'Мария' AND middle_name = 'Вячеславовна' AND birth_year = 1990 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'shmidt-tatyana-1988' AND s.athlete_id <> a.id)
              THEN 'shmidt-tatyana-1988-' || a.id ELSE 'shmidt-tatyana-1988' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Шмидт' AND first_name = 'Татьяна' AND middle_name = 'Александровна' AND birth_year = 1988 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lapshina-natalya-2003' AND s.athlete_id <> a.id)
              THEN 'lapshina-natalya-2003-' || a.id ELSE 'lapshina-natalya-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Лапшина' AND first_name = 'Наталья' AND middle_name = 'Владимировна' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kravcova-elizaveta-2009' AND s.athlete_id <> a.id)
              THEN 'kravcova-elizaveta-2009-' || a.id ELSE 'kravcova-elizaveta-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кравцова' AND first_name = 'Елизавета' AND middle_name = 'Максимовна' AND birth_year = 2009 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zybaylo-anastasiya-2000' AND s.athlete_id <> a.id)
              THEN 'zybaylo-anastasiya-2000-' || a.id ELSE 'zybaylo-anastasiya-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Зыбайло' AND first_name = 'Анастасия' AND middle_name = 'Александровна' AND birth_year = 2000 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'vertinskaya-anna-2009' AND s.athlete_id <> a.id)
              THEN 'vertinskaya-anna-2009-' || a.id ELSE 'vertinskaya-anna-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Вертинская' AND first_name = 'Анна' AND middle_name = 'Алексеевна' AND birth_year = 2009 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'bulatova-oksana-1980' AND s.athlete_id <> a.id)
              THEN 'bulatova-oksana-1980-' || a.id ELSE 'bulatova-oksana-1980' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Булатова' AND first_name = 'Оксана' AND middle_name = 'Сергеевна' AND birth_year = 1980 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'gredina-yuliya-1983' AND s.athlete_id <> a.id)
              THEN 'gredina-yuliya-1983-' || a.id ELSE 'gredina-yuliya-1983' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Гредина' AND first_name = 'Юлия' AND middle_name = 'Евгеньевна' AND birth_year = 1983 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'demyanchenko-anzhelika-1999' AND s.athlete_id <> a.id)
              THEN 'demyanchenko-anzhelika-1999-' || a.id ELSE 'demyanchenko-anzhelika-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Демьянченко' AND first_name = 'Анжелика' AND middle_name = 'Сергеевна' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'karacheva-tatyana-2008' AND s.athlete_id <> a.id)
              THEN 'karacheva-tatyana-2008-' || a.id ELSE 'karacheva-tatyana-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Карачева' AND first_name = 'Татьяна' AND middle_name = 'Сергеевна' AND birth_year = 2008 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'basharova-viktoriya-1993' AND s.athlete_id <> a.id)
              THEN 'basharova-viktoriya-1993-' || a.id ELSE 'basharova-viktoriya-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Башарова' AND first_name = 'Виктория' AND middle_name = 'Васильевна' AND birth_year = 1993 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ivanova-nina-1988' AND s.athlete_id <> a.id)
              THEN 'ivanova-nina-1988-' || a.id ELSE 'ivanova-nina-1988' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Иванова' AND first_name = 'Нина' AND middle_name = 'Владимировна' AND birth_year = 1988 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'elchaninova-veronika-2003' AND s.athlete_id <> a.id)
              THEN 'elchaninova-veronika-2003-' || a.id ELSE 'elchaninova-veronika-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ельчанинова' AND first_name = 'Вероника' AND middle_name = 'Сергеевна' AND birth_year = 2003 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'pokatilova-alisa-1991' AND s.athlete_id <> a.id)
              THEN 'pokatilova-alisa-1991-' || a.id ELSE 'pokatilova-alisa-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Покатилова' AND first_name = 'Алиса' AND middle_name = 'Константиновна' AND birth_year = 1991 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'androsova-marina-2007' AND s.athlete_id <> a.id)
              THEN 'androsova-marina-2007-' || a.id ELSE 'androsova-marina-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Андросова' AND first_name = 'Марина' AND middle_name = 'Евгеньевна' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ilyasov-kaken-1993' AND s.athlete_id <> a.id)
              THEN 'ilyasov-kaken-1993-' || a.id ELSE 'ilyasov-kaken-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ильясов' AND first_name = 'Какен' AND middle_name = 'Канатович' AND birth_year = 1993 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'abrosov-aleksey-1991' AND s.athlete_id <> a.id)
              THEN 'abrosov-aleksey-1991-' || a.id ELSE 'abrosov-aleksey-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Абросов' AND first_name = 'Алексей' AND middle_name = 'Владимирович' AND birth_year = 1991 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'krylov-matvey-2006' AND s.athlete_id <> a.id)
              THEN 'krylov-matvey-2006-' || a.id ELSE 'krylov-matvey-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Крылов' AND first_name = 'Матвей' AND middle_name = 'Сергеевич' AND birth_year = 2006 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'cybaev-ilya-1999' AND s.athlete_id <> a.id)
              THEN 'cybaev-ilya-1999-' || a.id ELSE 'cybaev-ilya-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Цыбаев' AND first_name = 'Илья' AND middle_name = 'Алексеевич' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'chernyshov-vladimir-1986' AND s.athlete_id <> a.id)
              THEN 'chernyshov-vladimir-1986-' || a.id ELSE 'chernyshov-vladimir-1986' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Чернышов' AND first_name = 'Владимир' AND middle_name = 'Александрович' AND birth_year = 1986 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'demyanchenko-daniil-2006' AND s.athlete_id <> a.id)
              THEN 'demyanchenko-daniil-2006-' || a.id ELSE 'demyanchenko-daniil-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Демьянченко' AND first_name = 'Даниил' AND middle_name = 'Сергеевич' AND birth_year = 2006 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'solovev-aleksandr-1982' AND s.athlete_id <> a.id)
              THEN 'solovev-aleksandr-1982-' || a.id ELSE 'solovev-aleksandr-1982' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Соловьев' AND first_name = 'Александр' AND middle_name = 'Сергеевич' AND birth_year = 1982 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'klimanov-aleksey-1991' AND s.athlete_id <> a.id)
              THEN 'klimanov-aleksey-1991-' || a.id ELSE 'klimanov-aleksey-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Климанов' AND first_name = 'Алексей' AND middle_name = 'Михайлович' AND birth_year = 1991 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'nekrasov-gleb-2007' AND s.athlete_id <> a.id)
              THEN 'nekrasov-gleb-2007-' || a.id ELSE 'nekrasov-gleb-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Некрасов' AND first_name = 'Глеб' AND middle_name = 'Александрович' AND birth_year = 2007 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ivanov-evgeniy-1987' AND s.athlete_id <> a.id)
              THEN 'ivanov-evgeniy-1987-' || a.id ELSE 'ivanov-evgeniy-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Евгений' AND middle_name = 'Игоревич' AND birth_year = 1987 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sherin-roman-1992' AND s.athlete_id <> a.id)
              THEN 'sherin-roman-1992-' || a.id ELSE 'sherin-roman-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Шерин' AND first_name = 'Роман' AND middle_name = 'Витальевич' AND birth_year = 1992 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'golubyatnikov-vitaliy-1996' AND s.athlete_id <> a.id)
              THEN 'golubyatnikov-vitaliy-1996-' || a.id ELSE 'golubyatnikov-vitaliy-1996' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Голубятников' AND first_name = 'Виталий' AND middle_name = 'Сергеевич' AND birth_year = 1996 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'tyulenev-dmitriy-1985' AND s.athlete_id <> a.id)
              THEN 'tyulenev-dmitriy-1985-' || a.id ELSE 'tyulenev-dmitriy-1985' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Тюленев' AND first_name = 'Дмитрий' AND middle_name = 'Тимофеевич' AND birth_year = 1985 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kovalev-konstantin-2001' AND s.athlete_id <> a.id)
              THEN 'kovalev-konstantin-2001-' || a.id ELSE 'kovalev-konstantin-2001' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ковалев' AND first_name = 'Константин' AND middle_name = 'Александрович' AND birth_year = 2001 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'durachenko-igor-1993' AND s.athlete_id <> a.id)
              THEN 'durachenko-igor-1993-' || a.id ELSE 'durachenko-igor-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Дураченко' AND first_name = 'Игорь' AND middle_name = 'Васильевич' AND birth_year = 1993 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'snopov-vladimir-1995' AND s.athlete_id <> a.id)
              THEN 'snopov-vladimir-1995-' || a.id ELSE 'snopov-vladimir-1995' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Снопов' AND first_name = 'Владимир' AND middle_name = 'Сергеевич' AND birth_year = 1995 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'rykov-mihail-1996' AND s.athlete_id <> a.id)
              THEN 'rykov-mihail-1996-' || a.id ELSE 'rykov-mihail-1996' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Рыков' AND first_name = 'Михаил' AND middle_name = 'Александрович' AND birth_year = 1996 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zagorodnev-maksim-1992' AND s.athlete_id <> a.id)
              THEN 'zagorodnev-maksim-1992-' || a.id ELSE 'zagorodnev-maksim-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Загороднев' AND first_name = 'Максим' AND middle_name = 'Олегович' AND birth_year = 1992 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'cybigey-vitaliy-1996' AND s.athlete_id <> a.id)
              THEN 'cybigey-vitaliy-1996-' || a.id ELSE 'cybigey-vitaliy-1996' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Цыбигей' AND first_name = 'Виталий' AND middle_name = 'Геннадьевич' AND birth_year = 1996 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'fateev-dmitriy-2005' AND s.athlete_id <> a.id)
              THEN 'fateev-dmitriy-2005-' || a.id ELSE 'fateev-dmitriy-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Фатеев' AND first_name = 'Дмитрий' AND middle_name = 'Алексеевич' AND birth_year = 2005 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'stremedlovskiy-vitaliy-1991' AND s.athlete_id <> a.id)
              THEN 'stremedlovskiy-vitaliy-1991-' || a.id ELSE 'stremedlovskiy-vitaliy-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Стремедловский' AND first_name = 'Виталий' AND middle_name = 'Владимирович' AND birth_year = 1991 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'luginov-ruslan-1997' AND s.athlete_id <> a.id)
              THEN 'luginov-ruslan-1997-' || a.id ELSE 'luginov-ruslan-1997' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Лугинов' AND first_name = 'Руслан' AND middle_name = 'Русланович' AND birth_year = 1997 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'shabunin-nikita-2001' AND s.athlete_id <> a.id)
              THEN 'shabunin-nikita-2001-' || a.id ELSE 'shabunin-nikita-2001' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Шабунин' AND first_name = 'Никита' AND middle_name = 'Андреевич' AND birth_year = 2001 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'klimov-petr-2001' AND s.athlete_id <> a.id)
              THEN 'klimov-petr-2001-' || a.id ELSE 'klimov-petr-2001' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Климов' AND first_name = 'Петр' AND middle_name = 'Петрович' AND birth_year = 2001 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lesnyh-pavel-1977' AND s.athlete_id <> a.id)
              THEN 'lesnyh-pavel-1977-' || a.id ELSE 'lesnyh-pavel-1977' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Лесных' AND first_name = 'Павел' AND middle_name = 'Алексеевич' AND birth_year = 1977 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'afanasev-leonid-1980' AND s.athlete_id <> a.id)
              THEN 'afanasev-leonid-1980-' || a.id ELSE 'afanasev-leonid-1980' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Афанасьев' AND first_name = 'Леонид' AND middle_name = 'Александрович' AND birth_year = 1980 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zhibinov-kirill-1991' AND s.athlete_id <> a.id)
              THEN 'zhibinov-kirill-1991-' || a.id ELSE 'zhibinov-kirill-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Жибинов' AND first_name = 'Кирилл' AND middle_name = 'Васильевич' AND birth_year = 1991 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'plohotin-pavel-1999' AND s.athlete_id <> a.id)
              THEN 'plohotin-pavel-1999-' || a.id ELSE 'plohotin-pavel-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Плохотин' AND first_name = 'Павел' AND middle_name = 'Александрович' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'pantyuhov-vladimir-1987' AND s.athlete_id <> a.id)
              THEN 'pantyuhov-vladimir-1987-' || a.id ELSE 'pantyuhov-vladimir-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Пантюхов' AND first_name = 'Владимир' AND middle_name = 'Александрович' AND birth_year = 1987 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'yavorskiy-viktor-1999' AND s.athlete_id <> a.id)
              THEN 'yavorskiy-viktor-1999-' || a.id ELSE 'yavorskiy-viktor-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Яворский' AND first_name = 'Виктор' AND middle_name = 'Викторович' AND birth_year = 1999 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kupsh-denis-2004' AND s.athlete_id <> a.id)
              THEN 'kupsh-denis-2004-' || a.id ELSE 'kupsh-denis-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Купш' AND first_name = 'Денис' AND middle_name = 'Аркадьевич' AND birth_year = 2004 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kudashev-denis-1988' AND s.athlete_id <> a.id)
              THEN 'kudashev-denis-1988-' || a.id ELSE 'kudashev-denis-1988' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кудашев' AND first_name = 'Денис' AND middle_name = 'Андреевич' AND birth_year = 1988 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'chupin-nikita-1988' AND s.athlete_id <> a.id)
              THEN 'chupin-nikita-1988-' || a.id ELSE 'chupin-nikita-1988' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Чупин' AND first_name = 'Никита' AND middle_name = 'Владимирович' AND birth_year = 1988 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'bulatov-pavel-1983' AND s.athlete_id <> a.id)
              THEN 'bulatov-pavel-1983-' || a.id ELSE 'bulatov-pavel-1983' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Булатов' AND first_name = 'Павел' AND middle_name = 'Владимирович' AND birth_year = 1983 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'barletov-evgeniy-1992' AND s.athlete_id <> a.id)
              THEN 'barletov-evgeniy-1992-' || a.id ELSE 'barletov-evgeniy-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Барлетов' AND first_name = 'Евгений' AND middle_name = 'Юрьевич' AND birth_year = 1992 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'mitichkin-aleksandr-1987' AND s.athlete_id <> a.id)
              THEN 'mitichkin-aleksandr-1987-' || a.id ELSE 'mitichkin-aleksandr-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Митичкин' AND first_name = 'Александр' AND middle_name = 'Сергеевич' AND birth_year = 1987 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'boyanovskiy-igor-1987' AND s.athlete_id <> a.id)
              THEN 'boyanovskiy-igor-1987-' || a.id ELSE 'boyanovskiy-igor-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бояновский' AND first_name = 'Игорь' AND middle_name = 'Евгеньевич' AND birth_year = 1987 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'umanec-roman-1987' AND s.athlete_id <> a.id)
              THEN 'umanec-roman-1987-' || a.id ELSE 'umanec-roman-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Уманец' AND first_name = 'Роман' AND middle_name = 'Николаевич' AND birth_year = 1987 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'burikov-roman-2002' AND s.athlete_id <> a.id)
              THEN 'burikov-roman-2002-' || a.id ELSE 'burikov-roman-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Буриков' AND first_name = 'Роман' AND middle_name = 'Александрович' AND birth_year = 2002 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'rogonov-pavel-1969' AND s.athlete_id <> a.id)
              THEN 'rogonov-pavel-1969-' || a.id ELSE 'rogonov-pavel-1969' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Рогонов' AND first_name = 'Павел' AND middle_name = 'Владимирович' AND birth_year = 1969 LIMIT 1)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);

INSERT INTO results (id, category_id, athlete_id, place, total_reps, points, body_weight_kg, rank_achieved_id, discipline_id, bell_kg, hands, time_limit_min, competition_id, event_date, raw_name, raw_club, raw_region, protocol_id, source_page) VALUES
  (5001, 5001, (SELECT id FROM athletes WHERE last_name = 'Меденцева' AND first_name = 'Дарья' AND middle_name = 'Александровна' AND birth_year = 2004 LIMIT 1), 1, 30, NULL, 58.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 5001, '2026-04-08', 'Меденцева Дарья Александровна', 'МАУ ДО "КСШ КМО"', 'Кемеровская область - Кузбасс', 5001, 22),
  (5002, 5001, (SELECT id FROM athletes WHERE last_name = 'Ныныч' AND first_name = 'Маргарита' AND middle_name = 'Анатольевна' AND birth_year = 1996 LIMIT 1), 2, 25, NULL, 57.95, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 5001, '2026-04-08', 'Ныныч Маргарита Анатольевна', '3 спортивная школа город Улан-Удэ', 'Республика Бурятия', 5001, 22),
  (5003, 5002, (SELECT id FROM athletes WHERE last_name = 'Рындина' AND first_name = 'Владислава' AND middle_name = 'Романовна' AND birth_year = 2009 LIMIT 1), 1, 42, NULL, 61.45, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 5001, '2026-04-08', 'Рындина Владислава Романовна', 'ДОО(П)Ц "Юниор"', 'Томская область', 5001, 23),
  (5004, 5002, (SELECT id FROM athletes WHERE last_name = 'Григорьева' AND first_name = 'Эмилия' AND middle_name = 'Сергеевна' AND birth_year = 2006 LIMIT 1), 2, 30, NULL, 60.8, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 5001, '2026-04-08', 'Григорьева Эмилия Сергеевна', 'Спортивная школа 3, г. Улан-Удэ', 'Республика Бурятия', 5001, 23),
  (5005, 5002, (SELECT id FROM athletes WHERE last_name = 'Болотова' AND first_name = 'Елизавета' AND middle_name = 'Сергеевна' AND birth_year = 2007 LIMIT 1), 3, 25, NULL, 61.3, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 5001, '2026-04-08', 'Болотова Елизавета Сергеевна', 'БУ ДО города Омска "СШОР № 33"', 'Омская область', 5001, 23),
  (5006, 5002, (SELECT id FROM athletes WHERE last_name = 'Воробьёва' AND first_name = 'Надежда' AND middle_name = 'Андреевна' AND birth_year = 2000 LIMIT 1), 4, 4, NULL, 61.05, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 5001, '2026-04-08', 'Воробьёва Надежда Андреевна', '-', 'Республика Бурятия', 5001, 23),
  (5007, 5003, (SELECT id FROM athletes WHERE last_name = 'Вяткина' AND first_name = 'Вера' AND middle_name = 'Павловна' AND birth_year = 1999 LIMIT 1), 1, 86, NULL, 128.4, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 5001, '2026-04-08', 'Вяткина Вера Павловна', 'РО ООО «ВФГС» в Омской области', 'Омская область', 5001, 25),
  (5008, 5003, (SELECT id FROM athletes WHERE last_name = 'Врубель' AND first_name = 'Дарья' AND middle_name = 'Васильевна' AND birth_year = 2000 LIMIT 1), 2, 79, NULL, 98.45, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 5001, '2026-04-08', 'Врубель Дарья Васильевна', 'БУ ДО г.Омска «СШОР 33»', 'Омская область', 5001, 25),
  (5009, 5003, (SELECT id FROM athletes WHERE last_name = 'Маркова' AND first_name = 'Анна' AND middle_name = 'Александровна' AND birth_year = 2009 LIMIT 1), 3, 3, NULL, 118.5, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 5001, '2026-04-08', 'Маркова Анна Александровна', 'ДЮСШ "Олимп"Первомайского района', 'Алтайский край', 5001, 25),
  (5010, 5004, (SELECT id FROM athletes WHERE last_name = 'Ермолина' AND first_name = 'Ирина' AND middle_name = 'Евгеньевна' AND birth_year = 2008 LIMIT 1), 1, 52, NULL, 63.6, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 5001, '2026-04-08', 'Ермолина Ирина Евгеньевна', 'ТРОО ФГС', 'Томская область', 5001, 24),
  (5011, 5004, (SELECT id FROM athletes WHERE last_name = 'Попова' AND first_name = 'Ольга' AND middle_name = 'Сергеевна' AND birth_year = 2002 LIMIT 1), 2, 2, NULL, 66.7, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 5001, '2026-04-08', 'Попова Ольга Сергеевна', 'Алтайский край', 'Алтайский край', 5001, 24),
  (5012, 5005, (SELECT id FROM athletes WHERE last_name = 'Кузнецов' AND first_name = 'Роман' AND middle_name = 'Андреевич' AND birth_year = 2009 LIMIT 1), 1, 93, NULL, 63.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 5001, '2026-04-08', 'Кузнецов Роман Андреевич', 'Спортивная школа №3,г.Улан-Удэ', 'Республика Бурятия', 5001, 15),
  (5013, 5005, (SELECT id FROM athletes WHERE last_name = 'Кашкаров' AND first_name = 'Артур' AND middle_name = 'Анатольевич' AND birth_year = 2005 LIMIT 1), 2, 52, NULL, 62.4, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 5001, '2026-04-08', 'Кашкаров Артур Анатольевич', 'Спортивный клуб "АГАУ"', 'Алтайский край', 5001, 15),
  (5014, 5005, (SELECT id FROM athletes WHERE last_name = 'Филипьев' AND first_name = 'Владислав' AND middle_name = 'Валерьевич' AND birth_year = 2005 LIMIT 1), 3, 47, NULL, 62.15, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 5001, '2026-04-08', 'Филипьев Владислав Валерьевич', 'КРСОО "Федерация гиревого спорта"', 'Красноярский край', 5001, 15),
  (5015, 5005, (SELECT id FROM athletes WHERE last_name = 'Фрис' AND first_name = 'Герман' AND middle_name = 'Эдуардович' AND birth_year = 2008 LIMIT 1), 4, 30, NULL, 62.2, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 5001, '2026-04-08', 'Фрис Герман Эдуардович', 'МАУ ДО "КСШ КМО"', 'Кемеровская область - Кузбасс', 5001, 15),
  (5016, 5005, (SELECT id FROM athletes WHERE last_name = 'Масленников' AND first_name = 'Максим' AND middle_name = 'Алексеевич' AND birth_year = 2003 LIMIT 1), 5, 14, NULL, 62.5, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 5001, '2026-04-08', 'Масленников Максим Алексеевич', '-', 'Алтайский край', 5001, 15),
  (5017, 5006, (SELECT id FROM athletes WHERE last_name = 'Василевич' AND first_name = 'Добрыня' AND middle_name = 'Андреевич' AND birth_year = 2000 LIMIT 1), 1, 104, NULL, 67.8, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 5001, '2026-04-08', 'Василевич Добрыня Андреевич', 'Республика Бурятия', 'Республика Бурятия', 5001, 16),
  (5018, 5006, (SELECT id FROM athletes WHERE last_name = 'Коломин' AND first_name = 'Дмитрий' AND middle_name = 'Андреевич' AND birth_year = 1999 LIMIT 1), 2, 102, NULL, 68.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 5001, '2026-04-08', 'Коломин Дмитрий Андреевич', 'Онохойская СШ', 'Республика Бурятия', 5001, 16),
  (5019, 5006, (SELECT id FROM athletes WHERE last_name = 'Рыбский' AND first_name = 'Павел' AND middle_name = 'Сергеевич' AND birth_year = 2008 LIMIT 1), 3, 78, NULL, 67.95, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 5001, '2026-04-08', 'Рыбский Павел Сергеевич', 'ВФГС', 'Томская область', 5001, 16),
  (5020, 5006, (SELECT id FROM athletes WHERE last_name = 'Аникусько' AND first_name = 'Семён' AND middle_name = 'Сергеевич' AND birth_year = 2009 LIMIT 1), 4, 72, NULL, 66.65, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 5001, '2026-04-08', 'Аникусько Семён Сергеевич', 'ДЮСШ Кулундинского района', 'Алтайский край', 5001, 16),
  (5021, 5006, (SELECT id FROM athletes WHERE last_name = 'Старцев' AND first_name = 'Вадим' AND middle_name = 'Андреевич' AND birth_year = 2007 LIMIT 1), 5, 53, NULL, 67.45, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 5001, '2026-04-08', 'Старцев Вадим Андреевич', 'ТРОО  ФГС', 'Томская область', 5001, 16),
  (5022, 5007, (SELECT id FROM athletes WHERE last_name = 'Рассадин' AND first_name = 'Андрей' AND middle_name = 'Андреевич' AND birth_year = 1989 LIMIT 1), 1, 125, NULL, 72.85, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 5001, '2026-04-08', 'Рассадин Андрей Андреевич', 'МБУ ДО СШ город Улан-Удэ', 'Республика Бурятия', 5001, 17),
  (5023, 5007, (SELECT id FROM athletes WHERE last_name = 'Жибинов' AND first_name = 'Фёдор' AND middle_name = 'Васильевич' AND birth_year = 2004 LIMIT 1), 2, 120, NULL, 73.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 5001, '2026-04-08', 'Жибинов Фёдор Васильевич', 'Спортивная школа города Черногорска', 'Республика Хакасия', 5001, 17),
  (5024, 5007, (SELECT id FROM athletes WHERE last_name = 'Волдаев' AND first_name = 'Александр' AND middle_name = 'Владимирович' AND birth_year = 2000 LIMIT 1), 3, 117, NULL, 72.75, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 5001, '2026-04-08', 'Волдаев Александр Владимирович', 'Федерация гиревого спорта Томской области', 'Томская область', 5001, 17),
  (5025, 5007, (SELECT id FROM athletes WHERE last_name = 'Григорчук' AND first_name = 'Сергей' AND middle_name = 'Сергеевич' AND birth_year = 2002 LIMIT 1), 4, 101, NULL, 70.95, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 5001, '2026-04-08', 'Григорчук Сергей Сергеевич', 'КРСОО "Федерация гиревого спорта"', 'Красноярский край', 5001, 17),
  (5026, 5007, (SELECT id FROM athletes WHERE last_name = 'Витрук' AND first_name = 'Лев' AND middle_name = 'Борисович' AND birth_year = 2008 LIMIT 1), 5, 97, NULL, 73.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 5001, '2026-04-08', 'Витрук Лев Борисович', '-', 'Томская область', 5001, 17),
  (5027, 5007, (SELECT id FROM athletes WHERE last_name = 'Седых' AND first_name = 'Илья' AND middle_name = 'Александрович' AND birth_year = 2004 LIMIT 1), 6, 88, NULL, 72.3, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 5001, '2026-04-08', 'Седых Илья Александрович', 'БУ ДО СШОР 33', 'Омская область', 5001, 17),
  (5028, 5007, (SELECT id FROM athletes WHERE last_name = 'Любин' AND first_name = 'Валентин' AND middle_name = 'Сергеевич' AND birth_year = 2009 LIMIT 1), 7, 78, NULL, 72.15, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 5001, '2026-04-08', 'Любин Валентин Сергеевич', 'ДЮСШ Кулундинского  района', 'Алтайский край', 5001, 17),
  (5029, 5007, (SELECT id FROM athletes WHERE last_name = 'Воронов' AND first_name = 'Иван' AND middle_name = 'Андреевич' AND birth_year = 1991 LIMIT 1), 8, 57, NULL, 72.85, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 5001, '2026-04-08', 'Воронов Иван Андреевич', 'ВС', 'Республика Бурятия', 5001, 17),
  (5030, 5007, (SELECT id FROM athletes WHERE last_name = 'Юнусов' AND first_name = 'Кирилл' AND middle_name = 'Алексеевич' AND birth_year = 2002 LIMIT 1), 9, 55, NULL, 72.3, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 5001, '2026-04-08', 'Юнусов Кирилл Алексеевич', 'Филиал СОУС г. Новоалтайск', 'Алтайский край', 5001, 17),
  (5031, 5007, (SELECT id FROM athletes WHERE last_name = 'Рожин' AND first_name = 'Егор' AND middle_name = 'Иннокентьевич' AND birth_year = 1987 LIMIT 1), 10, 50, NULL, 72.85, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 5001, '2026-04-08', 'Рожин Егор Иннокентьевич', 'Республиканский центр национальных видов спорта', 'Республика Саха (Якутия)', 5001, 17),
  (5032, 5008, (SELECT id FROM athletes WHERE last_name = 'Курдюков' AND first_name = 'Василий' AND middle_name = 'Сергеевич' AND birth_year = 1997 LIMIT 1), 1, 120, NULL, 77.25, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 5001, '2026-04-08', 'Курдюков Василий Сергеевич', 'РЦСП Омской области', 'Омская область', 5001, 18),
  (5033, 5008, (SELECT id FROM athletes WHERE last_name = 'Черемушников' AND first_name = 'Максим' AND middle_name = 'Викторович' AND birth_year = 1998 LIMIT 1), 2, 91, NULL, 74.35, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 5001, '2026-04-08', 'Черемушников Максим Викторович', 'БУ ДО СШОР 33', 'Омская область', 5001, 18),
  (5034, 5008, (SELECT id FROM athletes WHERE last_name = 'Панов' AND first_name = 'Алексей' AND middle_name = 'Анатольевич' AND birth_year = 1991 LIMIT 1), 3, 86, NULL, 76.8, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 5001, '2026-04-08', 'Панов Алексей Анатольевич', 'МКУ ДО "Шегарская СШ", МКУ ФСЦ "Шегарского района"', 'Томская область', 5001, 18),
  (5035, 5008, (SELECT id FROM athletes WHERE last_name = 'Зайдензал' AND first_name = 'Артём' AND middle_name = 'Николаевич' AND birth_year = 1987 LIMIT 1), 4, 76, NULL, 77.05, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 5001, '2026-04-08', 'Зайдензал Артём Николаевич', 'Кемеровская область', 'Кемеровская область - Кузбасс', 5001, 18),
  (5036, 5008, (SELECT id FROM athletes WHERE last_name = 'Ильин' AND first_name = 'Александр' AND middle_name = 'Сергеевич' AND birth_year = 2008 LIMIT 1), 5, 73, NULL, 75.45, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 5001, '2026-04-08', 'Ильин Александр Сергеевич', 'МКУ ДО "Шегарская СШ"', 'Томская область', 5001, 18),
  (5037, 5008, (SELECT id FROM athletes WHERE last_name = 'Матэус' AND first_name = 'Владислав' AND middle_name = 'Дмитриевич' AND birth_year = 2001 LIMIT 1), 6, 66, NULL, 77.25, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 5001, '2026-04-08', 'Матэус Владислав Дмитриевич', 'КРСОО "Федерация гиревого спорта"', 'Красноярский край', 5001, 18),
  (5038, 5008, (SELECT id FROM athletes WHERE last_name = 'Перевозчиков' AND first_name = 'Данил' AND middle_name = 'Александрович' AND birth_year = 2006 LIMIT 1), 7, 58, NULL, 73.9, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 5001, '2026-04-08', 'Перевозчиков Данил Александрович', 'Филиал СГУПС в городе Новоалтайск', 'Алтайский край', 5001, 18),
  (5039, 5008, (SELECT id FROM athletes WHERE last_name = 'Васильев' AND first_name = 'Андрей' AND middle_name = 'Денисович' AND birth_year = 2005 LIMIT 1), 8, 57, NULL, 76.65, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 5001, '2026-04-08', 'Васильев Андрей Денисович', 'МБУ КДЮСШ им. Ал. Бессмертных', 'Кемеровская область - Кузбасс', 5001, 18),
  (5040, 5009, (SELECT id FROM athletes WHERE last_name = 'Черкашин' AND first_name = 'Дмитрий' AND middle_name = 'Андреевич' AND birth_year = 1999 LIMIT 1), 1, 140, NULL, 84.75, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 5001, '2026-04-08', 'Черкашин Дмитрий Андреевич', 'ТРОО ФГС', 'Томская область', 5001, 19),
  (5041, 5009, (SELECT id FROM athletes WHERE last_name = 'Лавриков' AND first_name = 'Вячеслав' AND middle_name = 'Дмитриевич' AND birth_year = 2005 LIMIT 1), 2, 125, NULL, 84.95, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 5001, '2026-04-08', 'Лавриков Вячеслав Дмитриевич', 'ТГПУ', 'Томская область', 5001, 19),
  (5042, 5009, (SELECT id FROM athletes WHERE last_name = 'Литвинов' AND first_name = 'Виталий' AND middle_name = 'Александрович' AND birth_year = 1993 LIMIT 1), 3, 100, NULL, 83.2, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 5001, '2026-04-08', 'Литвинов Виталий Александрович', 'МБУ ДО СШОР "Олимп"', 'Кемеровская область - Кузбасс', 5001, 19),
  (5043, 5009, (SELECT id FROM athletes WHERE last_name = 'Зайцев' AND first_name = 'Александр' AND middle_name = 'Алексеевич' AND birth_year = 2007 LIMIT 1), 4, 84, NULL, 84.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 5001, '2026-04-08', 'Зайцев Александр Алексеевич', 'МБУ ДО ОНОХОЙСКАЯ СШ', 'Республика Бурятия', 5001, 19),
  (5044, 5009, (SELECT id FROM athletes WHERE last_name = 'Новиков' AND first_name = 'Алексей' AND middle_name = 'Романович' AND birth_year = 2005 LIMIT 1), 5, 72, NULL, 83.05, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 5001, '2026-04-08', 'Новиков Алексей Романович', 'ТРОО ФГС', 'Томская область', 5001, 19),
  (5045, 5010, (SELECT id FROM athletes WHERE last_name = 'Гредин' AND first_name = 'Анатолий' AND middle_name = 'Алексеевич' AND birth_year = 2008 LIMIT 1), 1, 85, NULL, 108.2, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 5001, '2026-04-08', 'Гредин Анатолий Алексеевич', 'ВЫГС Кемеровская область', 'Кемеровская область - Кузбасс', 5001, 21),
  (5046, 5010, (SELECT id FROM athletes WHERE last_name = 'Закревский' AND first_name = 'Илья' AND middle_name = 'Витальевич' AND birth_year = 2005 LIMIT 1), 2, 48, NULL, 109.3, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 5001, '2026-04-08', 'Закревский Илья Витальевич', 'Филиал СГУПС в городе Новоалтайске', 'Алтайский край', 5001, 21),
  (5047, 5010, (SELECT id FROM athletes WHERE last_name = 'Пехтерев' AND first_name = 'Илья' AND middle_name = 'Андреевич' AND birth_year = 1987 LIMIT 1), 3, 41, NULL, 121.5, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 5001, '2026-04-08', 'Пехтерев Илья Андреевич', 'Кемеровская область', 'Кемеровская область - Кузбасс', 5001, 21),
  (5048, 5010, (SELECT id FROM athletes WHERE last_name = 'Путинцев' AND first_name = 'Леонид' AND middle_name = 'Викторович' AND birth_year = 1982 LIMIT 1), 4, 40, NULL, 97.45, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 5001, '2026-04-08', 'Путинцев Леонид Викторович', 'Кемеровская область', 'Кемеровская область - Кузбасс', 5001, 21),
  (5049, 5011, (SELECT id FROM athletes WHERE last_name = 'Черкашин' AND first_name = 'Иван' AND middle_name = 'Андреевич' AND birth_year = 1999 LIMIT 1), 1, 123, NULL, 93.45, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 5001, '2026-04-08', 'Черкашин Иван Андреевич', 'ТРОО ФГС', 'Томская область', 5001, 20),
  (5050, 5011, (SELECT id FROM athletes WHERE last_name = 'Пивень' AND first_name = 'Андрей' AND middle_name = 'Владимирович' AND birth_year = 2003 LIMIT 1), 2, 121, NULL, 91.8, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 5001, '2026-04-08', 'Пивень Андрей Владимирович', 'ВС', 'Республика Бурятия', 5001, 20),
  (5051, 5011, (SELECT id FROM athletes WHERE last_name = 'Житихин' AND first_name = 'Владислав' AND middle_name = 'Николаевич' AND birth_year = 1994 LIMIT 1), 3, 114, NULL, 93.45, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 5001, '2026-04-08', 'Житихин Владислав Николаевич', 'ВС РФ', 'Республика Бурятия', 5001, 20),
  (5052, 5011, (SELECT id FROM athletes WHERE last_name = 'Козлов' AND first_name = 'Дмитрий' AND middle_name = 'Михайлович' AND birth_year = 2000 LIMIT 1), 4, 92, NULL, 87.8, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 5001, '2026-04-08', 'Козлов Дмитрий Михайлович', 'ВС', 'Алтайский край', 5001, 20),
  (5053, 5011, (SELECT id FROM athletes WHERE last_name = 'Филиппов' AND first_name = 'Роман' AND middle_name = 'Юрьевич' AND birth_year = 2009 LIMIT 1), 5, 80, NULL, 89.45, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 5001, '2026-04-08', 'Филиппов Роман Юрьевич', 'ДЮСШ Кулундинского района', 'Алтайский край', 5001, 20),
  (5054, 5012, (SELECT id FROM athletes WHERE last_name = 'Меденцева' AND first_name = 'Дарья' AND middle_name = 'Александровна' AND birth_year = 2004 LIMIT 1), 1, 21, NULL, 57.9, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 5001, '2026-04-08', 'Меденцева Дарья Александровна', 'МАУ ДО "КСШ КМО"', 'Кемеровская область - Кузбасс', 5001, 9),
  (5055, 5012, (SELECT id FROM athletes WHERE last_name = 'Ныныч' AND first_name = 'Маргарита' AND middle_name = 'Анатольевна' AND birth_year = 1996 LIMIT 1), 2, 20, NULL, 58.0, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 5001, '2026-04-08', 'Ныныч Маргарита Анатольевна', '3 спортивная школа город Улан-Удэ', 'Республика Бурятия', 5001, 9),
  (5056, 5013, (SELECT id FROM athletes WHERE last_name = 'Рындина' AND first_name = 'Владислава' AND middle_name = 'Романовна' AND birth_year = 2009 LIMIT 1), 1, 42, NULL, 61.45, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 5001, '2026-04-08', 'Рындина Владислава Романовна', 'ДОО(П)Ц "Юниор"', 'Томская область', 5001, 10),
  (5057, 5013, (SELECT id FROM athletes WHERE last_name = 'Григорьева' AND first_name = 'Эмилия' AND middle_name = 'Сергеевна' AND birth_year = 2006 LIMIT 1), 2, 27, NULL, 61.25, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 5001, '2026-04-08', 'Григорьева Эмилия Сергеевна', 'Спортивная школа 3, г. Улан-Удэ', 'Республика Бурятия', 5001, 10),
  (5058, 5013, (SELECT id FROM athletes WHERE last_name = 'Болотова' AND first_name = 'Елизавета' AND middle_name = 'Сергеевна' AND birth_year = 2007 LIMIT 1), 3, 16, NULL, 60.95, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 5001, '2026-04-08', 'Болотова Елизавета Сергеевна', 'БУ ДО города Омска "СШОР № 33"', 'Омская область', 5001, 10),
  (5059, 5014, (SELECT id FROM athletes WHERE last_name = 'Вяткина' AND first_name = 'Вера' AND middle_name = 'Павловна' AND birth_year = 1999 LIMIT 1), 1, 60, NULL, 127.8, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 5001, '2026-04-08', 'Вяткина Вера Павловна', 'РО ООО «ВФГС» в Омской области', 'Омская область', 5001, 12),
  (5060, 5014, (SELECT id FROM athletes WHERE last_name = 'Врубель' AND first_name = 'Дарья' AND middle_name = 'Васильевна' AND birth_year = 2000 LIMIT 1), 2, 55, NULL, 97.85, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 5001, '2026-04-08', 'Врубель Дарья Васильевна', 'БУ ДО г.Омска «СШОР 33»', 'Омская область', 5001, 12),
  (5061, 5014, (SELECT id FROM athletes WHERE last_name = 'Маркова' AND first_name = 'Анна' AND middle_name = 'Александровна' AND birth_year = 2009 LIMIT 1), NULL, NULL, NULL, 118.9, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 5001, '2026-04-08', 'Маркова Анна Александровна', 'ДЮСШ "Олимп"Первомайского района', 'Алтайский край', 5001, 12),
  (5062, 5014, (SELECT id FROM athletes WHERE last_name = 'Семина' AND first_name = 'Елизавета' AND middle_name = 'Александровна' AND birth_year = 2002 LIMIT 1), NULL, NULL, NULL, 76.5, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 5001, '2026-04-08', 'Семина Елизавета Александровна', 'ООФГСАК', 'Алтайский край', 5001, 12),
  (5063, 5015, (SELECT id FROM athletes WHERE last_name = 'Ермолина' AND first_name = 'Ирина' AND middle_name = 'Евгеньевна' AND birth_year = 2008 LIMIT 1), 1, 47, NULL, 63.1, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 5001, '2026-04-08', 'Ермолина Ирина Евгеньевна', 'ТРОО ФГС', 'Томская область', 5001, 11),
  (5064, 5016, (SELECT id FROM athletes WHERE last_name = 'Недорезов' AND first_name = 'Василий' AND middle_name = 'Сергеевич' AND birth_year = 1992 LIMIT 1), 1, 44, NULL, 63.0, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 5001, '2026-04-08', 'Недорезов Василий Сергеевич', 'ВС', 'Республика Бурятия', 5001, 2),
  (5065, 5016, (SELECT id FROM athletes WHERE last_name = 'Якушев' AND first_name = 'Роман' AND middle_name = 'Владимирович' AND birth_year = 2002 LIMIT 1), 2, 44, NULL, 63.0, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 5001, '2026-04-08', 'Якушев Роман Владимирович', 'ВС', 'Республика Бурятия', 5001, 2),
  (5066, 5016, (SELECT id FROM athletes WHERE last_name = 'Елесов' AND first_name = 'Михаил' AND middle_name = 'Егорович' AND birth_year = 2007 LIMIT 1), 3, 37, NULL, 62.75, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 5001, '2026-04-08', 'Елесов Михаил Егорович', 'Первомайская спортивная школа', 'Томская область', 5001, 2),
  (5067, 5016, (SELECT id FROM athletes WHERE last_name = 'Филипьев' AND first_name = 'Владислав' AND middle_name = 'Валерьевич' AND birth_year = 2005 LIMIT 1), 4, 12, NULL, 62.5, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 5001, '2026-04-08', 'Филипьев Владислав Валерьевич', 'КРСОО "Федерация гиревого спорта"', 'Красноярский край', 5001, 2),
  (5068, 5017, (SELECT id FROM athletes WHERE last_name = 'Коломин' AND first_name = 'Дмитрий' AND middle_name = 'Андреевич' AND birth_year = 1999 LIMIT 1), 1, 52, NULL, 67.8, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 5001, '2026-04-08', 'Коломин Дмитрий Андреевич', 'Онохойская СШ', 'Республика Бурятия', 5001, 3),
  (5069, 5017, (SELECT id FROM athletes WHERE last_name = 'Рыбский' AND first_name = 'Павел' AND middle_name = 'Сергеевич' AND birth_year = 2008 LIMIT 1), 2, 51, NULL, 67.9, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 5001, '2026-04-08', 'Рыбский Павел Сергеевич', 'ВФГС', 'Томская область', 5001, 3),
  (5070, 5017, (SELECT id FROM athletes WHERE last_name = 'Морозович' AND first_name = 'Владислав' AND middle_name = 'Павлович' AND birth_year = 1999 LIMIT 1), 3, 38, NULL, 67.9, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 5001, '2026-04-08', 'Морозович Владислав Павлович', 'БУ ДО г.Омска «СШОР 33»', 'Омская область', 5001, 3),
  (5071, 5018, (SELECT id FROM athletes WHERE last_name = 'Жибинов' AND first_name = 'Фёдор' AND middle_name = 'Васильевич' AND birth_year = 2004 LIMIT 1), 1, 67, NULL, 72.85, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 5001, '2026-04-08', 'Жибинов Фёдор Васильевич', 'Спортивная школа города Черногорска', 'Республика Хакасия', 5001, 4),
  (5072, 5018, (SELECT id FROM athletes WHERE last_name = 'Оленов' AND first_name = 'Владимир' AND middle_name = 'Владимирович' AND birth_year = 1991 LIMIT 1), 2, 66, NULL, 72.9, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 5001, '2026-04-08', 'Оленов Владимир Владимирович', 'Республиканский центр национальных видов спорта', 'Республика Саха (Якутия)', 5001, 4),
  (5073, 5018, (SELECT id FROM athletes WHERE last_name = 'Юнусов' AND first_name = 'Кирилл' AND middle_name = 'Алексеевич' AND birth_year = 2002 LIMIT 1), 3, 61, NULL, 72.85, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 5001, '2026-04-08', 'Юнусов Кирилл Алексеевич', 'Филиал СОУС г. Новоалтайск', 'Алтайский край', 5001, 4),
  (5074, 5018, (SELECT id FROM athletes WHERE last_name = 'Рожин' AND first_name = 'Егор' AND middle_name = 'Иннокентьевич' AND birth_year = 1987 LIMIT 1), 4, 54, NULL, 73.0, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 5001, '2026-04-08', 'Рожин Егор Иннокентьевич', 'Республиканский центр национальных видов спорта', 'Республика Саха (Якутия)', 5001, 4),
  (5075, 5018, (SELECT id FROM athletes WHERE last_name = 'Григорчук' AND first_name = 'Сергей' AND middle_name = 'Сергеевич' AND birth_year = 2002 LIMIT 1), 5, 47, NULL, 71.4, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 5001, '2026-04-08', 'Григорчук Сергей Сергеевич', 'КРСОО "Федерация гиревого спорта"', 'Красноярский край', 5001, 4),
  (5076, 5018, (SELECT id FROM athletes WHERE last_name = 'Никитенко' AND first_name = 'Богдан' AND middle_name = 'Юрьевич' AND birth_year = 2008 LIMIT 1), 6, 31, NULL, 72.0, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 5001, '2026-04-08', 'Никитенко Богдан Юрьевич', 'Спортивная школа 3', 'Республика Бурятия', 5001, 4),
  (5077, 5019, (SELECT id FROM athletes WHERE last_name = 'Каргин' AND first_name = 'Сергей' AND middle_name = 'Ярославович' AND birth_year = 1998 LIMIT 1), 1, 72, NULL, 76.8, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 5001, '2026-04-08', 'Каргин Сергей Ярославович', 'ЦСП', 'Республика Бурятия', 5001, 5),
  (5078, 5019, (SELECT id FROM athletes WHERE last_name = 'Любимский' AND first_name = 'Сергей' AND middle_name = 'Александрович' AND birth_year = 1992 LIMIT 1), 2, 69, NULL, 78.0, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 5001, '2026-04-08', 'Любимский Сергей Александрович', 'ВС', 'Республика Бурятия', 5001, 5),
  (5079, 5019, (SELECT id FROM athletes WHERE last_name = 'Курдюков' AND first_name = 'Василий' AND middle_name = 'Сергеевич' AND birth_year = 1997 LIMIT 1), 3, 61, NULL, 77.1, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 5001, '2026-04-08', 'Курдюков Василий Сергеевич', 'РЦСП Омской области', 'Омская область', 5001, 5),
  (5080, 5019, (SELECT id FROM athletes WHERE last_name = 'Матэус' AND first_name = 'Владислав' AND middle_name = 'Дмитриевич' AND birth_year = 2001 LIMIT 1), 4, 52, NULL, 77.6, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 5001, '2026-04-08', 'Матэус Владислав Дмитриевич', 'КРСОО "Федерация гиревого спорта"', 'Красноярский край', 5001, 5),
  (5081, 5019, (SELECT id FROM athletes WHERE last_name = 'Филиппов' AND first_name = 'Евгений' AND middle_name = 'Борисович' AND birth_year = 1995 LIMIT 1), 5, 50, NULL, 77.8, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 5001, '2026-04-08', 'Филиппов Евгений Борисович', 'РО ООО «ВФГС» в Омской области', 'Омская область', 5001, 5),
  (5082, 5019, (SELECT id FROM athletes WHERE last_name = 'Ильин' AND first_name = 'Александр' AND middle_name = 'Сергеевич' AND birth_year = 2008 LIMIT 1), 6, 45, NULL, 76.9, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 5001, '2026-04-08', 'Ильин Александр Сергеевич', 'МКУ ДО "Шегарская СШ"', 'Томская область', 5001, 5),
  (5083, 5019, (SELECT id FROM athletes WHERE last_name = 'Перевозчиков' AND first_name = 'Данил' AND middle_name = 'Александрович' AND birth_year = 2006 LIMIT 1), 7, 33, NULL, 73.6, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 5001, '2026-04-08', 'Перевозчиков Данил Александрович', 'Филиал СГУПС в городе Новоалтайск', 'Алтайский край', 5001, 5),
  (5084, 5019, (SELECT id FROM athletes WHERE last_name = 'Кольмаер' AND first_name = 'Александр' AND middle_name = 'Николаевич' AND birth_year = 1982 LIMIT 1), 8, 32, NULL, 75.8, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 5001, '2026-04-08', 'Кольмаер Александр Николаевич', 'Федерация гиревого спорта Алтайского края', 'Алтайский край', 5001, 5),
  (5085, 5020, (SELECT id FROM athletes WHERE last_name = 'Черкашин' AND first_name = 'Дмитрий' AND middle_name = 'Андреевич' AND birth_year = 1999 LIMIT 1), 1, 85, NULL, 84.95, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 5001, '2026-04-08', 'Черкашин Дмитрий Андреевич', 'ТРОО ФГС', 'Томская область', 5001, 6),
  (5086, 5020, (SELECT id FROM athletes WHERE last_name = 'Рысник' AND first_name = 'Сергей' AND middle_name = 'Михайлович' AND birth_year = 1995 LIMIT 1), 2, 78, NULL, 84.95, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 5001, '2026-04-08', 'Рысник Сергей Михайлович', 'СШОР №33 г. Омск', 'Омская область', 5001, 6),
  (5087, 5020, (SELECT id FROM athletes WHERE last_name = 'Полибин' AND first_name = 'Михаил' AND middle_name = 'Леонидович' AND birth_year = 2004 LIMIT 1), 3, 70, NULL, 84.4, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 5001, '2026-04-08', 'Полибин Михаил Леонидович', 'Федерация гиревого спорта Алтайского края', 'Алтайский край', 5001, 6),
  (5088, 5020, (SELECT id FROM athletes WHERE last_name = 'Минуллин' AND first_name = 'Марсель' AND middle_name = 'Ринатович' AND birth_year = 2000 LIMIT 1), 4, 65, NULL, 82.35, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 5001, '2026-04-08', 'Минуллин Марсель Ринатович', 'РО ООО «ВФГС» в Омской Области', 'Омская область', 5001, 6),
  (5089, 5020, (SELECT id FROM athletes WHERE last_name = 'Шигильдеев' AND first_name = 'Степан' AND middle_name = 'Федорович' AND birth_year = 2005 LIMIT 1), 5, 60, NULL, 82.7, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 5001, '2026-04-08', 'Шигильдеев Степан Федорович', 'ТРОО ФГС', 'Томская область', 5001, 6),
  (5090, 5020, (SELECT id FROM athletes WHERE last_name = 'Литвинов' AND first_name = 'Виталий' AND middle_name = 'Александрович' AND birth_year = 1993 LIMIT 1), 6, 32, NULL, 83.6, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 5001, '2026-04-08', 'Литвинов Виталий Александрович', 'МБУ ДО СШОР "Олимп"', 'Кемеровская область - Кузбасс', 5001, 6),
  (5091, 5021, (SELECT id FROM athletes WHERE last_name = 'Балабанов' AND first_name = 'Сергей' AND middle_name = 'Андреевич' AND birth_year = 1996 LIMIT 1), 1, 98, NULL, 104.6, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 5001, '2026-04-08', 'Балабанов Сергей Андреевич', 'ВС', 'Республика Бурятия', 5001, 8),
  (5092, 5021, (SELECT id FROM athletes WHERE last_name = 'Симашкевич' AND first_name = 'Евгений' AND middle_name = 'Валентинович' AND birth_year = 1991 LIMIT 1), 2, 93, NULL, 111.7, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 5001, '2026-04-08', 'Симашкевич Евгений Валентинович', 'РО ООО «ВФГС» в Омской области', 'Омская область', 5001, 8),
  (5093, 5021, (SELECT id FROM athletes WHERE last_name = 'Закревский' AND first_name = 'Илья' AND middle_name = 'Витальевич' AND birth_year = 2005 LIMIT 1), 3, 22, NULL, 110.3, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 5001, '2026-04-08', 'Закревский Илья Витальевич', 'Филиал СГУПС в городе Новоалтайске', 'Алтайский край', 5001, 8),
  (5094, 5022, (SELECT id FROM athletes WHERE last_name = 'Черкашин' AND first_name = 'Иван' AND middle_name = 'Андреевич' AND birth_year = 1999 LIMIT 1), 1, 81, NULL, 93.3, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 5001, '2026-04-08', 'Черкашин Иван Андреевич', 'ТРОО ФГС', 'Томская область', 5001, 7),
  (5095, 5022, (SELECT id FROM athletes WHERE last_name = 'Стаханов' AND first_name = 'Валентин' AND middle_name = 'Викторович' AND birth_year = 1990 LIMIT 1), 2, 71, NULL, 93.4, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 5001, '2026-04-08', 'Стаханов Валентин Викторович', 'ВС', 'Омская область', 5001, 7),
  (5096, 5022, (SELECT id FROM athletes WHERE last_name = 'Ткачёв' AND first_name = 'Виталий' AND middle_name = 'Александрович' AND birth_year = 1981 LIMIT 1), 3, 61, NULL, 86.3, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 5001, '2026-04-08', 'Ткачёв Виталий Александрович', 'МБУ "ЦФК и  С"', 'Кемеровская область - Кузбасс', 5001, 7),
  (5097, 5022, (SELECT id FROM athletes WHERE last_name = 'Шендо' AND first_name = 'Никита' AND middle_name = 'Сергеевич' AND birth_year = 1998 LIMIT 1), 4, 57, NULL, 92.3, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 5001, '2026-04-08', 'Шендо Никита Сергеевич', 'КРСОО "Федерация гиревого спорта"', 'Красноярский край', 5001, 7),
  (5098, 5022, (SELECT id FROM athletes WHERE last_name = 'Житихин' AND first_name = 'Владислав' AND middle_name = 'Николаевич' AND birth_year = 1994 LIMIT 1), 5, 42, NULL, 94.05, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 5001, '2026-04-08', 'Житихин Владислав Николаевич', 'ВС РФ', 'Республика Бурятия', 5001, 7),
  (5099, 5023, (SELECT id FROM athletes WHERE last_name = 'Ныныч' AND first_name = 'Маргарита' AND middle_name = 'Анатольевна' AND birth_year = 1996 LIMIT 1), 1, 176, NULL, 57.9, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 5001, '2026-04-08', 'Ныныч Маргарита Анатольевна', '3 спортивная школа город Улан-Удэ', 'Республика Бурятия', 5001, 33),
  (5100, 5023, (SELECT id FROM athletes WHERE last_name = 'Береснева' AND first_name = 'Елена' AND middle_name = 'Сергеевна' AND birth_year = 1996 LIMIT 1), 2, 95, NULL, 57.1, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 5001, '2026-04-08', 'Береснева Елена Сергеевна', 'Федерация гиревого спорта Томской области', 'Томская область', 5001, 33),
  (5101, 5023, (SELECT id FROM athletes WHERE last_name = 'Донских' AND first_name = 'Маргарита' AND middle_name = 'Александровна' AND birth_year = 1989 LIMIT 1), 3, 86, NULL, 57.25, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 5001, '2026-04-08', 'Донских Маргарита Александровна', 'РО ООО «ВФГС» в Омской области', 'Омская область', 5001, 33),
  (5102, 5023, (SELECT id FROM athletes WHERE last_name = 'Чернощук' AND first_name = 'Анастасия' AND middle_name = 'Витальевна' AND birth_year = 2009 LIMIT 1), 4, 69, NULL, 56.7, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 5001, '2026-04-08', 'Чернощук Анастасия Витальевна', 'ДОО(П)Ц "Юниор"', 'Томская область', 5001, 33),
  (5103, 5023, (SELECT id FROM athletes WHERE last_name = 'Булатова' AND first_name = 'Наталья' AND middle_name = 'Павловна' AND birth_year = 2011 LIMIT 1), 5, 66, NULL, 51.6, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 5001, '2026-04-08', 'Булатова Наталья Павловна', 'РО ООО ВФГС в Кемеровской области', 'Кемеровская область - Кузбасс', 5001, 33),
  (5104, 5024, (SELECT id FROM athletes WHERE last_name = 'Политова' AND first_name = 'София' AND middle_name = 'Владимировна' AND birth_year = 2010 LIMIT 1), 1, 107, NULL, 62.05, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 5001, '2026-04-08', 'Политова София Владимировна', '-', 'Кемеровская область - Кузбасс', 5001, 34),
  (5105, 5024, (SELECT id FROM athletes WHERE last_name = 'Болотова' AND first_name = 'Елизавета' AND middle_name = 'Сергеевна' AND birth_year = 2007 LIMIT 1), 2, 76, NULL, 61.3, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 5001, '2026-04-08', 'Болотова Елизавета Сергеевна', 'БУ ДО города Омска "СШОР N° 33"', 'Омская область', 5001, 34),
  (5106, 5024, (SELECT id FROM athletes WHERE last_name = 'Воробьёва' AND first_name = 'Надежда' AND middle_name = 'Андреевна' AND birth_year = 2000 LIMIT 1), 3, 73, NULL, 61.05, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 5001, '2026-04-08', 'Воробьёва Надежда Андреевна', '-', 'Республика Бурятия', 5001, 34),
  (5107, 5024, (SELECT id FROM athletes WHERE last_name = 'Воронцова' AND first_name = 'Мария' AND middle_name = 'Вячеславовна' AND birth_year = 1990 LIMIT 1), 4, 60, NULL, 62.55, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 5001, '2026-04-08', 'Воронцова Мария Вячеславовна', '-', 'Кемеровская область - Кузбасс', 5001, 34),
  (5108, 5025, (SELECT id FROM athletes WHERE last_name = 'Шмидт' AND first_name = 'Татьяна' AND middle_name = 'Александровна' AND birth_year = 1988 LIMIT 1), 1, 175, NULL, 108.5, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 5001, '2026-04-08', 'Шмидт Татьяна Александровна', 'КРСОО "Федерация гиревого спорта"', 'Красноярский край', 5001, 36),
  (5109, 5025, (SELECT id FROM athletes WHERE last_name = 'Врубель' AND first_name = 'Дарья' AND middle_name = 'Васильевна' AND birth_year = 2000 LIMIT 1), 2, 153, NULL, 99.15, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 5001, '2026-04-08', 'Врубель Дарья Васильевна', 'БУ ДО г.Омска «СШОР 33»', 'Омская область', 5001, 36),
  (5110, 5025, (SELECT id FROM athletes WHERE last_name = 'Лапшина' AND first_name = 'Наталья' AND middle_name = 'Владимировна' AND birth_year = 2003 LIMIT 1), 3, 148, NULL, 83.65, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 5001, '2026-04-08', 'Лапшина Наталья Владимировна', 'ООФГСАК', 'Алтайский край', 5001, 36),
  (5111, 5025, (SELECT id FROM athletes WHERE last_name = 'Кравцова' AND first_name = 'Елизавета' AND middle_name = 'Максимовна' AND birth_year = 2009 LIMIT 1), 4, 114, NULL, 75.75, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 5001, '2026-04-08', 'Кравцова Елизавета Максимовна', 'МАУ ДО "Спортивная школа "Победа" Города Томска"', 'Томская область', 5001, 36),
  (5112, 5025, (SELECT id FROM athletes WHERE last_name = 'Зыбайло' AND first_name = 'Анастасия' AND middle_name = 'Александровна' AND birth_year = 2000 LIMIT 1), 5, 100, NULL, 115.6, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 5001, '2026-04-08', 'Зыбайло Анастасия Александровна', 'КРСОО "Федерация гиревого спорта"', 'Красноярский край', 5001, 36),
  (5113, 5025, (SELECT id FROM athletes WHERE last_name = 'Вертинская' AND first_name = 'Анна' AND middle_name = 'Алексеевна' AND birth_year = 2009 LIMIT 1), 6, 97, NULL, 76.5, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 5001, '2026-04-08', 'Вертинская Анна Алексеевна', 'Спортшкола "Олимп"', 'Алтайский край', 5001, 36),
  (5114, 5025, (SELECT id FROM athletes WHERE last_name = 'Булатова' AND first_name = 'Оксана' AND middle_name = 'Сергеевна' AND birth_year = 1980 LIMIT 1), 7, 90, NULL, 83.2, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 5001, '2026-04-08', 'Булатова Оксана Сергеевна', 'РО ООО ВФГС в Кемеровской области', 'Кемеровская область - Кузбасс', 5001, 36),
  (5115, 5025, (SELECT id FROM athletes WHERE last_name = 'Гредина' AND first_name = 'Юлия' AND middle_name = 'Евгеньевна' AND birth_year = 1983 LIMIT 1), 8, 89, NULL, 86.05, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 5001, '2026-04-08', 'Гредина Юлия Евгеньевна', 'ВФГС Кемеровской области', 'Кемеровская область - Кузбасс', 5001, 36),
  (5116, 5025, (SELECT id FROM athletes WHERE last_name = 'Семина' AND first_name = 'Елизавета' AND middle_name = 'Александровна' AND birth_year = 2002 LIMIT 1), 9, 87, NULL, 78.45, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 5001, '2026-04-08', 'Семина Елизавета Александровна', 'ООФГСАК', 'Алтайский край', 5001, 36),
  (5117, 5025, (SELECT id FROM athletes WHERE last_name = 'Демьянченко' AND first_name = 'Анжелика' AND middle_name = 'Сергеевна' AND birth_year = 1999 LIMIT 1), 10, 70, NULL, 76.8, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 5001, '2026-04-08', 'Демьянченко Анжелика Сергеевна', 'МБУ ДО ДООФСЦ Оконешниково', 'Омская область', 5001, 36),
  (5118, 5025, (SELECT id FROM athletes WHERE last_name = 'Карачева' AND first_name = 'Татьяна' AND middle_name = 'Сергеевна' AND birth_year = 2008 LIMIT 1), 11, 63, NULL, 75.05, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 5001, '2026-04-08', 'Карачева Татьяна Сергеевна', 'ТРОО ФГС', 'Томская область', 5001, 36),
  (5119, 5026, (SELECT id FROM athletes WHERE last_name = 'Башарова' AND first_name = 'Виктория' AND middle_name = 'Васильевна' AND birth_year = 1993 LIMIT 1), 1, 190, NULL, 67.8, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 5001, '2026-04-08', 'Башарова Виктория Васильевна', 'Роооо ВФГС в РБ', 'Республика Бурятия', 5001, 35),
  (5120, 5026, (SELECT id FROM athletes WHERE last_name = 'Иванова' AND first_name = 'Нина' AND middle_name = 'Владимировна' AND birth_year = 1988 LIMIT 1), 2, 170, NULL, 67.25, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 5001, '2026-04-08', 'Иванова Нина Владимировна', 'Сборная Республики Бурятия', 'Республика Бурятия', 5001, 35),
  (5121, 5026, (SELECT id FROM athletes WHERE last_name = 'Ельчанинова' AND first_name = 'Вероника' AND middle_name = 'Сергеевна' AND birth_year = 2003 LIMIT 1), 3, 135, NULL, 67.95, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 5001, '2026-04-08', 'Ельчанинова Вероника Сергеевна', 'БУ ДО г.Омска «СШОР 33»', 'Омская область', 5001, 35),
  (5122, 5026, (SELECT id FROM athletes WHERE last_name = 'Покатилова' AND first_name = 'Алиса' AND middle_name = 'Константиновна' AND birth_year = 1991 LIMIT 1), 4, 87, NULL, 67.8, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 5001, '2026-04-08', 'Покатилова Алиса Константиновна', 'ТРОО ФГС', 'Томская область', 5001, 35),
  (5123, 5026, (SELECT id FROM athletes WHERE last_name = 'Андросова' AND first_name = 'Марина' AND middle_name = 'Евгеньевна' AND birth_year = 2007 LIMIT 1), 5, 86, NULL, 67.6, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 5001, '2026-04-08', 'Андросова Марина Евгеньевна', 'Федерация гиревого спорта Алтайского края', 'Алтайский край', 5001, 35),
  (5124, 5026, (SELECT id FROM athletes WHERE last_name = 'Попова' AND first_name = 'Ольга' AND middle_name = 'Сергеевна' AND birth_year = 2002 LIMIT 1), 6, 61, NULL, 66.95, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 5001, '2026-04-08', 'Попова Ольга Сергеевна', 'Алтайский край', 'Алтайский край', 5001, 35),
  (5125, 5027, (SELECT id FROM athletes WHERE last_name = 'Ильясов' AND first_name = 'Какен' AND middle_name = 'Канатович' AND birth_year = 1993 LIMIT 1), 1, 148, NULL, 63.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Ильясов Какен Канатович', 'СШОР 33 г Омск', 'Омская область', 5001, 26),
  (5126, 5027, (SELECT id FROM athletes WHERE last_name = 'Кашкаров' AND first_name = 'Артур' AND middle_name = 'Анатольевич' AND birth_year = 2005 LIMIT 1), 2, 94, NULL, 62.65, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Кашкаров Артур Анатольевич', 'Спортивный клуб "АГАУ"', 'Алтайский край', 5001, 26),
  (5127, 5027, (SELECT id FROM athletes WHERE last_name = 'Абросов' AND first_name = 'Алексей' AND middle_name = 'Владимирович' AND birth_year = 1991 LIMIT 1), 3, 85, NULL, 62.85, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Абросов Алексей Владимирович', 'Динамо', 'Томская область', 5001, 26),
  (5128, 5027, (SELECT id FROM athletes WHERE last_name = 'Масленников' AND first_name = 'Максим' AND middle_name = 'Алексеевич' AND birth_year = 2003 LIMIT 1), 4, 71, NULL, 62.7, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Масленников Максим Алексеевич', '-', 'Алтайский край', 5001, 26),
  (5129, 5027, (SELECT id FROM athletes WHERE last_name = 'Крылов' AND first_name = 'Матвей' AND middle_name = 'Сергеевич' AND birth_year = 2006 LIMIT 1), 5, 63, NULL, 62.1, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Крылов Матвей Сергеевич', 'Федерация гиревого спорта Алтайского края', 'Алтайский край', 5001, 26),
  (5130, 5028, (SELECT id FROM athletes WHERE last_name = 'Морозович' AND first_name = 'Владислав' AND middle_name = 'Павлович' AND birth_year = 1999 LIMIT 1), 1, 204, NULL, 68.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Морозович Владислав Павлович', 'БУ ДО г.Омска «СШОР 33»', 'Омская область', 5001, 27),
  (5131, 5028, (SELECT id FROM athletes WHERE last_name = 'Василевич' AND first_name = 'Добрыня' AND middle_name = 'Андреевич' AND birth_year = 2000 LIMIT 1), 2, 172, NULL, 67.85, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Василевич Добрыня Андреевич', 'Республика Бурятия', 'Республика Бурятия', 5001, 27),
  (5132, 5028, (SELECT id FROM athletes WHERE last_name = 'Рыбский' AND first_name = 'Павел' AND middle_name = 'Сергеевич' AND birth_year = 2008 LIMIT 1), 3, 131, NULL, 67.95, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Рыбский Павел Сергеевич', 'ВФГС', 'Томская область', 5001, 27),
  (5133, 5028, (SELECT id FROM athletes WHERE last_name = 'Цыбаев' AND first_name = 'Илья' AND middle_name = 'Алексеевич' AND birth_year = 1999 LIMIT 1), 4, 131, NULL, 68.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Цыбаев Илья Алексеевич', 'Центр Поиск', 'Томская область', 5001, 27),
  (5134, 5028, (SELECT id FROM athletes WHERE last_name = 'Старцев' AND first_name = 'Вадим' AND middle_name = 'Андреевич' AND birth_year = 2007 LIMIT 1), 5, 115, NULL, 67.85, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Старцев Вадим Андреевич', 'ТРОО  ФГС', 'Томская область', 5001, 27),
  (5135, 5028, (SELECT id FROM athletes WHERE last_name = 'Чернышов' AND first_name = 'Владимир' AND middle_name = 'Александрович' AND birth_year = 1986 LIMIT 1), 6, 94, NULL, 66.9, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Чернышов Владимир Александрович', '-', 'Кемеровская область - Кузбасс', 5001, 27),
  (5136, 5028, (SELECT id FROM athletes WHERE last_name = 'Демьянченко' AND first_name = 'Даниил' AND middle_name = 'Сергеевич' AND birth_year = 2006 LIMIT 1), 7, 91, NULL, 66.75, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Демьянченко Даниил Сергеевич', 'Центр спорта и здоровья Омского ГАУ', 'Омская область', 5001, 27),
  (5137, 5028, (SELECT id FROM athletes WHERE last_name = 'Аникусько' AND first_name = 'Семён' AND middle_name = 'Сергеевич' AND birth_year = 2009 LIMIT 1), 8, 73, NULL, 67.75, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Аникусько Семён Сергеевич', 'ДЮСШ Кулундинского района', 'Алтайский край', 5001, 27),
  (5138, 5028, (SELECT id FROM athletes WHERE last_name = 'Соловьев' AND first_name = 'Александр' AND middle_name = 'Сергеевич' AND birth_year = 1982 LIMIT 1), 9, 41, NULL, 66.65, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Соловьев Александр Сергеевич', 'Федерация гиревого спорта г. Новокузнецка', 'Кемеровская область - Кузбасс', 5001, 27),
  (5139, 5029, (SELECT id FROM athletes WHERE last_name = 'Рассадин' AND first_name = 'Андрей' AND middle_name = 'Андреевич' AND birth_year = 1989 LIMIT 1), 1, 186, NULL, 72.75, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Рассадин Андрей Андреевич', 'МБУ ДО СШ город Улан-Удэ', 'Республика Бурятия', 5001, 28),
  (5140, 5029, (SELECT id FROM athletes WHERE last_name = 'Воронов' AND first_name = 'Иван' AND middle_name = 'Андреевич' AND birth_year = 1991 LIMIT 1), 2, 181, NULL, 72.95, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Воронов Иван Андреевич', 'ВС', 'Республика Бурятия', 5001, 28),
  (5141, 5029, (SELECT id FROM athletes WHERE last_name = 'Жибинов' AND first_name = 'Фёдор' AND middle_name = 'Васильевич' AND birth_year = 2004 LIMIT 1), 3, 167, NULL, 72.9, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Жибинов Фёдор Васильевич', 'Спортивная школа города Черногорска', 'Республика Хакасия', 5001, 28),
  (5142, 5029, (SELECT id FROM athletes WHERE last_name = 'Волдаев' AND first_name = 'Александр' AND middle_name = 'Владимирович' AND birth_year = 2000 LIMIT 1), 4, 144, NULL, 72.95, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Волдаев Александр Владимирович', 'Федерация гиревого спорта Томской области', 'Томская область', 5001, 28),
  (5143, 5029, (SELECT id FROM athletes WHERE last_name = 'Оленов' AND first_name = 'Владимир' AND middle_name = 'Владимирович' AND birth_year = 1991 LIMIT 1), 5, 143, NULL, 72.65, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Оленов Владимир Владимирович', 'Республиканский центр национальных видов спорта', 'Республика Саха (Якутия)', 5001, 28),
  (5144, 5029, (SELECT id FROM athletes WHERE last_name = 'Седых' AND first_name = 'Илья' AND middle_name = 'Александрович' AND birth_year = 2004 LIMIT 1), 6, 136, NULL, 72.15, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Седых Илья Александрович', 'БУ ДО СШОР 33', 'Омская область', 5001, 28),
  (5145, 5029, (SELECT id FROM athletes WHERE last_name = 'Любин' AND first_name = 'Валентин' AND middle_name = 'Сергеевич' AND birth_year = 2009 LIMIT 1), 7, 103, NULL, 72.4, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Любин Валентин Сергеевич', 'ДЮСШ Кулундинского  района', 'Алтайский край', 5001, 28),
  (5146, 5029, (SELECT id FROM athletes WHERE last_name = 'Никитенко' AND first_name = 'Богдан' AND middle_name = 'Юрьевич' AND birth_year = 2008 LIMIT 1), 8, 98, NULL, 72.45, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Никитенко Богдан Юрьевич', 'Спортивная школа 3', 'Республика Бурятия', 5001, 28),
  (5147, 5029, (SELECT id FROM athletes WHERE last_name = 'Климанов' AND first_name = 'Алексей' AND middle_name = 'Михайлович' AND birth_year = 1991 LIMIT 1), 9, 86, NULL, 71.75, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Климанов Алексей Михайлович', '-', 'Кемеровская область - Кузбасс', 5001, 28),
  (5148, 5029, (SELECT id FROM athletes WHERE last_name = 'Некрасов' AND first_name = 'Глеб' AND middle_name = 'Александрович' AND birth_year = 2007 LIMIT 1), 10, 60, NULL, 72.05, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Некрасов Глеб Александрович', 'Гиревой спортклуб  Династия', 'Алтайский край', 5001, 28),
  (5149, 5030, (SELECT id FROM athletes WHERE last_name = 'Зайдензал' AND first_name = 'Артём' AND middle_name = 'Николаевич' AND birth_year = 1987 LIMIT 1), 1, 196, NULL, 76.2, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Зайдензал Артём Николаевич', 'Кемеровская область', 'Кемеровская область - Кузбасс', 5001, 29),
  (5150, 5030, (SELECT id FROM athletes WHERE last_name = 'Панов' AND first_name = 'Алексей' AND middle_name = 'Анатольевич' AND birth_year = 1991 LIMIT 1), 2, 181, NULL, 76.95, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Панов Алексей Анатольевич', 'МКУ ДО "Шегарская СШ", МКУ ФСЦ "Шегарского района"', 'Томская область', 5001, 29),
  (5151, 5030, (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Евгений' AND middle_name = 'Игоревич' AND birth_year = 1987 LIMIT 1), 3, 173, NULL, 76.15, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Иванов Евгений Игоревич', 'Вс рф', 'Забайкальский край', 5001, 29),
  (5152, 5030, (SELECT id FROM athletes WHERE last_name = 'Шерин' AND first_name = 'Роман' AND middle_name = 'Витальевич' AND birth_year = 1992 LIMIT 1), 4, 153, NULL, 77.65, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Шерин Роман Витальевич', 'Кемеровская область', 'Кемеровская область - Кузбасс', 5001, 29),
  (5153, 5030, (SELECT id FROM athletes WHERE last_name = 'Каргин' AND first_name = 'Сергей' AND middle_name = 'Ярославович' AND birth_year = 1998 LIMIT 1), 5, 148, NULL, 77.4, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Каргин Сергей Ярославович', 'ЦСП', 'Республика Бурятия', 5001, 29),
  (5154, 5030, (SELECT id FROM athletes WHERE last_name = 'Филиппов' AND first_name = 'Евгений' AND middle_name = 'Борисович' AND birth_year = 1995 LIMIT 1), 6, 144, NULL, 78.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Филиппов Евгений Борисович', 'РО ООО «ВФГС» в Омской области', 'Омская область', 5001, 29),
  (5155, 5030, (SELECT id FROM athletes WHERE last_name = 'Любимский' AND first_name = 'Сергей' AND middle_name = 'Александрович' AND birth_year = 1992 LIMIT 1), 7, 138, NULL, 77.85, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Любимский Сергей Александрович', 'ВС', 'Республика Бурятия', 5001, 29),
  (5156, 5030, (SELECT id FROM athletes WHERE last_name = 'Голубятников' AND first_name = 'Виталий' AND middle_name = 'Сергеевич' AND birth_year = 1996 LIMIT 1), 8, 125, NULL, 77.8, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Голубятников Виталий Сергеевич', 'МО РФ', 'Иркутская область', 5001, 29),
  (5157, 5030, (SELECT id FROM athletes WHERE last_name = 'Тюленев' AND first_name = 'Дмитрий' AND middle_name = 'Тимофеевич' AND birth_year = 1985 LIMIT 1), 9, 122, NULL, 77.3, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Тюленев Дмитрий Тимофеевич', 'ОО Федерация гиревого спорта г.Новокузнецк', 'Кемеровская область - Кузбасс', 5001, 29),
  (5158, 5030, (SELECT id FROM athletes WHERE last_name = 'Ковалев' AND first_name = 'Константин' AND middle_name = 'Александрович' AND birth_year = 2001 LIMIT 1), 10, 119, NULL, 78.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Ковалев Константин Александрович', 'Спортивный клуб "АГАУ"', 'Алтайский край', 5001, 29),
  (5159, 5030, (SELECT id FROM athletes WHERE last_name = 'Кольмаер' AND first_name = 'Александр' AND middle_name = 'Николаевич' AND birth_year = 1982 LIMIT 1), 11, 111, NULL, 75.6, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Кольмаер Александр Николаевич', 'Федерация гиревого спорта Алтайского края', 'Алтайский край', 5001, 29),
  (5160, 5030, (SELECT id FROM athletes WHERE last_name = 'Дураченко' AND first_name = 'Игорь' AND middle_name = 'Васильевич' AND birth_year = 1993 LIMIT 1), 12, 110, NULL, 77.85, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Дураченко Игорь Васильевич', 'ВС', 'Кемеровская область - Кузбасс', 5001, 29),
  (5161, 5030, (SELECT id FROM athletes WHERE last_name = 'Васильев' AND first_name = 'Андрей' AND middle_name = 'Денисович' AND birth_year = 2005 LIMIT 1), 13, 109, NULL, 76.45, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Васильев Андрей Денисович', 'МБУ КДЮСШ им. Ал. Бессмертных', 'Кемеровская область - Кузбасс', 5001, 29),
  (5162, 5030, (SELECT id FROM athletes WHERE last_name = 'Снопов' AND first_name = 'Владимир' AND middle_name = 'Сергеевич' AND birth_year = 1995 LIMIT 1), 14, 105, NULL, 77.95, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Снопов Владимир Сергеевич', 'ВС', 'Алтайский край', 5001, 29),
  (5163, 5030, (SELECT id FROM athletes WHERE last_name = 'Рыков' AND first_name = 'Михаил' AND middle_name = 'Александрович' AND birth_year = 1996 LIMIT 1), 15, 102, NULL, 74.7, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Рыков Михаил Александрович', 'Федерация гиревого спорта Новокузнецка', 'Кемеровская область - Кузбасс', 5001, 29),
  (5164, 5030, (SELECT id FROM athletes WHERE last_name = 'Ильин' AND first_name = 'Александр' AND middle_name = 'Сергеевич' AND birth_year = 2008 LIMIT 1), 16, 85, NULL, 76.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Ильин Александр Сергеевич', 'МКУ ДО "Шегарская СШ"', 'Томская область', 5001, 29),
  (5165, 5031, (SELECT id FROM athletes WHERE last_name = 'Рысник' AND first_name = 'Сергей' AND middle_name = 'Михайлович' AND birth_year = 1995 LIMIT 1), 1, 200, NULL, 85.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Рысник Сергей Михайлович', 'СШОР №33 г. Омск', 'Омская область', 5001, 30),
  (5166, 5031, (SELECT id FROM athletes WHERE last_name = 'Черкашин' AND first_name = 'Дмитрий' AND middle_name = 'Андреевич' AND birth_year = 1999 LIMIT 1), 2, 191, NULL, 84.8, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Черкашин Дмитрий Андреевич', 'ТРОО ФГС', 'Томская область', 5001, 30),
  (5167, 5031, (SELECT id FROM athletes WHERE last_name = 'Загороднев' AND first_name = 'Максим' AND middle_name = 'Олегович' AND birth_year = 1992 LIMIT 1), 3, 179, NULL, 83.55, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Загороднев Максим Олегович', 'Динамо', 'Томская область', 5001, 30),
  (5168, 5031, (SELECT id FROM athletes WHERE last_name = 'Полибин' AND first_name = 'Михаил' AND middle_name = 'Леонидович' AND birth_year = 2004 LIMIT 1), 4, 173, NULL, 84.4, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Полибин Михаил Леонидович', 'Федерация гиревого спорта Алтайского края', 'Алтайский край', 5001, 30),
  (5169, 5031, (SELECT id FROM athletes WHERE last_name = 'Новиков' AND first_name = 'Алексей' AND middle_name = 'Романович' AND birth_year = 2005 LIMIT 1), 5, 149, NULL, 83.8, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Новиков Алексей Романович', 'ТРОО ФГС', 'Томская область', 5001, 30),
  (5170, 5031, (SELECT id FROM athletes WHERE last_name = 'Цыбигей' AND first_name = 'Виталий' AND middle_name = 'Геннадьевич' AND birth_year = 1996 LIMIT 1), 6, 143, NULL, 83.9, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Цыбигей Виталий Геннадьевич', 'КРСОО "Федерация гиревого спорта"', 'Красноярский край', 5001, 30),
  (5171, 5031, (SELECT id FROM athletes WHERE last_name = 'Фатеев' AND first_name = 'Дмитрий' AND middle_name = 'Алексеевич' AND birth_year = 2005 LIMIT 1), 7, 141, NULL, 84.3, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Фатеев Дмитрий Алексеевич', 'ТГПУ', 'Томская область', 5001, 30),
  (5172, 5031, (SELECT id FROM athletes WHERE last_name = 'Зайцев' AND first_name = 'Александр' AND middle_name = 'Алексеевич' AND birth_year = 2007 LIMIT 1), 8, 140, NULL, 84.6, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Зайцев Александр Алексеевич', 'МБУ ДО ОНОХОЙСКАЯ СШ', 'Республика Бурятия', 5001, 30),
  (5173, 5031, (SELECT id FROM athletes WHERE last_name = 'Минуллин' AND first_name = 'Марсель' AND middle_name = 'Ринатович' AND birth_year = 2000 LIMIT 1), 9, 126, NULL, 84.65, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Минуллин Марсель Ринатович', 'РО ООО «ВФГС» в Омской Области', 'Омская область', 5001, 30),
  (5174, 5031, (SELECT id FROM athletes WHERE last_name = 'Стремедловский' AND first_name = 'Виталий' AND middle_name = 'Владимирович' AND birth_year = 1991 LIMIT 1), 10, 108, NULL, 83.7, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Стремедловский Виталий Владимирович', 'КРСОО "Федерация гиревого спорта"', 'Красноярский край', 5001, 30),
  (5175, 5031, (SELECT id FROM athletes WHERE last_name = 'Лугинов' AND first_name = 'Руслан' AND middle_name = 'Русланович' AND birth_year = 1997 LIMIT 1), NULL, 0, NULL, 84.9, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Лугинов Руслан Русланович', 'Республиканский центр Национальных видов спорта', 'Республика Саха (Якутия)', 5001, 30),
  (5176, 5032, (SELECT id FROM athletes WHERE last_name = 'Симашкевич' AND first_name = 'Евгений' AND middle_name = 'Валентинович' AND birth_year = 1991 LIMIT 1), 1, 203, NULL, 112.7, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Симашкевич Евгений Валентинович', 'РО ООО «ВФГС» в Омской области', 'Омская область', 5001, 32),
  (5177, 5032, (SELECT id FROM athletes WHERE last_name = 'Шабунин' AND first_name = 'Никита' AND middle_name = 'Андреевич' AND birth_year = 2001 LIMIT 1), 2, 171, NULL, 115.15, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Шабунин Никита Андреевич', 'Газпром добыча Ноябрьск', 'Томская область', 5001, 32),
  (5178, 5032, (SELECT id FROM athletes WHERE last_name = 'Климов' AND first_name = 'Петр' AND middle_name = 'Петрович' AND birth_year = 2001 LIMIT 1), 3, 150, NULL, 102.3, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Климов Петр Петрович', 'ТРОО ФГС', 'Томская область', 5001, 32),
  (5179, 5032, (SELECT id FROM athletes WHERE last_name = 'Лесных' AND first_name = 'Павел' AND middle_name = 'Алексеевич' AND birth_year = 1977 LIMIT 1), 4, 138, NULL, 119.6, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Лесных Павел Алексеевич', 'ООФГСАК', 'Алтайский край', 5001, 32),
  (5180, 5032, (SELECT id FROM athletes WHERE last_name = 'Афанасьев' AND first_name = 'Леонид' AND middle_name = 'Александрович' AND birth_year = 1980 LIMIT 1), 5, 133, NULL, 102.9, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Афанасьев Леонид Александрович', 'Республиканский центр национальных видов спорта', 'Республика Саха (Якутия)', 5001, 32),
  (5181, 5032, (SELECT id FROM athletes WHERE last_name = 'Жибинов' AND first_name = 'Кирилл' AND middle_name = 'Васильевич' AND birth_year = 1991 LIMIT 1), 6, 122, NULL, 100.5, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Жибинов Кирилл Васильевич', 'МБУ ДО "Спортивная школа города Черногорска"', 'Республика Хакасия', 5001, 32),
  (5182, 5032, (SELECT id FROM athletes WHERE last_name = 'Плохотин' AND first_name = 'Павел' AND middle_name = 'Александрович' AND birth_year = 1999 LIMIT 1), 7, 118, NULL, 96.9, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Плохотин Павел Александрович', 'ООФГСАК', 'Алтайский край', 5001, 32),
  (5183, 5032, (SELECT id FROM athletes WHERE last_name = 'Пантюхов' AND first_name = 'Владимир' AND middle_name = 'Александрович' AND birth_year = 1987 LIMIT 1), 8, 116, NULL, 95.35, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Пантюхов Владимир Александрович', 'ВС', 'Алтайский край', 5001, 32),
  (5184, 5032, (SELECT id FROM athletes WHERE last_name = 'Гредин' AND first_name = 'Анатолий' AND middle_name = 'Алексеевич' AND birth_year = 2008 LIMIT 1), 9, 104, NULL, 108.9, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Гредин Анатолий Алексеевич', 'ВЫГС Кемеровская область', 'Кемеровская область - Кузбасс', 5001, 32),
  (5185, 5032, (SELECT id FROM athletes WHERE last_name = 'Яворский' AND first_name = 'Виктор' AND middle_name = 'Викторович' AND birth_year = 1999 LIMIT 1), 10, 70, NULL, 143.4, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Яворский Виктор Викторович', 'Спорт школа', 'Кемеровская область - Кузбасс', 5001, 32),
  (5186, 5033, (SELECT id FROM athletes WHERE last_name = 'Купш' AND first_name = 'Денис' AND middle_name = 'Аркадьевич' AND birth_year = 2004 LIMIT 1), 1, 197, NULL, 94.35, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Купш Денис Аркадьевич', 'БУ ДО г. Омска «СШОР N33»', 'Омская область', 5001, 31),
  (5187, 5033, (SELECT id FROM athletes WHERE last_name = 'Пивень' AND first_name = 'Андрей' AND middle_name = 'Владимирович' AND birth_year = 2003 LIMIT 1), 2, 195, NULL, 91.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Пивень Андрей Владимирович', 'ВС', 'Республика Бурятия', 5001, 31),
  (5188, 5033, (SELECT id FROM athletes WHERE last_name = 'Шендо' AND first_name = 'Никита' AND middle_name = 'Сергеевич' AND birth_year = 1998 LIMIT 1), 3, 194, NULL, 92.1, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Шендо Никита Сергеевич', 'КРСОО "Федерация гиревого спорта"', 'Красноярский край', 5001, 31),
  (5189, 5033, (SELECT id FROM athletes WHERE last_name = 'Кудашев' AND first_name = 'Денис' AND middle_name = 'Андреевич' AND birth_year = 1988 LIMIT 1), 4, 193, NULL, 88.75, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Кудашев Денис Андреевич', 'Онохойская Детская Юношеская спортивная школа', 'Республика Бурятия', 5001, 31),
  (5190, 5033, (SELECT id FROM athletes WHERE last_name = 'Чупин' AND first_name = 'Никита' AND middle_name = 'Владимирович' AND birth_year = 1988 LIMIT 1), 5, 169, NULL, 95.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Чупин Никита Владимирович', 'Динамо', 'Томская область', 5001, 31),
  (5191, 5033, (SELECT id FROM athletes WHERE last_name = 'Козлов' AND first_name = 'Дмитрий' AND middle_name = 'Михайлович' AND birth_year = 2000 LIMIT 1), 6, 163, NULL, 88.3, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Козлов Дмитрий Михайлович', 'ВС', 'Алтайский край', 5001, 31),
  (5192, 5033, (SELECT id FROM athletes WHERE last_name = 'Черкашин' AND first_name = 'Иван' AND middle_name = 'Андреевич' AND birth_year = 1999 LIMIT 1), 7, 160, NULL, 94.9, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Черкашин Иван Андреевич', 'ТРОО ФГС', 'Томская область', 5001, 31),
  (5193, 5033, (SELECT id FROM athletes WHERE last_name = 'Булатов' AND first_name = 'Павел' AND middle_name = 'Владимирович' AND birth_year = 1983 LIMIT 1), 8, 152, NULL, 92.2, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Булатов Павел Владимирович', 'РО ООО ВФГС в Кемеровской области', 'Кемеровская область - Кузбасс', 5001, 31),
  (5194, 5033, (SELECT id FROM athletes WHERE last_name = 'Барлетов' AND first_name = 'Евгений' AND middle_name = 'Юрьевич' AND birth_year = 1992 LIMIT 1), 9, 134, NULL, 91.4, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Барлетов Евгений Юрьевич', 'ОАО РЖД ШЧ-2', 'Иркутская область', 5001, 31),
  (5195, 5033, (SELECT id FROM athletes WHERE last_name = 'Митичкин' AND first_name = 'Александр' AND middle_name = 'Сергеевич' AND birth_year = 1987 LIMIT 1), 10, 128, NULL, 85.95, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Митичкин Александр Сергеевич', '-', 'Кемеровская область - Кузбасс', 5001, 31),
  (5196, 5033, (SELECT id FROM athletes WHERE last_name = 'Бояновский' AND first_name = 'Игорь' AND middle_name = 'Евгеньевич' AND birth_year = 1987 LIMIT 1), 11, 110, NULL, 86.85, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Бояновский Игорь Евгеньевич', 'Спортклуб «Ермак»', 'Кемеровская область - Кузбасс', 5001, 31),
  (5197, 5033, (SELECT id FROM athletes WHERE last_name = 'Уманец' AND first_name = 'Роман' AND middle_name = 'Николаевич' AND birth_year = 1987 LIMIT 1), 12, 92, NULL, 90.8, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Уманец Роман Николаевич', 'СК "Сибиряк"', 'Алтайский край', 5001, 31),
  (5198, 5033, (SELECT id FROM athletes WHERE last_name = 'Филиппов' AND first_name = 'Роман' AND middle_name = 'Юрьевич' AND birth_year = 2009 LIMIT 1), 13, 75, NULL, 91.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Филиппов Роман Юрьевич', 'ДЮСШ Кулундинского района', 'Алтайский край', 5001, 31),
  (5199, 5033, (SELECT id FROM athletes WHERE last_name = 'Буриков' AND first_name = 'Роман' AND middle_name = 'Александрович' AND birth_year = 2002 LIMIT 1), 14, 70, NULL, 95.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Буриков Роман Александрович', 'Сибиряк', 'Алтайский край', 5001, 31),
  (5200, 5033, (SELECT id FROM athletes WHERE last_name = 'Рогонов' AND first_name = 'Павел' AND middle_name = 'Владимирович' AND birth_year = 1969 LIMIT 1), NULL, NULL, NULL, NULL, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 5001, '2026-04-08', 'Рогонов Павел Владимирович', 'ВФГС в городе Кемерово', 'Кемеровская область - Кузбасс', 5001, 31);

INSERT INTO result_reps (id, result_id, exercise, hand, reps) VALUES
  (5001, 5001, 'jerk', 'both', 30),
  (5002, 5002, 'jerk', 'both', 25),
  (5003, 5003, 'jerk', 'both', 42),
  (5004, 5004, 'jerk', 'both', 30),
  (5005, 5005, 'jerk', 'both', 25),
  (5006, 5006, 'jerk', 'both', 4),
  (5007, 5007, 'jerk', 'both', 86),
  (5008, 5008, 'jerk', 'both', 79),
  (5009, 5009, 'jerk', 'both', 3),
  (5010, 5010, 'jerk', 'both', 52),
  (5011, 5011, 'jerk', 'both', 2),
  (5012, 5012, 'jerk', 'both', 93),
  (5013, 5013, 'jerk', 'both', 52),
  (5014, 5014, 'jerk', 'both', 47),
  (5015, 5015, 'jerk', 'both', 30),
  (5016, 5016, 'jerk', 'both', 14),
  (5017, 5017, 'jerk', 'both', 104),
  (5018, 5018, 'jerk', 'both', 102),
  (5019, 5019, 'jerk', 'both', 78),
  (5020, 5020, 'jerk', 'both', 72),
  (5021, 5021, 'jerk', 'both', 53),
  (5022, 5022, 'jerk', 'both', 125),
  (5023, 5023, 'jerk', 'both', 120),
  (5024, 5024, 'jerk', 'both', 117),
  (5025, 5025, 'jerk', 'both', 101),
  (5026, 5026, 'jerk', 'both', 97),
  (5027, 5027, 'jerk', 'both', 88),
  (5028, 5028, 'jerk', 'both', 78),
  (5029, 5029, 'jerk', 'both', 57),
  (5030, 5030, 'jerk', 'both', 55),
  (5031, 5031, 'jerk', 'both', 50),
  (5032, 5032, 'jerk', 'both', 120),
  (5033, 5033, 'jerk', 'both', 91),
  (5034, 5034, 'jerk', 'both', 86),
  (5035, 5035, 'jerk', 'both', 76),
  (5036, 5036, 'jerk', 'both', 73),
  (5037, 5037, 'jerk', 'both', 66),
  (5038, 5038, 'jerk', 'both', 58),
  (5039, 5039, 'jerk', 'both', 57),
  (5040, 5040, 'jerk', 'both', 140),
  (5041, 5041, 'jerk', 'both', 125),
  (5042, 5042, 'jerk', 'both', 100),
  (5043, 5043, 'jerk', 'both', 84),
  (5044, 5044, 'jerk', 'both', 72),
  (5045, 5045, 'jerk', 'both', 85),
  (5046, 5046, 'jerk', 'both', 48),
  (5047, 5047, 'jerk', 'both', 41),
  (5048, 5048, 'jerk', 'both', 40),
  (5049, 5049, 'jerk', 'both', 123),
  (5050, 5050, 'jerk', 'both', 121),
  (5051, 5051, 'jerk', 'both', 114),
  (5052, 5052, 'jerk', 'both', 92),
  (5053, 5053, 'jerk', 'both', 80),
  (5054, 5054, 'long_cycle', 'both', 21),
  (5055, 5055, 'long_cycle', 'both', 20),
  (5056, 5056, 'long_cycle', 'both', 42),
  (5057, 5057, 'long_cycle', 'both', 27),
  (5058, 5058, 'long_cycle', 'both', 16),
  (5059, 5059, 'long_cycle', 'both', 60),
  (5060, 5060, 'long_cycle', 'both', 55),
  (5061, 5063, 'long_cycle', 'both', 47),
  (5062, 5064, 'long_cycle', 'both', 44),
  (5063, 5065, 'long_cycle', 'both', 44),
  (5064, 5066, 'long_cycle', 'both', 37),
  (5065, 5067, 'long_cycle', 'both', 12),
  (5066, 5068, 'long_cycle', 'both', 52),
  (5067, 5069, 'long_cycle', 'both', 51),
  (5068, 5070, 'long_cycle', 'both', 38),
  (5069, 5071, 'long_cycle', 'both', 67),
  (5070, 5072, 'long_cycle', 'both', 66),
  (5071, 5073, 'long_cycle', 'both', 61),
  (5072, 5074, 'long_cycle', 'both', 54),
  (5073, 5075, 'long_cycle', 'both', 47),
  (5074, 5076, 'long_cycle', 'both', 31),
  (5075, 5077, 'long_cycle', 'both', 72),
  (5076, 5078, 'long_cycle', 'both', 69),
  (5077, 5079, 'long_cycle', 'both', 61),
  (5078, 5080, 'long_cycle', 'both', 52),
  (5079, 5081, 'long_cycle', 'both', 50),
  (5080, 5082, 'long_cycle', 'both', 45),
  (5081, 5083, 'long_cycle', 'both', 33),
  (5082, 5084, 'long_cycle', 'both', 32),
  (5083, 5085, 'long_cycle', 'both', 85),
  (5084, 5086, 'long_cycle', 'both', 78),
  (5085, 5087, 'long_cycle', 'both', 70),
  (5086, 5088, 'long_cycle', 'both', 65),
  (5087, 5089, 'long_cycle', 'both', 60),
  (5088, 5090, 'long_cycle', 'both', 32),
  (5089, 5091, 'long_cycle', 'both', 98),
  (5090, 5092, 'long_cycle', 'both', 93),
  (5091, 5093, 'long_cycle', 'both', 22),
  (5092, 5094, 'long_cycle', 'both', 81),
  (5093, 5095, 'long_cycle', 'both', 71),
  (5094, 5096, 'long_cycle', 'both', 61),
  (5095, 5097, 'long_cycle', 'both', 57),
  (5096, 5098, 'long_cycle', 'both', 42),
  (5097, 5099, 'snatch', 'both', 176),
  (5098, 5100, 'snatch', 'both', 95),
  (5099, 5101, 'snatch', 'both', 86),
  (5100, 5102, 'snatch', 'both', 69),
  (5101, 5103, 'snatch', 'both', 66),
  (5102, 5104, 'snatch', 'both', 107),
  (5103, 5105, 'snatch', 'both', 76),
  (5104, 5106, 'snatch', 'both', 73),
  (5105, 5107, 'snatch', 'both', 60),
  (5106, 5108, 'snatch', 'both', 175),
  (5107, 5109, 'snatch', 'both', 153),
  (5108, 5110, 'snatch', 'both', 148),
  (5109, 5111, 'snatch', 'both', 114),
  (5110, 5112, 'snatch', 'both', 100),
  (5111, 5113, 'snatch', 'both', 97),
  (5112, 5114, 'snatch', 'both', 90),
  (5113, 5115, 'snatch', 'both', 89),
  (5114, 5116, 'snatch', 'both', 87),
  (5115, 5117, 'snatch', 'both', 70),
  (5116, 5118, 'snatch', 'both', 63),
  (5117, 5119, 'snatch', 'both', 190),
  (5118, 5120, 'snatch', 'both', 170),
  (5119, 5121, 'snatch', 'both', 135),
  (5120, 5122, 'snatch', 'both', 87),
  (5121, 5123, 'snatch', 'both', 86),
  (5122, 5124, 'snatch', 'both', 61),
  (5123, 5125, 'snatch', 'both', 148),
  (5124, 5126, 'snatch', 'both', 94),
  (5125, 5127, 'snatch', 'both', 85),
  (5126, 5128, 'snatch', 'both', 71),
  (5127, 5129, 'snatch', 'both', 63),
  (5128, 5130, 'snatch', 'both', 204),
  (5129, 5131, 'snatch', 'both', 172),
  (5130, 5132, 'snatch', 'both', 131),
  (5131, 5133, 'snatch', 'both', 131),
  (5132, 5134, 'snatch', 'both', 115),
  (5133, 5135, 'snatch', 'both', 94),
  (5134, 5136, 'snatch', 'both', 91),
  (5135, 5137, 'snatch', 'both', 73),
  (5136, 5138, 'snatch', 'both', 41),
  (5137, 5139, 'snatch', 'both', 186),
  (5138, 5140, 'snatch', 'both', 181),
  (5139, 5141, 'snatch', 'both', 167),
  (5140, 5142, 'snatch', 'both', 144),
  (5141, 5143, 'snatch', 'both', 143),
  (5142, 5144, 'snatch', 'both', 136),
  (5143, 5145, 'snatch', 'both', 103),
  (5144, 5146, 'snatch', 'both', 98),
  (5145, 5147, 'snatch', 'both', 86),
  (5146, 5148, 'snatch', 'both', 60),
  (5147, 5149, 'snatch', 'both', 196),
  (5148, 5150, 'snatch', 'both', 181),
  (5149, 5151, 'snatch', 'both', 173),
  (5150, 5152, 'snatch', 'both', 153),
  (5151, 5153, 'snatch', 'both', 148),
  (5152, 5154, 'snatch', 'both', 144),
  (5153, 5155, 'snatch', 'both', 138),
  (5154, 5156, 'snatch', 'both', 125),
  (5155, 5157, 'snatch', 'both', 122),
  (5156, 5158, 'snatch', 'both', 119),
  (5157, 5159, 'snatch', 'both', 111),
  (5158, 5160, 'snatch', 'both', 110),
  (5159, 5161, 'snatch', 'both', 109),
  (5160, 5162, 'snatch', 'both', 105),
  (5161, 5163, 'snatch', 'both', 102),
  (5162, 5164, 'snatch', 'both', 85),
  (5163, 5165, 'snatch', 'both', 200),
  (5164, 5166, 'snatch', 'both', 191),
  (5165, 5167, 'snatch', 'both', 179),
  (5166, 5168, 'snatch', 'both', 173),
  (5167, 5169, 'snatch', 'both', 149),
  (5168, 5170, 'snatch', 'both', 143),
  (5169, 5171, 'snatch', 'both', 141),
  (5170, 5172, 'snatch', 'both', 140),
  (5171, 5173, 'snatch', 'both', 126),
  (5172, 5174, 'snatch', 'both', 108),
  (5173, 5175, 'snatch', 'both', 0),
  (5174, 5176, 'snatch', 'both', 203),
  (5175, 5177, 'snatch', 'both', 171),
  (5176, 5178, 'snatch', 'both', 150),
  (5177, 5179, 'snatch', 'both', 138),
  (5178, 5180, 'snatch', 'both', 133),
  (5179, 5181, 'snatch', 'both', 122),
  (5180, 5182, 'snatch', 'both', 118),
  (5181, 5183, 'snatch', 'both', 116),
  (5182, 5184, 'snatch', 'both', 104),
  (5183, 5185, 'snatch', 'both', 70),
  (5184, 5186, 'snatch', 'both', 197),
  (5185, 5187, 'snatch', 'both', 195),
  (5186, 5188, 'snatch', 'both', 194),
  (5187, 5189, 'snatch', 'both', 193),
  (5188, 5190, 'snatch', 'both', 169),
  (5189, 5191, 'snatch', 'both', 163),
  (5190, 5192, 'snatch', 'both', 160),
  (5191, 5193, 'snatch', 'both', 152),
  (5192, 5194, 'snatch', 'both', 134),
  (5193, 5195, 'snatch', 'both', 128),
  (5194, 5196, 'snatch', 'both', 110),
  (5195, 5197, 'snatch', 'both', 92),
  (5196, 5198, 'snatch', 'both', 75),
  (5197, 5199, 'snatch', 'both', 70);

