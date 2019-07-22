#!/bin/bash
[ -z "${GITHUB_PAT}" ] && exit 0
echo "Environment variables:"
echo "  PATH: ${PATH}"
echo "  TRAVIS_BRANCH: ${TRAVIS_BRANCH}"
echo "  TRAVIS_PULL_REQUEST: ${TRAVIS_PULL_REQUEST}"
echo "  TRAVIS_PULL_REQUEST_BRANCH: ${TRAVIS_PULL_REQUEST_BRANCH}"
if [[ "${TRAVIS_BRANCH}" == "master" && "${TRAVIS_PULL_REQUEST}" == "false" ]]
then
  echo "Deploying to binder."
  git config --global user.email "will.landau@gmail.com"
  git config --global user.name "wlandau"
  git clone -b binder https://${GITHUB_PAT}@github.com/${TRAVIS_REPO_SLUG}.git binder
  cd binder
  ls -a | grep -Ev "^\.$|^\.\.$|^\.git$|^\.binder$" | xargs rm -rf
  cp -r ../inst/notebooks/* ./
  git add *
  git commit -am "Update binder workspace" || true
  git push -q origin binder
fi