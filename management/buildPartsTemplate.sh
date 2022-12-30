#!/usr/local/bin/bash

source ../../part-format/part-format-functions.sh

PREVIEW="open -a Preview"
PREVIEW_SUFFIX=""
KILL_PREVIEW="killPreview"
if [ ! command -v open &> /dev/null ] ; then
    PREVIEW=a
    PREVIEW_SUFFIX="\&"
    KILL_PREVIEW="killAcro"
fi

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
	$PREVIEW pdf/$THIS_SONG/$THIS_SONG-$PART.pdf $PREVIEW_SUFFIX
}

# For a new song, add a block 

if [ "$SONG" = "" ] || [ "$SONG" = "my-song" ] ; then 
    buildPart my-song Lead-Sheet-C
fi
