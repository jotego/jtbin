#!/bin/bash

TODAY=$(date +"%Y%m%d")
DATE=$TODAY
TARGET=mist

if [ -d /media/$USER/SIDI ]; then
    TARGET=sidi
fi

if [ -n "$1" ]; then
    DATE=$1
fi

for i in `find ${TARGET,,} -name "*_$DATE.rbf"`; do
    j=`basename $i`    
    j=${j/_$DATE/}
    j=${j^^}
    if [ -d /media/$USER/${TARGET^^}/$(basename $j .RBF) ]; then
        j=$(basename $j .RBF)
        cp $i /media/$USER/${TARGET^^}/$j/${j}.RBF -v
    else
        cp $i /media/$USER/${TARGET^^}/$j -v
    fi    
done