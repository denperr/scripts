#!/bin/bash

# Validates that there is an argument passed to the script.
if [[ -z $1 ]]; then
  echo "Script usage: $0 \"meeting topic\""
  echo "Exiting script ..."
  exit
fi

mtg_string=$(echo "$1" | tr '[:upper:]' '[:lower:]')
mtg_topic="${mtg_string// /_}"
#mtg_topic="${1// /_}"
new_mtg=$HOME/wiki/meeting-notes/$(date +%Y-%m-%d)_$mtg_topic.md

if [[ ! -f $new_mtg ]]; then
  echo "# $1"> $new_mtg
  echo "" >> $new_mtg
  echo "## Meeting Information" >> $new_mtg
  echo "" >> $new_mtg
  echo "- Date: $(date +%Y-%m-%d)" >> $new_mtg
  echo "- Time: $(date +%H:%M)" >> $new_mtg
  echo "- Location: Virtual" >> $new_mtg
  echo "" >> $new_mtg
  echo "## Notes" >> $new_mtg
  echo "" >> $new_mtg
else
  echo "$new_mtg already exists ..."
fi

echo "- [$(date +%Y-%m-%d) $1](/meeting-notes/$(date +%Y-%m-%d)_$mtg_topic.md)" >> ~/wiki/meeting-notes/index.md

nvim -c "norm Go-" $new_mtg


#nvim -c "norm Go-" \
#  -c "norm G2o" \
#  -c "norm zz" \
#  -c "startinsert" $new_mtg
