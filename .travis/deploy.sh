#!/bin/bash

GH_REPO=taoky/taoky.github.io
BRANCH=master

set -e

e_info() {
  echo -e "\x1B[36;1m[Info]\x1B[0m $*" >&2
}

e_success() {
  echo -e "\x1B[32;1m[Success]\x1B[0m $*" >&2
}

e_warning() {
  echo -e "\x1B[33;1m[Warning]\x1B[0m $*" >&2
}

e_error() {
  echo -e "\x1B[31;1m[Error]\x1B[0m $*" >&2
}

if [ -z "${GH_TOKEN}" ]; then
  e_error "GitHub token not set, not deploying"
  exit 1
fi

e_info "Cloning from remote"
git clone --depth=3 --branch=$BRANCH --single-branch "https://$GH_TOKEN@github.com/$GH_REPO.git" deploy &>/dev/null
rm -rf public/.git
mv deploy/.git public

cd public
e_info "Adding commit info"
git config user.name "Travis CI"
git config user.email "travis@travis-ci.org"
git add --all
git commit --message "Auto deploy from Travis CI build ${TRAVIS_BUILD_NUMBER:-#}" &>/dev/null

e_info "Pushing to GitHub"
git push origin $BRANCH &>/dev/null

e_success "Successfully deployed to GitHub Pages"
