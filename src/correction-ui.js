const FIELD_LABELS = {
  bell_kg: 'Вес гири', body_weight_kg: 'Собственный вес', birth_year: 'Год рождения',
  total_reps: 'Подъёмы', points: 'Результат', result_value: 'Результат', place: 'Место',
  time_limit_min: 'Регламент', hands: 'Руки', weight_class_raw: 'Весовая категория',
  discipline_id: 'Дисциплина', discipline: 'Дисциплина', event_date: 'Дата',
};
const UNITS = { bell_kg: ' кг', body_weight_kg: ' кг', time_limit_min: ' мин' };
const escapeHtml = (value) => String(value ?? '').replace(/[&<>"']/g, (char) =>
  ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[char]));
const valueText = (value) => value == null || value === '' ? '—' : String(value);

export function correctionsForField(corrections, field) {
  return (corrections || []).filter((correction) => correction.field === field);
}

export function correctionTip(corrections) {
  const seen = new Set();
  const lines = ['Исправлено в архиве'];
  for (const correction of corrections || []) {
    const key = [correction.field, correction.source_value, correction.corrected_value].join('\u0000');
    if (seen.has(key)) continue;
    seen.add(key);
    const label = FIELD_LABELS[correction.field] || correction.field;
    const unit = UNITS[correction.field] || '';
    lines.push(`${label}: ${valueText(correction.source_value)}${unit} → ${valueText(correction.corrected_value)}${unit}`);
  }
  return lines.length > 1 ? lines.join('\n') : '';
}

export function correctionMarker(corrections, extraClass = '') {
  const tip = correctionTip(corrections);
  if (!tip) return '';
  const classes = ['correction-mark', extraClass].filter(Boolean).join(' ');
  const aria = tip.replace(/\n/g, '. ');
  return `<button type="button" class="${classes}" data-tip="${escapeHtml(tip)}" aria-label="${escapeHtml(aria)}"><span aria-hidden="true">✎</span></button>`;
}
