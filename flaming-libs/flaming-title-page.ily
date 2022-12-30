\version "2.22.0" 

#(define-markup-command 
    (title-page-markup layout props instrument composer title) 
    (markup? markup? markup?)
    
    "Format a title page markup"
    (interpret-markup layout props
        #{  
            \markup \column {
                \combine \null \vspace #1
                \fill-line { 
                    \fontsize #6 { #instrument }
                    \fontsize #6 \italic { #composer } 
                }
                \combine \null \vspace #6
                \fill-line { \fontsize #12 \italic \bold \line { " " #title } }
            }
        #}
    )
)

\paper {
    first-page-number = #0 
    print-all-headers = ##t
    bookTitleMarkup = ##f
    evenHeaderMarkup = \markup {
        \on-the-fly #not-part-first-page
        \fill-line {
            \fromproperty #'header:instrumentName
            \line { 
                \titleLeft
                \titleKern
                \huge "-"
                \pageNumberKern
                \lower #0.55 \fontsize #6 \fromproperty #'page:page-number-string
                \pageNumberKern
                \huge "-"
                \titleKern
                \titleRight
            }
            \composerName
        }
    }
    oddHeaderMarkup = \evenHeaderMarkup
}