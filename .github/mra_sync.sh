#!/bin/bash

set -euo pipefail

LATEST_COMMIT_FILE=".github/mra_sync.latest_commit.txt"

echo "Checking for changed MRAs..."
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

git diff --name-only ${LATEST_COMMIT}..${PREVIOUS_COMMIT} | grep -i '.mra$' | grep -iv '/_alternatives/' > ${TMP} || true

MRA_QTY=$(cat ${TMP} | wc -l)

if [ ${MRA_QTY} -ge 1 ] ; then
    echo "Found some MRAs that have been changed:"
    echo
    cat ${TMP}
    echo
    echo "Total: ${MRA_QTY}"
    echo
    echo "Checking if sync is needed."
    echo

    while IFS="" read -r mra || [ -n "${mra}" ] ; do
        if [ ! -f "${mra}" ] ; then
            echo "${mra} is not a valid file."
            continue
        fi
        MRA_NAME="$(basename "${mra}")"
        find . -type f -name "${MRA_NAME}" -print0 | while IFS= read -r -d '' copy; do
            if [[ "$(realpath "${copy}")" == "$(realpath "${mra}")" ]] || diff -q "${copy}" "${mra}" > /dev/null ; then
                continue
            fi
            echo cp "${mra}" "${copy}"
            cp "${mra}" "${copy}"
            git add "${copy}"
        done
    done < "${TMP}"

    if git diff --staged --quiet ; then
        echo
        echo "No need to sync anything."
    else
        export GIT_MERGE_AUTOEDIT=no
        git config --global user.email "theypsilon@gmail.com"
        git config --global user.name "The CI/CD Bot"

        echo
        echo "Pushing changes to origin:"
        echo "${LATEST_COMMIT}" > "${LATEST_COMMIT_FILE}"
        git add "${LATEST_COMMIT_FILE}"
        git commit -m "BOT: Syncing MRAs." -m "Because of detected changes between ${LATEST_COMMIT}..${PREVIOUS_COMMIT}."
        git push origin master
    fi
else
    echo "Found none."
fi

rm ${TMP}