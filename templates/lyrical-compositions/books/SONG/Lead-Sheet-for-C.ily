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

\book {
    \header {
        poet = "    Concert Pitch"
        instrumentName = \poet
    }
    \score {
        <<
            \new ChordNames \transpose c c  { 
                \chordsSong 
                \include "ly/properties/chord-names-properties.ily"
            }
            \new Staff \transpose c c { 
                \include "ly/properties/staff-properties.ily"
                \new Voice = "lead" <<
                    \structure
                    <<
                        {
                            \chordRhythmHead
                        } \\
                        \melodyHead 
                    >>
                >>
            }
            \new Lyrics \with { alignAboveContext = "staff" } {
                \lyricsto "lead" { \lyricsHeadOne } 
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
            \new ChordNames \transpose c c  { 
                \codaChords
                \include "ly/properties/chord-names-properties.ily"
            }
            \new Staff \transpose c c { 
                \include "ly/properties/staff-properties.ily"
                \new Voice = "lead" <<
                    \structureCoda
                    <<
                        {
                            \chordRhythmCoda
                        } \\
                        \melodyCoda
                    >>
                >>
            }
            \new Lyrics \with { alignAboveContext = "staff" } {
                \lyricsto "lead" { \lyricsCoda } 
            }
        >>
        \layout {
            indent = 4\cm
            ragged-right = ##f
            ragged-last = ##f
            short-indent = .25\cm
        }    
    }
}
