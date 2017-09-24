#!/bin/bash

set -euxo

git config --global user.email "brendan.nolan-ci@gmail.com"
git config --global user.name "Brendan Nolan (CI)"

pushd kubo-release

  version=$(git describe --tags --abbrev=0)

popd

git clone kubo-release kubo-release-feature

pushd kubo-release-feature

  git checkout -b feature/"${version}"
  git commit -m "Create ${version} feature branch"

popd

exit 0
