#!/usr/bin/env bash

# web page substitutions
for file in *.html; do
  echo "Applying fixups for $file .."
  # LC_ALL=C sed -i '' 's|/web/[^/]*/http://.*navalwargamessociety.org/images|\./images|g' "$file"
  # LC_ALL=C sed -i '' 's|/web/[^/]*im_/http://.*navalwargamessociety.org/transparent.gif|\./images/transparent.gif|g' "$file"
  # LC_ALL=C sed -i '' 's|https://web.archive.org/web/[^/]*/http://.*navalwargamessociety.org/|\./|g' "$file"
  # LC_ALL=C sed -i '' 's|https://web.archive.org/web/[^/]*/mailto|mailto|g' "$file"
  # LC_ALL=C sed -i '' '/<!-- is_embed=True -->/,/<!-- End Wayback Rewrite JS Include -->/ {
  #   /<!-- is_embed=True -->/!d
  #   s/<!-- is_embed=True -->.*<!-- End Wayback Rewrite JS Include -->/<!-- is_embed=True -->/
  # }' "$file"
  # LC_ALL=C sed -i '' 's/<!-- is_embed=True -->//g' "$file"
  # LC_ALL=C sed -i '' 's|Battle%20of%20the%20Yellow%20Sea|Battle_of_the_Yellow_Sea|g' "$file"
  # LC_ALL=C sed -i '' 's|The%20Battle%20of%20Ulsan|The_Battle_of_Ulsan|g' "$file"
  # LC_ALL=C sed -i '' 's|River%20Plate%20Complete|scenarios/River_Plate_Complete|g' "$file"
  # LC_ALL=C sed -i '' 's|Perfidious%20Albion|Perfidious_Albion|g' "$file"
  # LC_ALL=C sed -i '' 's|links/navallinks|navallinks|g' "$file"
  LC_ALL=C sed -i '' 's|href="/web/[^/]*/http://.*navalwargamessociety.org/Documents/Website%20-%20NWS/|href="\./|g' "$file"
  LC_ALL=C sed -i '' 's|href="NWS_Ironclad_Rules.pdf"|href="scenarios/NWS_Ironclad_Rules.pdf"|g' "$file"
done
