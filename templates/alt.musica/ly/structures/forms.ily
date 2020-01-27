structureSong = \relative c { 
    \override Score.RehearsalMark.self-alignment-X = #LEFT
    \override Score.RehearsalMark #'extra-offset = #'( 0 . 0 )
    \key af \major
    \numericTimeSignature 
    \time 4/4
    \override Hairpin.minimum-length = 8
    \tag SegmentAI {
        \tempo "3/2 Son Clave" 4=216
        \tag #'PDF {    
            \partial 4*1 s4
        }
        \tag #'MIDI { s1 }
        \startSection "A1"
        s1*24
    }
    \tag SegmentAII {
        \startSection "A2"
        s1*24
    }
    \tag SegmentBIII {
        \startSection "B3"
        s1*16
    }
    \tag SegmentAIV {
        \startSection "A4"
        s1*28
        \bar "|." 
    }
}

globalSong = #(define-music-function (parser location mus) (ly:music?) #{ << \structureSong \relative { $mus } >> #})
