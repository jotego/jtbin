#!/bin/bash

COREPATH=pocket/raw/Cores
BAD=

for i in $COREPATH/*; do
	CORENAME=`basename $i`
	CORENAME="${CORENAME#jotego.}".rbf_r
	if [ ! -e $i/$CORENAME ]; then
		echo missing $i/$CORENAME
		# echo "Get from old y/n?"
	    # read CONT
	    # if [ $CONT = y ]; then git checkout old -- $i/$CORENAME; fi
		BAD=1
	fi
done

if [ "$BAD" = 1 ]; then
	exit 1
fi
