#!/usr/bin/env python3
"""Сборка локальной базы из миграций, справочников, протоколов и производных персон.

    python3 scripts/build_db.py                 # .local/girevoy.db
    python3 scripts/build_db.py --db путь.db    # другое имя файла
    python3 scripts/build_db.py --check         # только проверить манифест, ничего не собирать

Состав базы описан в data/protocols.json — это единственный источник. Им пользуются и
`npm run db:local`, и scripts/build-static.sh, поэтому локальная база и статический снимок
собираются из одного набора протоколов и разойтись не могут.

Протокол, лежащий в data/ и не перечисленный в манифесте, роняет сборку. Раньше список
протоколов был продублирован в package.json и в build-static.sh: они разъехались, и
`npm run db:local` собирал 11 турниров из 40, молча отдавая неполную базу — на такой базе
аудит персон не находит дублей и выглядит успешным.
"""
import argparse
import json
import shutil
import subprocess
import sqlite3
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
MANIFEST = ROOT / "data" / "protocols.json"

# Файлы data/, которые не являются протоколами соревнований.
NON_PROTOCOL = {"protocols", "merges", "person_merges", "person_role_links", "regions"}

# Справочники и правки, которые ложатся до и после протоколов. Порядок значим:
# слияния и исправления применяются к уже вставленным строкам.
BEFORE = ["seeds/0001_reference.sql", "seeds/0002_regions.sql"]
AFTER = ["seeds/0005_merges.sql", "seeds/0006_normalize_snatch.sql"]


def load_manifest():
    manifest = json.loads(MANIFEST.read_text(encoding="utf-8"))
    listed = [p["slug"] for p in manifest["protocols"]]
    prebuilt = [Path(s).stem.split("_", 1)[1] for s in manifest["prebuilt_seeds"]]

    duplicates = sorted({s for s in listed if listed.count(s) > 1})
    if duplicates:
        sys.exit(f"data/protocols.json: протокол перечислен дважды: {', '.join(duplicates)}")

    on_disk = {p.stem for p in (ROOT / "data").glob("*.json")} - NON_PROTOCOL
    known = set(listed) | set(prebuilt)

    missing = sorted(on_disk - known)
    if missing:
        sys.exit(
            "В data/ есть протоколы, которых нет в data/protocols.json:\n  "
            + "\n  ".join(missing)
            + "\nДобавьте их в манифест, иначе они не попадут ни в базу, ни в аудит."
        )

    stale = sorted(known - on_disk)
    if stale:
        sys.exit(
            "data/protocols.json ссылается на отсутствующие протоколы:\n  "
            + "\n  ".join(stale)
        )
    return manifest


def generate(manifest, build_dir):
    """Сгенерировать SQL каждого протокола и вернуть список файлов в порядке вставки."""
    parts = [ROOT / p for p in sorted((ROOT / "migrations").glob("*.sql"))]
    parts += [ROOT / p for p in BEFORE]
    parts += [ROOT / s for s in manifest["prebuilt_seeds"]]

    for entry in manifest["protocols"]:
        slug, generator = entry["slug"], entry["generator"]
        out = build_dir / f"{slug}.sql"
        cmd = ["python3", str(ROOT / "scripts" / f"{generator}.py"),
               str(ROOT / "data" / f"{slug}.json")]
        cmd += [str(a) for a in entry.get("args", [])]
        result = subprocess.run(cmd, capture_output=True, text=True)
        if result.returncode != 0:
            sys.exit(f"{generator}.py упал на {slug}:\n{result.stderr}")
        out.write_text(result.stdout, encoding="utf-8")
        parts.append(out)

    parts += [ROOT / p for p in AFTER]
    for name, script in (("corrections", "gen_corrections"), ("people", "gen_people")):
        out = build_dir / f"{name}.sql"
        result = subprocess.run(["python3", str(ROOT / "scripts" / f"{script}.py")],
                                capture_output=True, text=True)
        if result.returncode != 0:
            sys.exit(f"{script}.py упал:\n{result.stderr}")
        out.write_text(result.stdout, encoding="utf-8")
        parts.append(out)
    return parts


def build(db_path, parts):
    db_path.parent.mkdir(parents=True, exist_ok=True)
    if db_path.exists():
        db_path.unlink()
    conn = sqlite3.connect(db_path)
    try:
        for part in parts:
            conn.executescript(part.read_text(encoding="utf-8"))
        conn.commit()
        return report(conn)
    finally:
        conn.close()


def report(conn):
    """Сводка и проверки, которые должны держаться на любой сборке."""
    q = lambda sql: conn.execute(sql).fetchone()[0]

    bad_snatch = q("""
        SELECT (SELECT COUNT(*) FROM categories cat JOIN disciplines d ON d.id = cat.discipline_id
                 WHERE d.code = 'snatch' AND cat.hands <> 'one')
             + (SELECT COUNT(*) FROM results r JOIN disciplines d ON d.id = r.discipline_id
                 WHERE d.code = 'snatch' AND r.hands <> 'one')""")
    if bad_snatch:
        sys.exit(f"строк рывка с hands <> 'one': {bad_snatch}")

    broken = conn.execute("PRAGMA foreign_key_check").fetchall()
    if broken:
        sys.exit(f"PRAGMA foreign_key_check: {len(broken)} нарушений")

    # Слияние, не нашедшее пары по full_name + birth_year, не срабатывает молча (FR-A13).
    merges = json.loads((ROOT / "data" / "merges.json").read_text(encoding="utf-8"))["merges"]
    unresolved = []
    for m in merges:
        for role in ("canonical", "duplicate"):
            found = conn.execute(
                "SELECT COUNT(*) FROM athletes WHERE full_name = ? AND birth_year = ?",
                (m[role], m["birth_year"])).fetchone()[0]
            if found != 1:
                unresolved.append(f"{role}={m[role]!r} {m['birth_year']}: совпадений {found}")
    if unresolved:
        sys.exit("Строки data/merges.json не разрешились в athletes:\n  " + "\n  ".join(unresolved))

    chains = q("""SELECT COUNT(*) FROM athletes d JOIN athletes c ON c.id = d.merged_into_id
                   WHERE c.merged_into_id IS NOT NULL""")
    if chains:
        sys.exit(f"цепочки слияния: {chains} (канонический сам слит)")

    return {
        "competitions": q("SELECT COUNT(*) FROM competitions"),
        "results": q("SELECT COUNT(*) FROM results"),
        "athletes": q("SELECT COUNT(*) FROM athletes WHERE merged_into_id IS NULL"),
        "merged": q("SELECT COUNT(*) FROM athletes WHERE merged_into_id IS NOT NULL"),
        "coach_mentions": q("SELECT COUNT(*) FROM person_coach_mentions"),
    }


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--db", default=".local/girevoy.db")
    ap.add_argument("--build-dir", default=".local/build")
    ap.add_argument("--check", action="store_true",
                    help="только сверить манифест с data/, базу не собирать")
    args = ap.parse_args()

    manifest = load_manifest()
    if args.check:
        print(f"манифест сходится с data/: {len(manifest['protocols'])} протоколов "
              f"+ {len(manifest['prebuilt_seeds'])} готовых сида")
        return

    build_dir = ROOT / args.build_dir
    if build_dir.exists():
        shutil.rmtree(build_dir)
    build_dir.mkdir(parents=True)

    stats = build(ROOT / args.db, generate(manifest, build_dir))
    print(f"{args.db}: турниров {stats['competitions']}, результатов {stats['results']}, "
          f"спортсменов {stats['athletes']} (слито {stats['merged']}), "
          f"упоминаний тренеров {stats['coach_mentions']}")


if __name__ == "__main__":
    main()
