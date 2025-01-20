#!/bin/bash

set -e

test ! -d .git && echo "directory .git not found" && exit 1
test -z "$1" && git branch -a && exit

git branch -D "$1"
git branch -dr origin/"$1"

echo "Branch $1 deleted locally and remotely."
