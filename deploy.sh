#!/bin/env bash

PAGES_PATH="../ivoarch.github.io"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build project and direct the output to the GitHub Pages repository
hugo -d ${PAGES_PATH}

# Now move to that directory
pushd ${PAGES_PATH}

# Set commit message to first arg or default.
MSG="Rebuilding site $(date)"
if [ "$#" -eq "1" ]; then
  MSG="$1"
fi

# Add, commit and push changes.
git add --all
git commit -m "${MSG}"
git push -u origin master

# Come Back
popd ${DIR}
