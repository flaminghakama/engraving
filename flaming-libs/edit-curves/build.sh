#!/usr/local/bin/bash
# Usage: buildLilyEasySlurs.sh file-base-name

FILE_BASE_NAME="lily-easy-slurs"
if [ "$1" != "" ]; then 
	FILE_BASE_NAME=$1
fi

SVG="$FILE_BASE_NAME.svg"
LILYPOND="$FILE_BASE_NAME.ly"

if [ -e "$SVG" ]; then
    rm $SVG
fi

lilypond -dbackend=svg $LILYPOND

perl -p -i -e 's|</svg>||' $SVG
echo "<script xlink:href=\"lilyEasySlurs.js\"></script>" >> $SVG
echo "</svg>" >> $SVG

open -a "Google Chrome" $SVG

echo grep lilyEasySlurs $SVG
