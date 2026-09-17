const PUBLIC_CORRECTION_PREFIX = 'source_correction:';

const scopeName = (entity) => ({
  competitions: 'competition', categories: 'category',
  athletes: 'athlete', results: 'result',
}[entity] || entity);

export async function attachEffectiveCorrections(db, rows = [], categories = []) {
  if (!rows.length && !categories.length) return rows;

  // Public corrections are sparse. Loading this small audit set is safer than building
  // an IN (...) with thousands of result/athlete IDs (D1 has a bound-parameter limit).
  const edits = await db.all(`
    SELECT entity, entity_id, field, old_value, new_value, changed_by
    FROM edits
    WHERE changed_by LIKE 'source_correction:%'
    ORDER BY changed_at, id`);

  // Results intentionally keep the athlete id they were imported with even after duplicate
  // athletes are merged. Resolve those ids to the canonical athlete only when an athlete
  // correction exists, so one correction is inherited by results of both the canonical row
  // and any historical duplicates.
  const athleteMerges = new Map();
  if (rows.length && edits.some((edit) => edit.entity === 'athletes')) {
    const mergedAthletes = await db.all(`
      SELECT id, merged_into_id
      FROM athletes
      WHERE merged_into_id IS NOT NULL`);
    for (const athlete of mergedAthletes) athleteMerges.set(athlete.id, athlete.merged_into_id);
  }
  const canonicalAthleteId = (athleteId) => {
    const seen = new Set();
    let id = athleteId;
    while (id != null && athleteMerges.has(id) && !seen.has(id)) {
      seen.add(id);
      id = athleteMerges.get(id);
    }
    return id;
  };

  const maps = new Map();
  for (const entity of ['results', 'categories', 'athletes', 'competitions']) {
    maps.set(entity, new Map());
  }
  for (const edit of edits) {
    if (!maps.has(edit.entity)) continue;
    const map = maps.get(edit.entity);
    if (!map.has(edit.entity_id)) map.set(edit.entity_id, []);
    map.get(edit.entity_id).push({
      scope: scopeName(edit.entity),
      field: edit.field,
      source_value: edit.old_value,
      corrected_value: edit.new_value,
      correction_id: edit.changed_by.slice(PUBLIC_CORRECTION_PREFIX.length),
    });
  }

  for (const category of categories) {
    category.corrections = [
      ...(maps.get('competitions').get(category.competition_id) || []),
      ...(maps.get('categories').get(category.id) || []),
    ];
  }
  for (const row of rows) {
    row.corrections = [
      ...(maps.get('competitions').get(row.competition_id) || []),
      ...(maps.get('categories').get(row.category_id) || []),
      ...(maps.get('athletes').get(canonicalAthleteId(row.athlete_id)) || []),
      ...(maps.get('results').get(row.id) || []),
    ];
  }
  return rows;
}
