#!/bin/bash

set -euo pipefail

git fetch origin --unshallow 2> /dev/null || true
git checkout -f master

for i in `git tag`; do
    ZIPNAME=$i.zip
    if [ ! -e pocket/zip/$ZIPNAME ]; then
        echo "Creating $ZIPNAME"
        cd pocket/raw
        zip -r $ZIPNAME *
        mv $ZIPNAME ../zip
        cd ../zip
        git config --global user.email "miki.saito@jotego.es"
        git config --global user.name "The CI/CD Bot"
        git add $ZIPNAME
        git commit -m "BOT: adding Pocket release file"
        git push origin master
    fi
done


