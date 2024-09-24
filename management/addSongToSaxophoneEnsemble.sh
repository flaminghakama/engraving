#!/usr/local/bin/bash
#
#    Usage: addSongToSaxophoneEnsemble.sh my-song "My Song" mySong
#

USAGE="addSongToSaxophoneEnsemble.sh my-song \"My Song\" mySong"
SONG=$1
TITLE=$2
VARIABLE=$3

if [ "$SONG" = "" ] ; then 
    echo $USAGE
    exit 1
fi

if [ "$TITLE" = "" ] ; then 
    echo $USAGE
    exit 2
fi

if [ "$VARIABLE" = "" ] ; then 
    echo $USAGE
    exit 3
fi

PART=("Part-1-Alto-Saxohpone-I-in-Eb" "Part-1-Soprano-Saxohpone-in-Bb" "Part-2-Alto-Saxohpone-II-in-Eb" "Part-3-Tenor-Saxohpone-in-Bb" "Part-4-Baritone-Saxohpone-in-Eb")

SCORE=("Score-AATB" "Score-AABB" "Score-STTT")

POET=("Saxophone Quartet (AATB)" "Saxophone Quartet (AABB)" "Saxophone Quartet (STTT)")

INSTRUMENT=("sopranoSaxophone" "altoSaxophoneI" "altoSaxophoneII" "tenorSaxophone" "baritoneSaxophone")

TRANSPOSITION=( "bf," "ef," "ef," "bf,," "ef,,")

CLEF=("treble" "treble" "treble" "treble" "treble")

PART_TEMPLATE="ly/parts/PART.ly"
PART_SCORE_TEMPLATE="ly/parts/SCORE.ly"
BOOK_TEMPLATE="ly/books/BOOK.ily"
BOOK_SCORE_TEMPLATE="ly/books/SCORE.ily"

if [ ! -d "ly/parts/$SONG" ] ; then 
    echo "Creating parts directory"
    mkdir ly/parts/$SONG
fi
if [ ! -d "ly/books/$SONG" ] ; then 
    echo "Creating books directory"
    mkdir ly/books/$SONG
fi
if [ ! -d "ly/structures/$SONG" ] ; then 
    echo "Creating structures directory"
    mkdir ly/structures/$SONG
fi

BUILD=buildParts.sh
echo "Adding song $SONG to build $BUILD"
echo "" >> $BUILD
echo "if [ \"\$SONG\" = \"\" ] || [ \"\$SONG\" = \"$SONG\" ] ; then" >> $BUILD 
echo "    THIS_SONG=\"$SONG\"" >> $BUILD

for INDEX in 0 1 2 3 4 ; do 
    THIS_PART=${PART[$INDEX]}
    PART_FILE="ly/parts/$SONG/$THIS_PART.ly"
    cp $PART_TEMPLATE $PART_FILE
    perl -p -i -e "s/SONG/$SONG/g" $PART_FILE
    perl -p -i -e "s/PART/${PART[$INDEX]}/g" $PART_FILE

    BOOK_FILE="ly/books/$SONG/${PART[$INDEX]}.ily"
    cp $BOOK_TEMPLATE $BOOK_FILE
    perl -p -i -e "s/TITLE/$TITLE/g" $BOOK_FILE
    perl -p -i -e "s/INSTRUMENT/${INSTRUMENT[$INDEX]}/g" $BOOK_FILE
    perl -p -i -e "s/TRANSPOSITION/${TRANSPOSITION[$INDEX]}/g" $BOOK_FILE
    perl -p -i -e "s/CLEF/${CLEF[$INDEX]}/g" $BOOK_FILE

    echo "    buildPart \$THIS_SONG ${PART[$INDEX]}" >> $BUILD

done

for INDEX in 0 1 2 ; do 

    PART_SCORE_FILE="ly/parts/$SONG/${SCORE[$INDEX]}.ly"
    cp $PART_SCORE_TEMPLATE $PART_SCORE_FILE
    perl -p -i -e "s/SONG/$SONG/g" $PART_SCORE_FILE
    perl -p -i -e "s/PART/${PART[$INDEX]}/g" $PART_SCORE_FILE

    BOOK_SCORE_FILE="ly/books/$SONG/${SCORE[$INDEX]}.ily"
    cp $BOOK_SCORE_TEMPLATE $BOOK_SCORE_FILE
    perl -p -i -e "s/SCORE/${SCORE[$INDEX]}/g" $BOOK_SCORE_FILE
    perl -p -i -e "s/TITLE/$TITLE/g" $BOOK_SCORE_FILE
    perl -p -i -e "s/POET/${POET[$INDEX]}/g" $BOOK_SCORE_FILE

    echo "    buildPart \$THIS_SONG ${SCORE[$INDEX]}" >> $BUILD

done

echo "fi" >> $BUILD

MUSIC_FILE="ly/muisic/$SONG.ily"
cp ly/music/MUSIC.ily $MUSIC_FILE
perl -p -i -e "s/VARIABLE/$VARIABLE/g" $MUSIC_FILE

HEADER_FILE="ly/structures/$SONG/header.ily"
cp ly/structures/SONG/header.ily $HEADER_FILE
perl -p -i -e "s/TITLE/$TITLE/g" $HEADER_FILE
perl -p -i -e "s/SONG/$SONG/g" $HEADER_FILE
perl -p -i -e "s/VARIABLE/$VARIABLE/g" $HEADER_FILE

cp ly/structures/SONG/forms.ily ly/structures/$SONG/forms.ily
cp ly/structures/SONG/chords.ily ly/structures/$SONG/chords.ily
cp ly/structures/SONG/lyrics.ily ly/structures/$SONG/lyrics.ily







