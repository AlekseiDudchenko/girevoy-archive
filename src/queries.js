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
           -- слитый дубль ведёт на карточку той записи, в которую слит (FR-A13)
           (SELECT slug FROM athlete_slugs
             WHERE athlete_id = COALESCE(a.merged_into_id, a.id) AND is_current = 1) AS slug,
           -- в таблице турнира регион и клуб показываются так, как напечатаны
           -- в этом протоколе: спортсмен общий для турниров, клуб со временем меняется
           COALESCE(r.raw_region, reg.name) AS region,
           COALESCE(r.raw_club, cl.name) AS club
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
  // Адрес может вести на запись, слитую с другой: открываем ту, в которую слили,
  // а прежний адрес продолжает работать (FR-A13).
  const a = await db.get(`
    SELECT a.*, reg.name AS region, cl.name AS club,
           sr.name AS sport_rank, sr.code AS sport_rank_code
    FROM athlete_slugs s
    JOIN athletes found ON found.id = s.athlete_id
    JOIN athletes a ON a.id = COALESCE(found.merged_into_id, found.id)
    LEFT JOIN regions reg ON reg.id = a.region_id
    LEFT JOIN clubs cl ON cl.id = a.club_id
    LEFT JOIN sport_ranks sr ON sr.id = a.sport_rank_id
    WHERE s.slug = ?`, slug);
  if (!a) return null;

  // Написания ФИО из протоколов, отличные от канонического: слияние их прячет,
  // а читателю важно понимать, почему в протоколе он записан иначе.
  const spellings = await db.all(`
    SELECT DISTINCT r.raw_name FROM results r
     WHERE r.athlete_id IN (SELECT id FROM athletes WHERE id = ? OR merged_into_id = ?)
       AND r.raw_name IS NOT NULL AND r.raw_name <> ?
     ORDER BY r.raw_name`, a.id, a.id, a.full_name);
  a.other_spellings = spellings.map((s) => s.raw_name);

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
    WHERE r.athlete_id IN (SELECT id FROM athletes WHERE id = ? OR merged_into_id = ?)
      AND c.is_published = 1
    ORDER BY r.event_date DESC`, a.id, a.id);

  const reps = await groupReps(db, results.map((r) => r.id));
  for (const r of results) r.reps = reps.get(r.id) || [];
  return { athlete: a, results };
}

export async function listAthleteSlugs(db) {
  // Не только текущие: прежний адрес слитой записи тоже должен открываться.
  return db.all(`SELECT slug, is_current FROM athlete_slugs ORDER BY slug`);
}

export async function listCoaches(db) {
  const rows = await db.all(`
    SELECT DISTINCT p.id AS person_id, p.slug, p.display_name AS name,
           canonical.id AS athlete_id, canonical.full_name AS athlete_name,
           reg.name AS region,
           (SELECT slug FROM athlete_slugs WHERE athlete_id = canonical.id
            AND is_current = 1) AS athlete_slug
    FROM persons p
    JOIN person_coach_athletes pca ON pca.person_id = p.id
    JOIN athletes a ON a.id = pca.athlete_id
    JOIN athletes canonical ON canonical.id = COALESCE(a.merged_into_id, a.id)
    JOIN results r ON r.athlete_id = a.id
    JOIN competitions c ON c.id = r.competition_id
    LEFT JOIN regions reg ON reg.id = a.region_id
    WHERE c.is_published = 1`);
  const groups = new Map();
  for (const row of rows) {
    if (!groups.has(row.person_id)) groups.set(row.person_id, {
      name: row.name, slug: row.slug, regions: new Set(), athletes: new Map() });
    const group = groups.get(row.person_id);
    if (row.region) group.regions.add(row.region);
    group.athletes.set(row.athlete_id, { name: row.athlete_name, slug: row.athlete_slug });
  }
  return [...groups.values()].map((g) => ({ ...g,
    regions: [...g.regions].sort((a, b) => a.localeCompare(b, 'ru')),
    athletes: [...g.athletes.values()].sort((a, b) => a.name.localeCompare(b.name, 'ru')),
  })).sort((a, b) => a.name.localeCompare(b.name, 'ru'));
}

export async function listPersonSlugs(db) {
  return db.all(`SELECT slug FROM persons ORDER BY slug`);
}

export async function getPerson(db, slug) {
  const person = await db.get(`
    SELECT p.*, reg.name AS region FROM persons p
    LEFT JOIN regions reg ON reg.id = p.region_id
    WHERE p.slug = ? OR p.id = (
      SELECT pa.person_id FROM athlete_slugs old_slug
      JOIN athletes found ON found.id = old_slug.athlete_id
      JOIN person_athletes pa ON pa.athlete_id = COALESCE(found.merged_into_id, found.id)
      WHERE old_slug.slug = ? LIMIT 1
    )`, slug, slug);
  if (!person) return null;

  const activities = await db.all(`
    SELECT pa.*, reg.name AS region FROM person_activities pa
    LEFT JOIN regions reg ON reg.id = pa.region_id
    WHERE pa.person_id = ? ORDER BY COALESCE(pa.date_to, '9999') DESC, pa.date_from DESC`, person.id);
  const judgeRoles = await db.all(`
    SELECT pj.role, pj.source_url, c.name AS competition, c.slug AS competition_slug,
           c.date_start
    FROM person_judge_roles pj LEFT JOIN competitions c ON c.id = pj.competition_id
    WHERE pj.person_id = ? ORDER BY c.date_start DESC`, person.id);
  const athleteLink = await db.get(`
    SELECT s.slug FROM person_athletes pa
    JOIN athletes linked ON linked.id = pa.athlete_id
    JOIN athlete_slugs s ON s.athlete_id = COALESCE(linked.merged_into_id, linked.id)
      AND s.is_current = 1
    WHERE pa.person_id = ? LIMIT 1`, person.id);
  const athleteData = athleteLink ? await getAthlete(db, athleteLink.slug) : null;

  const coachedRows = await db.all(`
    SELECT DISTINCT canonical.id, canonical.full_name AS name, reg.name AS region,
      (SELECT slug FROM athlete_slugs WHERE athlete_id = canonical.id AND is_current = 1) AS slug
    FROM person_coach_athletes pca
    JOIN athletes a ON a.id = pca.athlete_id
    JOIN athletes canonical ON canonical.id = COALESCE(a.merged_into_id, a.id)
    JOIN results r ON r.athlete_id = a.id
    JOIN competitions c ON c.id = r.competition_id
    LEFT JOIN regions reg ON reg.id = a.region_id
    WHERE pca.person_id = ? AND c.is_published = 1`, person.id);
  const coached = new Map();
  for (const a of coachedRows) {
    if (!coached.has(a.id)) coached.set(a.id, { name: a.name, slug: a.slug, regions: new Set() });
    if (a.region) coached.get(a.id).regions.add(a.region);
  }
  const coachedAthletes = [...coached.values()].map((a) => ({ ...a, regions: [...a.regions] }))
    .sort((a, b) => a.name.localeCompare(b.name, 'ru'));
  return { person, activities, judgeRoles, athleteData, coachedAthletes };
}

export async function listAllResults(db) {
  return db.all(`
    SELECT r.id, r.place, r.result_value, r.total_reps, r.points, r.body_weight_kg,
           r.bell_kg, r.hands, r.time_limit_min, r.event_date,
           d.name AS discipline_name, cat.weight_class_raw, ag.name AS age_group,
           dv.name AS division, a.last_name, a.first_name, a.middle_name,
           (SELECT slug FROM athlete_slugs
             WHERE athlete_id = COALESCE(a.merged_into_id, a.id) AND is_current = 1) AS slug,
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
