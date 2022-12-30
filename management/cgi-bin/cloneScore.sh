#!/bin/sh

REPO=$1
cd ../scores
git clone git@github.com:flaminghakama/$REPO-pdf 2>&1
mv $REPO-pdf $REPO
cd $REPO 2>&1
git checkout main
git config pull.rebase true 2>&1
