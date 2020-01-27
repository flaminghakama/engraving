        \new ChordNames \transpose c c { \chordsPart }
        \new Staff = "trumpet" \with { \magnifyStaff #4/7 } {
            \set Staff.instrumentName = "Trumpet"
            \set Staff.shortInstrumentName = #"Tp."
            \include "ly/staves/scores/staff-defaults.ily"
            \clef treble
            \transpose c c { 
                \trumpetGlobal 
            }
        }