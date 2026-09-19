#!/usr/bin/env python3
"""Каталог протоколов с сайта ВФГС: что вообще опубликовано и что из этого у нас есть.

    python3 scripts/fetch_vfgs_catalog.py --years 2017-2026 -o sources/catalog.json
    python3 scripts/fetch_vfgs_catalog.py --years 2026 --download sources
    python3 scripts/fetch_vfgs_catalog.py --parse-file page.html --page-year 2017

Сайт федерации недоступен из среды агента, поэтому скрипт запускается в GitHub
Actions (.github/workflows/vfgs-catalog.yml), а результат приезжает в репозиторий
веткой. Локально разбор страницы проверяется на сохранённом HTML: --parse-file.

Каталог — это список опубликованного, а не команда скачать всё подряд.
Скачивание включается отдельно (--download) и никогда не перезаписывает уже
архивированный первоисточник: правила 1 и 5 из sources/README.md.

Только стандартная библиотека: раннеру не нужно ставить зависимости.
"""
import argparse
import hashlib
import json
import re
import sys
import time
import urllib.error
import urllib.parse
import urllib.request
from html.parser import HTMLParser
from pathlib import Path

BASE = "https://vfgs.ru"
UA = "vsegiri.com protocol archive (https://github.com/AlekseiDudchenko/girevoy-archive)"

# Страница года лежит по одному из этих адресов. Проверяются по порядку: первый,
# который отдал ссылки на файлы, и считается страницей года.
YEAR_URL_TEMPLATES = (
    "{base}/docs/protokoly/{year}",
    "{base}/docs/protokoly/{year}/",
    "{base}/protokoly/{year}",
)
INDEX_URL_TEMPLATES = (
    "{base}/docs/protokoly",
    "{base}/protokoly",
)

FILE_EXTENSIONS = (".xls", ".xlsx", ".xlsm", ".pdf", ".doc", ".docx", ".csv", ".zip", ".rar")


class LinkCollector(HTMLParser):
    """Ссылки <a href> вместе с текстом: текст — это название турнира."""

    def __init__(self):
        super().__init__(convert_charrefs=True)
        self.links = []
        self.base_href = None
        self._href = None
        self._text = []

    def handle_startendtag(self, tag, attrs):
        self.handle_starttag(tag, attrs)

    def handle_starttag(self, tag, attrs):
        if tag == "base":
            self.base_href = dict(attrs).get("href") or self.base_href
            return
        if tag != "a":
            return
        href = dict(attrs).get("href")
        if href:
            self._href = href
            self._text = []

    def handle_data(self, data):
        if self._href is not None:
            self._text.append(data)

    def handle_endtag(self, tag):
        if tag == "a" and self._href is not None:
            title = re.sub(r"\s+", " ", "".join(self._text)).strip()
            self.links.append((self._href, title))
            self._href = None
            self._text = []


def fetch(url, retries=3, timeout=60):
    last = None
    for attempt in range(retries):
        try:
            req = urllib.request.Request(url, headers={"User-Agent": UA})
            with urllib.request.urlopen(req, timeout=timeout) as resp:
                return resp.read(), resp.headers
        except urllib.error.HTTPError as exc:
            # 404 не станет 200 от повтора: ретраи только для временных ошибок.
            if exc.code < 500:
                raise
            last = exc
            if attempt < retries - 1:
                time.sleep(2 ** attempt)
        except (urllib.error.URLError, TimeoutError) as exc:
            last = exc
            if attempt < retries - 1:
                time.sleep(2 ** attempt)
    raise last


def decode(body):
    for encoding in ("utf-8", "cp1251"):
        try:
            return body.decode(encoding)
        except UnicodeDecodeError:
            continue
    return body.decode("utf-8", errors="replace")


def file_links(html, page_url):
    """Ссылки на файлы протоколов: абсолютный URL, имя файла, подпись ссылки.

    На страницах ВФГС ссылки относительные («assets/files/protocoly/...»), а адрес
    страницы — без завершающего слэша, поэтому наивная склейка даёт несуществующий
    /docs/protokoly/assets/... Отсюда два кандидата: от <base href> или страницы и
    от корня сайта. Какой из них живой, выясняет measure().
    """
    collector = LinkCollector()
    collector.feed(html)
    base = urllib.parse.urljoin(page_url, collector.base_href) if collector.base_href else page_url
    out, seen = [], set()
    for href, title in collector.links:
        candidates = []
        for candidate in (urllib.parse.urljoin(base, href), urllib.parse.urljoin(BASE + "/", href)):
            if candidate not in candidates:
                candidates.append(candidate)
        path = urllib.parse.urlparse(candidates[0]).path
        if not path.lower().endswith(FILE_EXTENSIONS):
            continue
        filename = urllib.parse.unquote(path.rsplit("/", 1)[-1])
        if filename in seen:
            continue
        seen.add(filename)
        out.append(
            {
                "title": title,
                "url": candidates[0],
                "url_candidates": candidates,
                "filename": filename,
                "ext": path.lower().rsplit(".", 1)[-1],
            }
        )
    return out


def year_links(html, page_url):
    """Ссылки на страницы годов — когда годы не заданы явно."""
    collector = LinkCollector()
    collector.feed(html)
    found = {}
    for href, _ in collector.links:
        url = urllib.parse.urljoin(page_url, href)
        m = re.search(r"/(\d{4})/?$", urllib.parse.urlparse(url).path)
        if m and 1990 <= int(m.group(1)) <= 2100:
            found.setdefault(int(m.group(1)), url)
    return found


def year_page(year, log):
    """Страница года: первый шаблон адреса, который отдал ссылки на файлы."""
    for template in YEAR_URL_TEMPLATES:
        url = template.format(base=BASE, year=year)
        try:
            body, _ = fetch(url)
        except Exception as exc:  # noqa: BLE001 — причина уходит в лог каталога
            log.append(f"{year}: {url} — {exc}")
            continue
        links = file_links(decode(body), url)
        if links:
            return url, links
        log.append(f"{year}: {url} — страница открылась, ссылок на файлы нет")
    return None, []


def discover_years(log):
    for template in INDEX_URL_TEMPLATES:
        url = template.format(base=BASE)
        try:
            body, _ = fetch(url)
        except Exception as exc:  # noqa: BLE001
            log.append(f"индекс {url} — {exc}")
            continue
        years = year_links(decode(body), url)
        if years:
            return sorted(years)
    return []


def parse_years(spec):
    years = set()
    for part in spec.replace(" ", "").split(","):
        if not part:
            continue
        if "-" in part:
            first, last = part.split("-", 1)
            years.update(range(int(first), int(last) + 1))
        else:
            years.add(int(part))
    return sorted(years)


def archived_index(repo_root):
    """Что уже лежит в sources/: имя файла и sha256 из манифеста."""
    manifest = repo_root / "sources" / "manifest.json"
    if not manifest.exists():
        return {}, set()
    files = json.loads(manifest.read_text(encoding="utf-8")).get("files", [])
    return {Path(f["path"]).name: f for f in files}, {f["sha256"] for f in files}


def measure(entry, max_bytes, download_dir, year, log):
    """Скачать (или только измерить) файл: размер и sha256 — это и есть проверка."""
    body = headers = None
    errors = []
    for url in entry.get("url_candidates") or [entry["url"]]:
        try:
            body, headers = fetch(url)
            entry["url"] = url
            break
        except Exception as exc:  # noqa: BLE001
            errors.append(f"{url} — {exc}")
    if body is None:
        entry["status"] = "error"
        entry["error"] = "; ".join(errors)
        log.append(f"{year}: {entry['error']}")
        return
    entry.pop("url_candidates", None)
    entry["size_bytes"] = len(body)
    entry["sha256"] = hashlib.sha256(body).hexdigest()
    entry["content_type"] = headers.get("Content-Type")
    entry["status"] = "ok"
    if max_bytes and len(body) > max_bytes:
        entry["status"] = "too_large"
        return
    if not download_dir:
        return
    target = Path(download_dir) / str(year) / entry["filename"]
    if target.exists():
        existing = hashlib.sha256(target.read_bytes()).hexdigest()
        entry["saved_as"] = str(target)
        if existing == entry["sha256"]:
            entry["status"] = "already_archived"
        else:
            # Правило 5 из sources/README.md: новая редакция сохраняется отдельным
            # файлом, старая копия не перезаписывается молча.
            entry["status"] = "differs_from_archived"
            log.append(f"{year}: {target} уже есть и отличается от опубликованного — не трогаю")
        return
    target.parent.mkdir(parents=True, exist_ok=True)
    target.write_bytes(body)
    entry["saved_as"] = str(target)
    entry["status"] = "downloaded"


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--years", help="2026, или 2017-2026, или 2017,2021. По умолчанию — со страницы-индекса")
    ap.add_argument("-o", "--output", default="-", help="файл каталога JSON, по умолчанию stdout")
    ap.add_argument("--download", metavar="DIR", help="сохранять файлы в DIR/<год>/ (обычно sources)")
    ap.add_argument("--max-file-mb", type=float, default=60.0, help="файлы крупнее не сохранять, 0 — без ограничения")
    ap.add_argument("--no-measure", action="store_true", help="только ссылки: без скачивания, размера и sha256")
    ap.add_argument("--dump-links", metavar="URL", help="разведка: показать все ссылки страницы и выйти")
    ap.add_argument("--parse-file", help="разобрать сохранённую страницу вместо запроса к сайту")
    ap.add_argument("--page-year", type=int, help="год для --parse-file")
    args = ap.parse_args()

    if args.dump_links:
        body, _ = fetch(args.dump_links)
        collector = LinkCollector()
        collector.feed(decode(body))
        print(f"base href: {collector.base_href}")
        for href, title in collector.links:
            print(f"{href}\t{title[:80]}")
        return 0

    repo_root = Path(__file__).resolve().parent.parent
    archived_by_name, archived_shas = archived_index(repo_root)
    max_bytes = int(args.max_file_mb * 1024 * 1024) if args.max_file_mb else 0
    log, years_out = [], []

    if args.parse_file:
        page = Path(args.parse_file)
        pairs = [(args.page_year or 0, page.as_uri(), file_links(page.read_text(encoding="utf-8"), BASE + "/"))]
    else:
        years = parse_years(args.years) if args.years else discover_years(log)
        if not years:
            print("Не удалось определить годы: укажите --years", file=sys.stderr)
            return 1
        pairs = []
        for year in years:
            url, links = year_page(year, log)
            pairs.append((year, url, links))

    for year, url, links in pairs:
        for entry in links:
            if not args.no_measure and not args.parse_file:
                measure(entry, max_bytes, args.download, year, log)
            archived = archived_by_name.get(entry["filename"])
            entry["in_sources"] = bool(archived) or entry.get("sha256") in archived_shas
            if archived:
                entry["archived_path"] = archived["path"]
        years_out.append({"year": year, "page_url": url, "files": links})

    index_links = []
    if not args.parse_file and any(y["page_url"] is None for y in years_out):
        # Год не нашёлся ни по одному шаблону адреса: сохраняем ссылки индекса,
        # чтобы по ним увидеть реальную схему, а не гадать вторым прогоном.
        for template in INDEX_URL_TEMPLATES:
            url = template.format(base=BASE)
            try:
                body, _ = fetch(url)
            except Exception as exc:  # noqa: BLE001
                log.append(f"индекс {url} — {exc}")
                continue
            collector = LinkCollector()
            collector.feed(decode(body))
            index_links.append(
                {
                    "page_url": url,
                    "base_href": collector.base_href,
                    "links": [{"href": href, "title": title} for href, title in collector.links[:300]],
                }
            )
            break

    catalog = {
        "note": (
            "Каталог опубликованных ВФГС протоколов, собирается scripts/fetch_vfgs_catalog.py "
            "в GitHub Actions: сайт федерации недоступен из среды агента. "
            "in_sources = файл уже лежит в sources/ и учтён в манифесте."
        ),
        "source_site": BASE,
        "generated_at": time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime()),
        "years": years_out,
        "index_links": index_links,
        "log": log,
    }
    text = json.dumps(catalog, ensure_ascii=False, indent=2) + "\n"
    if args.output == "-":
        sys.stdout.write(text)
    else:
        Path(args.output).write_text(text, encoding="utf-8")
    total = sum(len(y["files"]) for y in years_out)
    known = sum(1 for y in years_out for f in y["files"] if f.get("in_sources"))
    print(f"Годов: {len(years_out)}, файлов: {total}, из них уже в sources/: {known}", file=sys.stderr)
    for line in log:
        print("  ", line, file=sys.stderr)
    return 0


if __name__ == "__main__":
    sys.exit(main())
