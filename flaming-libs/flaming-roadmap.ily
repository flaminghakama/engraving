\version "2.22.0"

% definitions for help with formatting

% startSection sectionName
% startSectionNoBarline sectionName
% startSectionWithLabel sectionName sectionLabel
% startSectionWithRepeat repeatLabel sectionLabel
% startSectionDouble sectionLabelOne sectionLabelTwo
% startSectionWithRepeatAndStyle repeatLabel sectionLabel styleLabel
% startSectionDoubleWithLabel sectionLabelOne sectionLabelTwo styleLabel
% startSectionWithRepeatDouble repeatLabel sectionLabelOne sectionLabelTwo
% startSectionWithRepeatTriple repeatLabel sectionLabelOne sectionLabelTwo sectionLabelThree
% startSectionWithRepeatTripleAndStyle repeatLabel sectionLabelOne sectionLabelTwo sectionLabelThree styleLabel)

% delSegAfter = \markup { \translate #'( 20 . 0 ) \huge \bold "D.S." }
% delSeg = \markup { \huge \bold "D.S." }
% alCoda = \markup { \bold "al  " \musicglyph "scripts.coda"  }
% dsAlCoda = \markup { \halign #-2 \center-column { \delSeg \alCoda } }
dsAlCoda = \markup { \bold \huge "D.S. al" \translate #'(-2 . 0.8) \small \musicglyph "scripts.coda" }

% dsCoda = \markup { \delSeg \alCoda }
fineSign = \markup { \huge \bold "Fine" }
fine = <>_\fineSign

% toEnd = \markup { \bold \huge "To End:" }
% dfine = \markup { \bold \huge "Fine" }
% fine = \dfine

dcFineMarkup = \markup { \bold \huge "D.C. al Fine" }
dcFine = <>_\dcFineMarkup
% dsFine = \markup { \bold \huge "D.S. al Fine" }
% %dsCoda = \markup { \bold \huge "D.S. al  " \musicglyph "scripts.coda" }
dcAlCodaMarkup = \markup { \bold \huge "D.C. al " \translate #'(0 . 1) \musicglyph "scripts.coda" }
dcAlCoda = <>^\markup { \bold \huge "D.C. al " \translate #'(0 . 1) \musicglyph "scripts.coda" }
% dcCoda = \markup { \bold \huge "D.C. al " \translate #'(-2 . 1) \musicglyph "scripts.coda" }
% dcCueCoda = \markup { \bold \huge "On Cue: D.C. al " \musicglyph "scripts.coda" }
% dEndCoda = \markup { \bold \huge "To end: D.C. al " \translate #'(0 . 1) \musicglyph "scripts.coda" }
% dEndCodaWithRepeat = \markup { \bold \huge "To end: D.C. al" \translate #'(2 . 0.8) \musicglyph "scripts.coda" \huge " w/ repeat" }
% dsEndCoda = \markup { \bold \huge "To end: D.S. al  " \musicglyph "scripts.coda" }
% toCodaMarkup = \markup \translate #'( 0 . 2 ) \huge \bold \musicglyph "scripts.coda" 
% toCoda = <>^\toCodaMarkup
% dEndFine = \markup { \bold \huge "To end: D.C. al Fine" }
% dEndDSFine = \markup { \bold \huge "To end: D.S. al Fine" }
% dEndDSCoda = \markup { \bold \huge "To end: D.S. al Coda" }
% dEndDSCodaA = \markup { \bold \huge "To end:" \box A1 "D.S. al Coda" }
% dFormRCRVV = \markup { \bold \huge "(Intro Chorus Interlude Verse Verse)" }
% dSolosDC = \markup { \bold \huge "Solos: D.C." } 
% dSolosForm = \markup { \bold \huge "Solos: whole form" } 
% dMoreSolosRepeat = \markup { \bold \huge "More solos: repeat"  } 
% dSolosFormRepeat = \markup { \bold \huge "Solos: whole form w/ repeats" } 
% dSolosWithRepeat = \markup { \bold \huge "To Solos: D.S. w/ repeats" } 
% dSolosRepeat = \markup { \bold \huge "Solos: repeat Solo Backgrounds" } 
% dSolosRepeatA = \markup { \bold \huge "More solos: repeat from " \box A4  } 
% dSolosDCForm = \markup { \bold \huge "Solos: D.C. whole form" } 
% dMoreSolosDS = \markup { \bold \huge "More Solos: D.S." }
% dSolosAABA = \markup { \bold \huge "Solos: AABA" dSolosDS = \markup { \bold \huge "Solos: D.S." }
% dSolosDSS = \markup { \bold \huge "Solos: D.S.S." }
% toSolos = \markup { \bold \huge "    To Solos" }
% dc = \markup { \halign #-2 \center-column { \dSolosDS \dEndCoda } }
% dsSolosCoda = \markup { \halign #-2 \center-column { \dSolosWithRepeat \dsEndCoda } }
% toSolos = \markup { \halign #-2 \center-column { \bold "Go to next page"  \bold "For solos w/ backgrounds" } }
% bgCue = \markup { }
% justDs = \markup { \bold "D.S." }
% withRepeats = \markup { \bold "(with repeats)" }
% dsRepeats = \markup { \halign #-2 \center-column { \justDs \withRepeats } }

secondTimeOnly = <>^\markup \raise #markingPadding { \large \bold "2nd X Only" }
bothTimes = <>^\markup \raise #markingPadding { \large \bold "Both X" }
firstTime = <>^\markup \raise #markingPadding { \medium \bold "1st X" }
firstTimeBelow = <>_\markup \raise #markingPadding { \medium \bold "1st X" }
secondTime = <>^\markup \raise #markingPadding { \medium \bold "2nd X" }
secondTimeBelow = <>_\markup \raise #markingPadding { \medium \bold "2nd X" }
thirdTime = <>^\markup \raise #markingPadding { \medium \bold "3rd X" }
thirdTimeBelow = <>_\markup \raise #markingPadding { \medium \bold "3rd X" }
fourthTime = <>^\markup \raise #markingPadding { \medium \bold "4th X" }
fourthTimeBelow = <>_\markup \raise #markingPadding { \medium \bold "4th X" }

showMeasureNumber = {
  \once \override Score.BarNumber.break-visibility = ##(#f #t #t)
}

showSection = #(define-music-function
    (sectionName)
    (markup?)
    #{
        \mark \markup { \box #sectionName } 
    #})

doubleBar = { 
    \showMeasureNumber
    \bar "||"
}

startSectionNoBarline = #(define-music-function
    (sectionName)
    (markup?)
    #{
        \showMeasureNumber
        \mark \markup { \box #sectionName } 
    #})

% startSection = #(define-music-function
%     (sectionName)
%     (markup?)
%     #{
%         \showMeasureNumber
%         \bar "||"
%         \mark \markup { \box #sectionName } 
%     #})

startSectionMidbar = #(define-music-function
    (sectionName)
    (markup?)
    #{
        \bar "" \noBreak \noPageBreak
        \mark \markup { \box #sectionName } 
    #})

startSectionMidbarShortRepeat = #(define-music-function
    (sectionName)
    (markup?)
    #{
        \bar "[:" \noBreak \noPageBreak
        \mark \markup { \box #sectionName } 
    #})

startSectionMidbarShortRepeatLabel = #(define-music-function
    (sectionName repeatLabel)
    (markup? markup?)
    #{
        \bar "[:" \noBreak \noPageBreak
        \mark \markup { \box #sectionName \bold #repeatLabel } 
    #})

startSectionMidbarEndShortRepeat = #(define-music-function
    (sectionName)
    (markup?)
    #{
        \bar ":]" \noBreak \noPageBreak
        \mark \markup { \box #sectionName } 
    #})

startSectionMidbarDoubleShortRepeatLabel = #(define-music-function
    (sectionName repeatLabel)
    (markup? markup?)
    #{
        \bar ":][:" \noBreak \noPageBreak
        \mark \markup { \box #sectionName \bold #repeatLabel } 
    #})

startSectionWithRepeatDouble = #(define-music-function
    (repeatLabel sectionLabelOne sectionLabelTwo)
    (markup? markup? markup?)
    #{
        \showMeasureNumber
        \mark \markup { \bold #repeatLabel \box #sectionLabelOne \box #sectionLabelTwo } 
    #})

startSectionWithLabel = #(define-music-function
    (sectionName sectionLabel)
    (markup? markup?)
    #{
        \showMeasureNumber
        \mark \markup { \box #sectionName \bold #sectionLabel } 
    #})

startSectionWithRepeat = #(define-music-function
    (repeatLabel sectionLabel)
    (markup? markup?)
    #{
        \showMeasureNumber
        \mark \markup { \bold #repeatLabel \box #sectionLabel } 
    #})

startSectionDouble = #(define-music-function
    (sectionLabelOne sectionLabelTwo)
    (markup? markup?)
    #{
        \showMeasureNumber
        \mark \markup { \box #sectionLabelOne \box #sectionLabelTwo } 
    #})

startSectionWithRepeatAndStyle = #(define-music-function
    (repeatLabel sectionLabel styleLabel)
    (markup? markup? markup?)
    #{
        \showMeasureNumber
        \mark \markup { \bold #repeatLabel \box #sectionLabel \bold #styleLabel } 
    #})

startSectionDoubleWithLabel = #(define-music-function
    (sectionLabelOne sectionLabelTwo styleLabel)
    (markup? markup? markup?)
    #{
        \showMeasureNumber
        \mark \markup { \box #sectionLabelOne \box #sectionLabelTwo \bold #styleLabel } 
    #})


startSectionWithRepeatDouble = #(define-music-function
    (repeatLabel sectionLabelOne sectionLabelTwo)
    (markup? markup? markup?)
    #{
        \showMeasureNumber
        \mark \markup { \bold #repeatLabel \box #sectionLabelOne \box #sectionLabelTwo } 
    #})

startSectionWithRepeatTriple = #(define-music-function
    (repeatLabel sectionLabelOne sectionLabelTwo sectionLabelThree)
    (markup? markup? markup? markup?)
    #{
        \showMeasureNumber
        \mark \markup { \bold #repeatLabel \box #sectionLabelOne \box #sectionLabelTwo \box #sectionLabelThree } 
    #})

startSectionWithRepeatTripleAndStyle = #(define-music-function
    (repeatLabel sectionLabelOne sectionLabelTwo sectionLabelThree styleLabel)
    (markup? markup? markup? markup? markup?)
    #{
        \showMeasureNumber
        \mark \markup { \bold #repeatLabel \box #sectionLabelOne \box #sectionLabelTwo \box #sectionLabelThree \bold #styleLabel } 
    #})

startSectionMidbarDoubleRepeat = #(define-music-function
    (sectionName repeatLabel)
    (markup? markup?)
    #{
        \bar ":][:" \noBreak \noPageBreak
        \mark \markup { \box #sectionName \bold #repeatLabel } 
    #})

#(define (double-bar-number increase-amount)
    (lambda (barnum measure-pos alt-number context)
        #{
            \markup
                \override #'(baseline-skip . 2)
                \center-column {
                    #(robust-bar-number-function barnum measure-pos alt-number context)
                    #(robust-bar-number-function
                        (+ increase-amount barnum) measure-pos alt-number context)
                }
        #}
    )
)

#(define (triple-bar-number increase-amount)
    (lambda (barnum measure-pos alt-number context)
        #{
            \markup
                \override #'(baseline-skip . 2)
                \center-column {
                    #(robust-bar-number-function barnum measure-pos alt-number context)
                    #(robust-bar-number-function
                        (+ increase-amount barnum) measure-pos alt-number context)
                    #(robust-bar-number-function
                        (+ increase-amount (+ increase-amount barnum)) measure-pos alt-number context)
                }
        #}
    )
)

#(define (triple-bar-number-plus-offset increase-amount offset-amount)
    (lambda (barnum measure-pos alt-number context)
        #{
            \markup
                \override #'(baseline-skip . 2)
                \center-column {
                    #(robust-bar-number-function barnum measure-pos alt-number context)
                    #(robust-bar-number-function
                        (+ increase-amount barnum) measure-pos alt-number context)
                    #(robust-bar-number-function
                        (+ increase-amount (+ increase-amount (+ barnum offset-amount))) measure-pos alt-number context)
                }
        #}
    )
)


#(define (quadruple-bar-number increase-amount)
    (lambda (barnum measure-pos alt-number context)
        #{
            \markup \override #'(baseline-skip . 2)
                {
                    \center-column {
                        #(robust-bar-number-function barnum measure-pos alt-number context)
                        #(robust-bar-number-function
                            (+ increase-amount 
                                (+ increase-amount barnum)) measure-pos alt-number context)
                    }

                    \center-column {
                        #(robust-bar-number-function
                            (+ increase-amount barnum) measure-pos alt-number context)
                        #(robust-bar-number-function
                            (+ increase-amount 
                                (+ increase-amount 
                                    (+ increase-amount barnum))) measure-pos alt-number context)
                    }
                }
        #}
    )
)

