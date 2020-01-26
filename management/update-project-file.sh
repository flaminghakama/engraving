#!/usr/local/bin/bash
# update-project-file.sh

#  Create a new build file, based on the original.
#  Assumes you are running from the engraving directory,
#  within which this script and other sourced scripts live in a 'managment' directory

function showUpdateProjectFileHelp {
	echo "update-project-file.sh Usage:"
	echo "    ./management/update-project-file.sh my-song-name"
	exit 1	
}

if [ "$1" == "" ]; then
	showUpdateProjectFileHelp  "Please specify a song."
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

#  ###################  #
#  UPDATE PROJECT FILE  #
#  ###################  #

echo "-=-"
echo "cd to $SONG_DIR"
cd $SONG_DIR

echo "-=-"
echo "move the original project file down a directory"
mv $ORIGINAL_PROJECT_FILE .

# echo "-=-"
# echo "update location of flaming-libs in project file $PROJECT_FILE"
# perl -p -i -e "'s|\.\./flaming\-libs|/flaming-libs|g'" $PROJECT_FILE

echo "-=-"
echo "update location of subdirectories in project file $PROJECT_FILE"
perl -p -i -e 's|path": "|path": "ly/|g' $PROJECT_FILE
perl -p -i -e 's|path": "ly/\.|path\": ".|g' $PROJECT_FILE

echo "-=-"
echo "Update the song section of $PROJECT_FILE"
echo "subl -n $PROJECT_FILE"
echo '            "file_exclude_patterns": [".git*", "*ideas*", "*.pdf", "READ*"],'
echo '            "folder_exclude_patterns": ["ly", "pdf", "midi", "logic"]'

echo "-=-"
echo "Update the library section of $PROJECT_FILE"
echo '            "file_exclude_patterns": [".git*", "LICENSE", "README.md"],'

echo "-=-"
echo "Update the PDF section of $PROJECT_FILE"
perl -p -i -e 's|path":.*pdf.*|path": "pdf",|g' $PROJECT_FILE
echo '            "path": "pdf",'
echo '            "file_exclude_patterns": [".git*", "LICENSE", "README.md"],'

