        \new ChordNames \transpose c c { \chordsPart }
        \new Staff = "flute" { 
            \include "ly/staves/parts/staff-defaults.ily"
            \override DynamicLineSpanner #'staff-padding = #3.0
            \clef treble
            \transpose c c { 
                \autoPageBreaksOff
                \fluteGlobal 
            }
        }




