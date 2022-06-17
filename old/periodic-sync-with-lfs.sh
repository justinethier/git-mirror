#!/bin/bash
#
# This script syncs changes from the remote repo to our local mirror.
# Perform initial setup with sync script, then run this one periodically.
#

# Clone a local copy of our mirror and get assets from LFS
cd repo-to-mirror
git lfs fetch --all

# Fetch upstream changes including LFS
git remote update upstream
git lfs fetch upstream --all

# Setup our local git to track all branches so we can sync them
# Solution from: https://stackoverflow.com/a/4754797/101258
for branch in $(git branch --all | grep '^\s*remotes' | egrep --invert-match '(:?HEAD|master)$'); do
    git branch --track "${branch##*/}" "$branch"
done
git fetch --all

# Finally, push everything to our local Gitlab mirror
git push origin --all
git push origin --tags

