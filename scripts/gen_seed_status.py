#!/usr/bin/env python3
"""Generate a normal competition seed and preserve optional raw result statuses.

Rows may append a status at index 13. This keeps DNS/DNF/DSQ/"снят врачом"
participants without inventing a numeric result.
"""
import glob
import json
import subprocess
import sys


def esc(value):
    return "'" + str(value).replace("'", "''") + "'"


def main(path):
    generated = subprocess.run(
        [sys.executable, "scripts/gen_seed.py", path],
        check=True,
        text=True,
        capture_output=True,
    )
    sys.stdout.write(generated.stdout)

    with open(path, encoding="utf-8") as fh:
        data = json.load(fh)

    comp = data["competition"]
    categories = list(data.get("categories", []))
    for category_path in sorted(glob.glob(f"data/categories/{comp['slug']}/*.json")):
        with open(category_path, encoding="utf-8") as fh:
            fragment = json.load(fh)
        categories.append(fragment["category"] if "category" in fragment else fragment)

    result_id = int(data["source"].get("id_base", 0))
    for category in categories:
        for row in category["rows"]:
            result_id += 1
            status = row[13] if len(row) > 13 else None
            if status is not None:
                print(
                    f"UPDATE results SET result_status = {esc(status)} "
                    f"WHERE id = {result_id};"
                )


if __name__ == "__main__":
    main(sys.argv[1] if len(sys.argv) > 1 else "data/kubok-rossii-2022.json")
