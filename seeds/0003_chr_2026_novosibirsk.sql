-- РЕАЛЬНЫЕ ДАННЫЕ. Чемпионат России 2026, Новосибирск, 2–6 июня 2026.
-- Протокол: толчок, мужчины, весовая категория 63 кг, гири 32 кг, регламент 10 мин.
-- weight_class_raw = '63' без единицы: «кг» дописывает рендер (src/render.js), как и у «до 73».
-- ЕКП СМ № 2065000019054780. В шапке протокола: 55 регионов, 1771 участник,
-- рекорд России 151, разрядные нормативы МСМК/МС/КМС не указаны («-»).
-- Эти сведения относятся к соревнованию целиком, полей под них в схеме нет.
--
-- Соревнование НЕ опубликовано (is_published = 0, protocols.status = 'extracted'):
-- автопроверки пройдены, но сверку делает человек (FR-A8), он же проставляет
-- verified_by / verified_at и публикует.
--
-- Идентификаторы с 1000: демо-данные (seeds/0002_demo.sql) генерируются заново
-- и занимают диапазон с 1. Справочные строки, которые демо тоже заводит
-- (регионы, федерация), вставляются через INSERT OR IGNORE и ищутся по имени.

INSERT OR IGNORE INTO regions (name, country) VALUES
  ('Санкт-Петербург', 'RU'),
  ('Новосибирская область', 'RU'),
  ('Пермский край', 'RU'),
  ('Республика Бурятия', 'RU'),
  ('Ханты-Мансийский АО - Югра', 'RU'),
  ('Калужская область', 'RU'),
  ('Алтайский край', 'RU'),
  ('Республика Башкортостан', 'RU'),
  ('Челябинская область', 'RU');

INSERT OR IGNORE INTO region_aliases (alias, region_id) VALUES
  ('г. Санкт-Петербург', (SELECT id FROM regions WHERE name = 'Санкт-Петербург' AND country = 'RU'));

INSERT OR IGNORE INTO federations (name, short_name, country) VALUES
  ('Всероссийская федерация гиревого спорта', 'ВФГС', 'RU');

-- Названия организаций — как в графе «Принадлежность к организации».
INSERT INTO clubs (id, name, region_id) VALUES
  (1001, 'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского',      (SELECT id FROM regions WHERE name = 'Санкт-Петербург' AND country = 'RU')),
  (1002, 'ГАУ НСО «РЦСП СК и СР»',                      (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU')),
  (1003, 'МАУ ДО «СШ «Прикамье» г. Перми',              (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU')),
  (1004, 'МБУ ДО СШ №3, г. Улан-Удэ',                   (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU')),
  (1005, 'МАУ ДО «СШ №2» Сургутского района',           (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')),
  (1006, 'СШОР «Маршал»',                               (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU')),
  (1007, 'спортивный клуб "АГАУ"',                      (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU')),
  (1008, 'МБУ ДО СШОР «Югория» им. А.А. Пилояна',       (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU')),
  (1009, 'МАУ ДО СШОР',                                 (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU')),
  (1010, 'РО ООО ВФГС в Челябинской области',           (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU')),
  (1011, 'МУ ДО «МЦРФКиС» Черепановского района',       (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'));

INSERT INTO athletes (id, last_name, first_name, middle_name, birth_year, sex, region_id, club_id, coach, sport_rank_id) VALUES
  (1001, 'Бенидзе',      'Джони',     'Бадриевич',   1990, 'm', (SELECT id FROM regions WHERE name = 'Санкт-Петербург' AND country = 'RU'),            1001, 'Кириллов С.А., Огарев В.Я., Старовойтов А.Л.',   7),
  (1002, 'Бутенко',      'Евгений',   'Александрович',1995,'m', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'),      1002, 'Бутенко А.А.',                                    7),
  (1003, 'Сиразетдинов', 'Данил',     'Ильфатович',  2007, 'm', (SELECT id FROM regions WHERE name = 'Пермский край' AND country = 'RU'),              1003, 'Мошев Д.И., Ческис О.И.',                         4),
  (1004, 'Кузнецов',     'Роман',     'Андреевич',   2009, 'm', (SELECT id FROM regions WHERE name = 'Республика Бурятия' AND country = 'RU'),         1004, 'Коломин Д.А., Алексеев В.И.',                     4),
  (1005, 'Манаков',      'Трофим',    'Анатольевич', 2000, 'm', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), 1005, 'Трофимова А.А., Садыков Р.И., Дементьев А.Ф.',    5),
  (1006, 'Кормилицын',   'Иван',      'Николаевич',  2010, 'm', (SELECT id FROM regions WHERE name = 'Калужская область' AND country = 'RU'),          1006, 'Пянко И.А.',                                      4),
  (1007, 'Кашкаров',     'Артур',     'Анатольевич', 2005, 'm', (SELECT id FROM regions WHERE name = 'Алтайский край' AND country = 'RU'),             1007, 'Платонов С.С.',                                   4),
  (1008, 'Жалов',        'Ярослав',   'Борисович',   2007, 'm', (SELECT id FROM regions WHERE name = 'Ханты-Мансийский АО - Югра' AND country = 'RU'), 1008, 'Шпартко М.А.',                                    4),
  (1009, 'Митюкевич',    'Станислав', 'Николаевич',  2008, 'm', (SELECT id FROM regions WHERE name = 'Республика Башкортостан' AND country = 'RU'),    1009, 'Гладких В.Л.',                                    3),
  (1010, 'Клявлин',      'Андрей',    'Викторович',  2006, 'm', (SELECT id FROM regions WHERE name = 'Челябинская область' AND country = 'RU'),        1010, 'Симушин А.М., Дедюхин И.В.',                      4),
  (1011, 'Филатов',      'Алексей',   'Александрович',2008,'m', (SELECT id FROM regions WHERE name = 'Новосибирская область' AND country = 'RU'),      1011, 'Бутенко И.А.',                                    3);

INSERT INTO athlete_slugs (slug, athlete_id) VALUES
  ('benidze-dzhoni-1990',        1001),
  ('butenko-evgeniy-1995',       1002),
  ('sirazetdinov-danil-2007',    1003),
  ('kuznecov-roman-2009',        1004),
  ('manakov-trofim-2000',        1005),
  ('kormilicyn-ivan-2010',       1006),
  ('kashkarov-artur-2005',       1007),
  ('zhalov-yaroslav-2007',       1008),
  ('mityukevich-stanislav-2008', 1009),
  ('klyavlin-andrey-2006',       1010),
  ('filatov-aleksey-2008',       1011);

INSERT INTO competitions (id, slug, name, date_start, date_end, city, country, competition_rank_id, federation_id, source_url, is_published) VALUES
  (1001, 'chempionat-rossii-2026-novosibirsk', 'Чемпионат России 2026', '2026-06-02', '2026-06-06', 'Новосибирск', 'RU',
    (SELECT id FROM competition_ranks WHERE code = 'national_ch'),
    (SELECT id FROM federations WHERE name = 'Всероссийская федерация гиревого спорта'),
    NULL, 0);

-- Исходник — одна страница протокола. Число страниц всего документа неизвестно.
INSERT INTO protocols (id, competition_id, r2_key, filename, page_count, is_scan, status, published_at) VALUES
  (1001, 1001, 'protocols/chempionat-rossii-2026-novosibirsk.pdf', 'chempionat-rossii-2026-novosibirsk.pdf', NULL, 1, 'extracted', NULL);

INSERT INTO extraction_runs (protocol_id, run_no, model, prompt_version, finished_at) VALUES
  (1001, 1, 'llm-vision', 'session-manual', '2026-09-15'),
  (1001, 2, 'llm-vision', 'session-manual', '2026-09-15');

-- «Количество участников 1771» в шапке — по всему чемпионату, не по категории,
-- поэтому participants_declared остаётся NULL: проверка row_count неприменима.
INSERT INTO categories (id, competition_id, discipline_id, sex, age_group_id, division_id, bell_kg, hands, time_limit_min, weight_class_raw, weight_class_kg, weight_class_is_open, participants_declared, is_deferred, sort_order) VALUES
  (1001, 1001, (SELECT id FROM disciplines WHERE code = 'jerk'), 'm', (SELECT id FROM age_groups WHERE code = 'adult'), NULL,
   32, 'two', 10, '63', 63, 0, NULL, 0, 1);

-- «Выполненный разряд» во всех строках «-» → rank_achieved_id NULL.
-- Командные очки (20, 18, 16, 15, 14, 13, 12, 11, 10, 9, 8) в схеме не хранятся.
INSERT INTO results (id, category_id, athlete_id, place, total_reps, points, body_weight_kg, rank_achieved_id, discipline_id, bell_kg, hands, time_limit_min, competition_id, event_date, raw_name, raw_club, raw_region, protocol_id, source_page, verified_by, verified_at) VALUES
  (1001, 1001, 1001,  1, 142, NULL, 62.800, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2026-06-02', 'Бенидзе Джони Бадриевич',        'СПБ ГБУ ДО СШОРСВС им. В.Ф. Краевского', 'г. Санкт-Петербург',         1001, 1, NULL, NULL),
  (1002, 1001, 1002,  2, 140, NULL, 62.400, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2026-06-02', 'Бутенко Евгений Александрович',  'ГАУ НСО «РЦСП СК и СР»',                 'Новосибирская область',      1001, 1, NULL, NULL),
  (1003, 1001, 1003,  3, 102, NULL, 62.300, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2026-06-02', 'Сиразетдинов Данил Ильфатович',  'МАУ ДО «СШ «Прикамье» г. Перми',         'Пермский край',              1001, 1, NULL, NULL),
  (1004, 1001, 1004,  4,  72, NULL, 62.850, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2026-06-02', 'Кузнецов Роман Андреевич',       'МБУ ДО СШ №3, г. Улан-Удэ',              'Республика Бурятия',         1001, 1, NULL, NULL),
  (1005, 1001, 1005,  5,  70, NULL, 62.900, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2026-06-02', 'Манаков Трофим Анатольевич',     'МАУ ДО «СШ №2» Сургутского района',      'Ханты-Мансийский АО - Югра', 1001, 1, NULL, NULL),
  (1006, 1001, 1006,  6,  65, NULL, 62.750, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2026-06-02', 'Кормилицын Иван Николаевич',     'СШОР «Маршал»',                          'Калужская область',          1001, 1, NULL, NULL),
  (1007, 1001, 1007,  7,  62, NULL, 62.900, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2026-06-02', 'Кашкаров Артур Анатольевич',     'спортивный клуб "АГАУ"',                 'Алтайский край',             1001, 1, NULL, NULL),
  (1008, 1001, 1008,  8,  60, NULL, 61.850, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2026-06-02', 'Жалов Ярослав Борисович',        'МБУ ДО СШОР «Югория» им. А.А. Пилояна',  'Ханты-Мансийский АО - Югра', 1001, 1, NULL, NULL),
  (1009, 1001, 1009,  9,  51, NULL, 61.650, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2026-06-02', 'Митюкевич Станислав Николаевич', 'МАУ ДО СШОР',                            'Республика Башкортостан',    1001, 1, NULL, NULL),
  (1010, 1001, 1010, 10,  27, NULL, 62.700, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2026-06-02', 'Клявлин Андрей Викторович',      'РО ООО ВФГС в Челябинской области',      'Челябинская область',        1001, 1, NULL, NULL),
  (1011, 1001, 1011, 11,  10, NULL, 62.050, NULL, (SELECT id FROM disciplines WHERE code = 'jerk'), 32, 'two', 10, 1001, '2026-06-02', 'Филатов Алексей Александрович',  'МУ ДО «МЦРФКиС» Черепановского района',  'Новосибирская область',      1001, 1, NULL, NULL);

INSERT INTO result_reps (id, result_id, exercise, hand, reps) VALUES
  (1001, 1001, 'jerk', 'both', 142),
  (1002, 1002, 'jerk', 'both', 140),
  (1003, 1003, 'jerk', 'both', 102),
  (1004, 1004, 'jerk', 'both',  72),
  (1005, 1005, 'jerk', 'both',  70),
  (1006, 1006, 'jerk', 'both',  65),
  (1007, 1007, 'jerk', 'both',  62),
  (1008, 1008, 'jerk', 'both',  60),
  (1009, 1009, 'jerk', 'both',  51),
  (1010, 1010, 'jerk', 'both',  27),
  (1011, 1011, 'jerk', 'both',  10);

-- Автопроверки FR-A5 пройдены, строк в issues нет:
--   place_order  — результат не возрастает с местом (142 … 10);
--   row_count    — неприменимо, заявленного числа участников по категории нет;
--   body_weight  — все собственные веса от 61,650 до 62,900, в категории 63 кг;
--   duplicate    — все 11 спортсменов различны;
--   implausible  — максимум 142 при рекорде России 151 из шапки протокола;
--   run_mismatch — прогоны 1 и 2 совпали по всем полям.
