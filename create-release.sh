#!/bin/bash

PFX="::crafttp::"

if [ "$1" == "" ]; then
    echo "$PFX Please specify a release number"
    exit 1
fi


if git diff-index --quiet HEAD --; then
    git pull || { echo "$PFX 'git pull' failed"; exit 1; }
    ./bump.sh $1 ||  { echo "$PFX './bump.sh' failed"; exit 1; }
    git add bower.json || { echo "$PFX 'Adding versioned files' failed"; exit 1; }
    git commit -m "Bump version to $1"|| { echo "$PFX 'Commit version bump' failed"; exit 1; } 
    git push || { echo "$PFX 'git push' failed"; exit 1; }
    git tag "v$1" || { echo "$PFX 'git tag' failed"; exit 1; }
    git push --tags || { echo "$PFX 'git push --tags' failed"; exit 1; }
else
    echo "$PFX Your code has changes. Cancel!"
fi
