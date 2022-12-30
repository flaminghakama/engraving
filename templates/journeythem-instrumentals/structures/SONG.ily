titleLeft = "SONG"
titleRight = "SONG"
titleFull = "SONG"

copyright = \markup { \tiny "copyright © 2010-2022 Elaine Paul" }

\include "ly/structures/includes.ily"

structure = \relative c' { 

    \override Score.RehearsalMark.self-alignment-X = #RIGHT
    \override Beam.damping = #2.75 
    \override Stem.length-fraction = #(magstep 0.9)

    \once \override Score.MetronomeMark #'extra-offset = #'( -4 . -2 )
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

structureCoda = \relative c'' { 
    \once \override Score.RehearsalMark #'extra-offset = #'( -12 . -3 ) 
    \once \override Score.RehearsalMark #'font-size = #8
    \mark \markup { \musicglyph #"scripts.coda" }
    \numericTimeSignature
    \time 4/4
    \key af \major
    s1*2
    \repeat volta 5 { 
    \bar "[|:"
        s1
    } 
    \alternative {
        { s1 \bar ":|]" } 
        { s1 \noBreak }
    } 
    s1 \noBreak s1 \bar "|."
}

headChords = \chordmode {
    \set chordChanges = ##t 
    \set chordNameExceptions = #flamingChordExceptions
    \set noChordSymbol = ##f
    r8 r4 | 

    af1:7 | df | a:5+ | d:m7.7+ |
    bf1 | ef:7.11+ | bf:m | ef:7 |

    af1:7 | df | a:5+ | d:m7.7+ |
    g1:m | af:7.4^3 | e:7 | a |

    b1:m | c:7.5+.11+ | f:13 | bf:7.7+.11+ |
    g1:m | af:7 | e:7 | ef:7.9- |

    af1:7 | df | a:5+ | d:m7.7+ |
    bf1 | g:m | df | df | b | b |
}

codaChords = \chordmode {
    \set chordChanges = ##t 
    \set chordNameExceptions = #flamingChordExceptions
    \set noChordSymbol = ##f
    df1 | s | 
    b1 | s | s |
    \once \set chordChanges = ##f b | 
    \once \set chordChanges = ##f b:7.7+.11+ | 
}


melodyFirstAs = \relative c'' {  
    ef8-> ef-> [ ef-> ] ||

    % A
    r8 f, gf [ f-- ] ~ f2 ~ |
    f2 r8 df'-> df-> [ df-> ] |
    r8 f, gf [ f-- ] ~ f2 ~ |
    f2 r8 c' b [ a-- ] ~ |

    a4. f8 ~ f4 d |
    a'4.-- f8 ~ f4 df |
    c16 ( df ) c2.. ~  |
    c2 r8 ef'-> ef-> [ ef-> ] || 

    % A
    r8 f, gf [ f-- ] ~ f2 ~ |
    f2 r8 df'-> df-> [ df-> ] |
    r8 f, gf [ f-- ] ~ f2 ~ |
    f2 r8 c'4-. b8  |

    a4.-- f8 ~ f4 d |
    df4. af'8 ~ af2 ~ |
    af1 ~ |
    af2. r4 || 
}

melodyB = \relative c'' {  
    r8 cs,4.-- d8 fs4-. bf8-- ~ |
    bf [ e, af fs ] ~ fs2 |
    r4 a8 d, g f?4. |
    a8 [ c, g' e-- ] ~ e2 ~ |

    e2 r8 f f [ f-. ] |
    r af\< af [ af-. ] r b b [ b-. ] | 
    r8 \xf d\f ds [ e-- ] ~ e2 ~ |
    e2 r8 ef-> ef-> [ ef-> ] ||
}

melodyLastA = \relative c'' {  
    r8 f, gf [ f-- ] ~ f2 ~ |
    f2 r8 df'-> df-> [ df-> ] |
    r8 f, gf [ f-- ] ~ f2 ~ |
    f2 r8 c' b [ a-- ] ~ | 

    a4.\> f8 ~ f4 d \xmp| 
    bf'4.-- f8 ~ f4 d | 
    c'4.--\< af8 ~ af4 f8 ef'-> ~ |
    ef2. \xf bf8 ef-> ~ | 

    ef1 ~ |
    ef2 r2 ||
}

melodyHead = { 
    \melodyFirstAs
    \melodyB
    \melodyLastA
}

melodyCoda = \relative c'' { 
    c4.--\< af8 ~ af4 f8 ef'-> ~ |
    ef2. bf8\f ef-> ~ | 

    ef1  ~ |
    ef2. bf8 ef-> \laissezVibrer 
    ef2\repeatTie r4 bf8\ff ef-> ~ 
    ef1\< ~ | ef1\! \fermata
}


rhythmLick = \relative c {  
    r8 c r4 c4. c8 ~ | 2 r | 
}

rhythmCount = \relative c {  
    \comp #4 |
}

chordRhythmHead = \new Voice \with {
        \consists "Pitch_squash_engraver"
    } \relative c' {
    
    \improvisationOn

    \override NoteHead #'style = #'slash 
    \override Stem.length-fraction = #(magstep 0.2) 
    s4. ||

    \rhythmLick \rhythmLick
    s1*4

    \rhythmLick \rhythmLick
    s1*4
    
    s1*8

    \rhythmLick \rhythmLick
    s1*2
    r4 c2 c4 ~ | c4 c2 c4 |
    r8 c4 r8 c4 r8 c ~ | c1 |
}

chordRhythmCoda = \new Voice \with {
        \consists "Pitch_squash_engraver"
    } \relative c' {
    
    \improvisationOn

    \override NoteHead #'style = #'slash 

    r4 c2 c4 ~ | c4 c2 c4 |
    r8 c r4 c4. c8 ~ | 2. r4 || 2. \repeatTie c4 |
    r8 c r4 c4. c8 ~ | 1 ||
}

harmonyFirstAs = \relative c'' {  
    c8-> c-> [ c-> ] ||

    % A
    r8 f, gf [ f-- ] ~ f [ ef df c-- ] ~ |
    c2 r8 f-> f-> [ f-> ] |
    r8 f gf [ f-- ] ~ f [ d cs a-- ] ~ |
    a2 r4 r8 c-- ~ |

    c4. a8 ~ a4 f |
    df'4.-- a8 ~ a2 |
    g1 ~  |
    g2 r8\! c'-> c-> [ c-> ] ||

    % A
    r8 f, gf [ f-- ] ~ f [ ef df c-- ] ~ |
    c2 r8 f-> f-> [ f-> ] |
    r8 f gf [ f-- ] ~ f [ d cs a-- ] ~ |
    a2. r4 |

    bf4. g8 ~ g2 |
    af4. df8 ( ~ df2 ~ |
    df2.. d16 ef |
    e2. ) r4 ||
}

harmonyB = \relative c' {  
    r8 cs4.-- d8 fs4-. bf8-- ~ |
    bf [ e, af fs ] ~ fs2 |
    r4 a8 d, g f?4. |
    a8 [ c, g' e-- ] ~ e2 ~ |

    e2*3/4 s8 r8 f f [ f-. ] |
    r c\< c [ c-. ]  r ef ef [ ef-. ] | 
    r8\xf gs,\f fs [ e-- ] ~ e2 ~ |
    e2 r8 c''-> c-> [ c-> ] ||
}

harmonyLastA = \relative c'' {  
    r8 f, gf [ f-- ] ~ f [ ef df c-- ] ~ |
    c2 r8 f-> f-> [ f-> ] |
    r8 f gf [ f-- ] ~ f [ d cs a-- ] ~ |
    a2 r4 r8 c-- ~ |

    c4. a8 ~ a4 f | 
    d'2. bf4 |
    ef4.\< c8 ~ c4 df8 ( c-> ~ |
    c2. ) df'8\xf (c-> ~ | 

    c1 ~ |
    c2\> ) r2\! ||
}

harmonyHead = { 
    \harmonyFirstAs
    \harmonyB
    \harmonyLastA
}

harmonyCoda = \relative c' { 
    ef4.\< c8 ~ c4 df8 ( c-> ~ |
    c2. ) df'8\f (c-> ~ | 

    c1 ~ |
    c2. df8 c---> \laissezVibrer 
    c2\repeatTie r4 gf'8\ff ( f---> ~
    f1\< ~ | f1\! ) \fermata 
}
