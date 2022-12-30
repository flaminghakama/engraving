\paper {

    % First page spacing after header
    markup-system-spacing.padding = #5

    % Subsequent page spacing after header
    top-system-spacing.minimum-distance = #18

    % Spacing in between systems
    system-system-spacing.minimum-distance = #18

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
      (make-pango-font-tree "DIN Condensed" 
                            "Highlander ITC TT" 
                            "LilyJAZZText"
                             (/ myStaffSize 20)))
}

\header {
    subtitle = ""
    poet = "    Concert Lead Sheet"
    instrumentName = \poet
}

\book {
    \score {
        \new StaffGroup <<
            \new ChordNames \transpose c c  {
                \include "ly/properties/chord-names-properties.ily"
                \headChords
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
            \new Staff \transpose c c { 
                \include "ly/properties/staff-properties.ily"
                <<
                    \structureCoda
                    \melodyCoda
                >>
            }
        >>
        \layout {
            indent = 2\cm
            ragged-right = ##t
            ragged-last = ##t
            short-indent = .25\cm
        }    
    }
}
