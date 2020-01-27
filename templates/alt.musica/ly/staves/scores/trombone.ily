        \new ChordNames \transpose f c { \chordsPart }
        \new Staff = "trombone" \with { \magnifyStaff #4/7 } {
            \set Staff.instrumentName = "Trombone"
            \set Staff.shortInstrumentName = #"Tbn."
            \include "ly/staves/scores/staff-defaults.ily"
            \clef bass
            \transpose c c { 
                \tromboneGlobal 
            }
        }