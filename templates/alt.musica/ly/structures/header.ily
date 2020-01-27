\version "2.19.81" 
\include "english.ly"
\include "articulate.ly"

titleLeft = "Next Le"
titleRight = "vel Shit"
titleFull = "Next Level Shit"
instrumentName = ""
composerName = "Elaine Paul"
copyright = \markup { \tiny "copyright © 2020 Elaine Paul Alt" }
arranger = ""

\include "../../flaming-libs/flaming-standard.ily"

\paper {
    #(define fonts
        (make-pango-font-tree "Dominican"
            "Highlander ITC TT" 
            "LilyJAZZText"
            (/ myStaffSize 20)
        )
    ) 
}

\include "../../flaming-libs/flaming-fonts.ily"
