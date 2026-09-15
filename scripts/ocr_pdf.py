#!/usr/bin/env python3
"""Скан протокола → текст. Слой извлечения из шага 1 плана (docs/roadmap.md).

    python3 scripts/ocr_pdf.py протокол.pdf                # весь файл
    python3 scripts/ocr_pdf.py протокол.pdf --pages 2-16   # только эти страницы
    python3 scripts/ocr_pdf.py протокол.pdf --titles       # только шапки страниц

Если в PDF есть текстовый слой, берётся он (pdftotext); иначе страницы
рендерятся и распознаются tesseract с русским языком.

--titles печатает верхнюю пятую часть каждой страницы: так за один проход
видно, где в 40-страничном протоколе нужная дисциплина, без чтения целиком.
Ставится всё это через scripts/setup_env.sh.
"""
import argparse
import re
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path


def run(cmd):
    return subprocess.run(cmd, capture_output=True, text=True, check=False)


def page_count(pdf):
    m = re.search(r"Pages:\s+(\d+)", run(["pdfinfo", str(pdf)]).stdout)
    return int(m.group(1)) if m else 0


def parse_pages(spec, total):
    if not spec:
        return list(range(1, total + 1))
    pages = []
    for part in spec.split(","):
        if "-" in part:
            a, b = part.split("-")
            pages += list(range(int(a), int(b) + 1))
        else:
            pages.append(int(part))
    return [p for p in pages if 1 <= p <= total]


def text_layer(pdf, page):
    r = run(["pdftotext", "-f", str(page), "-l", str(page), "-layout", str(pdf), "-"])
    return r.stdout if len(r.stdout.strip()) > 40 else ""


def ocr(pdf, page, dpi, tmp, crop_top):
    stem = tmp / f"p{page}"
    cmd = ["pdftoppm", "-r", str(dpi), "-png", "-f", str(page), "-l", str(page)]
    if crop_top:
        # высота страницы в пикселях при этом dpi: A4 landscape ≈ 8.27in
        cmd += ["-y", "0", "-H", str(int(8.27 * dpi * 0.35))]
    run(cmd + [str(pdf), str(stem)])
    img = next(iter(sorted(tmp.glob(f"p{page}-*.png"))), None)
    if img is None:
        return ""
    r = run(["tesseract", str(img), "-", "-l", "rus", "--psm", "6"])
    img.unlink()
    return r.stdout


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("pdf", type=Path)
    ap.add_argument("--pages", help="например 2-16 или 2,5,9")
    ap.add_argument("--dpi", type=int, default=300)
    ap.add_argument("--titles", action="store_true", help="только шапки страниц")
    args = ap.parse_args()

    for tool in ("pdfinfo", "pdftoppm", "tesseract"):
        if not shutil.which(tool):
            sys.exit(f"нет {tool} — запустите sh scripts/setup_env.sh")

    total = page_count(args.pdf)
    if not total:
        sys.exit(f"не читается: {args.pdf}")

    with tempfile.TemporaryDirectory() as td:
        tmp = Path(td)
        for page in parse_pages(args.pages, total):
            body = "" if args.titles else text_layer(args.pdf, page)
            if not body:
                body = ocr(args.pdf, page, args.dpi, tmp, crop_top=args.titles)
            print(f"===== страница {page} =====")
            print(body.strip())
            print()


if __name__ == "__main__":
    main()
