#!/usr/bin/env bash

for file in *.html; do
  echo "Applying fixups for $file .."
  LC_ALL=C sed -i '' '/<!-- BEGIN WAYBACK TOOLBAR INSERT -->/,/<!-- END WAYBACK TOOLBAR INSERT -->/ {
    /<!-- BEGIN WAYBACK TOOLBAR INSERT -->/!d
    s/<!-- BEGIN WAYBACK TOOLBAR INSERT -->.*<!-- END WAYBACK TOOLBAR INSERT -->/<!-- BEGIN WAYBACK TOOLBAR INSERT -->/
  }' "$file"
  LC_ALL=C sed -i '' 's/<!-- BEGIN WAYBACK TOOLBAR INSERT -->//g' "$file"
done
