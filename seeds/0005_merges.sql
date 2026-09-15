-- Слияние дублей спортсменов (FR-A13).
-- Сгенерировано scripts/gen_merges.py из data/merges.json, не править руками.
-- Слияние дублей спортсменов (FR-A13). Один и тот же человек попал в базу дважды, потому что в протоколах разошлось написание отчества, а ключ склейки в gen_seed.py — фамилия, имя, отчество и год рождения. Запись дубля остаётся в базе с ссылкой merged_into_id: слияние обратимо, а исходные написания сохранены в results.raw_name. Канонической выбирается запись с верным написанием.

-- Васин Артём Иывнович → Васин Артём Иванович, 2007 г. р.
-- Чемпионат России 2025, рывок 73 кг (страница 16) — «Иывнович»; в толчке и длинном цикле того же турнира (страницы 26 и 36) он же «Иванович».
UPDATE athletes SET merged_into_id = (SELECT id FROM athletes WHERE last_name = 'Васин' AND first_name = 'Артём' AND middle_name = 'Иванович' AND birth_year = 2007)
 WHERE id = (SELECT id FROM athletes WHERE last_name = 'Васин' AND first_name = 'Артём' AND middle_name = 'Иывнович' AND birth_year = 2007) AND (SELECT id FROM athletes WHERE last_name = 'Васин' AND first_name = 'Артём' AND middle_name = 'Иванович' AND birth_year = 2007) IS NOT NULL;

UPDATE athlete_slugs
   SET athlete_id = (SELECT id FROM athletes WHERE last_name = 'Васин' AND first_name = 'Артём' AND middle_name = 'Иванович' AND birth_year = 2007), is_current = 0
 WHERE athlete_id = (SELECT id FROM athletes WHERE last_name = 'Васин' AND first_name = 'Артём' AND middle_name = 'Иывнович' AND birth_year = 2007) AND (SELECT id FROM athletes WHERE last_name = 'Васин' AND first_name = 'Артём' AND middle_name = 'Иванович' AND birth_year = 2007) IS NOT NULL;

-- Ташланов Илья Станиставович → Ташланов Илья Станиславович, 1987 г. р.
-- Чемпионат России 2025, толчок 78 кг (страница 25) — «Станиставович»; в протоколе 2026 года — «Станиславович».
UPDATE athletes SET merged_into_id = (SELECT id FROM athletes WHERE last_name = 'Ташланов' AND first_name = 'Илья' AND middle_name = 'Станиславович' AND birth_year = 1987)
 WHERE id = (SELECT id FROM athletes WHERE last_name = 'Ташланов' AND first_name = 'Илья' AND middle_name = 'Станиставович' AND birth_year = 1987) AND (SELECT id FROM athletes WHERE last_name = 'Ташланов' AND first_name = 'Илья' AND middle_name = 'Станиславович' AND birth_year = 1987) IS NOT NULL;

UPDATE athlete_slugs
   SET athlete_id = (SELECT id FROM athletes WHERE last_name = 'Ташланов' AND first_name = 'Илья' AND middle_name = 'Станиславович' AND birth_year = 1987), is_current = 0
 WHERE athlete_id = (SELECT id FROM athletes WHERE last_name = 'Ташланов' AND first_name = 'Илья' AND middle_name = 'Станиставович' AND birth_year = 1987) AND (SELECT id FROM athletes WHERE last_name = 'Ташланов' AND first_name = 'Илья' AND middle_name = 'Станиславович' AND birth_year = 1987) IS NOT NULL;

-- Черкашин Иван Андревич → Черкашин Иван Андреевич, 1999 г. р.
-- Чемпионат России 2025, толчок 95 кг (страница 23) — «Андревич»; в рывке того же турнира (страница 13) и в протоколе 2026 года — «Андреевич».
UPDATE athletes SET merged_into_id = (SELECT id FROM athletes WHERE last_name = 'Черкашин' AND first_name = 'Иван' AND middle_name = 'Андреевич' AND birth_year = 1999)
 WHERE id = (SELECT id FROM athletes WHERE last_name = 'Черкашин' AND first_name = 'Иван' AND middle_name = 'Андревич' AND birth_year = 1999) AND (SELECT id FROM athletes WHERE last_name = 'Черкашин' AND first_name = 'Иван' AND middle_name = 'Андреевич' AND birth_year = 1999) IS NOT NULL;

UPDATE athlete_slugs
   SET athlete_id = (SELECT id FROM athletes WHERE last_name = 'Черкашин' AND first_name = 'Иван' AND middle_name = 'Андреевич' AND birth_year = 1999), is_current = 0
 WHERE athlete_id = (SELECT id FROM athletes WHERE last_name = 'Черкашин' AND first_name = 'Иван' AND middle_name = 'Андревич' AND birth_year = 1999) AND (SELECT id FROM athletes WHERE last_name = 'Черкашин' AND first_name = 'Иван' AND middle_name = 'Андреевич' AND birth_year = 1999) IS NOT NULL;

-- Хамидов Фахриддин Фарход Угли → Хамидов Фахриддин Фарход угли, 2002 г. р.
-- Расхождение в регистре: протокол 2026 года пишет «угли», протокол 2025 года (страницы 17, 27, 37) — «Угли». Канонической взята строчная запись.
UPDATE athletes SET merged_into_id = (SELECT id FROM athletes WHERE last_name = 'Хамидов' AND first_name = 'Фахриддин' AND middle_name = 'Фарход угли' AND birth_year = 2002)
 WHERE id = (SELECT id FROM athletes WHERE last_name = 'Хамидов' AND first_name = 'Фахриддин' AND middle_name = 'Фарход Угли' AND birth_year = 2002) AND (SELECT id FROM athletes WHERE last_name = 'Хамидов' AND first_name = 'Фахриддин' AND middle_name = 'Фарход угли' AND birth_year = 2002) IS NOT NULL;

UPDATE athlete_slugs
   SET athlete_id = (SELECT id FROM athletes WHERE last_name = 'Хамидов' AND first_name = 'Фахриддин' AND middle_name = 'Фарход угли' AND birth_year = 2002), is_current = 0
 WHERE athlete_id = (SELECT id FROM athletes WHERE last_name = 'Хамидов' AND first_name = 'Фахриддин' AND middle_name = 'Фарход Угли' AND birth_year = 2002) AND (SELECT id FROM athletes WHERE last_name = 'Хамидов' AND first_name = 'Фахриддин' AND middle_name = 'Фарход угли' AND birth_year = 2002) IS NOT NULL;

