#!/bin/bash
#
# This script syncs changes from the remote repo to our local mirror
# Can be run periodically. Remove the `git clone` and `remote add` lines for optimal performance.
#

# Clone a local copy of our mirror and get assets from LFS
git clone git@my-server:my-ort/repo-to-mirror.git
cd repo-to-mirror
git lfs fetch --all

# Fetch upstream changes including LFS
git remote add upstream https://remote-server/remote-org/repo-to-mirror.git
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

