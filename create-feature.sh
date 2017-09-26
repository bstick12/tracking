#!/bin/bash

set -euxo

git config --global user.email "brendan.nolan-ci@gmail.com"
git config --global user.name "Brendan Nolan (CI)"

pushd kubo-release

  version=$(git describe --tags --abbrev=0)

popd

git clone kubo-release kubo-release-feature

echo "feature/$version" > kubo-feature-branch

pushd kubo-release-feature

  git checkout -b feature/${version}

  echo $(date) > test.txt
  git add .
  git commit -m "Test commit"

popd

exit 0
