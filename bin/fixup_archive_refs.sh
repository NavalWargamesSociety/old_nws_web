#!/usr/bin/env bash

for file in *.html; do
  echo "Applying fixups for $file .."
  LC_ALL=C sed -i '' 's|href="http.*://.*web.archive.org/web/[^/]*/http|href="http|g' "$file"
  LC_ALL=C sed -i '' 's|href="http.*://.*web.archive.org/web/[^/]*/ftp|href="ftp|g' "$file"
  LC_ALL=C sed -i '' 's|href="http.*://.*web.archive.org/web/[^/]*/www|href="https://www|g' "$file"
  LC_ALL=C sed -i '' 's|href="/web/[^/]*/users|href="https://users|g' "$file"
done
