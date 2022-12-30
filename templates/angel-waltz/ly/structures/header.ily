\version "2.19.81" 
\include "english.ly"
\include "articulate.ly"

titleLeft = "Angel"
titleRight = "Waltz"
titleFull = "Angel Waltz"
instrumentName = ""
composerName = "Elaine Paul"
copyright = \markup { \tiny "copyright © 1990-2021 Elaine Paul Alt" }
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
