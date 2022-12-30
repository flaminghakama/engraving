        \new ChordNames \transpose c c { \chordsPart }
        \new Staff = "trombone" { 
            \include "ly/staves/parts/staff-defaults.ily"
            \override DynamicLineSpanner #'staff-padding = #3.0
            \transpose bf, c <<
            	\clef bass
                \autoPageBreaksOff
                \tromboneGlobal 
            >>
        }