#!/usr/local/bin/bash
# copy-source.sh

#  Copy the source files for the song to the new location, reorganize, and update git.
#  Assumes you are running from the engraving directory,
#  within which this script and other sourced scripts live in a 'managment' directory

function showCopySourceHelp {
	echo "copy-source.sh Usage:"
	echo "    ./management/copy-source.sh my-song-name"
	exit 1	
}

if [ "$1" == "" ]; then
	showCopySourceHelp  "Please specify a song."
fi

SONG=$1
ENGRAVING_DIR=`pwd`
SET_VARIABLES_FILE="$ENGRAVING_DIR/management/set-variables.sh"

if [ -f "$SET_VARIABLES_FILE" ]; then
	source $SET_VARIABLES_FILE
else
	echo "Could not find set variables file ($SET_VARIABLES_FILE)"
	exit 1
fi

ORIGINAL_LILY_SONG_DIR="$ORIGINAL_SONG_DIR/ly/$SONG" 

if [ ! -d "$ORIGINAL_LILY_SONG_DIR" ]; then
	echo "Could not find the original lilypond directory ($ORIGINAL_LILY_SONG_DIR)"
	exit 1
fi

#  ####################  #
#  COPY PREVIOUS SOURCE  #
#  ####################  #

echo "-=-"
echo "cd to song directory $SONG_DIR"
cd $SONG_DIR

echo "-=-"
echo "making ly directory"
mkdir ly

echo "-=-"
echo "copying files from $ORIGINAL_LILY_SONG_DIR to ly directory"
for file in $ORIGINAL_LILY_SONG_DIR/* ; do 
    cp -R  "$file" ly
done

echo "-=-"
echo "mkdir midi"
mkdir midi

echo "-=-"
echo "mkdir logic"
mkdir logic

echo "-=-"
echo "copying files from $ORIGINAL_SONG_DIR/midi to midi directory"
for file in $ORIGINAL_SONG_DIR/midi/*.midi ; do 
    cp -R  "$file" midi
done

echo "-=-"
echo "Addding entry in .gitignore to ignore sublime-workspace files"
cat .gitignore >> .gitignore.tmp
echo "*.sublime-workspace" >> .gitignore.tmp
echo "logic" >> .gitignore.tmp
mv .gitignore.tmp .gitignore

echo "-=-"
echo "moving buildParts.sh to root directory"
mv ly/buildParts.sh .

echo "-=-"
echo "deleting sublime-workspace file"
rm "ly/$SONG.sublime-workspace"

echo "-=-"
echo "adding to git: buildParts.sh .gitignore midi ly"
git add buildParts.sh .gitignore midi ly
