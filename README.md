# engraving

Scripts that facilitate development of scores using lilypond.

## templates

Files and templates used to create the file structure for a new project.

## flaming-libs

Libraries that define house styles and helpful definitions.

## part-format

Scripts that manipulate pdf files to help create and combine booklet-printable versions.

## management

Scripts to help migrate sheet music from old scores repo to song-specific repos and facilitate git tasks. 

# Notes on task workflows

## Tasks common to new and migrated scores

For each song you are creating, create two git repositories:
one named for the song
one named for the song pdfs.  

The naming convention is lower-kebab-case for the song, and appending -pdf for the pdf.
Example: "my-song" and "my-song-pdf"

For the "my-song" repo
##* repo is private
##* Create .gitignore for Lilypond

For the "my-song-pdf" repo
##* pdf repo is public
##* READMEs is necessary, but the content unimportant.

(no license necessary atm)

## Migration from scores

Run the script management/setting-up-repos.sh, supplying arguments of the repo name and the location of the original source.

./management/setting-up-repos.sh my-song ~/git/scores/alt.musica/ly/my-song-original-location

## New projects from template

1) Clone the git repos for your song by running:
./management/clone-repos.sh my-song "setup"

2) Choose or create a template within the templates directory.

3) It may be helpful to create a list of the instruments and scores in your project, since we need to supply this in the next command.

Several examples are provided in ./management/set-variables.sh, in this example we are using $ALT_JAZZ_PARTS
Initialize these by sourcing this file:
. ./management/set-variables.sh

4) Clone the template by running:
./management/cloneLilypondSongTemplate.pl my-song my-template $ALT_JAZZ_PARTS

The resulting structure will be in scores/my-song

Typically, you will change directories to scores/my-song then open the project using: 
cd scores/my-song
sublime -n my-song.sublime-project

And you can build the parts by running:
./buildParts.sh


# About Templates

## Template location

Templates consist of a directory structure that includes both static files and files with placeholders that are updated for each instrument.  

Templates live in a subdirectory of the template directory.  To create a new one, it is probably easiest to copy an existing template into a new directory.

## Files in a template

### Actual templates

There are a few template files that contain placeholders, which get cloned and updated with instrument-specific information.

* ly/music/INSTRUMENT.ily
* ly/books/SCORE.ily
* ly/books/MIDI.ily
* ly/books/BOOK.ily
* ly/parts/PART.ly

### Static files

There are also static files that are copied and used as-is.

#### Structures

There are four files that are copied as-is, but you will want to update the contents after cloning.

* ly/structures/header.ily
* ly/structures/chords.ily
* ly/structures/forms.ily
* ly/structures/lyrics.ily

#### Parts Layout Context

* ly/parts/layout.ily

Contains definition of layout contexts, which is included in other parts files.

#### Staves

These files define the staves for each instrument.  There are a few versions for each instrument, since staves are often different in parts and scores.  For example, the instrument name used and the staff size, among other details:

* ly/staves/parts/*.ily
* ly/staves/scores/*.ily
* ly/staves/sound/*.ily

In addition, there may also be a file that is included by each staff file:

* ly/staves/parts/staff-defaults.ily	
* ly/staves/scores/staff-defaults.ily

#### Staff Groups

* /ly/staffgroups/transposed/*.ily
* /ly/staffgroups/concert/*.ily

Each staff group file, named an instrumental section, contains definitions of a staffgroups, which are mostly a collection of includes for the various staves in the staffgroup.   There are two versions since staves are often different based on whether the score is transposed or concert.

### Manifest

There is a template called manifest.js, which can be used when displaying files on the web using the manifeset project
https://github.com/flaminghakama/manifest

This manifest.js file defines metadata about the composition, information about the parts, and maps parts to "books". 

# Using Templates

There is generally some chicken-and-egg with using templates.

Before the template becomes fully usable for creative work, you will need to update the files in the template that contain the global song structure.

## Do You Know the Song Structure?

### I Know the Structure 

If you already know the structure, you might want to start by duplicating a template and modifying the file that contain structures:

cd ./templates
cp -R alt.musica my-template

Within templates/my-template, update the following files:

  ly/structures/header.ily
* ly/structures/forms.ily
* ly/structures/chords.ily
* ly/structures/lyrics.ily
* ly/music/INSTRUMENT.ily
  ly/books/BOOK.ily
  ly/books/MIDI.ily
  ly/books/SCORE.ily

  update these files to match the staff groups:
  ly/staffgroups/concert/<section>.ily
  ly/staffgroups/transposed/<section>.ily


Then, you can clone this new template and start creative work:

#  Change directories back to engraving home directory
cd .. 

#  Clone the template into the songs directory
./management/cloneLilypondSongTemplate.pl my-song my-template $PARTS_AND_SCORES

#  Change directory to the song
cd scores/my-song

#  Open the project in Sublime Text
sublime -n my-song.sublime-project

# Build the parts
./buildParts.sh

### I Don't Know the Structure 

However, sometimes you want to get started even though you don't know the structure, and want to iterate on it.

In that case, your workflow will be more like:

1. Clone a pre-existing template (like 'alt.musica') under a temporary name, like my-song-preliminary
2. Work on the preliminary version of the song until you decide the structure and updated the four files with structure, listed above.
3. Duplicate the template.  
4. Update the four files in the new template with structural info, as well as any files you may have updated with song-specific info, like ly/structures/header.ily
4. Clone your new template, under the real name, using the new template.  
5. Copy over any addtional content you may have added to generated files.  For example, you may have entered notes in the ly/music/*.ily files.  Since these files get recreated with emply structure when you clone the template, you can cut and paste any notes or music entered in the preliminary version, into the final version.
6. Remove the preliminary version

Each time you want to change the song structure, it may be easiest to follow this recipe.  However, you do not need to create a new template each time, you can just update the template you are using instead of cloning it again.

After you have selected and/or created or modified a template to your liking, 
and after you have cloned the template, it is time to start using it.

## How to update the song structure

### Update song info

Update info about the song in ly/structures/header.ily

The title is broken up into two halves for printing on page headers.  The title "My Song" might be broken up like this:

titleLeft = "My"
titleRight = "Song"
titleFull = "My Song"

Also the copyright and font.

### About song structure

The song structure is the roadmap of the song.  It includs all key and time signatures, tempi, barlines, rehearsal letters/numbers, and anything else that will appear in all parts and scores.

This structure is defined as a music variable, which contains all these definitions, with spacers instead of notes or rests.  

The structure may contain tags that help with segmenting the piece into smaller, more manageable sections.  This facilitates speeding up work, since you can compile only one section at a time.

Here is an example structure with two segments:

structureSong = \relative c {     
    \key af \major     
    \time 2/2
    \tempo Allegro
    \tag SegmentAI { 
 		s1*8
 		\bar "||"
 	}
 	\tag SegmentAII {
 		s1*8
 		\bar "|."
 	}
}

Copy all the tags and spacers into the other files that need the structure.  You can remove all other content, so they just contain the tags and spacers.  The lyrics file does not even need spacers.

* ly/structures/chords.ily

chordsSong = \chordmode { 
    \set chordChanges = ##f 
    \set chordNameExceptions = #flamingChordExceptions
    \set noChordSymbol = ##f
    \tag SegmentAI {
    	s1*8
    }
    \tag SegmentAII {
    	s1*8
    }
}

* ly/structures/lyrics.ily

Lyrics don't generally need spacers, just tags.

lyricsSong = \lyricmode {
    \override LyricText.font-family = #'typewriter
    \override LyricText.font-size = #'2
    \tag SegmentAI {
    }
    \tag SegmentAII {
    }
}

* ly/music/INSTRUMENT.ily

INSTRUMENTSong = \relative c {     
    \tag SegmentAI { 
    	s1*8
    }
    \tag SegmentAII { 
    	s1*8
    }
}

## Using Segments in the Book Files

### Listing Segments in Template Book Files

When we set up a template with tagged structures, we specify the segments we want to compile in the three book files.

Within the score definitions in each of these files, include a \keepWithTag statement that lists each of the segments in your struture.  These templates also include one of two other tag pairs, either Part/Score or PDF/MIDI.

* ly/books/PART.ily

    \score {
        \keepWithTag #'(Part PDF
            INSTRUMENT
            SegmentAI
            SegmentAII 
        ) <<
            \include "ly/staves/parts/INSTRUMENT.ily"
        >>
        \include "ly/parts/layout.ily"
    }

* ly/books/SCORE.ily

Note that the list of instruments needs to be manually udpated, it is not taken care of yet by the clone script.

    \score {
        \keepWithTag #'(Score PDF
            Flute
            EnglishHorn
            BassClarinet
            Trumpet
            Horn
            Trombone
            Voice
            Clave
            ViolinI
            ViolinII
            Viola
            Cello
            Bass
            SegmentAI
            SegmentAII 
        ) <<
            \include "ly/staffgroups/concert/Woodwinds.ily"
            \include "ly/staffgroups/concert/Choir.ily"
            \include "ly/staffgroups/concert/Percussion.ily"
            \include "ly/staffgroups/concert/Strings.ily"
        >>
        ...
    }

* ly/books/SOUND.ily

Like the score file, the list of instruments must be updated manually.
The list of staff files also needs to be updated manually.  
Generally, more staves are in the template than in any particular song, and you can just delete or comment out those instruments.

    \score {
        \keepWithTag #'(Score MIDI
            Flute
            EnglishHorn
            BassClarinet
            Trumpet
            Horn
            Trombone
            Voice
            Clave
            ViolinI
            ViolinII
            Viola
            Cello
            Bass
            SegmentAI
            SegmentAII 
        ) <<
            \include "ly/staves/sound/piccolo.ily"
            \include "ly/staves/sound/flute.ily"
            \include "ly/staves/sound/oboe.ily"
            \include "ly/staves/sound/englishHorn.ily"
            \include "ly/staves/sound/clarinet.ily"
            \include "ly/staves/sound/bassClarinet.ily"
            \include "ly/staves/sound/voice.ily"
            \include "ly/staves/sound/clave.ily"
            \include "ly/staves/sound/violinI.ily"
            \include "ly/staves/sound/violinII.ily"
            \include "ly/staves/sound/viola.ily"
            \include "ly/staves/sound/cello.ily"
            \include "ly/staves/sound/bass.ily"
        >>
        \midi { }
    }
}

### Specifying segments to compile

Once we have cloned the template and are working on the song, when we want to compile just one segment, update the book file to comment out any section tags you don't want, then rebuild the part/score.

* ly/books/SCORE.ily

Note that the list of instruments needs to be manually udpated, it is not taken care of yet by the clone script.  In this example, the first segment SegmentAI is commented out, so only the content from SegmentAII will be included.

    \score {
        \keepWithTag #'(Score PDF
			...
            %SegmentAI
            SegmentAII 
        ) <<
        	...
        >>
        ...
    }
