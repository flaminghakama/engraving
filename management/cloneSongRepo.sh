#!/bin/sh

if [ "$1" == "" ]; then
        echo "Please provide a song name (repo name)"
        echo "Usage: cloneSongRepo.sh <song-name>"
        exit 1
fi

SONG=$1
cd scores
git clone --recurse-submodules git@github.com:flaminghakama/$SONG
