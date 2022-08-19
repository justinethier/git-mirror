# Intro

This repository provides scripts to setup a basic, no-frills mirror of a git repository.

In general the `git-mirror` script will be used to create and work with your mirrors.

For repos using [Git LFS](https://git-lfs.github.com/) use `git-lfs-mirror`. This script supports the same commands as `git-mirror` and is a drop-in replacement. 

# Usage

The following commands are provided:

## `init REMOTE_REPO SERVER`

Run the init command to create the initial mirror of a repository, and push that mirror to the specified server.

This command will create a bare repository on your local machine. This is not suitable for check outs so once the repository is created you will probably want to delete the directory and check our your mirror again using the clone command.

For example:

    git-mirror init https://github.com/justinethier/git-mirror.git git@github.com:your-account/test.git

## `clone REMOTE_REPO SERVER`
   
Clone will create a local clone of your mirrored repository and setup the local repository to track all upstream branches so we can sync them.

For example:

    git-mirror clone https://github.com/justinethier/git-mirror.git git@github.com:your-account/test.git

## `update`

Update our mirrored repository with changes from upstream. This includes updates to all tracked branches.

For example:

    git-mirror update

