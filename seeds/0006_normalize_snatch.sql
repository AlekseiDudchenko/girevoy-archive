-- Canonical rule: snatch is always one-hand.
-- Keep categories and denormalized result series aligned, including legacy fixed seeds.
UPDATE categories
   SET hands = 'one'
 WHERE discipline_id = (SELECT id FROM disciplines WHERE code = 'snatch')
   AND hands <> 'one';

UPDATE results
   SET hands = 'one'
 WHERE discipline_id = (SELECT id FROM disciplines WHERE code = 'snatch')
   AND hands <> 'one';
