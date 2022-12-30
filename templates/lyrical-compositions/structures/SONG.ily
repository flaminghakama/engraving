titleLeft = "SONG"
titleRight = "SONG"
titleFull = "SONG"

copyright = \markup { \tiny "copyright © 2010-2022 Elaine Paul" }

\include "ly/structures/includes.ily"

structure = \relative c' { 

    \override Score.RehearsalMark.self-alignment-X = #RIGHT

    \once \override Score.MetronomeMark #'extra-offset = #'( 0 . 0 )
    \tempo "Blues" 4=220

    \numericTimeSignature
    \time 4/4
    \key af \major
    \partial 8*3 s4.

    \override Score.RehearsalMark #'extra-offset = #'( 0 . 5.6 )
    \startSection "A"
    \bar "[|:"
    s1*4 \break
    s1*4 \bar "||" \break

    \override Score.RehearsalMark #'extra-offset = #'( 0 . 6.6 )
    \startSection "A"
    s1*4 \break
    s1*4 \bar "||" \break

    \override Score.RehearsalMark #'extra-offset = #'( 0 . 0 )
    \startSection "B"
    s1*4 \break
    s1*4 \bar "||" \break

    \override Score.RehearsalMark #'extra-offset = #'( 0 . 5.4 )
    \startSection "A"
    s1*4 \break
    s1 s2... \toCoda s16 s1*4 \bar ":|]"
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

chordsSong = \chordmode { 
    \set chordChanges = ##t 
    \set chordNameExceptions = #flamingChordExceptions
    \set noChordSymbol = ##f
    \formChords
}


codaChords = \chordmode {
    \set chordChanges = ##t 
    \set chordNameExceptions = #flamingChordExceptions
    \set noChordSymbol = ##f
    c1:m | f:7 | cs:m | fs:7 
    c1:m | f:7 | bf | bf |
}


melodyHead = \relative c'' {  
    gs2 ~ \times 2/3 { gs4 as gs } |
    ds4 e8 as ~ as4 r4 |
    R1 |
    r2 r4 r8. as16 |
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

lyricsHeadOne = \lyricmode {
    \override LyricText.font-family = #'typewriter
    \override LyricText.font-size = #'2

    lyrics 
}

lyricsCoda = \lyricmode {
    \override LyricText.font-family = #'typewriter
    \override LyricText.font-size = #'2

    how to pro -- ceed, 
    will we suc -- ceed?
    How to pro -- ceed with our -- selves.
}

chordRhythmHead = \relative c''' { 

    \override NoteHead #'style = #'slash 
    \override NoteHead.no-ledgers = ##t
    \set fontSize = -5
    \magnifyMusic 1 {
        %\override Stem.length-fraction = #(magstep 0.2) 
        s1*4
        s1*4 

        bf4. 8 ~ 2 | 4 2. |
        bf4. 8 ~ 2 | 4 2. |
        bf4. 8 ~ 2 | 4 2. |
        bf4. 8 ~ 2 | 4 2 s4 || 4 2 s4 ||

        s1*8 ||

        bf4. 8 ~ 2 | 4 2. |
        bf4. 8 ~ 2 | 4 2. |
        bf4. 8 ~ 2 | 4 2. |
        bf4. 8 ~ 2 | 4 2 s4 ||
    }
}

chordRhythmCoda = \relative c''' { 

    \override NoteHead #'style = #'slash 
    \override NoteHead.no-ledgers = ##t
    \set fontSize = -5
    bf1
}

