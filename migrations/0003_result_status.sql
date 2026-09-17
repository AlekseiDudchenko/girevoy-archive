-- Сырой статус результата из протокола для строк без числового результата:
-- DNS / DNF / DSQ / «снят врачом» и аналогичные случаи.
ALTER TABLE results ADD COLUMN result_status TEXT;
