# Setting up a score-specifc repo
# Create the lilypond repo
# Create the pdf repo

function showHelp {
	echo "$1  Usage:"
	echo "    ./setting-up-repos.sh SONG ORIGINAL_SONG_DIR"
	echo "    ./setting-up-repos.sh my-song-name /Users/elaine/git/scores/alt.musica"
	exit 1	
}

if [ "$1" == "" ]; then
	showHelp  "Please specify a song."
fi

if [ "$2" == "" ]; then
	showHelp  "Please specify a song and location."
fi
echo "Creating repo for song $1 from location $2"

SONG=$1
ORIGINAL_SONG_DIR=$2
SONG_REGEXP=`echo $SONG | sed 's/\-/\\\-/g'`
SONG_PDF="$SONG-pdf"
REPO_BASE_URL="https://github.com/flaminghakama/"
LILYPOND_REPO_URL="$REPO_BASE_URL$SONG"
PDF_REPO_URL="$REPO_BASE_URL$SONG_PDF"

SCORES_DIR="/Users/elaine/git/engraving/scores"
SONG_DIR="$SCORES_DIR/$SONG"
ORIGINAL_PROJECT_FILE="$SONG_DIR/ly/$SONG.sublime-project"
PROJECT_FILE="$SONG_DIR/$SONG.sublime-project"
BUILD_FILE="$SONG_DIR/buildParts.sh"

echo "-=-"
echo "Clone the lilypond repo $LILYPOND_REPO_URL into $SCORES_DIR"
cd $SCORES_DIR
git clone $LILYPOND_REPO_URL

echo "-=-"
echo "Add new repo $SONG to engraving .gitignore"
cat .gitignore >> .gitignore.tmp
echo "$SONG" >> .gitignore.tmp
mv .gitignore.tmp .gitignore

echo "-=-"
echo "Committing and pushing update to .gitignore"
git commit -m"Adding new repo $SONG to .gitignore"
git push origin master

echo "-=-"
echo "cd $SONG_DIR" 
cd $SONG_DIR

echo "-=-"
echo "Nest the PDF repo inside the lilypond repo"
git submodule add $PDF_REPO_URL
git mv $SONG_PDF pdf
perl -p -i -e "'s/path.*/path = pdf/g'" .gitmodules
git add commit.sh pdf .gitmodules
git commit -m "'added $SONG_PDF module'" commit.sh .gitmodules pdf
cd pdf
git submodule init

echo "-=-"
echo "cd to song directory $SONG_DIR"
cd $SONG_DIR

echo "-=-"
echo "mkdir ly"
mkdir ly

echo "-=-"
echo "copying files from $ORIGINAL_SONG_DIR/ly/$SONG to ly directory"
for file in $ORIGINAL_SONG_DIR/ly/$SONG/* ; do 
    cp -R  "$file" ly
done

echo "-=-"
echo "mv ly/buildParts.sh ."
mv ly/buildParts.sh .

echo "-=-"
echo "mv $ORIGINAL_PROJECT_FILE $SONG_DIR"
mv $ORIGINAL_PROJECT_FILE $SONG_DIR

echo "-=-"
echo "Addding entry in .gitignore to ignore sublime-workspace files"
cat .gitignore >> .gitignore.tmp
echo "*.sublime-workspace" >> .gitignore.tmp
mv .gitignore.tmp .gitignore

echo "-=-"
echo "rm ly/$SONG.sublime-workspace"
rm "ly/$SONG.sublime-workspace"

# echo "-=-"
# echo "update location of flaming-libs in project file $PROJECT_FILE"
# perl -p -i -e "'s|\.\./flaming\-libs|/flaming-libs|g'" $PROJECT_FILE

echo "-=-"
echo "update location of subdirectories in project file $PROJECT_FILE"
perl -p -i -e 's|path": "|path": "ly/|g' $PROJECT_FILE
perl -p -i -e 's|path": "ly/\.|path\": ".|g' $PROJECT_FILE

echo "-=-"
echo "Update the song section of $PROJECT_FILE"
echo "subl -n $PROJECT_FILE"
echo '            "file_exclude_patterns": [".git*", "*ideas*", "*.pdf"],'
echo '            "folder_exclude_patterns": ["ly", "pdf", "midi"]'

echo "-=-"
echo "Update part files for includes"        
perl -p -i -e "'s|$SONG_REGEXP/||g'" ly/parts/*.ly

echo "-=-"
echo "Update instrument files for includes"        
perl -p -i -e "'s|$SONG_REGEXP/||g'" ly/instruments/*.ily

echo "-=-"
echo "Update music files for includes"        
perl -p -i -e "'s|$SONG_REGEXP/||g'" ly/music/*.ily

BUILD_TMP="$BUILD_FILE.tmp"
echo "-=-"
echo "Update use of song name in build file $BUILD_FILE"
perl -p -i -e "s|$SONG_REGEXP|\\\$SONG|g" $BUILD_FILE

echo "-=-"
echo "Initializing temp build file $BUILD_TMP"
echo "subl -n $BUILD_TMP"
echo "#!/usr/local/bin/bash" >> $BUILD_TMP
echo "source ~/git/part-format/part-format-functions.sh" >> $BUILD_TMP
echo "SONG=\"$SONG\"" >> $BUILD_TMP 

echo "-=-"
echo "Adding old build file $BUILD_FILE to build temp."
cat $BUILD_FILE >> $BUILD_TMP

echo "-=-"
echo "Renaming build file as $BUILD_FILE"
echo "subl -n $BUILD_FILE"
mv $BUILD_TMP $BUILD_FILE

echo "-=-"
echo "Updating includes for staves"
perl -p -i -e 's|include.*staff-defaults.ily|include \"staff-defaults.ily|g' ly/staves/*/*.ily

echo "-=-"
echo "Use relative paths for includes"
perl -p -i -e "s/.*header.ily.*/\#(ly:set-option 'relative-includes \#t)\n\\include \"ly\/structures\/header.ily\"/g" ly/parts/*.ly


