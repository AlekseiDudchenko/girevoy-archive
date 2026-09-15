-- Чемпионат России 2026, Новосибирск, 2026-06-02—2026-06-06.
-- Сгенерировано scripts/gen_seed.py из data/chempionat-rossii-2026.json, не править руками.
-- Оцифрованы длинный цикл (толчок ДЦ), страницы 2-16, а также толчок (мужчины) в весовых категориях 63, 68, 73, 78, 85, 95 и 95+ кг, толчок (женщины) в весовых категориях 58, 63, 68 и 68+ кг, рывок (мужчины) 63, 68, 73, 78, 85, 95 и 95+ кг и рывок (женщины) 58, 63, 68 и 68+ кг — всё с отдельных страниц, номера которых в документе неизвестны. Рывок оцифрован полностью. Остальные разделы протокола (жонглирование, командный зачёт) не извлекались.
-- Данные извлечены из скана протокола моделью; сверка человеком не проводилась,
-- поэтому results.verified_by остаётся пустым (FR-A14).

INSERT OR IGNORE INTO regions (name, country) VALUES
  ('Новосибирская область', 'RU'),
  ('Пермский край', 'RU'),
  ('Республика Бурятия', 'RU'),
  ('г. Санкт-Петербург', 'RU'),
  ('Калужская область', 'RU'),
  ('Ханты-Мансийский АО - Югра', 'RU'),
  ('Омская область', 'RU'),
  ('Томская область', 'RU'),
  ('г. Москва', 'RU'),
  ('Белгородская область', 'RU'),
  ('Кировская область', 'RU'),
  ('Челябинская область', 'RU'),
  ('Республика Саха (Якутия)', 'RU'),
  ('Республика Хакасия', 'RU'),
  ('Республика Татарстан', 'RU'),
  ('Ямало-Ненецкий автономный округ', 'RU'),
  ('Курганская область', 'RU'),
  ('Алтайский край', 'RU'),
  ('Оренбургская область', 'RU'),
  ('Вологодская область', 'RU'),
  ('Смоленская область', 'RU'),
  ('Ярославская область', 'RU'),
  ('Кемеровская область', 'RU'),
  ('Воронежская область', 'RU'),
  ('Брянская область', 'RU'),
  ('Архангельская область', 'RU'),
  ('Тюменская область', 'RU'),
  ('Республика Башкортостан', 'RU'),
  ('Чувашская Республика', 'RU'),
  ('Самарская область', 'RU'),
  ('Московская область', 'RU'),
  ('Калининградская область', 'RU'),
  ('Краснодарский край', 'RU'),
  ('Ивановская область', 'RU'),
  ('Мурманская область', 'RU'),
  ('Астраханская область', 'RU'),
  ('Забайкальский край', 'RU'),
  ('Ленинградская область', 'RU'),
  ('Красноярский край', 'RU'),
  ('Ставропольский край', 'RU'),
  ('Свердловская область', 'RU'),
  ('Владимирская область', 'RU');

INSERT OR IGNORE INTO clubs (name, region_id) VALUES
  ('ГАУ НСО «РЦСП СК и СР»', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')),
  ('МАУ ДО «СШ «Прикамье» г. Перми', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')),
  ('ВС РФ', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')),
  ('РОО ФГС г. САНКТ ПЕТЕРБУРГ', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')),
  ('МБУ ДО «Онохойская СШ»', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')),
  ('СДСШОР им. Краевского', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')),
  ('СШОР «Маршал»', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')),
  ('МБУ ДО СШОР «Югория» им. А.А. Пилояна', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')),
  ('МУ ДО «МЦРФКиС» Черепановского района', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')),
  ('РЦСП', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')),
  ('СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')),
  ('МАУ ДО «СШ №2» Сургутского района', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')),
  ('Спортивная школа №1 в Асино', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')),
  ('МБУ ДО «ДЮСШ «Спарт»', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')),
  ('РО ООО ВФГС в г. Москве', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')),
  ('РО ООО "ВФГС" в г. Москве', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')),
  ('МБУ ДО СШОР 5 г Белгород', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')),
  ('СШОР Маршал', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')),
  ('КОГАУ "СШОР "Юность"', (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU')),
  ('РО ООО «ВФГС» в Челябинской области', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')),
  ('Республиканский центр национальных видов спорта', (SELECT id FROM regions WHERE name = 'Республика Саха (Якутия)' AND country = 'RU')),
  ('Спортивная школа г. Черногорск', (SELECT id FROM regions WHERE name = 'Республика Хакасия' AND country = 'RU')),
  ('НГТУ', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')),
  ('"УСЗ Импульс" г. Буинск', (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU')),
  ('ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')),
  ('МБУ ДО СШ «Зенит»', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')),
  ('МБУДО "Варгашинская СШ"', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')),
  ('СШОРСВС им В.Ф. Краевского', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')),
  ('ВС РФ', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')),
  ('МБУДО "Каргапольская ДЮСШ"', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')),
  ('МУ ДО "МЦРФКиС" Черепановского района', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')),
  ('МАУ «РУСС»', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')),
  ('РО ООО "ВФГС" в Новосибирской области', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')),
  ('СШОР Кристалл', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')),
  ('Олимп', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')),
  ('Федерация гиревого спорта Алтайского Края', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')),
  ('ЦСП Омской области', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')),
  ('СШ №1 им. Л.Д. Ковалевского', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')),
  ('БУ ДО города Омска «СШОР №33»', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')),
  ('ФГС КО', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')),
  ('СШОР', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')),
  ('ВС РФ', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')),
  ('СШОР №3, г. Череповец', (SELECT id FROM regions WHERE name = 'Вологодская область' AND country = 'RU')),
  ('ГБУ ДО МКСШОР «Запад», отделение «Семёрка»', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')),
  ('КШС 1', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')),
  ('ФГС ЯО', (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU')),
  ('ДЮСШ Краснозерского района', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')),
  ('МБУ ДО СШ №3, г. Улан-Удэ', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')),
  ('КШС 1/ СГУС', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')),
  ('МАУ ДО "КСШ КМО"', (SELECT id FROM regions WHERE name = 'Кемеровская область' AND country = 'RU')),
  ('КОГАУ "СШОР "Юность "', (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU')),
  ('РО ООО «ВФГС» в г. Москве', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')),
  ('ДОО(П)Ц "Юниор"', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')),
  ('МКУ ДО "Бобровская СШ имени В.Л. Паткина"', (SELECT id FROM regions WHERE name = 'Воронежская область' AND country = 'RU')),
  ('Федерация гиревого спорта Томской области', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')),
  ('МБУ ДО СШОР по борьбе', (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU')),
  ('САФУ Арктика', (SELECT id FROM regions WHERE name = 'Архангельская область' AND country = 'RU')),
  ('ТРО ООО «ВФГС»', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')),
  ('РО ООО «ВФГС» в Омской области', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')),
  ('ССК «КИТ на спорте"', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')),
  ('КОГАУ «СШОР «Юность»', (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU')),
  ('МАУ ДО «Спортивная школа»', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')),
  ('спортивный клуб "АГАУ"', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')),
  ('МАУ ДО СШОР', (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU')),
  ('РО ООО ВФГС в Челябинской области', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')),
  ('ВС РФ', (SELECT id FROM regions WHERE name = 'Воронежская область' AND country = 'RU')),
  ('ФСК "Улап", СШ Энергия', (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU')),
  ('ДЮСШ Кулундинского района', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')),
  ('РО ООО "ВФГС" СО', (SELECT id FROM regions WHERE name = 'Самарская область' AND country = 'RU')),
  ('БУ ДО города Омска «СШОР N33»', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')),
  ('Спортивная школа г.Черногорск', (SELECT id FROM regions WHERE name = 'Республика Хакасия' AND country = 'RU')),
  ('Кулундинская Спортивная школа', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')),
  ('ДЮСШ Искитимский район', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')),
  ('ВС РФ', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')),
  ('МУ ДО СШ "Легион"', (SELECT id FROM regions WHERE name = 'Московская область' AND country = 'RU')),
  ('СШ Атлет', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')),
  ('МБУ ДО СШ №3 г.Улан-Удэ', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')),
  ('ТГПУ', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')),
  ('МБУ ДО СШОР "Олимп"', (SELECT id FROM regions WHERE name = 'Кемеровская область' AND country = 'RU')),
  ('МАУ ДОСШ Чемпион', (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU')),
  ('МАУ ДО СШОР', (SELECT id FROM regions WHERE name = 'Калининградская область' AND country = 'RU')),
  ('МУ ДО МЦРФКиС Черепановского района НСО', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')),
  ('МАУ ДО СШ Геолог', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')),
  ('БРОО ФГС', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')),
  ('ДЮСШ Красноозерского района', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')),
  ('СШ "Татнефть Олимп"', (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU')),
  ('Динамо', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')),
  ('СШОР "Краевского В.Ф."', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')),
  ('МБУДО "Лебяжьевская ДЮСШ"', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')),
  ('Центр «Поиск»', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')),
  ('РО ООО ВФГС в НСО', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')),
  ('ВС', (SELECT id FROM regions WHERE name = 'Краснодарский край' AND country = 'RU')),
  ('РООО "ВФГС" в Ивановской области', (SELECT id FROM regions WHERE name = 'Ивановская область' AND country = 'RU')),
  ('ССК «КИТ на спорте»', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')),
  ('—', (SELECT id FROM regions WHERE name = 'Мурманская область' AND country = 'RU')),
  ('МБОУ ДО Тогучская СШ', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')),
  ('СШ Энергия', (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU')),
  ('МКОУДО ЗАТО Знаменск СШ', (SELECT id FROM regions WHERE name = 'Астраханская область' AND country = 'RU')),
  ('Атлет', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')),
  ('Спортивный клуб ИВЕНГ', (SELECT id FROM regions WHERE name = 'Забайкальский край' AND country = 'RU')),
  ('РО ООО "ВФГС" в Кемеровской области', (SELECT id FROM regions WHERE name = 'Кемеровская область' AND country = 'RU')),
  ('ГазпромТрансГаз Югорск', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')),
  ('РОО ФГСЛО', (SELECT id FROM regions WHERE name = 'Ленинградская область' AND country = 'RU')),
  ('РО ООО "ВФГС" в Архангельской области', (SELECT id FROM regions WHERE name = 'Архангельская область' AND country = 'RU')),
  ('СШОРСВС ИМ. В.Ф. КРАЕВСКОГО', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')),
  ('Спорт-ЛАЭС', (SELECT id FROM regions WHERE name = 'Ленинградская область' AND country = 'RU')),
  ('МУ ДО МЦРФКиС Черепановского района', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')),
  ('КРСОО "Федерация гиревого спорта"', (SELECT id FROM regions WHERE name = 'Красноярский край' AND country = 'RU')),
  ('ДЮСШ', (SELECT id FROM regions WHERE name = 'Ставропольский край' AND country = 'RU')),
  ('ВС РФ', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')),
  ('СШ Энергия, ФСК "Улап"', (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU')),
  ('Федерация гиревого спорта Свердловской области', (SELECT id FROM regions WHERE name = 'Свердловская область' AND country = 'RU')),
  ('Федерация гиревого спорта во Владимирской области', (SELECT id FROM regions WHERE name = 'Владимирская область' AND country = 'RU')),
  ('МВД', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')),
  ('СПБ ГБУ ДО СШОРСВС им. В.Ф.Краевского', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')),
  ('КШС 1/ ВС', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')),
  ('Жура Александра Михайловна', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')),
  ('РО ООО "ВФГС" в Московской области', (SELECT id FROM regions WHERE name = 'Московская область' AND country = 'RU')),
  ('МБУ ДО СШОР г Губкин', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')),
  ('ТРО ООО ВФГС', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')),
  ('СШОР "Старт"', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')),
  ('СШОР им В.Ф.Краевского', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')),
  ('СШ «Татнефть-Олимп»', (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU')),
  ('Федерация гиревого спорта Республики Бурятия', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')),
  ('МАУ ДО ДЮЦ "Старт" города Тюмени', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')),
  ('СШОР силовых видов спорта имени В. Ф. Краевского', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')),
  ('МБУ ДО "ДЮСШ" Татарского МО', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')),
  ('ДЮСШ Искитимского района', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')),
  ('МАУ ДО Спортивная школа "ПОБЕДА"', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')),
  ('—', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU'));

INSERT OR IGNORE INTO federations (name, short_name, country) VALUES
  ('Всероссийская федерация гиревого спорта', 'ВФГС', 'RU');

INSERT INTO competitions (id, slug, name, date_start, date_end, city, country, competition_rank_id, federation_id, source_url, is_published) VALUES
  (1, 'chempionat-rossii-2026', 'Чемпионат России 2026', '2026-06-02', '2026-06-06', 'Новосибирск', 'RU', (SELECT id FROM competition_ranks WHERE code = 'national_ch'), (SELECT id FROM federations WHERE name = 'Всероссийская федерация гиревого спорта'), NULL, 1);

INSERT INTO protocols (id, competition_id, r2_key, filename, page_count, is_scan, status, published_at) VALUES
  (1, 1, 'protocols/chempionat-rossii-2026.pdf', 'Chempionat_Rossii_2026.pdf', 41, 1, 'published', '2026-06-02');

INSERT INTO categories (id, competition_id, discipline_id, sex, age_group_id, division_id, bell_kg, hands, time_limit_min, weight_class_raw, weight_class_kg, weight_class_is_open, participants_declared, is_deferred, sort_order) VALUES
  (1, 1, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '63', 63, 0, 9, 0, 1),
  (2, 1, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '68', 68, 0, 9, 0, 2),
  (3, 1, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '73', 73, 0, 11, 0, 3),
  (4, 1, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '78', 78, 0, 13, 0, 4),
  (5, 1, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '85', 85, 0, 10, 0, 5),
  (6, 1, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '95', 95, 0, 10, 0, 6),
  (7, 1, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '95+', 95, 1, 8, 0, 7),
  (8, 1, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '58', 58, 0, 8, 0, 8),
  (9, 1, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '63', 63, 0, 6, 0, 9),
  (10, 1, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '68', 68, 0, 7, 0, 10),
  (11, 1, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '68+', 68, 1, 9, 0, 11),
  (12, 1, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '63', 63, 0, 11, 0, 12),
  (13, 1, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '68', 68, 0, 11, 0, 13),
  (14, 1, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '73', 73, 0, 11, 0, 14),
  (15, 1, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '78', 78, 0, 10, 0, 15),
  (16, 1, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '85', 85, 0, 12, 0, 16),
  (17, 1, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '95', 95, 0, 12, 0, 17),
  (18, 1, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 10, '95+', 95, 1, 6, 0, 18),
  (19, 1, (SELECT id FROM disciplines WHERE code = 'jerk'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '58', 58, 0, 6, 0, 19),
  (20, 1, (SELECT id FROM disciplines WHERE code = 'jerk'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '63', 63, 0, 9, 0, 20),
  (21, 1, (SELECT id FROM disciplines WHERE code = 'jerk'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '68', 68, 0, 7, 0, 21),
  (22, 1, (SELECT id FROM disciplines WHERE code = 'jerk'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 10, '68+', 68, 1, 11, 0, 22),
  (23, 1, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '63', 63, 0, 10, 0, 23),
  (24, 1, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '68', 68, 0, 12, 0, 24),
  (25, 1, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '73', 73, 0, 16, 0, 25),
  (26, 1, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '78', 78, 0, 10, 0, 26),
  (27, 1, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '85', 85, 0, 14, 0, 27),
  (28, 1, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '95', 95, 0, 20, 0, 28),
  (29, 1, (SELECT id FROM disciplines WHERE code = 'snatch'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'one', 10, '95+', 95, 1, 13, 0, 29),
  (30, 1, (SELECT id FROM disciplines WHERE code = 'snatch'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'one', 10, '58', 58, 0, 15, 0, 30),
  (31, 1, (SELECT id FROM disciplines WHERE code = 'snatch'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'one', 10, '63', 63, 0, 6, 0, 31),
  (32, 1, (SELECT id FROM disciplines WHERE code = 'snatch'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'one', 10, '68', 68, 0, 16, 0, 32),
  (33, 1, (SELECT id FROM disciplines WHERE code = 'snatch'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'one', 10, '68+', 68, 1, 12, 0, 33),
  (34, 1, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 32, 'two', 12, 'эстафета (мужчины)', NULL, 0, NULL, 1, 124),
  (35, 1, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 'f', (SELECT id FROM age_groups WHERE code = 'adult'), NULL, 24, 'two', 12, 'эстафета (женщины)', NULL, 0, NULL, 1, 125);

-- Спортсмен заводится, только если его ещё нет: тот же человек на другом
-- турнире — та же строка athletes, иначе карточка и график разъедутся надвое.
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бутенко', 'Евгений', 'Александрович', 1995, 'm', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ГАУ НСО «РЦСП СК и СР»' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Бутенко А.А.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бутенко' AND a.first_name = 'Евгений' AND a.middle_name = 'Александрович' AND a.birth_year = 1995);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Сиразетдинов', 'Данил', 'Ильфатович', 2007, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО «СШ «Прикамье» г. Перми' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Мошев Д.И., Ческис О.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Сиразетдинов' AND a.first_name = 'Данил' AND a.middle_name = 'Ильфатович' AND a.birth_year = 2007);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Якушев', 'Роман', 'Владимирович', 2002, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС РФ' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Любимский С.А., Алексеев В.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Якушев' AND a.first_name = 'Роман' AND a.middle_name = 'Владимирович' AND a.birth_year = 2002);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Руднев', 'Руслан', 'Сергеевич', 1994, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РОО ФГС г. САНКТ ПЕТЕРБУРГ' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Руднев С.Л.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Руднев' AND a.first_name = 'Руслан' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1994);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Недорезов', 'Василий', 'Сергеевич', 1992, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО «Онохойская СШ»' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Рассадин А.А., Леонов С.Т.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Недорезов' AND a.first_name = 'Василий' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1992);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Жбанов', 'Алексей', 'Александрович', 1986, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СДСШОР им. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Барков А.П.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Жбанов' AND a.first_name = 'Алексей' AND a.middle_name = 'Александрович' AND a.birth_year = 1986);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кормилицын', 'Иван', 'Николаевич', 2010, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР «Маршал»' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Пянко И.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кормилицын' AND a.first_name = 'Иван' AND a.middle_name = 'Николаевич' AND a.birth_year = 2010);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Жалов', 'Ярослав', 'Борисович', 2007, 'm', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР «Югория» им. А.А. Пилояна' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Шпартко М.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Жалов' AND a.first_name = 'Ярослав' AND a.middle_name = 'Борисович' AND a.birth_year = 2007);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Филатов', 'Алексей', 'Александрович', 2008, 'm', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МУ ДО «МЦРФКиС» Черепановского района' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Бутенко И.А.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Филатов' AND a.first_name = 'Алексей' AND a.middle_name = 'Александрович' AND a.birth_year = 2008);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Морозович', 'Владислав', 'Павлович', 1999, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РЦСП' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Сагандыков К.К.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Морозович' AND a.first_name = 'Владислав' AND a.middle_name = 'Павлович' AND a.birth_year = 1999);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Рыжков', 'Антон', 'Николаевич', 1994, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Талибов А.Х.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Рыжков' AND a.first_name = 'Антон' AND a.middle_name = 'Николаевич' AND a.birth_year = 1994);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Захаров', 'Кирилл', 'Дмитриевич', 2007, 'm', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МУ ДО «МЦРФКиС» Черепановского района' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Бутенко И.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Захаров' AND a.first_name = 'Кирилл' AND a.middle_name = 'Дмитриевич' AND a.birth_year = 2007);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Коломин', 'Дмитрий', 'Андреевич', 1999, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО «Онохойская СШ»' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Рассадин А.А., Хлебодаров А.Г., Леонов С.Т.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Коломин' AND a.first_name = 'Дмитрий' AND a.middle_name = 'Андреевич' AND a.birth_year = 1999);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Хамидов', 'Фахриддин', 'Фарход угли', 2002, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР «Маршал»' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Барбакова Н.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Хамидов' AND a.first_name = 'Фахриддин' AND a.middle_name = 'Фарход угли' AND a.birth_year = 2002);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Сергеев', 'Алексей', 'Вячеславович', 2001, 'm', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО «СШ №2» Сургутского района' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Трофимова А.А, Садыков Р.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Сергеев' AND a.first_name = 'Алексей' AND a.middle_name = 'Вячеславович' AND a.birth_year = 2001);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Рыбский', 'Павел', 'Сергеевич', 2008, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Спортивная школа №1 в Асино' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Бажин А.М.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Рыбский' AND a.first_name = 'Павел' AND a.middle_name = 'Сергеевич' AND a.birth_year = 2008);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Мелюхин', 'Кирилл', 'Александрович', 2011, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО «ДЮСШ «Спарт»' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Маматов Г.Т.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Мелюхин' AND a.first_name = 'Кирилл' AND a.middle_name = 'Александрович' AND a.birth_year = 2011);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Сидоренков', 'Александр', 'Александрович', 2010, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО ВФГС в г. Москве' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Соловьев А.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Сидоренков' AND a.first_name = 'Александр' AND a.middle_name = 'Александрович' AND a.birth_year = 2010);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Беляев', 'Иван', 'Сергеевич', 1992, 'm', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР «Югория» им. А.А. Пилояна' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Шпартко М.А., Власов А.П., Меркулин С.В.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Беляев' AND a.first_name = 'Иван' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1992);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Рябков', 'Алексей', 'Игоревич', 1993, 'm', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР «Югория» им. А.А. Пилояна' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Шпартко М.А., Алтухов Д.В.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Рябков' AND a.first_name = 'Алексей' AND a.middle_name = 'Игоревич' AND a.birth_year = 1993);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Багров', 'Максим', 'Дмитриевич', 2009, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО "ВФГС" в г. Москве' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Соловьёв А.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Багров' AND a.first_name = 'Максим' AND a.middle_name = 'Дмитриевич' AND a.birth_year = 2009);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Фомин', 'Фёдор', 'Алексеевич', 2004, 'm', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР 5 г Белгород' AND region_id = (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')), 'Меркулин С.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Фомин' AND a.first_name = 'Фёдор' AND a.middle_name = 'Алексеевич' AND a.birth_year = 2004);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Трофимов', 'Тимур', 'Михайлович', 2011, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР Маршал' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Пянко И.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Трофимов' AND a.first_name = 'Тимур' AND a.middle_name = 'Михайлович' AND a.birth_year = 2011);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Новоселов', 'Андрей', 'Евгеньевич', 2004, 'm', (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КОГАУ "СШОР "Юность"' AND region_id = (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU')), 'Малков Е.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Новоселов' AND a.first_name = 'Андрей' AND a.middle_name = 'Евгеньевич' AND a.birth_year = 2004);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Семенов', 'Никита', 'Андреевич', 1993, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО «ВФГС» в Челябинской области' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Симушин А.М.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Семенов' AND a.first_name = 'Никита' AND a.middle_name = 'Андреевич' AND a.birth_year = 1993);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Рожин', 'Егор', 'Иннокентьевич', 1987, 'm', (SELECT id FROM regions WHERE name = 'Республика Саха (Якутия)' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Республиканский центр национальных видов спорта' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Саха (Якутия)' AND country = 'RU')), 'Кардашевский Н.С.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Рожин' AND a.first_name = 'Егор' AND a.middle_name = 'Иннокентьевич' AND a.birth_year = 1987);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Жибинов', 'Фёдор', 'Васильевич', 2004, 'm', (SELECT id FROM regions WHERE name = 'Республика Хакасия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Спортивная школа г. Черногорск' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Хакасия' AND country = 'RU')), 'Жибинов К.В., Жибинов В.В.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Жибинов' AND a.first_name = 'Фёдор' AND a.middle_name = 'Васильевич' AND a.birth_year = 2004);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Колоколов', 'Никита', 'Александрович', 2007, 'm', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'НГТУ' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Филимонов М.О., Блохин И.А.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Колоколов' AND a.first_name = 'Никита' AND a.middle_name = 'Александрович' AND a.birth_year = 2007);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Захаров', 'Максим', 'Александрович', 2008, 'm', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МУ ДО «МЦРФКиС» Черепановского района' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Бутенко И.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Захаров' AND a.first_name = 'Максим' AND a.middle_name = 'Александрович' AND a.birth_year = 2008);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ляукин', 'Кирилл', 'Сергеевич', 1999, 'm', (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '"УСЗ Импульс" г. Буинск' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU')), 'Трофимов М.А., Низамова А.А., Турищев Д.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ляукин' AND a.first_name = 'Кирилл' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1999);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Каргин', 'Сергей', 'Ярославович', 1998, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО «Онохойская СШ»' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Рассадин А.А., Каргин Я.Л., Леонов С.Т.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Каргин' AND a.first_name = 'Сергей' AND a.middle_name = 'Ярославович' AND a.birth_year = 1998);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Астахов', 'Евгений', 'Михайлович', 2002, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Ландин А.Ю., Турищев Д.В., Ромашин Ю.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Астахов' AND a.first_name = 'Евгений' AND a.middle_name = 'Михайлович' AND a.birth_year = 2002);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Сарсембаев', 'Ильяс', 'Асхатович', 1999, 'm', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ «Зенит»' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Латыпов Е.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Сарсембаев' AND a.first_name = 'Ильяс' AND a.middle_name = 'Асхатович' AND a.birth_year = 1999);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Порцев', 'Роман', 'Геннадьевич', 1987, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО «СШ «Прикамье» г. Перми' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Мошев Д.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Порцев' AND a.first_name = 'Роман' AND a.middle_name = 'Геннадьевич' AND a.birth_year = 1987);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Любимский', 'Сергей', 'Александрович', 1992, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС РФ' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Трофимов М.А., Леонов С.Т., Блохин И.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Любимский' AND a.first_name = 'Сергей' AND a.middle_name = 'Александрович' AND a.birth_year = 1992);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Дубель', 'Алексей', 'Викторович', 1990, 'm', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУДО "Варгашинская СШ"' AND region_id = (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')), 'Стрекаловских С.К.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Дубель' AND a.first_name = 'Алексей' AND a.middle_name = 'Викторович' AND a.birth_year = 1990);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Молчанов', 'Дианисий', 'Николаевич', 2005, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОРСВС им В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Катаев И.В., Бирюков С.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Молчанов' AND a.first_name = 'Дианисий' AND a.middle_name = 'Николаевич' AND a.birth_year = 2005);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Филиппов', 'Евгений', 'Борисович', 1995, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС РФ' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Анасенко А.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Филиппов' AND a.first_name = 'Евгений' AND a.middle_name = 'Борисович' AND a.birth_year = 1995);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Баландин', 'Андрей', 'Александрович', 1996, 'm', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУДО "Каргапольская ДЮСШ"' AND region_id = (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')), 'Стрекаловских С.К.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Баландин' AND a.first_name = 'Андрей' AND a.middle_name = 'Александрович' AND a.birth_year = 1996);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Пеньков', 'Ян', 'Евгеньевич', 2010, 'm', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МУ ДО "МЦРФКиС" Черепановского района' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Бутенко А.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Пеньков' AND a.first_name = 'Ян' AND a.middle_name = 'Евгеньевич' AND a.birth_year = 2010);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Согоян', 'Артём', 'Ражденович', 1988, 'm', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ «РУСС»' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Петров В.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Согоян' AND a.first_name = 'Артём' AND a.middle_name = 'Ражденович' AND a.birth_year = 1988);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Иванов', 'Виталий', 'Викторович', 1978, 'm', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР «Югория» им. А.А. Пилояна' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Шпартко М.А., Шульга Н.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Иванов' AND a.first_name = 'Виталий' AND a.middle_name = 'Викторович' AND a.birth_year = 1978);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бородынкин', 'Олег', 'Александрович', 2002, 'm', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО "ВФГС" в Новосибирской области' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Баер П.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бородынкин' AND a.first_name = 'Олег' AND a.middle_name = 'Александрович' AND a.birth_year = 2002);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Черкашин', 'Дмитрий', 'Андреевич', 1999, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР Кристалл' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Тимофеев Н.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Черкашин' AND a.first_name = 'Дмитрий' AND a.middle_name = 'Андреевич' AND a.birth_year = 1999);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Чуев', 'Павел', 'Владимирович', 1997, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Кириллов С.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Чуев' AND a.first_name = 'Павел' AND a.middle_name = 'Владимирович' AND a.birth_year = 1997);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Самочернов', 'Иван', 'Николаевич', 1998, 'm', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУДО "Каргапольская ДЮСШ"' AND region_id = (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')), 'Стрекаловских С.К.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Самочернов' AND a.first_name = 'Иван' AND a.middle_name = 'Николаевич' AND a.birth_year = 1998);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Селиверстов', 'Семен', 'Васильевич', 1989, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Олимп' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Нестеренко Д.В., Ташланов И.С.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Селиверстов' AND a.first_name = 'Семен' AND a.middle_name = 'Васильевич' AND a.birth_year = 1989);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Андрущенко', 'Сергей', 'Александрович', 2005, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Ландин А.Ю., Ермаков К.И., Турищев Д.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Андрущенко' AND a.first_name = 'Сергей' AND a.middle_name = 'Александрович' AND a.birth_year = 2005);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Полибин', 'Михаил', 'Леонидович', 2004, 'm', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Федерация гиревого спорта Алтайского Края' AND region_id = (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')), 'Белова Н.Ю.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Полибин' AND a.first_name = 'Михаил' AND a.middle_name = 'Леонидович' AND a.birth_year = 2004);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Минуллин', 'Марсель', 'Ринатович', 2000, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ЦСП Омской области' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Елисеев В.С., Гарифуллин Р.Ф., Лавринович Ю.Я.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Минуллин' AND a.first_name = 'Марсель' AND a.middle_name = 'Ринатович' AND a.birth_year = 2000);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Акульшин', 'Алексей', 'Сергеевич', 1994, 'm', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ №1 им. Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Лавринов В.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Акульшин' AND a.first_name = 'Алексей' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1994);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Рысник', 'Сергей', 'Михайлович', 1995, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'БУ ДО города Омска «СШОР №33»' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Елисеев В.С., Переверзев Н.И.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Рысник' AND a.first_name = 'Сергей' AND a.middle_name = 'Михайлович' AND a.birth_year = 1995);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кулаков', 'Иван', 'Иванович', 1998, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР «Маршал»' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Шматов И.Б., Трофимов М.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кулаков' AND a.first_name = 'Иван' AND a.middle_name = 'Иванович' AND a.birth_year = 1998);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кирюхин', 'Роман', 'Александрович', 1997, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ФГС КО' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Соловьев А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кирюхин' AND a.first_name = 'Роман' AND a.middle_name = 'Александрович' AND a.birth_year = 1997);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Николаев', 'Аркадий', 'Анатольевич', 2002, 'm', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР «Югория» им. А.А. Пилояна' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Шпартко М.А., Рябков А.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Николаев' AND a.first_name = 'Аркадий' AND a.middle_name = 'Анатольевич' AND a.birth_year = 2002);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Черкашин', 'Иван', 'Андреевич', 1999, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Тимофеев Н.А., Черкашин Д.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Черкашин' AND a.first_name = 'Иван' AND a.middle_name = 'Андреевич' AND a.birth_year = 1999);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Захаров', 'Андрей', 'Валентинович', 1993, 'm', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО "ВФГС" в Новосибирской области' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Петухов А.В., Бутенко А.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Захаров' AND a.first_name = 'Андрей' AND a.middle_name = 'Валентинович' AND a.birth_year = 1993);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кулик', 'Никита', 'Алексеевич', 2005, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Ландин А.Ю., Турищев Д.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кулик' AND a.first_name = 'Никита' AND a.middle_name = 'Алексеевич' AND a.birth_year = 2005);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Микряков', 'Михаил', 'Геннадьевич', 2007, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Катаев И.В., Федосеев А.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Микряков' AND a.first_name = 'Михаил' AND a.middle_name = 'Геннадьевич' AND a.birth_year = 2007);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Зуев', 'Илья', 'Александрович', 2007, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО «СШ «Прикамье» г. Перми' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Мошев Д.И., Ермаков И.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Зуев' AND a.first_name = 'Илья' AND a.middle_name = 'Александрович' AND a.birth_year = 2007);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ефремов', 'Сергей', 'Евгеньевич', 1997, 'm', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО "ВФГС" в Новосибирской области' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Бутенко А.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ефремов' AND a.first_name = 'Сергей' AND a.middle_name = 'Евгеньевич' AND a.birth_year = 1997);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Дашкевич', 'Владимир', 'Олегович', 1984, 'm', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ «РУСС»' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Петров В.А., Шульга Н.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Дашкевич' AND a.first_name = 'Владимир' AND a.middle_name = 'Олегович' AND a.birth_year = 1984);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Балабанов', 'Сергей', 'Андреевич', 1996, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС РФ' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Леонов С.Т., Гаденин А.Г., Трофимов М.А.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Балабанов' AND a.first_name = 'Сергей' AND a.middle_name = 'Андреевич' AND a.birth_year = 1996);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Шевелев', 'Дмитрий', 'Владимирович', 1989, 'm', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС РФ' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Рябченко А.В.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Шевелев' AND a.first_name = 'Дмитрий' AND a.middle_name = 'Владимирович' AND a.birth_year = 1989);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Лебедев', 'Дмитрий', 'Николаевич', 2008, 'm', (SELECT id FROM regions WHERE name = 'Вологодская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР №3, г. Череповец' AND region_id = (SELECT id FROM regions WHERE name = 'Вологодская область' AND country = 'RU')), 'Шемякин О.Л.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Лебедев' AND a.first_name = 'Дмитрий' AND a.middle_name = 'Николаевич' AND a.birth_year = 2008);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Симашкевич', 'Евгений', 'Валентинович', 1991, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС РФ' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Анасенко А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Симашкевич' AND a.first_name = 'Евгений' AND a.middle_name = 'Валентинович' AND a.birth_year = 1991);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Турищев', 'Дмитрий', 'Владимирович', 1992, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ГБУ ДО МКСШОР «Запад», отделение «Семёрка»' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Ландин А.Ю., Винтовкин Н.В., Дуюнов Е.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Турищев' AND a.first_name = 'Дмитрий' AND a.middle_name = 'Владимирович' AND a.birth_year = 1992);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Калистратов', 'Артем', 'Валерьевич', 1992, 'm', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КШС 1' AND region_id = (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')), 'Сергеев С.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Калистратов' AND a.first_name = 'Артем' AND a.middle_name = 'Валерьевич' AND a.birth_year = 1992);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Станкович', 'Боян', NULL, 1988, 'm', (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ФГС ЯО' AND region_id = (SELECT id FROM regions WHERE name = 'Ярославская область' AND country = 'RU')), 'Барков А.П., Егоров В.В.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Станкович' AND a.first_name = 'Боян' AND a.middle_name IS NULL AND a.birth_year = 1988);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Новиков', 'Александр', 'Алексеевич', 1992, 'm', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ДЮСШ Краснозерского района' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Исионов В.Н., Сологубов К.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Новиков' AND a.first_name = 'Александр' AND a.middle_name = 'Алексеевич' AND a.birth_year = 1992);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Трофимова', 'Милена', 'Михайловна', 2007, 'f', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР «Маршал»' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Пянко И.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Трофимова' AND a.first_name = 'Милена' AND a.middle_name = 'Михайловна' AND a.birth_year = 2007);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Прохорова', 'Ангелина', 'Вячеславовна', 2005, 'f', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МУ ДО "МЦРФКиС" Черепановского района' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Бутенко И.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Прохорова' AND a.first_name = 'Ангелина' AND a.middle_name = 'Вячеславовна' AND a.birth_year = 2005);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Васюкова', 'Регина', 'Александровна', 2010, 'f', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МУ ДО «МЦРФКиС» Черепановского района' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Бутенко И.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Васюкова' AND a.first_name = 'Регина' AND a.middle_name = 'Александровна' AND a.birth_year = 2010);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ныныч', 'Маргарита', 'Анатольевна', 1996, 'f', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ №3, г. Улан-Удэ' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Рассадин А.А., Трофимов М.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ныныч' AND a.first_name = 'Маргарита' AND a.middle_name = 'Анатольевна' AND a.birth_year = 1996);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кошурникова', 'Валерия', 'Александровна', 2012, 'f', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР «Югория» им. А.А. Пилояна' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Шпартко М.А.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кошурникова' AND a.first_name = 'Валерия' AND a.middle_name = 'Александровна' AND a.birth_year = 2012);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Чернова', 'Кира', 'Николаевна', 2009, 'f', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР «Маршал»' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Барбакова Н.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Чернова' AND a.first_name = 'Кира' AND a.middle_name = 'Николаевна' AND a.birth_year = 2009);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Шилихина', 'Дарья', 'Павловна', 2006, 'f', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КШС 1/ СГУС' AND region_id = (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')), 'Сергеев С.В., Бирюков С.Н., Иванов Е.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Шилихина' AND a.first_name = 'Дарья' AND a.middle_name = 'Павловна' AND a.birth_year = 2006);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Меденцева', 'Дарья', 'Александровна', 2004, 'f', (SELECT id FROM regions WHERE name = 'Кемеровская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО "КСШ КМО"' AND region_id = (SELECT id FROM regions WHERE name = 'Кемеровская область' AND country = 'RU')), 'Шляхова Д.П.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Меденцева' AND a.first_name = 'Дарья' AND a.middle_name = 'Александровна' AND a.birth_year = 2004);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Пивень', 'Александра', 'Максимовна', 2004, 'f', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР «Маршал»' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Пянко И.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Пивень' AND a.first_name = 'Александра' AND a.middle_name = 'Максимовна' AND a.birth_year = 2004);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Мартынова', 'Любовь', 'Владимировна', 2007, 'f', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Ландин А.Ю., Бирюков С.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Мартынова' AND a.first_name = 'Любовь' AND a.middle_name = 'Владимировна' AND a.birth_year = 2007);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Матвеева', 'Елена', 'Евгеньевна', 1974, 'f', (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КОГАУ "СШОР "Юность "' AND region_id = (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU')), 'Малков Е.И.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Матвеева' AND a.first_name = 'Елена' AND a.middle_name = 'Евгеньевна' AND a.birth_year = 1974);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Подольская', 'Анастасия', 'Владимировна', 2005, 'f', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО «ВФГС» в г. Москве' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Соловьев А.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Подольская' AND a.first_name = 'Анастасия' AND a.middle_name = 'Владимировна' AND a.birth_year = 2005);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Рындина', 'Владислава', 'Романовна', 2009, 'f', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ДОО(П)Ц "Юниор"' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Иванов Д.С.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Рындина' AND a.first_name = 'Владислава' AND a.middle_name = 'Романовна' AND a.birth_year = 2009);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Григорьева', 'Эмилия', 'Сергеевна', 2006, 'f', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ №3, г. Улан-Удэ' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Пивень А.М., Коломин Д.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Григорьева' AND a.first_name = 'Эмилия' AND a.middle_name = 'Сергеевна' AND a.birth_year = 2006);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Воропаева', 'Виктория', 'Витальевна', 2004, 'f', (SELECT id FROM regions WHERE name = 'Воронежская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МКУ ДО "Бобровская СШ имени В.Л. Паткина"' AND region_id = (SELECT id FROM regions WHERE name = 'Воронежская область' AND country = 'RU')), 'Сорокин Н.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Воропаева' AND a.first_name = 'Виктория' AND a.middle_name = 'Витальевна' AND a.birth_year = 2004);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кошурникова', 'Анастасия', 'Александровна', 2003, 'f', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР «Югория» им. А.А. Пилояна' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Шпартко М.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кошурникова' AND a.first_name = 'Анастасия' AND a.middle_name = 'Александровна' AND a.birth_year = 2003);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ермолина', 'Ирина', 'Евгеньевна', 2008, 'f', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Федерация гиревого спорта Томской области' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Бажин А.М.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ермолина' AND a.first_name = 'Ирина' AND a.middle_name = 'Евгеньевна' AND a.birth_year = 2008);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Альянова', 'Виктория', 'Евгеньевна', 2004, 'f', (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР по борьбе' AND region_id = (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU')), 'Гомонов В.Н., Лукьянчиков Ю.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Альянова' AND a.first_name = 'Виктория' AND a.middle_name = 'Евгеньевна' AND a.birth_year = 2004);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Забелинская', 'Дарья', 'Александровна', 2003, 'f', (SELECT id FROM regions WHERE name = 'Архангельская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'САФУ Арктика' AND region_id = (SELECT id FROM regions WHERE name = 'Архангельская область' AND country = 'RU')), 'Коршун А.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Забелинская' AND a.first_name = 'Дарья' AND a.middle_name = 'Александровна' AND a.birth_year = 2003);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ельчанинова', 'Вероника', 'Сергеевна', 2003, 'f', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'БУ ДО города Омска «СШОР №33»' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Елисеева Н.А., Сагандыков К.К.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ельчанинова' AND a.first_name = 'Вероника' AND a.middle_name = 'Сергеевна' AND a.birth_year = 2003);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Суменкова', 'Анастасия', 'Дмитриевна', 2009, 'f', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КШС 1' AND region_id = (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')), 'Власенкова Т.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Суменкова' AND a.first_name = 'Анастасия' AND a.middle_name = 'Дмитриевна' AND a.birth_year = 2009);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Мартынова', 'Ирина', 'Александровна', 1999, 'f', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР «Маршал»' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Трофимов М.А.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Мартынова' AND a.first_name = 'Ирина' AND a.middle_name = 'Александровна' AND a.birth_year = 1999);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Полякова', 'Полина', 'Сергеевна', 1999, 'f', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ТРО ООО «ВФГС»' AND region_id = (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')), 'Мартьянов А.В., Барков А.П., Садыков Р.И.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Полякова' AND a.first_name = 'Полина' AND a.middle_name = 'Сергеевна' AND a.birth_year = 1999);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Вяткина', 'Вера', 'Павловна', 1999, 'f', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО «ВФГС» в Омской области' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Сагандыков К.К.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Вяткина' AND a.first_name = 'Вера' AND a.middle_name = 'Павловна' AND a.birth_year = 1999);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Попова', 'Мария', 'Алексеевна', 2005, 'f', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ССК «КИТ на спорте"' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Паклин П.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Попова' AND a.first_name = 'Мария' AND a.middle_name = 'Алексеевна' AND a.birth_year = 2005);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Филимонова', 'Карина', 'Денисовна', 2006, 'f', (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КОГАУ «СШОР «Юность»' AND region_id = (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU')), 'Малков Е.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Филимонова' AND a.first_name = 'Карина' AND a.middle_name = 'Денисовна' AND a.birth_year = 2006);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Побережная', 'Анна', 'Владимировна', 2010, 'f', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР «Маршал»' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Пянко И.А.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Побережная' AND a.first_name = 'Анна' AND a.middle_name = 'Владимировна' AND a.birth_year = 2010);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Врубель', 'Дарья', 'Васильевна', 2000, 'f', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'БУ ДО города Омска «СШОР №33»' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Сагандыков К.К., Переверзев Н.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Врубель' AND a.first_name = 'Дарья' AND a.middle_name = 'Васильевна' AND a.birth_year = 2000);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Баранова', 'Дарья', 'Андреевна', 2008, 'f', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО «Спортивная школа»' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Рябоконь О.Н.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Баранова' AND a.first_name = 'Дарья' AND a.middle_name = 'Андреевна' AND a.birth_year = 2008);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Махкамова', 'Парвина', 'Маруфовна', 2007, 'f', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО «СШ «Прикамье» г. Перми' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Мошев Д.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Махкамова' AND a.first_name = 'Парвина' AND a.middle_name = 'Маруфовна' AND a.birth_year = 2007);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бенидзе', 'Джони', 'Бадриевич', 1990, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Кириллов С.А., Огарев В.Я., Старовойтов А.Л.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бенидзе' AND a.first_name = 'Джони' AND a.middle_name = 'Бадриевич' AND a.birth_year = 1990);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кузнецов', 'Роман', 'Андреевич', 2009, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ №3, г. Улан-Удэ' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Коломин Д.А., Алексеев В.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кузнецов' AND a.first_name = 'Роман' AND a.middle_name = 'Андреевич' AND a.birth_year = 2009);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Манаков', 'Трофим', 'Анатольевич', 2000, 'm', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО «СШ №2» Сургутского района' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Трофимова А.А., Садыков Р.И., Дементьев А.Ф.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Манаков' AND a.first_name = 'Трофим' AND a.middle_name = 'Анатольевич' AND a.birth_year = 2000);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кашкаров', 'Артур', 'Анатольевич', 2005, 'm', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'спортивный клуб "АГАУ"' AND region_id = (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')), 'Платонов С.С.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кашкаров' AND a.first_name = 'Артур' AND a.middle_name = 'Анатольевич' AND a.birth_year = 2005);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Митюкевич', 'Станислав', 'Николаевич', 2008, 'm', (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШОР' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU')), 'Гладких В.Л.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Митюкевич' AND a.first_name = 'Станислав' AND a.middle_name = 'Николаевич' AND a.birth_year = 2008);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Клявлин', 'Андрей', 'Викторович', 2006, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО ВФГС в Челябинской области' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Симушин А.М., Дедюхин И.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Клявлин' AND a.first_name = 'Андрей' AND a.middle_name = 'Викторович' AND a.birth_year = 2006);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Зуев', 'Владислав', 'Алексеевич', 2000, 'm', (SELECT id FROM regions WHERE name = 'Воронежская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС РФ' AND region_id = (SELECT id FROM regions WHERE name = 'Воронежская область' AND country = 'RU')), 'Колесниченко Н.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Зуев' AND a.first_name = 'Владислав' AND a.middle_name = 'Алексеевич' AND a.birth_year = 2000);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Узюкин', 'Анатолий', 'Эдуардович', 2000, 'm', (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ФСК "Улап", СШ Энергия' AND region_id = (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU')), 'Глинкин Б.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Узюкин' AND a.first_name = 'Анатолий' AND a.middle_name = 'Эдуардович' AND a.birth_year = 2000);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Василевич', 'Добрыня', 'Андреевич', 2000, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ №3, г. Улан-Удэ' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Рассадин А.А., Сабадажев В.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Василевич' AND a.first_name = 'Добрыня' AND a.middle_name = 'Андреевич' AND a.birth_year = 2000);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Щербин', 'Олег', 'Владимирович', 1989, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Никифоров А.В.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Щербин' AND a.first_name = 'Олег' AND a.middle_name = 'Владимирович' AND a.birth_year = 1989);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Аникушко', 'Семён', 'Сергеевич', 2009, 'm', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ДЮСШ Кулундинского района' AND region_id = (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')), 'Катаев И.Н.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Аникушко' AND a.first_name = 'Семён' AND a.middle_name = 'Сергеевич' AND a.birth_year = 2009);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Рассадин', 'Андрей', 'Андреевич', 1989, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО «Онохойская СШ»' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Леонов С.Т., Руднев С.Л.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Рассадин' AND a.first_name = 'Андрей' AND a.middle_name = 'Андреевич' AND a.birth_year = 1989);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Смирнов', 'Даниил', 'Алексеевич', 2003, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Бенидзе А.А., Бенидзе Д.Б., Старовойтов А.Л.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Смирнов' AND a.first_name = 'Даниил' AND a.middle_name = 'Алексеевич' AND a.birth_year = 2003);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Волдаев', 'Александр', 'Владимирович', 2000, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Федерация гиревого спорта Томской области' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Ажермачев А.Б.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Волдаев' AND a.first_name = 'Александр' AND a.middle_name = 'Владимирович' AND a.birth_year = 2000);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Балдин', 'Александр', 'Васильевич', 1993, 'm', (SELECT id FROM regions WHERE name = 'Самарская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО "ВФГС" СО' AND region_id = (SELECT id FROM regions WHERE name = 'Самарская область' AND country = 'RU')), 'Бахтов И.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Балдин' AND a.first_name = 'Александр' AND a.middle_name = 'Васильевич' AND a.birth_year = 1993);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Седых', 'Илья', 'Александрович', 2004, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'БУ ДО города Омска «СШОР N33»' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Козленко В.Н., Чудаков В.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Седых' AND a.first_name = 'Илья' AND a.middle_name = 'Александрович' AND a.birth_year = 2004);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Любин', 'Валентин', 'Сергеевич', 2009, 'm', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Кулундинская Спортивная школа' AND region_id = (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')), 'Катаев И.Н.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Любин' AND a.first_name = 'Валентин' AND a.middle_name = 'Сергеевич' AND a.birth_year = 2009);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Баер', 'Павел', 'Арнольдович', 1983, 'm', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ДЮСШ Искитимский район' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Самостоятельно', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Баер' AND a.first_name = 'Павел' AND a.middle_name = 'Арнольдович' AND a.birth_year = 1983);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Сулейманов', 'Мовсар', 'Мусаевич', 1989, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР «Маршал»' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Трофимов М.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Сулейманов' AND a.first_name = 'Мовсар' AND a.middle_name = 'Мусаевич' AND a.birth_year = 1989);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бобров', 'Владимир', 'Сергеевич', 1989, 'm', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС РФ' AND region_id = (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')), 'Лесников П.Я., Бакум К.Е.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бобров' AND a.first_name = 'Владимир' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1989);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бессонов', 'Максим', 'Вячеславович', 2004, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Барков А.П., Беляев И.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бессонов' AND a.first_name = 'Максим' AND a.middle_name = 'Вячеславович' AND a.birth_year = 2004);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Курдюков', 'Василий', 'Сергеевич', 1997, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС РФ' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Анасенко А.В., Климов А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Курдюков' AND a.first_name = 'Василий' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1997);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Володин', 'Денис', 'Игоревич', 1993, 'm', (SELECT id FROM regions WHERE name = 'Московская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МУ ДО СШ "Легион"' AND region_id = (SELECT id FROM regions WHERE name = 'Московская область' AND country = 'RU')), 'Соколов Н.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Володин' AND a.first_name = 'Денис' AND a.middle_name = 'Игоревич' AND a.birth_year = 1993);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ташланов', 'Илья', 'Станиславович', 1987, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ Атлет' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Денисов И.Н.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ташланов' AND a.first_name = 'Илья' AND a.middle_name = 'Станиславович' AND a.birth_year = 1987);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Луценко', 'Никита', 'Ильич', 2003, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО "ВФГС" в г. Москве' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Коновалов Д.Е., Козлов Е.В.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Луценко' AND a.first_name = 'Никита' AND a.middle_name = 'Ильич' AND a.birth_year = 2003);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кожевников', 'Сергей', 'Павлович', 2008, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ №3 г.Улан-Удэ' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Рассадин А.А., Алексеев В.И.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кожевников' AND a.first_name = 'Сергей' AND a.middle_name = 'Павлович' AND a.birth_year = 2008);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Плотников', 'Вячеслав', 'Евгеньевич', 1998, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО ВФГС в Челябинской области' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Потапов О.Ю., Симушин А.М.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Плотников' AND a.first_name = 'Вячеслав' AND a.middle_name = 'Евгеньевич' AND a.birth_year = 1998);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Косухин', 'Владислав', 'Владимирович', 2004, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Дубровин Д.А., Бирюков С.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Косухин' AND a.first_name = 'Владислав' AND a.middle_name = 'Владимирович' AND a.birth_year = 2004);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Лавриков', 'Вячеслав', 'Дмитриевич', 2005, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ТГПУ' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Новиков А.В., Дмитриев С.Г.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Лавриков' AND a.first_name = 'Вячеслав' AND a.middle_name = 'Дмитриевич' AND a.birth_year = 2005);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Маликов', 'Данил', 'Дамирович', 2001, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО «СШ «Прикамье» г. Перми' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Мошев Д.И., Панфилов Г.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Маликов' AND a.first_name = 'Данил' AND a.middle_name = 'Дамирович' AND a.birth_year = 2001);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Мухитов', 'Андрей', 'Вячеславович', 1999, 'm', (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР по борьбе' AND region_id = (SELECT id FROM regions WHERE name = 'Брянская область' AND country = 'RU')), 'Гомонов В.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Мухитов' AND a.first_name = 'Андрей' AND a.middle_name = 'Вячеславович' AND a.birth_year = 1999);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Литвинов', 'Виталий', 'Александрович', 1993, 'm', (SELECT id FROM regions WHERE name = 'Кемеровская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР "Олимп"' AND region_id = (SELECT id FROM regions WHERE name = 'Кемеровская область' AND country = 'RU')), 'Решетников М.Е.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Литвинов' AND a.first_name = 'Виталий' AND a.middle_name = 'Александрович' AND a.birth_year = 1993);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Встров', 'Денис', 'Сергеевич', 1989, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО «ВФГС» в г. Москве' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Шаповалов Е.Г.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Встров' AND a.first_name = 'Денис' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1989);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Салихов', 'Рустам', 'Ренатович', 1982, 'm', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ №1 им. Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Фунтиков Н.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Салихов' AND a.first_name = 'Рустам' AND a.middle_name = 'Ренатович' AND a.birth_year = 1982);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Гуров', 'Владимир', 'Анатольевич', 1978, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР «Маршал»' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Трофимов М.А.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Гуров' AND a.first_name = 'Владимир' AND a.middle_name = 'Анатольевич' AND a.birth_year = 1978);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Пивень', 'Андрей', 'Владимирович', 2003, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ №3 г.Улан-Удэ' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Рассадин А.А., Трофимов М.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Пивень' AND a.first_name = 'Андрей' AND a.middle_name = 'Владимирович' AND a.birth_year = 2003);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Иванов', 'Александр', 'Сергеевич', 2008, 'm', (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДОСШ Чемпион' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU')), 'Абзалов В.М., Абзалова И.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Иванов' AND a.first_name = 'Александр' AND a.middle_name = 'Сергеевич' AND a.birth_year = 2008);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кравченко', 'Сергей', 'Сергеевич', 1982, 'm', (SELECT id FROM regions WHERE name = 'Калининградская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШОР' AND region_id = (SELECT id FROM regions WHERE name = 'Калининградская область' AND country = 'RU')), 'Самостоя.С.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кравченко' AND a.first_name = 'Сергей' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1982);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Спичкин', 'Алексей', 'Евгеньевич', 1994, 'm', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МУ ДО МЦРФКиС Черепановского района НСО' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Бобров В.С.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Спичкин' AND a.first_name = 'Алексей' AND a.middle_name = 'Евгеньевич' AND a.birth_year = 1994);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Самохвалов', 'Илья', 'Дмитриевич', 2007, 'm', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШ Геолог' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Бабичев М.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Самохвалов' AND a.first_name = 'Илья' AND a.middle_name = 'Дмитриевич' AND a.birth_year = 2007);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Марков', 'Иван', 'Эдуардович', 1995, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Семенов А.Н.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Марков' AND a.first_name = 'Иван' AND a.middle_name = 'Эдуардович' AND a.birth_year = 1995);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Розмазнин', 'Илья', 'Владимирович', 2000, 'm', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'БРОО ФГС' AND region_id = (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')), 'Вильган А.П., Мащенко О.В.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Розмазнин' AND a.first_name = 'Илья' AND a.middle_name = 'Владимирович' AND a.birth_year = 2000);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Тарвердиева', 'Мария', 'Алексеевна', 1986, 'f', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Семенов А.Н., Руднев С.Л.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Тарвердиева' AND a.first_name = 'Мария' AND a.middle_name = 'Алексеевна' AND a.birth_year = 1986);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Болотова', 'Елизавета', 'Сергеевна', 2007, 'f', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'БУ ДО города Омска «СШОР №33»' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Сагандыков К.К.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Болотова' AND a.first_name = 'Елизавета' AND a.middle_name = 'Сергеевна' AND a.birth_year = 2007);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Пузанкова', 'Анастасия', 'Константиновна', 2006, 'f', (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ "Татнефть Олимп"' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU')), 'Гиниатуллин А.З.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Пузанкова' AND a.first_name = 'Анастасия' AND a.middle_name = 'Константиновна' AND a.birth_year = 2006);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Сорокина', 'Ольга', 'Андреевна', 2003, 'f', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Ландин А.Ю., Афонин И.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Сорокина' AND a.first_name = 'Ольга' AND a.middle_name = 'Андреевна' AND a.birth_year = 2003);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бадашкова', 'Нина', 'Константиновна', 1991, 'f', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО "ВФГС" в Новосибирской области' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Бутенко А.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бадашкова' AND a.first_name = 'Нина' AND a.middle_name = 'Константиновна' AND a.birth_year = 1991);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Попова', 'Ольга', 'Сергеевна', 2002, 'f', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Федерация гиревого спорта Алтайского Края' AND region_id = (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')), 'Бреусов С.И.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Попова' AND a.first_name = 'Ольга' AND a.middle_name = 'Сергеевна' AND a.birth_year = 2002);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Фирулева', 'Василиса', 'Владимировна', 2004, 'f', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШ Геолог' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Бабичев М.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Фирулева' AND a.first_name = 'Василиса' AND a.middle_name = 'Владимировна' AND a.birth_year = 2004);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Новикова', 'Полина', 'Феликсовна', 2012, 'f', (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КОГАУ "СШОР "Юность"' AND region_id = (SELECT id FROM regions WHERE name = 'Кировская область' AND country = 'RU')), 'Малков Е.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Новикова' AND a.first_name = 'Полина' AND a.middle_name = 'Феликсовна' AND a.birth_year = 2012);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ховалко', 'Василий', 'Михайлович', 1993, 'm', (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШ Геолог' AND region_id = (SELECT id FROM regions WHERE name = 'Ямало-Ненецкий автономный округ' AND country = 'RU')), 'Бабичев М.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ховалко' AND a.first_name = 'Василий' AND a.middle_name = 'Михайлович' AND a.birth_year = 1993);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ильясов', 'Какен', 'Канатович', 1993, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС РФ' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Анасенко А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ильясов' AND a.first_name = 'Какен' AND a.middle_name = 'Канатович' AND a.birth_year = 1993);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Половников', 'Павел', 'Викторович', 2002, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО «ДЮСШ «Спарт»' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Маматов Г.Т.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Половников' AND a.first_name = 'Павел' AND a.middle_name = 'Викторович' AND a.birth_year = 2002);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Абросов', 'Алексей', 'Владимирович', 1991, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Динамо' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Дягилев А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Абросов' AND a.first_name = 'Алексей' AND a.middle_name = 'Владимирович' AND a.birth_year = 1991);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бенидзе', 'Спартак', 'Бадриевич', 2002, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Бенидзе А.А., Огарев В.Я., Старовойтов А.Л.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бенидзе' AND a.first_name = 'Спартак' AND a.middle_name = 'Бадриевич' AND a.birth_year = 2002);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Узокин', 'Анатолий', 'Эдуардович', 2000, 'm', (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ФСК "Улап", СШ Энергия' AND region_id = (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU')), 'Глинкин Б.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Узокин' AND a.first_name = 'Анатолий' AND a.middle_name = 'Эдуардович' AND a.birth_year = 2000);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Смагулов', 'Нурсултан', 'Шайзандинович', 1999, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Краевского В.Ф."' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Катаев И.В., Смагулов Ш.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Смагулов' AND a.first_name = 'Нурсултан' AND a.middle_name = 'Шайзандинович' AND a.birth_year = 1999);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Петушков', 'Денис', 'Владимирович', 1986, 'm', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КШС 1' AND region_id = (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')), 'Сергеев С.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Петушков' AND a.first_name = 'Денис' AND a.middle_name = 'Владимирович' AND a.birth_year = 1986);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Потапов', 'Данил', 'Алексеевич', 2002, 'm', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУДО "Лебяжьевская ДЮСШ"' AND region_id = (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')), 'Яхнич Е.В., Руднев С.Л.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Потапов' AND a.first_name = 'Данил' AND a.middle_name = 'Алексеевич' AND a.birth_year = 2002);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Цыбаев', 'Илья', 'Алексеевич', 1999, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Центр «Поиск»' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Дягилев А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Цыбаев' AND a.first_name = 'Илья' AND a.middle_name = 'Алексеевич' AND a.birth_year = 1999);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Куликов', 'Сергей', 'Александрович', 1985, 'm', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО ВФГС в НСО' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Самостоя.С.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Куликов' AND a.first_name = 'Сергей' AND a.middle_name = 'Александрович' AND a.birth_year = 1985);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Мащенко', 'Олег', 'Валерьевич', 1983, 'm', (SELECT id FROM regions WHERE name = 'Краснодарский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Краснодарский край' AND country = 'RU')), 'Мащенко В.С.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Мащенко' AND a.first_name = 'Олег' AND a.middle_name = 'Валерьевич' AND a.birth_year = 1983);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Балашов', 'Максим', 'Юрьевич', 1990, 'm', (SELECT id FROM regions WHERE name = 'Ивановская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РООО "ВФГС" в Ивановской области' AND region_id = (SELECT id FROM regions WHERE name = 'Ивановская область' AND country = 'RU')), 'Салов П.С.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Балашов' AND a.first_name = 'Максим' AND a.middle_name = 'Юрьевич' AND a.birth_year = 1990);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Суслов', 'Александр', 'Владимирович', 1986, 'm', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУДО "Каргапольская ДЮСШ"' AND region_id = (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')), 'Стрекаловских С.К.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Суслов' AND a.first_name = 'Александр' AND a.middle_name = 'Владимирович' AND a.birth_year = 1986);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Воронов', 'Иван', 'Андреевич', 1991, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШ №3 г.Улан-Удэ' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Кудашев Д.А., Коломин Д.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Воронов' AND a.first_name = 'Иван' AND a.middle_name = 'Андреевич' AND a.birth_year = 1991);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Паклин', 'Павел', 'Алексеевич', 1990, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ССК «КИТ на спорте»' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Самостоя.С.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Паклин' AND a.first_name = 'Павел' AND a.middle_name = 'Алексеевич' AND a.birth_year = 1990);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Карпов', 'Владислав', 'Алексеевич', 1999, 'm', (SELECT id FROM regions WHERE name = 'Мурманская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '—' AND region_id = (SELECT id FROM regions WHERE name = 'Мурманская область' AND country = 'RU')), 'Трофимов М.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Карпов' AND a.first_name = 'Владислав' AND a.middle_name = 'Алексеевич' AND a.birth_year = 1999);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бацманов', 'Ярослав', 'Русланович', 2010, 'm', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБОУ ДО Тогучская СШ' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Фокин А.С.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бацманов' AND a.first_name = 'Ярослав' AND a.middle_name = 'Русланович' AND a.birth_year = 2010);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Иванов', 'Алексей', 'Валерьевич', 1995, 'm', (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ Энергия' AND region_id = (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU')), 'Глинкин Б.Н.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Иванов' AND a.first_name = 'Алексей' AND a.middle_name = 'Валерьевич' AND a.birth_year = 1995);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Шаишников', 'Даниил', 'Андреевич', 2008, 'm', (SELECT id FROM regions WHERE name = 'Астраханская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МКОУДО ЗАТО Знаменск СШ' AND region_id = (SELECT id FROM regions WHERE name = 'Астраханская область' AND country = 'RU')), 'Бирюков С.Н.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Шаишников' AND a.first_name = 'Даниил' AND a.middle_name = 'Андреевич' AND a.birth_year = 2008);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Алексеев', 'Радиф', 'Дамирович', 1989, 'm', (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ Энергия' AND region_id = (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU')), 'Глинкин Б.Н., Бронюков Ю.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Алексеев' AND a.first_name = 'Радиф' AND a.middle_name = 'Дамирович' AND a.birth_year = 1989);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Степанов', 'Сергей', 'Владимирович', 1993, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Атлет' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Степанова О.А., Денисов И.Н., Трофимов М.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Степанов' AND a.first_name = 'Сергей' AND a.middle_name = 'Владимирович' AND a.birth_year = 1993);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Иванов', 'Евгений', 'Игоревич', 1987, 'm', (SELECT id FROM regions WHERE name = 'Забайкальский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Спортивный клуб ИВЕНГ' AND region_id = (SELECT id FROM regions WHERE name = 'Забайкальский край' AND country = 'RU')), 'Руднев С.Л.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Иванов' AND a.first_name = 'Евгений' AND a.middle_name = 'Игоревич' AND a.birth_year = 1987);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Гинда', 'Денис', 'Петрович', 1979, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО "ВФГС" в г. Москве' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Рябченко А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Гинда' AND a.first_name = 'Денис' AND a.middle_name = 'Петрович' AND a.birth_year = 1979);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Шерин', 'Роман', 'Витальевич', 1992, 'm', (SELECT id FROM regions WHERE name = 'Кемеровская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО "ВФГС" в Кемеровской области' AND region_id = (SELECT id FROM regions WHERE name = 'Кемеровская область' AND country = 'RU')), 'Опшин В.Г.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Шерин' AND a.first_name = 'Роман' AND a.middle_name = 'Витальевич' AND a.birth_year = 1992);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Зайдензал', 'Артём', 'Николаевич', 1987, 'm', (SELECT id FROM regions WHERE name = 'Кемеровская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО "ВФГС" в Кемеровской области' AND region_id = (SELECT id FROM regions WHERE name = 'Кемеровская область' AND country = 'RU')), 'Самостоя.С.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Зайдензал' AND a.first_name = 'Артём' AND a.middle_name = 'Николаевич' AND a.birth_year = 1987);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Рыскин', 'Сергей', 'Михайлович', 1995, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'БУ ДО города Омска «СШОР №33»' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Елисеев В.С., Переверзев Н.И.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Рыскин' AND a.first_name = 'Сергей' AND a.middle_name = 'Михайлович' AND a.birth_year = 1995);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Крестьянинов', 'Виктор', 'Александрович', 2000, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО «СШ «Прикамье» г. Перми' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Мошев Д.И.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Крестьянинов' AND a.first_name = 'Виктор' AND a.middle_name = 'Александрович' AND a.birth_year = 2000);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Смирнов', 'Руслан', 'Сергеевич', 1994, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Белова Н.Ю.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Смирнов' AND a.first_name = 'Руслан' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1994);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Загороднев', 'Максим', 'Олегович', 1992, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Динамо' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Гельмель Д.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Загороднев' AND a.first_name = 'Максим' AND a.middle_name = 'Олегович' AND a.birth_year = 1992);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бондарев', 'Дмитрий', 'Александрович', 1986, 'm', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ГазпромТрансГаз Югорск' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Виноградов М.Е.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бондарев' AND a.first_name = 'Дмитрий' AND a.middle_name = 'Александрович' AND a.birth_year = 1986);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Малиновский', 'Семён', 'Андреевич', 1989, 'm', (SELECT id FROM regions WHERE name = 'Ленинградская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РОО ФГСЛО' AND region_id = (SELECT id FROM regions WHERE name = 'Ленинградская область' AND country = 'RU')), 'Шаповалов Е.Г.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Малиновский' AND a.first_name = 'Семён' AND a.middle_name = 'Андреевич' AND a.birth_year = 1989);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ветров', 'Денис', 'Сергеевич', 1989, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО «ВФГС» в г. Москве' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Вильган А.П., Осадчий Е.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ветров' AND a.first_name = 'Денис' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1989);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бас', 'Денис', 'Николаевич', 2007, 'm', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР 5 г Белгород' AND region_id = (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')), 'Тарвердиева М.А., Симушин А.М.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бас' AND a.first_name = 'Денис' AND a.middle_name = 'Николаевич' AND a.birth_year = 2007);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Шамара', 'Леонард', 'Леонидович', 1974, 'm', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО ВФГС в г. Москве' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), NULL, (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Шамара' AND a.first_name = 'Леонард' AND a.middle_name = 'Леонидович' AND a.birth_year = 1974);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Спесивцев', 'Данила', 'Владимирович', 2003, 'm', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР 5 г Белгород' AND region_id = (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')), 'Вильган А.П., Поляков М.Ю.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Спесивцев' AND a.first_name = 'Данила' AND a.middle_name = 'Владимирович' AND a.birth_year = 2003);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Поздеев', 'Андрей', 'Николаевич', 1990, 'm', (SELECT id FROM regions WHERE name = 'Архангельская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО "ВФГС" в Архангельской области' AND region_id = (SELECT id FROM regions WHERE name = 'Архангельская область' AND country = 'RU')), 'Хвостов А.В., Сахаров Н.Л.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Поздеев' AND a.first_name = 'Андрей' AND a.middle_name = 'Николаевич' AND a.birth_year = 1990);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Носков', 'Андрей', 'Николаевич', 1993, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО «СШ «Прикамье» г. Перми' AND region_id = (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')), 'Рассадин А.А., Трофимов М.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Носков' AND a.first_name = 'Андрей' AND a.middle_name = 'Николаевич' AND a.birth_year = 1993);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Медведев', 'Николай', 'Михайлович', 2006, 'm', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОРСВС ИМ. В.Ф. КРАЕВСКОГО' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Труш А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Медведев' AND a.first_name = 'Николай' AND a.middle_name = 'Михайлович' AND a.birth_year = 2006);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Филиппов', 'Максим', 'Юрьевич', 1993, 'm', (SELECT id FROM regions WHERE name = 'Краснодарский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Краснодарский край' AND country = 'RU')), 'Виноградов М.Е.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Филиппов' AND a.first_name = 'Максим' AND a.middle_name = 'Юрьевич' AND a.birth_year = 1993);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Давыдов', 'Антон', 'Александрович', 1982, 'm', (SELECT id FROM regions WHERE name = 'Ленинградская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Спорт-ЛАЭС' AND region_id = (SELECT id FROM regions WHERE name = 'Ленинградская область' AND country = 'RU')), 'Бобров В.С.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Давыдов' AND a.first_name = 'Антон' AND a.middle_name = 'Александрович' AND a.birth_year = 1982);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Купш', 'Денис', 'Аркадьевич', 2004, 'm', (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'БУ ДО города Омска «СШОР №33»' AND region_id = (SELECT id FROM regions WHERE name = 'Омская область' AND country = 'RU')), 'Леонов С.Т.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Купш' AND a.first_name = 'Денис' AND a.middle_name = 'Аркадьевич' AND a.birth_year = 2004);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кудашев', 'Денис', 'Андреевич', 1988, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО «Онохойская СШ»' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Тимофеев Н.А., Черкашин Д.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кудашев' AND a.first_name = 'Денис' AND a.middle_name = 'Андреевич' AND a.birth_year = 1988);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Чупин', 'Никита', 'Владимирович', 1988, 'm', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Динамо' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Петухов А.В., Бутенко А.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Чупин' AND a.first_name = 'Никита' AND a.middle_name = 'Владимирович' AND a.birth_year = 1988);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Шендо', 'Никита', 'Сергеевич', 1998, 'm', (SELECT id FROM regions WHERE name = 'Красноярский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КРСОО "Федерация гиревого спорта"' AND region_id = (SELECT id FROM regions WHERE name = 'Красноярский край' AND country = 'RU')), 'Бутенко А.А.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Шендо' AND a.first_name = 'Никита' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1998);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Нечунаев', 'Александр', 'Сергеевич', 1993, 'm', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО "ВФГС" в Новосибирской области' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), NULL, (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Нечунаев' AND a.first_name = 'Александр' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1993);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Орлов', 'Сергей', 'Александрович', 2005, 'm', (SELECT id FROM regions WHERE name = 'Ставропольский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ДЮСШ' AND region_id = (SELECT id FROM regions WHERE name = 'Ставропольский край' AND country = 'RU')), 'Петров В.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Орлов' AND a.first_name = 'Сергей' AND a.middle_name = 'Александрович' AND a.birth_year = 2005);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Денисов', 'Иван', 'Николаевич', 1982, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ВС РФ' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Симушин А.М.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Денисов' AND a.first_name = 'Иван' AND a.middle_name = 'Николаевич' AND a.birth_year = 1982);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Павлов', 'Александр', 'Станиславович', 1994, 'm', (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ Энергия, ФСК "Улап"' AND region_id = (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU')), 'Глинкин Б.Н.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Павлов' AND a.first_name = 'Александр' AND a.middle_name = 'Станиславович' AND a.birth_year = 1994);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Куликов', 'Владислав', 'Александрович', 2006, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО ВФГС в Челябинской области' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Потапов О.Ю.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Куликов' AND a.first_name = 'Владислав' AND a.middle_name = 'Александрович' AND a.birth_year = 2006);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Григорьев', 'Андрей', 'Анатольевич', 1987, 'm', (SELECT id FROM regions WHERE name = 'Свердловская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Федерация гиревого спорта Свердловской области' AND region_id = (SELECT id FROM regions WHERE name = 'Свердловская область' AND country = 'RU')), 'Гребенщиков Д.С.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Григорьев' AND a.first_name = 'Андрей' AND a.middle_name = 'Анатольевич' AND a.birth_year = 1987);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Шишов', 'Михаил', 'Александрович', 1982, 'm', (SELECT id FROM regions WHERE name = 'Владимирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Федерация гиревого спорта во Владимирской области' AND region_id = (SELECT id FROM regions WHERE name = 'Владимирская область' AND country = 'RU')), 'Арифулин А.Н.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Шишов' AND a.first_name = 'Михаил' AND a.middle_name = 'Александрович' AND a.birth_year = 1982);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Усатов', 'Николай', 'Владимирович', 1988, 'm', (SELECT id FROM regions WHERE name = 'Самарская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО "ВФГС" СО' AND region_id = (SELECT id FROM regions WHERE name = 'Самарская область' AND country = 'RU')), 'Балдин А.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Усатов' AND a.first_name = 'Николай' AND a.middle_name = 'Владимирович' AND a.birth_year = 1988);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Губко', 'Дмитрий', 'Сергеевич', 1987, 'm', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МВД' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Шевелев Д.В.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Губко' AND a.first_name = 'Дмитрий' AND a.middle_name = 'Сергеевич' AND a.birth_year = 1987);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Жура', 'Александра', 'Михайловна', 1988, 'f', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Кириллов С.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Жура' AND a.first_name = 'Александра' AND a.middle_name = 'Михайловна' AND a.birth_year = 1988);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Щербина', 'Джанита', 'Вадимовна', 1991, 'f', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Никифоров А.В.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Щербина' AND a.first_name = 'Джанита' AND a.middle_name = 'Вадимовна' AND a.birth_year = 1991);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Балабанова', '(Мажаева)', 'Наталия Евгеньевна', 1999, 'f', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф.Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Барков А.П.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Балабанова' AND a.first_name = '(Мажаева)' AND a.middle_name = 'Наталия Евгеньевна' AND a.birth_year = 1999);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Иванова', 'Алиса', 'Валерьевна', 1997, 'f', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КШС 1/ ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')), 'Шванев В.Б., Сергеев С.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Иванова' AND a.first_name = 'Алиса' AND a.middle_name = 'Валерьевна' AND a.birth_year = 1997);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Гладышева', 'Дарья', 'Алексеевна', 2004, 'f', (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Жура Александра Михайловна' AND region_id = (SELECT id FROM regions WHERE name = 'Курганская область' AND country = 'RU')), 'Битков А.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Гладышева' AND a.first_name = 'Дарья' AND a.middle_name = 'Алексеевна' AND a.birth_year = 2004);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Карцова', 'Татьяна', 'Валерьевна', 1981, 'f', (SELECT id FROM regions WHERE name = 'Московская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО "ВФГС" в Московской области' AND region_id = (SELECT id FROM regions WHERE name = 'Московская область' AND country = 'RU')), 'Конев А.В., Лупандин С.О.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Карцова' AND a.first_name = 'Татьяна' AND a.middle_name = 'Валерьевна' AND a.birth_year = 1981);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Конева', 'Лилия', 'Алексеевна', 2009, 'f', (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР г Губкин' AND region_id = (SELECT id FROM regions WHERE name = 'Белгородская область' AND country = 'RU')), NULL, (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Конева' AND a.first_name = 'Лилия' AND a.middle_name = 'Алексеевна' AND a.birth_year = 2009);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Белоус', 'Анна', 'Сергеевна', 2001, 'f', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР «Югория» им. А.А. Пилояна' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), NULL, (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Белоус' AND a.first_name = 'Анна' AND a.middle_name = 'Сергеевна' AND a.birth_year = 2001);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Хуснудинова', 'Мария', 'Петровна', 2004, 'f', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'РО ООО ВФГС в Челябинской области' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), NULL, (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Хуснудинова' AND a.first_name = 'Мария' AND a.middle_name = 'Петровна' AND a.birth_year = 2004);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Аллоярова', 'Милана', 'Борисовна', 2002, 'f', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ТРО ООО ВФГС' AND region_id = (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')), NULL, (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Аллоярова' AND a.first_name = 'Милана' AND a.middle_name = 'Борисовна' AND a.birth_year = 2002);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Дементьева', 'Наталья', 'Сергеевна', 2010, 'f', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР "Старт"' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), NULL, (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Дементьева' AND a.first_name = 'Наталья' AND a.middle_name = 'Сергеевна' AND a.birth_year = 2010);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Тюляева', 'Диана', 'Александровна', 2010, 'f', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МУ ДО «МЦРФКиС» Черепановского района' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), NULL, (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Тюляева' AND a.first_name = 'Диана' AND a.middle_name = 'Александровна' AND a.birth_year = 2010);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Коптяева', 'Карина', 'Мансуровна', 2007, 'f', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР им В.Ф.Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), NULL, (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Коптяева' AND a.first_name = 'Карина' AND a.middle_name = 'Мансуровна' AND a.birth_year = 2007);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Дедюхина', 'Ксения', 'Игоревна', 1990, 'f', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР «Югория» им. А.А. Пилояна' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Шпартко М.А., Дедюхин И.В.', (SELECT id FROM sport_ranks WHERE code = 'zms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Дедюхина' AND a.first_name = 'Ксения' AND a.middle_name = 'Игоревна' AND a.birth_year = 1990);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Степанова', 'Оксана', 'Анатольевна', 1990, 'f', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Атлет' AND region_id = (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')), 'Степанов С.В., Денисов И.Н., Трофимов М.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Степанова' AND a.first_name = 'Оксана' AND a.middle_name = 'Анатольевна' AND a.birth_year = 1990);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бурмакина', 'Екатерина', 'Сергеевна', 2005, 'f', (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ «Татнефть-Олимп»' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Татарстан' AND country = 'RU')), 'Трофимов М.А., Гиниатуллин А.З.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бурмакина' AND a.first_name = 'Екатерина' AND a.middle_name = 'Сергеевна' AND a.birth_year = 2005);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Чеснокова', 'Екатерина', 'Игоревна', 1996, 'f', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ГБУ ДО МКСШОР «Запад», отделение «Семёрка»' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Ландин А.Ю., Турищев Д.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Чеснокова' AND a.first_name = 'Екатерина' AND a.middle_name = 'Игоревна' AND a.birth_year = 1996);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Переплетова', 'Яна', 'Васильевна', 2009, 'f', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Ландин А.Ю., Турищев Д.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Переплетова' AND a.first_name = 'Яна' AND a.middle_name = 'Васильевна' AND a.birth_year = 2009);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Башарова', 'Виктория', 'Васильевна', 1993, 'f', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Федерация гиревого спорта Республики Бурятия' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Рассадин А.А., Барбакова Н.А., Каргин С.Я.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Башарова' AND a.first_name = 'Виктория' AND a.middle_name = 'Васильевна' AND a.birth_year = 1993);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бенидзе', 'Елизавета', 'Бадриевна', 2002, 'f', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Бенидзе А.А., Вильган А.П., Огарев В.Я.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бенидзе' AND a.first_name = 'Елизавета' AND a.middle_name = 'Бадриевна' AND a.birth_year = 2002);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Барбакова', 'Наталья', 'Александровна', 1984, 'f', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР «Маршал»' AND region_id = (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')), 'Трофимов М.А.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Барбакова' AND a.first_name = 'Наталья' AND a.middle_name = 'Александровна' AND a.birth_year = 1984);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Фирса', 'Анна', 'Сергеевна', 2003, 'f', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Ландин А.Ю., Труш А.В.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Фирса' AND a.first_name = 'Анна' AND a.middle_name = 'Сергеевна' AND a.birth_year = 2003);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Иванова', 'Нина', 'Владимировна', 1988, 'f', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Федерация гиревого спорта Республики Бурятия' AND region_id = (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')), 'Рассадин А.А., Анасенко А.В., Руднев Р.С.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Иванова' AND a.first_name = 'Нина' AND a.middle_name = 'Владимировна' AND a.birth_year = 1988);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Потапова', 'Анастасия', 'Михайловна', 2004, 'f', (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО ДЮЦ "Старт" города Тюмени' AND region_id = (SELECT id FROM regions WHERE name = 'Тюменская область' AND country = 'RU')), 'Бобров В.С., Лесников П.Я.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Потапова' AND a.first_name = 'Анастасия' AND a.middle_name = 'Михайловна' AND a.birth_year = 2004);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Калугина', 'Ирина', 'Вячеславовна', 2008, 'f', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ №1 им. Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Калугин В.Н., Фунтиков Н.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Калугина' AND a.first_name = 'Ирина' AND a.middle_name = 'Вячеславовна' AND a.birth_year = 2008);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Плечова', 'Карина', 'Юрьевна', 2007, 'f', (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ Энергия' AND region_id = (SELECT id FROM regions WHERE name = 'Чувашская Республика' AND country = 'RU')), 'Глинкин Б.Н.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Плечова' AND a.first_name = 'Карина' AND a.middle_name = 'Юрьевна' AND a.birth_year = 2007);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Румянцева', 'Дарья', 'Дмитриевна', 2003, 'f', (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»' AND region_id = (SELECT id FROM regions WHERE name = 'г. Москва' AND country = 'RU')), 'Ландин А.Ю., Турищев Д.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Румянцева' AND a.first_name = 'Дарья' AND a.middle_name = 'Дмитриевна' AND a.birth_year = 2003);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Андросова', 'Марина', 'Евгеньевна', 2007, 'f', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'Федерация гиревого спорта Алтайского Края' AND region_id = (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')), 'Белова Н.Ю.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Андросова' AND a.first_name = 'Марина' AND a.middle_name = 'Евгеньевна' AND a.birth_year = 2007);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Верт', 'Елена', 'Сергеевна', 1991, 'f', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШОР силовых видов спорта имени В. Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Барков А.П.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Верт' AND a.first_name = 'Елена' AND a.middle_name = 'Сергеевна' AND a.birth_year = 1991);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Бурова', 'Маргарита', 'Андреевна', 2009, 'f', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО "ДЮСШ" Татарского МО' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Путерлас А.С.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Бурова' AND a.first_name = 'Маргарита' AND a.middle_name = 'Андреевна' AND a.birth_year = 2009);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кухарева', 'Мария', 'Сергеевна', 1989, 'f', (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского' AND region_id = (SELECT id FROM regions WHERE name = 'г. Санкт-Петербург' AND country = 'RU')), 'Барков А.П., Хвостостов А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кухарева' AND a.first_name = 'Мария' AND a.middle_name = 'Сергеевна' AND a.birth_year = 1989);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Островская', 'Надежда', 'Аркадьевна', 1985, 'f', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МБУ ДО СШОР «Югория» им. А.А. Пилояна' AND region_id = (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')), 'Шпартко М.А., Бакум К.Е.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Островская' AND a.first_name = 'Надежда' AND a.middle_name = 'Аркадьевна' AND a.birth_year = 1985);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Копылова', 'Регина', 'Геннадьевна', 2001, 'f', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'ДЮСШ Искитимского района' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Баер П.А.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Копылова' AND a.first_name = 'Регина' AND a.middle_name = 'Геннадьевна' AND a.birth_year = 2001);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Ходунова', 'Ирина', 'Геннадьевна', 1985, 'f', (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'КШС 1/ ВС' AND region_id = (SELECT id FROM regions WHERE name = 'Смоленская область' AND country = 'RU')), 'Шванев В.Б.', (SELECT id FROM sport_ranks WHERE code = 'msmk')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Ходунова' AND a.first_name = 'Ирина' AND a.middle_name = 'Геннадьевна' AND a.birth_year = 1985);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Скоробогатова', 'Юлия', 'Владимировна', 1987, 'f', (SELECT id FROM regions WHERE name = 'Калининградская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО СШОР' AND region_id = (SELECT id FROM regions WHERE name = 'Калининградская область' AND country = 'RU')), 'Руднев С.Л., Бабушкин М.Б., Кравченко С.С.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Скоробогатова' AND a.first_name = 'Юлия' AND a.middle_name = 'Владимировна' AND a.birth_year = 1987);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кузьмичева', 'Ксения', 'Сергеевна', 2004, 'f', (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'СШ №1 им. Л.Д. Ковалевского' AND region_id = (SELECT id FROM regions WHERE name = 'Оренбургская область' AND country = 'RU')), 'Павлов С.П., Ерохин А.В.', (SELECT id FROM sport_ranks WHERE code = 'ms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кузьмичева' AND a.first_name = 'Ксения' AND a.middle_name = 'Сергеевна' AND a.birth_year = 2004);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Кравцова', 'Елизавета', 'Максимовна', 2009, 'f', (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МАУ ДО Спортивная школа "ПОБЕДА"' AND region_id = (SELECT id FROM regions WHERE name = 'Томская область' AND country = 'RU')), 'Чепуштанов И.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Кравцова' AND a.first_name = 'Елизавета' AND a.middle_name = 'Максимовна' AND a.birth_year = 2009);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Вертинская', 'Анна', 'Алексеевна', 2009, 'f', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU'), (SELECT id FROM clubs WHERE name = '—' AND region_id = (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')), 'Пожидаев В.В.', (SELECT id FROM sport_ranks WHERE code = 'kms')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Вертинская' AND a.first_name = 'Анна' AND a.middle_name = 'Алексеевна' AND a.birth_year = 2009);
INSERT INTO athletes (last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id)
  SELECT 'Редингер', 'Александра', 'Ивановна', 2008, 'f', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'), (SELECT id FROM clubs WHERE name = 'МУ ДО «МЦРФКиС» Черепановского района' AND region_id = (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')), 'Бутенко И.А.', (SELECT id FROM sport_ranks WHERE code = 'i')
  WHERE NOT EXISTS (SELECT 1 FROM athletes a WHERE a.last_name = 'Редингер' AND a.first_name = 'Александра' AND a.middle_name = 'Ивановна' AND a.birth_year = 2008);

INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'butenko-evgeniy-1995' AND s.athlete_id <> a.id)
              THEN 'butenko-evgeniy-1995-' || a.id ELSE 'butenko-evgeniy-1995' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бутенко' AND first_name = 'Евгений' AND middle_name = 'Александрович' AND birth_year = 1995)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sirazetdinov-danil-2007' AND s.athlete_id <> a.id)
              THEN 'sirazetdinov-danil-2007-' || a.id ELSE 'sirazetdinov-danil-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Сиразетдинов' AND first_name = 'Данил' AND middle_name = 'Ильфатович' AND birth_year = 2007)
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
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'nedorezov-vasiliy-1992' AND s.athlete_id <> a.id)
              THEN 'nedorezov-vasiliy-1992-' || a.id ELSE 'nedorezov-vasiliy-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Недорезов' AND first_name = 'Василий' AND middle_name = 'Сергеевич' AND birth_year = 1992)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zhbanov-aleksey-1986' AND s.athlete_id <> a.id)
              THEN 'zhbanov-aleksey-1986-' || a.id ELSE 'zhbanov-aleksey-1986' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Жбанов' AND first_name = 'Алексей' AND middle_name = 'Александрович' AND birth_year = 1986)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kormilicyn-ivan-2010' AND s.athlete_id <> a.id)
              THEN 'kormilicyn-ivan-2010-' || a.id ELSE 'kormilicyn-ivan-2010' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кормилицын' AND first_name = 'Иван' AND middle_name = 'Николаевич' AND birth_year = 2010)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zhalov-yaroslav-2007' AND s.athlete_id <> a.id)
              THEN 'zhalov-yaroslav-2007-' || a.id ELSE 'zhalov-yaroslav-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Жалов' AND first_name = 'Ярослав' AND middle_name = 'Борисович' AND birth_year = 2007)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'filatov-aleksey-2008' AND s.athlete_id <> a.id)
              THEN 'filatov-aleksey-2008-' || a.id ELSE 'filatov-aleksey-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Филатов' AND first_name = 'Алексей' AND middle_name = 'Александрович' AND birth_year = 2008)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'morozovich-vladislav-1999' AND s.athlete_id <> a.id)
              THEN 'morozovich-vladislav-1999-' || a.id ELSE 'morozovich-vladislav-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Морозович' AND first_name = 'Владислав' AND middle_name = 'Павлович' AND birth_year = 1999)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ryzhkov-anton-1994' AND s.athlete_id <> a.id)
              THEN 'ryzhkov-anton-1994-' || a.id ELSE 'ryzhkov-anton-1994' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Рыжков' AND first_name = 'Антон' AND middle_name = 'Николаевич' AND birth_year = 1994)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zaharov-kirill-2007' AND s.athlete_id <> a.id)
              THEN 'zaharov-kirill-2007-' || a.id ELSE 'zaharov-kirill-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Захаров' AND first_name = 'Кирилл' AND middle_name = 'Дмитриевич' AND birth_year = 2007)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kolomin-dmitriy-1999' AND s.athlete_id <> a.id)
              THEN 'kolomin-dmitriy-1999-' || a.id ELSE 'kolomin-dmitriy-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Коломин' AND first_name = 'Дмитрий' AND middle_name = 'Андреевич' AND birth_year = 1999)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'hamidov-fahriddin-2002' AND s.athlete_id <> a.id)
              THEN 'hamidov-fahriddin-2002-' || a.id ELSE 'hamidov-fahriddin-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Хамидов' AND first_name = 'Фахриддин' AND middle_name = 'Фарход угли' AND birth_year = 2002)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sergeev-aleksey-2001' AND s.athlete_id <> a.id)
              THEN 'sergeev-aleksey-2001-' || a.id ELSE 'sergeev-aleksey-2001' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Сергеев' AND first_name = 'Алексей' AND middle_name = 'Вячеславович' AND birth_year = 2001)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'rybskiy-pavel-2008' AND s.athlete_id <> a.id)
              THEN 'rybskiy-pavel-2008-' || a.id ELSE 'rybskiy-pavel-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Рыбский' AND first_name = 'Павел' AND middle_name = 'Сергеевич' AND birth_year = 2008)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'melyuhin-kirill-2011' AND s.athlete_id <> a.id)
              THEN 'melyuhin-kirill-2011-' || a.id ELSE 'melyuhin-kirill-2011' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Мелюхин' AND first_name = 'Кирилл' AND middle_name = 'Александрович' AND birth_year = 2011)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sidorenkov-aleksandr-2010' AND s.athlete_id <> a.id)
              THEN 'sidorenkov-aleksandr-2010-' || a.id ELSE 'sidorenkov-aleksandr-2010' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Сидоренков' AND first_name = 'Александр' AND middle_name = 'Александрович' AND birth_year = 2010)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'belyaev-ivan-1992' AND s.athlete_id <> a.id)
              THEN 'belyaev-ivan-1992-' || a.id ELSE 'belyaev-ivan-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Беляев' AND first_name = 'Иван' AND middle_name = 'Сергеевич' AND birth_year = 1992)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ryabkov-aleksey-1993' AND s.athlete_id <> a.id)
              THEN 'ryabkov-aleksey-1993-' || a.id ELSE 'ryabkov-aleksey-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Рябков' AND first_name = 'Алексей' AND middle_name = 'Игоревич' AND birth_year = 1993)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'bagrov-maksim-2009' AND s.athlete_id <> a.id)
              THEN 'bagrov-maksim-2009-' || a.id ELSE 'bagrov-maksim-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Багров' AND first_name = 'Максим' AND middle_name = 'Дмитриевич' AND birth_year = 2009)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'fomin-fedor-2004' AND s.athlete_id <> a.id)
              THEN 'fomin-fedor-2004-' || a.id ELSE 'fomin-fedor-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Фомин' AND first_name = 'Фёдор' AND middle_name = 'Алексеевич' AND birth_year = 2004)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'trofimov-timur-2011' AND s.athlete_id <> a.id)
              THEN 'trofimov-timur-2011-' || a.id ELSE 'trofimov-timur-2011' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Трофимов' AND first_name = 'Тимур' AND middle_name = 'Михайлович' AND birth_year = 2011)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'novoselov-andrey-2004' AND s.athlete_id <> a.id)
              THEN 'novoselov-andrey-2004-' || a.id ELSE 'novoselov-andrey-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Новоселов' AND first_name = 'Андрей' AND middle_name = 'Евгеньевич' AND birth_year = 2004)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'semenov-nikita-1993' AND s.athlete_id <> a.id)
              THEN 'semenov-nikita-1993-' || a.id ELSE 'semenov-nikita-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Семенов' AND first_name = 'Никита' AND middle_name = 'Андреевич' AND birth_year = 1993)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'rozhin-egor-1987' AND s.athlete_id <> a.id)
              THEN 'rozhin-egor-1987-' || a.id ELSE 'rozhin-egor-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Рожин' AND first_name = 'Егор' AND middle_name = 'Иннокентьевич' AND birth_year = 1987)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zhibinov-fedor-2004' AND s.athlete_id <> a.id)
              THEN 'zhibinov-fedor-2004-' || a.id ELSE 'zhibinov-fedor-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Жибинов' AND first_name = 'Фёдор' AND middle_name = 'Васильевич' AND birth_year = 2004)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kolokolov-nikita-2007' AND s.athlete_id <> a.id)
              THEN 'kolokolov-nikita-2007-' || a.id ELSE 'kolokolov-nikita-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Колоколов' AND first_name = 'Никита' AND middle_name = 'Александрович' AND birth_year = 2007)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zaharov-maksim-2008' AND s.athlete_id <> a.id)
              THEN 'zaharov-maksim-2008-' || a.id ELSE 'zaharov-maksim-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Захаров' AND first_name = 'Максим' AND middle_name = 'Александрович' AND birth_year = 2008)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lyaukin-kirill-1999' AND s.athlete_id <> a.id)
              THEN 'lyaukin-kirill-1999-' || a.id ELSE 'lyaukin-kirill-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ляукин' AND first_name = 'Кирилл' AND middle_name = 'Сергеевич' AND birth_year = 1999)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kargin-sergey-1998' AND s.athlete_id <> a.id)
              THEN 'kargin-sergey-1998-' || a.id ELSE 'kargin-sergey-1998' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Каргин' AND first_name = 'Сергей' AND middle_name = 'Ярославович' AND birth_year = 1998)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'astahov-evgeniy-2002' AND s.athlete_id <> a.id)
              THEN 'astahov-evgeniy-2002-' || a.id ELSE 'astahov-evgeniy-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Астахов' AND first_name = 'Евгений' AND middle_name = 'Михайлович' AND birth_year = 2002)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sarsembaev-ilyas-1999' AND s.athlete_id <> a.id)
              THEN 'sarsembaev-ilyas-1999-' || a.id ELSE 'sarsembaev-ilyas-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Сарсембаев' AND first_name = 'Ильяс' AND middle_name = 'Асхатович' AND birth_year = 1999)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'porcev-roman-1987' AND s.athlete_id <> a.id)
              THEN 'porcev-roman-1987-' || a.id ELSE 'porcev-roman-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Порцев' AND first_name = 'Роман' AND middle_name = 'Геннадьевич' AND birth_year = 1987)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lyubimskiy-sergey-1992' AND s.athlete_id <> a.id)
              THEN 'lyubimskiy-sergey-1992-' || a.id ELSE 'lyubimskiy-sergey-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Любимский' AND first_name = 'Сергей' AND middle_name = 'Александрович' AND birth_year = 1992)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'dubel-aleksey-1990' AND s.athlete_id <> a.id)
              THEN 'dubel-aleksey-1990-' || a.id ELSE 'dubel-aleksey-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Дубель' AND first_name = 'Алексей' AND middle_name = 'Викторович' AND birth_year = 1990)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'molchanov-dianisiy-2005' AND s.athlete_id <> a.id)
              THEN 'molchanov-dianisiy-2005-' || a.id ELSE 'molchanov-dianisiy-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Молчанов' AND first_name = 'Дианисий' AND middle_name = 'Николаевич' AND birth_year = 2005)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'filippov-evgeniy-1995' AND s.athlete_id <> a.id)
              THEN 'filippov-evgeniy-1995-' || a.id ELSE 'filippov-evgeniy-1995' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Филиппов' AND first_name = 'Евгений' AND middle_name = 'Борисович' AND birth_year = 1995)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'balandin-andrey-1996' AND s.athlete_id <> a.id)
              THEN 'balandin-andrey-1996-' || a.id ELSE 'balandin-andrey-1996' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Баландин' AND first_name = 'Андрей' AND middle_name = 'Александрович' AND birth_year = 1996)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'penkov-yan-2010' AND s.athlete_id <> a.id)
              THEN 'penkov-yan-2010-' || a.id ELSE 'penkov-yan-2010' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Пеньков' AND first_name = 'Ян' AND middle_name = 'Евгеньевич' AND birth_year = 2010)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sogoyan-artem-1988' AND s.athlete_id <> a.id)
              THEN 'sogoyan-artem-1988-' || a.id ELSE 'sogoyan-artem-1988' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Согоян' AND first_name = 'Артём' AND middle_name = 'Ражденович' AND birth_year = 1988)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ivanov-vitaliy-1978' AND s.athlete_id <> a.id)
              THEN 'ivanov-vitaliy-1978-' || a.id ELSE 'ivanov-vitaliy-1978' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Виталий' AND middle_name = 'Викторович' AND birth_year = 1978)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'borodynkin-oleg-2002' AND s.athlete_id <> a.id)
              THEN 'borodynkin-oleg-2002-' || a.id ELSE 'borodynkin-oleg-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бородынкин' AND first_name = 'Олег' AND middle_name = 'Александрович' AND birth_year = 2002)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'cherkashin-dmitriy-1999' AND s.athlete_id <> a.id)
              THEN 'cherkashin-dmitriy-1999-' || a.id ELSE 'cherkashin-dmitriy-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Черкашин' AND first_name = 'Дмитрий' AND middle_name = 'Андреевич' AND birth_year = 1999)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'chuev-pavel-1997' AND s.athlete_id <> a.id)
              THEN 'chuev-pavel-1997-' || a.id ELSE 'chuev-pavel-1997' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Чуев' AND first_name = 'Павел' AND middle_name = 'Владимирович' AND birth_year = 1997)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'samochernov-ivan-1998' AND s.athlete_id <> a.id)
              THEN 'samochernov-ivan-1998-' || a.id ELSE 'samochernov-ivan-1998' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Самочернов' AND first_name = 'Иван' AND middle_name = 'Николаевич' AND birth_year = 1998)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'seliverstov-semen-1989' AND s.athlete_id <> a.id)
              THEN 'seliverstov-semen-1989-' || a.id ELSE 'seliverstov-semen-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Селиверстов' AND first_name = 'Семен' AND middle_name = 'Васильевич' AND birth_year = 1989)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'andruschenko-sergey-2005' AND s.athlete_id <> a.id)
              THEN 'andruschenko-sergey-2005-' || a.id ELSE 'andruschenko-sergey-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Андрущенко' AND first_name = 'Сергей' AND middle_name = 'Александрович' AND birth_year = 2005)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'polibin-mihail-2004' AND s.athlete_id <> a.id)
              THEN 'polibin-mihail-2004-' || a.id ELSE 'polibin-mihail-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Полибин' AND first_name = 'Михаил' AND middle_name = 'Леонидович' AND birth_year = 2004)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'minullin-marsel-2000' AND s.athlete_id <> a.id)
              THEN 'minullin-marsel-2000-' || a.id ELSE 'minullin-marsel-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Минуллин' AND first_name = 'Марсель' AND middle_name = 'Ринатович' AND birth_year = 2000)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'akulshin-aleksey-1994' AND s.athlete_id <> a.id)
              THEN 'akulshin-aleksey-1994-' || a.id ELSE 'akulshin-aleksey-1994' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Акульшин' AND first_name = 'Алексей' AND middle_name = 'Сергеевич' AND birth_year = 1994)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'rysnik-sergey-1995' AND s.athlete_id <> a.id)
              THEN 'rysnik-sergey-1995-' || a.id ELSE 'rysnik-sergey-1995' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Рысник' AND first_name = 'Сергей' AND middle_name = 'Михайлович' AND birth_year = 1995)
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
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'nikolaev-arkadiy-2002' AND s.athlete_id <> a.id)
              THEN 'nikolaev-arkadiy-2002-' || a.id ELSE 'nikolaev-arkadiy-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Николаев' AND first_name = 'Аркадий' AND middle_name = 'Анатольевич' AND birth_year = 2002)
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
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kulik-nikita-2005' AND s.athlete_id <> a.id)
              THEN 'kulik-nikita-2005-' || a.id ELSE 'kulik-nikita-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кулик' AND first_name = 'Никита' AND middle_name = 'Алексеевич' AND birth_year = 2005)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'mikryakov-mihail-2007' AND s.athlete_id <> a.id)
              THEN 'mikryakov-mihail-2007-' || a.id ELSE 'mikryakov-mihail-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Микряков' AND first_name = 'Михаил' AND middle_name = 'Геннадьевич' AND birth_year = 2007)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zuev-ilya-2007' AND s.athlete_id <> a.id)
              THEN 'zuev-ilya-2007-' || a.id ELSE 'zuev-ilya-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Зуев' AND first_name = 'Илья' AND middle_name = 'Александрович' AND birth_year = 2007)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'efremov-sergey-1997' AND s.athlete_id <> a.id)
              THEN 'efremov-sergey-1997-' || a.id ELSE 'efremov-sergey-1997' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ефремов' AND first_name = 'Сергей' AND middle_name = 'Евгеньевич' AND birth_year = 1997)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'dashkevich-vladimir-1984' AND s.athlete_id <> a.id)
              THEN 'dashkevich-vladimir-1984-' || a.id ELSE 'dashkevich-vladimir-1984' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Дашкевич' AND first_name = 'Владимир' AND middle_name = 'Олегович' AND birth_year = 1984)
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
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lebedev-dmitriy-2008' AND s.athlete_id <> a.id)
              THEN 'lebedev-dmitriy-2008-' || a.id ELSE 'lebedev-dmitriy-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Лебедев' AND first_name = 'Дмитрий' AND middle_name = 'Николаевич' AND birth_year = 2008)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'simashkevich-evgeniy-1991' AND s.athlete_id <> a.id)
              THEN 'simashkevich-evgeniy-1991-' || a.id ELSE 'simashkevich-evgeniy-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Симашкевич' AND first_name = 'Евгений' AND middle_name = 'Валентинович' AND birth_year = 1991)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'turischev-dmitriy-1992' AND s.athlete_id <> a.id)
              THEN 'turischev-dmitriy-1992-' || a.id ELSE 'turischev-dmitriy-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Турищев' AND first_name = 'Дмитрий' AND middle_name = 'Владимирович' AND birth_year = 1992)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kalistratov-artem-1992' AND s.athlete_id <> a.id)
              THEN 'kalistratov-artem-1992-' || a.id ELSE 'kalistratov-artem-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Калистратов' AND first_name = 'Артем' AND middle_name = 'Валерьевич' AND birth_year = 1992)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'stankovich-boyan-1988' AND s.athlete_id <> a.id)
              THEN 'stankovich-boyan-1988-' || a.id ELSE 'stankovich-boyan-1988' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Станкович' AND first_name = 'Боян' AND middle_name IS NULL AND birth_year = 1988)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'novikov-aleksandr-1992' AND s.athlete_id <> a.id)
              THEN 'novikov-aleksandr-1992-' || a.id ELSE 'novikov-aleksandr-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Новиков' AND first_name = 'Александр' AND middle_name = 'Алексеевич' AND birth_year = 1992)
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
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'vasyukova-regina-2010' AND s.athlete_id <> a.id)
              THEN 'vasyukova-regina-2010-' || a.id ELSE 'vasyukova-regina-2010' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Васюкова' AND first_name = 'Регина' AND middle_name = 'Александровна' AND birth_year = 2010)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'nynych-margarita-1996' AND s.athlete_id <> a.id)
              THEN 'nynych-margarita-1996-' || a.id ELSE 'nynych-margarita-1996' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ныныч' AND first_name = 'Маргарита' AND middle_name = 'Анатольевна' AND birth_year = 1996)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'koshurnikova-valeriya-2012' AND s.athlete_id <> a.id)
              THEN 'koshurnikova-valeriya-2012-' || a.id ELSE 'koshurnikova-valeriya-2012' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кошурникова' AND first_name = 'Валерия' AND middle_name = 'Александровна' AND birth_year = 2012)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'chernova-kira-2009' AND s.athlete_id <> a.id)
              THEN 'chernova-kira-2009-' || a.id ELSE 'chernova-kira-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Чернова' AND first_name = 'Кира' AND middle_name = 'Николаевна' AND birth_year = 2009)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'shilihina-darya-2006' AND s.athlete_id <> a.id)
              THEN 'shilihina-darya-2006-' || a.id ELSE 'shilihina-darya-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Шилихина' AND first_name = 'Дарья' AND middle_name = 'Павловна' AND birth_year = 2006)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'medenceva-darya-2004' AND s.athlete_id <> a.id)
              THEN 'medenceva-darya-2004-' || a.id ELSE 'medenceva-darya-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Меденцева' AND first_name = 'Дарья' AND middle_name = 'Александровна' AND birth_year = 2004)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'piven-aleksandra-2004' AND s.athlete_id <> a.id)
              THEN 'piven-aleksandra-2004-' || a.id ELSE 'piven-aleksandra-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Пивень' AND first_name = 'Александра' AND middle_name = 'Максимовна' AND birth_year = 2004)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'martynova-lyubov-2007' AND s.athlete_id <> a.id)
              THEN 'martynova-lyubov-2007-' || a.id ELSE 'martynova-lyubov-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Мартынова' AND first_name = 'Любовь' AND middle_name = 'Владимировна' AND birth_year = 2007)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'matveeva-elena-1974' AND s.athlete_id <> a.id)
              THEN 'matveeva-elena-1974-' || a.id ELSE 'matveeva-elena-1974' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Матвеева' AND first_name = 'Елена' AND middle_name = 'Евгеньевна' AND birth_year = 1974)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'podolskaya-anastasiya-2005' AND s.athlete_id <> a.id)
              THEN 'podolskaya-anastasiya-2005-' || a.id ELSE 'podolskaya-anastasiya-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Подольская' AND first_name = 'Анастасия' AND middle_name = 'Владимировна' AND birth_year = 2005)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ryndina-vladislava-2009' AND s.athlete_id <> a.id)
              THEN 'ryndina-vladislava-2009-' || a.id ELSE 'ryndina-vladislava-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Рындина' AND first_name = 'Владислава' AND middle_name = 'Романовна' AND birth_year = 2009)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'grigoreva-emiliya-2006' AND s.athlete_id <> a.id)
              THEN 'grigoreva-emiliya-2006-' || a.id ELSE 'grigoreva-emiliya-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Григорьева' AND first_name = 'Эмилия' AND middle_name = 'Сергеевна' AND birth_year = 2006)
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
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ermolina-irina-2008' AND s.athlete_id <> a.id)
              THEN 'ermolina-irina-2008-' || a.id ELSE 'ermolina-irina-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ермолина' AND first_name = 'Ирина' AND middle_name = 'Евгеньевна' AND birth_year = 2008)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'alyanova-viktoriya-2004' AND s.athlete_id <> a.id)
              THEN 'alyanova-viktoriya-2004-' || a.id ELSE 'alyanova-viktoriya-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Альянова' AND first_name = 'Виктория' AND middle_name = 'Евгеньевна' AND birth_year = 2004)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zabelinskaya-darya-2003' AND s.athlete_id <> a.id)
              THEN 'zabelinskaya-darya-2003-' || a.id ELSE 'zabelinskaya-darya-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Забелинская' AND first_name = 'Дарья' AND middle_name = 'Александровна' AND birth_year = 2003)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'elchaninova-veronika-2003' AND s.athlete_id <> a.id)
              THEN 'elchaninova-veronika-2003-' || a.id ELSE 'elchaninova-veronika-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ельчанинова' AND first_name = 'Вероника' AND middle_name = 'Сергеевна' AND birth_year = 2003)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sumenkova-anastasiya-2009' AND s.athlete_id <> a.id)
              THEN 'sumenkova-anastasiya-2009-' || a.id ELSE 'sumenkova-anastasiya-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Суменкова' AND first_name = 'Анастасия' AND middle_name = 'Дмитриевна' AND birth_year = 2009)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'martynova-irina-1999' AND s.athlete_id <> a.id)
              THEN 'martynova-irina-1999-' || a.id ELSE 'martynova-irina-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Мартынова' AND first_name = 'Ирина' AND middle_name = 'Александровна' AND birth_year = 1999)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'polyakova-polina-1999' AND s.athlete_id <> a.id)
              THEN 'polyakova-polina-1999-' || a.id ELSE 'polyakova-polina-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Полякова' AND first_name = 'Полина' AND middle_name = 'Сергеевна' AND birth_year = 1999)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'vyatkina-vera-1999' AND s.athlete_id <> a.id)
              THEN 'vyatkina-vera-1999-' || a.id ELSE 'vyatkina-vera-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Вяткина' AND first_name = 'Вера' AND middle_name = 'Павловна' AND birth_year = 1999)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'popova-mariya-2005' AND s.athlete_id <> a.id)
              THEN 'popova-mariya-2005-' || a.id ELSE 'popova-mariya-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Попова' AND first_name = 'Мария' AND middle_name = 'Алексеевна' AND birth_year = 2005)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'filimonova-karina-2006' AND s.athlete_id <> a.id)
              THEN 'filimonova-karina-2006-' || a.id ELSE 'filimonova-karina-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Филимонова' AND first_name = 'Карина' AND middle_name = 'Денисовна' AND birth_year = 2006)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'poberezhnaya-anna-2010' AND s.athlete_id <> a.id)
              THEN 'poberezhnaya-anna-2010-' || a.id ELSE 'poberezhnaya-anna-2010' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Побережная' AND first_name = 'Анна' AND middle_name = 'Владимировна' AND birth_year = 2010)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'vrubel-darya-2000' AND s.athlete_id <> a.id)
              THEN 'vrubel-darya-2000-' || a.id ELSE 'vrubel-darya-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Врубель' AND first_name = 'Дарья' AND middle_name = 'Васильевна' AND birth_year = 2000)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'baranova-darya-2008' AND s.athlete_id <> a.id)
              THEN 'baranova-darya-2008-' || a.id ELSE 'baranova-darya-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Баранова' AND first_name = 'Дарья' AND middle_name = 'Андреевна' AND birth_year = 2008)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'mahkamova-parvina-2007' AND s.athlete_id <> a.id)
              THEN 'mahkamova-parvina-2007-' || a.id ELSE 'mahkamova-parvina-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Махкамова' AND first_name = 'Парвина' AND middle_name = 'Маруфовна' AND birth_year = 2007)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'benidze-dzhoni-1990' AND s.athlete_id <> a.id)
              THEN 'benidze-dzhoni-1990-' || a.id ELSE 'benidze-dzhoni-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бенидзе' AND first_name = 'Джони' AND middle_name = 'Бадриевич' AND birth_year = 1990)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kuznecov-roman-2009' AND s.athlete_id <> a.id)
              THEN 'kuznecov-roman-2009-' || a.id ELSE 'kuznecov-roman-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кузнецов' AND first_name = 'Роман' AND middle_name = 'Андреевич' AND birth_year = 2009)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'manakov-trofim-2000' AND s.athlete_id <> a.id)
              THEN 'manakov-trofim-2000-' || a.id ELSE 'manakov-trofim-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Манаков' AND first_name = 'Трофим' AND middle_name = 'Анатольевич' AND birth_year = 2000)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kashkarov-artur-2005' AND s.athlete_id <> a.id)
              THEN 'kashkarov-artur-2005-' || a.id ELSE 'kashkarov-artur-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кашкаров' AND first_name = 'Артур' AND middle_name = 'Анатольевич' AND birth_year = 2005)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'mityukevich-stanislav-2008' AND s.athlete_id <> a.id)
              THEN 'mityukevich-stanislav-2008-' || a.id ELSE 'mityukevich-stanislav-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Митюкевич' AND first_name = 'Станислав' AND middle_name = 'Николаевич' AND birth_year = 2008)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'klyavlin-andrey-2006' AND s.athlete_id <> a.id)
              THEN 'klyavlin-andrey-2006-' || a.id ELSE 'klyavlin-andrey-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Клявлин' AND first_name = 'Андрей' AND middle_name = 'Викторович' AND birth_year = 2006)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zuev-vladislav-2000' AND s.athlete_id <> a.id)
              THEN 'zuev-vladislav-2000-' || a.id ELSE 'zuev-vladislav-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Зуев' AND first_name = 'Владислав' AND middle_name = 'Алексеевич' AND birth_year = 2000)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'uzyukin-anatoliy-2000' AND s.athlete_id <> a.id)
              THEN 'uzyukin-anatoliy-2000-' || a.id ELSE 'uzyukin-anatoliy-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Узюкин' AND first_name = 'Анатолий' AND middle_name = 'Эдуардович' AND birth_year = 2000)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'vasilevich-dobrynya-2000' AND s.athlete_id <> a.id)
              THEN 'vasilevich-dobrynya-2000-' || a.id ELSE 'vasilevich-dobrynya-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Василевич' AND first_name = 'Добрыня' AND middle_name = 'Андреевич' AND birth_year = 2000)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'scherbin-oleg-1989' AND s.athlete_id <> a.id)
              THEN 'scherbin-oleg-1989-' || a.id ELSE 'scherbin-oleg-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Щербин' AND first_name = 'Олег' AND middle_name = 'Владимирович' AND birth_year = 1989)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'anikushko-semen-2009' AND s.athlete_id <> a.id)
              THEN 'anikushko-semen-2009-' || a.id ELSE 'anikushko-semen-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Аникушко' AND first_name = 'Семён' AND middle_name = 'Сергеевич' AND birth_year = 2009)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'rassadin-andrey-1989' AND s.athlete_id <> a.id)
              THEN 'rassadin-andrey-1989-' || a.id ELSE 'rassadin-andrey-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Рассадин' AND first_name = 'Андрей' AND middle_name = 'Андреевич' AND birth_year = 1989)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'smirnov-daniil-2003' AND s.athlete_id <> a.id)
              THEN 'smirnov-daniil-2003-' || a.id ELSE 'smirnov-daniil-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Смирнов' AND first_name = 'Даниил' AND middle_name = 'Алексеевич' AND birth_year = 2003)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'voldaev-aleksandr-2000' AND s.athlete_id <> a.id)
              THEN 'voldaev-aleksandr-2000-' || a.id ELSE 'voldaev-aleksandr-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Волдаев' AND first_name = 'Александр' AND middle_name = 'Владимирович' AND birth_year = 2000)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'baldin-aleksandr-1993' AND s.athlete_id <> a.id)
              THEN 'baldin-aleksandr-1993-' || a.id ELSE 'baldin-aleksandr-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Балдин' AND first_name = 'Александр' AND middle_name = 'Васильевич' AND birth_year = 1993)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sedyh-ilya-2004' AND s.athlete_id <> a.id)
              THEN 'sedyh-ilya-2004-' || a.id ELSE 'sedyh-ilya-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Седых' AND first_name = 'Илья' AND middle_name = 'Александрович' AND birth_year = 2004)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lyubin-valentin-2009' AND s.athlete_id <> a.id)
              THEN 'lyubin-valentin-2009-' || a.id ELSE 'lyubin-valentin-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Любин' AND first_name = 'Валентин' AND middle_name = 'Сергеевич' AND birth_year = 2009)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'baer-pavel-1983' AND s.athlete_id <> a.id)
              THEN 'baer-pavel-1983-' || a.id ELSE 'baer-pavel-1983' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Баер' AND first_name = 'Павел' AND middle_name = 'Арнольдович' AND birth_year = 1983)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'suleymanov-movsar-1989' AND s.athlete_id <> a.id)
              THEN 'suleymanov-movsar-1989-' || a.id ELSE 'suleymanov-movsar-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Сулейманов' AND first_name = 'Мовсар' AND middle_name = 'Мусаевич' AND birth_year = 1989)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'bobrov-vladimir-1989' AND s.athlete_id <> a.id)
              THEN 'bobrov-vladimir-1989-' || a.id ELSE 'bobrov-vladimir-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бобров' AND first_name = 'Владимир' AND middle_name = 'Сергеевич' AND birth_year = 1989)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'bessonov-maksim-2004' AND s.athlete_id <> a.id)
              THEN 'bessonov-maksim-2004-' || a.id ELSE 'bessonov-maksim-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бессонов' AND first_name = 'Максим' AND middle_name = 'Вячеславович' AND birth_year = 2004)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kurdyukov-vasiliy-1997' AND s.athlete_id <> a.id)
              THEN 'kurdyukov-vasiliy-1997-' || a.id ELSE 'kurdyukov-vasiliy-1997' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Курдюков' AND first_name = 'Василий' AND middle_name = 'Сергеевич' AND birth_year = 1997)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'volodin-denis-1993' AND s.athlete_id <> a.id)
              THEN 'volodin-denis-1993-' || a.id ELSE 'volodin-denis-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Володин' AND first_name = 'Денис' AND middle_name = 'Игоревич' AND birth_year = 1993)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'tashlanov-ilya-1987' AND s.athlete_id <> a.id)
              THEN 'tashlanov-ilya-1987-' || a.id ELSE 'tashlanov-ilya-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ташланов' AND first_name = 'Илья' AND middle_name = 'Станиславович' AND birth_year = 1987)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lucenko-nikita-2003' AND s.athlete_id <> a.id)
              THEN 'lucenko-nikita-2003-' || a.id ELSE 'lucenko-nikita-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Луценко' AND first_name = 'Никита' AND middle_name = 'Ильич' AND birth_year = 2003)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kozhevnikov-sergey-2008' AND s.athlete_id <> a.id)
              THEN 'kozhevnikov-sergey-2008-' || a.id ELSE 'kozhevnikov-sergey-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кожевников' AND first_name = 'Сергей' AND middle_name = 'Павлович' AND birth_year = 2008)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'plotnikov-vyacheslav-1998' AND s.athlete_id <> a.id)
              THEN 'plotnikov-vyacheslav-1998-' || a.id ELSE 'plotnikov-vyacheslav-1998' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Плотников' AND first_name = 'Вячеслав' AND middle_name = 'Евгеньевич' AND birth_year = 1998)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kosuhin-vladislav-2004' AND s.athlete_id <> a.id)
              THEN 'kosuhin-vladislav-2004-' || a.id ELSE 'kosuhin-vladislav-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Косухин' AND first_name = 'Владислав' AND middle_name = 'Владимирович' AND birth_year = 2004)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'lavrikov-vyacheslav-2005' AND s.athlete_id <> a.id)
              THEN 'lavrikov-vyacheslav-2005-' || a.id ELSE 'lavrikov-vyacheslav-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Лавриков' AND first_name = 'Вячеслав' AND middle_name = 'Дмитриевич' AND birth_year = 2005)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'malikov-danil-2001' AND s.athlete_id <> a.id)
              THEN 'malikov-danil-2001-' || a.id ELSE 'malikov-danil-2001' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Маликов' AND first_name = 'Данил' AND middle_name = 'Дамирович' AND birth_year = 2001)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'muhitov-andrey-1999' AND s.athlete_id <> a.id)
              THEN 'muhitov-andrey-1999-' || a.id ELSE 'muhitov-andrey-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Мухитов' AND first_name = 'Андрей' AND middle_name = 'Вячеславович' AND birth_year = 1999)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'litvinov-vitaliy-1993' AND s.athlete_id <> a.id)
              THEN 'litvinov-vitaliy-1993-' || a.id ELSE 'litvinov-vitaliy-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Литвинов' AND first_name = 'Виталий' AND middle_name = 'Александрович' AND birth_year = 1993)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'vstrov-denis-1989' AND s.athlete_id <> a.id)
              THEN 'vstrov-denis-1989-' || a.id ELSE 'vstrov-denis-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Встров' AND first_name = 'Денис' AND middle_name = 'Сергеевич' AND birth_year = 1989)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'salihov-rustam-1982' AND s.athlete_id <> a.id)
              THEN 'salihov-rustam-1982-' || a.id ELSE 'salihov-rustam-1982' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Салихов' AND first_name = 'Рустам' AND middle_name = 'Ренатович' AND birth_year = 1982)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'gurov-vladimir-1978' AND s.athlete_id <> a.id)
              THEN 'gurov-vladimir-1978-' || a.id ELSE 'gurov-vladimir-1978' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Гуров' AND first_name = 'Владимир' AND middle_name = 'Анатольевич' AND birth_year = 1978)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'piven-andrey-2003' AND s.athlete_id <> a.id)
              THEN 'piven-andrey-2003-' || a.id ELSE 'piven-andrey-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Пивень' AND first_name = 'Андрей' AND middle_name = 'Владимирович' AND birth_year = 2003)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ivanov-aleksandr-2008' AND s.athlete_id <> a.id)
              THEN 'ivanov-aleksandr-2008-' || a.id ELSE 'ivanov-aleksandr-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Александр' AND middle_name = 'Сергеевич' AND birth_year = 2008)
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
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'samohvalov-ilya-2007' AND s.athlete_id <> a.id)
              THEN 'samohvalov-ilya-2007-' || a.id ELSE 'samohvalov-ilya-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Самохвалов' AND first_name = 'Илья' AND middle_name = 'Дмитриевич' AND birth_year = 2007)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'markov-ivan-1995' AND s.athlete_id <> a.id)
              THEN 'markov-ivan-1995-' || a.id ELSE 'markov-ivan-1995' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Марков' AND first_name = 'Иван' AND middle_name = 'Эдуардович' AND birth_year = 1995)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'rozmaznin-ilya-2000' AND s.athlete_id <> a.id)
              THEN 'rozmaznin-ilya-2000-' || a.id ELSE 'rozmaznin-ilya-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Розмазнин' AND first_name = 'Илья' AND middle_name = 'Владимирович' AND birth_year = 2000)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'tarverdieva-mariya-1986' AND s.athlete_id <> a.id)
              THEN 'tarverdieva-mariya-1986-' || a.id ELSE 'tarverdieva-mariya-1986' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Тарвердиева' AND first_name = 'Мария' AND middle_name = 'Алексеевна' AND birth_year = 1986)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'bolotova-elizaveta-2007' AND s.athlete_id <> a.id)
              THEN 'bolotova-elizaveta-2007-' || a.id ELSE 'bolotova-elizaveta-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Болотова' AND first_name = 'Елизавета' AND middle_name = 'Сергеевна' AND birth_year = 2007)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'puzankova-anastasiya-2006' AND s.athlete_id <> a.id)
              THEN 'puzankova-anastasiya-2006-' || a.id ELSE 'puzankova-anastasiya-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Пузанкова' AND first_name = 'Анастасия' AND middle_name = 'Константиновна' AND birth_year = 2006)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sorokina-olga-2003' AND s.athlete_id <> a.id)
              THEN 'sorokina-olga-2003-' || a.id ELSE 'sorokina-olga-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Сорокина' AND first_name = 'Ольга' AND middle_name = 'Андреевна' AND birth_year = 2003)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'badashkova-nina-1991' AND s.athlete_id <> a.id)
              THEN 'badashkova-nina-1991-' || a.id ELSE 'badashkova-nina-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бадашкова' AND first_name = 'Нина' AND middle_name = 'Константиновна' AND birth_year = 1991)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'popova-olga-2002' AND s.athlete_id <> a.id)
              THEN 'popova-olga-2002-' || a.id ELSE 'popova-olga-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Попова' AND first_name = 'Ольга' AND middle_name = 'Сергеевна' AND birth_year = 2002)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'firuleva-vasilisa-2004' AND s.athlete_id <> a.id)
              THEN 'firuleva-vasilisa-2004-' || a.id ELSE 'firuleva-vasilisa-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Фирулева' AND first_name = 'Василиса' AND middle_name = 'Владимировна' AND birth_year = 2004)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'novikova-polina-2012' AND s.athlete_id <> a.id)
              THEN 'novikova-polina-2012-' || a.id ELSE 'novikova-polina-2012' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Новикова' AND first_name = 'Полина' AND middle_name = 'Феликсовна' AND birth_year = 2012)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'hovalko-vasiliy-1993' AND s.athlete_id <> a.id)
              THEN 'hovalko-vasiliy-1993-' || a.id ELSE 'hovalko-vasiliy-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ховалко' AND first_name = 'Василий' AND middle_name = 'Михайлович' AND birth_year = 1993)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ilyasov-kaken-1993' AND s.athlete_id <> a.id)
              THEN 'ilyasov-kaken-1993-' || a.id ELSE 'ilyasov-kaken-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ильясов' AND first_name = 'Какен' AND middle_name = 'Канатович' AND birth_year = 1993)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'polovnikov-pavel-2002' AND s.athlete_id <> a.id)
              THEN 'polovnikov-pavel-2002-' || a.id ELSE 'polovnikov-pavel-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Половников' AND first_name = 'Павел' AND middle_name = 'Викторович' AND birth_year = 2002)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'abrosov-aleksey-1991' AND s.athlete_id <> a.id)
              THEN 'abrosov-aleksey-1991-' || a.id ELSE 'abrosov-aleksey-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Абросов' AND first_name = 'Алексей' AND middle_name = 'Владимирович' AND birth_year = 1991)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'benidze-spartak-2002' AND s.athlete_id <> a.id)
              THEN 'benidze-spartak-2002-' || a.id ELSE 'benidze-spartak-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бенидзе' AND first_name = 'Спартак' AND middle_name = 'Бадриевич' AND birth_year = 2002)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'uzokin-anatoliy-2000' AND s.athlete_id <> a.id)
              THEN 'uzokin-anatoliy-2000-' || a.id ELSE 'uzokin-anatoliy-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Узокин' AND first_name = 'Анатолий' AND middle_name = 'Эдуардович' AND birth_year = 2000)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'smagulov-nursultan-1999' AND s.athlete_id <> a.id)
              THEN 'smagulov-nursultan-1999-' || a.id ELSE 'smagulov-nursultan-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Смагулов' AND first_name = 'Нурсултан' AND middle_name = 'Шайзандинович' AND birth_year = 1999)
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
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'cybaev-ilya-1999' AND s.athlete_id <> a.id)
              THEN 'cybaev-ilya-1999-' || a.id ELSE 'cybaev-ilya-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Цыбаев' AND first_name = 'Илья' AND middle_name = 'Алексеевич' AND birth_year = 1999)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kulikov-sergey-1985' AND s.athlete_id <> a.id)
              THEN 'kulikov-sergey-1985-' || a.id ELSE 'kulikov-sergey-1985' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Куликов' AND first_name = 'Сергей' AND middle_name = 'Александрович' AND birth_year = 1985)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'maschenko-oleg-1983' AND s.athlete_id <> a.id)
              THEN 'maschenko-oleg-1983-' || a.id ELSE 'maschenko-oleg-1983' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Мащенко' AND first_name = 'Олег' AND middle_name = 'Валерьевич' AND birth_year = 1983)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'balashov-maksim-1990' AND s.athlete_id <> a.id)
              THEN 'balashov-maksim-1990-' || a.id ELSE 'balashov-maksim-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Балашов' AND first_name = 'Максим' AND middle_name = 'Юрьевич' AND birth_year = 1990)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'suslov-aleksandr-1986' AND s.athlete_id <> a.id)
              THEN 'suslov-aleksandr-1986-' || a.id ELSE 'suslov-aleksandr-1986' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Суслов' AND first_name = 'Александр' AND middle_name = 'Владимирович' AND birth_year = 1986)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'voronov-ivan-1991' AND s.athlete_id <> a.id)
              THEN 'voronov-ivan-1991-' || a.id ELSE 'voronov-ivan-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Воронов' AND first_name = 'Иван' AND middle_name = 'Андреевич' AND birth_year = 1991)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'paklin-pavel-1990' AND s.athlete_id <> a.id)
              THEN 'paklin-pavel-1990-' || a.id ELSE 'paklin-pavel-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Паклин' AND first_name = 'Павел' AND middle_name = 'Алексеевич' AND birth_year = 1990)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'karpov-vladislav-1999' AND s.athlete_id <> a.id)
              THEN 'karpov-vladislav-1999-' || a.id ELSE 'karpov-vladislav-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Карпов' AND first_name = 'Владислав' AND middle_name = 'Алексеевич' AND birth_year = 1999)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'bacmanov-yaroslav-2010' AND s.athlete_id <> a.id)
              THEN 'bacmanov-yaroslav-2010-' || a.id ELSE 'bacmanov-yaroslav-2010' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бацманов' AND first_name = 'Ярослав' AND middle_name = 'Русланович' AND birth_year = 2010)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ivanov-aleksey-1995' AND s.athlete_id <> a.id)
              THEN 'ivanov-aleksey-1995-' || a.id ELSE 'ivanov-aleksey-1995' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Алексей' AND middle_name = 'Валерьевич' AND birth_year = 1995)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'shaishnikov-daniil-2008' AND s.athlete_id <> a.id)
              THEN 'shaishnikov-daniil-2008-' || a.id ELSE 'shaishnikov-daniil-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Шаишников' AND first_name = 'Даниил' AND middle_name = 'Андреевич' AND birth_year = 2008)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'alekseev-radif-1989' AND s.athlete_id <> a.id)
              THEN 'alekseev-radif-1989-' || a.id ELSE 'alekseev-radif-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Алексеев' AND first_name = 'Радиф' AND middle_name = 'Дамирович' AND birth_year = 1989)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'stepanov-sergey-1993' AND s.athlete_id <> a.id)
              THEN 'stepanov-sergey-1993-' || a.id ELSE 'stepanov-sergey-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Степанов' AND first_name = 'Сергей' AND middle_name = 'Владимирович' AND birth_year = 1993)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ivanov-evgeniy-1987' AND s.athlete_id <> a.id)
              THEN 'ivanov-evgeniy-1987-' || a.id ELSE 'ivanov-evgeniy-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Евгений' AND middle_name = 'Игоревич' AND birth_year = 1987)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ginda-denis-1979' AND s.athlete_id <> a.id)
              THEN 'ginda-denis-1979-' || a.id ELSE 'ginda-denis-1979' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Гинда' AND first_name = 'Денис' AND middle_name = 'Петрович' AND birth_year = 1979)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'sherin-roman-1992' AND s.athlete_id <> a.id)
              THEN 'sherin-roman-1992-' || a.id ELSE 'sherin-roman-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Шерин' AND first_name = 'Роман' AND middle_name = 'Витальевич' AND birth_year = 1992)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zaydenzal-artem-1987' AND s.athlete_id <> a.id)
              THEN 'zaydenzal-artem-1987-' || a.id ELSE 'zaydenzal-artem-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Зайдензал' AND first_name = 'Артём' AND middle_name = 'Николаевич' AND birth_year = 1987)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ryskin-sergey-1995' AND s.athlete_id <> a.id)
              THEN 'ryskin-sergey-1995-' || a.id ELSE 'ryskin-sergey-1995' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Рыскин' AND first_name = 'Сергей' AND middle_name = 'Михайлович' AND birth_year = 1995)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'krestyaninov-viktor-2000' AND s.athlete_id <> a.id)
              THEN 'krestyaninov-viktor-2000-' || a.id ELSE 'krestyaninov-viktor-2000' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Крестьянинов' AND first_name = 'Виктор' AND middle_name = 'Александрович' AND birth_year = 2000)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'smirnov-ruslan-1994' AND s.athlete_id <> a.id)
              THEN 'smirnov-ruslan-1994-' || a.id ELSE 'smirnov-ruslan-1994' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Смирнов' AND first_name = 'Руслан' AND middle_name = 'Сергеевич' AND birth_year = 1994)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zagorodnev-maksim-1992' AND s.athlete_id <> a.id)
              THEN 'zagorodnev-maksim-1992-' || a.id ELSE 'zagorodnev-maksim-1992' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Загороднев' AND first_name = 'Максим' AND middle_name = 'Олегович' AND birth_year = 1992)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'bondarev-dmitriy-1986' AND s.athlete_id <> a.id)
              THEN 'bondarev-dmitriy-1986-' || a.id ELSE 'bondarev-dmitriy-1986' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бондарев' AND first_name = 'Дмитрий' AND middle_name = 'Александрович' AND birth_year = 1986)
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
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'bas-denis-2007' AND s.athlete_id <> a.id)
              THEN 'bas-denis-2007-' || a.id ELSE 'bas-denis-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бас' AND first_name = 'Денис' AND middle_name = 'Николаевич' AND birth_year = 2007)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'shamara-leonard-1974' AND s.athlete_id <> a.id)
              THEN 'shamara-leonard-1974-' || a.id ELSE 'shamara-leonard-1974' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Шамара' AND first_name = 'Леонард' AND middle_name = 'Леонидович' AND birth_year = 1974)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'spesivcev-danila-2003' AND s.athlete_id <> a.id)
              THEN 'spesivcev-danila-2003-' || a.id ELSE 'spesivcev-danila-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Спесивцев' AND first_name = 'Данила' AND middle_name = 'Владимирович' AND birth_year = 2003)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'pozdeev-andrey-1990' AND s.athlete_id <> a.id)
              THEN 'pozdeev-andrey-1990-' || a.id ELSE 'pozdeev-andrey-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Поздеев' AND first_name = 'Андрей' AND middle_name = 'Николаевич' AND birth_year = 1990)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'noskov-andrey-1993' AND s.athlete_id <> a.id)
              THEN 'noskov-andrey-1993-' || a.id ELSE 'noskov-andrey-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Носков' AND first_name = 'Андрей' AND middle_name = 'Николаевич' AND birth_year = 1993)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'medvedev-nikolay-2006' AND s.athlete_id <> a.id)
              THEN 'medvedev-nikolay-2006-' || a.id ELSE 'medvedev-nikolay-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Медведев' AND first_name = 'Николай' AND middle_name = 'Михайлович' AND birth_year = 2006)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'filippov-maksim-1993' AND s.athlete_id <> a.id)
              THEN 'filippov-maksim-1993-' || a.id ELSE 'filippov-maksim-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Филиппов' AND first_name = 'Максим' AND middle_name = 'Юрьевич' AND birth_year = 1993)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'davydov-anton-1982' AND s.athlete_id <> a.id)
              THEN 'davydov-anton-1982-' || a.id ELSE 'davydov-anton-1982' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Давыдов' AND first_name = 'Антон' AND middle_name = 'Александрович' AND birth_year = 1982)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kupsh-denis-2004' AND s.athlete_id <> a.id)
              THEN 'kupsh-denis-2004-' || a.id ELSE 'kupsh-denis-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Купш' AND first_name = 'Денис' AND middle_name = 'Аркадьевич' AND birth_year = 2004)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kudashev-denis-1988' AND s.athlete_id <> a.id)
              THEN 'kudashev-denis-1988-' || a.id ELSE 'kudashev-denis-1988' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кудашев' AND first_name = 'Денис' AND middle_name = 'Андреевич' AND birth_year = 1988)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'chupin-nikita-1988' AND s.athlete_id <> a.id)
              THEN 'chupin-nikita-1988-' || a.id ELSE 'chupin-nikita-1988' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Чупин' AND first_name = 'Никита' AND middle_name = 'Владимирович' AND birth_year = 1988)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'shendo-nikita-1998' AND s.athlete_id <> a.id)
              THEN 'shendo-nikita-1998-' || a.id ELSE 'shendo-nikita-1998' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Шендо' AND first_name = 'Никита' AND middle_name = 'Сергеевич' AND birth_year = 1998)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'nechunaev-aleksandr-1993' AND s.athlete_id <> a.id)
              THEN 'nechunaev-aleksandr-1993-' || a.id ELSE 'nechunaev-aleksandr-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Нечунаев' AND first_name = 'Александр' AND middle_name = 'Сергеевич' AND birth_year = 1993)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'orlov-sergey-2005' AND s.athlete_id <> a.id)
              THEN 'orlov-sergey-2005-' || a.id ELSE 'orlov-sergey-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Орлов' AND first_name = 'Сергей' AND middle_name = 'Александрович' AND birth_year = 2005)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'denisov-ivan-1982' AND s.athlete_id <> a.id)
              THEN 'denisov-ivan-1982-' || a.id ELSE 'denisov-ivan-1982' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Денисов' AND first_name = 'Иван' AND middle_name = 'Николаевич' AND birth_year = 1982)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'pavlov-aleksandr-1994' AND s.athlete_id <> a.id)
              THEN 'pavlov-aleksandr-1994-' || a.id ELSE 'pavlov-aleksandr-1994' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Павлов' AND first_name = 'Александр' AND middle_name = 'Станиславович' AND birth_year = 1994)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kulikov-vladislav-2006' AND s.athlete_id <> a.id)
              THEN 'kulikov-vladislav-2006-' || a.id ELSE 'kulikov-vladislav-2006' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Куликов' AND first_name = 'Владислав' AND middle_name = 'Александрович' AND birth_year = 2006)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'grigorev-andrey-1987' AND s.athlete_id <> a.id)
              THEN 'grigorev-andrey-1987-' || a.id ELSE 'grigorev-andrey-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Григорьев' AND first_name = 'Андрей' AND middle_name = 'Анатольевич' AND birth_year = 1987)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'shishov-mihail-1982' AND s.athlete_id <> a.id)
              THEN 'shishov-mihail-1982-' || a.id ELSE 'shishov-mihail-1982' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Шишов' AND first_name = 'Михаил' AND middle_name = 'Александрович' AND birth_year = 1982)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'usatov-nikolay-1988' AND s.athlete_id <> a.id)
              THEN 'usatov-nikolay-1988-' || a.id ELSE 'usatov-nikolay-1988' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Усатов' AND first_name = 'Николай' AND middle_name = 'Владимирович' AND birth_year = 1988)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'gubko-dmitriy-1987' AND s.athlete_id <> a.id)
              THEN 'gubko-dmitriy-1987-' || a.id ELSE 'gubko-dmitriy-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Губко' AND first_name = 'Дмитрий' AND middle_name = 'Сергеевич' AND birth_year = 1987)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'zhura-aleksandra-1988' AND s.athlete_id <> a.id)
              THEN 'zhura-aleksandra-1988-' || a.id ELSE 'zhura-aleksandra-1988' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Жура' AND first_name = 'Александра' AND middle_name = 'Михайловна' AND birth_year = 1988)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'scherbina-dzhanita-1991' AND s.athlete_id <> a.id)
              THEN 'scherbina-dzhanita-1991-' || a.id ELSE 'scherbina-dzhanita-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Щербина' AND first_name = 'Джанита' AND middle_name = 'Вадимовна' AND birth_year = 1991)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'balabanova-(mazhaeva)-1999' AND s.athlete_id <> a.id)
              THEN 'balabanova-(mazhaeva)-1999-' || a.id ELSE 'balabanova-(mazhaeva)-1999' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Балабанова' AND first_name = '(Мажаева)' AND middle_name = 'Наталия Евгеньевна' AND birth_year = 1999)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ivanova-alisa-1997' AND s.athlete_id <> a.id)
              THEN 'ivanova-alisa-1997-' || a.id ELSE 'ivanova-alisa-1997' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Иванова' AND first_name = 'Алиса' AND middle_name = 'Валерьевна' AND birth_year = 1997)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'gladysheva-darya-2004' AND s.athlete_id <> a.id)
              THEN 'gladysheva-darya-2004-' || a.id ELSE 'gladysheva-darya-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Гладышева' AND first_name = 'Дарья' AND middle_name = 'Алексеевна' AND birth_year = 2004)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'karcova-tatyana-1981' AND s.athlete_id <> a.id)
              THEN 'karcova-tatyana-1981-' || a.id ELSE 'karcova-tatyana-1981' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Карцова' AND first_name = 'Татьяна' AND middle_name = 'Валерьевна' AND birth_year = 1981)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'koneva-liliya-2009' AND s.athlete_id <> a.id)
              THEN 'koneva-liliya-2009-' || a.id ELSE 'koneva-liliya-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Конева' AND first_name = 'Лилия' AND middle_name = 'Алексеевна' AND birth_year = 2009)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'belous-anna-2001' AND s.athlete_id <> a.id)
              THEN 'belous-anna-2001-' || a.id ELSE 'belous-anna-2001' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Белоус' AND first_name = 'Анна' AND middle_name = 'Сергеевна' AND birth_year = 2001)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'husnudinova-mariya-2004' AND s.athlete_id <> a.id)
              THEN 'husnudinova-mariya-2004-' || a.id ELSE 'husnudinova-mariya-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Хуснудинова' AND first_name = 'Мария' AND middle_name = 'Петровна' AND birth_year = 2004)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'alloyarova-milana-2002' AND s.athlete_id <> a.id)
              THEN 'alloyarova-milana-2002-' || a.id ELSE 'alloyarova-milana-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Аллоярова' AND first_name = 'Милана' AND middle_name = 'Борисовна' AND birth_year = 2002)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'dementeva-natalya-2010' AND s.athlete_id <> a.id)
              THEN 'dementeva-natalya-2010-' || a.id ELSE 'dementeva-natalya-2010' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Дементьева' AND first_name = 'Наталья' AND middle_name = 'Сергеевна' AND birth_year = 2010)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'tyulyaeva-diana-2010' AND s.athlete_id <> a.id)
              THEN 'tyulyaeva-diana-2010-' || a.id ELSE 'tyulyaeva-diana-2010' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Тюляева' AND first_name = 'Диана' AND middle_name = 'Александровна' AND birth_year = 2010)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'koptyaeva-karina-2007' AND s.athlete_id <> a.id)
              THEN 'koptyaeva-karina-2007-' || a.id ELSE 'koptyaeva-karina-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Коптяева' AND first_name = 'Карина' AND middle_name = 'Мансуровна' AND birth_year = 2007)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'dedyuhina-kseniya-1990' AND s.athlete_id <> a.id)
              THEN 'dedyuhina-kseniya-1990-' || a.id ELSE 'dedyuhina-kseniya-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Дедюхина' AND first_name = 'Ксения' AND middle_name = 'Игоревна' AND birth_year = 1990)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'stepanova-oksana-1990' AND s.athlete_id <> a.id)
              THEN 'stepanova-oksana-1990-' || a.id ELSE 'stepanova-oksana-1990' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Степанова' AND first_name = 'Оксана' AND middle_name = 'Анатольевна' AND birth_year = 1990)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'burmakina-ekaterina-2005' AND s.athlete_id <> a.id)
              THEN 'burmakina-ekaterina-2005-' || a.id ELSE 'burmakina-ekaterina-2005' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бурмакина' AND first_name = 'Екатерина' AND middle_name = 'Сергеевна' AND birth_year = 2005)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'chesnokova-ekaterina-1996' AND s.athlete_id <> a.id)
              THEN 'chesnokova-ekaterina-1996-' || a.id ELSE 'chesnokova-ekaterina-1996' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Чеснокова' AND first_name = 'Екатерина' AND middle_name = 'Игоревна' AND birth_year = 1996)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'perepletova-yana-2009' AND s.athlete_id <> a.id)
              THEN 'perepletova-yana-2009-' || a.id ELSE 'perepletova-yana-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Переплетова' AND first_name = 'Яна' AND middle_name = 'Васильевна' AND birth_year = 2009)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'basharova-viktoriya-1993' AND s.athlete_id <> a.id)
              THEN 'basharova-viktoriya-1993-' || a.id ELSE 'basharova-viktoriya-1993' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Башарова' AND first_name = 'Виктория' AND middle_name = 'Васильевна' AND birth_year = 1993)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'benidze-elizaveta-2002' AND s.athlete_id <> a.id)
              THEN 'benidze-elizaveta-2002-' || a.id ELSE 'benidze-elizaveta-2002' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бенидзе' AND first_name = 'Елизавета' AND middle_name = 'Бадриевна' AND birth_year = 2002)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'barbakova-natalya-1984' AND s.athlete_id <> a.id)
              THEN 'barbakova-natalya-1984-' || a.id ELSE 'barbakova-natalya-1984' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Барбакова' AND first_name = 'Наталья' AND middle_name = 'Александровна' AND birth_year = 1984)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'firsa-anna-2003' AND s.athlete_id <> a.id)
              THEN 'firsa-anna-2003-' || a.id ELSE 'firsa-anna-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Фирса' AND first_name = 'Анна' AND middle_name = 'Сергеевна' AND birth_year = 2003)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ivanova-nina-1988' AND s.athlete_id <> a.id)
              THEN 'ivanova-nina-1988-' || a.id ELSE 'ivanova-nina-1988' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Иванова' AND first_name = 'Нина' AND middle_name = 'Владимировна' AND birth_year = 1988)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'potapova-anastasiya-2004' AND s.athlete_id <> a.id)
              THEN 'potapova-anastasiya-2004-' || a.id ELSE 'potapova-anastasiya-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Потапова' AND first_name = 'Анастасия' AND middle_name = 'Михайловна' AND birth_year = 2004)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kalugina-irina-2008' AND s.athlete_id <> a.id)
              THEN 'kalugina-irina-2008-' || a.id ELSE 'kalugina-irina-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Калугина' AND first_name = 'Ирина' AND middle_name = 'Вячеславовна' AND birth_year = 2008)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'plechova-karina-2007' AND s.athlete_id <> a.id)
              THEN 'plechova-karina-2007-' || a.id ELSE 'plechova-karina-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Плечова' AND first_name = 'Карина' AND middle_name = 'Юрьевна' AND birth_year = 2007)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'rumyanceva-darya-2003' AND s.athlete_id <> a.id)
              THEN 'rumyanceva-darya-2003-' || a.id ELSE 'rumyanceva-darya-2003' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Румянцева' AND first_name = 'Дарья' AND middle_name = 'Дмитриевна' AND birth_year = 2003)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'androsova-marina-2007' AND s.athlete_id <> a.id)
              THEN 'androsova-marina-2007-' || a.id ELSE 'androsova-marina-2007' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Андросова' AND first_name = 'Марина' AND middle_name = 'Евгеньевна' AND birth_year = 2007)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'vert-elena-1991' AND s.athlete_id <> a.id)
              THEN 'vert-elena-1991-' || a.id ELSE 'vert-elena-1991' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Верт' AND first_name = 'Елена' AND middle_name = 'Сергеевна' AND birth_year = 1991)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'burova-margarita-2009' AND s.athlete_id <> a.id)
              THEN 'burova-margarita-2009-' || a.id ELSE 'burova-margarita-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Бурова' AND first_name = 'Маргарита' AND middle_name = 'Андреевна' AND birth_year = 2009)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kuhareva-mariya-1989' AND s.athlete_id <> a.id)
              THEN 'kuhareva-mariya-1989-' || a.id ELSE 'kuhareva-mariya-1989' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кухарева' AND first_name = 'Мария' AND middle_name = 'Сергеевна' AND birth_year = 1989)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'ostrovskaya-nadezhda-1985' AND s.athlete_id <> a.id)
              THEN 'ostrovskaya-nadezhda-1985-' || a.id ELSE 'ostrovskaya-nadezhda-1985' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Островская' AND first_name = 'Надежда' AND middle_name = 'Аркадьевна' AND birth_year = 1985)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kopylova-regina-2001' AND s.athlete_id <> a.id)
              THEN 'kopylova-regina-2001-' || a.id ELSE 'kopylova-regina-2001' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Копылова' AND first_name = 'Регина' AND middle_name = 'Геннадьевна' AND birth_year = 2001)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'hodunova-irina-1985' AND s.athlete_id <> a.id)
              THEN 'hodunova-irina-1985-' || a.id ELSE 'hodunova-irina-1985' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Ходунова' AND first_name = 'Ирина' AND middle_name = 'Геннадьевна' AND birth_year = 1985)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'skorobogatova-yuliya-1987' AND s.athlete_id <> a.id)
              THEN 'skorobogatova-yuliya-1987-' || a.id ELSE 'skorobogatova-yuliya-1987' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Скоробогатова' AND first_name = 'Юлия' AND middle_name = 'Владимировна' AND birth_year = 1987)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kuzmicheva-kseniya-2004' AND s.athlete_id <> a.id)
              THEN 'kuzmicheva-kseniya-2004-' || a.id ELSE 'kuzmicheva-kseniya-2004' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кузьмичева' AND first_name = 'Ксения' AND middle_name = 'Сергеевна' AND birth_year = 2004)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'kravcova-elizaveta-2009' AND s.athlete_id <> a.id)
              THEN 'kravcova-elizaveta-2009-' || a.id ELSE 'kravcova-elizaveta-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Кравцова' AND first_name = 'Елизавета' AND middle_name = 'Максимовна' AND birth_year = 2009)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'vertinskaya-anna-2009' AND s.athlete_id <> a.id)
              THEN 'vertinskaya-anna-2009-' || a.id ELSE 'vertinskaya-anna-2009' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Вертинская' AND first_name = 'Анна' AND middle_name = 'Алексеевна' AND birth_year = 2009)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);
INSERT INTO athlete_slugs (slug, athlete_id)
  SELECT CASE WHEN EXISTS (SELECT 1 FROM athlete_slugs s WHERE s.slug = 'redinger-aleksandra-2008' AND s.athlete_id <> a.id)
              THEN 'redinger-aleksandra-2008-' || a.id ELSE 'redinger-aleksandra-2008' END, a.id
    FROM athletes a WHERE a.id = (SELECT id FROM athletes WHERE last_name = 'Редингер' AND first_name = 'Александра' AND middle_name = 'Ивановна' AND birth_year = 2008)
     AND NOT EXISTS (SELECT 1 FROM athlete_slugs s2 WHERE s2.athlete_id = a.id);

INSERT INTO results (id, category_id, athlete_id, place, total_reps, points, body_weight_kg, rank_achieved_id, discipline_id, bell_kg, hands, time_limit_min, competition_id, event_date, raw_name, raw_club, raw_region, protocol_id, source_page) VALUES
  (1, 1, (SELECT id FROM athletes WHERE last_name = 'Бутенко' AND first_name = 'Евгений' AND middle_name = 'Александрович' AND birth_year = 1995), 1, 81, NULL, 62.65, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Бутенко Евгений Александрович', 'ГАУ НСО «РЦСП СК и СР»', 'Новосибирская область', 1, 2),
  (2, 1, (SELECT id FROM athletes WHERE last_name = 'Сиразетдинов' AND first_name = 'Данил' AND middle_name = 'Ильфатович' AND birth_year = 2007), 2, 61, NULL, 62.05, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Сиразетдинов Данил Ильфатович', 'МАУ ДО «СШ «Прикамье» г. Перми', 'Пермский край', 1, 2),
  (3, 1, (SELECT id FROM athletes WHERE last_name = 'Якушев' AND first_name = 'Роман' AND middle_name = 'Владимирович' AND birth_year = 2002), 3, 56, NULL, 62.7, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Якушев Роман Владимирович', 'ВС РФ', 'Республика Бурятия', 1, 2),
  (4, 1, (SELECT id FROM athletes WHERE last_name = 'Руднев' AND first_name = 'Руслан' AND middle_name = 'Сергеевич' AND birth_year = 1994), 4, 55, NULL, 62.3, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Руднев Руслан Сергеевич', 'РОО ФГС г. САНКТ ПЕТЕРБУРГ', 'г. Санкт-Петербург', 1, 2),
  (5, 1, (SELECT id FROM athletes WHERE last_name = 'Недорезов' AND first_name = 'Василий' AND middle_name = 'Сергеевич' AND birth_year = 1992), 5, 54, NULL, 62.8, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Недорезов Василий Сергеевич', 'МБУ ДО «Онохойская СШ»', 'Республика Бурятия', 1, 2),
  (6, 1, (SELECT id FROM athletes WHERE last_name = 'Жбанов' AND first_name = 'Алексей' AND middle_name = 'Александрович' AND birth_year = 1986), 6, 52, NULL, 62.95, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Жбанов Алексей Александрович', 'СДСШОР им. Краевского', 'г. Санкт-Петербург', 1, 2),
  (7, 1, (SELECT id FROM athletes WHERE last_name = 'Кормилицын' AND first_name = 'Иван' AND middle_name = 'Николаевич' AND birth_year = 2010), 7, 44, NULL, 62.75, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Кормилицын Иван Николаевич', 'СШОР «Маршал»', 'Калужская область', 1, 2),
  (8, 1, (SELECT id FROM athletes WHERE last_name = 'Жалов' AND first_name = 'Ярослав' AND middle_name = 'Борисович' AND birth_year = 2007), 8, 38, NULL, 61.7, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Жалов Ярослав Борисович', 'МБУ ДО СШОР «Югория» им. А.А. Пилояна', 'Ханты-Мансийский АО - Югра', 1, 2),
  (9, 1, (SELECT id FROM athletes WHERE last_name = 'Филатов' AND first_name = 'Алексей' AND middle_name = 'Александрович' AND birth_year = 2008), 9, 11, NULL, 61.6, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Филатов Алексей Александрович', 'МУ ДО «МЦРФКиС» Черепановского района', 'Новосибирская область', 1, 2),
  (10, 2, (SELECT id FROM athletes WHERE last_name = 'Морозович' AND first_name = 'Владислав' AND middle_name = 'Павлович' AND birth_year = 1999), 1, 73, NULL, 67.9, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Морозович Владислав Павлович', 'РЦСП', 'Омская область', 1, 3),
  (11, 2, (SELECT id FROM athletes WHERE last_name = 'Рыжков' AND first_name = 'Антон' AND middle_name = 'Николаевич' AND birth_year = 1994), 2, 70, NULL, 67.75, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Рыжков Антон Николаевич', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 1, 3),
  (12, 2, (SELECT id FROM athletes WHERE last_name = 'Захаров' AND first_name = 'Кирилл' AND middle_name = 'Дмитриевич' AND birth_year = 2007), 3, 67, NULL, 67.5, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Захаров Кирилл Дмитриевич', 'МУ ДО «МЦРФКиС» Черепановского района', 'Новосибирская область', 1, 3),
  (13, 2, (SELECT id FROM athletes WHERE last_name = 'Коломин' AND first_name = 'Дмитрий' AND middle_name = 'Андреевич' AND birth_year = 1999), 4, 67, NULL, 67.7, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Коломин Дмитрий Андреевич', 'МБУ ДО «Онохойская СШ»', 'Республика Бурятия', 1, 3),
  (14, 2, (SELECT id FROM athletes WHERE last_name = 'Хамидов' AND first_name = 'Фахриддин' AND middle_name = 'Фарход угли' AND birth_year = 2002), 5, 61, NULL, 67.6, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Хамидов Фахриддин Фарход угли', 'СШОР «Маршал»', 'Калужская область', 1, 3),
  (15, 2, (SELECT id FROM athletes WHERE last_name = 'Сергеев' AND first_name = 'Алексей' AND middle_name = 'Вячеславович' AND birth_year = 2001), 6, 58, NULL, 67.85, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Сергеев Алексей Вячеславович', 'МАУ ДО «СШ №2» Сургутского района', 'Ханты-Мансийский АО - Югра', 1, 3),
  (16, 2, (SELECT id FROM athletes WHERE last_name = 'Рыбский' AND first_name = 'Павел' AND middle_name = 'Сергеевич' AND birth_year = 2008), 7, 56, NULL, 68.0, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Рыбский Павел Сергеевич', 'Спортивная школа №1 в Асино', 'Томская область', 1, 3),
  (17, 2, (SELECT id FROM athletes WHERE last_name = 'Мелюхин' AND first_name = 'Кирилл' AND middle_name = 'Александрович' AND birth_year = 2011), 8, 45, NULL, 67.6, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Мелюхин Кирилл Александрович', 'МБУ ДО «ДЮСШ «Спарт»', 'Пермский край', 1, 3),
  (18, 2, (SELECT id FROM athletes WHERE last_name = 'Сидоренков' AND first_name = 'Александр' AND middle_name = 'Александрович' AND birth_year = 2010), 9, 42, NULL, 67.5, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Сидоренков Александр Александрович', 'РО ООО ВФГС в г. Москве', 'г. Москва', 1, 3),
  (19, 3, (SELECT id FROM athletes WHERE last_name = 'Беляев' AND first_name = 'Иван' AND middle_name = 'Сергеевич' AND birth_year = 1992), 1, 79, NULL, 71.05, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Беляев Иван Сергеевич', 'МБУ ДО СШОР «Югория» им. А.А. Пилояна', 'Ханты-Мансийский АО - Югра', 1, 4),
  (20, 3, (SELECT id FROM athletes WHERE last_name = 'Рябков' AND first_name = 'Алексей' AND middle_name = 'Игоревич' AND birth_year = 1993), 2, 78, NULL, 71.85, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Рябков Алексей Игоревич', 'МБУ ДО СШОР «Югория» им. А.А. Пилояна', 'Ханты-Мансийский АО - Югра', 1, 4),
  (21, 3, (SELECT id FROM athletes WHERE last_name = 'Багров' AND first_name = 'Максим' AND middle_name = 'Дмитриевич' AND birth_year = 2009), 3, 71, NULL, 72.0, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Багров Максим Дмитриевич', 'РО ООО "ВФГС" в г. Москве', 'г. Москва', 1, 4),
  (22, 3, (SELECT id FROM athletes WHERE last_name = 'Фомин' AND first_name = 'Фёдор' AND middle_name = 'Алексеевич' AND birth_year = 2004), 4, 69, NULL, 72.1, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Фомин Фёдор Алексеевич', 'МБУ ДО СШОР 5 г Белгород', 'Белгородская область', 1, 4),
  (23, 3, (SELECT id FROM athletes WHERE last_name = 'Трофимов' AND first_name = 'Тимур' AND middle_name = 'Михайлович' AND birth_year = 2011), 5, 66, NULL, 72.85, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Трофимов Тимур Михайлович', 'СШОР Маршал', 'Калужская область', 1, 4),
  (24, 3, (SELECT id FROM athletes WHERE last_name = 'Новоселов' AND first_name = 'Андрей' AND middle_name = 'Евгеньевич' AND birth_year = 2004), 6, 65, NULL, 72.3, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Новоселов Андрей Евгеньевич', 'КОГАУ "СШОР "Юность"', 'Кировская область', 1, 4),
  (25, 3, (SELECT id FROM athletes WHERE last_name = 'Семенов' AND first_name = 'Никита' AND middle_name = 'Андреевич' AND birth_year = 1993), 7, 51, NULL, 72.85, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Семенов Никита Андреевич', 'РО ООО «ВФГС» в Челябинской области', 'Челябинская область', 1, 4),
  (26, 3, (SELECT id FROM athletes WHERE last_name = 'Рожин' AND first_name = 'Егор' AND middle_name = 'Иннокентьевич' AND birth_year = 1987), 8, 46, NULL, 72.55, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Рожин Егор Иннокентьевич', 'Республиканский центр национальных видов спорта', 'Республика Саха (Якутия)', 1, 4),
  (27, 3, (SELECT id FROM athletes WHERE last_name = 'Жибинов' AND first_name = 'Фёдор' AND middle_name = 'Васильевич' AND birth_year = 2004), 9, 44, NULL, 72.15, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Жибинов Фёдор Васильевич', 'Спортивная школа г. Черногорск', 'Республика Хакасия', 1, 4),
  (28, 3, (SELECT id FROM athletes WHERE last_name = 'Колоколов' AND first_name = 'Никита' AND middle_name = 'Александрович' AND birth_year = 2007), 10, 34, NULL, 72.5, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Колоколов Никита Александрович', 'НГТУ', 'Новосибирская область', 1, 4),
  (29, 3, (SELECT id FROM athletes WHERE last_name = 'Захаров' AND first_name = 'Максим' AND middle_name = 'Александрович' AND birth_year = 2008), 11, 31, NULL, 72.65, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Захаров Максим Александрович', 'МУ ДО «МЦРФКиС» Черепановского района', 'Новосибирская область', 1, 4),
  (30, 4, (SELECT id FROM athletes WHERE last_name = 'Ляукин' AND first_name = 'Кирилл' AND middle_name = 'Сергеевич' AND birth_year = 1999), 1, 81, NULL, 77.4, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Ляукин Кирилл Сергеевич', '"УСЗ Импульс" г. Буинск', 'Республика Татарстан', 1, 5),
  (31, 4, (SELECT id FROM athletes WHERE last_name = 'Каргин' AND first_name = 'Сергей' AND middle_name = 'Ярославович' AND birth_year = 1998), 2, 79, NULL, 76.95, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Каргин Сергей Ярославович', 'МБУ ДО «Онохойская СШ»', 'Республика Бурятия', 1, 5),
  (32, 4, (SELECT id FROM athletes WHERE last_name = 'Астахов' AND first_name = 'Евгений' AND middle_name = 'Михайлович' AND birth_year = 2002), 3, 79, NULL, 77.45, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Астахов Евгений Михайлович', 'ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»', 'г. Москва', 1, 5),
  (33, 4, (SELECT id FROM athletes WHERE last_name = 'Сарсембаев' AND first_name = 'Ильяс' AND middle_name = 'Асхатович' AND birth_year = 1999), 4, 78, NULL, 77.25, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Сарсембаев Ильяс Асхатович', 'МБУ ДО СШ «Зенит»', 'Ямало-Ненецкий автономный округ', 1, 5),
  (34, 4, (SELECT id FROM athletes WHERE last_name = 'Порцев' AND first_name = 'Роман' AND middle_name = 'Геннадьевич' AND birth_year = 1987), 5, 67, NULL, 77.65, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Порцев Роман Геннадьевич', 'МАУ ДО «СШ «Прикамье» г. Перми', 'Пермский край', 1, 5),
  (35, 4, (SELECT id FROM athletes WHERE last_name = 'Любимский' AND first_name = 'Сергей' AND middle_name = 'Александрович' AND birth_year = 1992), 6, 67, NULL, 77.95, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Любимский Сергей Александрович', 'ВС РФ', 'Республика Бурятия', 1, 5),
  (36, 4, (SELECT id FROM athletes WHERE last_name = 'Дубель' AND first_name = 'Алексей' AND middle_name = 'Викторович' AND birth_year = 1990), 7, 65, NULL, 77.75, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Дубель Алексей Викторович', 'МБУДО "Варгашинская СШ"', 'Курганская область', 1, 5),
  (37, 4, (SELECT id FROM athletes WHERE last_name = 'Молчанов' AND first_name = 'Дианисий' AND middle_name = 'Николаевич' AND birth_year = 2005), 8, 65, NULL, 77.95, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Молчанов Дианисий Николаевич', 'СШОРСВС им В.Ф. Краевского', 'г. Санкт-Петербург', 1, 5),
  (38, 4, (SELECT id FROM athletes WHERE last_name = 'Филиппов' AND first_name = 'Евгений' AND middle_name = 'Борисович' AND birth_year = 1995), 9, 61, NULL, 78.0, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Филиппов Евгений Борисович', 'ВС РФ', 'Омская область', 1, 5),
  (39, 4, (SELECT id FROM athletes WHERE last_name = 'Баландин' AND first_name = 'Андрей' AND middle_name = 'Александрович' AND birth_year = 1996), 10, 54, NULL, 77.85, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Баландин Андрей Александрович', 'МБУДО "Каргапольская ДЮСШ"', 'Курганская область', 1, 5),
  (40, 4, (SELECT id FROM athletes WHERE last_name = 'Пеньков' AND first_name = 'Ян' AND middle_name = 'Евгеньевич' AND birth_year = 2010), 11, 48, NULL, 74.7, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Пеньков Ян Евгеньевич', 'МУ ДО "МЦРФКиС" Черепановского района', 'Новосибирская область', 1, 5),
  (41, 4, (SELECT id FROM athletes WHERE last_name = 'Согоян' AND first_name = 'Артём' AND middle_name = 'Ражденович' AND birth_year = 1988), 12, 47, NULL, 77.85, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Согоян Артём Ражденович', 'МАУ «РУСС»', 'Ханты-Мансийский АО - Югра', 1, 5),
  (42, 4, (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Виталий' AND middle_name = 'Викторович' AND birth_year = 1978), 13, 47, NULL, 78.0, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Иванов Виталий Викторович', 'МБУ ДО СШОР «Югория» им. А.А. Пилояна', 'Ханты-Мансийский АО - Югра', 1, 5),
  (43, 5, (SELECT id FROM athletes WHERE last_name = 'Бородынкин' AND first_name = 'Олег' AND middle_name = 'Александрович' AND birth_year = 2002), 1, 91, NULL, 84.75, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Бородынкин Олег Александрович', 'РО ООО "ВФГС" в Новосибирской области', 'Новосибирская область', 1, 6),
  (44, 5, (SELECT id FROM athletes WHERE last_name = 'Черкашин' AND first_name = 'Дмитрий' AND middle_name = 'Андреевич' AND birth_year = 1999), 2, 85, NULL, 84.05, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Черкашин Дмитрий Андреевич', 'СШОР Кристалл', 'Томская область', 1, 6),
  (45, 5, (SELECT id FROM athletes WHERE last_name = 'Чуев' AND first_name = 'Павел' AND middle_name = 'Владимирович' AND birth_year = 1997), 3, 83, NULL, 83.4, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Чуев Павел Владимирович', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 1, 6),
  (46, 5, (SELECT id FROM athletes WHERE last_name = 'Самочернов' AND first_name = 'Иван' AND middle_name = 'Николаевич' AND birth_year = 1998), 4, 81, NULL, 84.5, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Самочернов Иван Николаевич', 'МБУДО "Каргапольская ДЮСШ"', 'Курганская область', 1, 6),
  (47, 5, (SELECT id FROM athletes WHERE last_name = 'Селиверстов' AND first_name = 'Семен' AND middle_name = 'Васильевич' AND birth_year = 1989), 5, 78, NULL, 83.9, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Селиверстов Семен Васильевич', 'Олимп', 'Челябинская область', 1, 6),
  (48, 5, (SELECT id FROM athletes WHERE last_name = 'Андрущенко' AND first_name = 'Сергей' AND middle_name = 'Александрович' AND birth_year = 2005), 6, 76, NULL, 84.15, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Андрущенко Сергей Александрович', 'ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»', 'г. Москва', 1, 6),
  (49, 5, (SELECT id FROM athletes WHERE last_name = 'Полибин' AND first_name = 'Михаил' AND middle_name = 'Леонидович' AND birth_year = 2004), 7, 69, NULL, 83.85, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Полибин Михаил Леонидович', 'Федерация гиревого спорта Алтайского Края', 'Алтайский край', 1, 6),
  (50, 5, (SELECT id FROM athletes WHERE last_name = 'Минуллин' AND first_name = 'Марсель' AND middle_name = 'Ринатович' AND birth_year = 2000), 8, 64, NULL, 83.55, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Минуллин Марсель Ринатович', 'ЦСП Омской области', 'Омская область', 1, 6),
  (51, 5, (SELECT id FROM athletes WHERE last_name = 'Акульшин' AND first_name = 'Алексей' AND middle_name = 'Сергеевич' AND birth_year = 1994), 9, 57, NULL, 84.8, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Акульшин Алексей Сергеевич', 'СШ №1 им. Л.Д. Ковалевского', 'Оренбургская область', 1, 6),
  (52, 5, (SELECT id FROM athletes WHERE last_name = 'Рысник' AND first_name = 'Сергей' AND middle_name = 'Михайлович' AND birth_year = 1995), 10, 56, NULL, 85.0, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Рысник Сергей Михайлович', 'БУ ДО города Омска «СШОР №33»', 'Омская область', 1, 6),
  (53, 6, (SELECT id FROM athletes WHERE last_name = 'Кулаков' AND first_name = 'Иван' AND middle_name = 'Иванович' AND birth_year = 1998), 1, 99, NULL, 94.9, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Кулаков Иван Иванович', 'СШОР «Маршал»', 'Калужская область', 1, 7),
  (54, 6, (SELECT id FROM athletes WHERE last_name = 'Кирюхин' AND first_name = 'Роман' AND middle_name = 'Александрович' AND birth_year = 1997), 2, 82, NULL, 89.1, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Кирюхин Роман Александрович', 'ФГС КО', 'Калужская область', 1, 7),
  (55, 6, (SELECT id FROM athletes WHERE last_name = 'Николаев' AND first_name = 'Аркадий' AND middle_name = 'Анатольевич' AND birth_year = 2002), 3, 81, NULL, 88.45, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Николаев Аркадий Анатольевич', 'МБУ ДО СШОР «Югория» им. А.А. Пилояна', 'Ханты-Мансийский АО - Югра', 1, 7),
  (56, 6, (SELECT id FROM athletes WHERE last_name = 'Черкашин' AND first_name = 'Иван' AND middle_name = 'Андреевич' AND birth_year = 1999), 4, 75, NULL, 91.2, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Черкашин Иван Андреевич', 'СШОР', 'Томская область', 1, 7),
  (57, 6, (SELECT id FROM athletes WHERE last_name = 'Захаров' AND first_name = 'Андрей' AND middle_name = 'Валентинович' AND birth_year = 1993), 5, 64, NULL, 93.2, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Захаров Андрей Валентинович', 'РО ООО "ВФГС" в Новосибирской области', 'Новосибирская область', 1, 7),
  (58, 6, (SELECT id FROM athletes WHERE last_name = 'Кулик' AND first_name = 'Никита' AND middle_name = 'Алексеевич' AND birth_year = 2005), 6, 59, NULL, 92.3, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Кулик Никита Алексеевич', 'ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»', 'г. Москва', 1, 7),
  (59, 6, (SELECT id FROM athletes WHERE last_name = 'Микряков' AND first_name = 'Михаил' AND middle_name = 'Геннадьевич' AND birth_year = 2007), 7, 58, NULL, 93.75, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Микряков Михаил Геннадьевич', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург, Самарская область', 1, 7),
  (60, 6, (SELECT id FROM athletes WHERE last_name = 'Зуев' AND first_name = 'Илья' AND middle_name = 'Александрович' AND birth_year = 2007), 8, 52, NULL, 94.9, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Зуев Илья Александрович', 'МАУ ДО «СШ «Прикамье» г. Перми', 'Пермский край', 1, 7),
  (61, 6, (SELECT id FROM athletes WHERE last_name = 'Ефремов' AND first_name = 'Сергей' AND middle_name = 'Евгеньевич' AND birth_year = 1997), 9, 50, NULL, 90.8, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Ефремов Сергей Евгеньевич', 'РО ООО "ВФГС" в Новосибирской области', 'Новосибирская область', 1, 7),
  (62, 6, (SELECT id FROM athletes WHERE last_name = 'Дашкевич' AND first_name = 'Владимир' AND middle_name = 'Олегович' AND birth_year = 1984), 10, 40, NULL, 89.05, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Дашкевич Владимир Олегович', 'МАУ «РУСС»', 'Ханты-Мансийский АО - Югра', 1, 7),
  (63, 7, (SELECT id FROM athletes WHERE last_name = 'Балабанов' AND first_name = 'Сергей' AND middle_name = 'Андреевич' AND birth_year = 1996), 1, 95, NULL, 104.65, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Балабанов Сергей Андреевич', 'ВС РФ', 'Республика Бурятия', 1, 8),
  (64, 7, (SELECT id FROM athletes WHERE last_name = 'Шевелев' AND first_name = 'Дмитрий' AND middle_name = 'Владимирович' AND birth_year = 1989), 2, 94, NULL, 115.15, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Шевелев Дмитрий Владимирович', 'ВС РФ', 'Новосибирская область', 1, 8),
  (65, 7, (SELECT id FROM athletes WHERE last_name = 'Лебедев' AND first_name = 'Дмитрий' AND middle_name = 'Николаевич' AND birth_year = 2008), 3, 92, NULL, 95.1, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Лебедев Дмитрий Николаевич', 'СШОР №3, г. Череповец', 'Вологодская область', 1, 8),
  (66, 7, (SELECT id FROM athletes WHERE last_name = 'Симашкевич' AND first_name = 'Евгений' AND middle_name = 'Валентинович' AND birth_year = 1991), 4, 89, NULL, 113.7, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Симашкевич Евгений Валентинович', 'ВС РФ', 'Омская область', 1, 8),
  (67, 7, (SELECT id FROM athletes WHERE last_name = 'Турищев' AND first_name = 'Дмитрий' AND middle_name = 'Владимирович' AND birth_year = 1992), 5, 82, NULL, 99.4, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Турищев Дмитрий Владимирович', 'ГБУ ДО МКСШОР «Запад», отделение «Семёрка»', 'г. Москва', 1, 8),
  (68, 7, (SELECT id FROM athletes WHERE last_name = 'Калистратов' AND first_name = 'Артем' AND middle_name = 'Валерьевич' AND birth_year = 1992), 6, 63, NULL, 111.05, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Калистратов Артем Валерьевич', 'КШС 1', 'Смоленская область', 1, 8),
  (69, 7, (SELECT id FROM athletes WHERE last_name = 'Станкович' AND first_name = 'Боян' AND middle_name IS NULL AND birth_year = 1988), 7, 46, NULL, 103.95, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Станкович Боян', 'ФГС ЯО', 'Ярославская область', 1, 8),
  (70, 7, (SELECT id FROM athletes WHERE last_name = 'Новиков' AND first_name = 'Александр' AND middle_name = 'Алексеевич' AND birth_year = 1992), 8, 35, NULL, 96.7, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 32, 'two', 10, 1, '2026-06-02', 'Новиков Александр Алексеевич', 'ДЮСШ Краснозерского района', 'Новосибирская область', 1, 8),
  (71, 8, (SELECT id FROM athletes WHERE last_name = 'Трофимова' AND first_name = 'Милена' AND middle_name = 'Михайловна' AND birth_year = 2007), 1, 63, NULL, 57.95, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1, '2026-06-02', 'Трофимова Милена Михайловна', 'СШОР «Маршал»', 'Калужская область', 1, 9),
  (72, 8, (SELECT id FROM athletes WHERE last_name = 'Прохорова' AND first_name = 'Ангелина' AND middle_name = 'Вячеславовна' AND birth_year = 2005), 2, 50, NULL, 56.35, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1, '2026-06-02', 'Прохорова Ангелина Вячеславовна', 'МУ ДО "МЦРФКиС" Черепановского района', 'Новосибирская область', 1, 9),
  (73, 8, (SELECT id FROM athletes WHERE last_name = 'Васюкова' AND first_name = 'Регина' AND middle_name = 'Александровна' AND birth_year = 2010), 3, 40, NULL, 53.35, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1, '2026-06-02', 'Васюкова Регина Александровна', 'МУ ДО «МЦРФКиС» Черепановского района', 'Новосибирская область', 1, 9),
  (74, 8, (SELECT id FROM athletes WHERE last_name = 'Ныныч' AND first_name = 'Маргарита' AND middle_name = 'Анатольевна' AND birth_year = 1996), 4, 39, NULL, 57.7, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1, '2026-06-02', 'Ныныч Маргарита Анатольевна', 'МБУ ДО СШ №3, г. Улан-Удэ', 'Республика Бурятия', 1, 9),
  (75, 8, (SELECT id FROM athletes WHERE last_name = 'Кошурникова' AND first_name = 'Валерия' AND middle_name = 'Александровна' AND birth_year = 2012), 5, 30, NULL, 54.75, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1, '2026-06-02', 'Кошурникова Валерия Александровна', 'МБУ ДО СШОР «Югория» им. А.А. Пилояна', 'Ханты-Мансийский АО - Югра', 1, 9),
  (76, 8, (SELECT id FROM athletes WHERE last_name = 'Чернова' AND first_name = 'Кира' AND middle_name = 'Николаевна' AND birth_year = 2009), 6, 28, NULL, 56.4, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1, '2026-06-02', 'Чернова Кира Николаевна', 'СШОР «Маршал»', 'Калужская область', 1, 9),
  (77, 8, (SELECT id FROM athletes WHERE last_name = 'Шилихина' AND first_name = 'Дарья' AND middle_name = 'Павловна' AND birth_year = 2006), 7, 28, NULL, 57.45, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1, '2026-06-02', 'Шилихина Дарья Павловна', 'КШС 1/ СГУС', 'Смоленская область', 1, 9),
  (78, 8, (SELECT id FROM athletes WHERE last_name = 'Меденцева' AND first_name = 'Дарья' AND middle_name = 'Александровна' AND birth_year = 2004), 8, 7, NULL, 57.25, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1, '2026-06-02', 'Меденцева Дарья Александровна', 'МАУ ДО "КСШ КМО"', 'Кемеровская область', 1, 9),
  (79, 9, (SELECT id FROM athletes WHERE last_name = 'Пивень' AND first_name = 'Александра' AND middle_name = 'Максимовна' AND birth_year = 2004), 1, 73, NULL, 60.3, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1, '2026-06-02', 'Пивень Александра Максимовна', 'СШОР «Маршал»', 'Калужская область', 1, 10),
  (80, 9, (SELECT id FROM athletes WHERE last_name = 'Мартынова' AND first_name = 'Любовь' AND middle_name = 'Владимировна' AND birth_year = 2007), 2, 50, NULL, 62.7, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1, '2026-06-02', 'Мартынова Любовь Владимировна', 'ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»', 'г. Москва', 1, 10),
  (81, 9, (SELECT id FROM athletes WHERE last_name = 'Матвеева' AND first_name = 'Елена' AND middle_name = 'Евгеньевна' AND birth_year = 1974), 3, 49, NULL, 61.5, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1, '2026-06-02', 'Матвеева Елена Евгеньевна', 'КОГАУ "СШОР "Юность "', 'Кировская область', 1, 10),
  (82, 9, (SELECT id FROM athletes WHERE last_name = 'Подольская' AND first_name = 'Анастасия' AND middle_name = 'Владимировна' AND birth_year = 2005), 4, 47, NULL, 59.1, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1, '2026-06-02', 'Подольская Анастасия Владимировна', 'РО ООО «ВФГС» в г. Москве', 'г. Москва', 1, 10),
  (83, 9, (SELECT id FROM athletes WHERE last_name = 'Рындина' AND first_name = 'Владислава' AND middle_name = 'Романовна' AND birth_year = 2009), 5, 39, NULL, 61.6, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1, '2026-06-02', 'Рындина Владислава Романовна', 'ДОО(П)Ц "Юниор"', 'Томская область', 1, 10),
  (84, 9, (SELECT id FROM athletes WHERE last_name = 'Григорьева' AND first_name = 'Эмилия' AND middle_name = 'Сергеевна' AND birth_year = 2006), 6, 30, NULL, 61.2, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1, '2026-06-02', 'Григорьева Эмилия Сергеевна', 'МБУ ДО СШ №3, г. Улан-Удэ', 'Республика Бурятия', 1, 10),
  (85, 10, (SELECT id FROM athletes WHERE last_name = 'Воропаева' AND first_name = 'Виктория' AND middle_name = 'Витальевна' AND birth_year = 2004), 1, 71, NULL, 65.75, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1, '2026-06-02', 'Воропаева Виктория Витальевна', 'МКУ ДО "Бобровская СШ имени В.Л. Паткина"', 'Воронежская область', 1, 11),
  (86, 10, (SELECT id FROM athletes WHERE last_name = 'Кошурникова' AND first_name = 'Анастасия' AND middle_name = 'Александровна' AND birth_year = 2003), 2, 62, NULL, 63.05, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1, '2026-06-02', 'Кошурникова Анастасия Александровна', 'МБУ ДО СШОР «Югория» им. А.А. Пилояна', 'Ханты-Мансийский АО - Югра', 1, 11),
  (87, 10, (SELECT id FROM athletes WHERE last_name = 'Ермолина' AND first_name = 'Ирина' AND middle_name = 'Евгеньевна' AND birth_year = 2008), 3, 58, NULL, 64.9, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1, '2026-06-02', 'Ермолина Ирина Евгеньевна', 'Федерация гиревого спорта Томской области', 'Томская область', 1, 11),
  (88, 10, (SELECT id FROM athletes WHERE last_name = 'Альянова' AND first_name = 'Виктория' AND middle_name = 'Евгеньевна' AND birth_year = 2004), 4, 38, NULL, 67.45, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1, '2026-06-02', 'Альянова Виктория Евгеньевна', 'МБУ ДО СШОР по борьбе', 'Брянская область', 1, 11),
  (89, 10, (SELECT id FROM athletes WHERE last_name = 'Забелинская' AND first_name = 'Дарья' AND middle_name = 'Александровна' AND birth_year = 2003), 5, 28, NULL, 66.45, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1, '2026-06-02', 'Забелинская Дарья Александровна', 'САФУ Арктика', 'Архангельская область', 1, 11),
  (90, 10, (SELECT id FROM athletes WHERE last_name = 'Ельчанинова' AND first_name = 'Вероника' AND middle_name = 'Сергеевна' AND birth_year = 2003), 6, 27, NULL, 67.9, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1, '2026-06-02', 'Ельчанинова Вероника Сергеевна', 'БУ ДО города Омска «СШОР №33»', 'Омская область', 1, 11),
  (91, 10, (SELECT id FROM athletes WHERE last_name = 'Суменкова' AND first_name = 'Анастасия' AND middle_name = 'Дмитриевна' AND birth_year = 2009), 7, 26, NULL, 64.2, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1, '2026-06-02', 'Суменкова Анастасия Дмитриевна', 'КШС 1', 'Смоленская область', 1, 11),
  (92, 11, (SELECT id FROM athletes WHERE last_name = 'Мартынова' AND first_name = 'Ирина' AND middle_name = 'Александровна' AND birth_year = 1999), 1, 85, NULL, 88.4, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1, '2026-06-02', 'Мартынова Ирина Александровна', 'СШОР «Маршал»', 'Калужская область', 1, 12),
  (93, 11, (SELECT id FROM athletes WHERE last_name = 'Полякова' AND first_name = 'Полина' AND middle_name = 'Сергеевна' AND birth_year = 1999), 2, 70, NULL, 88.85, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1, '2026-06-02', 'Полякова Полина Сергеевна', 'ТРО ООО «ВФГС»', 'Тюменская область', 1, 12),
  (94, 11, (SELECT id FROM athletes WHERE last_name = 'Вяткина' AND first_name = 'Вера' AND middle_name = 'Павловна' AND birth_year = 1999), 3, 61, NULL, 126.5, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1, '2026-06-02', 'Вяткина Вера Павловна', 'РО ООО «ВФГС» в Омской области', 'Омская область', 1, 12),
  (95, 11, (SELECT id FROM athletes WHERE last_name = 'Попова' AND first_name = 'Мария' AND middle_name = 'Алексеевна' AND birth_year = 2005), 4, 53, NULL, 80.5, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1, '2026-06-02', 'Попова Мария Алексеевна', 'ССК «КИТ на спорте"', 'Пермский край', 1, 12),
  (96, 11, (SELECT id FROM athletes WHERE last_name = 'Филимонова' AND first_name = 'Карина' AND middle_name = 'Денисовна' AND birth_year = 2006), 5, 53, NULL, 84.95, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1, '2026-06-02', 'Филимонова Карина Денисовна', 'КОГАУ «СШОР «Юность»', 'Кировская область', 1, 12),
  (97, 11, (SELECT id FROM athletes WHERE last_name = 'Побережная' AND first_name = 'Анна' AND middle_name = 'Владимировна' AND birth_year = 2010), 6, 47, NULL, 77.85, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1, '2026-06-02', 'Побережная Анна Владимировна', 'СШОР «Маршал»', 'Калужская область', 1, 12),
  (98, 11, (SELECT id FROM athletes WHERE last_name = 'Врубель' AND first_name = 'Дарья' AND middle_name = 'Васильевна' AND birth_year = 2000), 7, 46, NULL, 100.4, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1, '2026-06-02', 'Врубель Дарья Васильевна', 'БУ ДО города Омска «СШОР №33»', 'Омская область', 1, 12),
  (99, 11, (SELECT id FROM athletes WHERE last_name = 'Баранова' AND first_name = 'Дарья' AND middle_name = 'Андреевна' AND birth_year = 2008), 8, 30, NULL, 68.15, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1, '2026-06-02', 'Баранова Дарья Андреевна', 'МАУ ДО «Спортивная школа»', 'Ханты-Мансийский АО - Югра', 1, 12),
  (100, 11, (SELECT id FROM athletes WHERE last_name = 'Махкамова' AND first_name = 'Парвина' AND middle_name = 'Маруфовна' AND birth_year = 2007), 9, 20, NULL, 88.1, NULL, (SELECT id FROM disciplines WHERE code = 'long_cycle'), 24, 'two', 10, 1, '2026-06-02', 'Махкамова Парвина Маруфовна', 'МАУ ДО «СШ «Прикамье» г. Перми', 'Пермский край', 1, 12),
  (101, 12, (SELECT id FROM athletes WHERE last_name = 'Бенидзе' AND first_name = 'Джони' AND middle_name = 'Бадриевич' AND birth_year = 1990), 1, 142, NULL, 62.8, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Бенидзе Джони Бадриевич', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 1, NULL),
  (102, 12, (SELECT id FROM athletes WHERE last_name = 'Бутенко' AND first_name = 'Евгений' AND middle_name = 'Александрович' AND birth_year = 1995), 2, 140, NULL, 62.4, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Бутенко Евгений Александрович', 'ГАУ НСО «РЦСП СК и СР»', 'Новосибирская область', 1, NULL),
  (103, 12, (SELECT id FROM athletes WHERE last_name = 'Сиразетдинов' AND first_name = 'Данил' AND middle_name = 'Ильфатович' AND birth_year = 2007), 3, 102, NULL, 62.3, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Сиразетдинов Данил Ильфатович', 'МАУ ДО «СШ «Прикамье» г. Перми', 'Пермский край', 1, NULL),
  (104, 12, (SELECT id FROM athletes WHERE last_name = 'Кузнецов' AND first_name = 'Роман' AND middle_name = 'Андреевич' AND birth_year = 2009), 4, 72, NULL, 62.85, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Кузнецов Роман Андреевич', 'МБУ ДО СШ №3, г. Улан-Удэ', 'Республика Бурятия', 1, NULL),
  (105, 12, (SELECT id FROM athletes WHERE last_name = 'Манаков' AND first_name = 'Трофим' AND middle_name = 'Анатольевич' AND birth_year = 2000), 5, 70, NULL, 62.9, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Манаков Трофим Анатольевич', 'МАУ ДО «СШ №2» Сургутского района', 'Ханты-Мансийский АО - Югра', 1, NULL),
  (106, 12, (SELECT id FROM athletes WHERE last_name = 'Кормилицын' AND first_name = 'Иван' AND middle_name = 'Николаевич' AND birth_year = 2010), 6, 65, NULL, 62.75, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Кормилицын Иван Николаевич', 'СШОР «Маршал»', 'Калужская область', 1, NULL),
  (107, 12, (SELECT id FROM athletes WHERE last_name = 'Кашкаров' AND first_name = 'Артур' AND middle_name = 'Анатольевич' AND birth_year = 2005), 7, 62, NULL, 62.9, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Кашкаров Артур Анатольевич', 'спортивный клуб "АГАУ"', 'Алтайский край', 1, NULL),
  (108, 12, (SELECT id FROM athletes WHERE last_name = 'Жалов' AND first_name = 'Ярослав' AND middle_name = 'Борисович' AND birth_year = 2007), 8, 60, NULL, 61.85, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Жалов Ярослав Борисович', 'МБУ ДО СШОР «Югория» им. А.А. Пилояна', 'Ханты-Мансийский АО - Югра', 1, NULL),
  (109, 12, (SELECT id FROM athletes WHERE last_name = 'Митюкевич' AND first_name = 'Станислав' AND middle_name = 'Николаевич' AND birth_year = 2008), 9, 51, NULL, 61.65, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Митюкевич Станислав Николаевич', 'МАУ ДО СШОР', 'Республика Башкортостан', 1, NULL),
  (110, 12, (SELECT id FROM athletes WHERE last_name = 'Клявлин' AND first_name = 'Андрей' AND middle_name = 'Викторович' AND birth_year = 2006), 10, 27, NULL, 62.7, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Клявлин Андрей Викторович', 'РО ООО ВФГС в Челябинской области', 'Челябинская область', 1, NULL),
  (111, 12, (SELECT id FROM athletes WHERE last_name = 'Филатов' AND first_name = 'Алексей' AND middle_name = 'Александрович' AND birth_year = 2008), 11, 10, NULL, 62.05, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Филатов Алексей Александрович', 'МУ ДО «МЦРФКиС» Черепановского района', 'Новосибирская область', 1, NULL),
  (112, 13, (SELECT id FROM athletes WHERE last_name = 'Зуев' AND first_name = 'Владислав' AND middle_name = 'Алексеевич' AND birth_year = 2000), 1, 136, NULL, 68.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Зуев Владислав Алексеевич', 'ВС РФ', 'Воронежская область', 1, NULL),
  (113, 13, (SELECT id FROM athletes WHERE last_name = 'Узюкин' AND first_name = 'Анатолий' AND middle_name = 'Эдуардович' AND birth_year = 2000), 2, 115, NULL, 67.3, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Узюкин Анатолий Эдуардович', 'ФСК "Улап", СШ Энергия', 'Чувашская Республика', 1, NULL),
  (114, 13, (SELECT id FROM athletes WHERE last_name = 'Василевич' AND first_name = 'Добрыня' AND middle_name = 'Андреевич' AND birth_year = 2000), 3, 111, NULL, 67.5, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Василевич Добрыня Андреевич', 'МБУ ДО СШ №3, г. Улан-Удэ', 'Республика Бурятия', 1, NULL),
  (115, 13, (SELECT id FROM athletes WHERE last_name = 'Захаров' AND first_name = 'Кирилл' AND middle_name = 'Дмитриевич' AND birth_year = 2007), 4, 111, NULL, 67.75, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Захаров Кирилл Дмитриевич', 'МУ ДО «МЦРФКиС» Черепановского района', 'Новосибирская область', 1, NULL),
  (116, 13, (SELECT id FROM athletes WHERE last_name = 'Щербин' AND first_name = 'Олег' AND middle_name = 'Владимирович' AND birth_year = 1989), 5, 109, NULL, 67.75, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Щербин Олег Владимирович', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 1, NULL),
  (117, 13, (SELECT id FROM athletes WHERE last_name = 'Коломин' AND first_name = 'Дмитрий' AND middle_name = 'Андреевич' AND birth_year = 1999), 6, 100, NULL, 67.85, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Коломин Дмитрий Андреевич', 'МБУ ДО «Онохойская СШ»', 'Республика Бурятия', 1, NULL),
  (118, 13, (SELECT id FROM athletes WHERE last_name = 'Хамидов' AND first_name = 'Фахриддин' AND middle_name = 'Фарход угли' AND birth_year = 2002), 7, 100, NULL, 67.9, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Хамидов Фахриддин Фарход угли', 'СШОР «Маршал»', 'Калужская область', 1, NULL),
  (119, 13, (SELECT id FROM athletes WHERE last_name = 'Аникушко' AND first_name = 'Семён' AND middle_name = 'Сергеевич' AND birth_year = 2009), 8, 68, NULL, 67.2, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Аникушко Семён Сергеевич', 'ДЮСШ Кулундинского района', 'Алтайский край', 1, NULL),
  (120, 13, (SELECT id FROM athletes WHERE last_name = 'Рыбский' AND first_name = 'Павел' AND middle_name = 'Сергеевич' AND birth_year = 2008), 9, 65, NULL, 68.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Рыбский Павел Сергеевич', 'Спортивная школа №1 в Асино', 'Томская область', 1, NULL),
  (121, 13, (SELECT id FROM athletes WHERE last_name = 'Мелюхин' AND first_name = 'Кирилл' AND middle_name = 'Александрович' AND birth_year = 2011), 10, 62, NULL, 66.75, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Мелюхин Кирилл Александрович', 'МБУ ДО «ДЮСШ «Спарт»', 'Пермский край', 1, NULL),
  (122, 13, (SELECT id FROM athletes WHERE last_name = 'Сидоренков' AND first_name = 'Александр' AND middle_name = 'Александрович' AND birth_year = 2010), 11, 52, NULL, 67.35, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Сидоренков Александр Александрович', 'РО ООО ВФГС в г. Москве', 'г. Москва', 1, NULL),
  (123, 14, (SELECT id FROM athletes WHERE last_name = 'Рябков' AND first_name = 'Алексей' AND middle_name = 'Игоревич' AND birth_year = 1993), 1, 141, NULL, 72.9, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Рябков Алексей Игоревич', 'МБУ ДО СШОР «Югория» им. А.А. Пилояна', 'Ханты-Мансийский АО - Югра', 1, NULL),
  (124, 14, (SELECT id FROM athletes WHERE last_name = 'Рассадин' AND first_name = 'Андрей' AND middle_name = 'Андреевич' AND birth_year = 1989), 2, 135, NULL, 72.7, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Рассадин Андрей Андреевич', 'МБУ ДО «Онохойская СШ»', 'Республика Бурятия', 1, NULL),
  (125, 14, (SELECT id FROM athletes WHERE last_name = 'Смирнов' AND first_name = 'Даниил' AND middle_name = 'Алексеевич' AND birth_year = 2003), 3, 122, NULL, 71.85, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Смирнов Даниил Алексеевич', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 1, NULL),
  (126, 14, (SELECT id FROM athletes WHERE last_name = 'Трофимов' AND first_name = 'Тимур' AND middle_name = 'Михайлович' AND birth_year = 2011), 4, 121, NULL, 72.85, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Трофимов Тимур Михайлович', 'СШОР Маршал', 'Калужская область', 1, NULL),
  (127, 14, (SELECT id FROM athletes WHERE last_name = 'Волдаев' AND first_name = 'Александр' AND middle_name = 'Владимирович' AND birth_year = 2000), 5, 105, NULL, 72.65, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Волдаев Александр Владимирович', 'Федерация гиревого спорта Томской области', 'Томская область', 1, NULL),
  (128, 14, (SELECT id FROM athletes WHERE last_name = 'Балдин' AND first_name = 'Александр' AND middle_name = 'Васильевич' AND birth_year = 1993), 6, 97, NULL, 72.15, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Балдин Александр Васильевич', 'РО ООО "ВФГС" СО', 'Самарская область', 1, NULL),
  (129, 14, (SELECT id FROM athletes WHERE last_name = 'Седых' AND first_name = 'Илья' AND middle_name = 'Александрович' AND birth_year = 2004), 7, 88, NULL, 71.65, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Седых Илья Александрович', 'БУ ДО города Омска «СШОР N33»', 'Омская область', 1, NULL),
  (130, 14, (SELECT id FROM athletes WHERE last_name = 'Захаров' AND first_name = 'Максим' AND middle_name = 'Александрович' AND birth_year = 2008), 8, 84, NULL, 72.75, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Захаров Максим Александрович', 'МУ ДО «МЦРФКиС» Черепановского района', 'Новосибирская область', 1, NULL),
  (131, 14, (SELECT id FROM athletes WHERE last_name = 'Жибинов' AND first_name = 'Фёдор' AND middle_name = 'Васильевич' AND birth_year = 2004), 9, 73, NULL, 72.8, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Жибинов Фёдор Васильевич', 'Спортивная школа г.Черногорск', 'Республика Хакасия', 1, NULL),
  (132, 14, (SELECT id FROM athletes WHERE last_name = 'Любин' AND first_name = 'Валентин' AND middle_name = 'Сергеевич' AND birth_year = 2009), 10, 71, NULL, 72.4, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Любин Валентин Сергеевич', 'Кулундинская Спортивная школа', 'Алтайский край', 1, NULL),
  (133, 14, (SELECT id FROM athletes WHERE last_name = 'Баер' AND first_name = 'Павел' AND middle_name = 'Арнольдович' AND birth_year = 1983), 11, 49, NULL, 72.4, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Баер Павел Арнольдович', 'ДЮСШ Искитимский район', 'Новосибирская область', 1, NULL),
  (134, 15, (SELECT id FROM athletes WHERE last_name = 'Сулейманов' AND first_name = 'Мовсар' AND middle_name = 'Мусаевич' AND birth_year = 1989), 1, 137, NULL, 77.85, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Сулейманов Мовсар Мусаевич', 'СШОР «Маршал»', 'Калужская область', 1, NULL),
  (135, 15, (SELECT id FROM athletes WHERE last_name = 'Бобров' AND first_name = 'Владимир' AND middle_name = 'Сергеевич' AND birth_year = 1989), 2, 129, NULL, 77.3, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Бобров Владимир Сергеевич', 'ВС РФ', 'Тюменская область', 1, NULL),
  (136, 15, (SELECT id FROM athletes WHERE last_name = 'Бессонов' AND first_name = 'Максим' AND middle_name = 'Вячеславович' AND birth_year = 2004), 3, 127, NULL, 75.9, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Бессонов Максим Вячеславович', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 1, NULL),
  (137, 15, (SELECT id FROM athletes WHERE last_name = 'Сарсембаев' AND first_name = 'Ильяс' AND middle_name = 'Асхатович' AND birth_year = 1999), 4, 123, NULL, 77.7, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Сарсембаев Ильяс Асхатович', 'МБУ ДО СШ «Зенит»', 'Ямало-Ненецкий автономный округ', 1, NULL),
  (138, 15, (SELECT id FROM athletes WHERE last_name = 'Порцев' AND first_name = 'Роман' AND middle_name = 'Геннадьевич' AND birth_year = 1987), 5, 116, NULL, 77.75, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Порцев Роман Геннадьевич', 'МАУ ДО «СШ «Прикамье» г. Перми', 'Пермский край', 1, NULL),
  (139, 15, (SELECT id FROM athletes WHERE last_name = 'Курдюков' AND first_name = 'Василий' AND middle_name = 'Сергеевич' AND birth_year = 1997), 6, 115, NULL, 77.65, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Курдюков Василий Сергеевич', 'ВС РФ', 'Омская область', 1, NULL),
  (140, 15, (SELECT id FROM athletes WHERE last_name = 'Володин' AND first_name = 'Денис' AND middle_name = 'Игоревич' AND birth_year = 1993), 7, 96, NULL, 77.4, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Володин Денис Игоревич', 'МУ ДО СШ "Легион"', 'Московская область', 1, NULL),
  (141, 15, (SELECT id FROM athletes WHERE last_name = 'Согоян' AND first_name = 'Артём' AND middle_name = 'Ражденович' AND birth_year = 1988), 8, 81, NULL, 77.55, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Согоян Артём Ражденович', 'МАУ «РУСС»', 'Ханты-Мансийский АО - Югра', 1, NULL),
  (142, 15, (SELECT id FROM athletes WHERE last_name = 'Ташланов' AND first_name = 'Илья' AND middle_name = 'Станиславович' AND birth_year = 1987), 9, 80, NULL, 77.85, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Ташланов Илья Станиславович', 'СШ Атлет', 'Челябинская область', 1, NULL),
  (143, 15, (SELECT id FROM athletes WHERE last_name = 'Луценко' AND first_name = 'Никита' AND middle_name = 'Ильич' AND birth_year = 2003), 10, 61, NULL, 77.45, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Луценко Никита Ильич', 'РО ООО "ВФГС" в г. Москве', 'г. Москва', 1, NULL),
  (144, 16, (SELECT id FROM athletes WHERE last_name = 'Кожевников' AND first_name = 'Сергей' AND middle_name = 'Павлович' AND birth_year = 2008), 1, 146, NULL, 84.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Кожевников Сергей Павлович', 'МБУ ДО СШ №3 г.Улан-Удэ', 'Республика Бурятия', 1, NULL),
  (145, 16, (SELECT id FROM athletes WHERE last_name = 'Плотников' AND first_name = 'Вячеслав' AND middle_name = 'Евгеньевич' AND birth_year = 1998), 2, 141, NULL, 84.3, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Плотников Вячеслав Евгеньевич', 'РО ООО ВФГС в Челябинской области', 'Челябинская область', 1, NULL),
  (146, 16, (SELECT id FROM athletes WHERE last_name = 'Черкашин' AND first_name = 'Дмитрий' AND middle_name = 'Андреевич' AND birth_year = 1999), 3, 136, NULL, 84.8, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Черкашин Дмитрий Андреевич', 'СШОР Кристалл', 'Томская область', 1, NULL),
  (147, 16, (SELECT id FROM athletes WHERE last_name = 'Самочернов' AND first_name = 'Иван' AND middle_name = 'Николаевич' AND birth_year = 1998), 4, 123, NULL, 85.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Самочернов Иван Николаевич', 'МБУДО "Каргапольская ДЮСШ"', 'Курганская область', 1, NULL),
  (148, 16, (SELECT id FROM athletes WHERE last_name = 'Косухин' AND first_name = 'Владислав' AND middle_name = 'Владимирович' AND birth_year = 2004), 5, 112, NULL, 82.75, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Косухин Владислав Владимирович', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 1, NULL),
  (149, 16, (SELECT id FROM athletes WHERE last_name = 'Лавриков' AND first_name = 'Вячеслав' AND middle_name = 'Дмитриевич' AND birth_year = 2005), 6, 110, NULL, 85.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Лавриков Вячеслав Дмитриевич', 'ТГПУ', 'Томская область', 1, NULL),
  (150, 16, (SELECT id FROM athletes WHERE last_name = 'Маликов' AND first_name = 'Данил' AND middle_name = 'Дамирович' AND birth_year = 2001), 7, 109, NULL, 84.45, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Маликов Данил Дамирович', 'МАУ ДО «СШ «Прикамье» г. Перми', 'Пермский край', 1, NULL),
  (151, 16, (SELECT id FROM athletes WHERE last_name = 'Мухитов' AND first_name = 'Андрей' AND middle_name = 'Вячеславович' AND birth_year = 1999), 8, 100, NULL, 84.5, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Мухитов Андрей Вячеславович', 'МБУ ДО СШОР по борьбе', 'Брянская область', 1, NULL),
  (152, 16, (SELECT id FROM athletes WHERE last_name = 'Литвинов' AND first_name = 'Виталий' AND middle_name = 'Александрович' AND birth_year = 1993), 9, 87, NULL, 83.95, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Литвинов Виталий Александрович', 'МБУ ДО СШОР "Олимп"', 'Кемеровская область', 1, NULL),
  (153, 16, (SELECT id FROM athletes WHERE last_name = 'Встров' AND first_name = 'Денис' AND middle_name = 'Сергеевич' AND birth_year = 1989), 10, 86, NULL, 84.7, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Встров Денис Сергеевич', 'РО ООО «ВФГС» в г. Москве', 'г. Москва', 1, NULL),
  (154, 16, (SELECT id FROM athletes WHERE last_name = 'Салихов' AND first_name = 'Рустам' AND middle_name = 'Ренатович' AND birth_year = 1982), 11, 85, NULL, 82.3, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Салихов Рустам Ренатович', 'СШ №1 им. Л.Д. Ковалевского', 'Оренбургская область', 1, NULL),
  (155, 16, (SELECT id FROM athletes WHERE last_name = 'Бородынкин' AND first_name = 'Олег' AND middle_name = 'Александрович' AND birth_year = 2002), 12, 82, NULL, 84.75, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Бородынкин Олег Александрович', 'РО ООО "ВФГС" в Новосибирской области', 'Новосибирская область', 1, NULL),
  (156, 17, (SELECT id FROM athletes WHERE last_name = 'Кулаков' AND first_name = 'Иван' AND middle_name = 'Иванович' AND birth_year = 1998), 1, 153, NULL, 95.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Кулаков Иван Иванович', 'СШОР «Маршал»', 'Калужская область', 1, NULL),
  (157, 17, (SELECT id FROM athletes WHERE last_name = 'Николаев' AND first_name = 'Аркадий' AND middle_name = 'Анатольевич' AND birth_year = 2002), 2, 147, NULL, 88.2, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Николаев Аркадий Анатольевич', 'МБУ ДО СШОР «Югория» им. А.А. Пилояна', 'Ханты-Мансийский АО - Югра', 1, NULL),
  (158, 17, (SELECT id FROM athletes WHERE last_name = 'Гуров' AND first_name = 'Владимир' AND middle_name = 'Анатольевич' AND birth_year = 1978), 3, 141, NULL, 92.45, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Гуров Владимир Анатольевич', 'СШОР «Маршал»', 'Калужская область', 1, NULL),
  (159, 17, (SELECT id FROM athletes WHERE last_name = 'Кирюхин' AND first_name = 'Роман' AND middle_name = 'Александрович' AND birth_year = 1997), 4, 128, NULL, 88.15, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Кирюхин Роман Александрович', 'ФГС КО', 'Калужская область', 1, NULL),
  (160, 17, (SELECT id FROM athletes WHERE last_name = 'Черкашин' AND first_name = 'Иван' AND middle_name = 'Андреевич' AND birth_year = 1999), 5, 123, NULL, 92.05, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Черкашин Иван Андреевич', 'СШОР', 'Томская область', 1, NULL),
  (161, 17, (SELECT id FROM athletes WHERE last_name = 'Пивень' AND first_name = 'Андрей' AND middle_name = 'Владимирович' AND birth_year = 2003), 6, 111, NULL, 91.55, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Пивень Андрей Владимирович', 'МБУ ДО СШ №3 г.Улан-Удэ', 'Республика Бурятия', 1, NULL),
  (162, 17, (SELECT id FROM athletes WHERE last_name = 'Захаров' AND first_name = 'Андрей' AND middle_name = 'Валентинович' AND birth_year = 1993), 7, 107, NULL, 93.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Захаров Андрей Валентинович', 'РО ООО "ВФГС" в Новосибирской области', 'Новосибирская область', 1, NULL),
  (163, 17, (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Александр' AND middle_name = 'Сергеевич' AND birth_year = 2008), 8, 104, NULL, 92.55, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Иванов Александр Сергеевич', 'МАУ ДОСШ Чемпион', 'Республика Башкортостан', 1, NULL),
  (164, 17, (SELECT id FROM athletes WHERE last_name = 'Кравченко' AND first_name = 'Сергей' AND middle_name = 'Сергеевич' AND birth_year = 1982), 9, 101, NULL, 93.4, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Кравченко Сергей Сергеевич', 'МАУ ДО СШОР', 'Калининградская область', 1, NULL),
  (165, 17, (SELECT id FROM athletes WHERE last_name = 'Ефремов' AND first_name = 'Сергей' AND middle_name = 'Евгеньевич' AND birth_year = 1997), 10, 94, NULL, 89.9, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Ефремов Сергей Евгеньевич', 'РО ООО "ВФГС" в Новосибирской области', 'Новосибирская область', 1, NULL),
  (166, 17, (SELECT id FROM athletes WHERE last_name = 'Спичкин' AND first_name = 'Алексей' AND middle_name = 'Евгеньевич' AND birth_year = 1994), 11, 94, NULL, 92.75, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Спичкин Алексей Евгеньевич', 'МУ ДО МЦРФКиС Черепановского района НСО', 'Новосибирская область', 1, NULL),
  (167, 17, (SELECT id FROM athletes WHERE last_name = 'Самохвалов' AND first_name = 'Илья' AND middle_name = 'Дмитриевич' AND birth_year = 2007), 12, 89, NULL, 92.25, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Самохвалов Илья Дмитриевич', 'МАУ ДО СШ Геолог', 'Ямало-Ненецкий автономный округ', 1, NULL),
  (168, 18, (SELECT id FROM athletes WHERE last_name = 'Марков' AND first_name = 'Иван' AND middle_name = 'Эдуардович' AND birth_year = 1995), 1, 171, NULL, 97.65, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Марков Иван Эдуардович', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 1, NULL),
  (169, 18, (SELECT id FROM athletes WHERE last_name = 'Турищев' AND first_name = 'Дмитрий' AND middle_name = 'Владимирович' AND birth_year = 1992), 2, 160, NULL, 99.85, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Турищев Дмитрий Владимирович', 'ГБУ ДО МКСШОР «Запад», отделение «Семёрка»', 'г. Москва', 1, NULL),
  (170, 18, (SELECT id FROM athletes WHERE last_name = 'Розмазнин' AND first_name = 'Илья' AND middle_name = 'Владимирович' AND birth_year = 2000), 3, 134, NULL, 111.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Розмазнин Илья Владимирович', 'БРОО ФГС', 'Белгородская область', 1, NULL),
  (171, 18, (SELECT id FROM athletes WHERE last_name = 'Лебедев' AND first_name = 'Дмитрий' AND middle_name = 'Николаевич' AND birth_year = 2008), 4, 108, NULL, 95.45, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Лебедев Дмитрий Николаевич', 'СШОР №3, г. Череповец', 'Вологодская область', 1, NULL),
  (172, 18, (SELECT id FROM athletes WHERE last_name = 'Новиков' AND first_name = 'Александр' AND middle_name = 'Алексеевич' AND birth_year = 1992), 5, 99, NULL, 96.5, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Новиков Александр Алексеевич', 'ДЮСШ Красноозерского района', 'Новосибирская область', 1, NULL),
  (173, 18, (SELECT id FROM athletes WHERE last_name = 'Шевелев' AND first_name = 'Дмитрий' AND middle_name = 'Владимирович' AND birth_year = 1989), 6, 31, NULL, 115.55, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1, '2026-06-02', 'Шевелев Дмитрий Владимирович', 'ВС РФ', 'Новосибирская область', 1, NULL),
  (174, 19, (SELECT id FROM athletes WHERE last_name = 'Трофимова' AND first_name = 'Милена' AND middle_name = 'Михайловна' AND birth_year = 2007), 1, 76, NULL, 57.95, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1, '2026-06-02', 'Трофимова Милена Михайловна', 'СШОР «Маршал»', 'Калужская область', 1, NULL),
  (175, 19, (SELECT id FROM athletes WHERE last_name = 'Прохорова' AND first_name = 'Ангелина' AND middle_name = 'Вячеславовна' AND birth_year = 2005), 2, 71, NULL, 57.0, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1, '2026-06-02', 'Прохорова Ангелина Вячеславовна', 'МУ ДО "МЦРФКиС" Черепановского района', 'Новосибирская область', 1, NULL),
  (176, 19, (SELECT id FROM athletes WHERE last_name = 'Васюкова' AND first_name = 'Регина' AND middle_name = 'Александровна' AND birth_year = 2010), 3, 64, NULL, 53.9, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1, '2026-06-02', 'Васюкова Регина Александровна', 'МУ ДО «МЦРФКиС» Черепановского района', 'Новосибирская область', 1, NULL),
  (177, 19, (SELECT id FROM athletes WHERE last_name = 'Ныныч' AND first_name = 'Маргарита' AND middle_name = 'Анатольевна' AND birth_year = 1996), 4, 50, NULL, 57.5, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1, '2026-06-02', 'Ныныч Маргарита Анатольевна', 'МБУ ДО СШ №3, г. Улан-Удэ', 'Республика Бурятия', 1, NULL),
  (178, 19, (SELECT id FROM athletes WHERE last_name = 'Кошурникова' AND first_name = 'Валерия' AND middle_name = 'Александровна' AND birth_year = 2012), 5, 25, NULL, 54.65, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1, '2026-06-02', 'Кошурникова Валерия Александровна', 'МБУ ДО СШОР «Югория» им. А.А. Пилояна', 'Ханты-Мансийский АО - Югра', 1, NULL),
  (179, 19, (SELECT id FROM athletes WHERE last_name = 'Меденцева' AND first_name = 'Дарья' AND middle_name = 'Александровна' AND birth_year = 2004), 6, 21, NULL, 57.45, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1, '2026-06-02', 'Меденцева Дарья Александровна', 'МАУ ДО "КСШ КМО"', 'Кемеровская область', 1, NULL),
  (180, 20, (SELECT id FROM athletes WHERE last_name = 'Пивень' AND first_name = 'Александра' AND middle_name = 'Максимовна' AND birth_year = 2004), 1, 105, NULL, 59.4, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1, '2026-06-02', 'Пивень Александра Максимовна', 'СШОР «Маршал»', 'Калужская область', 1, NULL),
  (181, 20, (SELECT id FROM athletes WHERE last_name = 'Тарвердиева' AND first_name = 'Мария' AND middle_name = 'Алексеевна' AND birth_year = 1986), 2, 66, NULL, 62.9, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1, '2026-06-02', 'Тарвердиева Мария Алексеевна', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 1, NULL),
  (182, 20, (SELECT id FROM athletes WHERE last_name = 'Мартынова' AND first_name = 'Любовь' AND middle_name = 'Владимировна' AND birth_year = 2007), 3, 60, NULL, 62.9, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1, '2026-06-02', 'Мартынова Любовь Владимировна', 'ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»', 'г. Москва', 1, NULL),
  (183, 20, (SELECT id FROM athletes WHERE last_name = 'Рындина' AND first_name = 'Владислава' AND middle_name = 'Романовна' AND birth_year = 2009), 4, 52, NULL, 61.75, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1, '2026-06-02', 'Рындина Владислава Романовна', 'ДОО(П)Ц "Юниор"', 'Томская область', 1, NULL),
  (184, 20, (SELECT id FROM athletes WHERE last_name = 'Подольская' AND first_name = 'Анастасия' AND middle_name = 'Владимировна' AND birth_year = 2005), 5, 49, NULL, 59.1, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1, '2026-06-02', 'Подольская Анастасия Владимировна', 'РО ООО «ВФГС» в г. Москве', 'г. Москва', 1, NULL),
  (185, 20, (SELECT id FROM athletes WHERE last_name = 'Григорьева' AND first_name = 'Эмилия' AND middle_name = 'Сергеевна' AND birth_year = 2006), 6, 38, NULL, 61.25, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1, '2026-06-02', 'Григорьева Эмилия Сергеевна', 'МБУ ДО СШ №3, г. Улан-Удэ', 'Республика Бурятия', 1, NULL),
  (186, 20, (SELECT id FROM athletes WHERE last_name = 'Матвеева' AND first_name = 'Елена' AND middle_name = 'Евгеньевна' AND birth_year = 1974), 7, 31, NULL, 61.2, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1, '2026-06-02', 'Матвеева Елена Евгеньевна', 'КОГАУ "СШОР "Юность "', 'Кировская область', 1, NULL),
  (187, 20, (SELECT id FROM athletes WHERE last_name = 'Болотова' AND first_name = 'Елизавета' AND middle_name = 'Сергеевна' AND birth_year = 2007), 8, 27, NULL, 62.05, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1, '2026-06-02', 'Болотова Елизавета Сергеевна', 'БУ ДО города Омска «СШОР №33»', 'Омская область', 1, NULL),
  (188, 20, (SELECT id FROM athletes WHERE last_name = 'Пузанкова' AND first_name = 'Анастасия' AND middle_name = 'Константиновна' AND birth_year = 2006), 9, 22, NULL, 62.7, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1, '2026-06-02', 'Пузанкова Анастасия Константиновна', 'СШ "Татнефть Олимп"', 'Республика Татарстан', 1, NULL),
  (189, 21, (SELECT id FROM athletes WHERE last_name = 'Воропаева' AND first_name = 'Виктория' AND middle_name = 'Витальевна' AND birth_year = 2004), 1, 90, NULL, 66.4, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1, '2026-06-02', 'Воропаева Виктория Витальевна', 'МКУ ДО "Бобровская СШ имени В.Л. Паткина"', 'Воронежская область', 1, NULL),
  (190, 21, (SELECT id FROM athletes WHERE last_name = 'Кошурникова' AND first_name = 'Анастасия' AND middle_name = 'Александровна' AND birth_year = 2003), 2, 80, NULL, 63.35, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1, '2026-06-02', 'Кошурникова Анастасия Александровна', 'МБУ ДО СШОР «Югория» им. А.А. Пилояна', 'Ханты-Мансийский АО - Югра', 1, NULL),
  (191, 21, (SELECT id FROM athletes WHERE last_name = 'Альянова' AND first_name = 'Виктория' AND middle_name = 'Евгеньевна' AND birth_year = 2004), 3, 49, NULL, 67.45, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1, '2026-06-02', 'Альянова Виктория Евгеньевна', 'МБУ ДО СШОР по борьбе', 'Брянская область', 1, NULL),
  (192, 21, (SELECT id FROM athletes WHERE last_name = 'Сорокина' AND first_name = 'Ольга' AND middle_name = 'Андреевна' AND birth_year = 2003), 4, 41, NULL, 66.55, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1, '2026-06-02', 'Сорокина Ольга Андреевна', 'ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»', 'г. Москва', 1, NULL),
  (193, 21, (SELECT id FROM athletes WHERE last_name = 'Забелинская' AND first_name = 'Дарья' AND middle_name = 'Александровна' AND birth_year = 2003), 5, 33, NULL, 67.1, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1, '2026-06-02', 'Забелинская Дарья Александровна', 'САФУ Арктика', 'Архангельская область', 1, NULL),
  (194, 21, (SELECT id FROM athletes WHERE last_name = 'Бадашкова' AND first_name = 'Нина' AND middle_name = 'Константиновна' AND birth_year = 1991), 6, 23, NULL, 67.5, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1, '2026-06-02', 'Бадашкова Нина Константиновна', 'РО ООО "ВФГС" в Новосибирской области', 'Новосибирская область', 1, NULL),
  (195, 21, (SELECT id FROM athletes WHERE last_name = 'Попова' AND first_name = 'Ольга' AND middle_name = 'Сергеевна' AND birth_year = 2002), 7, 12, NULL, 66.9, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1, '2026-06-02', 'Попова Ольга Сергеевна', 'Федерация гиревого спорта Алтайского Края', 'Алтайский край', 1, NULL),
  (196, 22, (SELECT id FROM athletes WHERE last_name = 'Полякова' AND first_name = 'Полина' AND middle_name = 'Сергеевна' AND birth_year = 1999), 1, 113, NULL, 88.2, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1, '2026-06-02', 'Полякова Полина Сергеевна', 'ТРО ООО «ВФГС»', 'Тюменская область', 1, NULL),
  (197, 22, (SELECT id FROM athletes WHERE last_name = 'Мартынова' AND first_name = 'Ирина' AND middle_name = 'Александровна' AND birth_year = 1999), 2, 105, NULL, 87.45, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1, '2026-06-02', 'Мартынова Ирина Александровна', 'СШОР «Маршал»', 'Калужская область', 1, NULL),
  (198, 22, (SELECT id FROM athletes WHERE last_name = 'Вяткина' AND first_name = 'Вера' AND middle_name = 'Павловна' AND birth_year = 1999), 3, 95, NULL, 126.45, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1, '2026-06-02', 'Вяткина Вера Павловна', 'РО ООО «ВФГС» в Омской области', 'Омская область', 1, NULL),
  (199, 22, (SELECT id FROM athletes WHERE last_name = 'Филимонова' AND first_name = 'Карина' AND middle_name = 'Денисовна' AND birth_year = 2006), 4, 87, NULL, 85.45, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1, '2026-06-02', 'Филимонова Карина Денисовна', 'КОГАУ «СШОР «Юность»', 'Кировская область', 1, NULL),
  (200, 22, (SELECT id FROM athletes WHERE last_name = 'Фирулева' AND first_name = 'Василиса' AND middle_name = 'Владимировна' AND birth_year = 2004), 5, 81, NULL, 68.4, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1, '2026-06-02', 'Фирулева Василиса Владимировна', 'МАУ ДО СШ Геолог', 'Ямало-Ненецкий автономный округ', 1, NULL),
  (201, 22, (SELECT id FROM athletes WHERE last_name = 'Врубель' AND first_name = 'Дарья' AND middle_name = 'Васильевна' AND birth_year = 2000), 6, 68, NULL, 100.6, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1, '2026-06-02', 'Врубель Дарья Васильевна', 'БУ ДО города Омска «СШОР №33»', 'Омская область', 1, NULL),
  (202, 22, (SELECT id FROM athletes WHERE last_name = 'Махкамова' AND first_name = 'Парвина' AND middle_name = 'Маруфовна' AND birth_year = 2007), 7, 61, NULL, 88.15, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1, '2026-06-02', 'Махкамова Парвина Маруфовна', 'МАУ ДО «СШ «Прикамье» г. Перми', 'Пермский край', 1, NULL),
  (203, 22, (SELECT id FROM athletes WHERE last_name = 'Попова' AND first_name = 'Мария' AND middle_name = 'Алексеевна' AND birth_year = 2005), 8, 51, NULL, 80.8, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1, '2026-06-02', 'Попова Мария Алексеевна', 'ССК «КИТ на спорте"', 'Пермский край', 1, NULL),
  (204, 22, (SELECT id FROM athletes WHERE last_name = 'Баранова' AND first_name = 'Дарья' AND middle_name = 'Андреевна' AND birth_year = 2008), 9, 47, NULL, 68.1, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1, '2026-06-02', 'Баранова Дарья Андреевна', 'МАУ ДО «Спортивная школа»', 'Ханты-Мансийский АО - Югра', 1, NULL),
  (205, 22, (SELECT id FROM athletes WHERE last_name = 'Побережная' AND first_name = 'Анна' AND middle_name = 'Владимировна' AND birth_year = 2010), 10, 42, NULL, 77.75, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1, '2026-06-02', 'Побережная Анна Владимировна', 'СШОР «Маршал»', 'Калужская область', 1, NULL),
  (206, 22, (SELECT id FROM athletes WHERE last_name = 'Новикова' AND first_name = 'Полина' AND middle_name = 'Феликсовна' AND birth_year = 2012), 11, 24, NULL, 91.05, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 24, 'two', 10, 1, '2026-06-02', 'Новикова Полина Феликсовна', 'КОГАУ "СШОР "Юность"', 'Кировская область', 1, NULL),
  (207, 23, (SELECT id FROM athletes WHERE last_name = 'Бутенко' AND first_name = 'Евгений' AND middle_name = 'Александрович' AND birth_year = 1995), 1, 183, NULL, 62.9, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Бутенко Евгений Александрович', 'ГАУ НСО «РЦСП СК и СР»', 'Новосибирская область', 1, NULL),
  (208, 23, (SELECT id FROM athletes WHERE last_name = 'Бенидзе' AND first_name = 'Джони' AND middle_name = 'Бадриевич' AND birth_year = 1990), 2, 174, NULL, 62.6, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Бенидзе Джони Бадриевич', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 1, NULL),
  (209, 23, (SELECT id FROM athletes WHERE last_name = 'Ховалко' AND first_name = 'Василий' AND middle_name = 'Михайлович' AND birth_year = 1993), 3, 151, NULL, 62.3, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Ховалко Василий Михайлович', 'МАУ ДО СШ Геолог', 'Ямало-Ненецкий автономный округ', 1, NULL),
  (210, 23, (SELECT id FROM athletes WHERE last_name = 'Ильясов' AND first_name = 'Какен' AND middle_name = 'Канатович' AND birth_year = 1993), 4, 149, NULL, 63.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Ильясов Какен Канатович', 'ВС РФ', 'Омская область', 1, NULL),
  (211, 23, (SELECT id FROM athletes WHERE last_name = 'Сиразетдинов' AND first_name = 'Данил' AND middle_name = 'Ильфатович' AND birth_year = 2007), 5, 130, NULL, 62.2, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Сиразетдинов Данил Ильфатович', 'МАУ ДО «СШ «Прикамье» г. Перми', 'Пермский край', 1, NULL),
  (212, 23, (SELECT id FROM athletes WHERE last_name = 'Манаков' AND first_name = 'Трофим' AND middle_name = 'Анатольевич' AND birth_year = 2000), 6, 94, NULL, 63.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Манаков Трофим Анатольевич', 'МАУ ДО «СШ №2» Сургутского района', 'Ханты-Мансийский АО - Югра', 1, NULL),
  (213, 23, (SELECT id FROM athletes WHERE last_name = 'Кашкаров' AND first_name = 'Артур' AND middle_name = 'Анатольевич' AND birth_year = 2005), 7, 93, NULL, 63.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Кашкаров Артур Анатольевич', 'спортивный клуб "АГАУ"', 'Алтайский край', 1, NULL),
  (214, 23, (SELECT id FROM athletes WHERE last_name = 'Половников' AND first_name = 'Павел' AND middle_name = 'Викторович' AND birth_year = 2002), 8, 90, NULL, 62.1, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Половников Павел Викторович', 'МБУ ДО «ДЮСШ «Спарт»', 'Пермский край', 1, NULL),
  (215, 23, (SELECT id FROM athletes WHERE last_name = 'Кормилицын' AND first_name = 'Иван' AND middle_name = 'Николаевич' AND birth_year = 2010), 9, 88, NULL, 62.8, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Кормилицын Иван Николаевич', 'СШОР «Маршал»', 'Калужская область', 1, NULL),
  (216, 23, (SELECT id FROM athletes WHERE last_name = 'Абросов' AND first_name = 'Алексей' AND middle_name = 'Владимирович' AND birth_year = 1991), 10, 78, NULL, 62.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Абросов Алексей Владимирович', 'Динамо', 'Томская область', 1, NULL),
  (217, 24, (SELECT id FROM athletes WHERE last_name = 'Бенидзе' AND first_name = 'Спартак' AND middle_name = 'Бадриевич' AND birth_year = 2002), 1, 196, NULL, 67.65, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Бенидзе Спартак Бадриевич', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 1, NULL),
  (218, 24, (SELECT id FROM athletes WHERE last_name = 'Василевич' AND first_name = 'Добрыня' AND middle_name = 'Андреевич' AND birth_year = 2000), 2, 190, NULL, 67.75, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Василевич Добрыня Андреевич', 'МБУ ДО СШ №3, г. Улан-Удэ', 'Республика Бурятия', 1, NULL),
  (219, 24, (SELECT id FROM athletes WHERE last_name = 'Морозович' AND first_name = 'Владислав' AND middle_name = 'Павлович' AND birth_year = 1999), 3, 190, NULL, 68.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Морозович Владислав Павлович', 'РЦСП', 'Омская область', 1, NULL),
  (220, 24, (SELECT id FROM athletes WHERE last_name = 'Узокин' AND first_name = 'Анатолий' AND middle_name = 'Эдуардович' AND birth_year = 2000), 4, 187, NULL, 67.1, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Узокин Анатолий Эдуардович', 'ФСК "Улап", СШ Энергия', 'Чувашская Республика', 1, NULL),
  (221, 24, (SELECT id FROM athletes WHERE last_name = 'Щербин' AND first_name = 'Олег' AND middle_name = 'Владимирович' AND birth_year = 1989), 5, 186, NULL, 67.55, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Щербин Олег Владимирович', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 1, NULL),
  (222, 24, (SELECT id FROM athletes WHERE last_name = 'Смагулов' AND first_name = 'Нурсултан' AND middle_name = 'Шайзандинович' AND birth_year = 1999), 6, 171, NULL, 67.9, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Смагулов Нурсултан Шайзандинович', 'СШОР "Краевского В.Ф."', 'г. Санкт-Петербург', 1, NULL),
  (223, 24, (SELECT id FROM athletes WHERE last_name = 'Петушков' AND first_name = 'Денис' AND middle_name = 'Владимирович' AND birth_year = 1986), 7, 170, NULL, 67.3, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Петушков Денис Владимирович', 'КШС 1', 'Смоленская область', 1, NULL),
  (224, 24, (SELECT id FROM athletes WHERE last_name = 'Захаров' AND first_name = 'Кирилл' AND middle_name = 'Дмитриевич' AND birth_year = 2007), 8, 167, NULL, 67.7, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Захаров Кирилл Дмитриевич', 'МУ ДО «МЦРФКиС» Черепановского района', 'Новосибирская область', 1, NULL),
  (225, 24, (SELECT id FROM athletes WHERE last_name = 'Потапов' AND first_name = 'Данил' AND middle_name = 'Алексеевич' AND birth_year = 2002), 9, 161, NULL, 67.7, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Потапов Данил Алексеевич', 'МБУДО "Лебяжьевская ДЮСШ"', 'Курганская область', 1, NULL),
  (226, 24, (SELECT id FROM athletes WHERE last_name = 'Цыбаев' AND first_name = 'Илья' AND middle_name = 'Алексеевич' AND birth_year = 1999), 10, 145, NULL, 67.75, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Цыбаев Илья Алексеевич', 'Центр «Поиск»', 'Томская область', 1, NULL),
  (227, 24, (SELECT id FROM athletes WHERE last_name = 'Рыбский' AND first_name = 'Павел' AND middle_name = 'Сергеевич' AND birth_year = 2008), 11, 140, NULL, 68.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Рыбский Павел Сергеевич', 'Спортивная школа №1 в Асино', 'Томская область', 1, NULL),
  (228, 24, (SELECT id FROM athletes WHERE last_name = 'Куликов' AND first_name = 'Сергей' AND middle_name = 'Александрович' AND birth_year = 1985), 12, 101, NULL, 67.15, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Куликов Сергей Александрович', 'РО ООО ВФГС в НСО', 'Новосибирская область', 1, NULL),
  (229, 25, (SELECT id FROM athletes WHERE last_name = 'Рассадин' AND first_name = 'Андрей' AND middle_name = 'Андреевич' AND birth_year = 1989), 1, 204, NULL, 72.9, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Рассадин Андрей Андреевич', 'МБУ ДО «Онохойская СШ»', 'Республика Бурятия', 1, NULL),
  (230, 25, (SELECT id FROM athletes WHERE last_name = 'Мащенко' AND first_name = 'Олег' AND middle_name = 'Валерьевич' AND birth_year = 1983), 2, 184, NULL, 72.5, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Мащенко Олег Валерьевич', 'ВС', 'Краснодарский край', 1, NULL),
  (231, 25, (SELECT id FROM athletes WHERE last_name = 'Балашов' AND first_name = 'Максим' AND middle_name = 'Юрьевич' AND birth_year = 1990), 3, 176, NULL, 72.85, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Балашов Максим Юрьевич', 'РООО "ВФГС" в Ивановской области', 'Ивановская область', 1, NULL),
  (232, 25, (SELECT id FROM athletes WHERE last_name = 'Суслов' AND first_name = 'Александр' AND middle_name = 'Владимирович' AND birth_year = 1986), 4, 174, NULL, 72.45, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Суслов Александр Владимирович', 'МБУДО "Каргапольская ДЮСШ"', 'Курганская область', 1, NULL),
  (233, 25, (SELECT id FROM athletes WHERE last_name = 'Воронов' AND first_name = 'Иван' AND middle_name = 'Андреевич' AND birth_year = 1991), 5, 173, NULL, 72.6, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Воронов Иван Андреевич', 'МБУ ДО СШ №3 г.Улан-Удэ', 'Республика Бурятия', 1, NULL),
  (234, 25, (SELECT id FROM athletes WHERE last_name = 'Жибинов' AND first_name = 'Фёдор' AND middle_name = 'Васильевич' AND birth_year = 2004), 6, 170, NULL, 72.85, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Жибинов Фёдор Васильевич', 'Спортивная школа г.Черногорск', 'Республика Хакасия', 1, NULL),
  (235, 25, (SELECT id FROM athletes WHERE last_name = 'Волдаев' AND first_name = 'Александр' AND middle_name = 'Владимирович' AND birth_year = 2000), 7, 162, NULL, 72.75, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Волдаев Александр Владимирович', 'Федерация гиревого спорта Томской области', 'Томская область', 1, NULL),
  (236, 25, (SELECT id FROM athletes WHERE last_name = 'Балдин' AND first_name = 'Александр' AND middle_name = 'Васильевич' AND birth_year = 1993), 8, 149, NULL, 71.45, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Балдин Александр Васильевич', 'РО ООО "ВФГС" СО', 'Самарская область', 1, NULL),
  (237, 25, (SELECT id FROM athletes WHERE last_name = 'Паклин' AND first_name = 'Павел' AND middle_name = 'Алексеевич' AND birth_year = 1990), 9, 148, NULL, 72.4, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Паклин Павел Алексеевич', 'ССК «КИТ на спорте»', 'Пермский край', 1, NULL),
  (238, 25, (SELECT id FROM athletes WHERE last_name = 'Карпов' AND first_name = 'Владислав' AND middle_name = 'Алексеевич' AND birth_year = 1999), 10, 146, NULL, 72.55, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Карпов Владислав Алексеевич', '—', 'Мурманская область', 1, NULL),
  (239, 25, (SELECT id FROM athletes WHERE last_name = 'Седых' AND first_name = 'Илья' AND middle_name = 'Александрович' AND birth_year = 2004), 11, 132, NULL, 72.2, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Седых Илья Александрович', 'БУ ДО города Омска «СШОР N33»', 'Омская область', 1, NULL),
  (240, 25, (SELECT id FROM athletes WHERE last_name = 'Трофимов' AND first_name = 'Тимур' AND middle_name = 'Михайлович' AND birth_year = 2011), 12, 123, NULL, 72.85, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Трофимов Тимур Михайлович', 'СШОР Маршал', 'Калужская область', 1, NULL),
  (241, 25, (SELECT id FROM athletes WHERE last_name = 'Багров' AND first_name = 'Максим' AND middle_name = 'Дмитриевич' AND birth_year = 2009), 13, 112, NULL, 72.2, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Багров Максим Дмитриевич', 'РО ООО "ВФГС" в г. Москве', 'г. Москва', 1, NULL),
  (242, 25, (SELECT id FROM athletes WHERE last_name = 'Захаров' AND first_name = 'Максим' AND middle_name = 'Александрович' AND birth_year = 2008), 14, 109, NULL, 72.95, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Захаров Максим Александрович', 'МУ ДО «МЦРФКиС» Черепановского района', 'Новосибирская область', 1, NULL),
  (243, 25, (SELECT id FROM athletes WHERE last_name = 'Баер' AND first_name = 'Павел' AND middle_name = 'Арнольдович' AND birth_year = 1983), 15, 87, NULL, 72.4, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Баер Павел Арнольдович', 'ДЮСШ Искитимский район', 'Новосибирская область', 1, NULL),
  (244, 25, (SELECT id FROM athletes WHERE last_name = 'Бацманов' AND first_name = 'Ярослав' AND middle_name = 'Русланович' AND birth_year = 2010), NULL, NULL, NULL, NULL, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Бацманов Ярослав Русланович', 'МБОУ ДО Тогучская СШ', 'Новосибирская область', 1, NULL),
  (245, 26, (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Алексей' AND middle_name = 'Валерьевич' AND birth_year = 1995), 1, 201, NULL, 77.75, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Иванов Алексей Валерьевич', 'СШ Энергия', 'Чувашская Республика', 1, NULL),
  (246, 26, (SELECT id FROM athletes WHERE last_name = 'Шаишников' AND first_name = 'Даниил' AND middle_name = 'Андреевич' AND birth_year = 2008), 2, 193, NULL, 78.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Шаишников Даниил Андреевич', 'МКОУДО ЗАТО Знаменск СШ', 'Астраханская область', 1, NULL),
  (247, 26, (SELECT id FROM athletes WHERE last_name = 'Алексеев' AND first_name = 'Радиф' AND middle_name = 'Дамирович' AND birth_year = 1989), 3, 188, NULL, 77.05, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Алексеев Радиф Дамирович', 'СШ Энергия', 'Чувашская Республика', 1, NULL),
  (248, 26, (SELECT id FROM athletes WHERE last_name = 'Дубель' AND first_name = 'Алексей' AND middle_name = 'Викторович' AND birth_year = 1990), 4, 176, NULL, 78.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Дубель Алексей Викторович', 'МБУДО "Варгашинская СШ"', 'Курганская область', 1, NULL),
  (249, 26, (SELECT id FROM athletes WHERE last_name = 'Степанов' AND first_name = 'Сергей' AND middle_name = 'Владимирович' AND birth_year = 1993), 5, 167, NULL, 77.45, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Степанов Сергей Владимирович', 'Атлет', 'Челябинская область', 1, NULL),
  (250, 26, (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Виталий' AND middle_name = 'Викторович' AND birth_year = 1978), 6, 167, NULL, 77.95, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Иванов Виталий Викторович', 'МБУ ДО СШОР «Югория» им. А.А. Пилояна', 'Ханты-Мансийский АО - Югра', 1, NULL),
  (251, 26, (SELECT id FROM athletes WHERE last_name = 'Иванов' AND first_name = 'Евгений' AND middle_name = 'Игоревич' AND birth_year = 1987), 7, 166, NULL, 77.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Иванов Евгений Игоревич', 'Спортивный клуб ИВЕНГ', 'Забайкальский край', 1, NULL),
  (252, 26, (SELECT id FROM athletes WHERE last_name = 'Гинда' AND first_name = 'Денис' AND middle_name = 'Петрович' AND birth_year = 1979), 8, 164, NULL, 76.4, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Гинда Денис Петрович', 'РО ООО "ВФГС" в г. Москве', 'г. Москва', 1, NULL),
  (253, 26, (SELECT id FROM athletes WHERE last_name = 'Шерин' AND first_name = 'Роман' AND middle_name = 'Витальевич' AND birth_year = 1992), 9, 145, NULL, 78.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Шерин Роман Витальевич', 'РО ООО "ВФГС" в Кемеровской области', 'Кемеровская область', 1, NULL),
  (254, 26, (SELECT id FROM athletes WHERE last_name = 'Зайдензал' AND first_name = 'Артём' AND middle_name = 'Николаевич' AND birth_year = 1987), NULL, NULL, NULL, NULL, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Зайдензал Артём Николаевич', 'РО ООО "ВФГС" в Кемеровской области', 'Кемеровская область', 1, NULL),
  (255, 27, (SELECT id FROM athletes WHERE last_name = 'Плотников' AND first_name = 'Вячеслав' AND middle_name = 'Евгеньевич' AND birth_year = 1998), 1, 213, NULL, 84.15, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Плотников Вячеслав Евгеньевич', 'РО ООО ВФГС в Челябинской области', 'Челябинская область', 1, NULL),
  (256, 27, (SELECT id FROM athletes WHERE last_name = 'Рыскин' AND first_name = 'Сергей' AND middle_name = 'Михайлович' AND birth_year = 1995), 2, 208, NULL, 85.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Рыскин Сергей Михайлович', 'БУ ДО города Омска «СШОР №33»', 'Омская область', 1, NULL),
  (257, 27, (SELECT id FROM athletes WHERE last_name = 'Черкашин' AND first_name = 'Дмитрий' AND middle_name = 'Андреевич' AND birth_year = 1999), 3, 207, NULL, 84.95, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Черкашин Дмитрий Андреевич', 'СШОР Кристалл', 'Томская область', 1, NULL),
  (258, 27, (SELECT id FROM athletes WHERE last_name = 'Кожевников' AND first_name = 'Сергей' AND middle_name = 'Павлович' AND birth_year = 2008), 4, 206, NULL, 83.75, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Кожевников Сергей Павлович', 'МБУ ДО СШ №3 г.Улан-Удэ', 'Республика Бурятия', 1, NULL),
  (259, 27, (SELECT id FROM athletes WHERE last_name = 'Крестьянинов' AND first_name = 'Виктор' AND middle_name = 'Александрович' AND birth_year = 2000), 5, 200, NULL, 84.45, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Крестьянинов Виктор Александрович', 'МАУ ДО «СШ «Прикамье» г. Перми', 'Пермский край', 1, NULL),
  (260, 27, (SELECT id FROM athletes WHERE last_name = 'Бородынкин' AND first_name = 'Олег' AND middle_name = 'Александрович' AND birth_year = 2002), 6, 184, NULL, 85.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Бородынкин Олег Александрович', 'РО ООО "ВФГС" в Новосибирской области', 'Новосибирская область', 1, NULL),
  (261, 27, (SELECT id FROM athletes WHERE last_name = 'Смирнов' AND first_name = 'Руслан' AND middle_name = 'Сергеевич' AND birth_year = 1994), 7, 182, NULL, 84.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Смирнов Руслан Сергеевич', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 1, NULL),
  (262, 27, (SELECT id FROM athletes WHERE last_name = 'Полибин' AND first_name = 'Михаил' AND middle_name = 'Леонидович' AND birth_year = 2004), 8, 180, NULL, 84.45, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Полибин Михаил Леонидович', 'Федерация гиревого спорта Алтайского Края', 'Алтайский край', 1, NULL),
  (263, 27, (SELECT id FROM athletes WHERE last_name = 'Загороднев' AND first_name = 'Максим' AND middle_name = 'Олегович' AND birth_year = 1992), 9, 173, NULL, 82.25, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Загороднев Максим Олегович', 'Динамо', 'Томская область', 1, NULL),
  (264, 27, (SELECT id FROM athletes WHERE last_name = 'Бондарев' AND first_name = 'Дмитрий' AND middle_name = 'Александрович' AND birth_year = 1986), 10, 167, NULL, 81.3, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Бондарев Дмитрий Александрович', 'ГазпромТрансГаз Югорск', 'Ханты-Мансийский АО - Югра', 1, NULL),
  (265, 27, (SELECT id FROM athletes WHERE last_name = 'Малиновский' AND first_name = 'Семён' AND middle_name = 'Андреевич' AND birth_year = 1989), 11, 165, NULL, 83.25, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Малиновский Семён Андреевич', 'РОО ФГСЛО', 'Ленинградская область', 1, NULL),
  (266, 27, (SELECT id FROM athletes WHERE last_name = 'Ветров' AND first_name = 'Денис' AND middle_name = 'Сергеевич' AND birth_year = 1989), 12, 165, NULL, 84.85, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Ветров Денис Сергеевич', 'РО ООО «ВФГС» в г. Москве', 'г. Москва', 1, NULL),
  (267, 27, (SELECT id FROM athletes WHERE last_name = 'Бас' AND first_name = 'Денис' AND middle_name = 'Николаевич' AND birth_year = 2007), 13, 151, NULL, 81.2, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Бас Денис Николаевич', 'МБУ ДО СШОР 5 г Белгород', 'Белгородская область', 1, NULL),
  (268, 27, (SELECT id FROM athletes WHERE last_name = 'Шамара' AND first_name = 'Леонард' AND middle_name = 'Леонидович' AND birth_year = 1974), 14, 139, NULL, 84.5, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Шамара Леонард Леонидович', 'РО ООО ВФГС в г. Москве', 'г. Москва', 1, NULL),
  (269, 28, (SELECT id FROM athletes WHERE last_name = 'Кирюхин' AND first_name = 'Роман' AND middle_name = 'Александрович' AND birth_year = 1997), 1, 216, NULL, 87.8, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Кирюхин Роман Александрович', 'ФГС КО', 'Калужская область', 1, NULL),
  (270, 28, (SELECT id FROM athletes WHERE last_name = 'Спесивцев' AND first_name = 'Данила' AND middle_name = 'Владимирович' AND birth_year = 2003), 2, 214, NULL, 85.25, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Спесивцев Данила Владимирович', 'МБУ ДО СШОР 5 г Белгород', 'Белгородская область', 1, NULL),
  (271, 28, (SELECT id FROM athletes WHERE last_name = 'Поздеев' AND first_name = 'Андрей' AND middle_name = 'Николаевич' AND birth_year = 1990), 3, 210, NULL, 86.7, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Поздеев Андрей Николаевич', 'РО ООО "ВФГС" в Архангельской области', 'Архангельская область', 1, NULL),
  (272, 28, (SELECT id FROM athletes WHERE last_name = 'Кулаков' AND first_name = 'Иван' AND middle_name = 'Иванович' AND birth_year = 1998), 4, 209, NULL, 95.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Кулаков Иван Иванович', 'СШОР «Маршал»', 'Калужская область', 1, NULL),
  (273, 28, (SELECT id FROM athletes WHERE last_name = 'Носков' AND first_name = 'Андрей' AND middle_name = 'Николаевич' AND birth_year = 1993), 5, 205, NULL, 94.4, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Носков Андрей Николаевич', 'МАУ ДО «СШ «Прикамье» г. Перми', 'Пермский край', 1, NULL),
  (274, 28, (SELECT id FROM athletes WHERE last_name = 'Пивень' AND first_name = 'Андрей' AND middle_name = 'Владимирович' AND birth_year = 2003), 6, 193, NULL, 91.4, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Пивень Андрей Владимирович', 'МБУ ДО СШ №3 г.Улан-Удэ', 'Республика Бурятия', 1, NULL),
  (275, 28, (SELECT id FROM athletes WHERE last_name = 'Медведев' AND first_name = 'Николай' AND middle_name = 'Михайлович' AND birth_year = 2006), 7, 184, NULL, 90.9, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Медведев Николай Михайлович', 'СШОРСВС ИМ. В.Ф. КРАЕВСКОГО', 'г. Санкт-Петербург, Ростовская область', 1, NULL),
  (276, 28, (SELECT id FROM athletes WHERE last_name = 'Филиппов' AND first_name = 'Максим' AND middle_name = 'Юрьевич' AND birth_year = 1993), 8, 183, NULL, 93.85, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Филиппов Максим Юрьевич', 'ВС', 'Краснодарский край', 1, NULL),
  (277, 28, (SELECT id FROM athletes WHERE last_name = 'Давыдов' AND first_name = 'Антон' AND middle_name = 'Александрович' AND birth_year = 1982), 9, 178, NULL, 92.3, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Давыдов Антон Александрович', 'Спорт-ЛАЭС', 'Ленинградская область', 1, NULL),
  (278, 28, (SELECT id FROM athletes WHERE last_name = 'Спичкин' AND first_name = 'Алексей' AND middle_name = 'Евгеньевич' AND birth_year = 1994), 10, 177, NULL, 93.3, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Спичкин Алексей Евгеньевич', 'МУ ДО МЦРФКиС Черепановского района', 'Новосибирская область', 1, NULL),
  (279, 28, (SELECT id FROM athletes WHERE last_name = 'Николаев' AND first_name = 'Аркадий' AND middle_name = 'Анатольевич' AND birth_year = 2002), 11, 176, NULL, 88.9, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Николаев Аркадий Анатольевич', 'МБУ ДО СШОР «Югория» им. А.А. Пилояна', 'Ханты-Мансийский АО - Югра', 1, NULL),
  (280, 28, (SELECT id FROM athletes WHERE last_name = 'Купш' AND first_name = 'Денис' AND middle_name = 'Аркадьевич' AND birth_year = 2004), 12, 176, NULL, 93.9, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Купш Денис Аркадьевич', 'БУ ДО города Омска «СШОР №33»', 'Омская область', 1, NULL),
  (281, 28, (SELECT id FROM athletes WHERE last_name = 'Кудашев' AND first_name = 'Денис' AND middle_name = 'Андреевич' AND birth_year = 1988), 13, 175, NULL, 88.45, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Кудашев Денис Андреевич', 'МБУ ДО «Онохойская СШ»', 'Республика Бурятия', 1, NULL),
  (282, 28, (SELECT id FROM athletes WHERE last_name = 'Черкашин' AND first_name = 'Иван' AND middle_name = 'Андреевич' AND birth_year = 1999), 14, 172, NULL, 92.9, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Черкашин Иван Андреевич', 'СШОР', 'Томская область', 1, NULL),
  (283, 28, (SELECT id FROM athletes WHERE last_name = 'Чупин' AND first_name = 'Никита' AND middle_name = 'Владимирович' AND birth_year = 1988), 15, 166, NULL, 94.4, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Чупин Никита Владимирович', 'Динамо', 'Томская область', 1, NULL),
  (284, 28, (SELECT id FROM athletes WHERE last_name = 'Захаров' AND first_name = 'Андрей' AND middle_name = 'Валентинович' AND birth_year = 1993), 16, 159, NULL, 93.85, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Захаров Андрей Валентинович', 'РО ООО "ВФГС" в Новосибирской области', 'Новосибирская область', 1, NULL),
  (285, 28, (SELECT id FROM athletes WHERE last_name = 'Шендо' AND first_name = 'Никита' AND middle_name = 'Сергеевич' AND birth_year = 1998), 17, 153, NULL, 90.95, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Шендо Никита Сергеевич', 'КРСОО "Федерация гиревого спорта"', 'Красноярский край', 1, NULL),
  (286, 28, (SELECT id FROM athletes WHERE last_name = 'Ефремов' AND first_name = 'Сергей' AND middle_name = 'Евгеньевич' AND birth_year = 1997), 18, 146, NULL, 91.8, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Ефремов Сергей Евгеньевич', 'РО ООО "ВФГС" в Новосибирской области', 'Новосибирская область', 1, NULL),
  (287, 28, (SELECT id FROM athletes WHERE last_name = 'Кравченко' AND first_name = 'Сергей' AND middle_name = 'Сергеевич' AND birth_year = 1982), 19, 136, NULL, 93.7, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Кравченко Сергей Сергеевич', 'МАУ ДО СШОР', 'Калининградская область', 1, NULL),
  (288, 28, (SELECT id FROM athletes WHERE last_name = 'Нечунаев' AND first_name = 'Александр' AND middle_name = 'Сергеевич' AND birth_year = 1993), 20, 104, NULL, 93.35, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Нечунаев Александр Сергеевич', 'РО ООО "ВФГС" в Новосибирской области', 'Новосибирская область', 1, NULL),
  (289, 29, (SELECT id FROM athletes WHERE last_name = 'Марков' AND first_name = 'Иван' AND middle_name = 'Эдуардович' AND birth_year = 1995), 1, 227, NULL, 99.6, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Марков Иван Эдуардович', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 1, NULL),
  (290, 29, (SELECT id FROM athletes WHERE last_name = 'Орлов' AND first_name = 'Сергей' AND middle_name = 'Александрович' AND birth_year = 2005), 2, 211, NULL, 120.95, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Орлов Сергей Александрович', 'ДЮСШ', 'Ставропольский край', 1, NULL),
  (291, 29, (SELECT id FROM athletes WHERE last_name = 'Турищев' AND first_name = 'Дмитрий' AND middle_name = 'Владимирович' AND birth_year = 1992), 3, 204, NULL, 100.25, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Турищев Дмитрий Владимирович', 'ГБУ ДО МКСШОР «Запад», отделение «Семёрка»', 'г. Москва', 1, NULL),
  (292, 29, (SELECT id FROM athletes WHERE last_name = 'Шевелев' AND first_name = 'Дмитрий' AND middle_name = 'Владимирович' AND birth_year = 1989), 4, 202, NULL, 115.55, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Шевелев Дмитрий Владимирович', 'ВС РФ', 'Новосибирская область', 1, NULL),
  (293, 29, (SELECT id FROM athletes WHERE last_name = 'Симашкевич' AND first_name = 'Евгений' AND middle_name = 'Валентинович' AND birth_year = 1991), 5, 190, NULL, 112.65, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Симашкевич Евгений Валентинович', 'ВС РФ', 'Омская область', 1, NULL),
  (294, 29, (SELECT id FROM athletes WHERE last_name = 'Денисов' AND first_name = 'Иван' AND middle_name = 'Николаевич' AND birth_year = 1982), 6, 186, NULL, 119.25, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Денисов Иван Николаевич', 'ВС РФ', 'Челябинская область', 1, NULL),
  (295, 29, (SELECT id FROM athletes WHERE last_name = 'Павлов' AND first_name = 'Александр' AND middle_name = 'Станиславович' AND birth_year = 1994), 7, 183, NULL, 110.35, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Павлов Александр Станиславович', 'СШ Энергия, ФСК "Улап"', 'Чувашская Республика', 1, NULL),
  (296, 29, (SELECT id FROM athletes WHERE last_name = 'Куликов' AND first_name = 'Владислав' AND middle_name = 'Александрович' AND birth_year = 2006), 8, 179, NULL, 121.7, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Куликов Владислав Александрович', 'РО ООО ВФГС в Челябинской области', 'Челябинская область', 1, NULL),
  (297, 29, (SELECT id FROM athletes WHERE last_name = 'Григорьев' AND first_name = 'Андрей' AND middle_name = 'Анатольевич' AND birth_year = 1987), 9, 163, NULL, 103.05, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Григорьев Андрей Анатольевич', 'Федерация гиревого спорта Свердловской области', 'Свердловская область', 1, NULL),
  (298, 29, (SELECT id FROM athletes WHERE last_name = 'Новиков' AND first_name = 'Александр' AND middle_name = 'Алексеевич' AND birth_year = 1992), 10, 157, NULL, 97.15, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Новиков Александр Алексеевич', 'ДЮСШ Краснозерского района', 'Новосибирская область', 1, NULL),
  (299, 29, (SELECT id FROM athletes WHERE last_name = 'Шишов' AND first_name = 'Михаил' AND middle_name = 'Александрович' AND birth_year = 1982), 11, 119, NULL, 97.1, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Шишов Михаил Александрович', 'Федерация гиревого спорта во Владимирской области', 'Владимирская область', 1, NULL),
  (300, 29, (SELECT id FROM athletes WHERE last_name = 'Усатов' AND first_name = 'Николай' AND middle_name = 'Владимирович' AND birth_year = 1988), 12, 89, NULL, 104.95, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Усатов Николай Владимирович', 'РО ООО "ВФГС" СО', 'Самарская область', 1, NULL),
  (301, 29, (SELECT id FROM athletes WHERE last_name = 'Губко' AND first_name = 'Дмитрий' AND middle_name = 'Сергеевич' AND birth_year = 1987), 13, 51, NULL, 104.0, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 32, 'one', 10, 1, '2026-06-02', 'Губко Дмитрий Сергеевич', 'МВД', 'Новосибирская область', 1, NULL),
  (302, 30, (SELECT id FROM athletes WHERE last_name = 'Жура' AND first_name = 'Александра' AND middle_name = 'Михайловна' AND birth_year = 1988), 1, 194, NULL, 56.8, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Жура Александра Михайловна', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 1, NULL),
  (303, 30, (SELECT id FROM athletes WHERE last_name = 'Щербина' AND first_name = 'Джанита' AND middle_name = 'Вадимовна' AND birth_year = 1991), 2, 187, NULL, 53.35, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Щербина Джанита Вадимовна', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 1, NULL),
  (304, 30, (SELECT id FROM athletes WHERE last_name = 'Балабанова' AND first_name = '(Мажаева)' AND middle_name = 'Наталия Евгеньевна' AND birth_year = 1999), 3, 177, NULL, 56.1, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Балабанова (Мажаева) Наталия Евгеньевна', 'СПБ ГБУ ДО СШОРСВС им. В.Ф.Краевского', 'г. Санкт-Петербург', 1, NULL),
  (305, 30, (SELECT id FROM athletes WHERE last_name = 'Ныныч' AND first_name = 'Маргарита' AND middle_name = 'Анатольевна' AND birth_year = 1996), 4, 170, NULL, 57.5, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Ныныч Маргарита Анатольевна', 'МБУ ДО СШ №3, г. Улан-Удэ', 'Республика Бурятия', 1, NULL),
  (306, 30, (SELECT id FROM athletes WHERE last_name = 'Иванова' AND first_name = 'Алиса' AND middle_name = 'Валерьевна' AND birth_year = 1997), 5, 161, NULL, 57.0, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Иванова Алиса Валерьевна', 'КШС 1/ ВС', 'Смоленская область', 1, NULL),
  (307, 30, (SELECT id FROM athletes WHERE last_name = 'Гладышева' AND first_name = 'Дарья' AND middle_name = 'Алексеевна' AND birth_year = 2004), 6, 145, NULL, 56.35, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Гладышева Дарья Алексеевна', 'Жура Александра Михайловна', 'Курганская область', 1, NULL),
  (308, 30, (SELECT id FROM athletes WHERE last_name = 'Карцова' AND first_name = 'Татьяна' AND middle_name = 'Валерьевна' AND birth_year = 1981), 7, 143, NULL, 57.6, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Карцова Татьяна Валерьевна', 'РО ООО "ВФГС" в Московской области', 'Московская область', 1, NULL),
  (309, 30, (SELECT id FROM athletes WHERE last_name = 'Конева' AND first_name = 'Лилия' AND middle_name = 'Алексеевна' AND birth_year = 2009), 8, 118, NULL, 56.1, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Конева Лилия Алексеевна', 'МБУ ДО СШОР г Губкин', 'Белгородская область', 1, NULL),
  (310, 30, (SELECT id FROM athletes WHERE last_name = 'Белоус' AND first_name = 'Анна' AND middle_name = 'Сергеевна' AND birth_year = 2001), 9, 112, NULL, 54.9, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Белоус Анна Сергеевна', 'МБУ ДО СШОР «Югория» им. А.А. Пилояна', 'Ханты-Мансийский АО - Югра', 1, NULL),
  (311, 30, (SELECT id FROM athletes WHERE last_name = 'Хуснудинова' AND first_name = 'Мария' AND middle_name = 'Петровна' AND birth_year = 2004), 10, 108, NULL, 53.8, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Хуснудинова Мария Петровна', 'РО ООО ВФГС в Челябинской области', 'Челябинская область', 1, NULL),
  (312, 30, (SELECT id FROM athletes WHERE last_name = 'Чернова' AND first_name = 'Кира' AND middle_name = 'Николаевна' AND birth_year = 2009), 11, 101, NULL, 56.25, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Чернова Кира Николаевна', 'СШОР «Маршал»', 'Калужская область', 1, NULL),
  (313, 30, (SELECT id FROM athletes WHERE last_name = 'Аллоярова' AND first_name = 'Милана' AND middle_name = 'Борисовна' AND birth_year = 2002), 12, 99, NULL, 55.95, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Аллоярова Милана Борисовна', 'ТРО ООО ВФГС', 'Тюменская область', 1, NULL),
  (314, 30, (SELECT id FROM athletes WHERE last_name = 'Дементьева' AND first_name = 'Наталья' AND middle_name = 'Сергеевна' AND birth_year = 2010), 13, 87, NULL, 57.05, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Дементьева Наталья Сергеевна', 'СШОР "Старт"', 'Челябинская область', 1, NULL),
  (315, 30, (SELECT id FROM athletes WHERE last_name = 'Тюляева' AND first_name = 'Диана' AND middle_name = 'Александровна' AND birth_year = 2010), 14, 45, NULL, 57.9, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Тюляева Диана Александровна', 'МУ ДО «МЦРФКиС» Черепановского района', 'Новосибирская область', 1, NULL),
  (316, 30, (SELECT id FROM athletes WHERE last_name = 'Коптяева' AND first_name = 'Карина' AND middle_name = 'Мансуровна' AND birth_year = 2007), NULL, NULL, NULL, NULL, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Коптяева Карина Мансуровна', 'СШОР им В.Ф.Краевского', 'г. Санкт-Петербург', 1, NULL),
  (317, 31, (SELECT id FROM athletes WHERE last_name = 'Тарвердиева' AND first_name = 'Мария' AND middle_name = 'Алексеевна' AND birth_year = 1986), 1, 203, NULL, 62.6, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Тарвердиева Мария Алексеевна', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 1, NULL),
  (318, 31, (SELECT id FROM athletes WHERE last_name = 'Дедюхина' AND first_name = 'Ксения' AND middle_name = 'Игоревна' AND birth_year = 1990), 2, 200, NULL, 62.5, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Дедюхина Ксения Игоревна', 'МБУ ДО СШОР «Югория» им. А.А. Пилояна', 'Ханты-Мансийский АО - Югра', 1, NULL),
  (319, 31, (SELECT id FROM athletes WHERE last_name = 'Степанова' AND first_name = 'Оксана' AND middle_name = 'Анатольевна' AND birth_year = 1990), 3, 200, NULL, 62.75, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Степанова Оксана Анатольевна', 'Атлет', 'Челябинская область', 1, NULL),
  (320, 31, (SELECT id FROM athletes WHERE last_name = 'Бурмакина' AND first_name = 'Екатерина' AND middle_name = 'Сергеевна' AND birth_year = 2005), 4, 184, NULL, 62.55, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Бурмакина Екатерина Сергеевна', 'СШ «Татнефть-Олимп»', 'Республика Татарстан', 1, NULL),
  (321, 31, (SELECT id FROM athletes WHERE last_name = 'Чеснокова' AND first_name = 'Екатерина' AND middle_name = 'Игоревна' AND birth_year = 1996), 5, 149, NULL, 62.2, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Чеснокова Екатерина Игоревна', 'ГБУ ДО МКСШОР «Запад», отделение «Семёрка»', 'г. Москва', 1, NULL),
  (322, 31, (SELECT id FROM athletes WHERE last_name = 'Переплетова' AND first_name = 'Яна' AND middle_name = 'Васильевна' AND birth_year = 2009), 6, 88, NULL, 63.0, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Переплетова Яна Васильевна', 'ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»', 'г. Москва', 1, NULL),
  (323, 32, (SELECT id FROM athletes WHERE last_name = 'Башарова' AND first_name = 'Виктория' AND middle_name = 'Васильевна' AND birth_year = 1993), 1, 214, NULL, 67.05, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Башарова Виктория Васильевна', 'Федерация гиревого спорта Республики Бурятия', 'Республика Бурятия', 1, NULL),
  (324, 32, (SELECT id FROM athletes WHERE last_name = 'Бенидзе' AND first_name = 'Елизавета' AND middle_name = 'Бадриевна' AND birth_year = 2002), 2, 208, NULL, 67.65, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Бенидзе Елизавета Бадриевна', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 1, NULL),
  (325, 32, (SELECT id FROM athletes WHERE last_name = 'Сорокина' AND first_name = 'Ольга' AND middle_name = 'Андреевна' AND birth_year = 2003), 3, 200, NULL, 66.5, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Сорокина Ольга Андреевна', 'ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»', 'г. Москва', 1, NULL),
  (326, 32, (SELECT id FROM athletes WHERE last_name = 'Барбакова' AND first_name = 'Наталья' AND middle_name = 'Александровна' AND birth_year = 1984), 4, 182, NULL, 67.75, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Барбакова Наталья Александровна', 'СШОР «Маршал»', 'Калужская область', 1, NULL),
  (327, 32, (SELECT id FROM athletes WHERE last_name = 'Фирса' AND first_name = 'Анна' AND middle_name = 'Сергеевна' AND birth_year = 2003), 5, 179, NULL, 66.45, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Фирса Анна Сергеевна', 'ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»', 'г. Москва, Краснодарский край', 1, NULL),
  (328, 32, (SELECT id FROM athletes WHERE last_name = 'Иванова' AND first_name = 'Нина' AND middle_name = 'Владимировна' AND birth_year = 1988), 6, 171, NULL, 67.35, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Иванова Нина Владимировна', 'Федерация гиревого спорта Республики Бурятия', 'Республика Бурятия', 1, NULL),
  (329, 32, (SELECT id FROM athletes WHERE last_name = 'Потапова' AND first_name = 'Анастасия' AND middle_name = 'Михайловна' AND birth_year = 2004), 7, 148, NULL, 66.0, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Потапова Анастасия Михайловна', 'МАУ ДО ДЮЦ "Старт" города Тюмени', 'Тюменская область', 1, NULL),
  (330, 32, (SELECT id FROM athletes WHERE last_name = 'Суменкова' AND first_name = 'Анастасия' AND middle_name = 'Дмитриевна' AND birth_year = 2009), 8, 142, NULL, 64.2, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Суменкова Анастасия Дмитриевна', 'КШС 1', 'Смоленская область', 1, NULL),
  (331, 32, (SELECT id FROM athletes WHERE last_name = 'Калугина' AND first_name = 'Ирина' AND middle_name = 'Вячеславовна' AND birth_year = 2008), 9, 140, NULL, 67.1, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Калугина Ирина Вячеславовна', 'СШ №1 им. Л.Д. Ковалевского', 'Оренбургская область', 1, NULL),
  (332, 32, (SELECT id FROM athletes WHERE last_name = 'Ельчанинова' AND first_name = 'Вероника' AND middle_name = 'Сергеевна' AND birth_year = 2003), 10, 131, NULL, 67.9, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Ельчанинова Вероника Сергеевна', 'БУ ДО города Омска «СШОР №33»', 'Омская область', 1, NULL),
  (333, 32, (SELECT id FROM athletes WHERE last_name = 'Кошурникова' AND first_name = 'Анастасия' AND middle_name = 'Александровна' AND birth_year = 2003), 11, 115, NULL, 64.05, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Кошурникова Анастасия Александровна', 'МБУ ДО СШОР «Югория» им. А.А. Пилояна', 'Ханты-Мансийский АО - Югра', 1, NULL),
  (334, 32, (SELECT id FROM athletes WHERE last_name = 'Плечова' AND first_name = 'Карина' AND middle_name = 'Юрьевна' AND birth_year = 2007), 12, 110, NULL, 64.7, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Плечова Карина Юрьевна', 'СШ Энергия', 'Чувашская Республика', 1, NULL),
  (335, 32, (SELECT id FROM athletes WHERE last_name = 'Румянцева' AND first_name = 'Дарья' AND middle_name = 'Дмитриевна' AND birth_year = 2003), 13, 107, NULL, 66.5, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Румянцева Дарья Дмитриевна', 'ГБУ ДО МКСШОР «Запад» Отделение «Семёрка»', 'г. Москва', 1, NULL),
  (336, 32, (SELECT id FROM athletes WHERE last_name = 'Андросова' AND first_name = 'Марина' AND middle_name = 'Евгеньевна' AND birth_year = 2007), 14, 91, NULL, 66.6, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Андросова Марина Евгеньевна', 'Федерация гиревого спорта Алтайского Края', 'Алтайский край', 1, NULL),
  (337, 32, (SELECT id FROM athletes WHERE last_name = 'Верт' AND first_name = 'Елена' AND middle_name = 'Сергеевна' AND birth_year = 1991), 15, 81, NULL, 67.35, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Верт Елена Сергеевна', 'СШОР силовых видов спорта имени В. Ф. Краевского', 'г. Санкт-Петербург', 1, NULL),
  (338, 32, (SELECT id FROM athletes WHERE last_name = 'Бурова' AND first_name = 'Маргарита' AND middle_name = 'Андреевна' AND birth_year = 2009), 16, 67, NULL, 64.6, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Бурова Маргарита Андреевна', 'МБУ ДО "ДЮСШ" Татарского МО', 'Новосибирская область', 1, NULL),
  (339, 33, (SELECT id FROM athletes WHERE last_name = 'Кухарева' AND first_name = 'Мария' AND middle_name = 'Сергеевна' AND birth_year = 1989), 1, 214, NULL, 79.45, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Кухарева Мария Сергеевна', 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург', 1, NULL),
  (340, 33, (SELECT id FROM athletes WHERE last_name = 'Мартынова' AND first_name = 'Ирина' AND middle_name = 'Александровна' AND birth_year = 1999), 2, 206, NULL, 87.45, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Мартынова Ирина Александровна', 'СШОР «Маршал»', 'Калужская область', 1, NULL),
  (341, 33, (SELECT id FROM athletes WHERE last_name = 'Полякова' AND first_name = 'Полина' AND middle_name = 'Сергеевна' AND birth_year = 1999), 3, 200, NULL, 88.5, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Полякова Полина Сергеевна', 'ТРО ООО «ВФГС»', 'Тюменская область', 1, NULL),
  (342, 33, (SELECT id FROM athletes WHERE last_name = 'Островская' AND first_name = 'Надежда' AND middle_name = 'Аркадьевна' AND birth_year = 1985), 4, 187, NULL, 93.15, (SELECT id FROM sport_ranks WHERE code = 'msmk'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Островская Надежда Аркадьевна', 'МБУ ДО СШОР «Югория» им. А.А. Пилояна', 'Ханты-Мансийский АО - Югра', 1, NULL),
  (343, 33, (SELECT id FROM athletes WHERE last_name = 'Копылова' AND first_name = 'Регина' AND middle_name = 'Геннадьевна' AND birth_year = 2001), 5, 177, NULL, 89.35, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Копылова Регина Геннадьевна', 'ДЮСШ Искитимского района', 'Новосибирская область', 1, NULL),
  (344, 33, (SELECT id FROM athletes WHERE last_name = 'Ходунова' AND first_name = 'Ирина' AND middle_name = 'Геннадьевна' AND birth_year = 1985), 6, 172, NULL, 87.8, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Ходунова Ирина Геннадьевна', 'КШС 1/ ВС', 'Смоленская область', 1, NULL),
  (345, 33, (SELECT id FROM athletes WHERE last_name = 'Скоробогатова' AND first_name = 'Юлия' AND middle_name = 'Владимировна' AND birth_year = 1987), 7, 150, NULL, 69.1, (SELECT id FROM sport_ranks WHERE code = 'ms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Скоробогатова Юлия Владимировна', 'МАУ ДО СШОР', 'Калининградская область', 1, NULL),
  (346, 33, (SELECT id FROM athletes WHERE last_name = 'Врубель' AND first_name = 'Дарья' AND middle_name = 'Васильевна' AND birth_year = 2000), 8, 135, NULL, 101.0, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Врубель Дарья Васильевна', 'БУ ДО города Омска «СШОР №33»', 'Омская область', 1, NULL),
  (347, 33, (SELECT id FROM athletes WHERE last_name = 'Кузьмичева' AND first_name = 'Ксения' AND middle_name = 'Сергеевна' AND birth_year = 2004), 9, 112, NULL, 80.05, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Кузьмичева Ксения Сергеевна', 'СШ №1 им. Л.Д. Ковалевского', 'Оренбургская область', 1, NULL),
  (348, 33, (SELECT id FROM athletes WHERE last_name = 'Кравцова' AND first_name = 'Елизавета' AND middle_name = 'Максимовна' AND birth_year = 2009), 10, 101, NULL, 73.6, (SELECT id FROM sport_ranks WHERE code = 'kms'), (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Кравцова Елизавета Максимовна', 'МАУ ДО Спортивная школа "ПОБЕДА"', 'Томская область', 1, NULL),
  (349, 33, (SELECT id FROM athletes WHERE last_name = 'Вертинская' AND first_name = 'Анна' AND middle_name = 'Алексеевна' AND birth_year = 2009), 11, 85, NULL, 77.7, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Вертинская Анна Алексеевна', '—', 'Алтайский край', 1, NULL),
  (350, 33, (SELECT id FROM athletes WHERE last_name = 'Редингер' AND first_name = 'Александра' AND middle_name = 'Ивановна' AND birth_year = 2008), 12, 76, NULL, 81.95, NULL, (SELECT id FROM disciplines WHERE code = 'snatch'), 24, 'one', 10, 1, '2026-06-02', 'Редингер Александра Ивановна', 'МУ ДО «МЦРФКиС» Черепановского района', 'Новосибирская область', 1, NULL);

INSERT INTO result_reps (id, result_id, exercise, hand, reps) VALUES
  (1, 1, 'long_cycle', 'both', 81),
  (2, 2, 'long_cycle', 'both', 61),
  (3, 3, 'long_cycle', 'both', 56),
  (4, 4, 'long_cycle', 'both', 55),
  (5, 5, 'long_cycle', 'both', 54),
  (6, 6, 'long_cycle', 'both', 52),
  (7, 7, 'long_cycle', 'both', 44),
  (8, 8, 'long_cycle', 'both', 38),
  (9, 9, 'long_cycle', 'both', 11),
  (10, 10, 'long_cycle', 'both', 73),
  (11, 11, 'long_cycle', 'both', 70),
  (12, 12, 'long_cycle', 'both', 67),
  (13, 13, 'long_cycle', 'both', 67),
  (14, 14, 'long_cycle', 'both', 61),
  (15, 15, 'long_cycle', 'both', 58),
  (16, 16, 'long_cycle', 'both', 56),
  (17, 17, 'long_cycle', 'both', 45),
  (18, 18, 'long_cycle', 'both', 42),
  (19, 19, 'long_cycle', 'both', 79),
  (20, 20, 'long_cycle', 'both', 78),
  (21, 21, 'long_cycle', 'both', 71),
  (22, 22, 'long_cycle', 'both', 69),
  (23, 23, 'long_cycle', 'both', 66),
  (24, 24, 'long_cycle', 'both', 65),
  (25, 25, 'long_cycle', 'both', 51),
  (26, 26, 'long_cycle', 'both', 46),
  (27, 27, 'long_cycle', 'both', 44),
  (28, 28, 'long_cycle', 'both', 34),
  (29, 29, 'long_cycle', 'both', 31),
  (30, 30, 'long_cycle', 'both', 81),
  (31, 31, 'long_cycle', 'both', 79),
  (32, 32, 'long_cycle', 'both', 79),
  (33, 33, 'long_cycle', 'both', 78),
  (34, 34, 'long_cycle', 'both', 67),
  (35, 35, 'long_cycle', 'both', 67),
  (36, 36, 'long_cycle', 'both', 65),
  (37, 37, 'long_cycle', 'both', 65),
  (38, 38, 'long_cycle', 'both', 61),
  (39, 39, 'long_cycle', 'both', 54),
  (40, 40, 'long_cycle', 'both', 48),
  (41, 41, 'long_cycle', 'both', 47),
  (42, 42, 'long_cycle', 'both', 47),
  (43, 43, 'long_cycle', 'both', 91),
  (44, 44, 'long_cycle', 'both', 85),
  (45, 45, 'long_cycle', 'both', 83),
  (46, 46, 'long_cycle', 'both', 81),
  (47, 47, 'long_cycle', 'both', 78),
  (48, 48, 'long_cycle', 'both', 76),
  (49, 49, 'long_cycle', 'both', 69),
  (50, 50, 'long_cycle', 'both', 64),
  (51, 51, 'long_cycle', 'both', 57),
  (52, 52, 'long_cycle', 'both', 56),
  (53, 53, 'long_cycle', 'both', 99),
  (54, 54, 'long_cycle', 'both', 82),
  (55, 55, 'long_cycle', 'both', 81),
  (56, 56, 'long_cycle', 'both', 75),
  (57, 57, 'long_cycle', 'both', 64),
  (58, 58, 'long_cycle', 'both', 59),
  (59, 59, 'long_cycle', 'both', 58),
  (60, 60, 'long_cycle', 'both', 52),
  (61, 61, 'long_cycle', 'both', 50),
  (62, 62, 'long_cycle', 'both', 40),
  (63, 63, 'long_cycle', 'both', 95),
  (64, 64, 'long_cycle', 'both', 94),
  (65, 65, 'long_cycle', 'both', 92),
  (66, 66, 'long_cycle', 'both', 89),
  (67, 67, 'long_cycle', 'both', 82),
  (68, 68, 'long_cycle', 'both', 63),
  (69, 69, 'long_cycle', 'both', 46),
  (70, 70, 'long_cycle', 'both', 35),
  (71, 71, 'long_cycle', 'both', 63),
  (72, 72, 'long_cycle', 'both', 50),
  (73, 73, 'long_cycle', 'both', 40),
  (74, 74, 'long_cycle', 'both', 39),
  (75, 75, 'long_cycle', 'both', 30),
  (76, 76, 'long_cycle', 'both', 28),
  (77, 77, 'long_cycle', 'both', 28),
  (78, 78, 'long_cycle', 'both', 7),
  (79, 79, 'long_cycle', 'both', 73),
  (80, 80, 'long_cycle', 'both', 50),
  (81, 81, 'long_cycle', 'both', 49),
  (82, 82, 'long_cycle', 'both', 47),
  (83, 83, 'long_cycle', 'both', 39),
  (84, 84, 'long_cycle', 'both', 30),
  (85, 85, 'long_cycle', 'both', 71),
  (86, 86, 'long_cycle', 'both', 62),
  (87, 87, 'long_cycle', 'both', 58),
  (88, 88, 'long_cycle', 'both', 38),
  (89, 89, 'long_cycle', 'both', 28),
  (90, 90, 'long_cycle', 'both', 27),
  (91, 91, 'long_cycle', 'both', 26),
  (92, 92, 'long_cycle', 'both', 85),
  (93, 93, 'long_cycle', 'both', 70),
  (94, 94, 'long_cycle', 'both', 61),
  (95, 95, 'long_cycle', 'both', 53),
  (96, 96, 'long_cycle', 'both', 53),
  (97, 97, 'long_cycle', 'both', 47),
  (98, 98, 'long_cycle', 'both', 46),
  (99, 99, 'long_cycle', 'both', 30),
  (100, 100, 'long_cycle', 'both', 20),
  (101, 101, 'jerk', 'both', 142),
  (102, 102, 'jerk', 'both', 140),
  (103, 103, 'jerk', 'both', 102),
  (104, 104, 'jerk', 'both', 72),
  (105, 105, 'jerk', 'both', 70),
  (106, 106, 'jerk', 'both', 65),
  (107, 107, 'jerk', 'both', 62),
  (108, 108, 'jerk', 'both', 60),
  (109, 109, 'jerk', 'both', 51),
  (110, 110, 'jerk', 'both', 27),
  (111, 111, 'jerk', 'both', 10),
  (112, 112, 'jerk', 'both', 136),
  (113, 113, 'jerk', 'both', 115),
  (114, 114, 'jerk', 'both', 111),
  (115, 115, 'jerk', 'both', 111),
  (116, 116, 'jerk', 'both', 109),
  (117, 117, 'jerk', 'both', 100),
  (118, 118, 'jerk', 'both', 100),
  (119, 119, 'jerk', 'both', 68),
  (120, 120, 'jerk', 'both', 65),
  (121, 121, 'jerk', 'both', 62),
  (122, 122, 'jerk', 'both', 52),
  (123, 123, 'jerk', 'both', 141),
  (124, 124, 'jerk', 'both', 135),
  (125, 125, 'jerk', 'both', 122),
  (126, 126, 'jerk', 'both', 121),
  (127, 127, 'jerk', 'both', 105),
  (128, 128, 'jerk', 'both', 97),
  (129, 129, 'jerk', 'both', 88),
  (130, 130, 'jerk', 'both', 84),
  (131, 131, 'jerk', 'both', 73),
  (132, 132, 'jerk', 'both', 71),
  (133, 133, 'jerk', 'both', 49),
  (134, 134, 'jerk', 'both', 137),
  (135, 135, 'jerk', 'both', 129),
  (136, 136, 'jerk', 'both', 127),
  (137, 137, 'jerk', 'both', 123),
  (138, 138, 'jerk', 'both', 116),
  (139, 139, 'jerk', 'both', 115),
  (140, 140, 'jerk', 'both', 96),
  (141, 141, 'jerk', 'both', 81),
  (142, 142, 'jerk', 'both', 80),
  (143, 143, 'jerk', 'both', 61),
  (144, 144, 'jerk', 'both', 146),
  (145, 145, 'jerk', 'both', 141),
  (146, 146, 'jerk', 'both', 136),
  (147, 147, 'jerk', 'both', 123),
  (148, 148, 'jerk', 'both', 112),
  (149, 149, 'jerk', 'both', 110),
  (150, 150, 'jerk', 'both', 109),
  (151, 151, 'jerk', 'both', 100),
  (152, 152, 'jerk', 'both', 87),
  (153, 153, 'jerk', 'both', 86),
  (154, 154, 'jerk', 'both', 85),
  (155, 155, 'jerk', 'both', 82),
  (156, 156, 'jerk', 'both', 153),
  (157, 157, 'jerk', 'both', 147),
  (158, 158, 'jerk', 'both', 141),
  (159, 159, 'jerk', 'both', 128),
  (160, 160, 'jerk', 'both', 123),
  (161, 161, 'jerk', 'both', 111),
  (162, 162, 'jerk', 'both', 107),
  (163, 163, 'jerk', 'both', 104),
  (164, 164, 'jerk', 'both', 101),
  (165, 165, 'jerk', 'both', 94),
  (166, 166, 'jerk', 'both', 94),
  (167, 167, 'jerk', 'both', 89),
  (168, 168, 'jerk', 'both', 171),
  (169, 169, 'jerk', 'both', 160),
  (170, 170, 'jerk', 'both', 134),
  (171, 171, 'jerk', 'both', 108),
  (172, 172, 'jerk', 'both', 99),
  (173, 173, 'jerk', 'both', 31),
  (174, 174, 'jerk', 'both', 76),
  (175, 175, 'jerk', 'both', 71),
  (176, 176, 'jerk', 'both', 64),
  (177, 177, 'jerk', 'both', 50),
  (178, 178, 'jerk', 'both', 25),
  (179, 179, 'jerk', 'both', 21),
  (180, 180, 'jerk', 'both', 105),
  (181, 181, 'jerk', 'both', 66),
  (182, 182, 'jerk', 'both', 60),
  (183, 183, 'jerk', 'both', 52),
  (184, 184, 'jerk', 'both', 49),
  (185, 185, 'jerk', 'both', 38),
  (186, 186, 'jerk', 'both', 31),
  (187, 187, 'jerk', 'both', 27),
  (188, 188, 'jerk', 'both', 22),
  (189, 189, 'jerk', 'both', 90),
  (190, 190, 'jerk', 'both', 80),
  (191, 191, 'jerk', 'both', 49),
  (192, 192, 'jerk', 'both', 41),
  (193, 193, 'jerk', 'both', 33),
  (194, 194, 'jerk', 'both', 23),
  (195, 195, 'jerk', 'both', 12),
  (196, 196, 'jerk', 'both', 113),
  (197, 197, 'jerk', 'both', 105),
  (198, 198, 'jerk', 'both', 95),
  (199, 199, 'jerk', 'both', 87),
  (200, 200, 'jerk', 'both', 81),
  (201, 201, 'jerk', 'both', 68),
  (202, 202, 'jerk', 'both', 61),
  (203, 203, 'jerk', 'both', 51),
  (204, 204, 'jerk', 'both', 47),
  (205, 205, 'jerk', 'both', 42),
  (206, 206, 'jerk', 'both', 24),
  (207, 207, 'snatch', 'both', 183),
  (208, 208, 'snatch', 'both', 174),
  (209, 209, 'snatch', 'both', 151),
  (210, 210, 'snatch', 'both', 149),
  (211, 211, 'snatch', 'both', 130),
  (212, 212, 'snatch', 'both', 94),
  (213, 213, 'snatch', 'both', 93),
  (214, 214, 'snatch', 'both', 90),
  (215, 215, 'snatch', 'both', 88),
  (216, 216, 'snatch', 'both', 78),
  (217, 217, 'snatch', 'both', 196),
  (218, 218, 'snatch', 'both', 190),
  (219, 219, 'snatch', 'both', 190),
  (220, 220, 'snatch', 'both', 187),
  (221, 221, 'snatch', 'both', 186),
  (222, 222, 'snatch', 'both', 171),
  (223, 223, 'snatch', 'both', 170),
  (224, 224, 'snatch', 'both', 167),
  (225, 225, 'snatch', 'both', 161),
  (226, 226, 'snatch', 'both', 145),
  (227, 227, 'snatch', 'both', 140),
  (228, 228, 'snatch', 'both', 101),
  (229, 229, 'snatch', 'both', 204),
  (230, 230, 'snatch', 'both', 184),
  (231, 231, 'snatch', 'both', 176),
  (232, 232, 'snatch', 'both', 174),
  (233, 233, 'snatch', 'both', 173),
  (234, 234, 'snatch', 'both', 170),
  (235, 235, 'snatch', 'both', 162),
  (236, 236, 'snatch', 'both', 149),
  (237, 237, 'snatch', 'both', 148),
  (238, 238, 'snatch', 'both', 146),
  (239, 239, 'snatch', 'both', 132),
  (240, 240, 'snatch', 'both', 123),
  (241, 241, 'snatch', 'both', 112),
  (242, 242, 'snatch', 'both', 109),
  (243, 243, 'snatch', 'both', 87),
  (244, 245, 'snatch', 'both', 201),
  (245, 246, 'snatch', 'both', 193),
  (246, 247, 'snatch', 'both', 188),
  (247, 248, 'snatch', 'both', 176),
  (248, 249, 'snatch', 'both', 167),
  (249, 250, 'snatch', 'both', 167),
  (250, 251, 'snatch', 'both', 166),
  (251, 252, 'snatch', 'both', 164),
  (252, 253, 'snatch', 'both', 145),
  (253, 255, 'snatch', 'both', 213),
  (254, 256, 'snatch', 'both', 208),
  (255, 257, 'snatch', 'both', 207),
  (256, 258, 'snatch', 'both', 206),
  (257, 259, 'snatch', 'both', 200),
  (258, 260, 'snatch', 'both', 184),
  (259, 261, 'snatch', 'both', 182),
  (260, 262, 'snatch', 'both', 180),
  (261, 263, 'snatch', 'both', 173),
  (262, 264, 'snatch', 'both', 167),
  (263, 265, 'snatch', 'both', 165),
  (264, 266, 'snatch', 'both', 165),
  (265, 267, 'snatch', 'both', 151),
  (266, 268, 'snatch', 'both', 139),
  (267, 269, 'snatch', 'both', 216),
  (268, 270, 'snatch', 'both', 214),
  (269, 271, 'snatch', 'both', 210),
  (270, 272, 'snatch', 'both', 209),
  (271, 273, 'snatch', 'both', 205),
  (272, 274, 'snatch', 'both', 193),
  (273, 275, 'snatch', 'both', 184),
  (274, 276, 'snatch', 'both', 183),
  (275, 277, 'snatch', 'both', 178),
  (276, 278, 'snatch', 'both', 177),
  (277, 279, 'snatch', 'both', 176),
  (278, 280, 'snatch', 'both', 176),
  (279, 281, 'snatch', 'both', 175),
  (280, 282, 'snatch', 'both', 172),
  (281, 283, 'snatch', 'both', 166),
  (282, 284, 'snatch', 'both', 159),
  (283, 285, 'snatch', 'both', 153),
  (284, 286, 'snatch', 'both', 146),
  (285, 287, 'snatch', 'both', 136),
  (286, 288, 'snatch', 'both', 104),
  (287, 289, 'snatch', 'both', 227),
  (288, 290, 'snatch', 'both', 211),
  (289, 291, 'snatch', 'both', 204),
  (290, 292, 'snatch', 'both', 202),
  (291, 293, 'snatch', 'both', 190),
  (292, 294, 'snatch', 'both', 186),
  (293, 295, 'snatch', 'both', 183),
  (294, 296, 'snatch', 'both', 179),
  (295, 297, 'snatch', 'both', 163),
  (296, 298, 'snatch', 'both', 157),
  (297, 299, 'snatch', 'both', 119),
  (298, 300, 'snatch', 'both', 89),
  (299, 301, 'snatch', 'both', 51),
  (300, 302, 'snatch', 'both', 194),
  (301, 303, 'snatch', 'both', 187),
  (302, 304, 'snatch', 'both', 177),
  (303, 305, 'snatch', 'both', 170),
  (304, 306, 'snatch', 'both', 161),
  (305, 307, 'snatch', 'both', 145),
  (306, 308, 'snatch', 'both', 143),
  (307, 309, 'snatch', 'both', 118),
  (308, 310, 'snatch', 'both', 112),
  (309, 311, 'snatch', 'both', 108),
  (310, 312, 'snatch', 'both', 101),
  (311, 313, 'snatch', 'both', 99),
  (312, 314, 'snatch', 'both', 87),
  (313, 315, 'snatch', 'both', 45),
  (314, 317, 'snatch', 'both', 203),
  (315, 318, 'snatch', 'both', 200),
  (316, 319, 'snatch', 'both', 200),
  (317, 320, 'snatch', 'both', 184),
  (318, 321, 'snatch', 'both', 149),
  (319, 322, 'snatch', 'both', 88),
  (320, 323, 'snatch', 'both', 214),
  (321, 324, 'snatch', 'both', 208),
  (322, 325, 'snatch', 'both', 200),
  (323, 326, 'snatch', 'both', 182),
  (324, 327, 'snatch', 'both', 179),
  (325, 328, 'snatch', 'both', 171),
  (326, 329, 'snatch', 'both', 148),
  (327, 330, 'snatch', 'both', 142),
  (328, 331, 'snatch', 'both', 140),
  (329, 332, 'snatch', 'both', 131),
  (330, 333, 'snatch', 'both', 115),
  (331, 334, 'snatch', 'both', 110),
  (332, 335, 'snatch', 'both', 107),
  (333, 336, 'snatch', 'both', 91),
  (334, 337, 'snatch', 'both', 81),
  (335, 338, 'snatch', 'both', 67),
  (336, 339, 'snatch', 'both', 214),
  (337, 340, 'snatch', 'both', 206),
  (338, 341, 'snatch', 'both', 200),
  (339, 342, 'snatch', 'both', 187),
  (340, 343, 'snatch', 'both', 177),
  (341, 344, 'snatch', 'both', 172),
  (342, 345, 'snatch', 'both', 150),
  (343, 346, 'snatch', 'both', 135),
  (344, 347, 'snatch', 'both', 112),
  (345, 348, 'snatch', 'both', 101),
  (346, 349, 'snatch', 'both', 85),
  (347, 350, 'snatch', 'both', 76);

