\paper {

    % First page spacing after header
    markup-system-spacing.padding = #1

    % Subsequent page spacing after header
    top-system-spacing.minimum-distance = #18

    % Spacing in between systems
    system-system-spacing.minimum-distance = #0
    system-system-spacing.padding = #4

    % Distance between the last system of a score and the markup that follows
    score-markup-spacing.basic-distance = #0
    score-markup-spacing.padding = #0

    % Distance between the last system of a score and the first system of the score that follows it
    score-system-spacing.basic-distance = #0
    score-system-spacing.padding = #6
    score-system-spacing.minimum-distance = #13

    page-breaking = #ly:minimal-breaking

    ragged-last = ##f
    ragged-bottom = ##t
    ragged-last-bottom = ##t

    #(define fonts
      (make-pango-font-tree "Tabitha" 
                            "Highlander ITC TT" 
                            "LilyJAZZText"
                             (/ myStaffSize 20)))
}

\header {
    subtitle = ""
    poet = "    Concert Lead Sheet"
    instrumentName = \poet
}

\layout {
    \context {
        \Score
        \override StaffGrouper.staff-staff-spacing.padding = #4
        \override StaffGrouper.staff-staff-spacing.basic-distance = #0
    }
    \context {
        \Staff
        \RemoveAllEmptyStaves
    }
}

\layout {
    \context {
        \Staff
            \override VerticalAxisGroup.default-staff-staff-spacing = #'(
                (basic-distance . 0)
                (minimum-distance . 0)
                (padding . 0)
            )
    }
    \context {
        \RhythmicStaff
            \override VerticalAxisGroup.default-staff-staff-spacing = #'(
                (basic-distance . 0)
                (minimum-distance . 0)
                (padding . 0 )
            )
            \RemoveAllEmptyStaves
    }
    \context {
        \ChordNames
            \override VerticalAxisGroup.default-staff-staff-spacing = #'(
                (basic-distance . 0)
                (minimum-distance . 0)
                (padding . 0 )
            )
    }
}


\book {
    \score {
        \new StaffGroup <<
            \new ChordNames \transpose c c  {
                \include "ly/properties/chord-names-properties.ily"
                \headChords
            }
            \new RhythmicStaff \with {
                    \remove "Staff_symbol_engraver"
                    \remove "Time_signature_engraver" 
                    \magnifyStaff #5/7
                } {
			    \override Stem.length-fraction = #(magstep 0.1) 
                \chordRhythmHead
            }
            \new Staff \transpose c c { 
                \include "ly/properties/staff-properties.ily"
                <<
                    \structure
                    \melodyHead
                >>
            }
        >>
    }

    \score { 
        \header { 
            title = ""
            poet = ""
            composer = ""
        }
        <<
            \new ChordNames \transpose c c { 
                \include "ly/properties/chord-names-properties.ily"
                \codaChords 
            }
            \new RhythmicStaff \with {
                    \remove "Staff_symbol_engraver"
                    \remove "Time_signature_engraver" 
                    \magnifyStaff #5/7
                } {
                %\override Score.BarLine.break-visibility = ##(#f #f #f)
                \chordRhythmCoda
            }
            \new Staff \transpose c c { 
                \include "ly/properties/staff-properties.ily"
                <<
                    \structureCoda
                    \melodyCoda
                >>
            }
        >>
        \layout {
            indent = 1.5\cm
            ragged-right = ##f
            ragged-last = ##f
        }    
    }

}
