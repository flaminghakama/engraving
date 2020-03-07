#!/bin/sh

if [ "$1" == "" ]; then
        echo "Please provide a song name (repo name)"
        echo "Usage: cloneSongRepo.sh <song-name>"
        exit 1
fi

SONG=$1
ECHO="lives9"
ECHOTWO='!'
cd public_html/altjazz/scores
echo flaminghakama
echo "git$ECHO$ECHOTWO"
git clone https://github.com/flaminghakama/$SONG-pdf
mv $SONG-pdf $SONG