structureSong = \relative c { 

    \override Score.RehearsalMark.self-alignment-X = #LEFT
    \override Score.RehearsalMark #'extra-offset = #'( 0 . 0 )

    \key c \major
    \time 2/2 
    \tempo Samba 2=100

    \tag SegmentIntro {
        s1*8
        s1*2
    }
    \tag SegmentHeadIn {
        \startSection "A1"
        s1*8
        \startSection "A2"
        s1*8
        \startSection "B3"
        s1*8
        \startSection "A4"
        s1*8
        \startSection "C5"
        s1*8
        s1*2
    }
    \tag SegmentSolos {
        \startSection "A6"
        s1*8
        \startSection "A7"
        s1*8
        \startSection "B8"
        s1*8        
        \startSection "A9"
        s1*8
        \startSection "C10"
        s1*8
    }
    \tag SegmentInstrumental {
        \startSection "A11"
        s1*8
        \startSection "A12"
        s1*8
        \startSection "B13"
        s1*8        
        \startSection "C14"
        s1*8
    }
    \tag SegmentHeadOut {
        \startSection "A15"
        s1*8
        \startSection "A16"
        s1*8
        \startSection "B17"
        s1*8
        \startSection "A18"
        s1*8
        \startSection "C19"
        s1*8
        \startSection "Coda"
        s1*4
        \bar "||"
        \time 3/2 
        s1.
        \bar "||"
        \time 2/2
        s1*4 \break
        \bar "[|:" s1*4 \bar ":|]" \break
        s1*8
        \bar "|."
    }
}

globalSong = #(define-music-function (parser location mus) (ly:music?) #{ << \structureSong \relative { $mus } >> #})
