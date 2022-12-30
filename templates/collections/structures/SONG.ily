titleLeft = "SONG"
titleRight = ""
titleFull = "SONG"
composerName = ""
arranger = ""

copyright = \markup { \tiny "copyright © 2022 Elaine Paul" }

\include "ly/structures/includes.ily"


structure = \relative c' { 

    \override Score.RehearsalMark.self-alignment-X = #RIGHT
    %\once \override Score.RehearsalMark #'extra-offset = #'( 1 . -1 )

    \time 4/4
    \key ef \major
    \override Score.RehearsalMark #'extra-offset = #'( 0 . 1 ) 
    \startSectionNoBarline "A"
    \bar "[|:"
    s1*4 \break
    s1*4 \break
    \bar "||"
    s1*4 \break
    s1*4 \break

    \startSection "A"
    s1*4 \break
    s1*4 \break
    \bar "||"
    s1*4 \break
    s1*4 \break

    \pageBreak

    \startSection "B"
    s1*4 \break
    s1*4 \break
    s1*4 \break
    s1*3  s2... \toCoda s16 \break
    s1*4
    \bar ":|]"
}

structureCoda = \relative c' {
    \once \override Score.RehearsalMark #'extra-offset = #'( -12 . -3 ) 
    \once \override Score.RehearsalMark #'font-size = #8
    \mark \markup { \musicglyph #"scripts.coda" }
    \numericTimeSignature
    \time 4/4
    \clef treble
    \key ef \major
    s1*4 \break
    s1*4
    \bar "|."
}

formChords = \chordmode {
    ef1 | af | df:7 | b:7 | 
    e1:m | a:7 | bf:7 | bf:7 |
    ef1 | af | df:7 | b:7 |
    e1:m | a:7 | f:m | bf:7 | 

    ef1 | af | df:7 | b:7 | 
    e1:m | a:7 | bf:7 | bf:7 |
    ef1 | af | df:7 | b:7 |
    e1:m | a:7 | d | d:7 | 

    a1:m | d:7 | g | g |
    g1:m7.5- | c:7 | f | f |
    cs1:m | fs:7 | b | b |
    d1:m | g:7 | c:m | f:7 |
    c1:m | f:7 | bf | bf | 
}

formChordsForFlats = \chordmode {
    \formChords
}

chordsSong = \chordmode { 
    \set chordChanges = ##t 
    \set chordNameExceptions = #flamingChordExceptions
    \set noChordSymbol = ##f
    \formChords
}
chordsSongForFlats = \chordmode { 
    \set chordChanges = ##t 
    \set chordNameExceptions = #flamingChordExceptions
    \set noChordSymbol = ##f
    \formChordsForFlats
}

codaChords = \chordmode {
    \set chordChanges = ##t 
    \set chordNameExceptions = #flamingChordExceptions
    \set noChordSymbol = ##f
    c1:m | f:7 | cs:m | fs:7 
    c1:m | f:7 | bf | bf |
}
codaChordsForFlats = \chordmode {
    \set chordChanges = ##t 
    \set chordNameExceptions = #flamingChordExceptions
    \set noChordSymbol = ##f
    \codaChords
}

melody = \relative c'' {  
	c4 e g c | g8 f e d  c4 d | 
	c4 e g c | g1 |	

	e4 g c e | 

        d8 c b a  g4 a | e1 ~ | 1 ||
        \relative c'' { d8 c b a gs4 b | c1 ~ | 1 || }

	\relative c'' { 

		e4 4 4 d8 c | b c d2 c8 b | 
		a8 b c2 b4 | b1 | 

		c4 4 4 b8 a | g a b2 g8 a | 
		b8 c d2 d,4 | f1 || 
	}
}

melodyForFlats = \relative c'' {  
    \melody
}

melodyCoda = \relative c' {
    \times 2/3 { f4 ef f } ef2 ~ | 
    ef2. r4 | 
    \times 2/3 { fs4 e fs } e2 ~ | 
    e2. r4 |
    \times 2/3 { f4 ef f } ef2 ~ | 
    ef2 d4 a8 bf ~ | 
    bf1 | 
    R1 ||
}
melodyCodaForFlats = \relative c' {
    \melodyCoda
}

lyricsHeadOne = \lyricmode {
    \override LyricText.font-family = #'typewriter
    \override LyricText.font-size = #'2

    What bet -- ter way to fin -- ish an eve -- ning 
    than lean -- ing a -- gainst a chil -- ly blue Sat -- urn?

    Ig -- nor -- ing bus af -- ter roost -- ing bus
    a -- llow -- ing your -- self to feel and be felt wan -- ted.


    While the brown bagged te -- qui -- la has worn off
    your pock -- ets are still damp from the lime.

    So is her skirt from the on -- set 
    of what will be -- come the cool mor -- ning dew.


    Re -- a -- fir -- ming our most com -- plex  ten -- sions, 
    no ques -- tions are an -- swered by our em -- brace.

    Still, we are more com -- plete.
    We on -- ly want to know
    how to pro -- ceed with our -- selves.
}

lyricsCoda = \lyricmode {
    \override LyricText.font-family = #'typewriter
    \override LyricText.font-size = #'2

    how to pro -- ceed, 
    will we suc -- ceed?
    How to pro -- ceed with our -- selves.
}
