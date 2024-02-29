
SONG=$1 
shift

OLDKEY=$1 
shift 

NEWKEY=$1
shift

for TRANSPOSITION in C Bb Eb ; do 
	cp ly/parts/$SONG/Lead-Sheet-for-$TRANSPOSITION.ly ly/parts/$SONG/Lead-Sheet-in-$NEWKEY-for-$TRANSPOSITION.ly
	git mv ly/parts/$SONG/Lead-Sheet-for-$TRANSPOSITION.ly ly/parts/$SONG/Lead-Sheet-in-C-for-$TRANSPOSITION.ly
	perl -p -i -e "s/\\-for/-in-$OLDKEY-for/" ly/parts/$SONG/Lead-Sheet-in-$OLDKEY-for-$TRANSPOSITION.ly
	perl -p -i -e "s/\\-for/-in-$NEWKEY-for/" ly/parts/$SONG/Lead-Sheet-in-$NEWKEY-for-$TRANSPOSITION.ly

	cp ly/books/$SONG/Lead-Sheet-for-$TRANSPOSITION.ily ly/books/$SONG/Lead-Sheet-in-$NEWKEY-for-$TRANSPOSITION.ily
	git mv ly/books/$SONG/Lead-Sheet-for-$TRANSPOSITION.ily ly/books/$SONG/Lead-Sheet-in-C-for-$TRANSPOSITION.ily
	
    git mv pdf/$SONG/Lead-Sheet-for-$TRANSPOSITION.pdf pdf/$SONG/Lead-Sheet-in-$OLDKEY-for-$TRANSPOSITION.pdf

    echo "	buildPart \$THIS_SONG Lead-Sheet-in-$OLDKEY-for-$TRANSPOSITION" 
done 