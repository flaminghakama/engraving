% Code by David Nalesnik and Thomas Morley

% Usage:   
%    {
%        \customScripts #flaming-articulations
%        c1-. 1-> 1-- 1-!
%        \revertCustomScripts
%    }

% #(define flaming-articulations
%   '(
%     ("staccato" . ((color . (0 1 0))))
%     ("accent" . ((font-size . 4)(color . (0 1 0))(padding . 1.5)))
%     ("tenuto" . ((font-size . 10)))
%     ("staccatissimo" . ((padding . 2) (color . (0 1 0))))
%     ("coda" . ((color . (0 1 0)) (padding . 1)))
%     ))

#(define (custom-script-tweaks ls)
  (lambda (grob)
    (let* ((type (ly:prob-property
                    (ly:grob-property grob 'cause)
                    'articulation-type))
           (tweaks (assoc-ref ls type)))
      (if tweaks
          (for-each
            (lambda (x) (ly:grob-set-property! grob (car x) (cdr x)))
            tweaks)))))

customScripts =
#(define-music-function (settings)(list?)
#{
  \override Script.before-line-breaking =
    #(custom-script-tweaks settings)
#})

revertCustomScripts = { \revert Script.before-line-breaking }

#(define flaming-articulations
  '(
    ("staccato" . ((padding . 0.56)))
    ("accent" . ((padding . 0.54)))
    ("tenuto" . ((padding . 0.74)))
    ("marcato" . ((padding . 0.6)))
    ("staccatissimo" . ((padding . 1)))
    ("segno" . ((padding . 2)))
    ))
