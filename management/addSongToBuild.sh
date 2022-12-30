#!/usr/local/bin/bash
#
#    Usage: addSongToBuild.sh my-collection my-song template-dir
#

#  Within template-dir should be the following files:
#  book.ily
#  part.ly
#  structures.ily
#  properties/chord-names-properties.ily
#  properties/staff-properties.ily



COLLECTION=$1
THIS_SONG=$2
TEMPLATE_DIR=$3
COLLECTION_DIR=scores/$COLLECTION
BUILD=$COLLECTION_DIR/buildParts.sh
if [ ! -f $BUILD ] ; then
    echo "Creating new build file $BUILD"
    cp management/buildPartsTemplate.sh $BUILD
else 
    echo "Working with existing build file $BUILD"
fi

echo "Adding song $THIS_SONG to build $BUILD"
echo "" >> $BUILD
echo "if [ \"\$SONG\" = \"\" ] || [ \"\$SONG\" = \"$THIS_SONG\" ] ; then" >> $BUILD 
echo "    buildPart $THIS_SONG Lead-Sheet-for-C" >> $BUILD
echo "fi" >> $BUILD

if [ ! -d $COLLECTION_DIR/ly ] ; then 
    mkdir $COLLECTION_DIR/ly
fi

if [ ! -d $COLLECTION_DIR/pdf ] ; then 
    mkdir $COLLECTION_DIR/pdf
fi

if [ ! -d $COLLECTION_DIR/midi ] ; then 
    mkdir $COLLECTION_DIR/midi
fi

if [ ! -d $COLLECTION_DIR/ly/books ] ; then 
    mkdir $COLLECTION_DIR/ly/books
fi
if [ ! -d $COLLECTION_DIR/ly/parts ] ; then 
    mkdir $COLLECTION_DIR/ly/parts
fi
if [ ! -d $COLLECTION_DIR/ly/structures ] ; then 
    mkdir $COLLECTION_DIR/ly/structures
fi
if [ ! -d $COLLECTION_DIR/ly/properties ] ; then 
    mkdir $COLLECTION_DIR/ly/properties
fi

BOOK_DIR=$COLLECTION_DIR/ly/books/$THIS_SONG
if [ ! -d $BOOK_DIR ] ; then 
    mkdir $BOOK_DIR
fi
BOOK=$BOOK_DIR/Lead-Sheet-for-C.ily
BOOK_TEMPLATE=$TEMPLATE_DIR/book.ily
if [ ! -f $BOOK_TEMPLATE ] ; then
    echo "Could not find book template $BOOK_TEMPLATE"
    ls -l $BOOK_TEMPLATE
    exit 1
fi
cp $BOOK_TEMPLATE $BOOK
perl -p -i -e "s/SONG/$THIS_SONG/g" $BOOK

PART_DIR=$COLLECTION_DIR/ly/parts/$THIS_SONG
if [ ! -d $PART_DIR ] ; then 
    mkdir $PART_DIR
fi
PART=$PART_DIR/Lead-Sheet-C.ly
PART_TEMPLATE=$TEMPLATE_DIR/part.ly
if [ ! -f $PART_TEMPLATE ] ; then
    echo "Could not find part template $PART_TEMPLATE"
    exit 2
fi
cp $PART_TEMPLATE $PART

STRUCTURE_DIR=$COLLECTION_DIR/ly/structures
if [ ! -d $STRUCTURE_DIR ] ; then 
    mkdir $STRUCTURE_DIR
fi
STRUCTURE=$STRUCTURE_DIR/$THIS_SONG.ily
STRUCTURE_TEMPLATE=$TEMPLATE_DIR/structure.ily
if [ ! -f $STRUCTURE_TEMPLATE ] ; then
    echo "Could not find structure template $STRUCTURE_TEMPLATE"
    exit 3
fi
cp $STRUCTURE_TEMPLATE $STRUCTURE

cp -R $TEMPLATE_DIR/properties/* $COLLECTION_DIR/ly/properties


