
%%%% https://archiv.lilypondforum.de/index.php/topic,2507.msg14157.html#msg14157
%%%% Code by xr:
#(define (get-parent-in-hierarchie grob searchword)
     ;; goes up in hierarchie until it finds
     ;; a grob named searchword
     (define result #f)

     (define (get-par grob)

       (define compare
         (lambda (x) (and (ly:grob? x) (equal? searchword (grob::name x)))))

       (let* ((parx (ly:grob-parent grob X))
              (pary (ly:grob-parent grob Y)))

         (cond ((not (equal? result #f))
                   result)
               ((compare parx)
                   (set! result parx)
                   result)
               ((compare pary)
                   (set! result pary)
                   result)
               (else
                   (if (ly:grob? parx)
                       (get-par parx))
                   (if(ly:grob? pary)
                       (get-par pary))))))
    ;; the inner function gets called from here
    (let* ((result (get-par grob)))
        ;; check if we found something
        (if (ly:grob? result)
            result
            #f)))

%%%% David Nalesnik's metronome-mark-alignment function:

#(define align-tempo-with-accidental
  (lambda (grob)
    (let* (;; returns PaperColumn- or NonMusicalPaperColumn-grob
           (col (ly:item-get-column grob))
           ;; returns System-grob
           ;; maybe taking a sledgehammer to crack a nut...
           (sys (get-parent-in-hierarchie grob 'System))
           (all-array (ly:grob-object sys 'all-elements))
           ;; better be paranoid and check for ly:grob-array?
           (all-list
             (if (ly:grob-array? all-array)
                 (ly:grob-array->list all-array)
                 '()))
           ;; get all AccidentalPlacement-grobs
           (acc-pl-grobs
             (filter
               (lambda (x)
                 (and (eq? col (ly:grob-parent x X))
                      (eq? 'AccidentalPlacement (grob::name x))))
               all-list)))
      ;; print a stencil for PaperColumn or NonMusicalPaperColumn
      ;; (for debugging)
      ;(ly:grob-set-property! col 'stencil ly:paper-column::print)

      ;; if accidentals are present return the most left coodinate of most
      ;; left accidental to use for X-offset otherwise return the default.
      (if (pair? acc-pl-grobs)
          (let* (;; get all Accidental-grobs from AccidentalPlacement
                 (accs
                   ;; TODO is it really safe to go for cadr only?
                   (map
                     cadr
                     (ly:grob-object (car acc-pl-grobs) 'accidental-grobs)))
                 ;; get all X-extents of accs
                 (accs-x-exts
                   (map (lambda (x) (ly:grob-extent x sys X)) accs))
                 ;; returns a pair containing most left, most right coordinate
                 ;; of the accidentals
                 (un (reduce interval-union '() accs-x-exts)))
            ;; return most left coordinate
            (car un))
          ;; Return the default.
          (let* ((basic-props (ly:grob-basic-properties grob))
                 (default-x-off-proc (assoc-get 'X-offset basic-props)))
            default-x-off-proc)))))

\layout {
    \context {
        \Score
        \override MetronomeMark.X-offset = #align-tempo-with-accidental
    }
}

