#!/bin/bash

NOTE_DIR=$HOME/wiki/unsorted
NEW_NOTE=$(date +%Y-%m-%d)_$1.md

if [[ -z $1 ]]; then
    echo "Script usage: $0 note-topic"
    echo "Exiting script ..."
    exit
fi

if [[ -f $NOTE_DIR/$NEW_NOTE ]]; then
    vim $NOTE_DIR/$NEW_NOTE
else
    touch $NOTE_DIR/$NEW_NOTE
    echo "## Topic: $1" >> $NOTE_DIR/$NEW_NOTE
    echo "" >> $NOTE_DIR/$NEW_NOTE
    echo "## Date: $(date +%Y-%m-%d)" >> $NOTE_DIR/$NEW_NOTE
    echo "" >> $NOTE_DIR/$NEW_NOTE
    echo "## Meeting Notes" >> $NOTE_DIR/$NEW_NOTE
    echo "" >> $NOTE_DIR/$NEW_NOTE
    echo "* " >> $NOTE_DIR/$NEW_NOTE
    vim $NOTE_DIR/$NEW_NOTE
fi

