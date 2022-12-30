        \new ChordNames \transpose f c { \chordsPart }
        \new Staff = "horn" { 
            \include "ly/staves/parts/staff-defaults.ily"
            \override DynamicLineSpanner #'staff-padding = #3.0
            \transpose f, c <<
                \autoPageBreaksOff
                \hornGlobal 
            >>
        }