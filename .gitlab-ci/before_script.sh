#!/bin/bash
set -e

BUILD_DIR=$HOME/builds/$RUNNER_TOKEN/0
CLONE_DIR="$BUILD_DIR/$CI_PROJECT_PATH"
cd $BUILD_DIR
pwd 
rm -rf $CLONE_DIR
mkdir -p $CLONE_DIR
eval $(ssh-agent -s)
ls -la /home/gitlab-runner-nginx/.ssh
ssh-add -l && echo ok
ssh-add /home/gitlab-runner-nginx/.ssh/appbot-2-hpc-docs_v2 <<< $'75375'&
ssh-add -l && echo ok
pwd 
ls -la
git clone git@git.icm.edu.pl:owu/hpc-docs.git $CLONE_DIR
cd $CLONE_DIR
pwd 
ls -la