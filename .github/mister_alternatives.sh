#!/bin/bash

set -euo pipefail

MRA_DIR="mra"
MRA_ALTERNATIVES_DIR="_alternatives"
MISTER_MRA_ALTERNATIVES_PATH="mister/MRA-Alternatives_MiSTer/releases/"
LATEST_COMMIT_FILE=".github/mister_alternatives.latest_commit.txt"


echo "Checking for changed MRA-Alternatives..."
echo

git fetch origin --unshallow 2> /dev/null || true
git checkout -f master

LATEST_COMMIT=$(git log -n 1 --pretty=format:"%H")
PREVIOUS_COMMIT="$(cat ${LATEST_COMMIT_FILE})"

echo
echo "Latest commit: ${LATEST_COMMIT}"
echo "Previous commit: ${PREVIOUS_COMMIT}"
echo

TMP=$(mktemp)

if ! git diff --name-only ${LATEST_COMMIT}..${PREVIOUS_COMMIT} "${MRA_DIR}/${MRA_ALTERNATIVES_DIR}/" > ${TMP} ; then
    PREVIOUS_COMMIT="$(git rev-list --max-parents=0 HEAD)"
    git diff --name-only ${LATEST_COMMIT}..${PREVIOUS_COMMIT} "${MRA_DIR}/${MRA_ALTERNATIVES_DIR}/" > ${TMP}
fi

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
    echo "${LATEST_COMMIT}" > "${LATEST_COMMIT_FILE}"
    git add "${LATEST_COMMIT_FILE}"
    git add "${MISTER_MRA_ALTERNATIVES_PATH}"
    git commit -m "BOT: Releasing MiSTer ${TODAYS_MISTER_MRA_FILE}." -m "Because of detected changes between ${LATEST_COMMIT}..${PREVIOUS_COMMIT}."
    git push origin master
else
    echo "Found none."
fi

rm ${TMP}