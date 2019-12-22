\version "2.19.49"

\include "flaming-markup-text.ily"
\include "flaming-markup-symbols.ily"
\include "flaming-markup-roadmap.ily"
\include "double-mark.ily"

emDash = \markup \char ##x2014

laissezVibrerUp = \once \override LaissezVibrerTieColumn.tie-configuration = #`((2.5 . ,UP))

tempoMarkup = #(define-music-function (tempotext) (markup?) #{
        <>^\markup \raise #markingPadding { \large #tempotext }
    #})

tempoMarkupBelow = #(define-music-function (tempotext) (markup?) #{
        <>_\markup { \large #tempotext }
    #})

#(define (combine-marks mrkup)
  (lambda (grob)
    (let* ((default-stencil (ly:grob-property grob 'stencil))
           (mrkp-stencil (grob-interpret-markup grob mrkup))
           (break-dir (ly:item-break-dir grob)))

      (ly:grob-set-property! grob 'stencil
           (case break-dir
            ((0)
             (ly:stencil-combine-at-edge
               (ly:stencil-aligned-to mrkp-stencil X CENTER)
               Y
               UP
               (ly:stencil-aligned-to default-stencil X CENTER)
               1 ;; padding
               ))
            ((1)
             default-stencil)
            ((-1)
             mrkp-stencil))))))

markEndOfLine =
#(define-music-function (mark mrkp)(ly:music? markup?)
  #{
    \once \override Score.RehearsalMark #'break-visibility = #'#(#t #t #t)
    \once \override Score.RehearsalMark #'before-line-breaking =
      #(combine-marks mrkp)
    $mark
  #})

% \markEndOfLine \mark \default \markup { \musicglyph #"scripts.ufermata" }
