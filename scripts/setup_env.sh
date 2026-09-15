#!/bin/sh
# Инструменты, без которых не прочитать протокол-скан и не собрать локальную базу.
# Запускается хуком SessionStart (.claude/settings.json) и вручную.
# Идемпотентно: уже установленное не трогает.
set -e

need=""
for pkg in poppler-utils tesseract-ocr tesseract-ocr-rus sqlite3; do
  dpkg -s "$pkg" >/dev/null 2>&1 || need="$need $pkg"
done

[ -z "$need" ] && exit 0

apt-get update -qq >/dev/null 2>&1 || true
apt-get install -y $need >/dev/null 2>&1 || {
  echo "setup_env: не удалось поставить:$need" >&2
  exit 0   # не валим сессию из-за офлайна
}
echo "setup_env: установлено$need"
