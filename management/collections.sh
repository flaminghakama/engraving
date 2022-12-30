#!/usr/local/bin/bash
#
USAGE='./management/collections.sh scores/my-collection template-dir [ my-song ]+'

#  Within template-dir should be the following files:
# /properties/staff-properties.ily
# /properties/chord-names-properties.ily
# /structures/includes.ily
# /structures/SONG.ily
# /books/SONG/Lead-Sheet-for-C.ily
# /parts/SONG/Lead-Sheet-for-C.ly
# buildParts.sh

if [ "$#" -lt 2 ]; then
    echo "You need to supply collection and template.  And maybe a song."
	echo $USAGE
	exit 0
fi

COLLECTION=$1; shift;
TEMPLATE=$1; shift;


if [ ! -d $COLLECTION ] ; then
    echo "Could not find repo $COLLECTION"
	exit 1
fi

if [ ! -d $TEMPLATE ] ; then
    echo "Could not find templpate $TEMPLATE"
	exit 2 
fi


if [ -f $COLLECTION/buildParts.sh ] ; then
    echo "Collections build file exists"
else 
	BUILD=$TEMPLATE/buildParts.sh
	if [ ! -f $BUILD ] ; then
		echo "Could not find build file $BUILD"
		exit 3
	else 
		echo "Copying build file"
		cp $BUILD $COLLECTION
	fi
fi

if [ -d $COLLECTION/ly ] ; then
    echo "Collections ly directory exists"
else 
    echo "Creating ly directory"
	mkdir $COLLECTION/ly
fi

if [ -d $COLLECTION/ly/properties ] ; then
    echo "Collections properties directory exists"
else 
	PROPS=$TEMPLATE/properties
	if [ ! -d $PROPS ] ; then
		echo "Could not find properties directory $PROPS"
		exit 4
	else 
		echo "Copying properties"
		cp -R $PROPS $COLLECTION/ly
	fi
fi

if [ -d $COLLECTION/ly/structures ] ; then
    echo "Collections structures directory exists"
else 
	STRUCTURES=$TEMPLATE/structures/includes.ily
	if [ ! -f $STRUCTURES ] ; then
		echo "Could not find structures files $STRUCTURES"
		exit 5
	else 
		echo "Copying structures"
		mkdir $COLLECTION/ly/structures
		cp $STRUCTURES $COLLECTION/ly/structures
	fi
fi

if [ -d $COLLECTION/ly/books ] ; then
    echo "Collections books directory exists"
else 
    echo "Creating books directory"
	mkdir $COLLECTION/ly/books
fi

if [ -d $COLLECTION/ly/parts ] ; then
    echo "Collections parts directory exists"
else 
    echo "Creating parts directory"
	mkdir $COLLECTION/ly/parts
fi


for SONG in "$@"
do
    echo "song is $SONG"

	STRUCTURE=$TEMPLATE/structures/SONG.ily
	if [ ! -f $STRUCTURE ] ; then
		echo "Song structure does not exist $STRUCTURE"
		exit 6
	else 
		cp $STRUCTURE $COLLECTION/ly/structures/$SONG.ily
		perl -p -i -e "s/SONG/$SONG/g" $COLLECTION/ly/structures/$SONG.ily
	fi

	BOOK=$TEMPLATE/books/SONG/Lead-Sheet-for-C.ily 
	if [ ! -f $BOOK  ] ; then
		echo "Book does not exist $BOOK "
		exit 7
	else 
		if [ ! -d $COLLECTION/ly/books/$SONG ] ; then 
		    mkdir $COLLECTION/ly/books/$SONG
		fi
		cp $BOOK $COLLECTION/ly/books/$SONG/Lead-Sheet-for-C.ily
		perl -p -i -e "s/SONG/$SONG/g" $COLLECTION/ly/books/$SONG/Lead-Sheet-for-C.ily
	fi

	PART=$TEMPLATE/parts/SONG/Lead-Sheet-for-C.ly 
	if [ ! -f $PART  ] ; then
		echo "Part does not exist $PART "
		exit 8
	else 
		if [ ! -d $COLLECTION/ly/parts/$SONG ] ; then 
		    mkdir $COLLECTION/ly/parts/$SONG
		fi
		cp $PART $COLLECTION/ly/parts/$SONG/Lead-Sheet-for-C.ly
		perl -p -i -e "s/SONG/$SONG/g" $COLLECTION/ly/parts/$SONG/Lead-Sheet-for-C.ly
	fi

	echo 'if [ "$SONG" = "" ] || [ "$SONG" = "<SONG>" ] ; then' >> $COLLECTION/buildParts.sh
	echo '    THIS_SONG="<SONG>"' >> $COLLECTION/buildParts.sh
	echo '    buildPart $THIS_SONG Lead-Sheet-for-C' >> $COLLECTION/buildParts.sh
	echo 'fi' >> $COLLECTION/buildParts.sh
	echo '' >> $COLLECTION/buildParts.sh

	perl -p -i -e "s/\<SONG\>/$SONG/g" $COLLECTION/buildParts.sh

	if [ -d $COLLECTION/pdf/$SONG ] ; then
		echo "PDF directory for $SONG exists"
	else 
		echo "Creating PDF directory"
		mkdir $COLLECTION/pdf/$SONG
	fi

done

