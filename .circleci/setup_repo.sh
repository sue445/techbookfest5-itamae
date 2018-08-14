#!/bin/bash -xe

git submodule sync
git submodule update --init
mkdir -p 700 ~/.ssh/

git config push.default current
git config user.name "CircleCI"
git config user.email ${EMAIL}
