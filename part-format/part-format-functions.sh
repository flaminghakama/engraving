
PART_FORMAT_DIR=~/git/engraving/part-format
PDFCAT=~/git/PyPDF2/Scripts/pdfcat

function stitchTitlePage {
	SONG=$1
	INSTRUMENT=$2
	python $PART_FORMAT_DIR/extract-pages.py "pdf/$SONG-$INSTRUMENT-title-page.pdf" "$SONG-$INSTRUMENT-title-page.pdf" 1
	python $PDFCAT -o "$SONG-$INSTRUMENT.pdf" "$SONG-$INSTRUMENT-title-page.pdf" "pdf/$SONG-$INSTRUMENT.pdf"
	mv "$SONG-$INSTRUMENT.pdf" pdf 
	rm "$SONG-$INSTRUMENT-title-page.pdf" "pdf/$SONG-$INSTRUMENT-title-page.pdf"
}

function bookifyThreePage { 
	SONG=$1
	INSTRUMENT=$2
	python $PART_FORMAT_DIR/bookify-3page.py "pdf/$SONG-$INSTRUMENT.pdf" "$SONG-$INSTRUMENT.pdf"
	mv "$SONG-$INSTRUMENT.pdf" pdf/printable
}

function bookifyFourPage { 
	SONG=$1
	INSTRUMENT=$2
	python $PART_FORMAT_DIR/bookify-4page.py "pdf/$SONG-$INSTRUMENT.pdf" "$SONG-$INSTRUMENT.pdf"
	mv "$SONG-$INSTRUMENT.pdf" pdf/printable
}

function bookifyFivePage { 
	SONG=$1
	INSTRUMENT=$2
	python $PDFCAT -o "$SONG-$INSTRUMENT-six-page.pdf" "pdf/$SONG-$INSTRUMENT.pdf" $PART_FORMAT_DIR/blank-page.pdf
	$PART_FORMAT_DIR/bookify-6page.sh "$SONG-$INSTRUMENT-six-page.pdf" "$SONG-$INSTRUMENT.pdf"
	mv "$SONG-$INSTRUMENT.pdf" pdf/printable
	rm "$SONG-$INSTRUMENT-six-page.pdf"
}

function bookifySixPage { 
	SONG=$1
	INSTRUMENT=$2
	$PART_FORMAT_DIR/bookify-6page.sh "pdf/$SONG-$INSTRUMENT.pdf" "$SONG-$INSTRUMENT.pdf"
	mv "$SONG-$INSTRUMENT.pdf" pdf/printable
}

function bookifySevenPage {
	SONG=$1
	INSTRUMENT=$2
	python $PART_FORMAT_DIR/bookify-7page.py pdf/$SONG-$INSTRUMENT.pdf pdf/printable/$SONG-$INSTRUMENT.pdf manual
}

function bookifyEightPage {
	SONG=$1
	INSTRUMENT=$2
	python $PART_FORMAT_DIR/bookify-8page.py pdf/$SONG-$INSTRUMENT.pdf pdf/printable/$SONG-$INSTRUMENT.pdf manual
}

function combineFivePageFivePage {
	SONG=$1
	INSTRUMENT_ONE=$2
	INSTRUMENT_TWO=$3
	SUFFIX=$4
	python $PDFCAT -o "$SONG-$INSTRUMENT_ONE-six-page.pdf" "pdf/$SONG-$INSTRUMENT_ONE.pdf" $PART_FORMAT_DIR/blank-page.pdf
	python $PDFCAT -o "$SONG-$INSTRUMENT_TWO-six-page.pdf" "pdf/$SONG-$INSTRUMENT_TWO.pdf" $PART_FORMAT_DIR/blank-page.pdf
	$PART_FORMAT_DIR/combine-6page-6page.sh "$SONG-$INSTRUMENT_ONE-six-page.pdf" "$SONG-$INSTRUMENT_TWO-six-page.pdf" "$SONG-$SUFFIX.pdf"
	mv "$SONG-$SUFFIX.pdf" pdf/printable
	rm "$SONG-$INSTRUMENT_ONE-six-page.pdf"
	rm "$SONG-$INSTRUMENT_TWO-six-page.pdf"
}

function combineSixPageSixPage {
	SONG=$1
	INSTRUMENT_ONE=$2
	INSTRUMENT_TWO=$3
	SUFFIX=$4
	mv "pdf/$SONG-$INSTRUMENT_ONE.pdf" .
	mv "pdf/$SONG-$INSTRUMENT_TWO.pdf" .
	$PART_FORMAT_DIR/combine-6page-6page.sh "$SONG-$INSTRUMENT_ONE.pdf" "$SONG-$INSTRUMENT_TWO.pdf" "$SONG-$SUFFIX.pdf"
	mv "$SONG-$INSTRUMENT_ONE.pdf" pdf
	mv "$SONG-$INSTRUMENT_TWO.pdf" pdf
	mv "$SONG-$SUFFIX.pdf" pdf/printable
}

function combineTwoFiles {
	SONG=$1
	INSTRUMENT_ONE=$2
	INSTRUMENT_TWO=$3
	SUFFIX=$4
	python $PDFCAT -o "$SONG-$SUFFIX.pdf" "pdf/$SONG-$INSTRUMENT_ONE.pdf" "pdf/$SONG-$INSTRUMENT_TWO.pdf"
	mv "$SONG-$SUFFIX.pdf" pdf/printable
}

