#!/bin/bash

# Validates that there is an argument passed to the script.
if [[ -z $1 ]]; then
  echo "Script usage: $0 \"customer-name\""
  echo "Exiting script ..."
  exit
fi

cust_file="${1// /_}"
new_cust=$HOME/wiki/customers/$cust_file.md

if [[ ! -f $new_cust ]]; then
  echo "# $1"> $new_cust
  echo "" >> $new_cust
  echo "## Customer Information" >> $new_cust
  echo "" >> $new_cust
  echo "- Account Number: " >> $new_cust
  echo "- SFID Opportunity: " >> $new_cust
  echo "- Primary POC's: " >> $new_cust
  echo "  - " >> $new_cust
  echo "" >> $new_cust
  echo "## Overview" >> $new_cust
  echo "" >> $new_cust
  echo "- " >> $new_cust
  echo "" >> $new_cust
  echo "## Meetings" >> $new_cust
  echo "- " >> $new_cust
  echo "" >> $new_cust
  echo "## Supporting Information" >> $new_cust
  echo "- Link for Supportable" >> $new_cust
  echo "- Link for Cases" >> $new_cust
else
  echo "$new_cust already exists ..."
fi

echo "[$1](/customers/$cust_file)" >> ~/wiki/customers/usn/index.md

nvim -c "norm Gi" $new_cust


#nvim -c "norm Go-" \
#  -c "norm G2o" \
#  -c "norm zz" \
#  -c "startinsert" $new_cust
