\version "2.22.0" 
\include "english.ly"

flamingChordNames = {

    % Major
    <c e g b>1-\markup { \raise #0.7 { \magnify #0.8 { " " \triangle ##f } \normalsize 7 } }
    <c e g d'>1-\markup { \raise #0.7 { \magnify #0.8 { " add" } \normalsize 9 } }
    <c e g b d'>1-\markup { \raise #0.7 { \magnify #0.8 { " " \triangle ##f } \normalsize 9 } }
    <c e g b a'>1-\markup { \raise #0.7 { \magnify #0.8 { " " \triangle ##f } \teeny " " \normalsize 13 } }
    <c e g a d'>1-\markup { \raise #3 { \tiny \center-column { \lower #1.25 { " 6" } " 9" } } }
    <c e g b d-sharp' f-sharp' a-flat'>1-\markup { 
        \raise #0.7 { \magnify #0.8 { " " \triangle ##f } \normalsize 9 }
        \raise #3.8 { \tiny \center-column { \lower #1.25 { "  #9" } "#11" \raise #1.25 { \line { \flat "13" } } } } 
    }
    <c e g b d' a'>1-\markup { 
        \raise #0.7 { \magnify #0.8 { " " \triangle ##f } }
        \raise #3.0 { \tiny \center-column { \lower #1.25 { "  9" } " 13" } }
    }
    <c e g d'>1-\markup { \raise #0.7 { \tiny "  add" \magnify #0.1 { \teeny " "  } \normalsize "9" } }
    <c e g b f-sharp' a'>1-\markup { 
        \raise #0.7 { \magnify #0.8 { " " \triangle ##f " " } }
        \raise #3.8 { \tiny 
            \center-column { 
                \lower #1.25 "#11"
                "13"  
            } 
        } 
    }
    <c e g b df'>1-\markup { \raise #0.7 { \magnify #0.8 { " " \triangle ##f } \normalsize 7 \raise #0.4 { " " \tiny \flat \tiny "9" } } }

    % Minor
    <c e-flat g>1-\markup { \raise #0.6 { \magnify #0.2 { "  " } \teeny { \char ##x2013 } } }
    <c e-flat g a>1-\markup { \raise #0.6 { \magnify #0.2 { "  " } \teeny { \char ##x2013 } \magnify #0.2 { "  " }} \raise #0.7 \normalsize 6 }
    <c e-flat g a d'>1-\markup { 
        \raise #0.6 { \magnify #0.2 { "  " } \teeny { \char ##x2013 } \magnify #0.2 { "  " }} 
        \raise #3 { \tiny \center-column { \lower #1.25 { " 6" } " 9" } } 
    }    
    <c e-flat g b-flat>1-\markup { \raise #0.6 { \magnify #0.2 { "  " } \teeny { \char ##x2013 } \magnify #0.1 { "  " }} \raise #0.7 \normalsize 7 }
    <c e-flat g b-flat f'>1-\markup { \raise #0.6 { \magnify #0.2 { "  " } \teeny { \char ##x2013 } \magnify #0.1 { "  " }} \raise #0.7 \normalsize 11 }
    <c e-flat g b-flat d' f'>1-\markup { \raise #0.6 { \magnify #0.2 { "  " } \teeny { \char ##x2013 } \magnify #0.1 { "  " }} \raise #0.7 \normalsize 11 }
    <c e-flat g b-flat a'>1-\markup { \raise #0.6 { \magnify #0.2 { "  " } \teeny { \char ##x2013 } \magnify #0.1 { "  " }} \raise #0.7 \normalsize 13 }

    <c e-flat g b>1-\markup { \raise #0.6 { \magnify #0.2 { "  " } \small { \char ##x2013 } \magnify #0.1 { "  " }} \raise #0.7 {  \magnify #0.64 { " " \triangle ##f } \small 7 } }
    <c e-flat g b d'>1-\markup { 
        \raise #0.6 { \magnify #0.2 { "  " } \teeny { \char ##x2013 } \magnify #0.5 { "  " } } 
        \raise #3.6 { 
            \tiny \center-column { 
                \lower #1.25 { " 9" } 
                \concat { \magnify #0.5 { \triangle ##f } \tiny 7 } 
            } 
        } 
    }
    <c e-flat g b d' a'>1-\markup { \raise #0.6 { \magnify #0.2 { "  " } \teeny { \char ##x2013 } \magnify #0.1 { "  " }} \raise #0.7 {  \magnify #0.64 { " " \triangle ##f } \small 7 } }
    <c e-flat g b-flat d' f' a'>1-\markup { \raise #0.6 { \magnify #0.2 { "  " } \teeny { \char ##x2013 } \magnify #0.1 { "  " }} \raise #0.7 \normalsize 13 }
    <c e-flat g b d' f' a'>1-\markup { 
        \raise #0.6 { \magnify #0.2 { "  " } \teeny { \char ##x2013 } \magnify #0.5 { "  " } } 
        \raise #3.6 { 
            \tiny \center-column { 
                \lower #1.25 { " 13" } 
                \concat { \magnify #0.5 { \triangle ##f } \tiny 7 } 
            } 
        } 
    }
    <c e-flat g b d' f-sharp' a'>1-\markup { 
        \raise #0.6 { \magnify #0.2 { "  " } \teeny { \char ##x2013 } \magnify #0.5 { "  " } } 
        \raise #3.6 { 
            \tiny \center-column { 
                \lower #1.25 \concat { " " \magnify #0.64 { \triangle ##f } 7 }     
                "#11" 
                \raise #1.25 " 13"      
            } 
        } 
    }

    <c e-flat g b-flat d'>1-\markup { \raise #0.6 { \magnify #0.2 { "  " } \teeny { \char ##x2013 } \magnify #0.1 { "  " }} \raise #0.7 \normalsize 9 }
    <c e-flat g b-flat d' f>1-\markup { \raise #0.6 { \magnify #0.2 { "  " } \teeny { \char ##x2013 } \magnify #0.1 { "  " }} \raise #0.7 \normalsize 11 }
    <c e-flat g b-flat d' a'>1-\markup { \raise #0.6 { \magnify #0.2 { "  " } \teeny { \char ##x2013 } \magnify #0.1 { "  " }} \raise #0.7 \normalsize 13 }
    <c e-flat g b-flat d' a'>1-\markup { \raise #0.6 { \magnify #0.2 { "  " } \teeny { \char ##x2013 } \magnify #0.1 { "  " }} \raise #0.7 \normalsize 13 }

    % minor7 b13 as "-7 b13"
    % <c e-flat g b-flat a-flat'>1-\markup { \raise #0.6 { \magnify #0.2 { "  " } \teeny { \char ##x2013 } \magnify #0.1 { "  " }} \raise #0.7 { \normalsize 7 } \raise #0.9 { \small \line { \flat "13" } } }

    % minor7 b13 as "- b13"
    <c e-flat g a-flat'>1-\markup { \raise #0.6 { \magnify #0.2 { "  " } \teeny { \char ##x2013 } \magnify #0.1 { "  " }} \teeny " " \raise #1.2 { \tiny \flat } \teeny " " \raise #0.9 { \tiny "13" } }
    <c e-flat g b-flat a-flat'>1-\markup { \raise #0.6 { \magnify #0.2 { "  " } \teeny { \char ##x2013 } \magnify #0.1 { "  " }} \raise #0.7 \normalsize 7 \raise #0.9 { \small "  " \tiny \flat \tiny "13" } }

    <c e-flat g b-flat d' a-flat'>1-\markup { \raise #0.6 { \magnify #0.2 { "  " } \teeny { \char ##x2013 } \magnify #0.1 { "  " }} \raise #0.7 \normalsize "9 " \tiny \flat \tiny "13" }     
    <c e-flat g b a-flat'>1-\markup { \raise #0.6 { \magnify #0.2 { "  " } \teeny { \char ##x2013 } \magnify #0.1 { "  " }} \raise #0.7 {  \magnify #0.64 { " " \triangle ##f } \small 7 \teeny " " \raise #0.5 { \tiny \flat }  \magnify #0.1 { "  " } \raise #0.3 { \tiny "13" } } }
    <c e-flat g b-flat d-flat' f-sharp'>1-\markup { 
        \raise #0.6 { \magnify #0.2 { "  " } \teeny { \char ##x2013 } \magnify #0.1 { "  " }} \raise #0.7 \normalsize 7
        \raise #3.6 { 
            \tiny \center-column { 
                \lower #1.25 { \line { \tiny \flat \tiny "9" } }
                "#11" 
            } 
        }
    }
    <c e-flat g d-flat' a-flat'>1-\markup { 
        \raise #0.6 { \magnify #0.2 { "  " } \teeny { \char ##x2013 } \magnify #0.1 { "  " }}
        \raise #3.6 { 
            \tiny \center-column { 
                \lower #1.25 { \line { " " \flat "9" } } 
                \line { \flat "13" } 
            } 
        }
    }
    <c e-flat g b-flat c-flat' d-flat' a-flat'>1-\markup { 
        \raise #0.6 { \magnify #0.2 { "  " } \teeny { \char ##x2013 } \magnify #0.1 { "  " }} \raise #0.7 \normalsize 7
        \raise #3.6 { 
            \tiny \center-column { 
                \lower #1.25 { \line { " " \flat "8" } } 
                \line { " " \flat "9" }
                \raise #1.25 { \line { \flat "13" } }
            } 
        }
    }

    % Dominant
    <c e g a>1-\markup { \raise #0.7 { \normalsize 6 } }
    <c e g b-flat>1-\markup { \raise #0.7 { \normalsize 7 } }
    <c e g b-flat d'>1-\markup { \raise #0.7 { \normalsize 9 } }
    <c e g b-flat d-flat'>1-\markup { \raise #0.7 { \normalsize 7 } \raise #1.2 { \teeny " " \tiny \flat \tiny "9" } }
    <c e g b-flat d-sharp' a-flat'>1-\markup { \raise #0.7 { \normalsize 7 } \raise #3.8 { \tiny \center-column { \lower #1.5 { " #9" } " " \flat "13" } } }
    <c e g b-flat d-sharp'>1-\markup { \raise #0.7 { \normalsize 7 } \raise #0.9 { \tiny " #9" } }
    <c e g b-flat c-sharp' d-sharp'>1-\markup { \raise #0.7 { \normalsize 7 } \raise #3.9 { \tiny \center-column { \lower #1.25 { \line { " " \flat "9" } } " #9" } } }
    <c e g b-flat d-sharp' f-sharp'>1-\markup { \raise #0.7 { \normalsize 7 } \raise #3.9 { \tiny \center-column { \lower #1.25 { " #9" } " #11" } } }
    <c e g b-flat d-flat' f-sharp'>1-\markup { \raise #0.7 { \normalsize 7 } \raise #3.9 { \tiny \center-column { \lower #1.25 { \line { " " \flat "9" } } " #11" } } }
    <c e g b-flat d' f-sharp'>1-\markup { \raise #0.7 { \normalsize 9 } \raise #1.2 { \tiny " #11" } }
    <c e g b-flat d' f-sharp' a'>1-\markup { \raise #0.7 { \normalsize 13 } \raise #1.2 { \tiny " #11" } }
    <c e g b-flat d' a'>1-\markup { \raise #0.7 { \normalsize 13 } }
    <c e g b-flat d-flat' a'>1-\markup { \raise #0.7 { \normalsize 13 } \raise #0.9 { \small \line { " " \flat "9" } } }
    <c e g b-flat a-flat'>1-\markup { \raise #0.7 { \normalsize 7 } \raise #0.9 { \line { \small " " \tiny \flat \tiny "13" } } }
    <c e g b-flat d' a-flat'>1-\markup { \raise #0.7 { \normalsize 9 } \raise #0.9 { \line { \small " " \flat "13" } } }
    <c e g b-flat d' f' a-flat'>1-\markup { \raise #0.7 { \normalsize 11 } \raise #0.9 { \small \line{ " " \flat "13" } } }
    <c e g b-flat c-sharp' d' a'>1-\markup { 
        \raise #0.7 { \normalsize 13 } 
        \raise #3.9 { \tiny 
            \center-column { 
                \lower #1.25 { "  9" } 
                \line { " " \flat "9" } 
            } 
        } 
    }
    <c e g b-flat c-sharp' d-sharp'>1-\markup { \raise #0.7 { \normalsize 7 } \raise #3.9 { \tiny \center-column { \lower #1.25 { " " \flat "9" } " #9" } } }
    <c e g b-flat d-flat' a-flat'>1-\markup { \raise #0.7 { \normalsize 7 } \raise #3.9 { \tiny \center-column { \lower #1.25 { \line { " " \flat "9" } } \line { \flat "13" } } } }
    <c e g b-flat d-flat' f-sharp' a'>1-\markup { \raise #0.7 { \normalsize 13 } \raise #3.9 { \tiny \center-column { \lower #1.25 { " " \flat "9" } " #11" } } }


    % Slash-only chords for Bb7/Ab in C
    <c e g b-flat cs'>1-\markup \whiteout { \hspace #-2 \line { "/A" \raise #0.0 \flat } }

    % Slash-only chords for Bb7/Ab in Bb
    <c e g b-flat cs' es'>1-\markup \whiteout { \hspace #-2 \line { "/B" \raise #0.0 \flat } }

    % Slash-only chords for Bb7/Ab in Eb
    <c e g b-flat cs' es' gs'>1-\markup \whiteout { \hspace #-2 "/F" }

    
    % Slash-only chords for F-/E# in C
    % f:1.3-.5.8+.14-
    % <c e-flat g c-sharp' bff'>1-\markup \whiteout { \hspace #-2 \line { "/E"  \normalsize \raise #0.5 \sharp } }

    % Slash-only chords for F-/E in C
    % f:1.3-.5.8+.14+
    <c e-flat g c-sharp' b'>1-\markup \whiteout { \hspace #-2 \line { "/E" } }
    
    % Slash-only chords for F-/Eb in C
    % f:1.3-.5.8+.14
    <c e-flat g c-sharp' b-flat'>1-\markup \whiteout { \hspace #-2 \line { "/E" \normalsize \raise #0.5 \flat } }
    
    % Slash-only chords for F-/D# in C
    % f:1.3-.5.8+.13+
    <c e-flat g c-sharp' a-sharp'>1-\markup \whiteout { \hspace #-2 \line { "/D" \normalsize \raise #0.5 \sharp } }

    % Slash-only chords for F-/D in C
    % f:1.3-.5.8+.13
    <c e-flat g c-sharp' a'>1-\markup \whiteout { \hspace #-2 \line { "/D" } }
    
    % Slash-only chords for F-/Db in C
    % f:1.3-.5.8+.13-
    <c e-flat g c-sharp' a-flat'>1-\markup \whiteout { \hspace #-2 \line { "/D" \normalsize \raise #0.5 \flat } }

    % Slash-only chords for F-/C# in C
    % f:1.3-.5.8+.12+
    <c e-flat g c-sharp' g-sharp'>1-\markup \whiteout { \hspace #-2 \line { "/C" \normalsize \raise #0.5 \sharp } }
    
    % Slash-only chords for F-/C in C
    % f:1.3-.5.8+.12
    <c e-flat g c-sharp' g'>1-\markup \whiteout { \hspace #-2 \line { "/C" } }
    
    % Slash-only chords for F-/Cb in C
    % f:1.3-.5.8+.12- 
    <c e-flat g c-sharp' g-flat'>1-\markup \whiteout { \hspace #-2 \line { "/C" \normalsize \raise #0.5 \flat } }

    % Slash-only chords for F-/B in C
    % f:1.3-.5.8+.11+
    <c e-flat g c-sharp' f-sharp'>1-\markup \whiteout { \hspace #-2 \line { "/B" } }
    
    % Slash-only chords for F-/Bb in C
    % f:1.3-.5.8+.11
    <c e-flat g c-sharp' f'>1-\markup \whiteout { \hspace #-2 \line { "/B" \normalsize \raise #0.5 \flat } }

    % Slash-only chords for F-/A# in C
    % f:1.3-.5.8+.10+
    <c e-flat g c-sharp' e-sharp'>1-\markup \whiteout { \hspace #-2 \line { "/A" \normalsize \raise #0.5 \sharp } }

    % Slash-only chords for F-/A in C
    % f:1.3-.5.8+.10
    <c e-flat g c-sharp' e'>1-\markup \whiteout { \hspace #-2 \line { "/A" } }

    % Slash-only chords for F-/Ab in C
    % f:1.3-.5.8+.10-
    <c e-flat g c-sharp' e-flat'>1-\markup \whiteout { \hspace #-2 \line { "/A" \normalsize \raise #0.5 \flat } }

    % Slash-only chords for F-/G# in C
    % f:1.3-.5.8+.9+
    <c e-flat g c-sharp' d-sharp'>1-\markup \whiteout { \hspace #-2 \line { "/G" \normalsize \raise #0.5 \sharp } }

    % Slash-only chords for F-/G in C
    % f:1.3-.5.8+.9
    <c e-flat g c-sharp' d'>1-\markup \whiteout { \hspace #-2 \line { "/G" } }

    % Slash-only chords for F-/Gb in C
    % f:1.3-.5.8+.9-
    <c e-flat g c-sharp' d-flat'>1-\markup \whiteout { \hspace #-2 \line { "/G" \normalsize \raise #0.5 \flat } }

    % Slash-only chords for F-/F# in C
    % f:1.3-.5.8+
    <c e-flat g c-sharp'>1-\markup \whiteout { \hspace #-2 \line { "/F" \normalsize \raise #0.5 \sharp } }

    % Slash-only chords for F-/F in C
    % f:1.3-.5.8+.14-
    <c e-flat g c-sharp' bff'>1-\markup \whiteout { \hspace #-2 \line { "/F" } }
    
    

    % Dominant b5
    <c e g-flat b-flat>1-\markup { \raise #0.7 { \normalsize 7 } \raise #1.0 { \small \line { " " \flat "5" } } }
    <c e g-flat b-flat d'>1-\markup { \raise #0.7 { \normalsize 9 } \raise #1.0 { \small \line { " " \flat "5" } } }
    <c e g-flat b-flat a'>1-\markup { \raise #0.7 { \normalsize 13 } \raise #1.0 { \small \line { " " \flat "5" } } }
    <c e g-flat b-flat d-flat'>1-\markup { \raise #0.7 { \normalsize 7 } \raise #3.8 { \tiny \center-column { \lower #1.5 { \line { " " \flat "5" } } \line { " " \flat "9" } } } }
    <c e g-flat b-flat d-flat' a'>1-\markup { \raise #0.7 { \normalsize 13 } \raise #3.8 { \tiny \center-column { \lower #1.25 { \line { " " \flat "5" } } \line { " " \flat "9" } } } }
    <c e g-flat b-flat a-flat'>1-\markup { \raise #0.7 { \normalsize 7 } \raise #3.8 { \tiny \center-column { \lower #1.5 { \line { " " \flat "5" } } \line { " " \flat "13" } } } }
    <c e g-flat b-flat d-sharp'>1-\markup { \raise #0.7 { \normalsize 7 } \raise #3.8 { \tiny \center-column { \lower #1.5 { \line { " " \flat "5" } } " #9" } } }


    % Half-diminished
    <c e-flat g-flat b-flat>1-\markup { \raise #0.5 { \magnify #0.85 \char ##x2205 } }
    <c e-flat g-flat b-flat c-sharp'>1-\markup { \raise #0.5 { \magnify #0.85 \char ##x2205 } }
    <c e-flat g-flat b-flat d-flat'>1-\markup { \raise #0.5 { \magnify #0.85 \char ##x2205 } \raise #0.5 \concat { \tiny " " \raise #0.8 { \tiny \flat \tiny "9" } } }
    <c e-flat g-flat b-flat d'>1-\markup { \raise #0.5 { \magnify #0.85 \char ##x2205 } \raise #0.5 \concat { \tiny " " \raise #0.8 \tiny "9"  } }
    <c e-flat g-flat b-flat f'>1-\markup { \raise #0.5 { \magnify #0.85 \char ##x2205 } \raise #0.5 { \normalsize 11 } }
    <c e-flat g-flat b-flat a'>1-\markup { \raise #0.5 { \magnify #0.85 \char ##x2205 } \raise #0.5 { \normalsize 13 } }

    % Diminished
    %<c e-flat g-flat b-flatflat f'>1-\markup { \raise #1.5 { \magnify #2 \circle "" } \raise #0.5 { \normalsize 11 } }

    % Augmented
    <c e g-sharp>1-\markup { \raise #0.4 { \magnify #1.3 { + } } }
    <c e g-sharp b-flat>1-\markup { \raise #0.4 { \magnify #1.3 { + } } \raise #0.5 { \normalsize 7 } }
    <c e g-sharp b-flat d'>1-\markup { \raise #0.4 { \magnify #1.3 { + } } \raise #0.5 { \normalsize 9 } }
    <c e g-sharp b-flat c-sharp' d-sharp'>1-\markup { 
        \raise #0.4 { \magnify #1.3 { + } } 
        \raise #0.5 { \normalsize 7 } 
        \raise #3.9 { 
            \tiny \center-column { 
                \lower #1.25 \line { " " \flat "9" }
                " #9" 
            } 
        }
    }
    <c e g-sharp b-flat d-sharp'>1-\markup { \raise #0.4 { \magnify #1.3 { + } } \raise #0.5 { \magnify #1.2 { \normalsize 7 } } \raise #1.0 \tiny " #9" }
    <c e g-sharp b-flat f-sharp'>1-\markup { \raise #0.4 { \magnify #1.3 { + } } \raise #0.5 { \magnify #1.2 { \normalsize 7 } } \raise #1.0 \tiny " #11" }
    <c e g-sharp d-flat'>1-\markup { \raise #0.4 { \magnify #1.3 { + } } \raise #1.2 { \teeny " " \tiny \flat \tiny "9" } }
    <c e g-sharp b-flat d-flat'>1-\markup { \raise #0.4 { \magnify #1.3 { + } } \raise #0.5 { \normalsize 7 } \raise #1.2 { \line { \teeny " " \tiny \flat \tiny "9" } } }
    <c e g-sharp b-flat d' a'>1-\markup { \raise #0.4 { \magnify #1.3 { + } } \raise #0.5 { \normalsize 13 } }

    <c e g-sharp b-flat d-sharp' f-sharp'>1-\markup { 
        \raise #0.4 { \magnify #1.3 { + } } 
        \raise #0.7 { \magnify #0.64 { " " \triangle ##f } \normalsize 7 }
        \raise #3.8 { \tiny \center-column { \lower #1.25 { "  9" } " #9" \raise #1.25 "#11" } } 
    }
    <c e g-sharp b-flat d-flat' f-sharp'>1-\markup { 
        \raise #0.4 { \magnify #1.3 { + } } \raise #0.5 { \normalsize 7 } \raise #3.9 { \tiny \center-column { \lower #1.25 { \line { " " \flat "9" } } " #11" } }
    }

    % Lydian 
    %<c e g b f-sharp'>1-\markup { \raise #1.0 \small " lyd" }
    <c e g f-sharp'>1-\markup { \raise #1.0 \tiny "  #11" }
    %<c e g b f-sharp'>1-\markup { 
    %    \raise #0.7 { \magnify #0.64 { " " \triangle ##f } \normalsize 7 }
    %    \raise #1.2 { \teeny " " \tiny "#11" }
    %}
    <c e g b f-sharp'>1-\markup { 
        \raise #0.7 { \magnify #0.8 { " " \triangle ##f } }
        \raise #1.2 { \teeny " " \tiny "#11" }
    }
    <c e g b d' f-sharp'>1-\markup { \raise #0.7 { \magnify #0.8 { " " \triangle ##f } } \raise #3.4 { \teeny \center-column { \lower #1.25 { "  9" } " #11" } } }
    <c e g b d' f-sharp' a'>1-\markup { 
        \raise #0.7 { \magnify #0.8 { " " \triangle ##f } } 
        \raise #3.4 { \teeny 
            \center-column { 
                \lower #1.25 " #11"
                "  13" 
            } 
        } 
    }
    <c e g b-flat f-sharp'>1-\markup { \raise #0.5 { \magnify #1.2 { \normalsize 7 } } \raise #1.0 \tiny " #11" }
    <c e g b-flat f-sharp' a-flat'>1-\markup { 
        \raise #0.7 { \normalsize 7 } 
        \raise #3.9 { 
            \tiny \center-column { 
                \lower #1.25 " #11"
                \line { " " \flat "13" }
            } 
        } 
    }
    <c e g d-sharp' f-sharp'>1-\markup { " "
        \raise #3.6 { 
            \tiny \center-column { 
                \lower #1.25 { " #9" } 
                "#11" 
            } 
        }
    }
    <c e g b d-flat' f-sharp' a'>1-\markup { 
        \raise #0.7 { \magnify #0.8 { " " \triangle ##f " " } }
        \raise #3.8 { \tiny 
            \center-column { 
                \lower #1.1 { \line { " " \flat "9" } } 
                \line { "#11" }
                \raise #1.3 { "  13" }
            } 
        } 
    }

    % Suspended
    <c f g>1-\markup { \raise #0.7 { \normalsize " sus" } }
    <c f g b-flat>1-\markup { \raise #0.4 { \small " sus" } \raise #0.5 { \normalsize 7 } }
    <c f g b-flat d'>1-\markup { \raise #0.4 { \small " sus" } \raise #1.0 \small 9 }
    <c f g b-flat d' a'>1-\markup { \raise #0.4 { \small " sus" } \raise #1.0 \small 13 }
    <c f g d-flat'>1-\markup { \raise #0.4 { \small " sus" } \raise #1.2 { \teeny " " \tiny \flat \tiny "9" } }
    <c f g b-flat d-flat'>1-\markup { \raise #0.4 { \small " sus" } \raise #0.5 { \normalsize 7 } \raise #1.0 \small " " \flat "9" }
    <c f g b-flat a-flat'>1-\markup { \raise #0.4 { \small " sus" } \raise #0.5 { \normalsize 7 } \raise #0.9 \line { \small " " \tiny \flat \tiny "13" } }
    <c f g-flat>1-\markup { \raise #0.4 { \small " sus" } \raise #1.2 { \teeny " " \tiny \flat \small 5 } }
    <c f g-flat b-flat d-flat'>1-\markup { \raise #0.4 { \small " sus" } \raise #0.5 { \normalsize 7 } \raise #1.0 \small \line { " " \flat "5" } \raise #1.0 \small " " \flat "9" }
    <c e g-flat b-flat d-flat' f' a-flat'>1-\markup { 
        \raise #0.5 { \normalsize 11 } 
        \raise #6.5 { 
            \magnify #0.5 \teeny \center-column { 
                \lower #3.6 \line { " " \flat "5" } 
                \lower #1.5 \line { " " \flat "9" } 
                \line { \flat "13" } 
            } 
        }
    }
    <c f g b-flat f-sharp'>1-\markup { \raise #0.4 { \small " sus" } \raise #0.5 { \normalsize 7 } \raise #1.0 \small " #11" }

    % Modes
    <c d e f g a b>1-\markup \small " Ion."
    <c d e-flat f g a b-flat>1-\markup \small " Dor."
    <c d-flat e-flat f g a-flat b-flat>1-\markup \small " Phy."
    <c d e f-sharp g a b>1-\markup \small " Lyd."
    <c d e f g a b-flat>1-\markup \small " Mix."
    <c d e-flat f g a-flat b-flat>1-\markup \small " Aeo."
    <c d-flat e-flat f g-flat a-flat b-flat>1-\markup \small " Loc."
    <c d e-flat f g a-flat b>1-\markup { \raise #0.6 { \magnify #0.2 { "  " } \teeny { \char ##x2013 } \magnify #0.2 { "  " }} \raise #0.7 \tiny "(harmonic)" }

}
flamingChordExceptions = #(append (sequential-music-to-chord-exceptions flamingChordNames #t) ignatzekExceptions)

useFlamingChords = {
    \set chordChanges = ##t 
    \set chordNameExceptions = #flamingChordExceptions
    \set noChordSymbol = ##f
}

chordRestsAsSlashes = {
    \override Rest.stencil = #ly:percent-repeat-item-interface::beat-slash
    \override Rest.thickness = #0.48
    \override Rest.slope = #1.7
    \override Rest.Y-offset = #1
}

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

customChordMarkup = #(define-music-function (text) (markup?) #{
    \once \set chordNameFunction = #( lambda (sorted-pitches bass inversion context)
        (let* 
            (
                (root (first sorted-pitches))
                (root-namer (ly:context-property context 'chordRootNamer))
                (root-markup (root-namer root #f))
                (after-slash (if (ly:pitch? inversion) inversion bass))
                (after-slash-markup
                    (if (ly:pitch? after-slash) 
                        #{ \markup { / #(root-namer after-slash #f) } #}
                        ""
                    )
                )
            )
            #{ 
                \markup { #root-markup \super #text #after-slash-markup } 
            #}
        )
    )
#})

% myCustomChordMarkup = \markup { m7 \teeny "omit root" }
% myChordNames = \chords {
%    c1
%    \t \myCustomChordMarkup d1/g
%    \t \myCustomChordMarkup c1/g
%}

chordRestsAsSlashes = {
    \override Rest.stencil = #ly:percent-repeat-item-interface::beat-slash
    \override Rest.thickness = #0.48
    \override Rest.slope = #1.7
    \override Rest.Y-offset = #1
}

