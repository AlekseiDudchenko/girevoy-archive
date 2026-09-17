import { cpSync, existsSync, mkdirSync, readdirSync } from 'node:fs';
import { join } from 'node:path';

const OUT = process.argv[2] || 'dist';
const SOURCE_ROOT = 'sources';
const ARCHIVE_OUT = join(OUT, 'protocols');

mkdirSync(ARCHIVE_OUT, { recursive: true });

let copied = 0;
for (const year of readdirSync(SOURCE_ROOT, { withFileTypes: true })) {
  if (!year.isDirectory() || !/^20\d{2}$/.test(year.name)) continue;
  const from = join(SOURCE_ROOT, year.name);
  const to = join(ARCHIVE_OUT, year.name);
  if (!existsSync(from)) continue;
  cpSync(from, to, { recursive: true });
  copied++;
}

console.log(`Protocol archive copied: ${copied} year directories`);
