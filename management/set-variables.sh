#!/usr/local/bin/bash
# set-variables.sh

#  Defines variables used by other management scripts.
#  Assumes that the following are already defined:
#      SONG
#      ENGRAVING_DIR
#      ORIGINAL_SONG_DIR (only needed for clone-repos.sh)

SONG_REGEXP=`echo $SONG | sed 's/\-/\\\-/g'`
SONG_PDF="$SONG-pdf"
REPO_BASE_URL="git@github.com:flaminghakama/"
LILYPOND_REPO_URL="$REPO_BASE_URL$SONG.git"
PDF_REPO_URL="$REPO_BASE_URL$SONG_PDF.git"

SCRIPTS_DIR="$ENGRAVING_DIR/management"
SCORES_DIR="$ENGRAVING_DIR/scores"
SONG_DIR="$SCORES_DIR/$SONG"
ORIGINAL_PROJECT_FILE="$SONG_DIR/ly/$SONG.sublime-project"
PROJECT_FILE="$SONG_DIR/$SONG.sublime-project"
BUILD_FILE="$SONG_DIR/buildParts.sh"
README_FILE="README.md"
SONG_TITLE_CASE=`echo $SONG | sed 's/-/ /g' | perl -p -n -e 's/(\S+)/\u\L$1/g'`

CLONE_REPOS_SCRIPT="$SCRIPTS_DIR/clone-repos.sh"
COPY_SOURCE_SCRIPT="$SCRIPTS_DIR/copy-source.sh"
UPDATE_PROJECT_FILE_SCRIPT="$SCRIPTS_DIR/update-project-file.sh"
RECREATE_BUILD_FILE_SCRIPT="$SCRIPTS_DIR/recreate-build-file.sh"
UPDATE_SOURCE_FILES_SCRIPT="$SCRIPTS_DIR/update-source-files.sh"

ALT_JAZZ_WOODWIND_PARTS="Flute English-Horn-in-F Clarinet-in-A Bass-Clarinet-in-Bb Bassoon"
ALT_JAZZ_BRASS_PARTS="Trumpet-in-Bb Horn-in-F Trombone"
ALT_JAZZ_STRING_PARTS="Violin-I Violin-II Viola Cello Bass"
ALT_JAZZ_RHYTHM_PARTS="Voice Clave Drums Piano"
ALT_JAZZ_SCORES="Score-Transposed Score-Concert Lead-Sheet Score-Sound"
ALT_JAZZ_PARTS="$ALT_JAZZ_WOODWIND_PARTS $ALT_JAZZ_BRASS_PARTS $ALT_JAZZ_STRING_PARTS $ALT_JAZZ_RHYTHM_PARTS $ALT_JAZZ_SCORES"
SAX_QUARTET_ARRANGEMENT="Soprano-Saxophone-in-Bb Alto-Saxophone-in-Eb Tenor-Saxophone-in-Bb Baritone-Saxophone-in-Eb Score-Transposed Score-Sound"

