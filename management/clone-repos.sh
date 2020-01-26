#!/usr/local/bin/bash
# clone-repos.sh

#  Clones repos from github for song source files, and pdf file.
#  Assumes you are running from the engraving directory,
#  within which this script and other sourced scripts live in a 'managment' directory

function showCloneHelp {
	echo "clone-repos.sh Usage:"
	echo "    ./management/clone-repos.sh SONG ORIGINAL_SONG_DIR"
	echo "    ./management/clone-repos.sh my-song-name /Users/elaine/git/scores/alt.musica"
	exit 1	
}

if [ "$1" == "" ]; then
	showCloneHelp  "Please specify a song."
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

source $ENGRAVING_DIR/management/set-variables.sh

#  ######################  #
#  CLONE AND UPDATE REPOS  #
#  ######################  #

echo "-=-"
echo "Clone the lilypond repo $LILYPOND_REPO_URL into $SCORES_DIR"
cd $SCORES_DIR
git clone $LILYPOND_REPO_URL

echo "-=-"
echo "cd $SONG_DIR" 
cd $SONG_DIR

echo "-=-"
echo "Create a README.md"
echo "Sheet music for alt.jazz arrangement of $SONG_TITLE_CASE." >> $README_FILE
echo "Lilypond source files and build scripts." >> $README_FILE
git add $README_FILE

echo "-=-"
echo "Committing and pushing update to README.md"
git commit -m"Updating README" $README_FILE
git push origin master

echo "-=-"
echo "Nest the PDF repo inside the lilypond repo"
git submodule add $PDF_REPO_URL
git mv $SONG_PDF pdf
perl -p -i -e "'s/path.*/path = pdf/g'" .gitmodules 
git add pdf .gitmodules
git commit -m "'added $SONG_PDF module'" .gitmodules pdf
cd pdf
git submodule init


