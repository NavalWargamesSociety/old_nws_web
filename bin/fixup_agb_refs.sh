#!/usr/bin/env bash

cat web.archive.org/web/20220819121151/http:/navalwargamessociety.org/agb.html | grep 'agb/[^"]*\.pdf' | LC_ALL=C sed -E 's/.*agb\/([^"]*\.pdf).*/\1/' | \
while read -r file; do
  local_file=$(echo "$file" | sed 's/%20/_/g')
  echo "Applying fixups for $file .."
  LC_ALL=C sed -i '' "s|$file|$local_file|g" "agb.html"
done
