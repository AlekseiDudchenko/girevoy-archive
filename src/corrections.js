const PUBLIC_CORRECTION_PREFIX = 'source_correction:';

const scopeName = (entity) => ({
  competitions: 'competition', categories: 'category',
  athletes: 'athlete', results: 'result',
}[entity] || entity);

const uniqueIds = (items, key) => [...new Set((items || []).map((item) => item?.[key])
  .filter((id) => id != null))];

export async function attachEffectiveCorrections(db, rows = [], categories = []) {
  const ids = {
    results: uniqueIds(rows, 'id'),
    categories: [...new Set([...uniqueIds(rows, 'category_id'), ...uniqueIds(categories, 'id')])],
    athletes: uniqueIds(rows, 'athlete_id'),
    competitions: [...new Set([...uniqueIds(rows, 'competition_id'), ...uniqueIds(categories, 'competition_id')])],
  };
  const clauses = [];
  const args = [];
  for (const entity of ['results', 'categories', 'athletes', 'competitions']) {
    if (!ids[entity].length) continue;
    clauses.push(`(entity = ? AND entity_id IN (${ids[entity].map(() => '?').join(',')}))`);
    args.push(entity, ...ids[entity]);
  }
  if (!clauses.length) return rows;

  const edits = await db.all(`
    SELECT entity, entity_id, field, old_value, new_value, changed_by
    FROM edits
    WHERE changed_by LIKE 'source_correction:%'
      AND (${clauses.join(' OR ')})
    ORDER BY changed_at, id`, ...args);

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
      ...(maps.get('athletes').get(row.athlete_id) || []),
      ...(maps.get('results').get(row.id) || []),
    ];
  }
  return rows;
}
