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
  ('Республика Саха (Якутия)', 'RU');

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
  ('дюц "Старт"', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU'));

INSERT OR IGNORE INTO federations (name, short_name, country) VALUES
  ('Всероссийская федерация гиревого спорта', 'ВФГС', 'RU');

INSERT INTO competitions (id, slug, name, date_start, date_end, city, country, competition_rank_id, federation_id, source_url, is_published) VALUES
  (1001, 'chempionat-rossii-2025', 'Чемпионат России 2025', '2025-06-12', '2025-06-16', 'Казань', 'RU', (SELECT id FROM competition_ranks WHERE code = 'national_ch'), (SELECT id FROM federations WHERE name = 'Всероссийская федерация гиревого спорта'), NULL, 1);

INSERT INTO protocols (id, competition_id, r2_key, filename, page_count, is_scan, status, published_at) VALUES
  (1001, 1001, 'protocols/chempionat-rossii-2025.pdf', 'protokol-chempionat-rossii-2025.pdf', 45, 1, 'published', '2025-06-12');

INSERT INTO categories (id, competition_id, discipline_id, sex, age_group_id, division_id, bell_kg, hands, time_limit_min, weight_class_raw, weight_class_kg, weight_class_is_open, participants_declared, is_deferred, sort_order) VALUES
  (1001, 1001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '63', 63, 0, 10, 0, 1),
  (1002, 1001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '68', 68, 0, 9, 0, 2);

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
  (1019, 1002, (SELECT id FROM athletes WHERE last_name = 'Леонов' AND first_name = 'Дмитрий' AND middle_name = 'Алексеевич' AND birth_year = 2003), 9, 32, NULL, 67.3, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Леонов Дмитрий Алексеевич', 'дюц "Старт"', 'Тюменская область', 1001, 37);

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
  (1019, 1019, 'long_cycle', 'both', 32);

