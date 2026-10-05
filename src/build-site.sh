#!/usr/bin/env bash
# azakei-city.html（Claudeのアーティファクト用）から、GitHub Pages 用の site/index.html を作る
set -e
cd "$(dirname "$0")"
SRC=azakei-city.html
OUT=site/index.html
ICON="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24'%3E%3Crect width='24' height='24' rx='5' fill='%2312142b'/%3E%3Cpath d='M12 3 20 16.5H4Z M12 21 4 7.5h16Z' fill='none' stroke='%23ffc83a' stroke-width='1.6' stroke-linejoin='round'/%3E%3C/svg%3E"
{
  echo '<!doctype html>'
  echo '<html lang="ja">'
  echo '<head>'
  echo '<meta charset="utf-8">'
  echo '<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">'
  echo '<meta name="description" content="1964年から2022年まで。建物を建てて、となりどうしで稼ぎを増やし、オイルショックもバブルも街ごと乗りこえる経済ゲーム。AZAKEI（麻経）制作。">'
  echo '<meta property="og:title" content="AZAKEI CITY">'
  echo '<meta property="og:description" content="1964→2022。60年の経済を、街ごと生き抜け。AZAKEI（麻経）の経済ゲーム。">'
  echo '<meta property="og:type" content="website">'
  echo '<meta name="theme-color" content="#12142b">'
  echo "<link rel=\"icon\" href=\"$ICON\">"
  head -n 4 "$SRC"
  echo '<style>html{color-scheme:dark}:root{padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}body{margin:0}img{max-width:100%}[hidden]{display:none!important}</style>'
  echo '</head>'
  echo '<body>'
  tail -n +5 "$SRC"
  echo '</body>'
  echo '</html>'
} > "$OUT"
touch site/.nojekyll
echo "built $OUT ($(wc -c < "$OUT") bytes)"
