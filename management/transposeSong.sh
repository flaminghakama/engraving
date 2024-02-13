THIS_SONG=$1
NEW_KEY=$2
ORIGINAL_KEY=$3

if [ "$1" == "" ]; then
	echo ""
	echo "Please provide a song title, new key, and original key"
	echo ""
	echo "    Usage: transposeSong.sh my-song-title newKey originalKey"
	echo "    "
	echo "    Example: transposeSong.sh octagon-arbiter Db E"
	echo ""
	exit 1
fi

if [ "$2" == "" ]; then
	echo ""
	echo "Please also provide a new key, and original key"
	echo ""
	echo "    Usage: transposeSong.sh my-song-title newKey originalKey"
	echo "    "
	echo "    Example: transposeSong.sh octagon-arbiter Db E"
	echo ""
	exit 1
fi

if [ "$3" == "" ]; then
	echo ""
	echo "Please also provide the original key"
	echo ""
	echo "    Usage: transposeSong.sh my-song-title newKey originalKey"
	echo "    "
	echo "    Example: transposeSong.sh octagon-arbiter Db E"
	echo ""
	exit 1
fi

PARTS_DIR=ly/parts/$THIS_SONG
BOOKS_DIR=ly/books/$THIS_SONG
echo '' > .buildLoop

TRANSPOSITIONS="C Bb Eb"
for transposition in $TRANSPOSITIONS ; do 

	ogPart=$PARTS_DIR/Lead-Sheet-for-$transposition.ly
	OG_PART_WAS_NOT_PREVIOUSLY_TRANSPOSED=""

	if [ -f $ogPart ]; then 

		# song has not yet been transposed 
		echo "Song has not yet been transposed"
		OG_PART_WAS_NOT_PREVIOUSLY_TRANSPOSED="true"
		echo "    buildPart \$THIS_SONG Lead-Sheet-in-$ORIGINAL_KEY-for-$transposition" >> .buildLoop

	else 

		echo "Using previously transposed part"
		ogPart=$PARTS_DIR/Lead-Sheet-in-$ORIGINAL_KEY-for-$transposition.ly

	fi
	echo "    buildPart \$THIS_SONG Lead-Sheet-in-$NEW_KEY-for-$transposition" >> .buildLoop	

	newPart=$PARTS_DIR/Lead-Sheet-in-$NEW_KEY-for-$transposition.ly
	cp $ogPart $newPart	

	ogBook=$BOOKS_DIR/Lead-Sheet-for-$transposition.ily

	if [ "$OG_PART_WAS_NOT_PREVIOUSLY_TRANSPOSED" == "true" ]; then 

		perl -p -i -e "s/for/in-$NEW_KEY-for/" $newPart
		perl -p -i -e "s/for/in-$ORIGINAL_KEY-for/" $ogPart

	else 

		echo perl -p -i -e "'s/in\\-$ORIGINAL_KEY\\-for/in-$NEW_KEY-for/'" $newPart
		perl -p -i -e "s/in\\-$ORIGINAL_KEY\\-for/in-$NEW_KEY-for/" $newPart
    	ogBook=$BOOKS_DIR/Lead\-Sheet-in-$ORIGINAL_KEY-for-$transposition.ily

	fi

	newBook=$BOOKS_DIR/Lead-Sheet-in-$NEW_KEY-for-$transposition.ily
	cp $ogBook $newBook	

	if [ "$OG_PART_WAS_NOT_PREVIOUSLY_TRANSPOSED" == "true" ]; then 
		echo git mv $ogPart $PARTS_DIR/Lead-Sheet-in-$ORIGINAL_KEY-for-$transposition.ly
		echo git mv $ogBook $BOOKS_DIR/Lead-Sheet-in-$ORIGINAL_KEY-for-$transposition.ily
		echo "cd pdf ; git mv $THIS_SONG/$THIS_SONG-Lead-Sheet-for-$transposition.pdf $THIS_SONG/$THIS_SONG-Lead-Sheet-in-$ORIGINAL_KEY-for-$transposition.pdf ; cd .." 
	fi

done

echo '' >> .buildLoop

cat .buildLoop >> buildParts.sh
rm .buildLoop


