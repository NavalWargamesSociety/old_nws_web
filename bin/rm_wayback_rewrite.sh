#!/usr/bin/env bash

for file in *.html; do
  echo "Applying fixups for $file .."
  LC_ALL=C sed -i '' '/<!-- is_embed=False -->/,/<!-- End Wayback Rewrite JS Include -->/ {
    /<!-- is_embed=False -->/!d
    s/<!-- is_embed=False -->.*<!-- End Wayback Rewrite JS Include -->/<!-- is_embed=False -->/
  }' "$file"
  LC_ALL=C sed -i '' 's/<!-- is_embed=False -->//g' "$file"
done
