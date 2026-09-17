-- Correction for the 2023 Volga Federal District championship import.
-- Women's snatch categories are 24 kg; three legacy categories were imported as 32 kg.

UPDATE categories
   SET bell_kg = 24
 WHERE competition_id = (
       SELECT id FROM competitions WHERE slug = 'chempionat-pfo-2023'
   )
   AND sex = 'f'
   AND discipline_id = (SELECT id FROM disciplines WHERE code = 'snatch')
   AND bell_kg = 32;

UPDATE results
   SET bell_kg = 24
 WHERE competition_id = (
       SELECT id FROM competitions WHERE slug = 'chempionat-pfo-2023'
   )
   AND discipline_id = (SELECT id FROM disciplines WHERE code = 'snatch')
   AND bell_kg = 32;
