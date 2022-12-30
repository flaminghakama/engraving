#!/usr/local/bin/bash

source ../../part-format/part-format-functions.sh

function buildPart {
	THIS_SONG=$1
	PART=$2
	if [ -f $PART.pdf ] ; then 
		rm $PART.pdf
	fi
	lilypond ly/parts/$THIS_SONG/$PART.ly 
	if [ ! -f $PART.pdf ] ; then 
		echo "Problem creating $THIS_SONG-$PART.pdf"
		exit 1
	fi
	mv $PART.pdf pdf/$THIS_SONG/$THIS_SONG-$PART.pdf
	open -a Preview pdf/$THIS_SONG/$THIS_SONG-$PART.pdf
}

SONG=$1

# if [ "$SONG" = "" ] || [ "$SONG" = "SONG" ] ; then 
# 	THIS_SONG="SONG"
# 	buildPart $THIS_SONG Lead-Sheet-for-C
# fi
