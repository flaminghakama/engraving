\version "2.19.49" 
%{
    by Arnold Theresius

    Usage:  

    \doubleMark
        \markupForEndOfLine
        ##t

    \doubleMark
        \markupForEndOfLine
        ##f

    \doubleMark
        \markupForEndOfLine
        \markupForBeginningOfLine
%}

#(define-public (string-or-markup-or-boolean? e)
  (or (string? e) (markup? e) (boolean? e)))

#(define (music-property-description symbol type? description)
  (if (not (equal? #f (object-property symbol 'music-doc)))
      (ly:error (_ "symbol ~S redefined") symbol))
  (set-object-property! symbol 'music-type? type?)
  (set-object-property! symbol 'music-doc description)
  symbol)

#(for-each
  (lambda (x)
    (apply music-property-description x))
    `((left-label
       ,string-or-markup-or-boolean?
       "set the left part of a RehearsalMark")
      (right-label
       ,string-or-markup-or-boolean?
       "set the right part of a RehearsalMark")
       ))

#(define (double-rehearsalmark-stencil grob)
  (let*
   ((grobs-event (ly:grob-property grob 'cause '()))
    (left-label (ly:event-property grobs-event 'left-label))
    (right-label (ly:event-property grobs-event 'right-label))
    (gap (ly:grob-property grob 'gap 1.4)))
   (if (not (or (null? left-label) (null? right-label)))
    (case (ly:item-break-dir grob)
     ((-1)
      (if (boolean? left-label) empty-stencil
       (grob-interpret-markup grob
        (make-right-align-markup left-label))))
     ((1)
      (if (boolean? right-label) empty-stencil
       (grob-interpret-markup grob
        (make-left-align-markup right-label))))
     (else
      (if (boolean? left-label)
       (grob-interpret-markup grob
        (if left-label
         (make-center-align-markup right-label)
         (make-left-align-markup right-label)))
       (if (boolean? right-label)
        (grob-interpret-markup grob
         (if right-label
          (make-center-align-markup left-label)
          (make-right-align-markup left-label)))
        (ly:stencil-add
         (ly:stencil-translate
          (grob-interpret-markup grob
           (make-right-align-markup left-label))
          (cons (* -0.5 gap) 0.0))
         (ly:stencil-translate
          (grob-interpret-markup grob
           (make-left-align-markup right-label))
          (cons (* 0.5 gap) 0.0)))))))
    (begin
     (ly:warning "\"doubleMark stencil\" did not find \"doubleMark texts\".")
     (ly:warning "fallback to using \"ly:text-interface::print\".")
     (ly:text-interface::print grob)))))

doubleMark =
#(define-music-function
  (left-string right-string)
  (string-or-markup-or-boolean? string-or-markup-or-boolean?)
  (if (and (boolean? left-string) (boolean? right-string))
   (ly:warning "~a \\doubleMark - at least one string or markup required" (*location*)))
  (make-music 'SequentialMusic
   'elements (list
    (make-music 'ContextSpeccedMusic
     'context-type 'Score
     'element
      (make-music 'OverrideProperty
       'symbol 'RehearsalMark
       'grob-value double-rehearsalmark-stencil
       'grob-property-path (list 'stencil)
       'pop-first #t
       'once #t))
    (make-music 'ContextSpeccedMusic
     'context-type 'Score
     'element
      (make-music 'OverrideProperty
       'symbol 'RehearsalMark
       'grob-value #f
       'grob-property-path (list 'self-alignment-X)
       'pop-first #t
       'once #t))
    (make-music 'ContextSpeccedMusic
     'context-type 'Score
     'element
      (make-music 'OverrideProperty
       'symbol 'RehearsalMark
       'grob-value `#(,(not (boolean? left-string))
                      #t
                      ,(not (boolean? right-string)))
       'grob-property-path (list 'break-visibility)
       'pop-first #t
       'once #t))
    (make-music 'MarkEvent
     'label #f
     'left-label (if (string? left-string)
                  (make-simple-markup left-string)
                  left-string)
     'right-label (if (string? right-string)
                   (make-simple-markup right-string)
                   right-string)
     'origin (*location*)))))


set-mark-y-dir =
#(define-music-function (ls)(list?)
"
 Sets 'direction of RehearsalMark. Depending on their break-dir.
 
 @var{ls} is supposed to be an alist with entries like
  (<break-dir of the item> . <Y-direction>)
 A full list is not needed. An empty list is possible, too, will default to all
 items UP.
 
 Example:
 `( (,left . ,DOWN) (,center . ,DOWN) (,right . ,UP) )
 Ofcourse this is the same as:
 '((-1 . -1)(0 . -1)(1 . 1))
 "
#{
  \override Score.RehearsalMark.before-line-breaking =
    #(lambda (grob) 
       (let* ((get-break-dir (ly:item-break-dir grob))
              (left-y-dir (or (assoc-get left ls) 1))
              (right-y-dir (or (assoc-get right ls) 1))
              (center-y-dir (or (assoc-get center ls) 1)))
         
         (ly:grob-set-property! grob 'direction
           (case get-break-dir
            ((-1) left-y-dir)
            ((1) right-y-dir)
            ((0) center-y-dir)
            ;; better be paranoiac
            (else 1)))))
#})