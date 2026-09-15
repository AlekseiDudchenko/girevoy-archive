// Запросы к базе. Работают и с D1, и с node:sqlite — адаптер даёт all()/get().

export const HAND_LABEL = { two: 'двумя', one: 'одной рукой', both: '', left: 'левая', right: 'правая' };

export function seriesLabel(r) {
  const hands = r.hands === 'one' ? ' · одной рукой' : '';
  return `${r.discipline_name} · ${r.bell_kg} кг${hands} · ${r.time_limit_min} мин`;
}

export async function getStats(db) {
  return db.get(`
    SELECT (SELECT COUNT(*) FROM competitions WHERE is_published = 1) AS competitions,
           (SELECT COUNT(*) FROM results r JOIN competitions c ON c.id = r.competition_id
             WHERE c.is_published = 1) AS results,
           (SELECT COUNT(*) FROM athletes WHERE merged_into_id IS NULL) AS athletes,
           (SELECT COUNT(*) FROM protocols WHERE status <> 'published') AS pending`);
}

export async function listCompetitions(db) {
  return db.all(`
    SELECT c.id, c.slug, c.name, c.date_start, c.city, c.country,
           cr.name AS rank_name, f.short_name AS federation,
           (SELECT COUNT(*) FROM categories WHERE competition_id = c.id AND is_deferred = 0) AS categories,
           (SELECT COUNT(*) FROM results WHERE competition_id = c.id) AS results
    FROM competitions c
    LEFT JOIN competition_ranks cr ON cr.id = c.competition_rank_id
    LEFT JOIN federations f ON f.id = c.federation_id
    WHERE c.is_published = 1
    ORDER BY c.date_start DESC`);
}

export async function getCompetition(db, slug) {
  const comp = await db.get(`
    SELECT c.*, cr.name AS rank_name, f.name AS federation_name
    FROM competitions c
    LEFT JOIN competition_ranks cr ON cr.id = c.competition_rank_id
    LEFT JOIN federations f ON f.id = c.federation_id
    WHERE c.slug = ? AND c.is_published = 1`, slug);
  if (!comp) return null;

  const categories = await db.all(`
    SELECT cat.*, d.name AS discipline_name, d.code AS discipline_code,
           ag.name AS age_group, dv.name AS division
    FROM categories cat
    JOIN disciplines d ON d.id = cat.discipline_id
    LEFT JOIN age_groups ag ON ag.id = cat.age_group_id
    LEFT JOIN divisions dv ON dv.id = cat.division_id
    WHERE cat.competition_id = ?
    ORDER BY cat.is_deferred, cat.sort_order`, comp.id);

  const rows = await db.all(`
    SELECT r.*, a.last_name, a.first_name, a.middle_name, a.birth_year,
           (SELECT slug FROM athlete_slugs WHERE athlete_id = a.id AND is_current = 1) AS slug,
           reg.name AS region, cl.name AS club
    FROM results r
    JOIN athletes a ON a.id = r.athlete_id
    LEFT JOIN regions reg ON reg.id = a.region_id
    LEFT JOIN clubs cl ON cl.id = a.club_id
    WHERE r.competition_id = ?
    ORDER BY r.category_id, r.place IS NULL, r.place`, comp.id);

  const reps = await groupReps(db, rows.map((r) => r.id));
  for (const r of rows) r.reps = reps.get(r.id) || [];
  for (const cat of categories) cat.rows = rows.filter((r) => r.category_id === cat.id);
  return { comp, categories };
}

export async function getAthlete(db, slug) {
  const a = await db.get(`
    SELECT a.*, reg.name AS region, cl.name AS club,
           sr.name AS sport_rank, sr.code AS sport_rank_code
    FROM athlete_slugs s JOIN athletes a ON a.id = s.athlete_id
    LEFT JOIN regions reg ON reg.id = a.region_id
    LEFT JOIN clubs cl ON cl.id = a.club_id
    LEFT JOIN sport_ranks sr ON sr.id = a.sport_rank_id
    WHERE s.slug = ?`, slug);
  if (!a) return null;

  const results = await db.all(`
    SELECT r.*, d.name AS discipline_name, c.name AS competition, c.slug AS competition_slug,
           cat.weight_class_raw, dv.name AS division,
           sra.name AS rank_achieved, sra.code AS rank_achieved_code
    FROM results r
    JOIN disciplines d ON d.id = r.discipline_id
    JOIN competitions c ON c.id = r.competition_id
    JOIN categories cat ON cat.id = r.category_id
    LEFT JOIN divisions dv ON dv.id = cat.division_id
    LEFT JOIN sport_ranks sra ON sra.id = r.rank_achieved_id
    WHERE r.athlete_id = ? AND c.is_published = 1
    ORDER BY r.event_date DESC`, a.id);

  const reps = await groupReps(db, results.map((r) => r.id));
  for (const r of results) r.reps = reps.get(r.id) || [];
  return { athlete: a, results };
}

export async function listAthleteSlugs(db) {
  return db.all(`SELECT slug FROM athlete_slugs WHERE is_current = 1 ORDER BY slug`);
}

export async function listAllResults(db) {
  return db.all(`
    SELECT r.id, r.place, r.result_value, r.total_reps, r.points, r.body_weight_kg,
           r.bell_kg, r.hands, r.time_limit_min, r.event_date,
           d.name AS discipline_name, cat.weight_class_raw, ag.name AS age_group,
           dv.name AS division, a.last_name, a.first_name, a.middle_name,
           (SELECT slug FROM athlete_slugs WHERE athlete_id = a.id AND is_current = 1) AS slug,
           reg.name AS region, c.name AS competition, c.slug AS competition_slug
    FROM results r
    JOIN athletes a ON a.id = r.athlete_id
    JOIN disciplines d ON d.id = r.discipline_id
    JOIN categories cat ON cat.id = r.category_id
    JOIN competitions c ON c.id = r.competition_id
    LEFT JOIN age_groups ag ON ag.id = cat.age_group_id
    LEFT JOIN divisions dv ON dv.id = cat.division_id
    LEFT JOIN regions reg ON reg.id = a.region_id
    WHERE c.is_published = 1
    ORDER BY r.event_date DESC, r.result_value IS NULL, r.result_value DESC`);
}

async function groupReps(db, ids) {
  const map = new Map();
  if (!ids.length) return map;
  const rows = await db.all(
    `SELECT result_id, exercise, hand, reps FROM result_reps WHERE result_id IN (${ids.map(() => '?').join(',')})`,
    ...ids);
  for (const r of rows) {
    if (!map.has(r.result_id)) map.set(r.result_id, []);
    map.get(r.result_id).push(r);
  }
  return map;
}
