# Setting up a score-specifc repo
# Create the lilypond repo
# Create the pdf repo
# Migrate old source code

function showHelp {
	echo "setting-up-repos.sh Usage:"
	echo "    ./management/setting-up-repos.sh SONG [ ORIGINAL_SONG_DIR ]?"
	echo ""
	echo "Displays commands used to"
	echo "Clone the git repos for SONG (lilypond and pdf)"
	echo "If ORIGINAL_SONG_DIR is specified, copies and updates lilypond code"
	echo ""
	echo "Exampes:"
	echo "    ./management/setting-up-repos.sh my-song-name"
	echo "    ./management/setting-up-repos.sh my-song-name /Users/elaine/git/scores/alt.musica"
	echo ""
	exit 1	
}

if [ "$1" == "" ]; then
	showHelp  "Please specify a song."
fi

SONG=$1
MESSAGE="Creating repo for song $SONG"
COPY=no
ORIGINAL_SONG_DIR=""

if [ "$2" != "" ]; then
	ORIGINAL_SONG_DIR=$2
	MESSAGE="$MESSAGE from location $2"
	COPY=yes
fi
echo "$MESSAGE"

ENGRAVING_DIR=`pwd`

source $ENGRAVING_DIR/management/set-variables.sh

#  ######################  #
#  CLONE AND UPDATE REPOS  #
#  ######################  #

echo "-=-"
echo "Calling script to clone git repos"
$CLONE_REPOS_SCRIPT $SONG

if [ "$COPY" == "yes" ]; then

	#  ####################  #
	#  COPY PREVIOUS SOURCE  #
	#  ####################  #

	echo "-=-"
	echo "Calling script to update previous source" 
	$COPY_SOURCE_SCRIPT $SONG

	#  ###################  #
	#  UPDATE PROJECT FILE  #
	#  ###################  #

	echo "-=-"
	echo "Calling script to update project file" 
	$UPDATE_PROJECT_FILE_SCRIPT $SONG

	#  #######################  #
	#  RECREATE THE BUILD FILE  #
	#  #######################  #

	echo "-=-"
	echo "Calling script to recreate the build file" 
	$RECREATE_BUILD_FILE_SCRIPT $SONG

	#  ############################  #
	#  UPDATE PATHS IN SOURCE FILES  # 
	#  ############################  #

	echo "-=-"
	echo "Calling script to update source files" 
	$UPDATE_SOURCE_FILES_SCRIPT $SONG
fi
