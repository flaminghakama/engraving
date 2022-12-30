#!/usr/local/bin/bash
# update-source-files.sh

#  Update source files so paths of included files conform to new directory structure.
#  Assumes you are running from the engraving directory,
#  within which this script and other sourced scripts live in a 'managment' directory

function showUpdateHelp {
	echo "update-source-files.sh Usage:"
	echo "    ./management/update-source-files.sh my-song-name"
	exit 1	
}

if [ "$1" == "" ]; then
	showUpdateHelp  "Please specify a song."
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

#  ############################  #
#  UPDATE PATHS IN SOURCE FILES  # 
#  ############################  #
 
echo "-=-"
echo "cd $SONG_DIR"
cd $SONG_DIR

echo "-=-"
echo "Update part files for includes"        
perl -p -i -e "'s|$SONG_REGEXP/||g'" ly/parts/*.ly

echo "-=-"
echo "Update instrument files for includes"        
perl -p -i -e "'s|$SONG_REGEXP/||g'" ly/instruments/*.ily

echo "-=-"
if [ -d ly/music ] ; then   	
	echo "Update music files for includes"      
	perl -p -i -e "'s|$SONG_REGEXP/||g'" ly/music/*.ily
fi
if [ -d ly/instruments ] ; then   	
	echo "Update instrument files for includes"      
	perl -p -i -e "'s|$SONG_REGEXP/||g'" ly/instruments/*.ily
fi

echo "-=-"
if [ -d ly/staves ] ; then
	echo "Updating includes for staves"
	perl -p -i -e 's|include.*staff-defaults.ily|include \"staff-defaults.ily|g' ly/staves/*/*.ily
fi

echo "-=-"
echo "Use relative paths for includes"
perl -p -i -e "s/.*header.ily.*/\#(ly:set-option 'relative-includes \#t)\n\\\\include \"ly\/structures\/header.ily\"/g" ly/parts/*.ly

echo "-=-"
echo "Use relative paths for includes"
perl -p -i -e "s/.*header.ily.*/\#(ly:set-option 'relative-includes \#t)\n\\\\include \"ly\/structures\/header.ily\"/g" ly/parts/*.ly

