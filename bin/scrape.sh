#!/usr/bin/env bash

## scrape the Naval Wargames Society website from archive.org
for file in about.html agb.html back.html battlefleet.html downloads.html events.html contact.html forum.html groups.html index.html join.html links.html news.html rulesonline.html scenarios.html traders.html; do
  wget -p https://web.archive.org/web/20220819121151/http://navalwargamessociety.org/$file
done
for file in about-ov.gif contact-ov.gif events-ov.gif forum-ov.gif join-ov.gif links-ov.gif news-ov.gif scenarios-ov.gif warships-ov.gif; do
  wget -p https://web.archive.org/web/20220819121151im_/http://navalwargamessociety.org/images/buttons/$file -O images/buttons/$file
done
wget -p https://web.archive.org/web/20220131115255im_/http://navalwargamessociety.org/images/buttons/flagship-ov.gif -O images/buttons/flagship-ov.gif
wget -p https://web.archive.org/web/20220819121151/http://navalwargamessociety.org/naval/navallinks.html

## put all main pages in the root directory
cp web.archive.org/web/20220819121151/http:/navalwargamessociety.org/*.html .
cp web.archive.org/web/20220819121151/http:/navalwargamessociety.org/naval/navallinks.html .

## put all images in the images directory
cp -r web.archive.org/web/20220819121151im_/http:/www.navalwargamessociety.org/images .
cp web.archive.org/web/20220819121151im_/http:/*navalwargamessociety.org/*.gif images
cp web.archive.org/web/*im_/http:/*navalwargamessociety.org/images/*.* images
cp web.archive.org/web/*im_/http:/*navalwargamessociety.org/images/buttons/*.* images/buttons

## download the scenarios
mkdir -p scenarios
for file in Suffren_and_Hughes.pdf AS_WW1.pdf FORCE_Z.pdf JAVASEA.pdf Cod_War.pdf Save_The_Whale.pdf; do
  wget -p https://web.archive.org/web/20220310234724/http://navalwargamessociety.org/scenarios/$file -O scenarios/$file
done
wget -p https://web.archive.org/web/20211003221130/http://www.navalwargamessociety.org/scenarios/Battle%20of%20the%20Yellow%20Sea.pdf -O scenarios/Battle_of_the_Yellow_Sea.pdf
wget -p https://web.archive.org/web/20211121134903/http://www.navalwargamessociety.org/scenarios/MALTA_SF.pdf -O scenarios/MALTA_SF.pdf
wget -p https://web.archive.org/web/20220310234724/http://navalwargamessociety.org/scenarios/The%20Battle%20of%20Ulsan.pdf -O scenarios/The_Battle_of_Ulsan.pdf
wget -p https://web.archive.org/web/20220310234724/http://navalwargamessociety.org/River%20Plate%20Complete.pdf -O scenarios/River_Plate_Complete.pdf
wget -p https://web.archive.org/web/20220310234724/http://navalwargamessociety.org/scenarios/Perfidious%20Albion.pdf -O scenarios/Perfidious_Albion.pdf
wget -p https://web.archive.org/web/20220310234724/http://navalwargamessociety.org/NWS_Ironclad_Rules.pdf -O scenarios/NWS_Ironclad_Rules.pdf

## download the naval files
mkdir -p naval
wget -p https://web.archive.org/web/20220310234724/http://navalwargamessociety.org/naval/Instructions_for_Tactical_and_Strategical_Exercises_1921.pdf -O naval/Instructions_for_Tactical_and_Strategical_Exercises_1921.pdf

## download the agb
mkdir -p agb
cat web.archive.org/web/20220819121151/http:/navalwargamessociety.org/agb.html | grep 'agb/[^"]*\.pdf' | LC_ALL=C sed -E 's/.*agb\/([^"]*\.pdf).*/\1/' | \
while read -r file; do
  local_file=$(echo "$file" | sed 's/%20/_/g')
  if [ ! -f "agb/$local_file" ]; then
    echo "Downloading $file .."
    if ! wget -p "https://web.archive.org/web/20220819121151/http://www.navalwargamessociety.org/agb/$file" -O "agb/$local_file"; then
      echo "Failed to download $file, removing local file .."
      rm -f "agb/$local_file"
    fi
  fi
done
