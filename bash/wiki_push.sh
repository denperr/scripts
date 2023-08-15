#!/bin/bash

DATE=`date +%Y-%m-%d`

cd $HOME/wiki
#cat index.md
#git status

cat index.md > README.md
git add .
git commit -a -m "$DATE update"
git push

echo "Pushed wiki to git on $DATE."

#cat $HOME/wiki/index.md > README.md
#git commit -a -m "

