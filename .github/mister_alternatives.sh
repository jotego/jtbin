#!/bin/bash

set -euo pipefail

MRA_DIR="mra"
MRA_ALTERNATIVES_DIR="_alternatives"
MISTER_MRA_ALTERNATIVES_PATH="mister/MRA-Alternatives_MiSTer/releases/"

echo "Checking for changed MRA-Alternatives..."
echo

git fetch origin --unshallow 2> /dev/null || true

TMP=$(mktemp)

git log -n 2 --pretty=format:"%H" > ${TMP}
LATEST_COMMIT=$(cat ${TMP} | head -n 1)
PREVIOUS_COMMIT=$(cat ${TMP} | tail -n 1)

echo "Latest commit: ${LATEST_COMMIT}"
echo "Previous commit: ${PREVIOUS_COMMIT}"
echo
git diff --name-only ${LATEST_COMMIT}..${PREVIOUS_COMMIT} "${MRA_DIR}/${MRA_ALTERNATIVES_DIR}/" > ${TMP}

ALTERNATIVES_QTY=$(cat ${TMP} | wc -l)

if [ ${ALTERNATIVES_QTY} -ge 1 ] ; then
    echo "Found some ${MRA_DIR}/${MRA_ALTERNATIVES_DIR} changed:"
    echo
    cat ${TMP}
    echo
    echo "Total: ${ALTERNATIVES_QTY}"

    pushd ${MRA_DIR} > /dev/null

    TODAYS_MISTER_MRA_FILE="MRA-Alternatives_$(date +"%Y%m%d").zip"

    echo
    echo "Creating ZIP file: ${TODAYS_MISTER_MRA_FILE}"
    zip -9 -r ${TODAYS_MISTER_MRA_FILE} ${MRA_ALTERNATIVES_DIR}

    popd > /dev/null

    echo
    echo "Moving '${MRA_DIR}/${TODAYS_MISTER_MRA_FILE}' to '${MISTER_MRA_ALTERNATIVES_PATH}'."
    mv "${MRA_DIR}/${TODAYS_MISTER_MRA_FILE}" "${MISTER_MRA_ALTERNATIVES_PATH}"

    export GIT_MERGE_AUTOEDIT=no
    git config --global user.email "theypsilon@gmail.com"
    git config --global user.name "The CI/CD Bot"

    echo
    echo "Pushing changes to origin:"
    git add "${MISTER_MRA_ALTERNATIVES_PATH}"
    git commit -m "BOT: Releasing MiSTer ${TODAYS_MISTER_MRA_FILE}." -m "Because of detected changes between ${LATEST_COMMIT}..${PREVIOUS_COMMIT}."
    git push origin master
else
    echo "Found none."
fi

rm ${TMP}