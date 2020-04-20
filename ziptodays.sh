#!/bin/bash

# this will create zip files for today's version of a given core
# call it with the core name from the jtbin folder.
# For instance: ziptodays.sh sectionz

datestr=$(date +"%Y%m%d")

function make_zip {
    RBF=$2/$1/releases/jt${1}_${datestr}.rbf
    echo $2
    zip --junk-paths $1_${2}.zip $RBF
}

for i in mist sidi mister; do
    make_zip $1 $i
done

