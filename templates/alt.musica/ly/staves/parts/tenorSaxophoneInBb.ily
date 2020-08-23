        \new ChordNames \transpose bf c { \chordsPart }
        \new Staff = "tenorSaxophone" { 
            \include "ly/staves/parts/staff-defaults.ily"
            \clef treble
            \transpose bf,, c { \tenorSaxophoneGlobal }
        }