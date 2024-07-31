\version "2.22.0"

#(define (make-dynamic-extra dynamic string)
     (make-music
       'AbsoluteDynamicEvent
       'tweaks
         ;; calculate centering for text
         (list (cons (quote X-offset)
           (+ -0.5 (* -0.5 (string-length dynamic)))))
       'text
         (markup #:whiteout
           #:line (
               dynamic
               #:hspace -0.1
               #:normal-text #:italic string))
      ))

#(define (make-extra-dynamic string dynamic)
     (make-music
       'AbsoluteDynamicEvent
       'tweaks
         ;; calculate centering for text
         (list (cons (quote X-offset)
           (+ -0.5 (* -0.5 (string-length dynamic)))))
       'text
         (markup #:whiteout
           #:line (
               #:hspace -0.1
               #:normal-text #:italic string
               dynamic
               ))
      ))

#(define (make-dynamic-extra-dynamic string dynamic stringy)
     (make-music
       'AbsoluteDynamicEvent
       'tweaks
         ;; calculate centering for text
         (list (cons (quote X-offset)
           (+ -0.5 (* -0.5 (string-length dynamic)))))
       'text
         (markup #:whiteout
           #:line (
               #:hspace -0.1
               #:normal-text #:italic string
               dynamic
               #:hspace -0.1
               #:normal-text #:italic stringy
               ))
      ))

#(define (make-dynamic-repeat dynamicOne stringyOne dynamicTwo stringyTwo dynamicThree)
     (make-music
       'AbsoluteDynamicEvent
       'tweaks
         ;; calculate centering for text
         (list (cons (quote X-offset)
           (+ -0.5 (* -0.5 (string-length dynamicOne)))))
       'text
         (markup #:whiteout
           #:line (
               dynamicOne
               #:hspace -0.1
               #:normal-text #:italic stringyOne
               dynamicTwo
               #:hspace -0.1
               #:normal-text #:italic stringyTwo
               dynamicThree
               ))
      ))

#(define (make-two-dynamics dynamicOne stringyOne dynamicTwo)
     (make-music
       'AbsoluteDynamicEvent
       'tweaks
         ;; calculate centering for text
         (list (cons (quote X-offset)
           (+ -0.5 (* -0.5 (string-length dynamicOne)))))
       'text
         (markup #:whiteout
           #:line (
               dynamicOne
               #:hspace -0.1
               #:normal-text #:italic stringyOne
               dynamicTwo
               ))
      ))

ffDolce = #(make-dynamic-extra "ff" "dolce")

pEspr = #(make-dynamic-extra "p" "espr.")
mpEspr = #(make-dynamic-extra "mp" "espr.")
mfEspr = #(make-dynamic-extra "mf" "espr.")
fEspr = #(make-dynamic-extra "f" "espr.")
ffEspr = #(make-dynamic-extra "ff" "espr.")

pocoP = #(make-extra-dynamic "poco" "p")
piuP = #(make-extra-dynamic "piu" "p")
piuF = #(make-extra-dynamic "piu" "f")
piuFEspr = #(make-dynamic-extra-dynamic "piu" "f" "espr.")

subPpp = #(make-extra-dynamic "sub." "ppp")
subPp = #(make-extra-dynamic "sub." "pp")
subP = #(make-extra-dynamic "sub." "p")
subMp = #(make-extra-dynamic "sub." "mp")
subMf = #(make-extra-dynamic "sub." "mf")
subF = #(make-extra-dynamic "sub." "f")
subFf = #(make-extra-dynamic "sub." "ff")
subFff= #(make-extra-dynamic "sub." "fff")

pppSub = #(make-dynamic-extra "ppp" "sub.")
ppSub = #(make-dynamic-extra "pp" "sub.")
pSub = #(make-dynamic-extra "p" "sub.")
mpSub = #(make-dynamic-extra "mp" "sub.")
mfSub = #(make-dynamic-extra "mf" "sub.")
fSub = #(make-dynamic-extra "f" "sub.")
ffSub = #(make-dynamic-extra "ff" "sub.")
fffSub= #(make-dynamic-extra "fff" "sub.")

pppSempre = #(make-dynamic-extra "ppp" "sempre.")
ppSempre = #(make-dynamic-extra "pp" "sempre.")
pSempre = #(make-dynamic-extra "p" "sempre.")
mpSempre = #(make-dynamic-extra "mp" "sempre.")
mfSempre = #(make-dynamic-extra "mf" "sempre.")
fSempre = #(make-dynamic-extra "f" "sempre.")
ffSempre = #(make-dynamic-extra "ff" "sempre.")
fffSempre= #(make-dynamic-extra "fff" "sempre.")

pMpMf = #(make-dynamic-repeat "p" " -" "mp" " -" "mf")
mpMfF = #(make-dynamic-repeat "mp" " -" "mf" " -" "f")
pMp = #(make-two-dynamics "p" " -" "mp")
mpMf = #(make-two-dynamics "mp" " -" "mf")
mfF = #(make-two-dynamics "mf" " -" "f")
fFf = #(make-two-dynamics "f" " -" "ff")
fAppassionato = #(make-dynamic-extra "f" "Appassionato")


%{
pppEspr = #(make-dynamic-extra “ppp” “espr.”)
ppEspr = #(make-dynamic-extra “pp” “espr.”)
pEspr = #(make-dynamic-extra “p” “espr.”)
mpEspr = #(make-dynamic-extra “mp” “espr.”)
mfEspr = #(make-dynamic-extra “mf” “espr.”)
fEspr = #(make-dynamic-extra “f” “espr.”)
ffEspr = #(make-dynamic-extra “ff” “espr.”)
fffEspr = #(make-dynamic-extra “fff” “espr.”)
%}


mfp = #(make-dynamic-script "mfp")
pmf = #(make-dynamic-script "pmf")
ffmf = #(make-dynamic-script "ffmf")
fmp = #(make-dynamic-script "fmp")
smp = #(make-dynamic-script "smp")
smf = #(make-dynamic-script "smf")
sffz = #(make-dynamic-script "sffz")

xppp = \tweak stencil ##f \ppp
xpp = \tweak stencil ##f \pp
xp = \tweak stencil ##f \p
xmp = \tweak stencil ##f \mp
xmf = \tweak stencil ##f \mf
xf = \tweak stencil ##f \f
xff = \tweak stencil ##f \ff
xfff = \tweak stencil ##f \fff

deleteDynamics = #(define-music-function (music) (ly:music?) 
    (music-filter 
        (lambda (evt) 
            (not (memq (ly:music-property evt 'name) (list 
                'AbsoluteDynamicEvent 
                'CrescendoEvent 
                'DecrescendoEvent)
                 )
            )
        ) 
        music
    )
) 
