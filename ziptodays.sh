#!/bin/bash

# this will create zip files for today's version of a given core
# call it with the core name from the jtbin folder.
# For instance: ziptodays.sh sectionz

# MiST and SiDi files are renamed to drop the date
# MiSTer RBF is moved into a cores folder inside the zip file

datestr=$(date +"%Y%m%d")
MRAALT=1
CORE=

function make_zip {
    RBF=$2/$1/releases/jt${1}_${datestr}.rbf
    if [ ! -e $RBF ]; then
        echo "Warning: $RBF not found"
    else
        echo $2
        RBF_ZIP=$RBF
        ZIP_NAME=$1_${2}_${datestr}.zip
        if [ $2 != mister ]; then
            # Rename the file for MiST and SiDi
            RBF_ZIP=jt${1}.rbf
            cp $RBF $RBF_ZIP
            zip --junk-paths $ZIP_NAME $RBF_ZIP
            rm $RBF_ZIP
        else
            if [ -e cores ]; then
                echo "Error: the 'cores' folder should not exist for this script to work"
                exit 1
            fi
            mkdir -p cores
            cp $RBF cores
            zip --recurse-paths $ZIP_NAME cores
            rm -rf cores
        fi
        # Add readme file
        README=../jt$1/README.md
        if [[ -e $README && -e $ZIP_NAME ]]; then
            zip --junk-paths $ZIP_NAME $README
        fi
        # Add .MRA files
        if [ "$MRAALT" -eq 1 ]; then
            mkdir -p temp
            mv $ZIP_NAME temp/t.zip
            cp -r ../jt$1/rom/mra/{*.mra,_alt} temp
            cd temp
            zip -r t.zip *.mra _alt
            mv t.zip ../$ZIP_NAME
            cd ..
            rm -rf temp
        fi
    fi
}

function show_help {
    cat << EOF
Usage: ziptodays.sh corename [-mra]
    -nomra      By default the *.mra files in the path ../jt{corename}/rom/mra will be included in the zip
                as well as _alt subfolder. -nomra disables this behaviour
EOF
}

while [ $# -gt 0 ]; do
    case "$1" in
        -nomra)
            MRAALT=;;
        -help|-h|--help)
            show_help
            exit 0;;
        *)
            if [ ! -z "$CORE" ]; then
                echo "Error: you cannot define the core twice"
                exit 1
            fi
            CORE=$1;;
    esac
    shift
done

if [ -z "$CORE" ]; then
    echo "Error: missing core name"
    exit 1
fi

for i in mist sidi mister; do
    make_zip $CORE $i
done

