#!/usr/local/bin/bash
# recreate-build-file.sh

#  Create a new build file, based on the original.
#  Assumes you are running from the engraving directory,
#  within which this script and other sourced scripts live in a 'managment' directory

function showRecreateHelp {
	echo "recreate-build-file.sh Usage:"
	echo "    ./management/recreate-build-file.sh my-song-name"
	exit 1	
}

if [ "$1" == "" ]; then
	showRecreateHelp  "Please specify a song."
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

#  #######################  #
#  RECREATE THE BUILD FILE  #
#  #######################  #

BUILD_TMP="$BUILD_FILE.tmp"
echo "-=-"
echo "Update use of song name in build file $BUILD_FILE"
perl -p -i -e "'s|$SONG_REGEXP|\\$SONG|g'" $BUILD_FILE

echo "-=-"
echo "Initializing temp build file $BUILD_TMP"
echo "subl -n $BUILD_TMP"
echo "#!/usr/local/bin/bash" >> $BUILD_TMP
echo "source ~/git/part-format/part-format-functions.sh" >> $BUILD_TMP
echo "SONG=\"$SONG\"" >> $BUILD_TMP 

echo "-=-"
echo "Adding old build file $BUILD_FILE to build temp."
cat $BUILD_FILE >> $BUILD_TMP

echo "-=-"
echo "Renaming build file as $BUILD_FILE"
echo "subl -n $BUILD_FILE"
mv $BUILD_TMP $BUILD_FILE

echo "-=-"
echo "Removing song name from directory structure in $BUILD_FILE"
perl -p -i -e "'s|ly/$SONG_REGEXP|ly|g'" $BUILD_FILE

echo "-=-"
echo "Making build file executable"
chmod ugo+x $BUILD_FILE
