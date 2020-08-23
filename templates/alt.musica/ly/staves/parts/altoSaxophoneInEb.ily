        \new ChordNames \transpose ef c { \chordsPart }
        \new Staff = "altoSaxophone" { 
            \include "ly/staves/parts/staff-defaults.ily"
            \clef treble
            \transpose ef, c { \altoSaxophoneGlobal }
        }