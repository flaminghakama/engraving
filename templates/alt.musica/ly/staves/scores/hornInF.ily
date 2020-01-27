        \new ChordNames \transpose f c { \chordsPart }
        \new Staff = "horn" \with { \magnifyStaff #4/7 } {
            \set Staff.instrumentName = \markup {
                \center-column { 
                    "Horn"
                    \line { "in F" \smaller \flat }
                }
            }
            \set Staff.shortInstrumentName = #"Cor."
            \include "ly/staves/scores/staff-defaults.ily"
            \clef treble
            \transpose f, c { 
                \hornGlobal 
            }
        }