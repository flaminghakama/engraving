titleLeft = "SONG"
titleRight = "SONG"
titleFull = "SONG"

copyright = \markup { \tiny "copyright © 1991-2022 Elaine Paul" }

\include "ly/structures/includes.ily"

structure = \relative c' { 

    \override Score.RehearsalMark.self-alignment-X = #RIGHT
    \override Beam.damping = #2.75 
    \override Stem.length-fraction = #(magstep 1.2)

    \once \override Score.MetronomeMark #'extra-offset = #'( 0 . 0 )
    \tempo 4=76

    \numericTimeSignature
    \time 4/4
    \key e \minor

    \override Score.RehearsalMark #'extra-offset = #'( 1 . 1 )
    \startSection "A"
    \bar "[|:"
    s1*4 \break
    s1*4 
    
    \override Score.RehearsalMark #'extra-offset = #'( 0 . 1 )
    \startSection "B"
    \bar ":|]"
    s1*4 \break
    s1*4 \break

    \override Score.RehearsalMark #'extra-offset = #'( 1 . 1 )
    \startSection "A"
    s1*4 \break
    s1*3 <>_\markup { "AABA Solos" } s2... \toCoda s16 \bar "||"
}

structureCoda = \relative c'' { 
    \once \override Score.RehearsalMark #'extra-offset = #'( -10 . -2 ) 
    \once \override Score.RehearsalMark #'font-size = #8
    \mark \markup { \musicglyph #"scripts.coda" }
    \numericTimeSignature
    \time 4/4
    \key e \minor
    s1 \noBreak s1 \noBreak s1 \noBreak s1 \noBreak s1 \noBreak s1 \noBreak s1 \noBreak s1
    \bar "|."
}

headChords = \chordmode {
    \set chordChanges = ##t 
    \set chordNameExceptions = #flamingChordExceptions
    \set noChordSymbol = ##f

    e1:m | c2:7 b:7 | e1:m | c2:7 f:7 |
    bf1:m | b:dim7 | c2:7 b:7 | e1:m || 

    d1:m | g:7 | c1:7.7+.11+ | s |
    cs1:m7.5- | fs:7.9- | b | b:7.9- |

    e1:m | c2:7 b:7 | e1:m | c2:7 f:7 |
    bf1:m | b:dim7 | c2:7 b:7 | e1:m || 
}

codaChords = \chordmode {
    \set chordChanges = ##t 
    \set chordNameExceptions = #flamingChordExceptions
    \set noChordSymbol = ##f
    c1:13.11+ ~ | 1 | b:7.9- ~ | 1 | 
    e4:m r4 r2 | e4:m r4 r2 | R1 | e4:m r4 r2 ||
}


melodyA = \relative c'' {  
    r4 bf8-- a r8 g r e | r d  bf4-> r2 | 
    r4 bf'8-- a r8 g r e | r d  bf4-> r2 | 
    <g' df>4-> 8 8 r4 <g df>4-> | <af b,>8 8 r4 <af b,>4-> <af b,>8 <a c,>8 | 
    r4 bf8-- a r8 g r e  | R1 |
}

melodyB = \relative c' {  
    f8 8 r f r g a [ b ] | r a g [ f ] r a g [ fs ] ~ | 
    fs2. a8 g | r2 r8 fs f [ e ] ~ |
    e2. g8 e | r2 r8 g8 a [ <b g> ] | 
    r8 <b fs> r <a f> <b e,> a r <c ds,>~ | 2 r2 | 
}

melodyHead = { 
    \melodyA
    \melodyB
    \melodyA
}

melodyCoda = \relative c'' { 
    <a fs>1 ~ | 2 \tuplet 3/2 { <a fs>4 <bf g> <b gs> } | 
    <c a>1 ~ | 1 | 
    <e g,>4 r4 r2 | <g, e>4 r4 r2 |
    \clef bass
    bf,8-- a r8 g r e r d | e4-> r4 r2 ||
}


