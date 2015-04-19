#!/bin/bash

echo "Starting deployment"

TEMP_DIRECTORY="/tmp/__temp_static_content"
CURRENT_COMMIT=`git rev-parse HEAD`
ORIGIN_URL="github.com/uqbar-project/uqbar-project.github.io.git"
ORIGIN_URL_WITH_CREDENTIALS="https://${GITHUB_TOKEN}@${ORIGIN_URL}"

echo "Compiling site"

mkdir ${TEMP_DIRECTORY}
harp compile ./site ${TEMP_DIRECTORY}
cp .gitignore ${TEMP_DIRECTORY}

cd ${TEMP_DIRECTORY}

git init
git config user.name "Travis-CI" || exit 1
git config user.email "travis@uqbar-project.com" || exit 1
git add --all
git commit --allow-empty -m "Generated static site for $CURRENT_COMMIT" || exit 1
git remote add origin "$ORIGIN_URL_WITH_CREDENTIALS"
git push -u --force --quiet origin master > /dev/null 2>&1

echo "Cleaning up temp files"
rm -Rf ${TEMP_DIRECTORY}

echo "Deployed successfully."
exit 0