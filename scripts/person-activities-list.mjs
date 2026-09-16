import { readdirSync, readFileSync, writeFileSync } from 'node:fs';
import { join } from 'node:path';

const out = process.argv[2] || 'dist';

const stripTags = (html) => html.replace(/<[^>]+>/g, '').trim();

function activityTableToList(html) {
  const marker = '<h2>Спортивный деятель</h2>';
  const start = html.indexOf(marker);
  if (start < 0) return html;
  const sectionEnd = html.indexOf('</section>', start);
  if (sectionEnd < 0) return html;

  const section = html.slice(start, sectionEnd);
  const tableMatch = section.match(/<div class="scroll"><table>[\s\S]*?<tbody>([\s\S]*?)<\/tbody><\/table><\/div>/);
  if (!tableMatch) return html;

  const rows = [...tableMatch[1].matchAll(/<tr><td>([\s\S]*?)<\/td>\s*<td>([\s\S]*?)<\/td><td>([\s\S]*?)<\/td>\s*<td[^>]*>([\s\S]*?)<\/td><\/tr>/g)];
  if (!rows.length) return html;

  const items = rows.map(([, organizationHtml, positionHtml, regionHtml, periodHtml]) => {
    const organization = organizationHtml.trim();
    const position = stripTags(positionHtml);
    const region = stripTags(regionHtml);
    const period = stripTags(periodHtml);
    const details = [region !== '—' ? region : '', period !== '—' ? period : ''].filter(Boolean).join(' · ');
    return `<li><strong>${position}</strong> — ${organization}${details ? `<br><span class="dim">${details}</span>` : ''}</li>`;
  }).join('');

  const replacement = `<ul class="person-activity-list">${items}</ul>`;
  const updatedSection = section.replace(tableMatch[0], replacement);
  return html.slice(0, start) + updatedSection + html.slice(sectionEnd);
}

for (const name of readdirSync(out)) {
  if (!/^(?:p-|a-).+\.html$/.test(name)) continue;
  const path = join(out, name);
  const html = readFileSync(path, 'utf8');
  const updated = activityTableToList(html);
  if (updated !== html) writeFileSync(path, updated, 'utf8');
}
