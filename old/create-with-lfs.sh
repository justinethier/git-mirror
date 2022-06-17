#!/bin/bash
#
# Create initial mirror copy of a repository that is using Git LFS
#

git clone --bare https://remote-server/remote-org/repo-to-mirror.git
cd repo-to-mirror.git/
git lfs fetch --all
git config lfs.https://my-server/my-org/repo-to-mirror.git/info/lfs.locksverify true
git remote set-url origin git@my-server:my-org/repo-to-mirror.git
git lfs push --all
git lfs push --all git@my-server:my-org/repo-to-mirror.git
git lfs push --all origin
git push --mirror
