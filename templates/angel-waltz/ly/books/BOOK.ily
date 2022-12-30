\paper {
    % First page spacing after header
    markup-system-spacing.padding = #6

    % Subsequent page spacing after header
    top-system-spacing.minimum-distance = #18

    % Spacing in between systems
    system-system-spacing.minimum-distance = #17.5
}

\book {
    \header {
        subtitle = ""
        poet = \INSTRUMENTName
        instrumentName = \poet
    }

    \score {
        \keepWithTag #'(Part PDF
            SegmentIntro
            SegmentA
            SegmentB
            SegmentC
            SegmentD
            SegmentE
            SegmentF
            SegmentG
            SegmentH
            SegmentI
            SegmentJ
            SegmentK
            SegmentL
            SegmentM
        ) <<
            \include "ly/staves/parts/PART.ily"
        >>
        \include "ly/parts/layout.ily"
    }
}
