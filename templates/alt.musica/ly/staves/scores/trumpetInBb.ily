        \new ChordNames \transpose bf c { \chordsPart }
        \new Staff = "trumpet" \with { \magnifyStaff #4/7 } {
            \set Staff.instrumentName = \markup {
                \center-column { 
                    "Trumpet"
                    \line { "in B" \smaller \flat }
                }
            }
            \set Staff.shortInstrumentName = #"Tp."
            \include "ly/staves/scores/staff-defaults.ily"
            \clef treble
            \transpose bf, c { 
                \trumpetGlobal 
            }
        }