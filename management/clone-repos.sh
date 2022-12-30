#!/usr/local/bin/bash
# clone-repos.sh

#  Clones repos from github for song source files, and pdf file.
#  Assumes you are running from the engraving directory,
#  within which this script and other sourced scripts live in a 'managment' directory

function showCloneHelp {
	echo "clone-repos.sh Usage depends on whether you are just cloining, or setting up the pdf repo as a submoule:"
	echo "    ./management/clone-repos.sh SONG"
	echo "    ./management/clone-repos.sh SONG setup"
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
git clone --recurse-submodules $LILYPOND_REPO_URL

if [ "$2" != "setup" ]; then
	echo "Done with clone only of $SONG repos"
	exit 0
fi

echo "-=-"
echo "cd $SONG_DIR" 
cd $SONG_DIR

echo "-=-"
echo "Create a README.md"
echo "Sheet music for alt.jazz arrangement of $SONG_TITLE_CASE." >> $README_FILE
echo "Lilypond source files and build scripts." >> $README_FILE
git add $README_FILE

echo "-=-"
echo "Create a .gitignore"
echo "Sheet music for alt.jazz arrangement of $SONG_TITLE_CASE." >> $README_FILE
echo "Lilypond source files and build scripts." >> $README_FILE

echo "*.ps" > .gitignore
echo "*.log" >> .gitignore
echo "*~" >> .gitignore
echo "*.sublime-workspace" >> .gitignore
git add .gitignore

echo "-=-"
echo "Committing and pushing update to README.md and .gitignore"
git commit -m"Updating README" $README_FILE .gitignore
git push

echo "-=-"
echo "Nest the PDF repo inside the lilypond repo"
git submodule add $PDF_REPO_URL
git mv $SONG_PDF pdf
perl -p -i -e "'s/path.*/path = pdf/g'" .gitmodules 
git add pdf .gitmodules
git commit -m "'added $SONG_PDF module'" .gitmodules pdf
cd pdf
git submodule init

if [ -f "manifest.js" ] ; then 
	cp manifest.js pdf/manifest.js
	cd pdf 
	git add manifest.js
	git commit -m"moving manifest to pdf" manifest.js

	cd ..
	git rm manifest.js
	git commit -m"moving manifest to pdf" manifest.js
fi
