#!/bin/bash -xe

git submodule sync
git submodule update --init
mkdir -p 700 ~/.ssh/
