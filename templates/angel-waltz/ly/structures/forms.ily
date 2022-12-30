structureSong = \relative c { 
    \override Score.RehearsalMark.self-alignment-X = #LEFT
    \override Score.RehearsalMark #'extra-offset = #'( 0 . 0 )
    \key e \major
    \numericTimeSignature 
    \time 3/4
    \override Hairpin.minimum-length = 8
    \tag SegmentIntro {
        s2.*12
    }
    \tag SegmentA {
        \startSection "A"
        s2.*13
    }
    \tag SegmentB {
        \startSection "B"
        s2.*13
    }
    \tag SegmentC {
        \startSection "C"
        s2.*11
    }
    \tag SegmentD {
        \startSection "D"
        s2.*12
    }
    \tag SegmentE {
        \startSection "E"
        s2.*11
    }
    \tag SegmentF {
        \startSection "F"
        s2.*11
    }
    \tag SegmentG {
        \startSection "G"
        s2.*4
    }
    \tag SegmentH {
        \startSectionNoRepeat "H"
        \bar "[|:"
        \repeat volta 2 { 
            s2.*6
        }
        \alternative {
            { s2.*2 \bar ":|]" }
            { s2.*1 } 
        }
        s2. 
        }
    }
    \tag SegmentI {
        \startSection "I"
        s2.*14
    }
    \tag SegmentJ {
        \startSection "J"
        s2.*13 
    }
    \tag SegmentK {
        \startSection "K"
        s2.*11
    }
    \tag SegmentL {
        \startSection "L"
        s2.*11
    }
    \tag SegmentM {
        \startSection "M"
        s2.*29
        \time 2/4
        s2
        \time 3/4 
        s2.
        \bar "|."
    }
}

globalSong = #(define-music-function (parser location mus) (ly:music?) #{ << \structureSong \relative { $mus } >> #})
