\book {
    \score {
        \keepWithTag #'(Score MIDI
            SegmentIntro
            SegmentHeadIn
            SegmentSolos
            SegmentInstrumental
            SegmentHeadOut
        ) <<
            \include "ly/staves/sound/flute.ily"
            \include "ly/staves/sound/tenorSaxophone.ily"
            \include "ly/staves/sound/trumpet.ily"
            \include "ly/staves/sound/bass.ily"
        >>
        \midi { }
    }
}
