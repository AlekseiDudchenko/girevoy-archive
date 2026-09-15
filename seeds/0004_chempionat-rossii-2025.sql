-- Чемпионат России 2025, Казань, 2025-06-12—2025-06-16.
-- Сгенерировано scripts/gen_seed.py из data/chempionat-rossii-2025.json, не править руками.
-- Страницы в PDF лежат боком, распознаются после поворота. Оцифрован толчок ДЦ (мужчины) 63 кг, страница 38. Эстафеты и командный зачёт по просьбе администратора не извлекаются, жонглирование (страницы 5-8) в схему не укладывается — дисциплины такой нет.
-- Данные извлечены из скана протокола моделью; сверка человеком не проводилась,
-- поэтому results.verified_by остаётся пустым (FR-A14).

INSERT OR IGNORE INTO regions (name, country) VALUES
  ('Новосибирская область', 'RU'),
  ('Республика Бурятия', 'RU'),
  ('г. Санкт-Петербург', 'RU'),
  ('Калужская область', 'RU'),
  ('Смоленская область', 'RU'),
  ('Пермский край', 'RU'),
  ('Тюменская область', 'RU'),
  ('Ханты-Мансийский АО - Югра', 'RU'),
  ('Омская область', 'RU'),
  ('Рязанская область', 'RU'),
  ('Краснодарский край', 'RU'),
  ('Республика Саха (Якутия)', 'RU'),
  ('Белгородская область', 'RU'),
  ('Кировская область', 'RU'),
  ('Томская область', 'RU'),
  ('Курганская область', 'RU'),
  ('г. Москва', 'RU'),
  ('Челябинская область', 'RU'),
  ('Ямало-Ненецкий автономный округ', 'RU'),
  ('Оренбургская область', 'RU'),
  ('Республика Татарстан', 'RU'),
  ('Владимирская область', 'RU'),
  ('Ростовская область', 'RU'),
  ('Вологодская область', 'RU'),
  ('Брянская область', 'RU'),
  ('Чувашская Республика', 'RU');

INSERT OR IGNORE INTO clubs (name, region_id) VALUES
  ('МУ ДО "МЦРФКиС"', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')),
  ('ВС', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')),
  ('-', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')),
  ('СПБ ГБУ ДО СШОРСВС им. В.Ф.', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')),
  ('СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')),
  ('СШОР МАРШАЛ', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')),
  ('МБУДО КСШ №1', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')),
  ('МАУ ДО СШ «Прикамье» г. Перми', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')),
  ('Дюц "Старт"', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')),
  ('МБУ ДО СШОР «Югория» им. А.А. Пилояна', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')),
  ('СШОР 33', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')),
  ('Маршал', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')),
  ('СШОР " Маршал"', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')),
  ('РВВДКУ-Рязань', (SELECT id FROM regions WHERE name = 'Рязанская область' AND country = 'RU')),
  ('СШ№2', (SELECT id FROM regions WHERE name = 'Краснодарский край' AND country = 'RU')),
  ('Федерация гиревого спорта Саха Якутия', (SELECT id FROM regions WHERE name = 'Республика Саха (Якутия)' AND country = 'RU')),
  ('СШОР "Маршал"', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')),
  ('дюц "Старт"', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')),
  ('СШОР 5 г Белгород', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')),
  ('КОГАУ «СШОР «Юность»', (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU')),
  ('Федерация гиревого спорта Томской', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')),
  ('Динамо', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')),
  ('ГБУ ДО МКСШОР "ЗАПАД"', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')),
  ('РОООО ВФГС в Челябинской области', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')),
  ('МБУ ДО СШ "Зенит"', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')),
  ('Вс рф', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')),
  ('СШ №1 им. Л.Д. Ковалевского', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')),
  ('РОО ФГС РТ', (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU')),
  ('ГБУ ДО МКСШОР « Запад» Отделение «Семёрка»', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')),
  ('ООО "ВФГС в Курганской области"', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')),
  ('Владимирская область', (SELECT id FROM regions WHERE name = 'Владимирская область' AND country = 'RU')),
  ('ОГАУ ДО СШОР', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')),
  ('Армия России', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')),
  ('Курганская область', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')),
  ('РСОО "ФГС РО"', (SELECT id FROM regions WHERE name = 'Ростовская область' AND country = 'RU')),
  ('СШОР "Маршал"0', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')),
  ('-', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')),
  ('РО ООО ВФГС в Челябинской области', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')),
  ('ГБУ ДО МКСШОР «Запад» Отделение', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')),
  ('СШОР №3', (SELECT id FROM regions WHERE name = 'Вологодская область' AND country = 'RU')),
  ('ОГАУДО Томская областная СШОР', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')),
  ('МУ ДО"МЦРФКиС"', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')),
  ('СШОР по борьбе', (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU')),
  ('СШ Энергия', (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU')),
  ('-', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')),
  ('МБУ ДО СШ "Уренгоец"', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'));

INSERT OR IGNORE INTO federations (name, short_name, country) VALUES
  ('Всероссийская федерация гиревого спорта', 'ВФГС', 'RU');

INSERT INTO competitions (id, slug, name, date_start, date_end, city, country, competition_rank_id, federation_id, source_url, is_published) VALUES
  (1001, 'chempionat-rossii-2025', 'Чемпионат России 2025', '2025-06-12', '2025-06-16', 'Казань', 'RU', (SELECT id FROM competition_ranks WHERE code = 'national_ch'), (SELECT id FROM federations WHERE name = 'Всероссийская федерация гиревого спорта'), NULL, 1);

INSERT INTO protocols (id, competition_id, r2_key, filename, page_count, is_scan, status, published_at) VALUES
  (1001, 1001, 'protocols/chempionat-rossii-2025.pdf', 'protokol-chempionat-rossii-2025.pdf', 45, 1, 'published', '2025-06-12');

INSERT INTO categories (id, competition_id, discipline_id, sex, age_group_id, division_id, bell_kg, hands, time_limit_min, weight_class_raw, weight_class_kg, weight_class_is_open, participants_declared, is_deferred, sort_order) VALUES
  (1001, 1001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '63', 63, 0, 10, 0, 1),
  (1002, 1001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '68', 68, 0, 9, 0, 2),
  (1003, 1001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '73', 73, 0, 16, 0, 3),
  (1004, 1001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '78', 78, 0, 9, 0, 4),
  (1005, 1001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '85', 85, 0, 9, 0, 5),
  (1006, 1001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '95', 95, 0, 14, 0, 6);

-- Спортсмен заводится, только если его ещё нет: тот же человек на другом
-- турнире — та же строка athletes, иначе карточка и график разъедутся надвое.
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бутенко', 'Евгений', 'Александрович', 1995, 'm', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МУ ДО "МЦРФКиС"' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Бутенко А.А.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бутенко' AND a.first_name = 'Евгений' AND a.middle_name = 'Александрович' AND a.birth_year = 1995);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Якушев', 'Роман', 'Владимирович', 2002, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Любимский С.А., Коломин Д.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Якушев' AND a.first_name = 'Роман' AND a.middle_name = 'Владимирович' AND a.birth_year = 2002);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Руднев', 'Руслан', 'Сергеевич', 1994, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Руднев С.Л.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Руднев' AND a.first_name = 'Руслан' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1994);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Жбанов', 'Алексей', 'Александрович', 1986, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф.' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Барков А.П.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Жбанов' AND a.first_name = 'Алексей' AND a.middle_name = 'Александрович' AND a.birth_year = 1986);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Иванов', 'Кирилл', 'Михайлович', 2009, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф.' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Резонов А.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Иванов' AND a.first_name = 'Кирилл' AND a.middle_name = 'Михайлович' AND a.birth_year = 2009);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Смагулов', 'Нурсултан', 'Шайзандинович', 1999, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Катаев И.В.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Смагулов' AND a.first_name = 'Нурсултан' AND a.middle_name = 'Шайзандинович' AND a.birth_year = 1999);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Горячев', 'Ярослав', 'Алексеевич', 2010, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР МАРШАЛ' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Барбакова Н.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Горячев' AND a.first_name = 'Ярослав' AND a.middle_name = 'Алексеевич' AND a.birth_year = 2010);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Цвик', 'Данил', 'Александрович', 2003, 'm', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУДО КСШ №1' AND region_id = (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')), 'Сергеев С.В., Леонов С.Т.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Цвик' AND a.first_name = 'Данил' AND a.middle_name = 'Александрович' AND a.birth_year = 2003);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Сиразетдинов', 'Данил', 'Ильфатович', 2007, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШ «Прикамье» г. Перми' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Мошев Д.И., Ческис О.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Сиразетдинов' AND a.first_name = 'Данил' AND a.middle_name = 'Ильфатович' AND a.birth_year = 2007);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Новиков', 'Кирилл', 'Вадимович', 2004, 'm', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Дюц "Старт"' AND region_id = (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')), 'Бобров В.С.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Новиков' AND a.first_name = 'Кирилл' AND a.middle_name = 'Вадимович' AND a.birth_year = 2004);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Рябков', 'Алексей', 'Игоревич', 1993, 'm', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР «Югория» им. А.А. Пилояна' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Шпартко М.А., Алтухов Д.В.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Рябков' AND a.first_name = 'Алексей' AND a.middle_name = 'Игоревич' AND a.birth_year = 1993);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Морозович', 'Владислав', 'Павлович', 1999, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР 33' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Сагандыков К.К.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Морозович' AND a.first_name = 'Владислав' AND a.middle_name = 'Павлович' AND a.birth_year = 1999);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Шаров', 'Максим', 'Игоревич', 2000, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Маршал' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Трофимов М.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Шаров' AND a.first_name = 'Максим' AND a.middle_name = 'Игоревич' AND a.birth_year = 2000);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Трофимов', 'Тимур', 'Михайлович', 2011, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР " Маршал"' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Пянко И.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Трофимов' AND a.first_name = 'Тимур' AND a.middle_name = 'Михайлович' AND a.birth_year = 2011);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Березовский', 'Марк', 'Андреевич', 2003, 'm', (SELECT id FROM regions WHERE name = 'Рязанская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РВВДКУ-Рязань' AND region_id = (SELECT id FROM regions WHERE name = 'Рязанская область' AND country = 'RU')), 'Гладышев М.А., Ванин В.В., Дубинин М.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Березовский' AND a.first_name = 'Марк' AND a.middle_name = 'Андреевич' AND a.birth_year = 2003);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Волков', 'Даниил', 'Игоревич', 2003, 'm', (SELECT id FROM regions WHERE name = 'Краснодарский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ№2' AND region_id = (SELECT id FROM regions WHERE name = 'Краснодарский край' AND country = 'RU')), 'Танаев Ю.М.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Волков' AND a.first_name = 'Даниил' AND a.middle_name = 'Игоревич' AND a.birth_year = 2003);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Рожин', 'Егор', 'Иннокентьевич', 1987, 'm', (SELECT id FROM regions WHERE name = 'Республика Саха (Якутия)' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Федерация гиревого спорта Саха Якутия' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Саха (Якутия)' AND country = 'RU')), 'Кардашевский Н.С.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Рожин' AND a.first_name = 'Егор' AND a.middle_name = 'Иннокентьевич' AND a.birth_year = 1987);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Хамидов', 'Фахриддин', 'Фарход Угли', 2002, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Маршал"' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Барбакова Н.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Хамидов' AND a.first_name = 'Фахриддин' AND a.middle_name = 'Фарход Угли' AND a.birth_year = 2002);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Леонов', 'Дмитрий', 'Алексеевич', 2003, 'm', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'дюц "Старт"' AND region_id = (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')), 'Бобров В.С., Санатин Д.С.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Леонов' AND a.first_name = 'Дмитрий' AND a.middle_name = 'Алексеевич' AND a.birth_year = 2003);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Беляев', 'Иван', 'Сергеевич', 1992, 'm', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР «Югория» им. А.А. Пилояна' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Шпартко М.А., Власов А.П., Меркулин С.В.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Беляев' AND a.first_name = 'Иван' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1992);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Каргин', 'Сергей', 'Ярославович', 1998, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Рассадин А.А., Каргин Я.Л., Леонов С.Т.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Каргин' AND a.first_name = 'Сергей' AND a.middle_name = 'Ярославович' AND a.birth_year = 1998);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Фомин', 'Фёдор', 'Алексеевич', 2004, 'm', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР 5 г Белгород' AND region_id = (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')), 'Меркулин С.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Фомин' AND a.first_name = 'Фёдор' AND a.middle_name = 'Алексеевич' AND a.birth_year = 2004);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Новоселов', 'Андрей', 'Евгеньевич', 2004, 'm', (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КОГАУ «СШОР «Юность»' AND region_id = (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU')), 'Малков Е.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Новоселов' AND a.first_name = 'Андрей' AND a.middle_name = 'Евгеньевич' AND a.birth_year = 2004);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Коломин', 'Дмитрий', 'Андреевич', 1999, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Рассадин А.А., Хлебодаров А.Г., Леонов С.Т.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Коломин' AND a.first_name = 'Дмитрий' AND a.middle_name = 'Андреевич' AND a.birth_year = 1999);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Волдаев', 'Александр', 'Владимирович', 2000, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Федерация гиревого спорта Томской' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Ажермачев А.Б.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Волдаев' AND a.first_name = 'Александр' AND a.middle_name = 'Владимирович' AND a.birth_year = 2000);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Баландин', 'Андрей', 'Александрович', 1996, 'm', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Динамо' AND region_id = (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')), 'Стрекаловских С.К.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Баландин' AND a.first_name = 'Андрей' AND a.middle_name = 'Александрович' AND a.birth_year = 1996);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Багров', 'Максим', 'Дмитриевич', 2009, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ГБУ ДО МКСШОР "ЗАПАД"' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Ландин А.Ю., Соловьёв А.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Багров' AND a.first_name = 'Максим' AND a.middle_name = 'Дмитриевич' AND a.birth_year = 2009);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Семенов', 'Никита', 'Андреевич', 1993, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РОООО ВФГС в Челябинской области' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Симушин А.М.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Семенов' AND a.first_name = 'Никита' AND a.middle_name = 'Андреевич' AND a.birth_year = 1993);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Рамазанов', 'Вадим', 'Русланович', 2007, 'm', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ "Зенит"' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Латыпов Е.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Рамазанов' AND a.first_name = 'Вадим' AND a.middle_name = 'Русланович' AND a.birth_year = 2007);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Иванов', 'Евгений', 'Игоревич', 1987, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Вс рф' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Ажермачев А.Б., Трофимов М.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Иванов' AND a.first_name = 'Евгений' AND a.middle_name = 'Игоревич' AND a.birth_year = 1987);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Сергеев', 'Александр', 'Сергеевич', 1991, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Маршал"' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Трофимов М.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Сергеев' AND a.first_name = 'Александр' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1991);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Шамкаев', 'Радик', 'Мусаевич', 1990, 'm', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ №1 им. Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Лавринов В.А., Фунтиков Н.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Шамкаев' AND a.first_name = 'Радик' AND a.middle_name = 'Мусаевич' AND a.birth_year = 1990);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Перминов', 'Максим', 'Васильевич', 1994, 'm', (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КОГАУ «СШОР «Юность»' AND region_id = (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU')), 'Малков Е.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Перминов' AND a.first_name = 'Максим' AND a.middle_name = 'Васильевич' AND a.birth_year = 1994);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Васин', 'Артём', 'Иванович', 2007, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Маршал"' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Пянко И.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Васин' AND a.first_name = 'Артём' AND a.middle_name = 'Иванович' AND a.birth_year = 2007);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Оленов', 'Владимир', 'Владимирович', 1991, 'm', (SELECT id FROM regions WHERE name = 'Республика Саха (Якутия)' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Федерация гиревого спорта Саха Якутия' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Саха (Якутия)' AND country = 'RU')), 'Дьячковский В.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Оленов' AND a.first_name = 'Владимир' AND a.middle_name = 'Владимирович' AND a.birth_year = 1991);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Молчанов', 'Дианисий', 'Николаевич', 2005, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Катаев И.В., Бирюков С.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Молчанов' AND a.first_name = 'Дианисий' AND a.middle_name = 'Николаевич' AND a.birth_year = 2005);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Сарсембаев', 'Ильяс', 'Асхатович', 1999, 'm', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ "Зенит"' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Латыпов Е.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Сарсембаев' AND a.first_name = 'Ильяс' AND a.middle_name = 'Асхатович' AND a.birth_year = 1999);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ляукин', 'Кирилл', 'Сергеевич', 1999, 'm', (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РОО ФГС РТ' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU')), 'Низамова А.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ляукин' AND a.first_name = 'Кирилл' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1999);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Астахов', 'Евгений', 'Михайлович', 2002, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ГБУ ДО МКСШОР « Запад» Отделение «Семёрка»' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Ландин А.Ю., Турищев Д.В., Ромашин Ю.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Астахов' AND a.first_name = 'Евгений' AND a.middle_name = 'Михайлович' AND a.birth_year = 2002);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Любимский', 'Сергей', 'Александрович', 1992, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Трофимов М.А., Блохин И.А., Леонов С.Т.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Любимский' AND a.first_name = 'Сергей' AND a.middle_name = 'Александрович' AND a.birth_year = 1992);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Порцев', 'Роман', 'Геннадьевич', 1987, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШ «Прикамье» г. Перми' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Мошев Д.И., Хвостов А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Порцев' AND a.first_name = 'Роман' AND a.middle_name = 'Геннадьевич' AND a.birth_year = 1987);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Дубель', 'Алексей', 'Викторович', 1990, 'm', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ООО "ВФГС в Курганской области"' AND region_id = (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')), 'Стрекаловских С.К.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Дубель' AND a.first_name = 'Алексей' AND a.middle_name = 'Викторович' AND a.birth_year = 1990);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Остриков', 'Максим', 'Витальевич', 2005, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Маршал"' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Пянко И.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Остриков' AND a.first_name = 'Максим' AND a.middle_name = 'Витальевич' AND a.birth_year = 2005);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Савинов', 'Андрей', 'Вячеславович', 1984, 'm', (SELECT id FROM regions WHERE name = 'Владимирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Владимирская область' AND region_id = (SELECT id FROM regions WHERE name = 'Владимирская область' AND country = 'RU')), 'Пономарев Д.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Савинов' AND a.first_name = 'Андрей' AND a.middle_name = 'Вячеславович' AND a.birth_year = 1984);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Чуев', 'Павел', 'Владимирович', 1997, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Кириллов С.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Чуев' AND a.first_name = 'Павел' AND a.middle_name = 'Владимирович' AND a.birth_year = 1997);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Черкашин', 'Дмитрий', 'Андреевич', 1999, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ОГАУ ДО СШОР' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Тимофеев Н.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Черкашин' AND a.first_name = 'Дмитрий' AND a.middle_name = 'Андреевич' AND a.birth_year = 1999);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Рысник', 'Сергей', 'Михайлович', 1995, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Армия России' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Елисеев В.С., Переверзев Н.И.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Рысник' AND a.first_name = 'Сергей' AND a.middle_name = 'Михайлович' AND a.birth_year = 1995);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Самочернов', 'Иван', 'Николаевич', 1998, 'm', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Курганская область' AND region_id = (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')), 'Стрекаловских С.К.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Самочернов' AND a.first_name = 'Иван' AND a.middle_name = 'Николаевич' AND a.birth_year = 1998);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Косухин', 'Владислав', 'Владимирович', 2004, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Дубровин Д.А., Бирюков С.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Косухин' AND a.first_name = 'Владислав' AND a.middle_name = 'Владимирович' AND a.birth_year = 2004);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Акульшин', 'Алексей', 'Сергеевич', 1994, 'm', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ №1 им. Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Лавринов В.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Акульшин' AND a.first_name = 'Алексей' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1994);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Пешков', 'Виталий', 'Юрьевич', 1998, 'm', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ №1 им. Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Лавринов В.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Пешков' AND a.first_name = 'Виталий' AND a.middle_name = 'Юрьевич' AND a.birth_year = 1998);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Шматко', 'Давид', 'Андреевич', 2001, 'm', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР 5 г Белгород' AND region_id = (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')), 'Вильган А.П.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Шматко' AND a.first_name = 'Давид' AND a.middle_name = 'Андреевич' AND a.birth_year = 2001);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Лопин', 'Илья', 'Сергеевич', 2005, 'm', (SELECT id FROM regions WHERE name = 'Ростовская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РСОО "ФГС РО"' AND region_id = (SELECT id FROM regions WHERE name = 'Ростовская область' AND country = 'RU')), 'Пестов В.М.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Лопин' AND a.first_name = 'Илья' AND a.middle_name = 'Сергеевич' AND a.birth_year = 2005);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кулаков', 'Иван', 'Иванович', 1998, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Маршал"0' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Трофимов М.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кулаков' AND a.first_name = 'Иван' AND a.middle_name = 'Иванович' AND a.birth_year = 1998);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кирюхин', 'Роман', 'Александрович', 1997, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Соловьев А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кирюхин' AND a.first_name = 'Роман' AND a.middle_name = 'Александрович' AND a.birth_year = 1997);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Селиверстов', 'Семен', 'Васильевич', 1989, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО ВФГС в Челябинской области' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Нестеренко Д.В., Ташланов И.С.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Селиверстов' AND a.first_name = 'Семен' AND a.middle_name = 'Васильевич' AND a.birth_year = 1989);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Турищев', 'Дмитрий', 'Владимирович', 1992, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ГБУ ДО МКСШОР «Запад» Отделение' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Ландин А.Ю., Бирюков А.С., Винтовкин Н.В.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Турищев' AND a.first_name = 'Дмитрий' AND a.middle_name = 'Владимирович' AND a.birth_year = 1992);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Николаев', 'Аркадий', 'Анатольевич', 2002, 'm', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР «Югория» им. А.А. Пилояна' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Шпартко М.А., Рябков А.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Николаев' AND a.first_name = 'Аркадий' AND a.middle_name = 'Анатольевич' AND a.birth_year = 2002);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Лебедев', 'Дмитрий', 'Николаевич', 2008, 'm', (SELECT id FROM regions WHERE name = 'Вологодская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР №3' AND region_id = (SELECT id FROM regions WHERE name = 'Вологодская область' AND country = 'RU')), 'Шемякин О.Л.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Лебедев' AND a.first_name = 'Дмитрий' AND a.middle_name = 'Николаевич' AND a.birth_year = 2008);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Черкашин', 'Иван', 'Андреевич', 1999, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ОГАУДО Томская областная СШОР' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Тимофеев Н.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Черкашин' AND a.first_name = 'Иван' AND a.middle_name = 'Андреевич' AND a.birth_year = 1999);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Захаров', 'Андрей', 'Валентинович', 1993, 'm', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МУ ДО"МЦРФКиС"' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Петухов А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Захаров' AND a.first_name = 'Андрей' AND a.middle_name = 'Валентинович' AND a.birth_year = 1993);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Мухитов', 'Андрей', 'Вячеславович', 1999, 'm', (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР по борьбе' AND region_id = (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU')), 'Гомонов В.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Мухитов' AND a.first_name = 'Андрей' AND a.middle_name = 'Вячеславович' AND a.birth_year = 1999);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Михайлов', 'Денис', 'Витальевич', 1987, 'm', (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ Энергия' AND region_id = (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU')), 'Родин Е.А., Глинкин Б.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Михайлов' AND a.first_name = 'Денис' AND a.middle_name = 'Витальевич' AND a.birth_year = 1987);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кудашев', 'Денис', 'Андреевич', 1988, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Леонов С.Т.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кудашев' AND a.first_name = 'Денис' AND a.middle_name = 'Андреевич' AND a.birth_year = 1988);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Дубков', 'Артём', 'Александрович', 1994, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Елисеев В.С., Барков А.П., Ажермачев А.Б.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Дубков' AND a.first_name = 'Артём' AND a.middle_name = 'Александрович' AND a.birth_year = 1994);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кузовлев', 'Иван', 'Николаевич', 1985, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'самостоятельно', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кузовлев' AND a.first_name = 'Иван' AND a.middle_name = 'Николаевич' AND a.birth_year = 1985);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Самохвалов', 'Илья', 'Дмитриевич', 2007, 'm', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ "Уренгоец"' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Бабичев М.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Самохвалов' AND a.first_name = 'Илья' AND a.middle_name = 'Дмитриевич' AND a.birth_year = 2007);

INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'butenko-evgeniy-1995' AND s.athlete_id <> a.id)
              THEN 'butenko-evgeniy-1995-' || a.id ELSE 'butenko-evgeniy-1995' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бутенко' AND first_name = 'Евгений' AND middle_name = 'Александрович' AND birth_year = 1995)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'yakushev-roman-2002' AND s.athlete_id <> a.id)
              THEN 'yakushev-roman-2002-' || a.id ELSE 'yakushev-roman-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Якушев' AND first_name = 'Роман' AND middle_name = 'Владимирович' AND birth_year = 2002)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'rudnev-ruslan-1994' AND s.athlete_id <> a.id)
              THEN 'rudnev-ruslan-1994-' || a.id ELSE 'rudnev-ruslan-1994' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Руднев' AND first_name = 'Руслан' AND middle_name = 'Сергеевич' AND birth_year = 1994)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zhbanov-aleksey-1986' AND s.athlete_id <> a.id)
              THEN 'zhbanov-aleksey-1986-' || a.id ELSE 'zhbanov-aleksey-1986' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Жбанов' AND first_name = 'Алексей' AND middle_name = 'Александрович' AND birth_year = 1986)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ivanov-kirill-2009' AND s.athlete_id <> a.id)
              THEN 'ivanov-kirill-2009-' || a.id ELSE 'ivanov-kirill-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Кирилл' AND middle_name = 'Михайлович' AND birth_year = 2009)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'smagulov-nursultan-1999' AND s.athlete_id <> a.id)
              THEN 'smagulov-nursultan-1999-' || a.id ELSE 'smagulov-nursultan-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Смагулов' AND first_name = 'Нурсултан' AND middle_name = 'Шайзандинович' AND birth_year = 1999)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'goryachev-yaroslav-2010' AND s.athlete_id <> a.id)
              THEN 'goryachev-yaroslav-2010-' || a.id ELSE 'goryachev-yaroslav-2010' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Горячев' AND first_name = 'Ярослав' AND middle_name = 'Алексеевич' AND birth_year = 2010)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'cvik-danil-2003' AND s.athlete_id <> a.id)
              THEN 'cvik-danil-2003-' || a.id ELSE 'cvik-danil-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Цвик' AND first_name = 'Данил' AND middle_name = 'Александрович' AND birth_year = 2003)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sirazetdinov-danil-2007' AND s.athlete_id <> a.id)
              THEN 'sirazetdinov-danil-2007-' || a.id ELSE 'sirazetdinov-danil-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Сиразетдинов' AND first_name = 'Данил' AND middle_name = 'Ильфатович' AND birth_year = 2007)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'novikov-kirill-2004' AND s.athlete_id <> a.id)
              THEN 'novikov-kirill-2004-' || a.id ELSE 'novikov-kirill-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Новиков' AND first_name = 'Кирилл' AND middle_name = 'Вадимович' AND birth_year = 2004)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ryabkov-aleksey-1993' AND s.athlete_id <> a.id)
              THEN 'ryabkov-aleksey-1993-' || a.id ELSE 'ryabkov-aleksey-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Рябков' AND first_name = 'Алексей' AND middle_name = 'Игоревич' AND birth_year = 1993)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'morozovich-vladislav-1999' AND s.athlete_id <> a.id)
              THEN 'morozovich-vladislav-1999-' || a.id ELSE 'morozovich-vladislav-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Морозович' AND first_name = 'Владислав' AND middle_name = 'Павлович' AND birth_year = 1999)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sharov-maksim-2000' AND s.athlete_id <> a.id)
              THEN 'sharov-maksim-2000-' || a.id ELSE 'sharov-maksim-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Шаров' AND first_name = 'Максим' AND middle_name = 'Игоревич' AND birth_year = 2000)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'trofimov-timur-2011' AND s.athlete_id <> a.id)
              THEN 'trofimov-timur-2011-' || a.id ELSE 'trofimov-timur-2011' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Трофимов' AND first_name = 'Тимур' AND middle_name = 'Михайлович' AND birth_year = 2011)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'berezovskiy-mark-2003' AND s.athlete_id <> a.id)
              THEN 'berezovskiy-mark-2003-' || a.id ELSE 'berezovskiy-mark-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Березовский' AND first_name = 'Марк' AND middle_name = 'Андреевич' AND birth_year = 2003)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'volkov-daniil-2003' AND s.athlete_id <> a.id)
              THEN 'volkov-daniil-2003-' || a.id ELSE 'volkov-daniil-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Волков' AND first_name = 'Даниил' AND middle_name = 'Игоревич' AND birth_year = 2003)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'rozhin-egor-1987' AND s.athlete_id <> a.id)
              THEN 'rozhin-egor-1987-' || a.id ELSE 'rozhin-egor-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Рожин' AND first_name = 'Егор' AND middle_name = 'Иннокентьевич' AND birth_year = 1987)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'hamidov-fahriddin-2002' AND s.athlete_id <> a.id)
              THEN 'hamidov-fahriddin-2002-' || a.id ELSE 'hamidov-fahriddin-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Хамидов' AND first_name = 'Фахриддин' AND middle_name = 'Фарход Угли' AND birth_year = 2002)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'leonov-dmitriy-2003' AND s.athlete_id <> a.id)
              THEN 'leonov-dmitriy-2003-' || a.id ELSE 'leonov-dmitriy-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Леонов' AND first_name = 'Дмитрий' AND middle_name = 'Алексеевич' AND birth_year = 2003)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'belyaev-ivan-1992' AND s.athlete_id <> a.id)
              THEN 'belyaev-ivan-1992-' || a.id ELSE 'belyaev-ivan-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Беляев' AND first_name = 'Иван' AND middle_name = 'Сергеевич' AND birth_year = 1992)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kargin-sergey-1998' AND s.athlete_id <> a.id)
              THEN 'kargin-sergey-1998-' || a.id ELSE 'kargin-sergey-1998' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Каргин' AND first_name = 'Сергей' AND middle_name = 'Ярославович' AND birth_year = 1998)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'fomin-fedor-2004' AND s.athlete_id <> a.id)
              THEN 'fomin-fedor-2004-' || a.id ELSE 'fomin-fedor-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Фомин' AND first_name = 'Фёдор' AND middle_name = 'Алексеевич' AND birth_year = 2004)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'novoselov-andrey-2004' AND s.athlete_id <> a.id)
              THEN 'novoselov-andrey-2004-' || a.id ELSE 'novoselov-andrey-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Новоселов' AND first_name = 'Андрей' AND middle_name = 'Евгеньевич' AND birth_year = 2004)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kolomin-dmitriy-1999' AND s.athlete_id <> a.id)
              THEN 'kolomin-dmitriy-1999-' || a.id ELSE 'kolomin-dmitriy-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Коломин' AND first_name = 'Дмитрий' AND middle_name = 'Андреевич' AND birth_year = 1999)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'voldaev-aleksandr-2000' AND s.athlete_id <> a.id)
              THEN 'voldaev-aleksandr-2000-' || a.id ELSE 'voldaev-aleksandr-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Волдаев' AND first_name = 'Александр' AND middle_name = 'Владимирович' AND birth_year = 2000)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'balandin-andrey-1996' AND s.athlete_id <> a.id)
              THEN 'balandin-andrey-1996-' || a.id ELSE 'balandin-andrey-1996' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Баландин' AND first_name = 'Андрей' AND middle_name = 'Александрович' AND birth_year = 1996)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'bagrov-maksim-2009' AND s.athlete_id <> a.id)
              THEN 'bagrov-maksim-2009-' || a.id ELSE 'bagrov-maksim-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Багров' AND first_name = 'Максим' AND middle_name = 'Дмитриевич' AND birth_year = 2009)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'semenov-nikita-1993' AND s.athlete_id <> a.id)
              THEN 'semenov-nikita-1993-' || a.id ELSE 'semenov-nikita-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Семенов' AND first_name = 'Никита' AND middle_name = 'Андреевич' AND birth_year = 1993)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ramazanov-vadim-2007' AND s.athlete_id <> a.id)
              THEN 'ramazanov-vadim-2007-' || a.id ELSE 'ramazanov-vadim-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Рамазанов' AND first_name = 'Вадим' AND middle_name = 'Русланович' AND birth_year = 2007)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ivanov-evgeniy-1987' AND s.athlete_id <> a.id)
              THEN 'ivanov-evgeniy-1987-' || a.id ELSE 'ivanov-evgeniy-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Евгений' AND middle_name = 'Игоревич' AND birth_year = 1987)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sergeev-aleksandr-1991' AND s.athlete_id <> a.id)
              THEN 'sergeev-aleksandr-1991-' || a.id ELSE 'sergeev-aleksandr-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Сергеев' AND first_name = 'Александр' AND middle_name = 'Сергеевич' AND birth_year = 1991)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'shamkaev-radik-1990' AND s.athlete_id <> a.id)
              THEN 'shamkaev-radik-1990-' || a.id ELSE 'shamkaev-radik-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Шамкаев' AND first_name = 'Радик' AND middle_name = 'Мусаевич' AND birth_year = 1990)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'perminov-maksim-1994' AND s.athlete_id <> a.id)
              THEN 'perminov-maksim-1994-' || a.id ELSE 'perminov-maksim-1994' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Перминов' AND first_name = 'Максим' AND middle_name = 'Васильевич' AND birth_year = 1994)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'vasin-artem-2007' AND s.athlete_id <> a.id)
              THEN 'vasin-artem-2007-' || a.id ELSE 'vasin-artem-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Васин' AND first_name = 'Артём' AND middle_name = 'Иванович' AND birth_year = 2007)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'olenov-vladimir-1991' AND s.athlete_id <> a.id)
              THEN 'olenov-vladimir-1991-' || a.id ELSE 'olenov-vladimir-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Оленов' AND first_name = 'Владимир' AND middle_name = 'Владимирович' AND birth_year = 1991)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'molchanov-dianisiy-2005' AND s.athlete_id <> a.id)
              THEN 'molchanov-dianisiy-2005-' || a.id ELSE 'molchanov-dianisiy-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Молчанов' AND first_name = 'Дианисий' AND middle_name = 'Николаевич' AND birth_year = 2005)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sarsembaev-ilyas-1999' AND s.athlete_id <> a.id)
              THEN 'sarsembaev-ilyas-1999-' || a.id ELSE 'sarsembaev-ilyas-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Сарсембаев' AND first_name = 'Ильяс' AND middle_name = 'Асхатович' AND birth_year = 1999)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lyaukin-kirill-1999' AND s.athlete_id <> a.id)
              THEN 'lyaukin-kirill-1999-' || a.id ELSE 'lyaukin-kirill-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ляукин' AND first_name = 'Кирилл' AND middle_name = 'Сергеевич' AND birth_year = 1999)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'astahov-evgeniy-2002' AND s.athlete_id <> a.id)
              THEN 'astahov-evgeniy-2002-' || a.id ELSE 'astahov-evgeniy-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Астахов' AND first_name = 'Евгений' AND middle_name = 'Михайлович' AND birth_year = 2002)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lyubimskiy-sergey-1992' AND s.athlete_id <> a.id)
              THEN 'lyubimskiy-sergey-1992-' || a.id ELSE 'lyubimskiy-sergey-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Любимский' AND first_name = 'Сергей' AND middle_name = 'Александрович' AND birth_year = 1992)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'porcev-roman-1987' AND s.athlete_id <> a.id)
              THEN 'porcev-roman-1987-' || a.id ELSE 'porcev-roman-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Порцев' AND first_name = 'Роман' AND middle_name = 'Геннадьевич' AND birth_year = 1987)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'dubel-aleksey-1990' AND s.athlete_id <> a.id)
              THEN 'dubel-aleksey-1990-' || a.id ELSE 'dubel-aleksey-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Дубель' AND first_name = 'Алексей' AND middle_name = 'Викторович' AND birth_year = 1990)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ostrikov-maksim-2005' AND s.athlete_id <> a.id)
              THEN 'ostrikov-maksim-2005-' || a.id ELSE 'ostrikov-maksim-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Остриков' AND first_name = 'Максим' AND middle_name = 'Витальевич' AND birth_year = 2005)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'savinov-andrey-1984' AND s.athlete_id <> a.id)
              THEN 'savinov-andrey-1984-' || a.id ELSE 'savinov-andrey-1984' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Савинов' AND first_name = 'Андрей' AND middle_name = 'Вячеславович' AND birth_year = 1984)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'chuev-pavel-1997' AND s.athlete_id <> a.id)
              THEN 'chuev-pavel-1997-' || a.id ELSE 'chuev-pavel-1997' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Чуев' AND first_name = 'Павел' AND middle_name = 'Владимирович' AND birth_year = 1997)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'cherkashin-dmitriy-1999' AND s.athlete_id <> a.id)
              THEN 'cherkashin-dmitriy-1999-' || a.id ELSE 'cherkashin-dmitriy-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Черкашин' AND first_name = 'Дмитрий' AND middle_name = 'Андреевич' AND birth_year = 1999)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'rysnik-sergey-1995' AND s.athlete_id <> a.id)
              THEN 'rysnik-sergey-1995-' || a.id ELSE 'rysnik-sergey-1995' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Рысник' AND first_name = 'Сергей' AND middle_name = 'Михайлович' AND birth_year = 1995)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'samochernov-ivan-1998' AND s.athlete_id <> a.id)
              THEN 'samochernov-ivan-1998-' || a.id ELSE 'samochernov-ivan-1998' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Самочернов' AND first_name = 'Иван' AND middle_name = 'Николаевич' AND birth_year = 1998)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kosuhin-vladislav-2004' AND s.athlete_id <> a.id)
              THEN 'kosuhin-vladislav-2004-' || a.id ELSE 'kosuhin-vladislav-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Косухин' AND first_name = 'Владислав' AND middle_name = 'Владимирович' AND birth_year = 2004)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'akulshin-aleksey-1994' AND s.athlete_id <> a.id)
              THEN 'akulshin-aleksey-1994-' || a.id ELSE 'akulshin-aleksey-1994' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Акульшин' AND first_name = 'Алексей' AND middle_name = 'Сергеевич' AND birth_year = 1994)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'peshkov-vitaliy-1998' AND s.athlete_id <> a.id)
              THEN 'peshkov-vitaliy-1998-' || a.id ELSE 'peshkov-vitaliy-1998' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Пешков' AND first_name = 'Виталий' AND middle_name = 'Юрьевич' AND birth_year = 1998)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'shmatko-david-2001' AND s.athlete_id <> a.id)
              THEN 'shmatko-david-2001-' || a.id ELSE 'shmatko-david-2001' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Шматко' AND first_name = 'Давид' AND middle_name = 'Андреевич' AND birth_year = 2001)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lopin-ilya-2005' AND s.athlete_id <> a.id)
              THEN 'lopin-ilya-2005-' || a.id ELSE 'lopin-ilya-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Лопин' AND first_name = 'Илья' AND middle_name = 'Сергеевич' AND birth_year = 2005)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kulakov-ivan-1998' AND s.athlete_id <> a.id)
              THEN 'kulakov-ivan-1998-' || a.id ELSE 'kulakov-ivan-1998' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кулаков' AND first_name = 'Иван' AND middle_name = 'Иванович' AND birth_year = 1998)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kiryuhin-roman-1997' AND s.athlete_id <> a.id)
              THEN 'kiryuhin-roman-1997-' || a.id ELSE 'kiryuhin-roman-1997' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кирюхин' AND first_name = 'Роман' AND middle_name = 'Александрович' AND birth_year = 1997)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'seliverstov-semen-1989' AND s.athlete_id <> a.id)
              THEN 'seliverstov-semen-1989-' || a.id ELSE 'seliverstov-semen-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Селиверстов' AND first_name = 'Семен' AND middle_name = 'Васильевич' AND birth_year = 1989)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'turischev-dmitriy-1992' AND s.athlete_id <> a.id)
              THEN 'turischev-dmitriy-1992-' || a.id ELSE 'turischev-dmitriy-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Турищев' AND first_name = 'Дмитрий' AND middle_name = 'Владимирович' AND birth_year = 1992)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'nikolaev-arkadiy-2002' AND s.athlete_id <> a.id)
              THEN 'nikolaev-arkadiy-2002-' || a.id ELSE 'nikolaev-arkadiy-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Николаев' AND first_name = 'Аркадий' AND middle_name = 'Анатольевич' AND birth_year = 2002)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lebedev-dmitriy-2008' AND s.athlete_id <> a.id)
              THEN 'lebedev-dmitriy-2008-' || a.id ELSE 'lebedev-dmitriy-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Лебедев' AND first_name = 'Дмитрий' AND middle_name = 'Николаевич' AND birth_year = 2008)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'cherkashin-ivan-1999' AND s.athlete_id <> a.id)
              THEN 'cherkashin-ivan-1999-' || a.id ELSE 'cherkashin-ivan-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Черкашин' AND first_name = 'Иван' AND middle_name = 'Андреевич' AND birth_year = 1999)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zaharov-andrey-1993' AND s.athlete_id <> a.id)
              THEN 'zaharov-andrey-1993-' || a.id ELSE 'zaharov-andrey-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Захаров' AND first_name = 'Андрей' AND middle_name = 'Валентинович' AND birth_year = 1993)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'muhitov-andrey-1999' AND s.athlete_id <> a.id)
              THEN 'muhitov-andrey-1999-' || a.id ELSE 'muhitov-andrey-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Мухитов' AND first_name = 'Андрей' AND middle_name = 'Вячеславович' AND birth_year = 1999)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'mihaylov-denis-1987' AND s.athlete_id <> a.id)
              THEN 'mihaylov-denis-1987-' || a.id ELSE 'mihaylov-denis-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Михайлов' AND first_name = 'Денис' AND middle_name = 'Витальевич' AND birth_year = 1987)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kudashev-denis-1988' AND s.athlete_id <> a.id)
              THEN 'kudashev-denis-1988-' || a.id ELSE 'kudashev-denis-1988' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кудашев' AND first_name = 'Денис' AND middle_name = 'Андреевич' AND birth_year = 1988)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'dubkov-artem-1994' AND s.athlete_id <> a.id)
              THEN 'dubkov-artem-1994-' || a.id ELSE 'dubkov-artem-1994' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Дубков' AND first_name = 'Артём' AND middle_name = 'Александрович' AND birth_year = 1994)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kuzovlev-ivan-1985' AND s.athlete_id <> a.id)
              THEN 'kuzovlev-ivan-1985-' || a.id ELSE 'kuzovlev-ivan-1985' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кузовлев' AND first_name = 'Иван' AND middle_name = 'Николаевич' AND birth_year = 1985)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'samohvalov-ilya-2007' AND s.athlete_id <> a.id)
              THEN 'samohvalov-ilya-2007-' || a.id ELSE 'samohvalov-ilya-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Самохвалов' AND first_name = 'Илья' AND middle_name = 'Дмитриевич' AND birth_year = 2007)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);

INSERT INTO results (id, category_id, athlete_id, place, total_reps, points, body_weight_kg, rank_achieved_id, discipline_id, bell_kg, hands, time_limit_min, competition_id, event_date, raw_name, raw_club, raw_region, protocol_id, source_page) VALUES
  (1001, 1001, (SELECT id FROM athletes WHERE last_name = 'Бутенко' AND first_name = 'Евгений' AND middle_name = 'Александрович' AND birth_year = 1995), 1, 78, NULL, 67.8, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Бутенко Евгений Александрович', 'МУ ДО "МЦРФКиС"', 'Новосибирская область', 1001, 38),
  (1002, 1001, (SELECT id FROM athletes WHERE last_name = 'Якушев' AND first_name = 'Роман' AND middle_name = 'Владимирович' AND birth_year = 2002), 2, 55, NULL, 62.75, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Якушев Роман Владимирович', 'ВС', 'Республика Бурятия', 1001, 38),
  (1003, 1001, (SELECT id FROM athletes WHERE last_name = 'Руднев' AND first_name = 'Руслан' AND middle_name = 'Сергеевич' AND birth_year = 1994), 3, 54, NULL, 62.2, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Руднев Руслан Сергеевич', '-', 'г. Санкт-Петербург', 1001, 38),
  (1004, 1001, (SELECT id FROM athletes WHERE last_name = 'Жбанов' AND first_name = 'Алексей' AND middle_name = 'Александрович' AND birth_year = 1986), 4, 52, NULL, 62.8, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Жбанов Алексей Александрович', 'СПБ ГБУ ДО СШОРСВС им. В.Ф.', 'г. Санкт-Петербург', 1001, 38),
  (1005, 1001, (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Кирилл' AND middle_name = 'Михайлович' AND birth_year = 2009), 5, 51, NULL, 60.35, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Иванов Кирилл Михайлович', 'СПБ ГБУ ДО СШОРСВС им. В.Ф.', 'г. Санкт-Петербург', 1001, 38),
  (1006, 1001, (SELECT id FROM athletes WHERE last_name = 'Смагулов' AND first_name = 'Нурсултан' AND middle_name = 'Шайзандинович' AND birth_year = 1999), 6, 51, NULL, 62.8, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Смагулов Нурсултан Шайзандинович', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 1001, 38),
  (1007, 1001, (SELECT id FROM athletes WHERE last_name = 'Горячев' AND first_name = 'Ярослав' AND middle_name = 'Алексеевич' AND birth_year = 2010), 7, 48, NULL, 62.9, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Горячев Ярослав Алексеевич', 'СШОР МАРШАЛ', 'Калужская область', 1001, 38),
  (1008, 1001, (SELECT id FROM athletes WHERE last_name = 'Цвик' AND first_name = 'Данил' AND middle_name = 'Александрович' AND birth_year = 2003), 8, 47, NULL, 62.6, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Цвик Данил Александрович', 'МБУДО КСШ №1', 'Смоленская область', 1001, 38),
  (1009, 1001, (SELECT id FROM athletes WHERE last_name = 'Сиразетдинов' AND first_name = 'Данил' AND middle_name = 'Ильфатович' AND birth_year = 2007), 9, 36, NULL, 60.55, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Сиразетдинов Данил Ильфатович', 'МАУ ДО СШ «Прикамье» г. Перми', 'Пермский край', 1001, 38),
  (1010, 1001, (SELECT id FROM athletes WHERE last_name = 'Новиков' AND first_name = 'Кирилл' AND middle_name = 'Вадимович' AND birth_year = 2004), 10, 35, NULL, 62.6, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Новиков Кирилл Вадимович', 'Дюц "Старт"', 'Тюменская область', 1001, 38),
  (1011, 1002, (SELECT id FROM athletes WHERE last_name = 'Рябков' AND first_name = 'Алексей' AND middle_name = 'Игоревич' AND birth_year = 1993), 1, 78, NULL, 67.9, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Рябков Алексей Игоревич', 'МБУ ДО СШОР «Югория» им. А.А. Пилояна', 'Ханты-Мансийский АО - Югра', 1001, 37),
  (1012, 1002, (SELECT id FROM athletes WHERE last_name = 'Морозович' AND first_name = 'Владислав' AND middle_name = 'Павлович' AND birth_year = 1999), 2, 72, NULL, 67.85, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Морозович Владислав Павлович', 'СШОР 33', 'Омская область', 1001, 37),
  (1013, 1002, (SELECT id FROM athletes WHERE last_name = 'Шаров' AND first_name = 'Максим' AND middle_name = 'Игоревич' AND birth_year = 2000), 3, 65, NULL, 67.35, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Шаров Максим Игоревич', 'Маршал', 'Калужская область', 1001, 37),
  (1014, 1002, (SELECT id FROM athletes WHERE last_name = 'Трофимов' AND first_name = 'Тимур' AND middle_name = 'Михайлович' AND birth_year = 2011), 4, 56, NULL, 68.0, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Трофимов Тимур Михайлович', 'СШОР " Маршал"', 'Калужская область', 1001, 37),
  (1015, 1002, (SELECT id FROM athletes WHERE last_name = 'Березовский' AND first_name = 'Марк' AND middle_name = 'Андреевич' AND birth_year = 2003), 5, 50, NULL, 67.9, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Березовский Марк Андреевич', 'РВВДКУ-Рязань', 'Рязанская область', 1001, 37),
  (1016, 1002, (SELECT id FROM athletes WHERE last_name = 'Волков' AND first_name = 'Даниил' AND middle_name = 'Игоревич' AND birth_year = 2003), 6, 42, NULL, 67.85, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Волков Даниил Игоревич', 'СШ№2', 'Краснодарский край', 1001, 37),
  (1017, 1002, (SELECT id FROM athletes WHERE last_name = 'Рожин' AND first_name = 'Егор' AND middle_name = 'Иннокентьевич' AND birth_year = 1987), 7, 40, NULL, 67.95, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Рожин Егор Иннокентьевич', 'Федерация гиревого спорта Саха Якутия', 'Республика Саха (Якутия)', 1001, 37),
  (1018, 1002, (SELECT id FROM athletes WHERE last_name = 'Хамидов' AND first_name = 'Фахриддин' AND middle_name = 'Фарход Угли' AND birth_year = 2002), 8, 34, NULL, 67.65, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Хамидов Фахриддин Фарход Угли', 'СШОР "Маршал"', 'Калужская область', 1001, 37),
  (1019, 1002, (SELECT id FROM athletes WHERE last_name = 'Леонов' AND first_name = 'Дмитрий' AND middle_name = 'Алексеевич' AND birth_year = 2003), 9, 32, NULL, 67.3, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Леонов Дмитрий Алексеевич', 'дюц "Старт"', 'Тюменская область', 1001, 37),
  (1020, 1003, (SELECT id FROM athletes WHERE last_name = 'Беляев' AND first_name = 'Иван' AND middle_name = 'Сергеевич' AND birth_year = 1992), 1, 82, NULL, 72.0, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Беляев Иван Сергеевич', 'МБУ ДО СШОР «Югория» им. А.А. Пилояна', 'Ханты-Мансийский АО - Югра', 1001, 36),
  (1021, 1003, (SELECT id FROM athletes WHERE last_name = 'Каргин' AND first_name = 'Сергей' AND middle_name = 'Ярославович' AND birth_year = 1998), 2, 79, NULL, 72.8, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Каргин Сергей Ярославович', 'ВС', 'Республика Бурятия', 1001, 36),
  (1022, 1003, (SELECT id FROM athletes WHERE last_name = 'Фомин' AND first_name = 'Фёдор' AND middle_name = 'Алексеевич' AND birth_year = 2004), 3, 70, NULL, 72.9, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Фомин Фёдор Алексеевич', 'СШОР 5 г Белгород', 'Белгородская область', 1001, 36),
  (1023, 1003, (SELECT id FROM athletes WHERE last_name = 'Новоселов' AND first_name = 'Андрей' AND middle_name = 'Евгеньевич' AND birth_year = 2004), 4, 66, NULL, 72.5, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Новоселов Андрей Евгеньевич', 'КОГАУ «СШОР «Юность»', 'Кировская область', 1001, 36),
  (1024, 1003, (SELECT id FROM athletes WHERE last_name = 'Коломин' AND first_name = 'Дмитрий' AND middle_name = 'Андреевич' AND birth_year = 1999), 5, 63, NULL, 72.65, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Коломин Дмитрий Андреевич', 'ВС', 'Республика Бурятия', 1001, 36),
  (1025, 1003, (SELECT id FROM athletes WHERE last_name = 'Волдаев' AND first_name = 'Александр' AND middle_name = 'Владимирович' AND birth_year = 2000), 6, 62, NULL, 72.75, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Волдаев Александр Владимирович', 'Федерация гиревого спорта Томской', 'Томская область', 1001, 36),
  (1026, 1003, (SELECT id FROM athletes WHERE last_name = 'Баландин' AND first_name = 'Андрей' AND middle_name = 'Александрович' AND birth_year = 1996), 7, 61, NULL, 72.6, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Баландин Андрей Александрович', 'Динамо', 'Курганская область', 1001, 36),
  (1027, 1003, (SELECT id FROM athletes WHERE last_name = 'Багров' AND first_name = 'Максим' AND middle_name = 'Дмитриевич' AND birth_year = 2009), 8, 58, NULL, 72.15, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Багров Максим Дмитриевич', 'ГБУ ДО МКСШОР "ЗАПАД"', 'г. Москва', 1001, 36),
  (1028, 1003, (SELECT id FROM athletes WHERE last_name = 'Семенов' AND first_name = 'Никита' AND middle_name = 'Андреевич' AND birth_year = 1993), 9, 57, NULL, 72.8, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Семенов Никита Андреевич', 'РОООО ВФГС в Челябинской области', 'Челябинская область', 1001, 36),
  (1029, 1003, (SELECT id FROM athletes WHERE last_name = 'Рамазанов' AND first_name = 'Вадим' AND middle_name = 'Русланович' AND birth_year = 2007), 10, 57, NULL, 72.9, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Рамазанов Вадим Русланович', 'МБУ ДО СШ "Зенит"', 'Ямало-Ненецкий автономный округ', 1001, 36),
  (1030, 1003, (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Евгений' AND middle_name = 'Игоревич' AND birth_year = 1987), 11, 55, NULL, 73.0, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Иванов Евгений Игоревич', 'Вс рф', 'Томская область', 1001, 36),
  (1031, 1003, (SELECT id FROM athletes WHERE last_name = 'Сергеев' AND first_name = 'Александр' AND middle_name = 'Сергеевич' AND birth_year = 1991), 12, 54, NULL, 72.0, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Сергеев Александр Сергеевич', 'СШОР "Маршал"', 'Калужская область', 1001, 36),
  (1032, 1003, (SELECT id FROM athletes WHERE last_name = 'Шамкаев' AND first_name = 'Радик' AND middle_name = 'Мусаевич' AND birth_year = 1990), 13, 53, NULL, 73.0, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Шамкаев Радик Мусаевич', 'СШ №1 им. Л.Д. Ковалевского', 'Оренбургская область', 1001, 36),
  (1033, 1003, (SELECT id FROM athletes WHERE last_name = 'Перминов' AND first_name = 'Максим' AND middle_name = 'Васильевич' AND birth_year = 1994), 14, 48, NULL, 71.65, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Перминов Максим Васильевич', 'КОГАУ «СШОР «Юность»', 'Кировская область', 1001, 36),
  (1034, 1003, (SELECT id FROM athletes WHERE last_name = 'Васин' AND first_name = 'Артём' AND middle_name = 'Иванович' AND birth_year = 2007), 15, 44, NULL, 72.25, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Васин Артём Иванович', 'СШОР "Маршал"', 'Калужская область', 1001, 36),
  (1035, 1003, (SELECT id FROM athletes WHERE last_name = 'Оленов' AND first_name = 'Владимир' AND middle_name = 'Владимирович' AND birth_year = 1991), 16, 34, NULL, 72.25, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Оленов Владимир Владимирович', 'Федерация гиревого спорта Саха Якутия', 'Республика Саха (Якутия)', 1001, 36),
  (1036, 1004, (SELECT id FROM athletes WHERE last_name = 'Молчанов' AND first_name = 'Дианисий' AND middle_name = 'Николаевич' AND birth_year = 2005), 1, 83, NULL, 77.95, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Молчанов Дианисий Николаевич', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 1001, 35),
  (1037, 1004, (SELECT id FROM athletes WHERE last_name = 'Сарсембаев' AND first_name = 'Ильяс' AND middle_name = 'Асхатович' AND birth_year = 1999), 2, 80, NULL, 77.3, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Сарсембаев Ильяс Асхатович', 'МБУ ДО СШ "Зенит"', 'Ямало-Ненецкий автономный округ', 1001, 35),
  (1038, 1004, (SELECT id FROM athletes WHERE last_name = 'Ляукин' AND first_name = 'Кирилл' AND middle_name = 'Сергеевич' AND birth_year = 1999), 3, 78, NULL, 78.0, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Ляукин Кирилл Сергеевич', 'РОО ФГС РТ', 'Республика Татарстан', 1001, 35),
  (1039, 1004, (SELECT id FROM athletes WHERE last_name = 'Астахов' AND first_name = 'Евгений' AND middle_name = 'Михайлович' AND birth_year = 2002), 4, 76, NULL, 77.5, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Астахов Евгений Михайлович', 'ГБУ ДО МКСШОР « Запад» Отделение «Семёрка»', 'г. Москва', 1001, 35),
  (1040, 1004, (SELECT id FROM athletes WHERE last_name = 'Любимский' AND first_name = 'Сергей' AND middle_name = 'Александрович' AND birth_year = 1992), 5, 70, NULL, 77.75, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Любимский Сергей Александрович', 'ВС', 'Республика Бурятия', 1001, 35),
  (1041, 1004, (SELECT id FROM athletes WHERE last_name = 'Порцев' AND first_name = 'Роман' AND middle_name = 'Геннадьевич' AND birth_year = 1987), 6, 66, NULL, 77.15, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Порцев Роман Геннадьевич', 'МАУ ДО СШ «Прикамье» г. Перми', 'Пермский край', 1001, 35),
  (1042, 1004, (SELECT id FROM athletes WHERE last_name = 'Дубель' AND first_name = 'Алексей' AND middle_name = 'Викторович' AND birth_year = 1990), 7, 62, NULL, 78.0, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Дубель Алексей Викторович', 'ООО "ВФГС в Курганской области"', 'Курганская область', 1001, 35),
  (1043, 1004, (SELECT id FROM athletes WHERE last_name = 'Остриков' AND first_name = 'Максим' AND middle_name = 'Витальевич' AND birth_year = 2005), 8, 53, NULL, 77.3, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Остриков Максим Витальевич', 'СШОР "Маршал"', 'Калужская область', 1001, 35),
  (1044, 1004, (SELECT id FROM athletes WHERE last_name = 'Савинов' AND first_name = 'Андрей' AND middle_name = 'Вячеславович' AND birth_year = 1984), 9, 47, NULL, 76.6, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Савинов Андрей Вячеславович', 'Владимирская область', 'Владимирская область', 1001, 35),
  (1045, 1005, (SELECT id FROM athletes WHERE last_name = 'Чуев' AND first_name = 'Павел' AND middle_name = 'Владимирович' AND birth_year = 1997), 1, 88, NULL, 84.0, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Чуев Павел Владимирович', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 1001, 34),
  (1046, 1005, (SELECT id FROM athletes WHERE last_name = 'Черкашин' AND first_name = 'Дмитрий' AND middle_name = 'Андреевич' AND birth_year = 1999), 2, 88, NULL, 85.0, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Черкашин Дмитрий Андреевич', 'ОГАУ ДО СШОР', 'Томская область', 1001, 34),
  (1047, 1005, (SELECT id FROM athletes WHERE last_name = 'Рысник' AND first_name = 'Сергей' AND middle_name = 'Михайлович' AND birth_year = 1995), 3, 78, NULL, 84.45, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Рысник Сергей Михайлович', 'Армия России', 'Омская область', 1001, 34),
  (1048, 1005, (SELECT id FROM athletes WHERE last_name = 'Самочернов' AND first_name = 'Иван' AND middle_name = 'Николаевич' AND birth_year = 1998), 4, 77, NULL, 84.75, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Самочернов Иван Николаевич', 'Курганская область', 'Курганская область', 1001, 34),
  (1049, 1005, (SELECT id FROM athletes WHERE last_name = 'Косухин' AND first_name = 'Владислав' AND middle_name = 'Владимирович' AND birth_year = 2004), 5, 72, NULL, 83.45, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Косухин Владислав Владимирович', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 1001, 34),
  (1050, 1005, (SELECT id FROM athletes WHERE last_name = 'Акульшин' AND first_name = 'Алексей' AND middle_name = 'Сергеевич' AND birth_year = 1994), 6, 72, NULL, 84.9, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Акульшин Алексей Сергеевич', 'СШ №1 им. Л.Д. Ковалевского', 'Оренбургская область', 1001, 34),
  (1051, 1005, (SELECT id FROM athletes WHERE last_name = 'Пешков' AND first_name = 'Виталий' AND middle_name = 'Юрьевич' AND birth_year = 1998), 7, 69, NULL, 83.6, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Пешков Виталий Юрьевич', 'СШ №1 им. Л.Д. Ковалевского', 'Оренбургская область', 1001, 34),
  (1052, 1005, (SELECT id FROM athletes WHERE last_name = 'Шматко' AND first_name = 'Давид' AND middle_name = 'Андреевич' AND birth_year = 2001), 8, 52, NULL, 81.45, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Шматко Давид Андреевич', 'СШОР 5 г Белгород', 'Белгородская область', 1001, 34),
  (1053, 1005, (SELECT id FROM athletes WHERE last_name = 'Лопин' AND first_name = 'Илья' AND middle_name = 'Сергеевич' AND birth_year = 2005), 9, 45, NULL, 79.95, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Лопин Илья Сергеевич', 'РСОО "ФГС РО"', 'Ростовская область', 1001, 34),
  (1054, 1006, (SELECT id FROM athletes WHERE last_name = 'Кулаков' AND first_name = 'Иван' AND middle_name = 'Иванович' AND birth_year = 1998), 1, 95, NULL, 94.6, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Кулаков Иван Иванович', 'СШОР "Маршал"0', 'Калужская область', 1001, 33),
  (1055, 1006, (SELECT id FROM athletes WHERE last_name = 'Кирюхин' AND first_name = 'Роман' AND middle_name = 'Александрович' AND birth_year = 1997), 2, 85, NULL, 86.7, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Кирюхин Роман Александрович', '-', 'г. Москва', 1001, 33),
  (1056, 1006, (SELECT id FROM athletes WHERE last_name = 'Селиверстов' AND first_name = 'Семен' AND middle_name = 'Васильевич' AND birth_year = 1989), 3, 82, NULL, 85.35, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Селиверстов Семен Васильевич', 'РО ООО ВФГС в Челябинской области', 'Челябинская область', 1001, 33),
  (1057, 1006, (SELECT id FROM athletes WHERE last_name = 'Турищев' AND first_name = 'Дмитрий' AND middle_name = 'Владимирович' AND birth_year = 1992), 4, 81, NULL, 94.95, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Турищев Дмитрий Владимирович', 'ГБУ ДО МКСШОР «Запад» Отделение', 'г. Москва', 1001, 33),
  (1058, 1006, (SELECT id FROM athletes WHERE last_name = 'Николаев' AND first_name = 'Аркадий' AND middle_name = 'Анатольевич' AND birth_year = 2002), 5, 80, NULL, 89.25, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Николаев Аркадий Анатольевич', 'МБУ ДО СШОР «Югория» им. А.А. Пилояна', 'Ханты-Мансийский АО - Югра', 1001, 33),
  (1059, 1006, (SELECT id FROM athletes WHERE last_name = 'Лебедев' AND first_name = 'Дмитрий' AND middle_name = 'Николаевич' AND birth_year = 2008), 6, 72, NULL, 90.3, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Лебедев Дмитрий Николаевич', 'СШОР №3', 'Вологодская область', 1001, 33),
  (1060, 1006, (SELECT id FROM athletes WHERE last_name = 'Черкашин' AND first_name = 'Иван' AND middle_name = 'Андреевич' AND birth_year = 1999), 7, 69, NULL, 90.0, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Черкашин Иван Андреевич', 'ОГАУДО Томская областная СШОР', 'Томская область', 1001, 33),
  (1061, 1006, (SELECT id FROM athletes WHERE last_name = 'Захаров' AND first_name = 'Андрей' AND middle_name = 'Валентинович' AND birth_year = 1993), 8, 69, NULL, 93.45, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Захаров Андрей Валентинович', 'МУ ДО"МЦРФКиС"', 'Новосибирская область', 1001, 33),
  (1062, 1006, (SELECT id FROM athletes WHERE last_name = 'Мухитов' AND first_name = 'Андрей' AND middle_name = 'Вячеславович' AND birth_year = 1999), 9, 67, NULL, 86.85, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Мухитов Андрей Вячеславович', 'СШОР по борьбе', 'Брянская область', 1001, 33),
  (1063, 1006, (SELECT id FROM athletes WHERE last_name = 'Михайлов' AND first_name = 'Денис' AND middle_name = 'Витальевич' AND birth_year = 1987), 10, 65, NULL, 91.5, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Михайлов Денис Витальевич', 'СШ Энергия', 'Чувашская Республика', 1001, 33),
  (1064, 1006, (SELECT id FROM athletes WHERE last_name = 'Кудашев' AND first_name = 'Денис' AND middle_name = 'Андреевич' AND birth_year = 1988), 11, 61, NULL, 92.95, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Кудашев Денис Андреевич', 'ВС', 'Республика Бурятия', 1001, 33),
  (1065, 1006, (SELECT id FROM athletes WHERE last_name = 'Дубков' AND first_name = 'Артём' AND middle_name = 'Александрович' AND birth_year = 1994), 12, 59, NULL, 87.7, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Дубков Артём Александрович', '-', 'Омская область', 1001, 33),
  (1066, 1006, (SELECT id FROM athletes WHERE last_name = 'Кузовлев' AND first_name = 'Иван' AND middle_name = 'Николаевич' AND birth_year = 1985), 13, 46, NULL, 90.05, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Кузовлев Иван Николаевич', '-', 'г. Санкт-Петербург', 1001, 33),
  (1067, 1006, (SELECT id FROM athletes WHERE last_name = 'Самохвалов' AND first_name = 'Илья' AND middle_name = 'Дмитриевич' AND birth_year = 2007), 14, 42, NULL, 90.8, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Самохвалов Илья Дмитриевич', 'МБУ ДО СШ "Уренгоец"', 'Ямало-Ненецкий автономный округ', 1001, 33);

INSERT INTO result_reps (id, result_id, exercise, hand, reps) VALUES
  (1001, 1001, 'long_cycle', 'both', 78),
  (1002, 1002, 'long_cycle', 'both', 55),
  (1003, 1003, 'long_cycle', 'both', 54),
  (1004, 1004, 'long_cycle', 'both', 52),
  (1005, 1005, 'long_cycle', 'both', 51),
  (1006, 1006, 'long_cycle', 'both', 51),
  (1007, 1007, 'long_cycle', 'both', 48),
  (1008, 1008, 'long_cycle', 'both', 47),
  (1009, 1009, 'long_cycle', 'both', 36),
  (1010, 1010, 'long_cycle', 'both', 35),
  (1011, 1011, 'long_cycle', 'both', 78),
  (1012, 1012, 'long_cycle', 'both', 72),
  (1013, 1013, 'long_cycle', 'both', 65),
  (1014, 1014, 'long_cycle', 'both', 56),
  (1015, 1015, 'long_cycle', 'both', 50),
  (1016, 1016, 'long_cycle', 'both', 42),
  (1017, 1017, 'long_cycle', 'both', 40),
  (1018, 1018, 'long_cycle', 'both', 34),
  (1019, 1019, 'long_cycle', 'both', 32),
  (1020, 1020, 'long_cycle', 'both', 82),
  (1021, 1021, 'long_cycle', 'both', 79),
  (1022, 1022, 'long_cycle', 'both', 70),
  (1023, 1023, 'long_cycle', 'both', 66),
  (1024, 1024, 'long_cycle', 'both', 63),
  (1025, 1025, 'long_cycle', 'both', 62),
  (1026, 1026, 'long_cycle', 'both', 61),
  (1027, 1027, 'long_cycle', 'both', 58),
  (1028, 1028, 'long_cycle', 'both', 57),
  (1029, 1029, 'long_cycle', 'both', 57),
  (1030, 1030, 'long_cycle', 'both', 55),
  (1031, 1031, 'long_cycle', 'both', 54),
  (1032, 1032, 'long_cycle', 'both', 53),
  (1033, 1033, 'long_cycle', 'both', 48),
  (1034, 1034, 'long_cycle', 'both', 44),
  (1035, 1035, 'long_cycle', 'both', 34),
  (1036, 1036, 'long_cycle', 'both', 83),
  (1037, 1037, 'long_cycle', 'both', 80),
  (1038, 1038, 'long_cycle', 'both', 78),
  (1039, 1039, 'long_cycle', 'both', 76),
  (1040, 1040, 'long_cycle', 'both', 70),
  (1041, 1041, 'long_cycle', 'both', 66),
  (1042, 1042, 'long_cycle', 'both', 62),
  (1043, 1043, 'long_cycle', 'both', 53),
  (1044, 1044, 'long_cycle', 'both', 47),
  (1045, 1045, 'long_cycle', 'both', 88),
  (1046, 1046, 'long_cycle', 'both', 88),
  (1047, 1047, 'long_cycle', 'both', 78),
  (1048, 1048, 'long_cycle', 'both', 77),
  (1049, 1049, 'long_cycle', 'both', 72),
  (1050, 1050, 'long_cycle', 'both', 72),
  (1051, 1051, 'long_cycle', 'both', 69),
  (1052, 1052, 'long_cycle', 'both', 52),
  (1053, 1053, 'long_cycle', 'both', 45),
  (1054, 1054, 'long_cycle', 'both', 95),
  (1055, 1055, 'long_cycle', 'both', 85),
  (1056, 1056, 'long_cycle', 'both', 82),
  (1057, 1057, 'long_cycle', 'both', 81),
  (1058, 1058, 'long_cycle', 'both', 80),
  (1059, 1059, 'long_cycle', 'both', 72),
  (1060, 1060, 'long_cycle', 'both', 69),
  (1061, 1061, 'long_cycle', 'both', 69),
  (1062, 1062, 'long_cycle', 'both', 67),
  (1063, 1063, 'long_cycle', 'both', 65),
  (1064, 1064, 'long_cycle', 'both', 61),
  (1065, 1065, 'long_cycle', 'both', 59),
  (1066, 1066, 'long_cycle', 'both', 46),
  (1067, 1067, 'long_cycle', 'both', 42);

