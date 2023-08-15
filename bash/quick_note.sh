#!/bin/bash

# Validates that there is an argument passed to the script.
if [[ -z $1 ]]; then
  echo "Script usage: $0 \"note topic\""
  echo "Exiting script ..."
  exit
fi

note_string=$(echo "$1" | tr '[:upper:]' '[:lower:]')
note_topic="${note_string// /_}"
#new_note=$HOME/wiki/$(date +%Y-%m-%d)_$note_topic.md
new_note=$HOME/wiki/$note_topic.md

if [[ ! -f $new_note ]]; then
  echo "# $1"> $new_note
  echo "" >> $new_note
  echo "Created: $(date +%Y-%m-%d)" >> $new_note
  echo "" >> $new_note
  echo "## Notes" >> $new_note
  echo "" >> $new_note
else
  echo "$new_note already exists ..."
fi

echo "- [$1]($note_topic.md)" >> ~/wiki/index.md

nvim -c "norm Go-" $new_note
