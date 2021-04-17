#!/bin/bash
FAIL=0

cd mister
for i in $(find -maxdepth 1 -type d); do
    i=$(basename $i)
    case $i in
        . | update | sdram48 | sdram96 | MRA-Alternatives_MiSTer) continue;;
    esac
    if [ $(find $i/releases -name "*mra" | wc -l) = 0 ]; then
        echo "No MRA files in $i/releases"
        FAIL=1
    fi

    if [ $(find $i -maxdepth 1 -name "*mra" | wc -l) -gt 0 ]; then
        echo "Misplaced MRA files in $i. They should be moved to $i/releases"
        FAIL=1
    fi

    if [ $(find $i/releases -name "*rbf" | wc -l) = 0 ]; then
        echo "No RBF files in $i/releases"
        FAIL=1
    fi

done

exit $FAIL