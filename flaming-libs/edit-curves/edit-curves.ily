\version "2.19.45"

% lily-easy-slurs.ily

showControlPoints = #(grob-transformer 'stencil 
    (lambda (grob orig)
        (define (draw-control-point pt)
            #{ \markup \translate $pt \with-color #red \draw-circle #0.35 #0 ##t #}
        )
        (define (draw-control-segment pt1 pt2)
            (let 
                ((delta
                        (cons 
                            (- (car pt2) (car pt1) )
                            (- (cdr pt2) (cdr pt1) )
                        )
                ))
                #{ \markup \translate $pt1 \with-color #'(1 .5 0) \draw-line $delta #}
            )
        )
        (let* 
            (
                (pts (ly:grob-property grob 'control-points))
                (dots 
                    (map 
                        (lambda (pt) (grob-interpret-markup grob (draw-control-point pt)))
                        pts
                    )
                )
                (lines 
                    (map 
                        (lambda (pt1 pt2) (grob-interpret-markup grob (draw-control-segment pt1 pt2))
                    ) 
                    pts 
                    (cdr pts)
                )
            )
        )
        (ly:stencil-add
            (apply ly:stencil-add lines)
            (apply ly:stencil-add dots)
            orig)
        )
    )
)

\layout { 
    \context {
        \Voice
        \override PhrasingSlur.stencil = #showControlPoints
        \override PhrasingSlur.output-attributes = #'((class . "lilySlur")(slurtype . "PhrasingSlur"))
        \override Slur.stencil = #showControlPoints
        \override Slur.output-attributes = #'((class . "lilySlur")(slurtype . "Slur"))
        \override Tie.stencil = #showControlPoints
        \override Tie.output-attributes = #'((class . "lilySlur")(slurtype . "Tie"))  
    } 
}