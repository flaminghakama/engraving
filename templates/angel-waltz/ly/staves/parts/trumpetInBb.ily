        \new ChordNames \transpose bf c { \chordsPart }
        \new Staff = "trumpet" { 
            \include "ly/staves/parts/staff-defaults.ily"
            \override DynamicLineSpanner #'staff-padding = #3.0
            \transpose bf, c <<
                \autoPageBreaksOff
                \trumpetGlobal 
            >>
        }