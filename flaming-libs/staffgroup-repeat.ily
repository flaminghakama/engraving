#(define (define-grob-property symbol type? description)
  (if (not (equal? (object-property symbol 'backend-doc) #f))
      (ly:error (_ "symbol ~S redefined") symbol))

  (set-object-property! symbol 'backend-type? type?)
  (set-object-property! symbol 'backend-doc description)
  symbol)

#(for-each
  (lambda (x)
    (apply define-grob-property x))
    `((tip 
      ,symbol? 
      "Which bracket tip should be printed for certain BarLines?")))

%% If other symbols than 'up or 'down are used for `BarLine.tip' an
%% automatic procedure takes over trying to choose the correct BarLine, which 
%% may work. If not, use 'up and 'down at appropriate place.
CertainBracketTipsBarLines =
\override Score.BreakAlignGroup.after-line-breaking =
  #(lambda (grob)
    (let* ((elts (ly:grob-object grob 'elements))
           (bar-lines
             (if (null? elts)
                 '()
                 (filter 
                   (lambda (g) (grob::has-interface g 'bar-line-interface)) 
                   (ly:grob-array->list elts))))
           (possible-relevant-bar-lines
             (filter 
               (lambda (b) (not (null? (ly:grob-property b 'tip))))
               bar-lines)))
      (if (and (>= (length bar-lines) 2)
               (not (null? possible-relevant-bar-lines))
               (member 
                 (ly:grob-property (car bar-lines) 'glyph-name)
                 '(":..:" ":|." ".|:" ":|]" "[|:" ":|][|:")))
          (let* ((possible-top-bar-lines 
                   (filter 
                     (lambda (b) (eq? (ly:grob-property b 'tip) 'up))
                     bar-lines))
                 (top-bar-lines
                   (if (null? possible-top-bar-lines)
                       (list (car bar-lines))
                       possible-top-bar-lines))
                 (bar-lines-list-length (length top-bar-lines))
                 (possible-bottom-bar-lines 
                   (filter 
                     (lambda (b) (eq? (ly:grob-property b 'tip) 'down))
                     bar-lines))
                 (bottom-bar-lines
                   (if (null? possible-bottom-bar-lines)
                       (list (last bar-lines))
                       possible-bottom-bar-lines))
                 (top-stil 
                   (ly:grob-property (car top-bar-lines) 'stencil))
                 (bottom-stil 
                   (ly:grob-property (car bottom-bar-lines) 'stencil))
                 (layout (ly:grob-layout grob))
                 (props 
                   (ly:grob-alist-chain 
                     grob 
                     (ly:output-def-lookup layout 'text-font-defaults)))
                 (font 
                   (ly:paper-get-font 
                     layout
                     (cons '((font-encoding . feta)) props)))
                 (tip (ly:font-get-glyph font "brackettips.up"))
                 (top-glyph-name 
                   (ly:grob-property (car top-bar-lines) 'glyph-name))
                 (up-tip
                   (cond ((string=? top-glyph-name ":|]")
                           (ly:stencil-translate-axis
                             (ly:stencil-scale tip -1 1)
                             (cdr (ly:stencil-extent top-stil X))
                             X))
                         ((string=? top-glyph-name  ":..:")
                           (let ((kern 
                                    (/ (ly:grob-property (car top-bar-lines) 
                                                         'kern) 
                                       10))
                                 (top-stil-ext (ly:stencil-extent top-stil X)))
                             (ly:stencil-translate-axis
                               (ly:stencil-combine-at-edge
                                 (ly:stencil-scale tip -1 1)
                                 X RIGHT
                                 tip
                                 kern)
                               (- (interval-center top-stil-ext) (/ kern 2))
                               X)))
                         (else tip)))
                 (down-tip (ly:stencil-scale up-tip 1 -1)))
            (for-each
              (lambda (grobb bar-stil dir tip-style)
                      (ly:grob-set-property! grobb 'stencil
                        (ly:stencil-combine-at-edge
                          bar-stil
                          Y
                          dir
                          tip-style
                          0)))
               (append top-bar-lines bottom-bar-lines)
               (append
                 (make-list bar-lines-list-length top-stil)
                 (make-list bar-lines-list-length bottom-stil))
               (append
                 (make-list bar-lines-list-length 1)
                 (make-list bar-lines-list-length -1))
               (append
                 (make-list bar-lines-list-length up-tip)
                 (make-list bar-lines-list-length down-tip)))))))
                 
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% EXAMPLES
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%{
\paper { indent = 0 }
                   
mus =
#(make-sequential-music
  (map
    (lambda (s) 
      #{ 
      	 s1  \bar $s s1 \break \bar $s 
      #})
    '(":..:" ".|:" ":|.")))

\markup
  \fill-line {
    \pad-around #4
    \column {
      "Tips created automatic, using "
      "\\override BarLine.tip = #'auto"
    }
  }
    
\score {
  \new StaffGroup
  <<
    \new Staff 
      \with { \override BarLine.tip = #'auto } 
      { \mus \break s1 \bar "|." }
    \new Staff 
      { \mus \break s1 \bar "|." }
    \new Staff 
      { \mus \break s1 \bar "|." }
  >>
  \layout {
    \context {
      \Score 
      \CertainBracketTipsBarLines
    }
  }
}


%% A semi-automatic method making different at the same time are possible:
\markup
  \rounded-box
  \fill-line {
    \pad-around #4
    \column {
      "Tips set by user, using "
      "\\override BarLine.tip = #'up"
      "or"
      "\\override BarLine.tip = #'down"
      "Every BarLine will get a tip according to the override"
      "Different styles at the same time are possible"
    }
  }

\score {
  <<
    \new StaffGroup
    <<
      \new Staff 
        \with { \override BarLine.tip = #'up }
        \mus
      \new Staff 
        \mus
      \new Staff 
        \with { \override BarLine.tip = #'down }
        \mus
    >>
    
    \new StaffGroup
    <<
      \new Staff 
        \mus
      \new Staff 
        \mus
      \new Staff 
        \mus
    >>
  >>
  \layout {
    \context {
      \Score 
      \CertainBracketTipsBarLines
    }
  }
}
%}