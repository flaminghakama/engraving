        \new ChordNames \transpose bf c { \chordsPart }
        \new Staff = "tenorSaxophone" { 
            \include "ly/staves/parts/staff-defaults.ily"
            \override DynamicLineSpanner #'staff-padding = #3.0
            \clef treble
            \transpose bf,, c { 
                \autoPageBreaksOff
                \tenorSaxophoneGlobal 
            }
        }




