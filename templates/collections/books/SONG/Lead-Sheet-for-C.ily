\paper {

    % First page spacing after header
    markup-system-spacing.padding = #5

    % Subsequent page spacing after header
    top-system-spacing.minimum-distance = #16

    % Spacing in between systems
    system-system-spacing.minimum-distance = #8

    % Distance between the last system of a score and the markup that follows
    % score-markup-spacing.basic-distance = #0
    % score-markup-spacing.padding = #0

    % Distance between the last system of a score and the first system of the score that follows it
    score-system-spacing.basic-distance = #0
    score-system-spacing.padding = #6

    page-breaking = #ly:minimal-breaking

    ragged-last = ##f
    ragged-bottom = ##f
    ragged-last-bottom = ##f

}

\book {
    \header {
        poet = "Concert Lead Sheet"
        % poet = \markup \concat { "B" \teeny " " \raise #0.6 \flat " Lead Sheet" }
        instrumentName = \poet
    }
    \score {
        \transpose c c <<
            \new ChordNames \transpose c c  { 
                \chordsSong 
                %\chordsSongForFlats
                \include "ly/properties/chord-names-properties.ily"
            }
            \new Staff \transpose c c { 
                \include "ly/properties/staff-properties.ily"
                \new Voice = "lead" <<
                    \structure
                    \melody
                    %\melodyForFlats
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
        \transpose c c <<
            \new ChordNames \transpose c c  { 
                \codaChords
                %\codaChordsForFlats
                \include "ly/properties/chord-names-properties.ily"
            }
            \new Staff \transpose c c { 
                \include "ly/properties/staff-properties.ily"
                \new Voice = "lead" <<
                    \structureCoda
                    \melodyCoda
                    %\melodyCodaForFlats
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


