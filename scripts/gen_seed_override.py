#!/usr/bin/env python3
"""Run gen_seed.py with a temporary id_base override without mutating source JSON."""
from __future__ import annotations
import json
import os
import subprocess
import sys
import tempfile


def main() -> None:
    if len(sys.argv) != 3:
        raise SystemExit("usage: gen_seed_override.py <data.json> <id_base>")
    source_path = sys.argv[1]
    id_base = int(sys.argv[2])
    with open(source_path, encoding="utf-8") as f:
        data = json.load(f)
    data.setdefault("source", {})["id_base"] = id_base
    with tempfile.NamedTemporaryFile("w", suffix=".json", encoding="utf-8", delete=False) as tmp:
        json.dump(data, tmp, ensure_ascii=False, separators=(",", ":"))
        tmp_path = tmp.name
    try:
        subprocess.run([sys.executable, "scripts/gen_seed.py", tmp_path], check=True)
    finally:
        os.unlink(tmp_path)


if __name__ == "__main__":
    main()
