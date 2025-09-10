#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

# 4000番を使っているプロセスがあれば止める（無ければ無視）
fuser -k 4000/tcp 2>/dev/null || true

# remote_theme のキャッシュを毎回クリア
rm -rf tmp/jekyll-remote-theme-*

bundle exec jekyll clean
bundle exec jekyll serve --baseurl "" --livereload --port 4000