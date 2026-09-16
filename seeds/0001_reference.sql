-- Справочники. Реальные, не демонстрационные: набор дисциплин, возрастных групп,
-- разрядов и рангов соревнований из раздела 2.1 требований.

INSERT INTO disciplines (id, code, name, exercises, sort_order) VALUES
  (1, 'biathlon',   'Классическое двоеборье', '["jerk","snatch"]', 1),
  (2, 'long_cycle', 'Длинный цикл',           '["long_cycle"]',    2),
  (3, 'snatch',     'Рывок',                  '["snatch"]',        3),
  (4, 'jerk',       'Толчок',                 '["jerk"]',          4);

INSERT INTO age_groups (id, code, name, sort_order) VALUES
  (1, 'youth',       'Юноши и девушки', 1),
  (2, 'junior',      'Юниоры',          2),
  (3, 'adult',       'Взрослые',        3),
  (4, 'veteran_40',  'Ветераны 40+',    4),
  (5, 'veteran_45',  'Ветераны 45+',    5),
  (6, 'veteran_50',  'Ветераны 50+',    6);

-- Зачёт по уровню подготовки. На российских стартах обычно не используется.
INSERT INTO divisions (id, code, name, sort_order) VALUES
  (1, 'novice',       'Новички',        1),
  (2, 'amateur',      'Любители',       2),
  (3, 'professional', 'Профессионалы',  3);

INSERT INTO sport_ranks (id, code, name, sort_order) VALUES
  (1, 'iii',  'III разряд', 1),
  (2, 'ii',   'II разряд',  2),
  (3, 'i',    'I разряд',   3),
  (4, 'kms',  'КМС',        4),
  (5, 'ms',   'МС',         5),
  (6, 'msmk', 'МСМК',       6),
  (7, 'zms',  'ЗМС',        7);

INSERT INTO competition_ranks (id, code, name, sort_order) VALUES
  (1, 'regional',      'Региональные',       1),
  (2, 'national_cup',  'Кубок России',       2),
  (3, 'national_ch',   'Чемпионат России',   3),
  (4, 'national_jr',   'Первенство России',  4),
  (5, 'international', 'Международные',      5),
  (6, 'european_ch',   'Чемпионат Европы',   6),
  (7, 'world_ch',      'Чемпионат мира',     7),
  (8, 'federal_district', 'Чемпионат федерального округа', 8);
