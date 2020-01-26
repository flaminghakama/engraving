        \new ChordNames \transpose a bs { \chordsClarinet }
        %{
        \new RhythmicStaff \with {
            \override VerticalAxisGroup.staff-staff-spacing.basic-distance = #2
        } {
            \beatPatternPart
        }
        %}
        \new Staff = "clarinet" { 
            \include "ly/staves/parts/staff-defaults.ily"
            \override DynamicLineSpanner #'staff-padding = #4.2
            \clef treble
            \transpose a, bs << 
                \autoPageBreaksOff
                \beatPatternPart
                \clarinetGlobal 
            >>
        }