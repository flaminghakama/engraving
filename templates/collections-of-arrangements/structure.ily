titleLeft = "News from"
titleRight = "Milan"
titleFull = "News from Milan"

copyright = \markup { \tiny "engraving copyright © 1971-2022 Elaine Paul Alt" }

\include "ly/structures/includes.ily"

structure = \relative c' { 

    \override Score.RehearsalMark.self-alignment-X = #LEFT
    \override Score.RehearsalMark #'extra-offset = #'( 0 . 0 )

    \key b \minor

    \once \override Staff.TimeSignature #'stencil = ##f  

    \tempo "Alap"  
    \startSection "A"
    s1*8
    \startSection "A"
    s1*8
    \startSection "B"
    s1*8
    \startSection "A"
    s1*8
    \bar ":|]"
}

formChords = \chordmode {
    c1:7
}

chordsSong = \chordmode { 
    \set chordChanges = ##t 
    \set chordNameExceptions = #flamingChordExceptions
    \set noChordSymbol = ##f
    \formChords
}

head = \relative c'' { 
    c1
}

melody = \relative c' {
    \head
}


lyricsHeadOne = \lyricmode {
    \override LyricText.font-family = #'typewriter
    \override LyricText.font-size = #'2

    %\repeat unfold 10 { \skip 1 }

    Word
}

