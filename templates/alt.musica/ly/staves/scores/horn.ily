        \new ChordNames \transpose c c { \chordsPart }
        \new Staff = "horn" \with { \magnifyStaff #4/7 } {
            \set Staff.instrumentName = "Horn"
            \set Staff.shortInstrumentName = #"Cor."
            \include "ly/staves/scores/staff-defaults.ily"
            \clef treble
            \transpose c c { 
                \hornGlobal 
            }
        }