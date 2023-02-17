#/bin/bash

echo This script is to clean all installed brew packages. Proceed? [Y/N]

# Are you sure you want to clean? Clean formulas and clean casks
# https://apple.stackexchange.com/questions/198623/uninstall-all-programs-installed-by-homebrew
# brew remove --force $(brew list --formula)
#brew remove --cask --force $(brew list)