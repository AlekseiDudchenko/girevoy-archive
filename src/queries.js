// Запросы к базе. Работают и с D1, и с node:sqlite — адаптер даёт all()/get().
import { attachEffectiveCorrections } from './corrections.js';

export const HAND_LABEL = { two: 'двумя', one: 'одной рукой', both: '', left: 'левая', right: 'правая' };

export function seriesLabel(r) {
  const hands = r.hands === 'one' && r.discipline_name !== 'Рывок' ? ' · одной рукой' : '';
  return `${r.discipline_name} · ${r.bell_kg} кг${hands} · ${r.time_limit_min} мин`;
}

export async function getStats(db) {
  return db.get(`
    SELECT (SELECT COUNT(*) FROM competitions WHERE is_published = 1) AS competitions,
           (SELECT COUNT(*) FROM results r JOIN competitions c ON c.id = r.competition_id
             WHERE c.is_published = 1) AS results,
           (SELECT COUNT(*) FROM athletes WHERE merged_into_id IS NULL) AS athletes,
           (SELECT COUNT(DISTINCT pcm.person_id)
              FROM person_coach_mentions pcm
              JOIN competitions c ON c.id = pcm.competition_id
             WHERE c.is_published = 1) AS coaches,
           (SELECT COUNT(*) FROM regions) AS regions,
           (SELECT COUNT(*) FROM (
              SELECT DISTINCT d.name AS discipline_name,
                     r.bell_kg,
                     CASE WHEN r.hands = 'one' THEN 'one' ELSE '' END AS hands_key,
                     r.time_limit_min,
                     cat.sex,
                     COALESCE(cat.weight_class_raw, '') AS weight_class_raw
                FROM results r
                JOIN competitions c ON c.id = r.competition_id
                JOIN disciplines d ON d.id = r.discipline_id
                JOIN categories cat ON cat.id = r.category_id
               WHERE c.is_published = 1
           )) AS unique_categories`);
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
           (SELECT slug FROM athlete_slugs
             WHERE athlete_id = COALESCE(a.merged_into_id, a.id) AND is_current = 1) AS slug,
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
  await attachEffectiveCorrections(db, rows, categories);
  for (const cat of categories) cat.rows = rows.filter((r) => r.category_id === cat.id);
  return { comp, categories };
}

export async function getAthlete(db, slug) {
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

  const spellings = await db.all(`
    SELECT DISTINCT r.raw_name FROM results r
     WHERE r.athlete_id IN (SELECT id FROM athletes WHERE id = ? OR merged_into_id = ?)
       AND r.raw_name IS NOT NULL AND r.raw_name <> ?
     ORDER BY r.raw_name`, a.id, a.id, a.full_name);
  a.other_spellings = spellings.map((s) => s.raw_name);

  const coaches = await db.all(`
    SELECT p.display_name AS name, p.slug,
           MAX(SUBSTR(c.date_start, 1, 4)) AS last_year
    FROM person_coach_mentions pcm
    JOIN persons p ON p.id = pcm.person_id
    JOIN competitions c ON c.id = pcm.competition_id
    WHERE pcm.athlete_id IN (SELECT id FROM athletes WHERE id = ? OR merged_into_id = ?)
      AND c.is_published = 1
    GROUP BY p.id, p.display_name, p.slug
    ORDER BY p.display_name`, a.id, a.id);
  a.coaches = coaches;
  if (coaches.length) {
    a.coach = coaches.map((coach) => `${coach.name}${coach.last_year ? ` (${coach.last_year})` : ''}`).join(', ');
  }

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
  await attachEffectiveCorrections(db, results);
  return { athlete: a, results };
}

export async function listAthleteSlugs(db) {
  return db.all(`SELECT slug, is_current FROM athlete_slugs ORDER BY slug`);
}

export async function listCoaches(db) {
  const rows = await db.all(`
    SELECT p.id AS person_id, p.slug, p.display_name AS name,
           canonical.id AS athlete_id, canonical.full_name AS athlete_name,
           reg.name AS region,
           (SELECT slug FROM athlete_slugs WHERE athlete_id = canonical.id
            AND is_current = 1) AS athlete_slug,
           MIN(SUBSTR(c.date_start, 1, 4)) AS first_year,
           MAX(SUBSTR(c.date_start, 1, 4)) AS last_year
    FROM persons p
    JOIN person_coach_mentions pcm ON pcm.person_id = p.id
    JOIN athletes a ON a.id = pcm.athlete_id
    JOIN athletes canonical ON canonical.id = COALESCE(a.merged_into_id, a.id)
    JOIN competitions c ON c.id = pcm.competition_id
    LEFT JOIN regions reg ON reg.id = canonical.region_id
    WHERE c.is_published = 1
    GROUP BY p.id, p.slug, p.display_name, canonical.id, canonical.full_name, reg.name`);
  const groups = new Map();
  for (const row of rows) {
    if (!groups.has(row.person_id)) groups.set(row.person_id, {
      name: row.name, slug: row.slug, regions: new Set(), athletes: new Map(),
      first_year: null, last_year: null });
    const group = groups.get(row.person_id);
    if (row.region) group.regions.add(row.region);
    if (row.first_year && (!group.first_year || row.first_year < group.first_year)) {
      group.first_year = row.first_year;
    }
    if (row.last_year && (!group.last_year || row.last_year > group.last_year)) {
      group.last_year = row.last_year;
    }
    const old = group.athletes.get(row.athlete_id);
    if (!old || !old.last_year || row.last_year > old.last_year) {
      group.athletes.set(row.athlete_id, {
        name: row.athlete_name, slug: row.athlete_slug, last_year: row.last_year,
      });
    }
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

  const coachedAthletes = await db.all(`
    WITH coached_ids AS (
      SELECT DISTINCT COALESCE(a.merged_into_id, a.id) AS canonical_id
      FROM person_coach_mentions pcm
      JOIN athletes a ON a.id = pcm.athlete_id
      JOIN competitions c ON c.id = pcm.competition_id
      WHERE pcm.person_id = ? AND c.is_published = 1
    ),
    published_results AS (
      SELECT COALESCE(source.merged_into_id, source.id) AS canonical_id,
             r.id,
             r.competition_id,
             COALESCE(r.event_date, c.date_start) AS result_date,
             cat.weight_class_raw,
             cat.weight_class_kg,
             cat.weight_class_is_open,
             achieved.name AS rank_name,
             achieved.sort_order AS rank_sort
      FROM results r
      JOIN athletes source ON source.id = r.athlete_id
      JOIN competitions c ON c.id = r.competition_id
      JOIN categories cat ON cat.id = r.category_id
      LEFT JOIN sport_ranks achieved ON achieved.id = r.rank_achieved_id
      WHERE c.is_published = 1
    )
    SELECT canonical.id,
           canonical.full_name AS name,
           canonical.birth_year,
           reg.name AS region,
           s.slug,
           COUNT(pr.id) AS results_count,
           COUNT(DISTINCT pr.competition_id) AS competitions_count,
           MIN(SUBSTR(pr.result_date, 1, 4)) AS first_year,
           MAX(SUBSTR(pr.result_date, 1, 4)) AS last_year,
           COALESCE((
             SELECT latest_rank.rank_name
             FROM published_results latest_rank
             WHERE latest_rank.canonical_id = canonical.id
               AND latest_rank.rank_name IS NOT NULL
             ORDER BY latest_rank.result_date DESC, latest_rank.id DESC
             LIMIT 1
           ), current_rank.name) AS sport_rank,
           COALESCE((
             SELECT latest_rank.rank_sort
             FROM published_results latest_rank
             WHERE latest_rank.canonical_id = canonical.id
               AND latest_rank.rank_name IS NOT NULL
             ORDER BY latest_rank.result_date DESC, latest_rank.id DESC
             LIMIT 1
           ), current_rank.sort_order) AS sport_rank_sort,
           (
             SELECT latest_weight.weight_class_raw
             FROM published_results latest_weight
             WHERE latest_weight.canonical_id = canonical.id
             ORDER BY latest_weight.result_date DESC, latest_weight.id DESC
             LIMIT 1
           ) AS last_weight_class,
           (
             SELECT latest_weight.weight_class_kg
             FROM published_results latest_weight
             WHERE latest_weight.canonical_id = canonical.id
             ORDER BY latest_weight.result_date DESC, latest_weight.id DESC
             LIMIT 1
           ) AS last_weight_class_kg,
           (
             SELECT latest_weight.weight_class_is_open
             FROM published_results latest_weight
             WHERE latest_weight.canonical_id = canonical.id
             ORDER BY latest_weight.result_date DESC, latest_weight.id DESC
             LIMIT 1
           ) AS last_weight_class_is_open,
           (
             SELECT SUBSTR(latest_weight.result_date, 1, 4)
             FROM published_results latest_weight
             WHERE latest_weight.canonical_id = canonical.id
             ORDER BY latest_weight.result_date DESC, latest_weight.id DESC
             LIMIT 1
           ) AS last_weight_year
    FROM coached_ids coached
    JOIN athletes canonical ON canonical.id = coached.canonical_id
    JOIN published_results pr ON pr.canonical_id = canonical.id
    LEFT JOIN regions reg ON reg.id = canonical.region_id
    LEFT JOIN athlete_slugs s ON s.athlete_id = canonical.id AND s.is_current = 1
    LEFT JOIN sport_ranks current_rank ON current_rank.id = canonical.sport_rank_id
    WHERE canonical.merged_into_id IS NULL
    GROUP BY canonical.id, canonical.full_name, canonical.birth_year, reg.name, s.slug,
             current_rank.name, current_rank.sort_order
    ORDER BY canonical.full_name COLLATE NOCASE`, person.id);
  const coachSummary = coachedAthletes.length ? await db.get(`
    WITH coach_mentions AS (
      SELECT DISTINCT COALESCE(a.merged_into_id, a.id) AS canonical_id,
             pcm.competition_id,
             SUBSTR(c.date_start, 1, 4) AS year
      FROM person_coach_mentions pcm
      JOIN athletes a ON a.id = pcm.athlete_id
      JOIN competitions c ON c.id = pcm.competition_id
      WHERE pcm.person_id = ? AND c.is_published = 1
    ),
    coached_results AS (
      SELECT DISTINCT m.canonical_id, m.competition_id, r.id
      FROM coach_mentions m
      JOIN athletes source ON COALESCE(source.merged_into_id, source.id) = m.canonical_id
      JOIN results r ON r.athlete_id = source.id AND r.competition_id = m.competition_id
    )
    SELECT COUNT(DISTINCT m.canonical_id) AS athletes_count,
           COUNT(DISTINCT m.competition_id) AS competitions_count,
           COUNT(DISTINCT cr.id) AS results_count,
           COUNT(DISTINCT m.year) AS years_count,
           MIN(m.year) AS first_year,
           MAX(m.year) AS last_year
    FROM coach_mentions m
    LEFT JOIN coached_results cr
      ON cr.canonical_id = m.canonical_id AND cr.competition_id = m.competition_id
  `, person.id) : null;

  if (coachSummary) {
    const regions = await db.all(`
      SELECT DISTINCT reg.name
      FROM person_coach_mentions pcm
      JOIN athletes a ON a.id = pcm.athlete_id
      JOIN athletes canonical ON canonical.id = COALESCE(a.merged_into_id, a.id)
      JOIN competitions c ON c.id = pcm.competition_id
      JOIN regions reg ON reg.id = canonical.region_id
      WHERE pcm.person_id = ? AND c.is_published = 1
      ORDER BY reg.name COLLATE NOCASE
    `, person.id);
    coachSummary.regions = regions.map((row) => row.name);
  }

  return { person, activities, judgeRoles, athleteData, coachedAthletes, coachSummary };
}

export async function listAllResults(db) {
  const rows = await db.all(`
    SELECT r.id, r.category_id, r.athlete_id, r.competition_id,
           r.place, r.result_value, r.total_reps, r.points, r.body_weight_kg,
           r.bell_kg, r.hands, r.time_limit_min, r.event_date,
           d.name AS discipline_name, cat.weight_class_raw, cat.sex, ag.name AS age_group,
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
  await attachEffectiveCorrections(db, rows);
  return rows;
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
