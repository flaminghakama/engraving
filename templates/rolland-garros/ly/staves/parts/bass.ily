        \new ChordNames \transpose c c { \chordsBass }
        \new Staff = "bass" { 
            \include "ly/staves/parts/staff-defaults.ily"
            \override DynamicLineSpanner #'staff-padding = #3.0
            \clef bass
            \transpose c c <<
                \autoPageBreaksOff
                \bassGlobal 
            >>
        }




