\version "2.19.81" 
\include "english.ly"

flamingChordNames = {

    % Major
    <c e g b>1-\markup { \raise #0.7 { \magnify #0.5 { " " \triangle ##f } \normalsize 7 } }
    <c e g b d'>1-\markup { \raise #0.7 { \magnify #0.5 { " " \triangle ##f } \normalsize 9 } }
    <c e g b a'>1-\markup { \raise #0.7 { \magnify #0.5 { " " \triangle ##f } \teeny " " \normalsize 13 } }
    <c e g b d' a'>1-\markup { \raise #0.7 { \magnify #0.5 { " " \triangle ##f } \normalsize 13 } }
    <c e g a d'>1-\markup { \raise #3 { \tiny \center-column { \lower #1.25 { " 6" } " 9" } } }
    <c e g b d-sharp' f-sharp' a-flat'>1-\markup { 
        \raise #0.7 { \magnify #0.5 { " " \triangle ##f } \normalsize 9 }
        \raise #3.8 { \tiny \center-column { \lower #1.25 { " #9" } "#11" \raise #1.25 { "b13" } } } 
    }

    % Minor
    <c e-flat g>1-\markup { \raise #0.6 { \magnify #0.2 { "  " } \tiny { \char ##x2013 } } }
    <c e-flat g a>1-\markup { \raise #0.6 { \magnify #0.2 { "  " } \tiny { \char ##x2013 } \magnify #0.2 { "  " }} \raise #0.7 \normalsize 6 }
    <c e-flat g b-flat>1-\markup { \raise #0.6 { \magnify #0.2 { "  " } \tiny { \char ##x2013 } \magnify #0.1 { "  " }} \raise #0.7 \normalsize 7 }

    <c e-flat g b>1-\markup { \raise #0.6 { \magnify #0.2 { "  " } \tiny { \char ##x2013 } \magnify #0.1 { "  " }} \raise #0.7 {  \magnify #0.5 { " " \triangle ##f } \small 7 } }
    <c e-flat g b d'>1-\markup { 
        \raise #0.6 { \magnify #0.2 { "  " } \tiny { \char ##x2013 } \magnify #0.5 { "  " } } 
        \raise #3.6 { 
            \tiny \center-column { 
                \lower #1.25 { " 9" } 
                \concat { \magnify #0.5 { \triangle ##f } \tiny 7 } 
            } 
        } 
    }
    <c e-flat g b d' a'>1-\markup { \raise #0.6 { \magnify #0.2 { "  " } \tiny { \char ##x2013 } \magnify #0.1 { "  " }} \raise #0.7 {  \magnify #0.5 { " " \triangle ##f } \small 7 } }

    <c e-flat g b-flat d'>1-\markup { \raise #0.6 { \magnify #0.2 { "  " } \tiny { \char ##x2013 } \magnify #0.1 { "  " }} \raise #0.7 \normalsize 9 }
    <c e-flat g b-flat d' f>1-\markup { \raise #0.6 { \magnify #0.2 { "  " } \tiny { \char ##x2013 } \magnify #0.1 { "  " }} \raise #0.7 \normalsize 11 }
    <c e-flat g b-flat d' a'>1-\markup { \raise #0.6 { \magnify #0.2 { "  " } \tiny { \char ##x2013 } \magnify #0.1 { "  " }} \raise #0.7 \normalsize 13 }
    <c e-flat g b-flat d' a'>1-\markup { \raise #0.6 { \magnify #0.2 { "  " } \tiny { \char ##x2013 } \magnify #0.1 { "  " }} \raise #0.7 \normalsize 13 }

    % minor7 b13 as "-7 b13"
    % <c e-flat g b-flat a-flat'>1-\markup { \raise #0.6 { \magnify #0.2 { "  " } \tiny { \char ##x2013 } \magnify #0.1 { "  " }} \raise #0.7 { \normalsize 7 } \raise #0.9 { \small b13 } }

    % minor7 b13 as "- b13"
    <c e-flat g a-flat'>1-\markup { \raise #0.6 { \magnify #0.2 { "  " } \tiny { \char ##x2013 } \magnify #0.1 { "  " }} \teeny " " \raise #1.2 { \tiny \flat } \teeny " " \raise #0.9 { \tiny "13" } }
    <c e-flat g b-flat a-flat'>1-\markup { \raise #0.6 { \magnify #0.2 { "  " } \tiny { \char ##x2013 } \magnify #0.1 { "  " }} \raise #0.9 { \small "  b13" } }
    <c e-flat g b-flat d' a-flat'>1-\markup { \raise #0.6 { \magnify #0.2 { "  " } \tiny { \char ##x2013 } \magnify #0.1 { "  " }} \raise #0.7 \normalsize "9 b13" }
     
    <c e-flat g b a-flat'>1-\markup { \raise #0.6 { \magnify #0.2 { "  " } \tiny { \char ##x2013 } \magnify #0.1 { "  " }} \raise #0.7 {  \magnify #0.5 { " " \triangle ##f } \small 7 \teeny " " \raise #0.5 { \tiny \flat }  \magnify #0.1 { "  " } \raise #0.3 { \tiny "13" } } }

    % Dominant
    <c e g a>1-\markup { \raise #0.7 { \normalsize 6 } }
    <c e g b-flat>1-\markup { \raise #0.7 { \normalsize 7 } }
    <c e g b-flat d'>1-\markup { \raise #0.7 { \normalsize 9 } }
    <c e g b-flat d-flat'>1-\markup { \raise #0.7 { \normalsize 7 } \raise #1.2 { \teeny " " \tiny \flat \tiny "9" } }
    <c e g b-flat d-sharp'>1-\markup { \raise #0.7 { \normalsize 7 } \raise #0.9 { \small " #9" } }
    <c e g b-flat c-sharp' d-sharp'>1-\markup { \raise #0.7 { \normalsize 7 } \raise #3.9 { \tiny \center-column { \lower #1.25 { " b9" } " #9" } } }
    <c e g b-flat d-sharp' f-sharp'>1-\markup { \raise #0.7 { \normalsize 7 } \raise #3.9 { \tiny \center-column { \lower #1.25 { " #9" } " #11" } } }
    <c e g b-flat d' a'>1-\markup { \raise #0.7 { \normalsize 13 } }
    <c e g b-flat d-flat' a'>1-\markup { \raise #0.7 { \normalsize 13 } \raise #0.9 { \small " b9" } }
    <c e g b-flat a-flat'>1-\markup { \raise #0.7 { \normalsize 7 } \raise #0.9 { \small " b13" } }
    <c e g b-flat d' a-flat'>1-\markup { \raise #0.7 { \normalsize 9 } \raise #0.9 { \small " b13" } }
    <c e g b-flat d' f' a-flat'>1-\markup { \raise #0.7 { \normalsize 11 } \raise #0.9 { \small " b13" } }
    <c e g b-flat cs' d' a'>1-\markup { \raise #0.7 { \normalsize 13 } \raise #3.9 { \tiny \center-column { \lower #1.25 { " 9" } " b9" } } }
    <c e g b-flat c-sharp' d-sharp'>1-\markup { \raise #0.7 { \normalsize 7 } \raise #3.9 { \tiny \center-column { \lower #1.25 { " b9" } " #9" } } }

    % Dominant b5
    <c e g-flat b-flat>1-\markup { \raise #0.7 { \normalsize 7 } \raise #1.0 { \small " b5" } }
    <c e g-flat b-flat d-flat'>1-\markup { \raise #0.7 { \normalsize 7 } \raise #3.9 { \tiny \center-column { \lower #1.25 { "b5" } " b9" } } }

    % Half-diminished
    <c e-flat g-flat b-flat>1-\markup { \raise #0.5 { \magnify #0.85 \char ##x2205 } }
    <c e-flat g-flat b-flat c-sharp'>1-\markup { \raise #0.5 { \magnify #0.85 \char ##x2205 } }
    <c e-flat g-flat b-flat f'>1-\markup { \raise #0.5 { \magnify #0.85 \char ##x2205 } \raise #0.5 { \normalsize 11 } }
    <c e-flat g-flat b-flat a'>1-\markup { \raise #0.5 { \magnify #0.85 \char ##x2205 } \raise #0.5 { \normalsize 13 } }

    % Diminished
    %<c e-flat g-flat b-flatflat f'>1-\markup { \raise #1.5 { \magnify #2 \circle "" } \raise #0.5 { \normalsize 11 } }

    % Augmented
    <c e g-sharp>1-\markup { \raise #0.4 { \magnify #1.3 { + } } }
    <c e g-sharp b-flat>1-\markup { \raise #0.4 { \magnify #1.3 { + } } \raise #0.5 { \normalsize 7 } }
    <c e g-sharp b-flat d'>1-\markup { \raise #0.4 { \magnify #1.3 { + } } \raise #0.5 { \normalsize 9 } }
    <c e g-sharp b-flat c-sharp' d-sharp'>1-\markup { \raise #0.4 { \magnify #1.3 { + } } \raise #0.5 { \normalsize 7 } \raise #3.9 { \tiny \center-column { \lower #1.25 { " b9" } " #9" } } }
    <c e g-sharp b-flat d-sharp'>1-\markup { \raise #0.4 { \magnify #1.3 { + } } \raise #0.5 { \magnify #1.2 { \normalsize 7 } } \raise #1.0 \tiny " #9" }
    <c e g-sharp b-flat f-sharp'>1-\markup { \raise #0.4 { \magnify #1.3 { + } } \raise #0.5 { \magnify #1.2 { \normalsize 7 } } \raise #1.0 \tiny " #11" }
    <c e g-sharp d-flat'>1-\markup { \raise #0.4 { \magnify #1.3 { + } } \raise #1.2 { \teeny " " \tiny \flat \tiny "9" } }
    <c e g-sharp b-flat d-flat'>1-\markup { \raise #0.4 { \magnify #1.3 { + } } \raise #0.5 { \normalsize 7 } \raise #1.2 { \teeny " " \tiny \flat \tiny "9" } }
    <c e g-sharp b-flat d' a'>1-\markup { \raise #0.4 { \magnify #1.3 { + } } \raise #0.5 { \normalsize 13 } }

    <c e g-sharp b-flat d-sharp' f-sharp'>1-\markup { 
        \raise #0.4 { \magnify #1.3 { + } } 
        \raise #0.7 { \magnify #0.5 { " " \triangle ##f } \normalsize 7 }
        \raise #3.8 { \tiny \center-column { \lower #1.25 { "  9" } " #9" \raise #1.25 "#11" } } 
    }

    % Lydian 
    %<c e g b f-sharp'>1-\markup { \raise #1.0 \small " lyd" }
    <c e g f-sharp'>1-\markup { \raise #1.0 \tiny "  #11" }
    %<c e g b f-sharp'>1-\markup { 
    %    \raise #0.7 { \magnify #0.5 { " " \triangle ##f } \normalsize 7 }
    %    \raise #1.2 { \teeny " " \tiny "#11" }
    %}
    <c e g b f-sharp'>1-\markup { 
        \raise #0.7 { \magnify #0.5 { " " \triangle ##f } }
        \raise #1.2 { \teeny " " \tiny "#11" }
    }
    <c e g b d' f-sharp'>1-\markup { \raise #0.7 { \magnify #0.5 { " " \triangle ##f } } \raise #3.4 { \teeny \center-column { \lower #1.25 { " 9" } " #11" } } }
    <c e g b d' f-sharp' a'>1-\markup { \raise #0.7 { \magnify #0.5 { " " \triangle ##f } } \raise #3.4 { \teeny \center-column { \lower #1.25 { "   13" } " #11" } } }
    <c e g b-flat f-sharp'>1-\markup { \raise #0.5 { \magnify #1.2 { \normalsize 7 } } \raise #1.0 \tiny " #11" }
    <c e g b-flat f-sharp' a-flat'>1-\markup { \raise #0.7 { \normalsize 7 } \raise #3.9 { \tiny \center-column { \lower #1.25 { " b13" } " #11" } } }

    % Suspended
    <c f g>1-\markup { \raise #0.7 { \normalsize "sus" } }
    <c f g b-flat>1-\markup { \raise #0.4 { \small "sus" } \raise #0.5 { \normalsize 7 } }
    <c f g b-flat d'>1-\markup { \raise #0.4 { \small "sus" } \raise #1.0 \small 9 }
    <c f g d-flat'>1-\markup { \raise #0.4 { \small "sus" } \raise #1.2 { \teeny " " \tiny \flat \tiny "9" } }
    <c f g b-flat d-flat'>1-\markup { \raise #0.4 { \small " sus" } \raise #0.5 { \normalsize 7 } \raise #1.0 \small " b9" }
    <c f g-flat>1-\markup { \raise #0.4 { \small " sus" } \raise #1.2 { \teeny " " \tiny \flat \small 5 } }
    <c f g-flat b-flat d-flat'>1-\markup { \raise #0.4 { \small " sus" } \raise #0.5 { \normalsize 7 } \raise #1.0 \small " b5" \raise #1.0 \small " b9" }
    <c e g-flat b-flat d-flat' f' a-flat'>1-\markup { 
        \raise #0.5 { \normalsize 11 } 
        \raise #6.5 { 
            \magnify #0.5 \teeny \center-column { 
                \lower #3.6 " b5" 
                \lower #1.5 " b9" 
                "b13" 
            } 
        }
    }
}
flamingChordExceptions = #(append (sequential-music-to-chord-exceptions flamingChordNames #t) ignatzekExceptions)


% Macro to print single slash
rs = {
  \once \override Rest #'stencil = #ly:percent-repeat-item-interface::beat-slash
  \once \override Rest #'thickness = #0.48
  \once \override Rest #'slope = #1.7
  r4
}
rss = {
  \once \override Rest #'stencil = #ly:percent-repeat-item-interface::beat-slash
  \once \override Rest #'thickness = #0.48
  \once \override Rest #'slope = #1.7
  r4.
}

% Function to print a specified number of slashes
comp = #(define-music-function (count) ( integer?)
    #{
        \override Rest #'stencil = #ly:percent-repeat-item-interface::beat-slash
        \override Rest #'thickness = #0.48
        \override Rest #'slope = #1.7
        \repeat unfold $count { r4 }
        \revert Rest #'stencil
    #}
)
% Example use of slashes:
%\score {
%  \relative c' {
%    c4 d e f |
%    \rs \rs \rs \rs |
%    \comp #4 |
%  }
%}

% Function to print a specified number of slashes
compp = #(define-music-function (count) ( integer?)
    #{
        \override Rest #'stencil = #ly:percent-repeat-item-interface::beat-slash
        \override Rest #'thickness = #0.48
        \override Rest #'slope = #1.7
        \repeat unfold $count { \once \override Dots.transparent = ##t r4. }
        \revert Rest #'stencil
    #}
)


startSolo = \relative c' {
    \override Rest #'stencil = #ly:percent-repeat-item-interface::beat-slash
    \override Rest #'thickness = #0.48
    \override Rest #'slope = #1.7
    r4^"Solo"
    \repeat unfold 3 { r4 }
    \revert Rest #'stencil
}

makePercent =
#(define-music-function (note) (ly:music?)
   "Make a percent repeat the same length as NOTE."
   (make-music 'PercentEvent
               'length (ly:music-length note)))
% Usage: \relative c'' { \makePercent s1 }

\layout {
    \context { 
        \ChordNames
        \override ChordName.font-size = #3
    } 
}
