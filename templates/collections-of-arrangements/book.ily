\paper {

    % First page spacing after header
    markup-system-spacing.padding = #4

    % Subsequent page spacing after header
    top-system-spacing.minimum-distance = #14

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
        poet = "    Concert Pitch"
        instrumentName = \poet
    }
    \score {
        \transpose c c <<
            \new ChordNames { 
                \chordsSong 
                \include "ly/properties/chord-names-properties.ily"
            }
            \new Staff { 
                \include "ly/properties/staff-properties.ily"
                \new Voice = "lead" <<
                    \structure
                    \melody
                >>
            }
            \new Lyrics \with { alignAboveContext = "staff" } {
                \lyricsto "lead" { \lyricsHeadOne } 
            }
        >>
    }
}

% \book {
%     \bookOutputSuffix "sound"
%     \score {
%         <<
%             \new ChordNames \transpose c c  { 
%                 s2. \chordsSong     
%                 \formChords 
%                 \formChords
%             }
%             \new Staff \transpose c c { s2. \topline }
%             \new Staff \transpose c c { s2. \midline }
%             \new Staff \transpose c c { s2. \bassline }
%         >>
%         \midi { }
%     }
% }



