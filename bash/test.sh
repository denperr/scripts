#!/bin/bash

# if [[ -z $1 ]]; then
#     echo not here
#     echo "script would exit"
# else
#     echo $1
#     echo "script would set variable to " $1
# fi

if [[ -f /usr/bin/nvim ]] || [[ -f /opt/homebrew/bin/nvim ]]; then
    echo "Here"
else
    echo "Not here"
fi