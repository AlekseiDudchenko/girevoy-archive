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
  ('Чувашская Республика', 'RU'),
  ('Астраханская область', 'RU'),
  ('Кемеровская область', 'RU'),
  ('Воронежская область', 'RU'),
  ('Липецкая область', 'RU'),
  ('Ярославская область', 'RU'),
  ('Удмуртская Республика', 'RU'),
  ('Нижегородская область', 'RU'),
  ('Республика Коми', 'RU'),
  ('Калининградская область', 'RU'),
  ('Ставропольский край', 'RU'),
  ('Самарская область', 'RU'),
  ('Свердловская область', 'RU'),
  ('Ленинградская область', 'RU'),
  ('Архангельская область', 'RU');

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
  ('МБУ ДО СШ "Уренгоец"', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')),
  ('ВС', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')),
  ('ВС', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')),
  ('Цсп Аненнки', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')),
  ('Томская федерация гиревого спорта', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')),
  ('олимп', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')),
  ('МБУДО СШ"ОСКОЛ"', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')),
  ('РО ООО ВФГС в Челябинской Области', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')),
  ('СШОР «Маршал»', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')),
  ('МУ ДО МЦРФКиС', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')),
  ('РО ООО «ВФГС» в г. Москве', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')),
  ('СК Атлант', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')),
  ('МКОУДО ЗАТО Знаменск СШ', (SELECT id FROM regions WHERE name = 'Астраханская область' AND country = 'RU')),
  ('МАУ ДО "КСШ КМО"', (SELECT id FROM regions WHERE name = 'Кемеровская область' AND country = 'RU')),
  ('МКУ ДО "Бобровская СШ имени В.Л. Паткина"', (SELECT id FROM regions WHERE name = 'Воронежская область' AND country = 'RU')),
  ('МБУ ДО "СШ Елецкого района"', (SELECT id FROM regions WHERE name = 'Липецкая область' AND country = 'RU')),
  ('МБУ ДО СШОР «Югория» им. А.А.', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')),
  ('БУ ДО города Омска "СШОР 33"', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')),
  ('ССК"КИТнаспорте"', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')),
  ('ЯВВУ ПВО', (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU')),
  ('ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')),
  ('атлет', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')),
  ('ВС', (SELECT id FROM regions WHERE name = 'Воронежская область' AND country = 'RU')),
  ('МАУ ДО СШОР "Метеор"', (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU')),
  ('-', (SELECT id FROM regions WHERE name = 'Удмуртская Республика' AND country = 'RU')),
  ('МАУ ДО "СШ №1" г.Тобольска', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')),
  ('Сшор маршал', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')),
  ('МБУ ДО "СШ" г. Новозыбкова', (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU')),
  ('ВС РФ', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')),
  ('МО РФ', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')),
  ('Федерация гиревого спорта Томской области', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')),
  ('РО ООО ВФГС в Нижегородской области', (SELECT id FROM regions WHERE name = 'Нижегородская область' AND country = 'RU')),
  ('ГБУ ДО МКСШОР "ЗАПАД" ОТДЕЛЕНИЕ " СЕМЕРКА"', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')),
  ('Атлет', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')),
  ('СШ 3. Г. Улан-Удэ', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')),
  ('самовыдвиженец', (SELECT id FROM regions WHERE name = 'Республика Коми' AND country = 'RU')),
  ('АМУ спортивный клуб Надежда', (SELECT id FROM regions WHERE name = 'Удмуртская Республика' AND country = 'RU')),
  ('ЦСП', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')),
  ('ВС РФ', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')),
  ('МБУДО "Куртамышская ДЮСШ"', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')),
  ('СШОР Маршал', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')),
  ('Вооруженные силы Российской Федераций', (SELECT id FROM regions WHERE name = 'Удмуртская Республика' AND country = 'RU')),
  ('МАУ ДО СШОР по силовым видам спорта', (SELECT id FROM regions WHERE name = 'Калининградская область' AND country = 'RU')),
  ('-', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')),
  ('Спортивная школа', (SELECT id FROM regions WHERE name = 'Ставропольский край' AND country = 'RU')),
  ('МАУ"ЦФОР-Ритм"', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')),
  ('Липецкая область', (SELECT id FROM regions WHERE name = 'Липецкая область' AND country = 'RU')),
  ('БПОУ УР "Ярский политехникум"', (SELECT id FROM regions WHERE name = 'Удмуртская Республика' AND country = 'RU')),
  ('Калуга', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')),
  ('МБУ ДО СШ «Татнефть Олимп»', (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU')),
  ('МКУ ДО "Бобровская СШ им. В.Л. Паткина"', (SELECT id FROM regions WHERE name = 'Воронежская область' AND country = 'RU')),
  ('Федерация гиревого спорта г. Москва', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')),
  ('МАУ ДО "Вагайский центр спорта и творчества"', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')),
  ('Динамо', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')),
  ('МБУДО "Лебяжьевская ДЮСШ"', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')),
  ('Вооружённые силы', (SELECT id FROM regions WHERE name = 'Краснодарский край' AND country = 'RU')),
  ('ООО РО "ВФГС" СО', (SELECT id FROM regions WHERE name = 'Самарская область' AND country = 'RU')),
  ('ВФГС в Курганской области', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')),
  ('ВС', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')),
  ('Динамо', (SELECT id FROM regions WHERE name = 'Свердловская область' AND country = 'RU')),
  ('СШ 3. г. Улан-Удэ', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')),
  ('Спортивная школа "Хастар"', (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU')),
  ('СШОР 5 г. Белгород', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')),
  ('ООО "ВФГС" СО', (SELECT id FROM regions WHERE name = 'Самарская область' AND country = 'RU')),
  ('-', (SELECT id FROM regions WHERE name = 'Ленинградская область' AND country = 'RU')),
  ('-', (SELECT id FROM regions WHERE name = 'Владимирская область' AND country = 'RU')),
  ('РО ООО "ВФГС" в Архангельской', (SELECT id FROM regions WHERE name = 'Архангельская область' AND country = 'RU')),
  ('ВС', (SELECT id FROM regions WHERE name = 'Удмуртская Республика' AND country = 'RU')),
  ('Спорт-ЛАЭС', (SELECT id FROM regions WHERE name = 'Ленинградская область' AND country = 'RU')),
  ('МАУ ДО СШОР по силовым видам', (SELECT id FROM regions WHERE name = 'Калининградская область' AND country = 'RU')),
  ('СШ "Энергия"', (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU')),
  ('Спорт школа " Олимп"', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'));

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
  (1006, 1001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '95', 95, 0, 14, 0, 6),
  (1007, 1001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '95+', 95, 1, 13, 0, 7),
  (1008, 1001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '58', 58, 0, 10, 0, 8),
  (1009, 1001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '63', 63, 0, 9, 0, 9),
  (1010, 1001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '68', 68, 0, 8, 0, 10),
  (1011, 1001, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '68+', 68, 1, 6, 0, 11),
  (1012, 1001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '63', 63, 0, 11, 0, 12),
  (1013, 1001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '68', 68, 0, 14, 0, 13),
  (1014, 1001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '73', 73, 0, 11, 0, 14),
  (1015, 1001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '78', 78, 0, 11, 0, 15),
  (1016, 1001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '85', 85, 0, 13, 0, 16),
  (1017, 1001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '95', 95, 0, 13, 0, 17),
  (1018, 1001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '95+', 95, 1, 12, 0, 18),
  (1019, 1001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '58', 58, 0, 10, 0, 19),
  (1020, 1001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '63', 63, 0, 8, 0, 20),
  (1021, 1001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '68', 68, 0, 7, 0, 21),
  (1022, 1001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '68+', 68, 1, 7, 0, 22),
  (1023, 1001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '63', 63, 0, 11, 0, 23),
  (1024, 1001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '68', 68, 0, 11, 0, 24),
  (1025, 1001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '73', 73, 0, 14, 0, 25),
  (1026, 1001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '78', 78, 0, 14, 0, 26),
  (1027, 1001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '85', 85, 0, 10, 0, 27),
  (1028, 1001, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '95', 95, 0, 14, 0, 28);

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
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Балабанов', 'Сергей', 'Андреевич', 1996, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Трофимов М.А., Леонов С.Т.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Балабанов' AND a.first_name = 'Сергей' AND a.middle_name = 'Андреевич' AND a.birth_year = 1996);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Шевелев', 'Дмитрий', 'Владимирович', 1989, 'm', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Рябченко А.В.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Шевелев' AND a.first_name = 'Дмитрий' AND a.middle_name = 'Владимирович' AND a.birth_year = 1989);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Стаханов', 'Валентин', 'Викторович', 1990, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Анасенко А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Стаханов' AND a.first_name = 'Валентин' AND a.middle_name = 'Викторович' AND a.birth_year = 1990);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Симашкевич', 'Евгений', 'Валентинович', 1991, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Анасенко А.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Симашкевич' AND a.first_name = 'Евгений' AND a.middle_name = 'Валентинович' AND a.birth_year = 1991);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Тихомиров', 'Владислав', 'Викторович', 1996, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф.' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Дубровин Д.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Тихомиров' AND a.first_name = 'Владислав' AND a.middle_name = 'Викторович' AND a.birth_year = 1996);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Июльский', 'Дмитрий', 'Валерьевич', 1993, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ГБУ ДО МКСШОР «Запад» Отделение' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Ландин А.Ю., Салов П.С., Соловьёв А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Июльский' AND a.first_name = 'Дмитрий' AND a.middle_name = 'Валерьевич' AND a.birth_year = 1993);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Чирков', 'Леонид', 'Евгеньевич', 2003, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Цсп Аненнки' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Трофимов М.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Чирков' AND a.first_name = 'Леонид' AND a.middle_name = 'Евгеньевич' AND a.birth_year = 2003);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Петрухин', 'Егор', 'Игоревич', 2005, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Томская федерация гиревого спорта' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Коршунов С.Д., Перемитин Ф.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Петрухин' AND a.first_name = 'Егор' AND a.middle_name = 'Игоревич' AND a.birth_year = 2005);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Константинов', 'Александр', 'Иванович', 2003, 'm', (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ Энергия' AND region_id = (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU')), 'Глинкин Б.Н., Федоров О.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Константинов' AND a.first_name = 'Александр' AND a.middle_name = 'Иванович' AND a.birth_year = 2003);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Авдеев', 'Григорий', 'Николаевич', 1992, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'олимп' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Нестеренко Д. В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Авдеев' AND a.first_name = 'Григорий' AND a.middle_name = 'Николаевич' AND a.birth_year = 1992);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Слащев', 'Степан', 'Сергеевич', 2008, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ГБУ ДО МКСШОР «Запад» Отделение' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Володин Д.И., Ландин А.Ю., Соколов Н.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Слащев' AND a.first_name = 'Степан' AND a.middle_name = 'Сергеевич' AND a.birth_year = 2008);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Фартучный', 'Иван', 'Сергеевич', 2007, 'm', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУДО СШ"ОСКОЛ"' AND region_id = (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')), 'Ермаков К.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Фартучный' AND a.first_name = 'Иван' AND a.middle_name = 'Сергеевич' AND a.birth_year = 2007);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Денисов', 'Иван', 'Николаевич', 1982, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО ВФГС в Челябинской Области' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Симушин А.М.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Денисов' AND a.first_name = 'Иван' AND a.middle_name = 'Николаевич' AND a.birth_year = 1982);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Трофимова', 'Милена', 'Михайловна', 2007, 'f', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР «Маршал»' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Пянко И.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Трофимова' AND a.first_name = 'Милена' AND a.middle_name = 'Михайловна' AND a.birth_year = 2007);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Прохорова', 'Ангелина', 'Вячеславовна', 2005, 'f', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МУ ДО МЦРФКиС' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Бутенко И.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Прохорова' AND a.first_name = 'Ангелина' AND a.middle_name = 'Вячеславовна' AND a.birth_year = 2005);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Лазарева', 'Анастасия', 'Александровна', 1991, 'f', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Петров В.М.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Лазарева' AND a.first_name = 'Анастасия' AND a.middle_name = 'Александровна' AND a.birth_year = 1991);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Подольская', 'Анастасия', 'Владимировна', 2005, 'f', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО «ВФГС» в г. Москве' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Соловьев А.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Подольская' AND a.first_name = 'Анастасия' AND a.middle_name = 'Владимировна' AND a.birth_year = 2005);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Чернова', 'Кира', 'Николаевна', 2009, 'f', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР МАРШАЛ' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Барбакова Н.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Чернова' AND a.first_name = 'Кира' AND a.middle_name = 'Николаевна' AND a.birth_year = 2009);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Спасенникова', 'Валерия', 'Витальевна', 2008, 'f', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СК Атлант' AND region_id = (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')), 'Спасенников А.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Спасенникова' AND a.first_name = 'Валерия' AND a.middle_name = 'Витальевна' AND a.birth_year = 2008);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Молчанова', 'Виктория', 'Николаевна', 2008, 'f', (SELECT id FROM regions WHERE name = 'Астраханская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МКОУДО ЗАТО Знаменск СШ' AND region_id = (SELECT id FROM regions WHERE name = 'Астраханская область' AND country = 'RU')), 'Бирюков С.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Молчанова' AND a.first_name = 'Виктория' AND a.middle_name = 'Николаевна' AND a.birth_year = 2008);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Семирунняя', 'Александра', 'Витальевна', 2006, 'f', (SELECT id FROM regions WHERE name = 'Ростовская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РСОО "ФГС РО"' AND region_id = (SELECT id FROM regions WHERE name = 'Ростовская область' AND country = 'RU')), 'Семирунний В.А., Потапов С.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Семирунняя' AND a.first_name = 'Александра' AND a.middle_name = 'Витальевна' AND a.birth_year = 2006);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Меденцева', 'Дарья', 'Александровна', 2004, 'f', (SELECT id FROM regions WHERE name = 'Кемеровская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО "КСШ КМО"' AND region_id = (SELECT id FROM regions WHERE name = 'Кемеровская область' AND country = 'RU')), 'Шляхова Д.П.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Меденцева' AND a.first_name = 'Дарья' AND a.middle_name = 'Александровна' AND a.birth_year = 2004);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ныныч', 'Маргарита', 'Анатольевна', 1996, 'f', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Рассадин А.А., Трофимов М.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ныныч' AND a.first_name = 'Маргарита' AND a.middle_name = 'Анатольевна' AND a.birth_year = 1996);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Барбакова', 'Александра', 'Максимовна', 2004, 'f', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР «Маршал»' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Пянко И.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Барбакова' AND a.first_name = 'Александра' AND a.middle_name = 'Максимовна' AND a.birth_year = 2004);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Матвеева', 'Елена', 'Евгеньевна', 1974, 'f', (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КОГАУ «СШОР «Юность»' AND region_id = (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU')), 'Малков Е.И.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Матвеева' AND a.first_name = 'Елена' AND a.middle_name = 'Евгеньевна' AND a.birth_year = 1974);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бутенко', 'Милена', 'Александровна', 2004, 'f', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МУ ДО МЦРФКиС' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Бутенко А.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бутенко' AND a.first_name = 'Милена' AND a.middle_name = 'Александровна' AND a.birth_year = 2004);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Фирулева', 'Василиса', 'Владимировна', 2004, 'f', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ "Уренгоец"' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Бабичев М.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Фирулева' AND a.first_name = 'Василиса' AND a.middle_name = 'Владимировна' AND a.birth_year = 2004);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Степанова', 'Оксана', 'Анатольевна', 1990, 'f', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО ВФГС в Челябинской Области' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Денисов И.Н., Степанов С.В., Трофимов М.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Степанова' AND a.first_name = 'Оксана' AND a.middle_name = 'Анатольевна' AND a.birth_year = 1990);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Щекина', 'Алина', 'Игоревна', 1996, 'f', (SELECT id FROM regions WHERE name = 'Ростовская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РСОО "ФГС РО"' AND region_id = (SELECT id FROM regions WHERE name = 'Ростовская область' AND country = 'RU')), 'Морозов И.В., Фоменко А.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Щекина' AND a.first_name = 'Алина' AND a.middle_name = 'Игоревна' AND a.birth_year = 1996);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Альянова', 'Виктория', 'Евгеньевна', 2004, 'f', (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР по борьбе' AND region_id = (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU')), 'Гомонов В.Н., Лукьянчиков Ю.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Альянова' AND a.first_name = 'Виктория' AND a.middle_name = 'Евгеньевна' AND a.birth_year = 2004);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Герман', 'Алена', 'Сергеевна', 1997, 'f', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф.' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Семенов А.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Герман' AND a.first_name = 'Алена' AND a.middle_name = 'Сергеевна' AND a.birth_year = 1997);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Переплетова', 'Яна', 'Васильевна', 2009, 'f', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ГБУ ДО МКСШОР «Запад» Отделение' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Ландин А.Ю.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Переплетова' AND a.first_name = 'Яна' AND a.middle_name = 'Васильевна' AND a.birth_year = 2009);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Воропаева', 'Виктория', 'Витальевна', 2004, 'f', (SELECT id FROM regions WHERE name = 'Воронежская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МКУ ДО "Бобровская СШ имени В.Л. Паткина"' AND region_id = (SELECT id FROM regions WHERE name = 'Воронежская область' AND country = 'RU')), 'Сорокин Н.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Воропаева' AND a.first_name = 'Виктория' AND a.middle_name = 'Витальевна' AND a.birth_year = 2004);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кошурникова', 'Анастасия', 'Александровна', 2003, 'f', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР «Югория» им. А.А. Пилояна' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Шпартко М.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кошурникова' AND a.first_name = 'Анастасия' AND a.middle_name = 'Александровна' AND a.birth_year = 2003);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Сатлыкова', 'Эльвира', 'Рафисовна', 2000, 'f', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ №1 им. Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Павлов С.П.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Сатлыкова' AND a.first_name = 'Эльвира' AND a.middle_name = 'Рафисовна' AND a.birth_year = 2000);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Мартынова', 'Любовь', 'Владимировна', 2007, 'f', (SELECT id FROM regions WHERE name = 'Астраханская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МКОУДО ЗАТО Знаменск СШ' AND region_id = (SELECT id FROM regions WHERE name = 'Астраханская область' AND country = 'RU')), 'Бирюков С.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Мартынова' AND a.first_name = 'Любовь' AND a.middle_name = 'Владимировна' AND a.birth_year = 2007);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Попова', 'Ангелина', 'Владимировна', 2009, 'f', (SELECT id FROM regions WHERE name = 'Липецкая область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО "СШ Елецкого района"' AND region_id = (SELECT id FROM regions WHERE name = 'Липецкая область' AND country = 'RU')), 'Коробейников А.Г.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Попова' AND a.first_name = 'Ангелина' AND a.middle_name = 'Владимировна' AND a.birth_year = 2009);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Любина', 'Александра', 'Анатольевна', 2005, 'f', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР «Югория» им. А.А.' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Шпартко М.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Любина' AND a.first_name = 'Александра' AND a.middle_name = 'Анатольевна' AND a.birth_year = 2005);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ельчанинова', 'Вероника', 'Сергеевна', 2003, 'f', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР 33' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Елисеева Н.А., Переверзев Н.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ельчанинова' AND a.first_name = 'Вероника' AND a.middle_name = 'Сергеевна' AND a.birth_year = 2003);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кутенкова', 'Анастасия', 'Михайловна', 1997, 'f', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Леонов С.Т., Бобылев А.Л.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кутенкова' AND a.first_name = 'Анастасия' AND a.middle_name = 'Михайловна' AND a.birth_year = 1997);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Мартынова', 'Ирина', 'Александровна', 1999, 'f', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР «Маршал»' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Трофимов М.А.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Мартынова' AND a.first_name = 'Ирина' AND a.middle_name = 'Александровна' AND a.birth_year = 1999);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Врубель', 'Дарья', 'Васильевна', 2000, 'f', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'БУ ДО города Омска "СШОР 33"' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Сагандыков К.К., Переверзев Н.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Врубель' AND a.first_name = 'Дарья' AND a.middle_name = 'Васильевна' AND a.birth_year = 2000);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Побережная', 'Анна', 'Владимировна', 2010, 'f', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР «Маршал»' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Пянко И.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Побережная' AND a.first_name = 'Анна' AND a.middle_name = 'Владимировна' AND a.birth_year = 2010);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Махкамова', 'Парвина', 'Маруфовна', 2007, 'f', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШ «Прикамье» г. Перми' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Мошев Д.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Махкамова' AND a.first_name = 'Парвина' AND a.middle_name = 'Маруфовна' AND a.birth_year = 2007);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Яськова', 'Елена', 'Григорьевна', 2023, 'f', (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР по борьбе' AND region_id = (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU')), 'Гомонов В.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Яськова' AND a.first_name = 'Елена' AND a.middle_name = 'Григорьевна' AND a.birth_year = 2023);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Попова', 'Мария', 'Алексеевна', 2005, 'f', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ССК"КИТнаспорте"' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Паклин П.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Попова' AND a.first_name = 'Мария' AND a.middle_name = 'Алексеевна' AND a.birth_year = 2005);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бенидзе', 'Джони', 'Бадриевич', 1990, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Кириллов С.А.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бенидзе' AND a.first_name = 'Джони' AND a.middle_name = 'Бадриевич' AND a.birth_year = 1990);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Арсентьев', 'Виталий', 'Александрович', 2001, 'm', (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ЯВВУ ПВО' AND region_id = (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU')), 'Елькин Ю.Г., Кузнецов О.Г.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Арсентьев' AND a.first_name = 'Виталий' AND a.middle_name = 'Александрович' AND a.birth_year = 2001);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ховалко', 'Василий', 'Михайлович', 1993, 'm', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ "Уренгоец"' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Бабичев М.А., Донских А.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ховалко' AND a.first_name = 'Василий' AND a.middle_name = 'Михайлович' AND a.birth_year = 1993);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Маринкин', 'Егор', 'Андреевич', 2003, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Ландин А.Ю., Турищев Д.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Маринкин' AND a.first_name = 'Егор' AND a.middle_name = 'Андреевич' AND a.birth_year = 2003);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Степанов', 'Николай', 'Андреевич', 1997, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'атлет' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Симушин А.М., Дедюхин И.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Степанов' AND a.first_name = 'Николай' AND a.middle_name = 'Андреевич' AND a.birth_year = 1997);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Утев', 'Руслан', 'Андреевич', 2005, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШ «Прикамье» г. Перми' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Мошев Д.И., Маматов Г.Т.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Утев' AND a.first_name = 'Руслан' AND a.middle_name = 'Андреевич' AND a.birth_year = 2005);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Шилинцев', 'Николай', 'Олегович', 2006, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Литвинко В.С., Барков А.П.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Шилинцев' AND a.first_name = 'Николай' AND a.middle_name = 'Олегович' AND a.birth_year = 2006);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Зуев', 'Владислав', 'Алексеевич', 2000, 'm', (SELECT id FROM regions WHERE name = 'Воронежская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Воронежская область' AND country = 'RU')), 'Колесниченко Н.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Зуев' AND a.first_name = 'Владислав' AND a.middle_name = 'Алексеевич' AND a.birth_year = 2000);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Щербин', 'Олег', 'Владимирович', 1989, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Никифоров А.В.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Щербин' AND a.first_name = 'Олег' AND a.middle_name = 'Владимирович' AND a.birth_year = 1989);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Узюкин', 'Анатолий', 'Эдуардович', 2000, 'm', (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ Энергия' AND region_id = (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU')), 'Глинкин Б.Н., Федоров О.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Узюкин' AND a.first_name = 'Анатолий' AND a.middle_name = 'Эдуардович' AND a.birth_year = 2000);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Лисицын', 'Кирилл', 'Сергеевич', 2007, 'm', (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШОР "Метеор"' AND region_id = (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU')), 'Егоров В.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Лисицын' AND a.first_name = 'Кирилл' AND a.middle_name = 'Сергеевич' AND a.birth_year = 2007);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Громов', 'Алексей', 'Николаевич', 1995, 'm', (SELECT id FROM regions WHERE name = 'Удмуртская Республика' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'Удмуртская Республика' AND country = 'RU')), 'Жибинов Ф.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Громов' AND a.first_name = 'Алексей' AND a.middle_name = 'Николаевич' AND a.birth_year = 1995);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Айдбаев', 'Ильфат', 'Наильевич', 1989, 'm', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО "СШ №1" г.Тобольска' AND region_id = (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')), 'Калмаков С.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Айдбаев' AND a.first_name = 'Ильфат' AND a.middle_name = 'Наильевич' AND a.birth_year = 1989);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бенидзе', 'Спартак', 'Бадриевич', 2002, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Бенидзе А.А., Бенидзе Д.Б.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бенидзе' AND a.first_name = 'Спартак' AND a.middle_name = 'Бадриевич' AND a.birth_year = 2002);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Башаров', 'Ислам', 'Нурисламович', 2006, 'm', (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РОО ФГС РТ' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU')), 'Федоров В.Н., Башаров Н.М.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Башаров' AND a.first_name = 'Ислам' AND a.middle_name = 'Нурисламович' AND a.birth_year = 2006);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Пихтарь', 'Георгий', 'Евгеньевич', 2008, 'm', (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО "СШ" г. Новозыбкова' AND region_id = (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU')), 'Беляев И.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Пихтарь' AND a.first_name = 'Георгий' AND a.middle_name = 'Евгеньевич' AND a.birth_year = 2008);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Башаров', 'Арыслан', 'Нурисламович', 2007, 'm', (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РОО ФГС РТ' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU')), 'Федоров В.Н., Башаров Н.М.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Башаров' AND a.first_name = 'Арыслан' AND a.middle_name = 'Нурисламович' AND a.birth_year = 2007);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бобров', 'Владимир', 'Сергеевич', 1989, 'm', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС РФ' AND region_id = (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')), 'Лесников П.Я., Бакум К.Е.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бобров' AND a.first_name = 'Владимир' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1989);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Рассадин', 'Андрей', 'Андреевич', 1989, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Леонов С.Т., Руднев С.Л.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Рассадин' AND a.first_name = 'Андрей' AND a.middle_name = 'Андреевич' AND a.birth_year = 1989);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Крюков', 'Дмитрий', 'Андреевич', 1993, 'm', (SELECT id FROM regions WHERE name = 'Нижегородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО ВФГС в Нижегородской области' AND region_id = (SELECT id FROM regions WHERE name = 'Нижегородская область' AND country = 'RU')), 'Маркичев Э.Ф.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Крюков' AND a.first_name = 'Дмитрий' AND a.middle_name = 'Андреевич' AND a.birth_year = 1993);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Белов', 'Дмитрий', 'Сергеевич', 2008, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Володин Д.И., Соколов Н.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Белов' AND a.first_name = 'Дмитрий' AND a.middle_name = 'Сергеевич' AND a.birth_year = 2008);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Аксентьев', 'Данил', 'Андреевич', 2003, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Атлет' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Денисов И.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Аксентьев' AND a.first_name = 'Данил' AND a.middle_name = 'Андреевич' AND a.birth_year = 2003);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Сулейманов', 'Мовсар', 'Мусаевич', 1989, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Маршал"' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Трофимов М.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Сулейманов' AND a.first_name = 'Мовсар' AND a.middle_name = 'Мусаевич' AND a.birth_year = 1989);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кожевников', 'Сергей', 'Павлович', 2008, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ 3. Г. Улан-Удэ' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Алексеев В.И., Рассадин А.А., Коломин Д.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кожевников' AND a.first_name = 'Сергей' AND a.middle_name = 'Павлович' AND a.birth_year = 2008);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ташланов', 'Илья', 'Станиставович', 1987, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО ВФГС в Челябинской Области' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Денисов И.Н.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ташланов' AND a.first_name = 'Илья' AND a.middle_name = 'Станиставович' AND a.birth_year = 1987);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Степанов', 'Сергей', 'Владимирович', 1993, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РОООО ВФГС в Челябинской области' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Трофимов М.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Степанов' AND a.first_name = 'Сергей' AND a.middle_name = 'Владимирович' AND a.birth_year = 1993);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Шаишников', 'Даниил', 'Андреевич', 2008, 'm', (SELECT id FROM regions WHERE name = 'Астраханская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МКОУДО ЗАТО Знаменск СШ' AND region_id = (SELECT id FROM regions WHERE name = 'Астраханская область' AND country = 'RU')), 'Бирюков С.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Шаишников' AND a.first_name = 'Даниил' AND a.middle_name = 'Андреевич' AND a.birth_year = 2008);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Иванов', 'Виталий', 'Викторович', 1978, 'm', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР «Югория» им. А.А. Пилояна' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Шпартко М.А., Шульга Н.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Иванов' AND a.first_name = 'Виталий' AND a.middle_name = 'Викторович' AND a.birth_year = 1978);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ладе', 'Роман', 'Андреевич', 1991, 'm', (SELECT id FROM regions WHERE name = 'Республика Коми' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'самовыдвиженец' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Коми' AND country = 'RU')), 'Рассадин А.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ладе' AND a.first_name = 'Роман' AND a.middle_name = 'Андреевич' AND a.birth_year = 1991);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Богатов', 'Иван', 'Сергеевич', 2004, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Рассадин А.А., Любимский С.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Богатов' AND a.first_name = 'Иван' AND a.middle_name = 'Сергеевич' AND a.birth_year = 2004);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Маликов', 'Данил', 'Дамирович', 2001, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШ «Прикамье» г. Перми' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Мошев Д.И., Панфилов Г.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Маликов' AND a.first_name = 'Данил' AND a.middle_name = 'Дамирович' AND a.birth_year = 2001);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Шиляев', 'Иван', 'Николаевич', 1996, 'm', (SELECT id FROM regions WHERE name = 'Удмуртская Республика' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'АМУ спортивный клуб Надежда' AND region_id = (SELECT id FROM regions WHERE name = 'Удмуртская Республика' AND country = 'RU')), 'Стрелков И.Р., Несмелов В.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Шиляев' AND a.first_name = 'Иван' AND a.middle_name = 'Николаевич' AND a.birth_year = 1996);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бородынкин', 'Олег', 'Александрович', 2002, 'm', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Баер П.А., Бутенко И.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бородынкин' AND a.first_name = 'Олег' AND a.middle_name = 'Александрович' AND a.birth_year = 2002);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Плотников', 'Вячеслав', 'Евгеньевич', 1998, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО ВФГС в Челябинской Области' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Симушин А.М., Денисов И.Н., Потапов О.Ю.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Плотников' AND a.first_name = 'Вячеслав' AND a.middle_name = 'Евгеньевич' AND a.birth_year = 1998);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Курдюков', 'Василий', 'Сергеевич', 1997, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ЦСП' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Анасенко А.В., Климов А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Курдюков' AND a.first_name = 'Василий' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1997);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Анасенко', 'Антон', 'Владимирович', 1979, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС РФ' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Самостоятельно', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Анасенко' AND a.first_name = 'Антон' AND a.middle_name = 'Владимирович' AND a.birth_year = 1979);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Битков', 'Антон', 'Николаевич', 1994, 'm', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУДО "Куртамышская ДЮСШ"' AND region_id = (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')), 'Самостоятельно', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Битков' AND a.first_name = 'Антон' AND a.middle_name = 'Николаевич' AND a.birth_year = 1994);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ивановский', 'Данила', 'Николаевич', 2006, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Маршал"' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Барбакова Н.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ивановский' AND a.first_name = 'Данила' AND a.middle_name = 'Николаевич' AND a.birth_year = 2006);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Сисейкин', 'Максим', 'Сергеевич', 1993, 'm', (SELECT id FROM regions WHERE name = 'Владимирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Владимирская область' AND region_id = (SELECT id FROM regions WHERE name = 'Владимирская область' AND country = 'RU')), 'Крупин А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Сисейкин' AND a.first_name = 'Максим' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1993);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Крестьянинов', 'Виктор', 'Александрович', 2000, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШ «Прикамье» г. Перми' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Мошев Д.И., Панфилов Г.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Крестьянинов' AND a.first_name = 'Виктор' AND a.middle_name = 'Александрович' AND a.birth_year = 2000);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Гуров', 'Владимир', 'Анатольевич', 1978, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР Маршал' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Трофимов М.А.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Гуров' AND a.first_name = 'Владимир' AND a.middle_name = 'Анатольевич' AND a.birth_year = 1978);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Булдаков', 'Никита', 'Юрьевич', 1997, 'm', (SELECT id FROM regions WHERE name = 'Удмуртская Республика' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Вооруженные силы Российской Федераций' AND region_id = (SELECT id FROM regions WHERE name = 'Удмуртская Республика' AND country = 'RU')), 'Веретенников С.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Булдаков' AND a.first_name = 'Никита' AND a.middle_name = 'Юрьевич' AND a.birth_year = 1997);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Житихин', 'Владислав', 'Николаевич', 1994, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Рассадин А.А., Леонов С.Т.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Житихин' AND a.first_name = 'Владислав' AND a.middle_name = 'Николаевич' AND a.birth_year = 1994);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Черкашин', 'Иван', 'Андревич', 1999, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ОГАУДО Томская областная СШОР' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Тимофеев Н.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Черкашин' AND a.first_name = 'Иван' AND a.middle_name = 'Андревич' AND a.birth_year = 1999);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кравченко', 'Сергей', 'Сергеевич', 1982, 'm', (SELECT id FROM regions WHERE name = 'Калининградская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШОР по силовым видам спорта' AND region_id = (SELECT id FROM regions WHERE name = 'Калининградская область' AND country = 'RU')), 'Бабушкин М.Б.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кравченко' AND a.first_name = 'Сергей' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1982);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Спичкин', 'Алексей', 'Евгеньевич', 1994, 'm', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Бобров В.С.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Спичкин' AND a.first_name = 'Алексей' AND a.middle_name = 'Евгеньевич' AND a.birth_year = 1994);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Салихов', 'Рустам', 'Ренатович', 1982, 'm', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Фунтиков Н.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Салихов' AND a.first_name = 'Рустам' AND a.middle_name = 'Ренатович' AND a.birth_year = 1982);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Марков', 'Иван', 'Эдуардович', 1995, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Семенов А.Н., Труль А.Р.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Марков' AND a.first_name = 'Иван' AND a.middle_name = 'Эдуардович' AND a.birth_year = 1995);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Орлов', 'Сергей', 'Александрович', 2005, 'm', (SELECT id FROM regions WHERE name = 'Ставропольский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Спортивная школа' AND region_id = (SELECT id FROM regions WHERE name = 'Ставропольский край' AND country = 'RU')), 'Петров В.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Орлов' AND a.first_name = 'Сергей' AND a.middle_name = 'Александрович' AND a.birth_year = 2005);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Вдовенко', 'Александр', 'Андреевич', 1995, 'm', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Курганская область' AND region_id = (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')), 'Стрекаловских С.К., Стрекаловских Н.С.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Вдовенко' AND a.first_name = 'Александр' AND a.middle_name = 'Андреевич' AND a.birth_year = 1995);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Чеботарев', 'Юрий', 'Юрьевич', 1989, 'm', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ"ЦФОР-Ритм"' AND region_id = (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')), 'Даричев Е.Н., Андреев И.Г.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Чеботарев' AND a.first_name = 'Юрий' AND a.middle_name = 'Юрьевич' AND a.birth_year = 1989);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Башаров', 'Нурислам', 'Магсумович', 1983, 'm', (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РОО ФГС РТ' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU')), 'Федоров В.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Башаров' AND a.first_name = 'Нурислам' AND a.middle_name = 'Магсумович' AND a.birth_year = 1983);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Шереметов', 'Александр', 'Владимирович', 1990, 'm', (SELECT id FROM regions WHERE name = 'Липецкая область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Липецкая область' AND region_id = (SELECT id FROM regions WHERE name = 'Липецкая область' AND country = 'RU')), 'Макаричев С.С., Кравцов А.Ю.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Шереметов' AND a.first_name = 'Александр' AND a.middle_name = 'Владимирович' AND a.birth_year = 1990);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Соболев', 'Никита', 'Александрович', 2006, 'm', (SELECT id FROM regions WHERE name = 'Удмуртская Республика' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'БПОУ УР "Ярский политехникум"' AND region_id = (SELECT id FROM regions WHERE name = 'Удмуртская Республика' AND country = 'RU')), 'Веретенников С.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Соболев' AND a.first_name = 'Никита' AND a.middle_name = 'Александрович' AND a.birth_year = 2006);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Зуев', 'Илья', 'Александрович', 2007, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШ «Прикамье» г. Перми' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Мошев Д.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Зуев' AND a.first_name = 'Илья' AND a.middle_name = 'Александрович' AND a.birth_year = 2007);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Тарвердиева', 'Мария', 'Алексеевна', 1986, 'f', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Семенов А.Н., Руднев С.Л.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Тарвердиева' AND a.first_name = 'Мария' AND a.middle_name = 'Алексеевна' AND a.birth_year = 1986);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Пузанкова', 'Анастасия', 'Константиновна', 2006, 'f', (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ «Татнефть Олимп»' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU')), 'Гиниатуллин А.З.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Пузанкова' AND a.first_name = 'Анастасия' AND a.middle_name = 'Константиновна' AND a.birth_year = 2006);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Сергеева', 'Юлия', 'Александровна', 1980, 'f', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Федерация гиревого спорта г. Москва' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Трофимов М.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Сергеева' AND a.first_name = 'Юлия' AND a.middle_name = 'Александровна' AND a.birth_year = 1980);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Верховцева', 'Екатерина', 'Николаевна', 2003, 'f', (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШОР "Метеор"' AND region_id = (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU')), 'Гоголев М.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Верховцева' AND a.first_name = 'Екатерина' AND a.middle_name = 'Николаевна' AND a.birth_year = 2003);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кузьмичева', 'Ксения', 'Сергеевна', 2004, 'f', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ №1 им. Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Павлов С.П., Ерохин А.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кузьмичева' AND a.first_name = 'Ксения' AND a.middle_name = 'Сергеевна' AND a.birth_year = 2004);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Петелин', 'Александр', 'Владимирович', 1987, 'm', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО "Вагайский центр спорта и творчества"' AND region_id = (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')), 'Колмаков С.И., Айдбаев И.Н., Усольцев А.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Петелин' AND a.first_name = 'Александр' AND a.middle_name = 'Владимирович' AND a.birth_year = 1987);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ильясов', 'Какен', 'Канатович', 1993, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Анасенко А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ильясов' AND a.first_name = 'Какен' AND a.middle_name = 'Канатович' AND a.birth_year = 1993);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Петушков', 'Денис', 'Владимирович', 1986, 'm', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Динамо' AND region_id = (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')), 'Сергеев С.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Петушков' AND a.first_name = 'Денис' AND a.middle_name = 'Владимирович' AND a.birth_year = 1986);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Потапов', 'Данил', 'Алексеевич', 2002, 'm', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУДО "Лебяжьевская ДЮСШ"' AND region_id = (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')), 'Яхнич Е.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Потапов' AND a.first_name = 'Данил' AND a.middle_name = 'Алексеевич' AND a.birth_year = 2002);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Мащенко', 'Олег', 'Валерьевич', 1983, 'm', (SELECT id FROM regions WHERE name = 'Краснодарский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Вооружённые силы' AND region_id = (SELECT id FROM regions WHERE name = 'Краснодарский край' AND country = 'RU')), 'Мащенко В.С.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Мащенко' AND a.first_name = 'Олег' AND a.middle_name = 'Валерьевич' AND a.birth_year = 1983);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Балдин', 'Александр', 'Васильевич', 1993, 'm', (SELECT id FROM regions WHERE name = 'Самарская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ООО РО "ВФГС" СО' AND region_id = (SELECT id FROM regions WHERE name = 'Самарская область' AND country = 'RU')), 'Бахтов И.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Балдин' AND a.first_name = 'Александр' AND a.middle_name = 'Васильевич' AND a.birth_year = 1993);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Суслов', 'Александр', 'Владимирович', 1986, 'm', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВФГС в Курганской области' AND region_id = (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')), 'Стрекаловских С.К.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Суслов' AND a.first_name = 'Александр' AND a.middle_name = 'Владимирович' AND a.birth_year = 1986);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Васин', 'Артём', 'Иывнович', 2007, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Маршал"' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Пянко И.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Васин' AND a.first_name = 'Артём' AND a.middle_name = 'Иывнович' AND a.birth_year = 2007);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Квашнин', 'Михаил', 'Федорович', 1988, 'm', (SELECT id FROM regions WHERE name = 'Свердловская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Динамо' AND region_id = (SELECT id FROM regions WHERE name = 'Свердловская область' AND country = 'RU')), 'Чагаев А.Е., Хвостов А.В.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Квашнин' AND a.first_name = 'Михаил' AND a.middle_name = 'Федорович' AND a.birth_year = 1988);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Иванов', 'Алексей', 'Валерьевич', 1995, 'm', (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ Энергия' AND region_id = (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU')), 'Глинкин Б.Н.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Иванов' AND a.first_name = 'Алексей' AND a.middle_name = 'Валерьевич' AND a.birth_year = 1995);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Алексеев', 'Радиф', 'Дамирович', 1989, 'm', (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Спортивная школа "Хастар"' AND region_id = (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU')), 'Бронюков Ю.А., Максимов С.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Алексеев' AND a.first_name = 'Радиф' AND a.middle_name = 'Дамирович' AND a.birth_year = 1989);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Дьячков', 'Олег', 'Сергеевич', 1995, 'm', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР 5 г. Белгород' AND region_id = (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')), 'Меркулин С.В.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Дьячков' AND a.first_name = 'Олег' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1995);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бахтов', 'Илья', 'Владимирович', 1989, 'm', (SELECT id FROM regions WHERE name = 'Самарская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ООО "ВФГС" СО' AND region_id = (SELECT id FROM regions WHERE name = 'Самарская область' AND country = 'RU')), 'Балдин А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бахтов' AND a.first_name = 'Илья' AND a.middle_name = 'Владимирович' AND a.birth_year = 1989);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Малиновский', 'Семён', 'Андреевич', 1989, 'm', (SELECT id FROM regions WHERE name = 'Ленинградская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'Ленинградская область' AND country = 'RU')), 'Виноградов М.Е.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Малиновский' AND a.first_name = 'Семён' AND a.middle_name = 'Андреевич' AND a.birth_year = 1989);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ветров', 'Денис', 'Сергеевич', 1989, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '-' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Самостоятельно', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ветров' AND a.first_name = 'Денис' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1989);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Поздеев', 'Андрей', 'Николаевич', 1990, 'm', (SELECT id FROM regions WHERE name = 'Архангельская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО "ВФГС" в Архангельской' AND region_id = (SELECT id FROM regions WHERE name = 'Архангельская область' AND country = 'RU')), 'Хвостов А.В., Сахаров Н.Л.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Поздеев' AND a.first_name = 'Андрей' AND a.middle_name = 'Николаевич' AND a.birth_year = 1990);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Спесивцев', 'Даниила', 'Владимирович', 2003, 'm', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР 5 г Белгород' AND region_id = (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')), 'Вильган А.П., Поляков М.Ю.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Спесивцев' AND a.first_name = 'Даниила' AND a.middle_name = 'Владимирович' AND a.birth_year = 2003);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Давыдов', 'Антон', 'Александрович', 1982, 'm', (SELECT id FROM regions WHERE name = 'Ленинградская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Спорт-ЛАЭС' AND region_id = (SELECT id FROM regions WHERE name = 'Ленинградская область' AND country = 'RU')), 'Виноградов М.Е.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Давыдов' AND a.first_name = 'Антон' AND a.middle_name = 'Александрович' AND a.birth_year = 1982);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Енедеров', 'Димитрий', 'Николаевич', 1984, 'm', (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ "Энергия"' AND region_id = (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU')), 'Глинкин Б. Н., Федоров О.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Енедеров' AND a.first_name = 'Димитрий' AND a.middle_name = 'Николаевич' AND a.birth_year = 1984);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Гулов', 'Фарход', 'Абдурахмонович', 1997, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Спорт школа " Олимп"' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Нестеренко Д. В., Романов И.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Гулов' AND a.first_name = 'Фарход' AND a.middle_name = 'Абдурахмонович' AND a.birth_year = 1997);

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
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'balabanov-sergey-1996' AND s.athlete_id <> a.id)
              THEN 'balabanov-sergey-1996-' || a.id ELSE 'balabanov-sergey-1996' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Балабанов' AND first_name = 'Сергей' AND middle_name = 'Андреевич' AND birth_year = 1996)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'shevelev-dmitriy-1989' AND s.athlete_id <> a.id)
              THEN 'shevelev-dmitriy-1989-' || a.id ELSE 'shevelev-dmitriy-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Шевелев' AND first_name = 'Дмитрий' AND middle_name = 'Владимирович' AND birth_year = 1989)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'stahanov-valentin-1990' AND s.athlete_id <> a.id)
              THEN 'stahanov-valentin-1990-' || a.id ELSE 'stahanov-valentin-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Стаханов' AND first_name = 'Валентин' AND middle_name = 'Викторович' AND birth_year = 1990)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'simashkevich-evgeniy-1991' AND s.athlete_id <> a.id)
              THEN 'simashkevich-evgeniy-1991-' || a.id ELSE 'simashkevich-evgeniy-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Симашкевич' AND first_name = 'Евгений' AND middle_name = 'Валентинович' AND birth_year = 1991)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'tihomirov-vladislav-1996' AND s.athlete_id <> a.id)
              THEN 'tihomirov-vladislav-1996-' || a.id ELSE 'tihomirov-vladislav-1996' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Тихомиров' AND first_name = 'Владислав' AND middle_name = 'Викторович' AND birth_year = 1996)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'iyulskiy-dmitriy-1993' AND s.athlete_id <> a.id)
              THEN 'iyulskiy-dmitriy-1993-' || a.id ELSE 'iyulskiy-dmitriy-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Июльский' AND first_name = 'Дмитрий' AND middle_name = 'Валерьевич' AND birth_year = 1993)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'chirkov-leonid-2003' AND s.athlete_id <> a.id)
              THEN 'chirkov-leonid-2003-' || a.id ELSE 'chirkov-leonid-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Чирков' AND first_name = 'Леонид' AND middle_name = 'Евгеньевич' AND birth_year = 2003)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'petruhin-egor-2005' AND s.athlete_id <> a.id)
              THEN 'petruhin-egor-2005-' || a.id ELSE 'petruhin-egor-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Петрухин' AND first_name = 'Егор' AND middle_name = 'Игоревич' AND birth_year = 2005)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'konstantinov-aleksandr-2003' AND s.athlete_id <> a.id)
              THEN 'konstantinov-aleksandr-2003-' || a.id ELSE 'konstantinov-aleksandr-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Константинов' AND first_name = 'Александр' AND middle_name = 'Иванович' AND birth_year = 2003)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'avdeev-grigoriy-1992' AND s.athlete_id <> a.id)
              THEN 'avdeev-grigoriy-1992-' || a.id ELSE 'avdeev-grigoriy-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Авдеев' AND first_name = 'Григорий' AND middle_name = 'Николаевич' AND birth_year = 1992)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'slaschev-stepan-2008' AND s.athlete_id <> a.id)
              THEN 'slaschev-stepan-2008-' || a.id ELSE 'slaschev-stepan-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Слащев' AND first_name = 'Степан' AND middle_name = 'Сергеевич' AND birth_year = 2008)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'fartuchnyy-ivan-2007' AND s.athlete_id <> a.id)
              THEN 'fartuchnyy-ivan-2007-' || a.id ELSE 'fartuchnyy-ivan-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Фартучный' AND first_name = 'Иван' AND middle_name = 'Сергеевич' AND birth_year = 2007)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'denisov-ivan-1982' AND s.athlete_id <> a.id)
              THEN 'denisov-ivan-1982-' || a.id ELSE 'denisov-ivan-1982' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Денисов' AND first_name = 'Иван' AND middle_name = 'Николаевич' AND birth_year = 1982)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'trofimova-milena-2007' AND s.athlete_id <> a.id)
              THEN 'trofimova-milena-2007-' || a.id ELSE 'trofimova-milena-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Трофимова' AND first_name = 'Милена' AND middle_name = 'Михайловна' AND birth_year = 2007)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'prohorova-angelina-2005' AND s.athlete_id <> a.id)
              THEN 'prohorova-angelina-2005-' || a.id ELSE 'prohorova-angelina-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Прохорова' AND first_name = 'Ангелина' AND middle_name = 'Вячеславовна' AND birth_year = 2005)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lazareva-anastasiya-1991' AND s.athlete_id <> a.id)
              THEN 'lazareva-anastasiya-1991-' || a.id ELSE 'lazareva-anastasiya-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Лазарева' AND first_name = 'Анастасия' AND middle_name = 'Александровна' AND birth_year = 1991)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'podolskaya-anastasiya-2005' AND s.athlete_id <> a.id)
              THEN 'podolskaya-anastasiya-2005-' || a.id ELSE 'podolskaya-anastasiya-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Подольская' AND first_name = 'Анастасия' AND middle_name = 'Владимировна' AND birth_year = 2005)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'chernova-kira-2009' AND s.athlete_id <> a.id)
              THEN 'chernova-kira-2009-' || a.id ELSE 'chernova-kira-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Чернова' AND first_name = 'Кира' AND middle_name = 'Николаевна' AND birth_year = 2009)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'spasennikova-valeriya-2008' AND s.athlete_id <> a.id)
              THEN 'spasennikova-valeriya-2008-' || a.id ELSE 'spasennikova-valeriya-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Спасенникова' AND first_name = 'Валерия' AND middle_name = 'Витальевна' AND birth_year = 2008)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'molchanova-viktoriya-2008' AND s.athlete_id <> a.id)
              THEN 'molchanova-viktoriya-2008-' || a.id ELSE 'molchanova-viktoriya-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Молчанова' AND first_name = 'Виктория' AND middle_name = 'Николаевна' AND birth_year = 2008)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'semirunnyaya-aleksandra-2006' AND s.athlete_id <> a.id)
              THEN 'semirunnyaya-aleksandra-2006-' || a.id ELSE 'semirunnyaya-aleksandra-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Семирунняя' AND first_name = 'Александра' AND middle_name = 'Витальевна' AND birth_year = 2006)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'medenceva-darya-2004' AND s.athlete_id <> a.id)
              THEN 'medenceva-darya-2004-' || a.id ELSE 'medenceva-darya-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Меденцева' AND first_name = 'Дарья' AND middle_name = 'Александровна' AND birth_year = 2004)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'nynych-margarita-1996' AND s.athlete_id <> a.id)
              THEN 'nynych-margarita-1996-' || a.id ELSE 'nynych-margarita-1996' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ныныч' AND first_name = 'Маргарита' AND middle_name = 'Анатольевна' AND birth_year = 1996)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'barbakova-aleksandra-2004' AND s.athlete_id <> a.id)
              THEN 'barbakova-aleksandra-2004-' || a.id ELSE 'barbakova-aleksandra-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Барбакова' AND first_name = 'Александра' AND middle_name = 'Максимовна' AND birth_year = 2004)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'matveeva-elena-1974' AND s.athlete_id <> a.id)
              THEN 'matveeva-elena-1974-' || a.id ELSE 'matveeva-elena-1974' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Матвеева' AND first_name = 'Елена' AND middle_name = 'Евгеньевна' AND birth_year = 1974)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'butenko-milena-2004' AND s.athlete_id <> a.id)
              THEN 'butenko-milena-2004-' || a.id ELSE 'butenko-milena-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бутенко' AND first_name = 'Милена' AND middle_name = 'Александровна' AND birth_year = 2004)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'firuleva-vasilisa-2004' AND s.athlete_id <> a.id)
              THEN 'firuleva-vasilisa-2004-' || a.id ELSE 'firuleva-vasilisa-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Фирулева' AND first_name = 'Василиса' AND middle_name = 'Владимировна' AND birth_year = 2004)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'stepanova-oksana-1990' AND s.athlete_id <> a.id)
              THEN 'stepanova-oksana-1990-' || a.id ELSE 'stepanova-oksana-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Степанова' AND first_name = 'Оксана' AND middle_name = 'Анатольевна' AND birth_year = 1990)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'schekina-alina-1996' AND s.athlete_id <> a.id)
              THEN 'schekina-alina-1996-' || a.id ELSE 'schekina-alina-1996' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Щекина' AND first_name = 'Алина' AND middle_name = 'Игоревна' AND birth_year = 1996)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'alyanova-viktoriya-2004' AND s.athlete_id <> a.id)
              THEN 'alyanova-viktoriya-2004-' || a.id ELSE 'alyanova-viktoriya-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Альянова' AND first_name = 'Виктория' AND middle_name = 'Евгеньевна' AND birth_year = 2004)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'german-alena-1997' AND s.athlete_id <> a.id)
              THEN 'german-alena-1997-' || a.id ELSE 'german-alena-1997' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Герман' AND first_name = 'Алена' AND middle_name = 'Сергеевна' AND birth_year = 1997)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'perepletova-yana-2009' AND s.athlete_id <> a.id)
              THEN 'perepletova-yana-2009-' || a.id ELSE 'perepletova-yana-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Переплетова' AND first_name = 'Яна' AND middle_name = 'Васильевна' AND birth_year = 2009)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'voropaeva-viktoriya-2004' AND s.athlete_id <> a.id)
              THEN 'voropaeva-viktoriya-2004-' || a.id ELSE 'voropaeva-viktoriya-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Воропаева' AND first_name = 'Виктория' AND middle_name = 'Витальевна' AND birth_year = 2004)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'koshurnikova-anastasiya-2003' AND s.athlete_id <> a.id)
              THEN 'koshurnikova-anastasiya-2003-' || a.id ELSE 'koshurnikova-anastasiya-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кошурникова' AND first_name = 'Анастасия' AND middle_name = 'Александровна' AND birth_year = 2003)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'satlykova-elvira-2000' AND s.athlete_id <> a.id)
              THEN 'satlykova-elvira-2000-' || a.id ELSE 'satlykova-elvira-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Сатлыкова' AND first_name = 'Эльвира' AND middle_name = 'Рафисовна' AND birth_year = 2000)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'martynova-lyubov-2007' AND s.athlete_id <> a.id)
              THEN 'martynova-lyubov-2007-' || a.id ELSE 'martynova-lyubov-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Мартынова' AND first_name = 'Любовь' AND middle_name = 'Владимировна' AND birth_year = 2007)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'popova-angelina-2009' AND s.athlete_id <> a.id)
              THEN 'popova-angelina-2009-' || a.id ELSE 'popova-angelina-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Попова' AND first_name = 'Ангелина' AND middle_name = 'Владимировна' AND birth_year = 2009)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lyubina-aleksandra-2005' AND s.athlete_id <> a.id)
              THEN 'lyubina-aleksandra-2005-' || a.id ELSE 'lyubina-aleksandra-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Любина' AND first_name = 'Александра' AND middle_name = 'Анатольевна' AND birth_year = 2005)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'elchaninova-veronika-2003' AND s.athlete_id <> a.id)
              THEN 'elchaninova-veronika-2003-' || a.id ELSE 'elchaninova-veronika-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ельчанинова' AND first_name = 'Вероника' AND middle_name = 'Сергеевна' AND birth_year = 2003)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kutenkova-anastasiya-1997' AND s.athlete_id <> a.id)
              THEN 'kutenkova-anastasiya-1997-' || a.id ELSE 'kutenkova-anastasiya-1997' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кутенкова' AND first_name = 'Анастасия' AND middle_name = 'Михайловна' AND birth_year = 1997)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'martynova-irina-1999' AND s.athlete_id <> a.id)
              THEN 'martynova-irina-1999-' || a.id ELSE 'martynova-irina-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Мартынова' AND first_name = 'Ирина' AND middle_name = 'Александровна' AND birth_year = 1999)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'vrubel-darya-2000' AND s.athlete_id <> a.id)
              THEN 'vrubel-darya-2000-' || a.id ELSE 'vrubel-darya-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Врубель' AND first_name = 'Дарья' AND middle_name = 'Васильевна' AND birth_year = 2000)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'poberezhnaya-anna-2010' AND s.athlete_id <> a.id)
              THEN 'poberezhnaya-anna-2010-' || a.id ELSE 'poberezhnaya-anna-2010' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Побережная' AND first_name = 'Анна' AND middle_name = 'Владимировна' AND birth_year = 2010)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'mahkamova-parvina-2007' AND s.athlete_id <> a.id)
              THEN 'mahkamova-parvina-2007-' || a.id ELSE 'mahkamova-parvina-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Махкамова' AND first_name = 'Парвина' AND middle_name = 'Маруфовна' AND birth_year = 2007)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'yaskova-elena-2023' AND s.athlete_id <> a.id)
              THEN 'yaskova-elena-2023-' || a.id ELSE 'yaskova-elena-2023' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Яськова' AND first_name = 'Елена' AND middle_name = 'Григорьевна' AND birth_year = 2023)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'popova-mariya-2005' AND s.athlete_id <> a.id)
              THEN 'popova-mariya-2005-' || a.id ELSE 'popova-mariya-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Попова' AND first_name = 'Мария' AND middle_name = 'Алексеевна' AND birth_year = 2005)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'benidze-dzhoni-1990' AND s.athlete_id <> a.id)
              THEN 'benidze-dzhoni-1990-' || a.id ELSE 'benidze-dzhoni-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бенидзе' AND first_name = 'Джони' AND middle_name = 'Бадриевич' AND birth_year = 1990)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'arsentev-vitaliy-2001' AND s.athlete_id <> a.id)
              THEN 'arsentev-vitaliy-2001-' || a.id ELSE 'arsentev-vitaliy-2001' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Арсентьев' AND first_name = 'Виталий' AND middle_name = 'Александрович' AND birth_year = 2001)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'hovalko-vasiliy-1993' AND s.athlete_id <> a.id)
              THEN 'hovalko-vasiliy-1993-' || a.id ELSE 'hovalko-vasiliy-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ховалко' AND first_name = 'Василий' AND middle_name = 'Михайлович' AND birth_year = 1993)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'marinkin-egor-2003' AND s.athlete_id <> a.id)
              THEN 'marinkin-egor-2003-' || a.id ELSE 'marinkin-egor-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Маринкин' AND first_name = 'Егор' AND middle_name = 'Андреевич' AND birth_year = 2003)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'stepanov-nikolay-1997' AND s.athlete_id <> a.id)
              THEN 'stepanov-nikolay-1997-' || a.id ELSE 'stepanov-nikolay-1997' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Степанов' AND first_name = 'Николай' AND middle_name = 'Андреевич' AND birth_year = 1997)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'utev-ruslan-2005' AND s.athlete_id <> a.id)
              THEN 'utev-ruslan-2005-' || a.id ELSE 'utev-ruslan-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Утев' AND first_name = 'Руслан' AND middle_name = 'Андреевич' AND birth_year = 2005)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'shilincev-nikolay-2006' AND s.athlete_id <> a.id)
              THEN 'shilincev-nikolay-2006-' || a.id ELSE 'shilincev-nikolay-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Шилинцев' AND first_name = 'Николай' AND middle_name = 'Олегович' AND birth_year = 2006)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zuev-vladislav-2000' AND s.athlete_id <> a.id)
              THEN 'zuev-vladislav-2000-' || a.id ELSE 'zuev-vladislav-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Зуев' AND first_name = 'Владислав' AND middle_name = 'Алексеевич' AND birth_year = 2000)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'scherbin-oleg-1989' AND s.athlete_id <> a.id)
              THEN 'scherbin-oleg-1989-' || a.id ELSE 'scherbin-oleg-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Щербин' AND first_name = 'Олег' AND middle_name = 'Владимирович' AND birth_year = 1989)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'uzyukin-anatoliy-2000' AND s.athlete_id <> a.id)
              THEN 'uzyukin-anatoliy-2000-' || a.id ELSE 'uzyukin-anatoliy-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Узюкин' AND first_name = 'Анатолий' AND middle_name = 'Эдуардович' AND birth_year = 2000)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lisicyn-kirill-2007' AND s.athlete_id <> a.id)
              THEN 'lisicyn-kirill-2007-' || a.id ELSE 'lisicyn-kirill-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Лисицын' AND first_name = 'Кирилл' AND middle_name = 'Сергеевич' AND birth_year = 2007)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'gromov-aleksey-1995' AND s.athlete_id <> a.id)
              THEN 'gromov-aleksey-1995-' || a.id ELSE 'gromov-aleksey-1995' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Громов' AND first_name = 'Алексей' AND middle_name = 'Николаевич' AND birth_year = 1995)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'aydbaev-ilfat-1989' AND s.athlete_id <> a.id)
              THEN 'aydbaev-ilfat-1989-' || a.id ELSE 'aydbaev-ilfat-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Айдбаев' AND first_name = 'Ильфат' AND middle_name = 'Наильевич' AND birth_year = 1989)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'benidze-spartak-2002' AND s.athlete_id <> a.id)
              THEN 'benidze-spartak-2002-' || a.id ELSE 'benidze-spartak-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бенидзе' AND first_name = 'Спартак' AND middle_name = 'Бадриевич' AND birth_year = 2002)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'basharov-islam-2006' AND s.athlete_id <> a.id)
              THEN 'basharov-islam-2006-' || a.id ELSE 'basharov-islam-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Башаров' AND first_name = 'Ислам' AND middle_name = 'Нурисламович' AND birth_year = 2006)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'pihtar-georgiy-2008' AND s.athlete_id <> a.id)
              THEN 'pihtar-georgiy-2008-' || a.id ELSE 'pihtar-georgiy-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Пихтарь' AND first_name = 'Георгий' AND middle_name = 'Евгеньевич' AND birth_year = 2008)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'basharov-aryslan-2007' AND s.athlete_id <> a.id)
              THEN 'basharov-aryslan-2007-' || a.id ELSE 'basharov-aryslan-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Башаров' AND first_name = 'Арыслан' AND middle_name = 'Нурисламович' AND birth_year = 2007)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'bobrov-vladimir-1989' AND s.athlete_id <> a.id)
              THEN 'bobrov-vladimir-1989-' || a.id ELSE 'bobrov-vladimir-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бобров' AND first_name = 'Владимир' AND middle_name = 'Сергеевич' AND birth_year = 1989)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'rassadin-andrey-1989' AND s.athlete_id <> a.id)
              THEN 'rassadin-andrey-1989-' || a.id ELSE 'rassadin-andrey-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Рассадин' AND first_name = 'Андрей' AND middle_name = 'Андреевич' AND birth_year = 1989)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kryukov-dmitriy-1993' AND s.athlete_id <> a.id)
              THEN 'kryukov-dmitriy-1993-' || a.id ELSE 'kryukov-dmitriy-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Крюков' AND first_name = 'Дмитрий' AND middle_name = 'Андреевич' AND birth_year = 1993)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'belov-dmitriy-2008' AND s.athlete_id <> a.id)
              THEN 'belov-dmitriy-2008-' || a.id ELSE 'belov-dmitriy-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Белов' AND first_name = 'Дмитрий' AND middle_name = 'Сергеевич' AND birth_year = 2008)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'aksentev-danil-2003' AND s.athlete_id <> a.id)
              THEN 'aksentev-danil-2003-' || a.id ELSE 'aksentev-danil-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Аксентьев' AND first_name = 'Данил' AND middle_name = 'Андреевич' AND birth_year = 2003)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'suleymanov-movsar-1989' AND s.athlete_id <> a.id)
              THEN 'suleymanov-movsar-1989-' || a.id ELSE 'suleymanov-movsar-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Сулейманов' AND first_name = 'Мовсар' AND middle_name = 'Мусаевич' AND birth_year = 1989)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kozhevnikov-sergey-2008' AND s.athlete_id <> a.id)
              THEN 'kozhevnikov-sergey-2008-' || a.id ELSE 'kozhevnikov-sergey-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кожевников' AND first_name = 'Сергей' AND middle_name = 'Павлович' AND birth_year = 2008)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'tashlanov-ilya-1987' AND s.athlete_id <> a.id)
              THEN 'tashlanov-ilya-1987-' || a.id ELSE 'tashlanov-ilya-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ташланов' AND first_name = 'Илья' AND middle_name = 'Станиставович' AND birth_year = 1987)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'stepanov-sergey-1993' AND s.athlete_id <> a.id)
              THEN 'stepanov-sergey-1993-' || a.id ELSE 'stepanov-sergey-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Степанов' AND first_name = 'Сергей' AND middle_name = 'Владимирович' AND birth_year = 1993)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'shaishnikov-daniil-2008' AND s.athlete_id <> a.id)
              THEN 'shaishnikov-daniil-2008-' || a.id ELSE 'shaishnikov-daniil-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Шаишников' AND first_name = 'Даниил' AND middle_name = 'Андреевич' AND birth_year = 2008)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ivanov-vitaliy-1978' AND s.athlete_id <> a.id)
              THEN 'ivanov-vitaliy-1978-' || a.id ELSE 'ivanov-vitaliy-1978' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Виталий' AND middle_name = 'Викторович' AND birth_year = 1978)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lade-roman-1991' AND s.athlete_id <> a.id)
              THEN 'lade-roman-1991-' || a.id ELSE 'lade-roman-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ладе' AND first_name = 'Роман' AND middle_name = 'Андреевич' AND birth_year = 1991)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'bogatov-ivan-2004' AND s.athlete_id <> a.id)
              THEN 'bogatov-ivan-2004-' || a.id ELSE 'bogatov-ivan-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Богатов' AND first_name = 'Иван' AND middle_name = 'Сергеевич' AND birth_year = 2004)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'malikov-danil-2001' AND s.athlete_id <> a.id)
              THEN 'malikov-danil-2001-' || a.id ELSE 'malikov-danil-2001' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Маликов' AND first_name = 'Данил' AND middle_name = 'Дамирович' AND birth_year = 2001)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'shilyaev-ivan-1996' AND s.athlete_id <> a.id)
              THEN 'shilyaev-ivan-1996-' || a.id ELSE 'shilyaev-ivan-1996' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Шиляев' AND first_name = 'Иван' AND middle_name = 'Николаевич' AND birth_year = 1996)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'borodynkin-oleg-2002' AND s.athlete_id <> a.id)
              THEN 'borodynkin-oleg-2002-' || a.id ELSE 'borodynkin-oleg-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бородынкин' AND first_name = 'Олег' AND middle_name = 'Александрович' AND birth_year = 2002)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'plotnikov-vyacheslav-1998' AND s.athlete_id <> a.id)
              THEN 'plotnikov-vyacheslav-1998-' || a.id ELSE 'plotnikov-vyacheslav-1998' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Плотников' AND first_name = 'Вячеслав' AND middle_name = 'Евгеньевич' AND birth_year = 1998)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kurdyukov-vasiliy-1997' AND s.athlete_id <> a.id)
              THEN 'kurdyukov-vasiliy-1997-' || a.id ELSE 'kurdyukov-vasiliy-1997' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Курдюков' AND first_name = 'Василий' AND middle_name = 'Сергеевич' AND birth_year = 1997)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'anasenko-anton-1979' AND s.athlete_id <> a.id)
              THEN 'anasenko-anton-1979-' || a.id ELSE 'anasenko-anton-1979' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Анасенко' AND first_name = 'Антон' AND middle_name = 'Владимирович' AND birth_year = 1979)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'bitkov-anton-1994' AND s.athlete_id <> a.id)
              THEN 'bitkov-anton-1994-' || a.id ELSE 'bitkov-anton-1994' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Битков' AND first_name = 'Антон' AND middle_name = 'Николаевич' AND birth_year = 1994)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ivanovskiy-danila-2006' AND s.athlete_id <> a.id)
              THEN 'ivanovskiy-danila-2006-' || a.id ELSE 'ivanovskiy-danila-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ивановский' AND first_name = 'Данила' AND middle_name = 'Николаевич' AND birth_year = 2006)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'siseykin-maksim-1993' AND s.athlete_id <> a.id)
              THEN 'siseykin-maksim-1993-' || a.id ELSE 'siseykin-maksim-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Сисейкин' AND first_name = 'Максим' AND middle_name = 'Сергеевич' AND birth_year = 1993)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'krestyaninov-viktor-2000' AND s.athlete_id <> a.id)
              THEN 'krestyaninov-viktor-2000-' || a.id ELSE 'krestyaninov-viktor-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Крестьянинов' AND first_name = 'Виктор' AND middle_name = 'Александрович' AND birth_year = 2000)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'gurov-vladimir-1978' AND s.athlete_id <> a.id)
              THEN 'gurov-vladimir-1978-' || a.id ELSE 'gurov-vladimir-1978' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Гуров' AND first_name = 'Владимир' AND middle_name = 'Анатольевич' AND birth_year = 1978)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'buldakov-nikita-1997' AND s.athlete_id <> a.id)
              THEN 'buldakov-nikita-1997-' || a.id ELSE 'buldakov-nikita-1997' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Булдаков' AND first_name = 'Никита' AND middle_name = 'Юрьевич' AND birth_year = 1997)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zhitihin-vladislav-1994' AND s.athlete_id <> a.id)
              THEN 'zhitihin-vladislav-1994-' || a.id ELSE 'zhitihin-vladislav-1994' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Житихин' AND first_name = 'Владислав' AND middle_name = 'Николаевич' AND birth_year = 1994)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'cherkashin-ivan-1999-2' AND s.athlete_id <> a.id)
              THEN 'cherkashin-ivan-1999-2-' || a.id ELSE 'cherkashin-ivan-1999-2' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Черкашин' AND first_name = 'Иван' AND middle_name = 'Андревич' AND birth_year = 1999)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kravchenko-sergey-1982' AND s.athlete_id <> a.id)
              THEN 'kravchenko-sergey-1982-' || a.id ELSE 'kravchenko-sergey-1982' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кравченко' AND first_name = 'Сергей' AND middle_name = 'Сергеевич' AND birth_year = 1982)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'spichkin-aleksey-1994' AND s.athlete_id <> a.id)
              THEN 'spichkin-aleksey-1994-' || a.id ELSE 'spichkin-aleksey-1994' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Спичкин' AND first_name = 'Алексей' AND middle_name = 'Евгеньевич' AND birth_year = 1994)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'salihov-rustam-1982' AND s.athlete_id <> a.id)
              THEN 'salihov-rustam-1982-' || a.id ELSE 'salihov-rustam-1982' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Салихов' AND first_name = 'Рустам' AND middle_name = 'Ренатович' AND birth_year = 1982)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'markov-ivan-1995' AND s.athlete_id <> a.id)
              THEN 'markov-ivan-1995-' || a.id ELSE 'markov-ivan-1995' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Марков' AND first_name = 'Иван' AND middle_name = 'Эдуардович' AND birth_year = 1995)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'orlov-sergey-2005' AND s.athlete_id <> a.id)
              THEN 'orlov-sergey-2005-' || a.id ELSE 'orlov-sergey-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Орлов' AND first_name = 'Сергей' AND middle_name = 'Александрович' AND birth_year = 2005)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'vdovenko-aleksandr-1995' AND s.athlete_id <> a.id)
              THEN 'vdovenko-aleksandr-1995-' || a.id ELSE 'vdovenko-aleksandr-1995' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Вдовенко' AND first_name = 'Александр' AND middle_name = 'Андреевич' AND birth_year = 1995)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'chebotarev-yuriy-1989' AND s.athlete_id <> a.id)
              THEN 'chebotarev-yuriy-1989-' || a.id ELSE 'chebotarev-yuriy-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Чеботарев' AND first_name = 'Юрий' AND middle_name = 'Юрьевич' AND birth_year = 1989)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'basharov-nurislam-1983' AND s.athlete_id <> a.id)
              THEN 'basharov-nurislam-1983-' || a.id ELSE 'basharov-nurislam-1983' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Башаров' AND first_name = 'Нурислам' AND middle_name = 'Магсумович' AND birth_year = 1983)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sheremetov-aleksandr-1990' AND s.athlete_id <> a.id)
              THEN 'sheremetov-aleksandr-1990-' || a.id ELSE 'sheremetov-aleksandr-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Шереметов' AND first_name = 'Александр' AND middle_name = 'Владимирович' AND birth_year = 1990)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sobolev-nikita-2006' AND s.athlete_id <> a.id)
              THEN 'sobolev-nikita-2006-' || a.id ELSE 'sobolev-nikita-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Соболев' AND first_name = 'Никита' AND middle_name = 'Александрович' AND birth_year = 2006)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zuev-ilya-2007' AND s.athlete_id <> a.id)
              THEN 'zuev-ilya-2007-' || a.id ELSE 'zuev-ilya-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Зуев' AND first_name = 'Илья' AND middle_name = 'Александрович' AND birth_year = 2007)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'tarverdieva-mariya-1986' AND s.athlete_id <> a.id)
              THEN 'tarverdieva-mariya-1986-' || a.id ELSE 'tarverdieva-mariya-1986' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Тарвердиева' AND first_name = 'Мария' AND middle_name = 'Алексеевна' AND birth_year = 1986)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'puzankova-anastasiya-2006' AND s.athlete_id <> a.id)
              THEN 'puzankova-anastasiya-2006-' || a.id ELSE 'puzankova-anastasiya-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Пузанкова' AND first_name = 'Анастасия' AND middle_name = 'Константиновна' AND birth_year = 2006)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sergeeva-yuliya-1980' AND s.athlete_id <> a.id)
              THEN 'sergeeva-yuliya-1980-' || a.id ELSE 'sergeeva-yuliya-1980' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Сергеева' AND first_name = 'Юлия' AND middle_name = 'Александровна' AND birth_year = 1980)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'verhovceva-ekaterina-2003' AND s.athlete_id <> a.id)
              THEN 'verhovceva-ekaterina-2003-' || a.id ELSE 'verhovceva-ekaterina-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Верховцева' AND first_name = 'Екатерина' AND middle_name = 'Николаевна' AND birth_year = 2003)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kuzmicheva-kseniya-2004' AND s.athlete_id <> a.id)
              THEN 'kuzmicheva-kseniya-2004-' || a.id ELSE 'kuzmicheva-kseniya-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кузьмичева' AND first_name = 'Ксения' AND middle_name = 'Сергеевна' AND birth_year = 2004)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'petelin-aleksandr-1987' AND s.athlete_id <> a.id)
              THEN 'petelin-aleksandr-1987-' || a.id ELSE 'petelin-aleksandr-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Петелин' AND first_name = 'Александр' AND middle_name = 'Владимирович' AND birth_year = 1987)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ilyasov-kaken-1993' AND s.athlete_id <> a.id)
              THEN 'ilyasov-kaken-1993-' || a.id ELSE 'ilyasov-kaken-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ильясов' AND first_name = 'Какен' AND middle_name = 'Канатович' AND birth_year = 1993)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'petushkov-denis-1986' AND s.athlete_id <> a.id)
              THEN 'petushkov-denis-1986-' || a.id ELSE 'petushkov-denis-1986' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Петушков' AND first_name = 'Денис' AND middle_name = 'Владимирович' AND birth_year = 1986)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'potapov-danil-2002' AND s.athlete_id <> a.id)
              THEN 'potapov-danil-2002-' || a.id ELSE 'potapov-danil-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Потапов' AND first_name = 'Данил' AND middle_name = 'Алексеевич' AND birth_year = 2002)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'maschenko-oleg-1983' AND s.athlete_id <> a.id)
              THEN 'maschenko-oleg-1983-' || a.id ELSE 'maschenko-oleg-1983' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Мащенко' AND first_name = 'Олег' AND middle_name = 'Валерьевич' AND birth_year = 1983)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'baldin-aleksandr-1993' AND s.athlete_id <> a.id)
              THEN 'baldin-aleksandr-1993-' || a.id ELSE 'baldin-aleksandr-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Балдин' AND first_name = 'Александр' AND middle_name = 'Васильевич' AND birth_year = 1993)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'suslov-aleksandr-1986' AND s.athlete_id <> a.id)
              THEN 'suslov-aleksandr-1986-' || a.id ELSE 'suslov-aleksandr-1986' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Суслов' AND first_name = 'Александр' AND middle_name = 'Владимирович' AND birth_year = 1986)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'vasin-artem-2007-2' AND s.athlete_id <> a.id)
              THEN 'vasin-artem-2007-2-' || a.id ELSE 'vasin-artem-2007-2' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Васин' AND first_name = 'Артём' AND middle_name = 'Иывнович' AND birth_year = 2007)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kvashnin-mihail-1988' AND s.athlete_id <> a.id)
              THEN 'kvashnin-mihail-1988-' || a.id ELSE 'kvashnin-mihail-1988' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Квашнин' AND first_name = 'Михаил' AND middle_name = 'Федорович' AND birth_year = 1988)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ivanov-aleksey-1995' AND s.athlete_id <> a.id)
              THEN 'ivanov-aleksey-1995-' || a.id ELSE 'ivanov-aleksey-1995' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Алексей' AND middle_name = 'Валерьевич' AND birth_year = 1995)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'alekseev-radif-1989' AND s.athlete_id <> a.id)
              THEN 'alekseev-radif-1989-' || a.id ELSE 'alekseev-radif-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Алексеев' AND first_name = 'Радиф' AND middle_name = 'Дамирович' AND birth_year = 1989)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'dyachkov-oleg-1995' AND s.athlete_id <> a.id)
              THEN 'dyachkov-oleg-1995-' || a.id ELSE 'dyachkov-oleg-1995' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Дьячков' AND first_name = 'Олег' AND middle_name = 'Сергеевич' AND birth_year = 1995)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'bahtov-ilya-1989' AND s.athlete_id <> a.id)
              THEN 'bahtov-ilya-1989-' || a.id ELSE 'bahtov-ilya-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бахтов' AND first_name = 'Илья' AND middle_name = 'Владимирович' AND birth_year = 1989)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'malinovskiy-semen-1989' AND s.athlete_id <> a.id)
              THEN 'malinovskiy-semen-1989-' || a.id ELSE 'malinovskiy-semen-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Малиновский' AND first_name = 'Семён' AND middle_name = 'Андреевич' AND birth_year = 1989)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'vetrov-denis-1989' AND s.athlete_id <> a.id)
              THEN 'vetrov-denis-1989-' || a.id ELSE 'vetrov-denis-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ветров' AND first_name = 'Денис' AND middle_name = 'Сергеевич' AND birth_year = 1989)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'pozdeev-andrey-1990' AND s.athlete_id <> a.id)
              THEN 'pozdeev-andrey-1990-' || a.id ELSE 'pozdeev-andrey-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Поздеев' AND first_name = 'Андрей' AND middle_name = 'Николаевич' AND birth_year = 1990)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'spesivcev-daniila-2003' AND s.athlete_id <> a.id)
              THEN 'spesivcev-daniila-2003-' || a.id ELSE 'spesivcev-daniila-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Спесивцев' AND first_name = 'Даниила' AND middle_name = 'Владимирович' AND birth_year = 2003)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'davydov-anton-1982' AND s.athlete_id <> a.id)
              THEN 'davydov-anton-1982-' || a.id ELSE 'davydov-anton-1982' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Давыдов' AND first_name = 'Антон' AND middle_name = 'Александрович' AND birth_year = 1982)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'enederov-dimitriy-1984' AND s.athlete_id <> a.id)
              THEN 'enederov-dimitriy-1984-' || a.id ELSE 'enederov-dimitriy-1984' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Енедеров' AND first_name = 'Димитрий' AND middle_name = 'Николаевич' AND birth_year = 1984)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'gulov-farhod-1997' AND s.athlete_id <> a.id)
              THEN 'gulov-farhod-1997-' || a.id ELSE 'gulov-farhod-1997' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Гулов' AND first_name = 'Фарход' AND middle_name = 'Абдурахмонович' AND birth_year = 1997)
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
  (1067, 1006, (SELECT id FROM athletes WHERE last_name = 'Самохвалов' AND first_name = 'Илья' AND middle_name = 'Дмитриевич' AND birth_year = 2007), 14, 42, NULL, 90.8, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Самохвалов Илья Дмитриевич', 'МБУ ДО СШ "Уренгоец"', 'Ямало-Ненецкий автономный округ', 1001, 33),
  (1068, 1007, (SELECT id FROM athletes WHERE last_name = 'Балабанов' AND first_name = 'Сергей' AND middle_name = 'Андреевич' AND birth_year = 1996), 1, 96, NULL, 103.4, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Балабанов Сергей Андреевич', 'ВС', 'Республика Бурятия', 1001, 32),
  (1069, 1007, (SELECT id FROM athletes WHERE last_name = 'Шевелев' AND first_name = 'Дмитрий' AND middle_name = 'Владимирович' AND birth_year = 1989), 2, 88, NULL, 114.25, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Шевелев Дмитрий Владимирович', 'ВС', 'Новосибирская область', 1001, 32),
  (1070, 1007, (SELECT id FROM athletes WHERE last_name = 'Стаханов' AND first_name = 'Валентин' AND middle_name = 'Викторович' AND birth_year = 1990), 3, 85, NULL, 95.15, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Стаханов Валентин Викторович', 'ВС', 'Омская область', 1001, 32),
  (1071, 1007, (SELECT id FROM athletes WHERE last_name = 'Симашкевич' AND first_name = 'Евгений' AND middle_name = 'Валентинович' AND birth_year = 1991), 4, 81, NULL, 102.6, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Симашкевич Евгений Валентинович', 'ВС', 'Омская область', 1001, 32),
  (1072, 1007, (SELECT id FROM athletes WHERE last_name = 'Тихомиров' AND first_name = 'Владислав' AND middle_name = 'Викторович' AND birth_year = 1996), 5, 74, NULL, 105.5, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Тихомиров Владислав Викторович', 'СПБ ГБУ ДО СШОРСВС им. В.Ф.', 'г. Санкт-Петербург', 1001, 32),
  (1073, 1007, (SELECT id FROM athletes WHERE last_name = 'Июльский' AND first_name = 'Дмитрий' AND middle_name = 'Валерьевич' AND birth_year = 1993), 6, 72, NULL, 104.35, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Июльский Дмитрий Валерьевич', 'ГБУ ДО МКСШОР «Запад» Отделение', 'г. Москва', 1001, 32),
  (1074, 1007, (SELECT id FROM athletes WHERE last_name = 'Чирков' AND first_name = 'Леонид' AND middle_name = 'Евгеньевич' AND birth_year = 2003), 7, 72, NULL, 115.25, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Чирков Леонид Евгеньевич', 'Цсп Аненнки', 'Калужская область', 1001, 32),
  (1075, 1007, (SELECT id FROM athletes WHERE last_name = 'Петрухин' AND first_name = 'Егор' AND middle_name = 'Игоревич' AND birth_year = 2005), 8, 62, NULL, 97.2, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Петрухин Егор Игоревич', 'Томская федерация гиревого спорта', 'Томская область', 1001, 32),
  (1076, 1007, (SELECT id FROM athletes WHERE last_name = 'Константинов' AND first_name = 'Александр' AND middle_name = 'Иванович' AND birth_year = 2003), 9, 60, NULL, 116.35, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Константинов Александр Иванович', 'СШ Энергия', 'Чувашская Республика', 1001, 32),
  (1077, 1007, (SELECT id FROM athletes WHERE last_name = 'Авдеев' AND first_name = 'Григорий' AND middle_name = 'Николаевич' AND birth_year = 1992), 10, 43, NULL, 97.25, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Авдеев Григорий Николаевич', 'олимп', 'Челябинская область', 1001, 32),
  (1078, 1007, (SELECT id FROM athletes WHERE last_name = 'Слащев' AND first_name = 'Степан' AND middle_name = 'Сергеевич' AND birth_year = 2008), 11, 40, NULL, 104.3, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Слащев Степан Сергеевич', 'ГБУ ДО МКСШОР «Запад» Отделение', 'г. Москва', 1001, 32),
  (1079, 1007, (SELECT id FROM athletes WHERE last_name = 'Фартучный' AND first_name = 'Иван' AND middle_name = 'Сергеевич' AND birth_year = 2007), 12, 40, NULL, 116.65, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Фартучный Иван Сергеевич', 'МБУДО СШ"ОСКОЛ"', 'Белгородская область', 1001, 32),
  (1080, 1007, (SELECT id FROM athletes WHERE last_name = 'Денисов' AND first_name = 'Иван' AND middle_name = 'Николаевич' AND birth_year = 1982), 13, 35, NULL, 118.65, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1001, '2025-06-12', 'Денисов Иван Николаевич', 'РО ООО ВФГС в Челябинской Области', 'Челябинская область', 1001, 32),
  (1081, 1008, (SELECT id FROM athletes WHERE last_name = 'Трофимова' AND first_name = 'Милена' AND middle_name = 'Михайловна' AND birth_year = 2007), 1, 62, NULL, 57.75, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1001, '2025-06-12', 'Трофимова Милена Михайловна', 'СШОР «Маршал»', 'Калужская область', 1001, 31),
  (1082, 1008, (SELECT id FROM athletes WHERE last_name = 'Прохорова' AND first_name = 'Ангелина' AND middle_name = 'Вячеславовна' AND birth_year = 2005), 2, 54, NULL, 55.85, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1001, '2025-06-12', 'Прохорова Ангелина Вячеславовна', 'МУ ДО МЦРФКиС', 'Новосибирская область', 1001, 31),
  (1083, 1008, (SELECT id FROM athletes WHERE last_name = 'Лазарева' AND first_name = 'Анастасия' AND middle_name = 'Александровна' AND birth_year = 1991), 3, 48, NULL, 54.0, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1001, '2025-06-12', 'Лазарева Анастасия Александровна', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 1001, 31),
  (1084, 1008, (SELECT id FROM athletes WHERE last_name = 'Подольская' AND first_name = 'Анастасия' AND middle_name = 'Владимировна' AND birth_year = 2005), 4, 28, NULL, 57.5, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1001, '2025-06-12', 'Подольская Анастасия Владимировна', 'РО ООО «ВФГС» в г. Москве', 'г. Москва', 1001, 31),
  (1085, 1008, (SELECT id FROM athletes WHERE last_name = 'Чернова' AND first_name = 'Кира' AND middle_name = 'Николаевна' AND birth_year = 2009), 5, 26, NULL, 54.9, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1001, '2025-06-12', 'Чернова Кира Николаевна', 'СШОР МАРШАЛ', 'Калужская область', 1001, 31),
  (1086, 1008, (SELECT id FROM athletes WHERE last_name = 'Спасенникова' AND first_name = 'Валерия' AND middle_name = 'Витальевна' AND birth_year = 2008), 6, 25, NULL, 55.4, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1001, '2025-06-12', 'Спасенникова Валерия Витальевна', 'СК Атлант', 'Тюменская область', 1001, 31),
  (1087, 1008, (SELECT id FROM athletes WHERE last_name = 'Молчанова' AND first_name = 'Виктория' AND middle_name = 'Николаевна' AND birth_year = 2008), 7, 24, NULL, 54.85, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1001, '2025-06-12', 'Молчанова Виктория Николаевна', 'МКОУДО ЗАТО Знаменск СШ', 'Астраханская область', 1001, 31),
  (1088, 1008, (SELECT id FROM athletes WHERE last_name = 'Семирунняя' AND first_name = 'Александра' AND middle_name = 'Витальевна' AND birth_year = 2006), 8, 20, NULL, 54.85, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1001, '2025-06-12', 'Семирунняя Александра Витальевна', 'РСОО "ФГС РО"', 'Ростовская область', 1001, 31),
  (1089, 1008, (SELECT id FROM athletes WHERE last_name = 'Меденцева' AND first_name = 'Дарья' AND middle_name = 'Александровна' AND birth_year = 2004), 9, 19, NULL, 57.05, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1001, '2025-06-12', 'Меденцева Дарья Александровна', 'МАУ ДО "КСШ КМО"', 'Кемеровская область', 1001, 31),
  (1090, 1008, (SELECT id FROM athletes WHERE last_name = 'Ныныч' AND first_name = 'Маргарита' AND middle_name = 'Анатольевна' AND birth_year = 1996), NULL, 0, NULL, 57.85, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1001, '2025-06-12', 'Ныныч Маргарита Анатольевна', 'ВС', 'Республика Бурятия', 1001, 31),
  (1091, 1009, (SELECT id FROM athletes WHERE last_name = 'Барбакова' AND first_name = 'Александра' AND middle_name = 'Максимовна' AND birth_year = 2004), 1, 71, NULL, 59.0, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1001, '2025-06-12', 'Барбакова Александра Максимовна', 'СШОР «Маршал»', 'Калужская область', 1001, 30),
  (1092, 1009, (SELECT id FROM athletes WHERE last_name = 'Матвеева' AND first_name = 'Елена' AND middle_name = 'Евгеньевна' AND birth_year = 1974), 2, 49, NULL, 62.2, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1001, '2025-06-12', 'Матвеева Елена Евгеньевна', 'КОГАУ «СШОР «Юность»', 'Кировская область', 1001, 30),
  (1093, 1009, (SELECT id FROM athletes WHERE last_name = 'Бутенко' AND first_name = 'Милена' AND middle_name = 'Александровна' AND birth_year = 2004), 3, 46, NULL, 63.0, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1001, '2025-06-12', 'Бутенко Милена Александровна', 'МУ ДО МЦРФКиС', 'Новосибирская область', 1001, 30),
  (1094, 1009, (SELECT id FROM athletes WHERE last_name = 'Фирулева' AND first_name = 'Василиса' AND middle_name = 'Владимировна' AND birth_year = 2004), 4, 44, NULL, 62.85, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1001, '2025-06-12', 'Фирулева Василиса Владимировна', 'МБУ ДО СШ "Уренгоец"', 'Ямало-Ненецкий автономный округ', 1001, 30),
  (1095, 1009, (SELECT id FROM athletes WHERE last_name = 'Степанова' AND first_name = 'Оксана' AND middle_name = 'Анатольевна' AND birth_year = 1990), 5, 43, NULL, 62.8, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1001, '2025-06-12', 'Степанова Оксана Анатольевна', 'РО ООО ВФГС в Челябинской Области', 'Челябинская область', 1001, 30),
  (1096, 1009, (SELECT id FROM athletes WHERE last_name = 'Щекина' AND first_name = 'Алина' AND middle_name = 'Игоревна' AND birth_year = 1996), 6, 39, NULL, 62.3, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1001, '2025-06-12', 'Щекина Алина Игоревна', 'РСОО "ФГС РО"', 'Ростовская область', 1001, 30),
  (1097, 1009, (SELECT id FROM athletes WHERE last_name = 'Альянова' AND first_name = 'Виктория' AND middle_name = 'Евгеньевна' AND birth_year = 2004), 7, 37, NULL, 62.4, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1001, '2025-06-12', 'Альянова Виктория Евгеньевна', 'СШОР по борьбе', 'Брянская область', 1001, 30),
  (1098, 1009, (SELECT id FROM athletes WHERE last_name = 'Герман' AND first_name = 'Алена' AND middle_name = 'Сергеевна' AND birth_year = 1997), 8, 32, NULL, 62.45, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1001, '2025-06-12', 'Герман Алена Сергеевна', 'СПБ ГБУ ДО СШОРСВС им. В.Ф.', 'г. Санкт-Петербург', 1001, 30),
  (1099, 1009, (SELECT id FROM athletes WHERE last_name = 'Переплетова' AND first_name = 'Яна' AND middle_name = 'Васильевна' AND birth_year = 2009), 9, 29, NULL, 61.5, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1001, '2025-06-12', 'Переплетова Яна Васильевна', 'ГБУ ДО МКСШОР «Запад» Отделение', 'г. Москва', 1001, 30),
  (1100, 1010, (SELECT id FROM athletes WHERE last_name = 'Воропаева' AND first_name = 'Виктория' AND middle_name = 'Витальевна' AND birth_year = 2004), 1, 68, NULL, 67.6, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1001, '2025-06-12', 'Воропаева Виктория Витальевна', 'МКУ ДО "Бобровская СШ имени В.Л. Паткина"', 'Воронежская область', 1001, 29),
  (1101, 1010, (SELECT id FROM athletes WHERE last_name = 'Кошурникова' AND first_name = 'Анастасия' AND middle_name = 'Александровна' AND birth_year = 2003), 2, 62, NULL, 63.45, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1001, '2025-06-12', 'Кошурникова Анастасия Александровна', 'МБУ ДО СШОР «Югория» им. А.А. Пилояна', 'Ханты-Мансийский АО - Югра', 1001, 29),
  (1102, 1010, (SELECT id FROM athletes WHERE last_name = 'Сатлыкова' AND first_name = 'Эльвира' AND middle_name = 'Рафисовна' AND birth_year = 2000), 3, 60, NULL, 63.45, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1001, '2025-06-12', 'Сатлыкова Эльвира Рафисовна', 'СШ №1 им. Л.Д. Ковалевского', 'Оренбургская область', 1001, 29),
  (1103, 1010, (SELECT id FROM athletes WHERE last_name = 'Мартынова' AND first_name = 'Любовь' AND middle_name = 'Владимировна' AND birth_year = 2007), 4, 52, NULL, 67.25, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1001, '2025-06-12', 'Мартынова Любовь Владимировна', 'МКОУДО ЗАТО Знаменск СШ', 'Астраханская область', 1001, 29),
  (1104, 1010, (SELECT id FROM athletes WHERE last_name = 'Попова' AND first_name = 'Ангелина' AND middle_name = 'Владимировна' AND birth_year = 2009), 5, 41, NULL, 64.25, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1001, '2025-06-12', 'Попова Ангелина Владимировна', 'МБУ ДО "СШ Елецкого района"', 'Липецкая область', 1001, 29),
  (1105, 1010, (SELECT id FROM athletes WHERE last_name = 'Любина' AND first_name = 'Александра' AND middle_name = 'Анатольевна' AND birth_year = 2005), 6, 30, NULL, 66.7, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1001, '2025-06-12', 'Любина Александра Анатольевна', 'МБУ ДО СШОР «Югория» им. А.А.', 'Ханты-Мансийский АО - Югра', 1001, 29),
  (1106, 1010, (SELECT id FROM athletes WHERE last_name = 'Ельчанинова' AND first_name = 'Вероника' AND middle_name = 'Сергеевна' AND birth_year = 2003), 7, 28, NULL, 67.9, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1001, '2025-06-12', 'Ельчанинова Вероника Сергеевна', 'СШОР 33', 'Омская область', 1001, 29),
  (1107, 1010, (SELECT id FROM athletes WHERE last_name = 'Кутенкова' AND first_name = 'Анастасия' AND middle_name = 'Михайловна' AND birth_year = 1997), 8, 20, NULL, 67.9, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1001, '2025-06-12', 'Кутенкова Анастасия Михайловна', 'ВС', 'Республика Бурятия', 1001, 29),
  (1108, 1011, (SELECT id FROM athletes WHERE last_name = 'Мартынова' AND first_name = 'Ирина' AND middle_name = 'Александровна' AND birth_year = 1999), 1, 85, NULL, 85.7, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1001, '2025-06-12', 'Мартынова Ирина Александровна', 'СШОР «Маршал»', 'Калужская область', 1001, 41),
  (1109, 1011, (SELECT id FROM athletes WHERE last_name = 'Врубель' AND first_name = 'Дарья' AND middle_name = 'Васильевна' AND birth_year = 2000), 2, 58, NULL, 95.05, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1001, '2025-06-12', 'Врубель Дарья Васильевна', 'БУ ДО города Омска "СШОР 33"', 'Омская область', 1001, 41),
  (1110, 1011, (SELECT id FROM athletes WHERE last_name = 'Побережная' AND first_name = 'Анна' AND middle_name = 'Владимировна' AND birth_year = 2010), 3, 37, NULL, 72.55, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1001, '2025-06-12', 'Побережная Анна Владимировна', 'СШОР «Маршал»', 'Калужская область', 1001, 41),
  (1111, 1011, (SELECT id FROM athletes WHERE last_name = 'Махкамова' AND first_name = 'Парвина' AND middle_name = 'Маруфовна' AND birth_year = 2007), 4, 15, NULL, 88.7, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1001, '2025-06-12', 'Махкамова Парвина Маруфовна', 'МАУ ДО СШ «Прикамье» г. Перми', 'Пермский край', 1001, 41),
  (1112, 1011, (SELECT id FROM athletes WHERE last_name = 'Яськова' AND first_name = 'Елена' AND middle_name = 'Григорьевна' AND birth_year = 2023), 5, 12, NULL, 94.35, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1001, '2025-06-12', 'Яськова Елена Григорьевна', 'СШОР по борьбе', 'Брянская область', 1001, 41),
  (1113, 1011, (SELECT id FROM athletes WHERE last_name = 'Попова' AND first_name = 'Мария' AND middle_name = 'Алексеевна' AND birth_year = 2005), 6, 11, NULL, 78.05, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1001, '2025-06-12', 'Попова Мария Алексеевна', 'ССК"КИТнаспорте"', 'Пермский край', 1001, 41),
  (1114, 1012, (SELECT id FROM athletes WHERE last_name = 'Бенидзе' AND first_name = 'Джони' AND middle_name = 'Бадриевич' AND birth_year = 1990), 1, 139, NULL, 62.9, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Бенидзе Джони Бадриевич', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 1001, 28),
  (1115, 1012, (SELECT id FROM athletes WHERE last_name = 'Бутенко' AND first_name = 'Евгений' AND middle_name = 'Александрович' AND birth_year = 1995), 2, 134, NULL, 62.65, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Бутенко Евгений Александрович', 'МУ ДО "МЦРФКиС"', 'Новосибирская область', 1001, 28),
  (1116, 1012, (SELECT id FROM athletes WHERE last_name = 'Смагулов' AND first_name = 'Нурсултан' AND middle_name = 'Шайзандинович' AND birth_year = 1999), 3, 105, NULL, 63.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Смагулов Нурсултан Шайзандинович', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 1001, 28),
  (1117, 1012, (SELECT id FROM athletes WHERE last_name = 'Арсентьев' AND first_name = 'Виталий' AND middle_name = 'Александрович' AND birth_year = 2001), 4, 96, NULL, 62.95, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Арсентьев Виталий Александрович', 'ЯВВУ ПВО', 'Ярославская область', 1001, 28),
  (1118, 1012, (SELECT id FROM athletes WHERE last_name = 'Ховалко' AND first_name = 'Василий' AND middle_name = 'Михайлович' AND birth_year = 1993), 5, 86, NULL, 62.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Ховалко Василий Михайлович', 'МБУ ДО СШ "Уренгоец"', 'Ямало-Ненецкий автономный округ', 1001, 28),
  (1119, 1012, (SELECT id FROM athletes WHERE last_name = 'Маринкин' AND first_name = 'Егор' AND middle_name = 'Андреевич' AND birth_year = 2003), 6, 86, NULL, 62.8, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Маринкин Егор Андреевич', 'ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»', 'г. Москва', 1001, 28),
  (1120, 1012, (SELECT id FROM athletes WHERE last_name = 'Горячев' AND first_name = 'Ярослав' AND middle_name = 'Алексеевич' AND birth_year = 2010), 7, 75, NULL, 63.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Горячев Ярослав Алексеевич', 'СШОР МАРШАЛ', 'Калужская область', 1001, 28),
  (1121, 1012, (SELECT id FROM athletes WHERE last_name = 'Степанов' AND first_name = 'Николай' AND middle_name = 'Андреевич' AND birth_year = 1997), 8, 68, NULL, 59.85, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Степанов Николай Андреевич', 'атлет', 'Челябинская область', 1001, 28),
  (1122, 1012, (SELECT id FROM athletes WHERE last_name = 'Сиразетдинов' AND first_name = 'Данил' AND middle_name = 'Ильфатович' AND birth_year = 2007), 9, 50, NULL, 61.3, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Сиразетдинов Данил Ильфатович', 'МАУ ДО СШ «Прикамье» г. Перми', 'Пермский край', 1001, 28),
  (1123, 1012, (SELECT id FROM athletes WHERE last_name = 'Утев' AND first_name = 'Руслан' AND middle_name = 'Андреевич' AND birth_year = 2005), 10, 40, NULL, 61.75, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Утев Руслан Андреевич', 'МАУ ДО СШ «Прикамье» г. Перми', 'Пермский край', 1001, 28),
  (1124, 1012, (SELECT id FROM athletes WHERE last_name = 'Шилинцев' AND first_name = 'Николай' AND middle_name = 'Олегович' AND birth_year = 2006), 11, 23, NULL, 62.9, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Шилинцев Николай Олегович', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 1001, 28),
  (1125, 1013, (SELECT id FROM athletes WHERE last_name = 'Зуев' AND first_name = 'Владислав' AND middle_name = 'Алексеевич' AND birth_year = 2000), 1, 141, NULL, 67.95, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Зуев Владислав Алексеевич', 'ВС', 'Воронежская область', 1001, 27),
  (1126, 1013, (SELECT id FROM athletes WHERE last_name = 'Рябков' AND first_name = 'Алексей' AND middle_name = 'Игоревич' AND birth_year = 1993), 2, 131, NULL, 67.95, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Рябков Алексей Игоревич', 'МБУ ДО СШОР «Югория» им. А.А. Пилояна', 'Ханты-Мансийский АО - Югра', 1001, 27),
  (1127, 1013, (SELECT id FROM athletes WHERE last_name = 'Щербин' AND first_name = 'Олег' AND middle_name = 'Владимирович' AND birth_year = 1989), 3, 114, NULL, 67.8, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Щербин Олег Владимирович', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 1001, 27),
  (1128, 1013, (SELECT id FROM athletes WHERE last_name = 'Узюкин' AND first_name = 'Анатолий' AND middle_name = 'Эдуардович' AND birth_year = 2000), 4, 104, NULL, 67.95, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Узюкин Анатолий Эдуардович', 'СШ Энергия', 'Чувашская Республика', 1001, 27),
  (1129, 1013, (SELECT id FROM athletes WHERE last_name = 'Лисицын' AND first_name = 'Кирилл' AND middle_name = 'Сергеевич' AND birth_year = 2007), 5, 86, NULL, 67.35, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Лисицын Кирилл Сергеевич', 'МАУ ДО СШОР "Метеор"', 'Ярославская область', 1001, 27),
  (1130, 1013, (SELECT id FROM athletes WHERE last_name = 'Трофимов' AND first_name = 'Тимур' AND middle_name = 'Михайлович' AND birth_year = 2011), 6, 84, NULL, 67.8, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Трофимов Тимур Михайлович', 'СШОР " Маршал"', 'Калужская область', 1001, 27),
  (1131, 1013, (SELECT id FROM athletes WHERE last_name = 'Громов' AND first_name = 'Алексей' AND middle_name = 'Николаевич' AND birth_year = 1995), 7, 81, NULL, 67.55, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Громов Алексей Николаевич', '-', 'Удмуртская Республика', 1001, 27),
  (1132, 1013, (SELECT id FROM athletes WHERE last_name = 'Морозович' AND first_name = 'Владислав' AND middle_name = 'Павлович' AND birth_year = 1999), 8, 70, NULL, 68.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Морозович Владислав Павлович', 'СШОР 33', 'Омская область', 1001, 27),
  (1133, 1013, (SELECT id FROM athletes WHERE last_name = 'Айдбаев' AND first_name = 'Ильфат' AND middle_name = 'Наильевич' AND birth_year = 1989), 9, 63, NULL, 66.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Айдбаев Ильфат Наильевич', 'МАУ ДО "СШ №1" г.Тобольска', 'Тюменская область', 1001, 27),
  (1134, 1013, (SELECT id FROM athletes WHERE last_name = 'Бенидзе' AND first_name = 'Спартак' AND middle_name = 'Бадриевич' AND birth_year = 2002), 10, 60, NULL, 67.75, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Бенидзе Спартак Бадриевич', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 1001, 27),
  (1135, 1013, (SELECT id FROM athletes WHERE last_name = 'Башаров' AND first_name = 'Ислам' AND middle_name = 'Нурисламович' AND birth_year = 2006), 11, 55, NULL, 66.7, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Башаров Ислам Нурисламович', 'РОО ФГС РТ', 'Республика Татарстан', 1001, 27),
  (1136, 1013, (SELECT id FROM athletes WHERE last_name = 'Хамидов' AND first_name = 'Фахриддин' AND middle_name = 'Фарход Угли' AND birth_year = 2002), 12, 53, NULL, 67.9, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Хамидов Фахриддин Фарход Угли', 'Сшор маршал', 'Калужская область', 1001, 27),
  (1137, 1013, (SELECT id FROM athletes WHERE last_name = 'Пихтарь' AND first_name = 'Георгий' AND middle_name = 'Евгеньевич' AND birth_year = 2008), 13, 52, NULL, 68.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Пихтарь Георгий Евгеньевич', 'МБУ ДО "СШ" г. Новозыбкова', 'Брянская область', 1001, 27),
  (1138, 1013, (SELECT id FROM athletes WHERE last_name = 'Башаров' AND first_name = 'Арыслан' AND middle_name = 'Нурисламович' AND birth_year = 2007), 14, 40, NULL, 65.35, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Башаров Арыслан Нурисламович', 'РОО ФГС РТ', 'Республика Татарстан', 1001, 27),
  (1139, 1014, (SELECT id FROM athletes WHERE last_name = 'Бобров' AND first_name = 'Владимир' AND middle_name = 'Сергеевич' AND birth_year = 1989), 1, 137, NULL, 72.9, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Бобров Владимир Сергеевич', 'ВС РФ', 'Тюменская область', 1001, 26),
  (1140, 1014, (SELECT id FROM athletes WHERE last_name = 'Рассадин' AND first_name = 'Андрей' AND middle_name = 'Андреевич' AND birth_year = 1989), 2, 136, NULL, 72.7, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Рассадин Андрей Андреевич', 'ВС', 'Республика Бурятия', 1001, 26),
  (1141, 1014, (SELECT id FROM athletes WHERE last_name = 'Коломин' AND first_name = 'Дмитрий' AND middle_name = 'Андреевич' AND birth_year = 1999), 3, 114, NULL, 72.6, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Коломин Дмитрий Андреевич', 'ВС', 'Республика Бурятия', 1001, 26),
  (1142, 1014, (SELECT id FROM athletes WHERE last_name = 'Сергеев' AND first_name = 'Александр' AND middle_name = 'Сергеевич' AND birth_year = 1991), 4, 113, NULL, 72.1, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Сергеев Александр Сергеевич', 'МО РФ', 'Калужская область', 1001, 26),
  (1143, 1014, (SELECT id FROM athletes WHERE last_name = 'Волдаев' AND first_name = 'Александр' AND middle_name = 'Владимирович' AND birth_year = 2000), 5, 113, NULL, 72.65, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Волдаев Александр Владимирович', 'Федерация гиревого спорта Томской области', 'Томская область', 1001, 26),
  (1144, 1014, (SELECT id FROM athletes WHERE last_name = 'Васин' AND first_name = 'Артём' AND middle_name = 'Иванович' AND birth_year = 2007), 6, 108, NULL, 71.5, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Васин Артём Иванович', 'СШОР "Маршал"', 'Калужская область', 1001, 26),
  (1145, 1014, (SELECT id FROM athletes WHERE last_name = 'Каргин' AND first_name = 'Сергей' AND middle_name = 'Ярославович' AND birth_year = 1998), 7, 107, NULL, 73.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Каргин Сергей Ярославович', 'ВС', 'Республика Бурятия', 1001, 26),
  (1146, 1014, (SELECT id FROM athletes WHERE last_name = 'Крюков' AND first_name = 'Дмитрий' AND middle_name = 'Андреевич' AND birth_year = 1993), 8, 91, NULL, 72.6, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Крюков Дмитрий Андреевич', 'РО ООО ВФГС в Нижегородской области', 'Нижегородская область', 1001, 26),
  (1147, 1014, (SELECT id FROM athletes WHERE last_name = 'Багров' AND first_name = 'Максим' AND middle_name = 'Дмитриевич' AND birth_year = 2009), 9, 83, NULL, 71.75, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Багров Максим Дмитриевич', 'ГБУ ДО МКСШОР "ЗАПАД" ОТДЕЛЕНИЕ " СЕМЕРКА"', 'г. Москва', 1001, 26),
  (1148, 1014, (SELECT id FROM athletes WHERE last_name = 'Белов' AND first_name = 'Дмитрий' AND middle_name = 'Сергеевич' AND birth_year = 2008), 10, 65, NULL, 73.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Белов Дмитрий Сергеевич', '-', 'г. Москва', 1001, 26),
  (1149, 1014, (SELECT id FROM athletes WHERE last_name = 'Аксентьев' AND first_name = 'Данил' AND middle_name = 'Андреевич' AND birth_year = 2003), 11, 45, NULL, 72.75, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Аксентьев Данил Андреевич', 'Атлет', 'Челябинская область', 1001, 26),
  (1150, 1015, (SELECT id FROM athletes WHERE last_name = 'Сулейманов' AND first_name = 'Мовсар' AND middle_name = 'Мусаевич' AND birth_year = 1989), 1, 143, NULL, 77.65, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Сулейманов Мовсар Мусаевич', 'СШОР "Маршал"', 'Калужская область', 1001, 25),
  (1151, 1015, (SELECT id FROM athletes WHERE last_name = 'Кожевников' AND first_name = 'Сергей' AND middle_name = 'Павлович' AND birth_year = 2008), 2, 141, NULL, 77.95, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Кожевников Сергей Павлович', 'СШ 3. Г. Улан-Удэ', 'Республика Бурятия', 1001, 25),
  (1152, 1015, (SELECT id FROM athletes WHERE last_name = 'Ташланов' AND first_name = 'Илья' AND middle_name = 'Станиставович' AND birth_year = 1987), 3, 138, NULL, 77.95, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Ташланов Илья Станиставович', 'РО ООО ВФГС в Челябинской Области', 'Челябинская область', 1001, 25),
  (1153, 1015, (SELECT id FROM athletes WHERE last_name = 'Порцев' AND first_name = 'Роман' AND middle_name = 'Геннадьевич' AND birth_year = 1987), 4, 131, NULL, 77.25, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Порцев Роман Геннадьевич', 'МАУ ДО СШ «Прикамье» г. Перми', 'Пермский край', 1001, 25),
  (1154, 1015, (SELECT id FROM athletes WHERE last_name = 'Сарсембаев' AND first_name = 'Ильяс' AND middle_name = 'Асхатович' AND birth_year = 1999), 5, 129, NULL, 77.75, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Сарсембаев Ильяс Асхатович', 'МБУ ДО СШ "Зенит"', 'Ямало-Ненецкий автономный округ', 1001, 25),
  (1155, 1015, (SELECT id FROM athletes WHERE last_name = 'Остриков' AND first_name = 'Максим' AND middle_name = 'Витальевич' AND birth_year = 2005), 6, 122, NULL, 77.8, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Остриков Максим Витальевич', 'СШОР "Маршал"', 'Калужская область', 1001, 25),
  (1156, 1015, (SELECT id FROM athletes WHERE last_name = 'Степанов' AND first_name = 'Сергей' AND middle_name = 'Владимирович' AND birth_year = 1993), 7, 115, NULL, 77.75, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Степанов Сергей Владимирович', 'РОООО ВФГС в Челябинской области', 'Челябинская область', 1001, 25),
  (1157, 1015, (SELECT id FROM athletes WHERE last_name = 'Шаишников' AND first_name = 'Даниил' AND middle_name = 'Андреевич' AND birth_year = 2008), 8, 112, NULL, 77.4, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Шаишников Даниил Андреевич', 'МКОУДО ЗАТО Знаменск СШ', 'Астраханская область', 1001, 25),
  (1158, 1015, (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Виталий' AND middle_name = 'Викторович' AND birth_year = 1978), 9, 97, NULL, 77.2, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Иванов Виталий Викторович', 'МБУ ДО СШОР «Югория» им. А.А. Пилояна', 'Ханты-Мансийский АО - Югра', 1001, 25),
  (1159, 1015, (SELECT id FROM athletes WHERE last_name = 'Ладе' AND first_name = 'Роман' AND middle_name = 'Андреевич' AND birth_year = 1991), 10, 52, NULL, 77.4, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Ладе Роман Андреевич', 'самовыдвиженец', 'Республика Коми', 1001, 25),
  (1160, 1015, (SELECT id FROM athletes WHERE last_name = 'Богатов' AND first_name = 'Иван' AND middle_name = 'Сергеевич' AND birth_year = 2004), 11, 46, NULL, 75.75, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Богатов Иван Сергеевич', 'ВС', 'Республика Бурятия', 1001, 25),
  (1161, 1016, (SELECT id FROM athletes WHERE last_name = 'Маликов' AND first_name = 'Данил' AND middle_name = 'Дамирович' AND birth_year = 2001), 1, 156, NULL, 84.2, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Маликов Данил Дамирович', 'МАУ ДО СШ «Прикамье» г. Перми', 'Пермский край', 1001, 24),
  (1162, 1016, (SELECT id FROM athletes WHERE last_name = 'Черкашин' AND first_name = 'Дмитрий' AND middle_name = 'Андреевич' AND birth_year = 1999), 2, 152, NULL, 85.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Черкашин Дмитрий Андреевич', 'ОГАУ ДО СШОР', 'Томская область', 1001, 24),
  (1163, 1016, (SELECT id FROM athletes WHERE last_name = 'Шиляев' AND first_name = 'Иван' AND middle_name = 'Николаевич' AND birth_year = 1996), 3, 140, NULL, 81.15, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Шиляев Иван Николаевич', 'АМУ спортивный клуб Надежда', 'Удмуртская Республика', 1001, 24),
  (1164, 1016, (SELECT id FROM athletes WHERE last_name = 'Самочернов' AND first_name = 'Иван' AND middle_name = 'Николаевич' AND birth_year = 1998), 4, 133, NULL, 84.95, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Самочернов Иван Николаевич', 'Курганская область', 'Курганская область', 1001, 24),
  (1165, 1016, (SELECT id FROM athletes WHERE last_name = 'Бородынкин' AND first_name = 'Олег' AND middle_name = 'Александрович' AND birth_year = 2002), 5, 130, NULL, 84.7, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Бородынкин Олег Александрович', 'ВС', 'Новосибирская область', 1001, 24),
  (1166, 1016, (SELECT id FROM athletes WHERE last_name = 'Плотников' AND first_name = 'Вячеслав' AND middle_name = 'Евгеньевич' AND birth_year = 1998), 6, 117, NULL, 81.95, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Плотников Вячеслав Евгеньевич', 'РО ООО ВФГС в Челябинской Области', 'Челябинская область', 1001, 24),
  (1167, 1016, (SELECT id FROM athletes WHERE last_name = 'Рысник' AND first_name = 'Сергей' AND middle_name = 'Михайлович' AND birth_year = 1995), 7, 112, NULL, 84.95, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Рысник Сергей Михайлович', 'Армия России', 'Омская область', 1001, 24),
  (1168, 1016, (SELECT id FROM athletes WHERE last_name = 'Курдюков' AND first_name = 'Василий' AND middle_name = 'Сергеевич' AND birth_year = 1997), 8, 111, NULL, 84.05, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Курдюков Василий Сергеевич', 'ЦСП', 'Омская область', 1001, 24),
  (1169, 1016, (SELECT id FROM athletes WHERE last_name = 'Анасенко' AND first_name = 'Антон' AND middle_name = 'Владимирович' AND birth_year = 1979), 9, 100, NULL, 84.8, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Анасенко Антон Владимирович', 'ВС РФ', 'Омская область', 1001, 24),
  (1170, 1016, (SELECT id FROM athletes WHERE last_name = 'Битков' AND first_name = 'Антон' AND middle_name = 'Николаевич' AND birth_year = 1994), 10, 95, NULL, 83.95, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Битков Антон Николаевич', 'МБУДО "Куртамышская ДЮСШ"', 'Курганская область', 1001, 24),
  (1171, 1016, (SELECT id FROM athletes WHERE last_name = 'Ивановский' AND first_name = 'Данила' AND middle_name = 'Николаевич' AND birth_year = 2006), 11, 94, NULL, 81.15, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Ивановский Данила Николаевич', 'СШОР "Маршал"', 'Калужская область', 1001, 24),
  (1172, 1016, (SELECT id FROM athletes WHERE last_name = 'Сисейкин' AND first_name = 'Максим' AND middle_name = 'Сергеевич' AND birth_year = 1993), 12, 86, NULL, 84.7, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Сисейкин Максим Сергеевич', 'Владимирская область', 'Владимирская область', 1001, 24),
  (1173, 1016, (SELECT id FROM athletes WHERE last_name = 'Крестьянинов' AND first_name = 'Виктор' AND middle_name = 'Александрович' AND birth_year = 2000), 13, 50, NULL, 84.4, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Крестьянинов Виктор Александрович', 'МАУ ДО СШ «Прикамье» г. Перми', 'Пермский край', 1001, 24),
  (1174, 1017, (SELECT id FROM athletes WHERE last_name = 'Гуров' AND first_name = 'Владимир' AND middle_name = 'Анатольевич' AND birth_year = 1978), 1, 160, NULL, 94.6, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Гуров Владимир Анатольевич', 'СШОР Маршал', 'Калужская область', 1001, 23),
  (1175, 1017, (SELECT id FROM athletes WHERE last_name = 'Кулаков' AND first_name = 'Иван' AND middle_name = 'Иванович' AND birth_year = 1998), 2, 158, NULL, 94.75, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Кулаков Иван Иванович', 'СШОР "Маршал"', 'Калужская область', 1001, 23),
  (1176, 1017, (SELECT id FROM athletes WHERE last_name = 'Турищев' AND first_name = 'Дмитрий' AND middle_name = 'Владимирович' AND birth_year = 1992), 3, 151, NULL, 94.95, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Турищев Дмитрий Владимирович', 'ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»', 'г. Москва', 1001, 23),
  (1177, 1017, (SELECT id FROM athletes WHERE last_name = 'Николаев' AND first_name = 'Аркадий' AND middle_name = 'Анатольевич' AND birth_year = 2002), 4, 145, NULL, 89.05, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Николаев Аркадий Анатольевич', 'МБУ ДО СШОР «Югория» им. А.А. Пилояна', 'Ханты-Мансийский АО - Югра', 1001, 23),
  (1178, 1017, (SELECT id FROM athletes WHERE last_name = 'Кирюхин' AND first_name = 'Роман' AND middle_name = 'Александрович' AND birth_year = 1997), 5, 123, NULL, 86.9, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Кирюхин Роман Александрович', '-', 'г. Москва', 1001, 23),
  (1179, 1017, (SELECT id FROM athletes WHERE last_name = 'Булдаков' AND first_name = 'Никита' AND middle_name = 'Юрьевич' AND birth_year = 1997), 6, 121, NULL, 91.05, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Булдаков Никита Юрьевич', 'Вооруженные силы Российской Федераций', 'Удмуртская Республика', 1001, 23),
  (1180, 1017, (SELECT id FROM athletes WHERE last_name = 'Житихин' AND first_name = 'Владислав' AND middle_name = 'Николаевич' AND birth_year = 1994), 7, 113, NULL, 91.65, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Житихин Владислав Николаевич', 'ВС', 'Республика Бурятия', 1001, 23),
  (1181, 1017, (SELECT id FROM athletes WHERE last_name = 'Черкашин' AND first_name = 'Иван' AND middle_name = 'Андревич' AND birth_year = 1999), 8, 107, NULL, 92.2, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Черкашин Иван Андревич', 'ОГАУДО Томская областная СШОР', 'Томская область', 1001, 23),
  (1182, 1017, (SELECT id FROM athletes WHERE last_name = 'Кравченко' AND first_name = 'Сергей' AND middle_name = 'Сергеевич' AND birth_year = 1982), 9, 103, NULL, 92.1, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Кравченко Сергей Сергеевич', 'МАУ ДО СШОР по силовым видам спорта', 'Калининградская область', 1001, 23),
  (1183, 1017, (SELECT id FROM athletes WHERE last_name = 'Спичкин' AND first_name = 'Алексей' AND middle_name = 'Евгеньевич' AND birth_year = 1994), 10, 102, NULL, 91.55, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Спичкин Алексей Евгеньевич', 'ВС', 'Новосибирская область', 1001, 23),
  (1184, 1017, (SELECT id FROM athletes WHERE last_name = 'Дубков' AND first_name = 'Артём' AND middle_name = 'Александрович' AND birth_year = 1994), 11, 96, NULL, 87.8, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Дубков Артём Александрович', '-', 'Омская область', 1001, 23),
  (1185, 1017, (SELECT id FROM athletes WHERE last_name = 'Мухитов' AND first_name = 'Андрей' AND middle_name = 'Вячеславович' AND birth_year = 1999), 12, 94, NULL, 87.1, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Мухитов Андрей Вячеславович', 'СШОР по борьбе', 'Брянская область', 1001, 23),
  (1186, 1017, (SELECT id FROM athletes WHERE last_name = 'Салихов' AND first_name = 'Рустам' AND middle_name = 'Ренатович' AND birth_year = 1982), 13, 67, NULL, 93.8, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Салихов Рустам Ренатович', '-', 'Оренбургская область', 1001, 23),
  (1187, 1018, (SELECT id FROM athletes WHERE last_name = 'Марков' AND first_name = 'Иван' AND middle_name = 'Эдуардович' AND birth_year = 1995), 1, 171, NULL, 100.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Марков Иван Эдуардович', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 1001, 22),
  (1188, 1018, (SELECT id FROM athletes WHERE last_name = 'Балабанов' AND first_name = 'Сергей' AND middle_name = 'Андреевич' AND birth_year = 1996), 2, 134, NULL, 104.85, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Балабанов Сергей Андреевич', 'ВС', 'Республика Бурятия', 1001, 22),
  (1189, 1018, (SELECT id FROM athletes WHERE last_name = 'Орлов' AND first_name = 'Сергей' AND middle_name = 'Александрович' AND birth_year = 2005), 3, 131, NULL, 120.7, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Орлов Сергей Александрович', 'Спортивная школа', 'Ставропольский край', 1001, 22),
  (1190, 1018, (SELECT id FROM athletes WHERE last_name = 'Вдовенко' AND first_name = 'Александр' AND middle_name = 'Андреевич' AND birth_year = 1995), 4, 128, NULL, 103.25, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Вдовенко Александр Андреевич', 'Курганская область', 'Курганская область', 1001, 22),
  (1191, 1018, (SELECT id FROM athletes WHERE last_name = 'Шевелев' AND first_name = 'Дмитрий' AND middle_name = 'Владимирович' AND birth_year = 1989), 5, 125, NULL, 115.45, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Шевелев Дмитрий Владимирович', 'ВС', 'Новосибирская область', 1001, 22),
  (1192, 1018, (SELECT id FROM athletes WHERE last_name = 'Чеботарев' AND first_name = 'Юрий' AND middle_name = 'Юрьевич' AND birth_year = 1989), 6, 111, NULL, 95.5, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Чеботарев Юрий Юрьевич', 'МАУ"ЦФОР-Ритм"', 'Тюменская область', 1001, 22),
  (1193, 1018, (SELECT id FROM athletes WHERE last_name = 'Башаров' AND first_name = 'Нурислам' AND middle_name = 'Магсумович' AND birth_year = 1983), 7, 90, NULL, 108.25, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Башаров Нурислам Магсумович', 'РОО ФГС РТ', 'Республика Татарстан', 1001, 22),
  (1194, 1018, (SELECT id FROM athletes WHERE last_name = 'Шереметов' AND first_name = 'Александр' AND middle_name = 'Владимирович' AND birth_year = 1990), 8, 85, NULL, 102.6, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Шереметов Александр Владимирович', 'Липецкая область', 'Липецкая область', 1001, 22),
  (1195, 1018, (SELECT id FROM athletes WHERE last_name = 'Соболев' AND first_name = 'Никита' AND middle_name = 'Александрович' AND birth_year = 2006), 9, 83, NULL, 107.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Соболев Никита Александрович', 'БПОУ УР "Ярский политехникум"', 'Удмуртская Республика', 1001, 22),
  (1196, 1018, (SELECT id FROM athletes WHERE last_name = 'Зуев' AND first_name = 'Илья' AND middle_name = 'Александрович' AND birth_year = 2007), 10, 63, NULL, 106.4, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Зуев Илья Александрович', 'МАУ ДО СШ «Прикамье» г. Перми', 'Пермский край', 1001, 22),
  (1197, 1018, (SELECT id FROM athletes WHERE last_name = 'Чирков' AND first_name = 'Леонид' AND middle_name = 'Евгеньевич' AND birth_year = 2003), 11, 56, NULL, 114.85, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Чирков Леонид Евгеньевич', 'Калуга', 'Калужская область', 1001, 22),
  (1198, 1018, (SELECT id FROM athletes WHERE last_name = 'Июльский' AND first_name = 'Дмитрий' AND middle_name = 'Валерьевич' AND birth_year = 1993), 12, 55, NULL, 104.65, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2025-06-12', 'Июльский Дмитрий Валерьевич', 'ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»', 'г. Москва', 1001, 22),
  (1199, 1019, (SELECT id FROM athletes WHERE last_name = 'Трофимова' AND first_name = 'Милена' AND middle_name = 'Михайловна' AND birth_year = 2007), 1, 85, NULL, 57.8, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1001, '2025-06-12', 'Трофимова Милена Михайловна', 'СШОР «Маршал»', 'Калужская область', 1001, 21),
  (1200, 1019, (SELECT id FROM athletes WHERE last_name = 'Прохорова' AND first_name = 'Ангелина' AND middle_name = 'Вячеславовна' AND birth_year = 2005), 2, 79, NULL, 55.7, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1001, '2025-06-12', 'Прохорова Ангелина Вячеславовна', 'МУ ДО МЦРФКиС', 'Новосибирская область', 1001, 21),
  (1201, 1019, (SELECT id FROM athletes WHERE last_name = 'Лазарева' AND first_name = 'Анастасия' AND middle_name = 'Александровна' AND birth_year = 1991), 3, 57, NULL, 54.65, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1001, '2025-06-12', 'Лазарева Анастасия Александровна', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 1001, 21),
  (1202, 1019, (SELECT id FROM athletes WHERE last_name = 'Подольская' AND first_name = 'Анастасия' AND middle_name = 'Владимировна' AND birth_year = 2005), 4, 27, NULL, 57.65, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1001, '2025-06-12', 'Подольская Анастасия Владимировна', 'РО ООО «ВФГС» в г. Москве', 'г. Москва', 1001, 21),
  (1203, 1019, (SELECT id FROM athletes WHERE last_name = 'Семирунняя' AND first_name = 'Александра' AND middle_name = 'Витальевна' AND birth_year = 2006), 5, 24, NULL, 54.65, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1001, '2025-06-12', 'Семирунняя Александра Витальевна', 'РСОО "ФГС РО"', 'Ростовская область', 1001, 21),
  (1204, 1019, (SELECT id FROM athletes WHERE last_name = 'Молчанова' AND first_name = 'Виктория' AND middle_name = 'Николаевна' AND birth_year = 2008), 6, 23, NULL, 54.45, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1001, '2025-06-12', 'Молчанова Виктория Николаевна', 'МКОУДО ЗАТО Знаменск СШ', 'Астраханская область', 1001, 21),
  (1205, 1019, (SELECT id FROM athletes WHERE last_name = 'Меденцева' AND first_name = 'Дарья' AND middle_name = 'Александровна' AND birth_year = 2004), 7, 23, NULL, 56.8, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1001, '2025-06-12', 'Меденцева Дарья Александровна', 'МАУ ДО "КСШ КМО"', 'Кемеровская область', 1001, 21),
  (1206, 1019, (SELECT id FROM athletes WHERE last_name = 'Чернова' AND first_name = 'Кира' AND middle_name = 'Николаевна' AND birth_year = 2009), 8, 21, NULL, 53.45, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1001, '2025-06-12', 'Чернова Кира Николаевна', 'СШОР МАРШАЛ', 'Калужская область', 1001, 21),
  (1207, 1019, (SELECT id FROM athletes WHERE last_name = 'Ныныч' AND first_name = 'Маргарита' AND middle_name = 'Анатольевна' AND birth_year = 1996), 9, 5, NULL, 57.75, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1001, '2025-06-12', 'Ныныч Маргарита Анатольевна', 'ВС', 'Республика Бурятия', 1001, 21),
  (1208, 1019, (SELECT id FROM athletes WHERE last_name = 'Спасенникова' AND first_name = 'Валерия' AND middle_name = 'Витальевна' AND birth_year = 2008), NULL, NULL, NULL, NULL, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1001, '2025-06-12', 'Спасенникова Валерия Витальевна', 'СК Атлант', 'Тюменская область', 1001, 21),
  (1209, 1020, (SELECT id FROM athletes WHERE last_name = 'Барбакова' AND first_name = 'Александра' AND middle_name = 'Максимовна' AND birth_year = 2004), 1, 102, NULL, 59.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1001, '2025-06-12', 'Барбакова Александра Максимовна', 'СШОР «Маршал»', 'Калужская область', 1001, 20),
  (1210, 1020, (SELECT id FROM athletes WHERE last_name = 'Бутенко' AND first_name = 'Милена' AND middle_name = 'Александровна' AND birth_year = 2004), 2, 65, NULL, 62.9, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1001, '2025-06-12', 'Бутенко Милена Александровна', 'МУ ДО МЦРФКиС', 'Новосибирская область', 1001, 20),
  (1211, 1020, (SELECT id FROM athletes WHERE last_name = 'Фирулева' AND first_name = 'Василиса' AND middle_name = 'Владимировна' AND birth_year = 2004), 3, 54, NULL, 63.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1001, '2025-06-12', 'Фирулева Василиса Владимировна', 'МБУ ДО СШ "Уренгоец"', 'Ямало-Ненецкий автономный округ', 1001, 20),
  (1212, 1020, (SELECT id FROM athletes WHERE last_name = 'Герман' AND first_name = 'Алена' AND middle_name = 'Сергеевна' AND birth_year = 1997), 4, 49, NULL, 62.4, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1001, '2025-06-12', 'Герман Алена Сергеевна', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 1001, 20),
  (1213, 1020, (SELECT id FROM athletes WHERE last_name = 'Тарвердиева' AND first_name = 'Мария' AND middle_name = 'Алексеевна' AND birth_year = 1986), 5, 49, NULL, 62.75, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1001, '2025-06-12', 'Тарвердиева Мария Алексеевна', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 1001, 20),
  (1214, 1020, (SELECT id FROM athletes WHERE last_name = 'Альянова' AND first_name = 'Виктория' AND middle_name = 'Евгеньевна' AND birth_year = 2004), 6, 43, NULL, 62.7, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1001, '2025-06-12', 'Альянова Виктория Евгеньевна', 'СШОР по борьбе', 'Брянская область', 1001, 20),
  (1215, 1020, (SELECT id FROM athletes WHERE last_name = 'Переплетова' AND first_name = 'Яна' AND middle_name = 'Васильевна' AND birth_year = 2009), 7, 38, NULL, 61.3, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1001, '2025-06-12', 'Переплетова Яна Васильевна', 'ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»', 'г. Москва', 1001, 20),
  (1216, 1020, (SELECT id FROM athletes WHERE last_name = 'Пузанкова' AND first_name = 'Анастасия' AND middle_name = 'Константиновна' AND birth_year = 2006), 8, 20, NULL, 59.9, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1001, '2025-06-12', 'Пузанкова Анастасия Константиновна', 'МБУ ДО СШ «Татнефть Олимп»', 'Республика Татарстан', 1001, 20),
  (1217, 1021, (SELECT id FROM athletes WHERE last_name = 'Воропаева' AND first_name = 'Виктория' AND middle_name = 'Витальевна' AND birth_year = 2004), 1, 71, NULL, 67.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1001, '2025-06-12', 'Воропаева Виктория Витальевна', 'МКУ ДО "Бобровская СШ им. В.Л. Паткина"', 'Воронежская область', 1001, 19),
  (1218, 1021, (SELECT id FROM athletes WHERE last_name = 'Кошурникова' AND first_name = 'Анастасия' AND middle_name = 'Александровна' AND birth_year = 2003), 2, 68, NULL, 63.65, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1001, '2025-06-12', 'Кошурникова Анастасия Александровна', 'МБУ ДО СШОР «Югория» им. А.А. Пилояна', 'Ханты-Мансийский АО - Югра', 1001, 19),
  (1219, 1021, (SELECT id FROM athletes WHERE last_name = 'Мартынова' AND first_name = 'Любовь' AND middle_name = 'Владимировна' AND birth_year = 2007), 3, 62, NULL, 66.95, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1001, '2025-06-12', 'Мартынова Любовь Владимировна', 'МКОУДО ЗАТО Знаменск СШ', 'Астраханская область', 1001, 19),
  (1220, 1021, (SELECT id FROM athletes WHERE last_name = 'Любина' AND first_name = 'Александра' AND middle_name = 'Анатольевна' AND birth_year = 2005), 4, 49, NULL, 67.25, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1001, '2025-06-12', 'Любина Александра Анатольевна', 'МБУ ДО СШОР «Югория» им. А.А. Пилояна', 'Ханты-Мансийский АО - Югра', 1001, 19),
  (1221, 1021, (SELECT id FROM athletes WHERE last_name = 'Ельчанинова' AND first_name = 'Вероника' AND middle_name = 'Сергеевна' AND birth_year = 2003), 5, 28, NULL, 68.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1001, '2025-06-12', 'Ельчанинова Вероника Сергеевна', 'СШОР 33', 'Омская область', 1001, 19),
  (1222, 1021, (SELECT id FROM athletes WHERE last_name = 'Кутенкова' AND first_name = 'Анастасия' AND middle_name = 'Михайловна' AND birth_year = 1997), 6, 20, NULL, 67.9, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1001, '2025-06-12', 'Кутенкова Анастасия Михайловна', 'ВС', 'Республика Бурятия', 1001, 19),
  (1223, 1021, (SELECT id FROM athletes WHERE last_name = 'Сергеева' AND first_name = 'Юлия' AND middle_name = 'Александровна' AND birth_year = 1980), 7, 15, NULL, 66.85, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1001, '2025-06-12', 'Сергеева Юлия Александровна', 'Федерация гиревого спорта г. Москва', 'г. Москва', 1001, 19),
  (1224, 1022, (SELECT id FROM athletes WHERE last_name = 'Мартынова' AND first_name = 'Ирина' AND middle_name = 'Александровна' AND birth_year = 1999), 1, 80, NULL, 85.7, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1001, '2025-06-12', 'Мартынова Ирина Александровна', 'СШОР «Маршал»', 'Калужская область', 1001, 43),
  (1225, 1022, (SELECT id FROM athletes WHERE last_name = 'Верховцева' AND first_name = 'Екатерина' AND middle_name = 'Николаевна' AND birth_year = 2003), 2, 57, NULL, 79.2, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1001, '2025-06-12', 'Верховцева Екатерина Николаевна', 'МАУ ДО СШОР "Метеор"', 'Ярославская область', 1001, 43),
  (1226, 1022, (SELECT id FROM athletes WHERE last_name = 'Врубель' AND first_name = 'Дарья' AND middle_name = 'Васильевна' AND birth_year = 2000), 3, 56, NULL, 94.85, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1001, '2025-06-12', 'Врубель Дарья Васильевна', 'БУ ДО города Омска "СШОР 33"', 'Омская область', 1001, 43),
  (1227, 1022, (SELECT id FROM athletes WHERE last_name = 'Побережная' AND first_name = 'Анна' AND middle_name = 'Владимировна' AND birth_year = 2010), 4, 45, NULL, 72.8, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1001, '2025-06-12', 'Побережная Анна Владимировна', 'СШОР «Маршал»', 'Калужская область', 1001, 43),
  (1228, 1022, (SELECT id FROM athletes WHERE last_name = 'Кузьмичева' AND first_name = 'Ксения' AND middle_name = 'Сергеевна' AND birth_year = 2004), 5, 30, NULL, 80.85, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1001, '2025-06-12', 'Кузьмичева Ксения Сергеевна', 'СШ №1 им. Л.Д. Ковалевского', 'Оренбургская область', 1001, 43),
  (1229, 1022, (SELECT id FROM athletes WHERE last_name = 'Махкамова' AND first_name = 'Парвина' AND middle_name = 'Маруфовна' AND birth_year = 2007), 6, 26, NULL, 88.4, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1001, '2025-06-12', 'Махкамова Парвина Маруфовна', 'МАУ ДО СШ «Прикамье» г. Перми', 'Пермский край', 1001, 43),
  (1230, 1022, (SELECT id FROM athletes WHERE last_name = 'Попова' AND first_name = 'Мария' AND middle_name = 'Алексеевна' AND birth_year = 2005), 7, 25, NULL, 78.4, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1001, '2025-06-12', 'Попова Мария Алексеевна', 'ССК"КИТнаспорте"', 'Пермский край', 1001, 43),
  (1231, 1023, (SELECT id FROM athletes WHERE last_name = 'Смагулов' AND first_name = 'Нурсултан' AND middle_name = 'Шайзандинович' AND birth_year = 1999), 1, 196, NULL, 62.95, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Смагулов Нурсултан Шайзандинович', 'СПБ ГБУ ДО СШОРСВС им. В.Ф.', 'г. Санкт-Петербург', 1001, 18),
  (1232, 1023, (SELECT id FROM athletes WHERE last_name = 'Бутенко' AND first_name = 'Евгений' AND middle_name = 'Александрович' AND birth_year = 1995), 2, 193, NULL, 62.85, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Бутенко Евгений Александрович', 'МУ ДО "МЦРФКиС"', 'Новосибирская область', 1001, 18),
  (1233, 1023, (SELECT id FROM athletes WHERE last_name = 'Бенидзе' AND first_name = 'Джони' AND middle_name = 'Бадриевич' AND birth_year = 1990), 3, 185, NULL, 62.95, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Бенидзе Джони Бадриевич', 'СПБ ГБУ ДО СШОРСВС им. В.Ф.', 'г. Санкт-Петербург', 1001, 18),
  (1234, 1023, (SELECT id FROM athletes WHERE last_name = 'Маринкин' AND first_name = 'Егор' AND middle_name = 'Андреевич' AND birth_year = 2003), 4, 179, NULL, 63.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Маринкин Егор Андреевич', 'ГБУ ДО МКСШОР «Запад» Отделение', 'г. Москва', 1001, 18),
  (1235, 1023, (SELECT id FROM athletes WHERE last_name = 'Ховалко' AND first_name = 'Василий' AND middle_name = 'Михайлович' AND birth_year = 1993), 5, 152, NULL, 61.7, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Ховалко Василий Михайлович', 'МБУ ДО СШ "Уренгоец"', 'Ямало-Ненецкий автономный округ', 1001, 18),
  (1236, 1023, (SELECT id FROM athletes WHERE last_name = 'Арсентьев' AND first_name = 'Виталий' AND middle_name = 'Александрович' AND birth_year = 2001), 6, 145, NULL, 62.95, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Арсентьев Виталий Александрович', 'ЯВВУ ПВО', 'Ярославская область', 1001, 18),
  (1237, 1023, (SELECT id FROM athletes WHERE last_name = 'Петелин' AND first_name = 'Александр' AND middle_name = 'Владимирович' AND birth_year = 1987), 7, 110, NULL, 62.9, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Петелин Александр Владимирович', 'МАУ ДО "Вагайский центр спорта и творчества"', 'Тюменская область', 1001, 18),
  (1238, 1023, (SELECT id FROM athletes WHERE last_name = 'Ильясов' AND first_name = 'Какен' AND middle_name = 'Канатович' AND birth_year = 1993), 8, 108, NULL, 63.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Ильясов Какен Канатович', 'ВС', 'Омская область', 1001, 18),
  (1239, 1023, (SELECT id FROM athletes WHERE last_name = 'Руднев' AND first_name = 'Руслан' AND middle_name = 'Сергеевич' AND birth_year = 1994), 9, 94, NULL, 63.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Руднев Руслан Сергеевич', '-', 'г. Санкт-Петербург', 1001, 18),
  (1240, 1023, (SELECT id FROM athletes WHERE last_name = 'Утев' AND first_name = 'Руслан' AND middle_name = 'Андреевич' AND birth_year = 2005), 10, 82, NULL, 62.1, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Утев Руслан Андреевич', 'МАУ ДО СШ «Прикамье» г. Перми', 'Пермский край', 1001, 18),
  (1241, 1023, (SELECT id FROM athletes WHERE last_name = 'Сиразетдинов' AND first_name = 'Данил' AND middle_name = 'Ильфатович' AND birth_year = 2007), 11, 27, NULL, 61.55, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Сиразетдинов Данил Ильфатович', 'МАУ ДО СШ «Прикамье» г. Перми', 'Пермский край', 1001, 18),
  (1242, 1024, (SELECT id FROM athletes WHERE last_name = 'Морозович' AND first_name = 'Владислав' AND middle_name = 'Павлович' AND birth_year = 1999), 1, 202, NULL, 67.9, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Морозович Владислав Павлович', 'СШОР 33', 'Омская область', 1001, 17),
  (1243, 1024, (SELECT id FROM athletes WHERE last_name = 'Бенидзе' AND first_name = 'Спартак' AND middle_name = 'Бадриевич' AND birth_year = 2002), 2, 198, NULL, 68.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Бенидзе Спартак Бадриевич', 'СПБ ГБУ ДО СШОРСВС им. В.Ф.', 'г. Санкт-Петербург', 1001, 17),
  (1244, 1024, (SELECT id FROM athletes WHERE last_name = 'Рябков' AND first_name = 'Алексей' AND middle_name = 'Игоревич' AND birth_year = 1993), 3, 197, NULL, 67.85, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Рябков Алексей Игоревич', 'МБУ ДО СШОР «Югория» им. А.А.', 'Ханты-Мансийский АО - Югра', 1001, 17),
  (1245, 1024, (SELECT id FROM athletes WHERE last_name = 'Шаров' AND first_name = 'Максим' AND middle_name = 'Игоревич' AND birth_year = 2000), 4, 194, NULL, 67.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Шаров Максим Игоревич', 'Маршал', 'Калужская область', 1001, 17),
  (1246, 1024, (SELECT id FROM athletes WHERE last_name = 'Щербин' AND first_name = 'Олег' AND middle_name = 'Владимирович' AND birth_year = 1989), 5, 187, NULL, 67.65, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Щербин Олег Владимирович', 'СПБ ГБУ ДО СШОРСВС им. В.Ф.', 'г. Санкт-Петербург', 1001, 17),
  (1247, 1024, (SELECT id FROM athletes WHERE last_name = 'Петушков' AND first_name = 'Денис' AND middle_name = 'Владимирович' AND birth_year = 1986), 6, 134, NULL, 67.4, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Петушков Денис Владимирович', 'Динамо', 'Смоленская область', 1001, 17),
  (1248, 1024, (SELECT id FROM athletes WHERE last_name = 'Потапов' AND first_name = 'Данил' AND middle_name = 'Алексеевич' AND birth_year = 2002), 7, 130, NULL, 68.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Потапов Данил Алексеевич', 'МБУДО "Лебяжьевская ДЮСШ"', 'Курганская область', 1001, 17),
  (1249, 1024, (SELECT id FROM athletes WHERE last_name = 'Хамидов' AND first_name = 'Фахриддин' AND middle_name = 'Фарход Угли' AND birth_year = 2002), 8, 119, NULL, 68.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Хамидов Фахриддин Фарход Угли', 'СШОР "Маршал"', 'Калужская область', 1001, 17),
  (1250, 1024, (SELECT id FROM athletes WHERE last_name = 'Громов' AND first_name = 'Алексей' AND middle_name = 'Николаевич' AND birth_year = 1995), 9, 111, NULL, 67.6, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Громов Алексей Николаевич', '-', 'Удмуртская Республика', 1001, 17),
  (1251, 1024, (SELECT id FROM athletes WHERE last_name = 'Башаров' AND first_name = 'Ислам' AND middle_name = 'Нурисламович' AND birth_year = 2006), 10, 105, NULL, 65.95, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Башаров Ислам Нурисламович', 'РОО ФГС РТ', 'Республика Татарстан', 1001, 17),
  (1252, 1024, (SELECT id FROM athletes WHERE last_name = 'Башаров' AND first_name = 'Арыслан' AND middle_name = 'Нурисламович' AND birth_year = 2007), 11, 85, NULL, 66.4, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Башаров Арыслан Нурисламович', 'РОО ФГС РТ', 'Республика Татарстан', 1001, 17),
  (1253, 1025, (SELECT id FROM athletes WHERE last_name = 'Рассадин' AND first_name = 'Андрей' AND middle_name = 'Андреевич' AND birth_year = 1989), 1, 204, NULL, 72.9, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Рассадин Андрей Андреевич', 'ВС', 'Республика Бурятия', 1001, 16),
  (1254, 1025, (SELECT id FROM athletes WHERE last_name = 'Мащенко' AND first_name = 'Олег' AND middle_name = 'Валерьевич' AND birth_year = 1983), 2, 185, NULL, 71.95, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Мащенко Олег Валерьевич', 'Вооружённые силы', 'Краснодарский край', 1001, 16),
  (1255, 1025, (SELECT id FROM athletes WHERE last_name = 'Беляев' AND first_name = 'Иван' AND middle_name = 'Сергеевич' AND birth_year = 1992), 3, 184, NULL, 72.75, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Беляев Иван Сергеевич', 'МБУ ДО СШОР «Югория» им. А.А.', 'Ханты-Мансийский АО - Югра', 1001, 16),
  (1256, 1025, (SELECT id FROM athletes WHERE last_name = 'Бобров' AND first_name = 'Владимир' AND middle_name = 'Сергеевич' AND birth_year = 1989), 4, 180, NULL, 72.95, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Бобров Владимир Сергеевич', 'ВС РФ', 'Тюменская область', 1001, 16),
  (1257, 1025, (SELECT id FROM athletes WHERE last_name = 'Каргин' AND first_name = 'Сергей' AND middle_name = 'Ярославович' AND birth_year = 1998), 5, 178, NULL, 73.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Каргин Сергей Ярославович', 'ВС', 'Республика Бурятия', 1001, 16),
  (1258, 1025, (SELECT id FROM athletes WHERE last_name = 'Балдин' AND first_name = 'Александр' AND middle_name = 'Васильевич' AND birth_year = 1993), 6, 166, NULL, 72.4, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Балдин Александр Васильевич', 'ООО РО "ВФГС" СО', 'Самарская область', 1001, 16),
  (1259, 1025, (SELECT id FROM athletes WHERE last_name = 'Волдаев' AND first_name = 'Александр' AND middle_name = 'Владимирович' AND birth_year = 2000), 7, 165, NULL, 72.65, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Волдаев Александр Владимирович', 'Федерация гиревого спорта Томской', 'Томская область', 1001, 16),
  (1260, 1025, (SELECT id FROM athletes WHERE last_name = 'Сергеев' AND first_name = 'Александр' AND middle_name = 'Сергеевич' AND birth_year = 1991), 8, 157, NULL, 71.5, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Сергеев Александр Сергеевич', 'СШОР "Маршал"', 'Калужская область', 1001, 16),
  (1261, 1025, (SELECT id FROM athletes WHERE last_name = 'Суслов' AND first_name = 'Александр' AND middle_name = 'Владимирович' AND birth_year = 1986), 9, 152, NULL, 72.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Суслов Александр Владимирович', 'ВФГС в Курганской области', 'Курганская область', 1001, 16),
  (1262, 1025, (SELECT id FROM athletes WHERE last_name = 'Коломин' AND first_name = 'Дмитрий' AND middle_name = 'Андреевич' AND birth_year = 1999), 10, 143, NULL, 72.9, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Коломин Дмитрий Андреевич', 'ВС', 'Республика Бурятия', 1001, 16),
  (1263, 1025, (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Евгений' AND middle_name = 'Игоревич' AND birth_year = 1987), 11, 122, NULL, 72.55, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Иванов Евгений Игоревич', 'ВС', 'Томская область', 1001, 16),
  (1264, 1025, (SELECT id FROM athletes WHERE last_name = 'Васин' AND first_name = 'Артём' AND middle_name = 'Иывнович' AND birth_year = 2007), 12, 112, NULL, 72.7, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Васин Артём Иывнович', 'СШОР "Маршал"', 'Калужская область', 1001, 16),
  (1265, 1025, (SELECT id FROM athletes WHERE last_name = 'Аксентьев' AND first_name = 'Данил' AND middle_name = 'Андреевич' AND birth_year = 2003), 13, 112, NULL, 72.85, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Аксентьев Данил Андреевич', 'Атлет', 'Челябинская область', 1001, 16),
  (1266, 1025, (SELECT id FROM athletes WHERE last_name = 'Белов' AND first_name = 'Дмитрий' AND middle_name = 'Сергеевич' AND birth_year = 2008), 14, 85, NULL, 72.65, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Белов Дмитрий Сергеевич', '-', 'г. Москва', 1001, 16),
  (1267, 1026, (SELECT id FROM athletes WHERE last_name = 'Квашнин' AND first_name = 'Михаил' AND middle_name = 'Федорович' AND birth_year = 1988), 1, 204, NULL, 77.7, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Квашнин Михаил Федорович', 'Динамо', 'Свердловская область', 1001, 15),
  (1268, 1026, (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Алексей' AND middle_name = 'Валерьевич' AND birth_year = 1995), 2, 199, NULL, 77.85, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Иванов Алексей Валерьевич', 'СШ Энергия', 'Чувашская Республика', 1001, 15),
  (1269, 1026, (SELECT id FROM athletes WHERE last_name = 'Кожевников' AND first_name = 'Сергей' AND middle_name = 'Павлович' AND birth_year = 2008), 3, 185, NULL, 77.8, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Кожевников Сергей Павлович', 'СШ 3. г. Улан-Удэ', 'Республика Бурятия', 1001, 15),
  (1270, 1026, (SELECT id FROM athletes WHERE last_name = 'Шаишников' AND first_name = 'Даниил' AND middle_name = 'Андреевич' AND birth_year = 2008), 4, 181, NULL, 77.7, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Шаишников Даниил Андреевич', 'МКОУДО ЗАТО Знаменск СШ', 'Астраханская область', 1001, 15),
  (1271, 1026, (SELECT id FROM athletes WHERE last_name = 'Алексеев' AND first_name = 'Радиф' AND middle_name = 'Дамирович' AND birth_year = 1989), 5, 178, NULL, 76.95, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Алексеев Радиф Дамирович', 'Спортивная школа "Хастар"', 'Чувашская Республика', 1001, 15),
  (1272, 1026, (SELECT id FROM athletes WHERE last_name = 'Степанов' AND first_name = 'Сергей' AND middle_name = 'Владимирович' AND birth_year = 1993), 6, 178, NULL, 77.2, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Степанов Сергей Владимирович', 'РО ООО ВФГС в Челябинской области', 'Челябинская область', 1001, 15),
  (1273, 1026, (SELECT id FROM athletes WHERE last_name = 'Дьячков' AND first_name = 'Олег' AND middle_name = 'Сергеевич' AND birth_year = 1995), 7, 178, NULL, 77.75, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Дьячков Олег Сергеевич', 'СШОР 5 г. Белгород', 'Белгородская область', 1001, 15),
  (1274, 1026, (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Виталий' AND middle_name = 'Викторович' AND birth_year = 1978), 8, 171, NULL, 77.7, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Иванов Виталий Викторович', 'МБУ ДО СШОР «Югория» им. А.А.', 'Ханты-Мансийский АО - Югра', 1001, 15),
  (1275, 1026, (SELECT id FROM athletes WHERE last_name = 'Любимский' AND first_name = 'Сергей' AND middle_name = 'Александрович' AND birth_year = 1992), 9, 171, NULL, 77.75, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Любимский Сергей Александрович', 'ВС', 'Республика Бурятия', 1001, 15),
  (1276, 1026, (SELECT id FROM athletes WHERE last_name = 'Бахтов' AND first_name = 'Илья' AND middle_name = 'Владимирович' AND birth_year = 1989), 10, 165, NULL, 77.35, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Бахтов Илья Владимирович', 'ООО "ВФГС" СО', 'Самарская область', 1001, 15),
  (1277, 1026, (SELECT id FROM athletes WHERE last_name = 'Сулейманов' AND first_name = 'Мовсар' AND middle_name = 'Мусаевич' AND birth_year = 1989), 11, 142, NULL, 77.8, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Сулейманов Мовсар Мусаевич', 'СШОР "Маршал"', 'Калужская область', 1001, 15),
  (1278, 1026, (SELECT id FROM athletes WHERE last_name = 'Остриков' AND first_name = 'Максим' AND middle_name = 'Витальевич' AND birth_year = 2005), 12, 140, NULL, 77.75, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Остриков Максим Витальевич', 'СШОР "Маршал"', 'Калужская область', 1001, 15),
  (1279, 1026, (SELECT id FROM athletes WHERE last_name = 'Порцев' AND first_name = 'Роман' AND middle_name = 'Геннадьевич' AND birth_year = 1987), 13, 130, NULL, 77.95, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Порцев Роман Геннадьевич', 'МАУ ДО СШ «Прикамье» г. Перми', 'Пермский край', 1001, 15),
  (1280, 1026, (SELECT id FROM athletes WHERE last_name = 'Богатов' AND first_name = 'Иван' AND middle_name = 'Сергеевич' AND birth_year = 2004), 14, 102, NULL, 75.2, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Богатов Иван Сергеевич', 'ВС', 'Республика Бурятия', 1001, 15),
  (1281, 1027, (SELECT id FROM athletes WHERE last_name = 'Плотников' AND first_name = 'Вячеслав' AND middle_name = 'Евгеньевич' AND birth_year = 1998), 1, 216, NULL, 81.25, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Плотников Вячеслав Евгеньевич', 'РО ООО ВФГС в Челябинской Области', 'Челябинская область', 1001, 14),
  (1282, 1027, (SELECT id FROM athletes WHERE last_name = 'Шиляев' AND first_name = 'Иван' AND middle_name = 'Николаевич' AND birth_year = 1996), 2, 210, NULL, 81.45, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Шиляев Иван Николаевич', 'АМУ спортивный клуб Надежда', 'Удмуртская Республика', 1001, 14),
  (1283, 1027, (SELECT id FROM athletes WHERE last_name = 'Черкашин' AND first_name = 'Дмитрий' AND middle_name = 'Андреевич' AND birth_year = 1999), 3, 209, NULL, 85.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Черкашин Дмитрий Андреевич', 'ОГАУ ДО СШОР', 'Томская область', 1001, 14),
  (1284, 1027, (SELECT id FROM athletes WHERE last_name = 'Рысник' AND first_name = 'Сергей' AND middle_name = 'Михайлович' AND birth_year = 1995), 4, 208, NULL, 84.35, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Рысник Сергей Михайлович', 'Армия России', 'Омская область', 1001, 14),
  (1285, 1027, (SELECT id FROM athletes WHERE last_name = 'Анасенко' AND first_name = 'Антон' AND middle_name = 'Владимирович' AND birth_year = 1979), 5, 188, NULL, 84.45, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Анасенко Антон Владимирович', 'ВС РФ', 'Омская область', 1001, 14),
  (1286, 1027, (SELECT id FROM athletes WHERE last_name = 'Крестьянинов' AND first_name = 'Виктор' AND middle_name = 'Александрович' AND birth_year = 2000), 6, 187, NULL, 84.25, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Крестьянинов Виктор Александрович', 'МАУ ДО СШ «Прикамье» г. Перми', 'Пермский край', 1001, 14),
  (1287, 1027, (SELECT id FROM athletes WHERE last_name = 'Малиновский' AND first_name = 'Семён' AND middle_name = 'Андреевич' AND birth_year = 1989), 7, 171, NULL, 82.95, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Малиновский Семён Андреевич', '-', 'Ленинградская область', 1001, 14),
  (1288, 1027, (SELECT id FROM athletes WHERE last_name = 'Ветров' AND first_name = 'Денис' AND middle_name = 'Сергеевич' AND birth_year = 1989), 8, 158, NULL, 84.2, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Ветров Денис Сергеевич', '-', 'г. Москва', 1001, 14),
  (1289, 1027, (SELECT id FROM athletes WHERE last_name = 'Сисейкин' AND first_name = 'Максим' AND middle_name = 'Сергеевич' AND birth_year = 1993), 9, 157, NULL, 84.6, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Сисейкин Максим Сергеевич', '-', 'Владимирская область', 1001, 14),
  (1290, 1027, (SELECT id FROM athletes WHERE last_name = 'Маликов' AND first_name = 'Данил' AND middle_name = 'Дамирович' AND birth_year = 2001), 10, 110, NULL, 84.55, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Маликов Данил Дамирович', 'МАУ ДО СШ «Прикамье» г. Перми', 'Пермский край', 1001, 14),
  (1291, 1028, (SELECT id FROM athletes WHERE last_name = 'Кирюхин' AND first_name = 'Роман' AND middle_name = 'Александрович' AND birth_year = 1997), 1, 207, NULL, 86.85, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Кирюхин Роман Александрович', '-', 'г. Москва', 1001, 13),
  (1292, 1028, (SELECT id FROM athletes WHERE last_name = 'Поздеев' AND first_name = 'Андрей' AND middle_name = 'Николаевич' AND birth_year = 1990), 2, 201, NULL, 86.2, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Поздеев Андрей Николаевич', 'РО ООО "ВФГС" в Архангельской', 'Архангельская область', 1001, 13),
  (1293, 1028, (SELECT id FROM athletes WHERE last_name = 'Спесивцев' AND first_name = 'Даниила' AND middle_name = 'Владимирович' AND birth_year = 2003), 3, 197, NULL, 92.4, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Спесивцев Даниила Владимирович', 'СШОР 5 г Белгород', 'Белгородская область', 1001, 13),
  (1294, 1028, (SELECT id FROM athletes WHERE last_name = 'Спичкин' AND first_name = 'Алексей' AND middle_name = 'Евгеньевич' AND birth_year = 1994), 4, 195, NULL, 91.8, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Спичкин Алексей Евгеньевич', 'ВС', 'Новосибирская область', 1001, 13),
  (1295, 1028, (SELECT id FROM athletes WHERE last_name = 'Турищев' AND first_name = 'Дмитрий' AND middle_name = 'Владимирович' AND birth_year = 1992), 5, 195, NULL, 94.8, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Турищев Дмитрий Владимирович', 'ГБУ ДО МКСШОР «Запад» Отделение', 'г. Москва', 1001, 13),
  (1296, 1028, (SELECT id FROM athletes WHERE last_name = 'Булдаков' AND first_name = 'Никита' AND middle_name = 'Юрьевич' AND birth_year = 1997), 6, 186, NULL, 90.9, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Булдаков Никита Юрьевич', 'ВС', 'Удмуртская Республика', 1001, 13),
  (1297, 1028, (SELECT id FROM athletes WHERE last_name = 'Черкашин' AND first_name = 'Иван' AND middle_name = 'Андреевич' AND birth_year = 1999), 7, 177, NULL, 93.7, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Черкашин Иван Андреевич', 'ОГАУДО Томская областная СШОР', 'Томская область', 1001, 13),
  (1298, 1028, (SELECT id FROM athletes WHERE last_name = 'Давыдов' AND first_name = 'Антон' AND middle_name = 'Александрович' AND birth_year = 1982), 8, 166, NULL, 86.6, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Давыдов Антон Александрович', 'Спорт-ЛАЭС', 'Ленинградская область', 1001, 13),
  (1299, 1028, (SELECT id FROM athletes WHERE last_name = 'Николаев' AND first_name = 'Аркадий' AND middle_name = 'Анатольевич' AND birth_year = 2002), 9, 158, NULL, 89.45, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Николаев Аркадий Анатольевич', 'МБУ ДО СШОР «Югория» им. А.А.', 'Ханты-Мансийский АО - Югра', 1001, 13),
  (1300, 1028, (SELECT id FROM athletes WHERE last_name = 'Кравченко' AND first_name = 'Сергей' AND middle_name = 'Сергеевич' AND birth_year = 1982), 10, 140, NULL, 93.35, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Кравченко Сергей Сергеевич', 'МАУ ДО СШОР по силовым видам', 'Калининградская область', 1001, 13),
  (1301, 1028, (SELECT id FROM athletes WHERE last_name = 'Житихин' AND first_name = 'Владислав' AND middle_name = 'Николаевич' AND birth_year = 1994), 11, 139, NULL, 92.55, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Житихин Владислав Николаевич', 'ВС', 'Республика Бурятия', 1001, 13),
  (1302, 1028, (SELECT id FROM athletes WHERE last_name = 'Енедеров' AND first_name = 'Димитрий' AND middle_name = 'Николаевич' AND birth_year = 1984), 12, 127, NULL, 87.5, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Енедеров Димитрий Николаевич', 'СШ "Энергия"', 'Чувашская Республика', 1001, 13),
  (1303, 1028, (SELECT id FROM athletes WHERE last_name = 'Гулов' AND first_name = 'Фарход' AND middle_name = 'Абдурахмонович' AND birth_year = 1997), 13, 122, NULL, 91.25, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Гулов Фарход Абдурахмонович', 'Спорт школа " Олимп"', 'Челябинская область', 1001, 13),
  (1304, 1028, (SELECT id FROM athletes WHERE last_name = 'Кулаков' AND first_name = 'Иван' AND middle_name = 'Иванович' AND birth_year = 1998), 14, 101, NULL, 64.25, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1001, '2025-06-12', 'Кулаков Иван Иванович', 'СШОР "Маршал"', 'Калужская область', 1001, 13);

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
  (1067, 1067, 'long_cycle', 'both', 42),
  (1068, 1068, 'long_cycle', 'both', 96),
  (1069, 1069, 'long_cycle', 'both', 88),
  (1070, 1070, 'long_cycle', 'both', 85),
  (1071, 1071, 'long_cycle', 'both', 81),
  (1072, 1072, 'long_cycle', 'both', 74),
  (1073, 1073, 'long_cycle', 'both', 72),
  (1074, 1074, 'long_cycle', 'both', 72),
  (1075, 1075, 'long_cycle', 'both', 62),
  (1076, 1076, 'long_cycle', 'both', 60),
  (1077, 1077, 'long_cycle', 'both', 43),
  (1078, 1078, 'long_cycle', 'both', 40),
  (1079, 1079, 'long_cycle', 'both', 40),
  (1080, 1080, 'long_cycle', 'both', 35),
  (1081, 1081, 'long_cycle', 'both', 62),
  (1082, 1082, 'long_cycle', 'both', 54),
  (1083, 1083, 'long_cycle', 'both', 48),
  (1084, 1084, 'long_cycle', 'both', 28),
  (1085, 1085, 'long_cycle', 'both', 26),
  (1086, 1086, 'long_cycle', 'both', 25),
  (1087, 1087, 'long_cycle', 'both', 24),
  (1088, 1088, 'long_cycle', 'both', 20),
  (1089, 1089, 'long_cycle', 'both', 19),
  (1090, 1090, 'long_cycle', 'both', 0),
  (1091, 1091, 'long_cycle', 'both', 71),
  (1092, 1092, 'long_cycle', 'both', 49),
  (1093, 1093, 'long_cycle', 'both', 46),
  (1094, 1094, 'long_cycle', 'both', 44),
  (1095, 1095, 'long_cycle', 'both', 43),
  (1096, 1096, 'long_cycle', 'both', 39),
  (1097, 1097, 'long_cycle', 'both', 37),
  (1098, 1098, 'long_cycle', 'both', 32),
  (1099, 1099, 'long_cycle', 'both', 29),
  (1100, 1100, 'long_cycle', 'both', 68),
  (1101, 1101, 'long_cycle', 'both', 62),
  (1102, 1102, 'long_cycle', 'both', 60),
  (1103, 1103, 'long_cycle', 'both', 52),
  (1104, 1104, 'long_cycle', 'both', 41),
  (1105, 1105, 'long_cycle', 'both', 30),
  (1106, 1106, 'long_cycle', 'both', 28),
  (1107, 1107, 'long_cycle', 'both', 20),
  (1108, 1108, 'long_cycle', 'both', 85),
  (1109, 1109, 'long_cycle', 'both', 58),
  (1110, 1110, 'long_cycle', 'both', 37),
  (1111, 1111, 'long_cycle', 'both', 15),
  (1112, 1112, 'long_cycle', 'both', 12),
  (1113, 1113, 'long_cycle', 'both', 11),
  (1114, 1114, 'jerk', 'both', 139),
  (1115, 1115, 'jerk', 'both', 134),
  (1116, 1116, 'jerk', 'both', 105),
  (1117, 1117, 'jerk', 'both', 96),
  (1118, 1118, 'jerk', 'both', 86),
  (1119, 1119, 'jerk', 'both', 86),
  (1120, 1120, 'jerk', 'both', 75),
  (1121, 1121, 'jerk', 'both', 68),
  (1122, 1122, 'jerk', 'both', 50),
  (1123, 1123, 'jerk', 'both', 40),
  (1124, 1124, 'jerk', 'both', 23),
  (1125, 1125, 'jerk', 'both', 141),
  (1126, 1126, 'jerk', 'both', 131),
  (1127, 1127, 'jerk', 'both', 114),
  (1128, 1128, 'jerk', 'both', 104),
  (1129, 1129, 'jerk', 'both', 86),
  (1130, 1130, 'jerk', 'both', 84),
  (1131, 1131, 'jerk', 'both', 81),
  (1132, 1132, 'jerk', 'both', 70),
  (1133, 1133, 'jerk', 'both', 63),
  (1134, 1134, 'jerk', 'both', 60),
  (1135, 1135, 'jerk', 'both', 55),
  (1136, 1136, 'jerk', 'both', 53),
  (1137, 1137, 'jerk', 'both', 52),
  (1138, 1138, 'jerk', 'both', 40),
  (1139, 1139, 'jerk', 'both', 137),
  (1140, 1140, 'jerk', 'both', 136),
  (1141, 1141, 'jerk', 'both', 114),
  (1142, 1142, 'jerk', 'both', 113),
  (1143, 1143, 'jerk', 'both', 113),
  (1144, 1144, 'jerk', 'both', 108),
  (1145, 1145, 'jerk', 'both', 107),
  (1146, 1146, 'jerk', 'both', 91),
  (1147, 1147, 'jerk', 'both', 83),
  (1148, 1148, 'jerk', 'both', 65),
  (1149, 1149, 'jerk', 'both', 45),
  (1150, 1150, 'jerk', 'both', 143),
  (1151, 1151, 'jerk', 'both', 141),
  (1152, 1152, 'jerk', 'both', 138),
  (1153, 1153, 'jerk', 'both', 131),
  (1154, 1154, 'jerk', 'both', 129),
  (1155, 1155, 'jerk', 'both', 122),
  (1156, 1156, 'jerk', 'both', 115),
  (1157, 1157, 'jerk', 'both', 112),
  (1158, 1158, 'jerk', 'both', 97),
  (1159, 1159, 'jerk', 'both', 52),
  (1160, 1160, 'jerk', 'both', 46),
  (1161, 1161, 'jerk', 'both', 156),
  (1162, 1162, 'jerk', 'both', 152),
  (1163, 1163, 'jerk', 'both', 140),
  (1164, 1164, 'jerk', 'both', 133),
  (1165, 1165, 'jerk', 'both', 130),
  (1166, 1166, 'jerk', 'both', 117),
  (1167, 1167, 'jerk', 'both', 112),
  (1168, 1168, 'jerk', 'both', 111),
  (1169, 1169, 'jerk', 'both', 100),
  (1170, 1170, 'jerk', 'both', 95),
  (1171, 1171, 'jerk', 'both', 94),
  (1172, 1172, 'jerk', 'both', 86),
  (1173, 1173, 'jerk', 'both', 50),
  (1174, 1174, 'jerk', 'both', 160),
  (1175, 1175, 'jerk', 'both', 158),
  (1176, 1176, 'jerk', 'both', 151),
  (1177, 1177, 'jerk', 'both', 145),
  (1178, 1178, 'jerk', 'both', 123),
  (1179, 1179, 'jerk', 'both', 121),
  (1180, 1180, 'jerk', 'both', 113),
  (1181, 1181, 'jerk', 'both', 107),
  (1182, 1182, 'jerk', 'both', 103),
  (1183, 1183, 'jerk', 'both', 102),
  (1184, 1184, 'jerk', 'both', 96),
  (1185, 1185, 'jerk', 'both', 94),
  (1186, 1186, 'jerk', 'both', 67),
  (1187, 1187, 'jerk', 'both', 171),
  (1188, 1188, 'jerk', 'both', 134),
  (1189, 1189, 'jerk', 'both', 131),
  (1190, 1190, 'jerk', 'both', 128),
  (1191, 1191, 'jerk', 'both', 125),
  (1192, 1192, 'jerk', 'both', 111),
  (1193, 1193, 'jerk', 'both', 90),
  (1194, 1194, 'jerk', 'both', 85),
  (1195, 1195, 'jerk', 'both', 83),
  (1196, 1196, 'jerk', 'both', 63),
  (1197, 1197, 'jerk', 'both', 56),
  (1198, 1198, 'jerk', 'both', 55),
  (1199, 1199, 'jerk', 'both', 85),
  (1200, 1200, 'jerk', 'both', 79),
  (1201, 1201, 'jerk', 'both', 57),
  (1202, 1202, 'jerk', 'both', 27),
  (1203, 1203, 'jerk', 'both', 24),
  (1204, 1204, 'jerk', 'both', 23),
  (1205, 1205, 'jerk', 'both', 23),
  (1206, 1206, 'jerk', 'both', 21),
  (1207, 1207, 'jerk', 'both', 5),
  (1208, 1209, 'jerk', 'both', 102),
  (1209, 1210, 'jerk', 'both', 65),
  (1210, 1211, 'jerk', 'both', 54),
  (1211, 1212, 'jerk', 'both', 49),
  (1212, 1213, 'jerk', 'both', 49),
  (1213, 1214, 'jerk', 'both', 43),
  (1214, 1215, 'jerk', 'both', 38),
  (1215, 1216, 'jerk', 'both', 20),
  (1216, 1217, 'jerk', 'both', 71),
  (1217, 1218, 'jerk', 'both', 68),
  (1218, 1219, 'jerk', 'both', 62),
  (1219, 1220, 'jerk', 'both', 49),
  (1220, 1221, 'jerk', 'both', 28),
  (1221, 1222, 'jerk', 'both', 20),
  (1222, 1223, 'jerk', 'both', 15),
  (1223, 1224, 'jerk', 'both', 80),
  (1224, 1225, 'jerk', 'both', 57),
  (1225, 1226, 'jerk', 'both', 56),
  (1226, 1227, 'jerk', 'both', 45),
  (1227, 1228, 'jerk', 'both', 30),
  (1228, 1229, 'jerk', 'both', 26),
  (1229, 1230, 'jerk', 'both', 25),
  (1230, 1231, 'snatch', 'both', 196),
  (1231, 1232, 'snatch', 'both', 193),
  (1232, 1233, 'snatch', 'both', 185),
  (1233, 1234, 'snatch', 'both', 179),
  (1234, 1235, 'snatch', 'both', 152),
  (1235, 1236, 'snatch', 'both', 145),
  (1236, 1237, 'snatch', 'both', 110),
  (1237, 1238, 'snatch', 'both', 108),
  (1238, 1239, 'snatch', 'both', 94),
  (1239, 1240, 'snatch', 'both', 82),
  (1240, 1241, 'snatch', 'both', 27),
  (1241, 1242, 'snatch', 'both', 202),
  (1242, 1243, 'snatch', 'both', 198),
  (1243, 1244, 'snatch', 'both', 197),
  (1244, 1245, 'snatch', 'both', 194),
  (1245, 1246, 'snatch', 'both', 187),
  (1246, 1247, 'snatch', 'both', 134),
  (1247, 1248, 'snatch', 'both', 130),
  (1248, 1249, 'snatch', 'both', 119),
  (1249, 1250, 'snatch', 'both', 111),
  (1250, 1251, 'snatch', 'both', 105),
  (1251, 1252, 'snatch', 'both', 85),
  (1252, 1253, 'snatch', 'both', 204),
  (1253, 1254, 'snatch', 'both', 185),
  (1254, 1255, 'snatch', 'both', 184),
  (1255, 1256, 'snatch', 'both', 180),
  (1256, 1257, 'snatch', 'both', 178),
  (1257, 1258, 'snatch', 'both', 166),
  (1258, 1259, 'snatch', 'both', 165),
  (1259, 1260, 'snatch', 'both', 157),
  (1260, 1261, 'snatch', 'both', 152),
  (1261, 1262, 'snatch', 'both', 143),
  (1262, 1263, 'snatch', 'both', 122),
  (1263, 1264, 'snatch', 'both', 112),
  (1264, 1265, 'snatch', 'both', 112),
  (1265, 1266, 'snatch', 'both', 85),
  (1266, 1267, 'snatch', 'both', 204),
  (1267, 1268, 'snatch', 'both', 199),
  (1268, 1269, 'snatch', 'both', 185),
  (1269, 1270, 'snatch', 'both', 181),
  (1270, 1271, 'snatch', 'both', 178),
  (1271, 1272, 'snatch', 'both', 178),
  (1272, 1273, 'snatch', 'both', 178),
  (1273, 1274, 'snatch', 'both', 171),
  (1274, 1275, 'snatch', 'both', 171),
  (1275, 1276, 'snatch', 'both', 165),
  (1276, 1277, 'snatch', 'both', 142),
  (1277, 1278, 'snatch', 'both', 140),
  (1278, 1279, 'snatch', 'both', 130),
  (1279, 1280, 'snatch', 'both', 102),
  (1280, 1281, 'snatch', 'both', 216),
  (1281, 1282, 'snatch', 'both', 210),
  (1282, 1283, 'snatch', 'both', 209),
  (1283, 1284, 'snatch', 'both', 208),
  (1284, 1285, 'snatch', 'both', 188),
  (1285, 1286, 'snatch', 'both', 187),
  (1286, 1287, 'snatch', 'both', 171),
  (1287, 1288, 'snatch', 'both', 158),
  (1288, 1289, 'snatch', 'both', 157),
  (1289, 1290, 'snatch', 'both', 110),
  (1290, 1291, 'snatch', 'both', 207),
  (1291, 1292, 'snatch', 'both', 201),
  (1292, 1293, 'snatch', 'both', 197),
  (1293, 1294, 'snatch', 'both', 195),
  (1294, 1295, 'snatch', 'both', 195),
  (1295, 1296, 'snatch', 'both', 186),
  (1296, 1297, 'snatch', 'both', 177),
  (1297, 1298, 'snatch', 'both', 166),
  (1298, 1299, 'snatch', 'both', 158),
  (1299, 1300, 'snatch', 'both', 140),
  (1300, 1301, 'snatch', 'both', 139),
  (1301, 1302, 'snatch', 'both', 127),
  (1302, 1303, 'snatch', 'both', 122),
  (1303, 1304, 'snatch', 'both', 101);

