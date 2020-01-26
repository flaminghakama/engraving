\version "2.19.81" 
\include "english.ly"
\include "articulate.ly"

titleLeft = "Left"
titleRight = "Right"
titleFull = "Left Right"
instrumentName = ""
composerName = "Elaine Paul"
copyright = \markup { \tiny "copyright © 2020 Elaine Paul" }
arranger = ""

\include "../../flaming-libs/flaming-standard.ily"

\header {
    source = ""
    style = ""
    copyright = \copyright
    lastupdated = ""
    title = \markup { \italic \fontsize #4 \bold { \titleFull }  }
    poet = ""
    composer = \markup \italic \composerName
    tagline = ""
}

\paper {
    #(define fonts
        (make-pango-font-tree "Zapfino"
            "Highlander ITC TT" 
            "LilyJAZZText"
            (/ myStaffSize 20)
        )
    ) 
}

\include "../../flaming-libs/flaming-fonts.ily"
