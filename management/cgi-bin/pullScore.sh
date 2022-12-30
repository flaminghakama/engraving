#!/bin/sh

# Usage: pullScores.sh repo
REPO=$1
cd ../scores/$REPO
git pull 2>&1
