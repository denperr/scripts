#!/bin/bash

# Validates that there is an option passed to script.
if [[ -z $1 ]]; then
    echo "Script usage: $0 <note-topic>"
    echo "Exiting script ..."
    exit
fi

NOTE_TOPIC=$1

# Creates the meeting note
function meeting_note () {
    echo "Creating a new meeting note ..."
    NEW_NOTE=$(date +%Y-%m-%d)_$NOTE_TOPIC.md

    if [[ -f $NOTE_DIR/$NEW_NOTE ]]; then
        vim $NOTE_DIR/$NEW_NOTE
    else
        note_template
        vim $NOTE_DIR/$NEW_NOTE
    fi
}

# Creates the research note
function research_note () {
    echo "Creating a new research note ..."
    NEW_NOTE=$NOTE_TOPIC.md
    if [[ -f $NOTE_DIR/$NEW_NOTE ]]; then
        vim $NOTE_DIR/$NEW_NOTE
    else
        note_template
        vim $NOTE_DIR/$NEW_NOTE
    fi
}

# Main function for script. Calls specific functions for purpose.
function note_purpose () {
    NOTE_DIR=$HOME/wiki/unsorted-$1

    # Create the note directory if not present.
    if [[ ! -d $NOTE_DIR ]]; then
        mkdir -p $NOTE_DIR
    fi

    if [[ $1 == "meeting" ]]; then
        meeting_note
    elif [[ $1 == "research" ]]; then
        research_note
    else
        echo "Please select valid option"
        exit
    fi
    
}

# Template for the note.
function note_template () {
    touch $NOTE_DIR/$NEW_NOTE
    echo "## Topic: $NOTE_TOPIC" >> $NOTE_DIR/$NEW_NOTE
    echo "" >> $NOTE_DIR/$NEW_NOTE
    echo "## Date: $(date +%Y-%m-%d)" >> $NOTE_DIR/$NEW_NOTE
    echo "" >> $NOTE_DIR/$NEW_NOTE
    echo "## Meeting Notes" >> $NOTE_DIR/$NEW_NOTE
    echo "" >> $NOTE_DIR/$NEW_NOTE
    echo "- " >> $NOTE_DIR/$NEW_NOTE
}

# Set purpose variable. 
echo "Is this for a meeting or research?: "
echo "1. Meeting"
echo "2. Research"
read -p "Select purpose: " purpose

if [[ $purpose == "meeting" ]] || [[ $purpose == 1 ]]; then
    note_purpose meeting
elif [[ $purpose == "research" ]] || [[ $purpose == 2 ]]; then
    note_purpose research
else
    echo "Please select valid option"
fi