composerName = "Elaine Paul Alt"
arranger = ""

\include "../../flaming-libs/flaming-standard.ily"
\include "../../flaming-libs/flaming-chords.ily"

\paper {
    #(define fonts
        (make-pango-font-tree "Marker Felt"
            "Highlander ITC TT" 
            "LilyJAZZText"
            (/ myStaffSize 20)
        )
    ) 
}

\include "../../flaming-libs/flaming-fonts.ily"
