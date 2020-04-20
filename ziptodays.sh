#!/bin/bash

datestr=$(date "+%H:%M:%S %B %e, %Y")

function make_zip { 
    echo zip $1_${2}.zip $2/releases/$1/jt${1}_${datestr}.rbf
}

for i in mist sidi mister; do
    make_zip $1 $i
done

