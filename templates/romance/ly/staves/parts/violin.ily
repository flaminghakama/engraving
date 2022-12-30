            \new Staff = "violin" \with {
                instrumentName = ""
                shortInstrumentName = ""
                \override VerticalAxisGroup.default-staff-staff-spacing.basic-distance = #0
            } { 
                \include "ly/staves/parts/staff-defaults.ily"
                \override DynamicLineSpanner #'staff-padding = #3.0
                \clef treble
                \transpose c c <<
                    \autoPageBreaksOff
                    \violinIGlobal 
                >>
            }

