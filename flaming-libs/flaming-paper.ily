\version "2.24.0"

titleKern = "   "
pageNumberKern = " "

%#(set-default-paper-size "legallandscape")
#(set-default-paper-size "letter")

%
%  Used to remove poet and composer from running header
%  presumably when header would be duplicated 
%  from the author Helge Kruse <Helge.Kruse@gmx.net>:
%    Bookpart first page and last page predicates
%
%  Usage:
%            \unless \on-first-page-of-part \fromproperty #'header:poet
%
#(define (not-part-first-page layout props arg)
   (if (= (chain-assoc-get 'page:page-number props -1)
          (ly:output-def-lookup layout 'first-page-number))
       empty-stencil
       (interpret-markup layout props arg)))

\paper {

    top-margin = #2
    right-margin = #14
    bottom-margin = #7

    top-system-spacing.minimum-distance = #16

    score-system-spacing = #'(
        (basic-distance . 1)
        (minimum-distance . 1)
        (padding . 8)
        (stretchability . 2)
    )

    last-bottom-spacing = #'(
        (basic-distance . 0) 
        (minimum-distance . 0) 
        (padding . 5) 
        (stretchability . 5)
    )

    #(set! text-font-defaults
        (cons '(box-padding . 0.7) text-font-defaults))

    page-breaking = #ly:minimal-breaking

    print-page-number = ##t
    print-first-page-number = ##f

    oddHeaderMarkup = \markup {
        \if \should-print-page-number
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
    evenHeaderMarkup = \oddHeaderMarkup
    oddFooterMarkup = \markup \fill-line { \fromproperty #'header:copyright }
    evenFooterMarkup = \oddFooterMarkup

    myStaffSize = #20

    %between-system-space = 3.5\cm
    %between-system-padding = #10

    #(define fonts
        (make-pango-font-tree "Papyrus"
            "Nimbus Sans"
            "Luxi Mono"
             (/ myStaffSize 20)
        )
    )
}

\layout {
    indent = 1\cm
    short-indent = .25\cm
}

% For metric modulcations
%  \tempo \markup { \concat { \smaller \general-align #Y #DOWN \note {8} #1
%                             " = "
%                             \smaller \general-align #Y #DOWN \note {4} #1
%                             "   Swing Two Feel" 
%                            }
%                 }


breakPart = \tag #'Part { \break }
breakScore = \tag #'Score { \break }
breakVideo = \tag #'Video { \break }
breakFlute = \tag #'Flute { \break }
breakPiccolo = \tag #'Piccolo { \break }
breakEnglishHorn = \tag #'EnglishHorn { \break }
breakLead = \tag #'Lead { \break }
breakCondensed = \tag #'Condensed { \break }
breakVoice = \tag #'Voice { \break }
breakRhythm = \tag #'Rhythm { \break }
breakMelody = \tag #'Melody { \break }
breakClave = \tag #'Clave { \break }
breakPiano = \tag #'Piano { \break }
breakViolin = \tag #'Violin { \break }
breakSoloViolin = \tag #'SoloViolin { \break }
breakBass = \tag #'Bass { \break }

noBreakPart = \tag #'Part { \noBreak }
noBreakScore = \tag #'Score { \noBreak }
noBreakVideo = \tag #'Video { \noBreak }
noBreakFlute = \tag #'Flute { \noBreak }
noBreakPiccolo = \tag #'Piccolo { \noBreak }
noBreakEnglishHorn = \tag #'EnglishHorn { \noBreak }
noBreakLead = \tag #'Lead { \noBreak }
noBreakCondensed = \tag #'Condensed { \noBreak }
noBreakVoice = \tag #'Voice { \noBreak }
noBreakRhythm = \tag #'Rhythm { \noBreak }
noBreakMelody = \tag #'Melody { \noBreak }
noBreakClave = \tag #'Clave { \noBreak }
noBreakPiano = \tag #'Piano { \noBreak }
noBreakViolin = \tag #'Violin { \noBreak }
noBreakSoloViolin = \tag #'SoloViolin { \noBreak }
noBreakBass = \tag #'Bass { \noBreak }

pageBreakPart = \tag #'Part { \pageBreak }
pageBreakScore = \tag #'Score { \pageBreak }
pageBreakVideo = \tag #'Video { \pageBreak }
pageBreakFlute = \tag #'Flute { \pageBreak }
pageBreakPiccolo = \tag #'Piccolo { \pageBreak }
pageBreakEnglishHorn = \tag #'EnglishHorn { \pageBreak }
pageBreakSaxophone = \tag #'Saxophone { \pageBreak }
pageBreakLead = \tag #'Lead { \pageBreak }
pageBreakCondensed = \tag #'Condensed { \pageBreak }
pageBreakVoice = \tag #'Voice { \pageBreak }
pageBreakRhythm = \tag #'Rhythm { \pageBreak }
pageBreakMelody = \tag #'Melody { \pageBreak }
pageBreakClave = \tag #'Clave { \pageBreak }
pageBreakPiano = \tag #'Piano { \pageBreak }
pageBreakViolin = \tag #'Violin { \pageBreak }
pageBreakSoloViolin = \tag #'SoloViolin { \pageBreak }
pageBreakBass = \tag #'Bass { \pageBreak }

noPageBreakPart = \tag #'Part { \noPageBreak }
noPageBreakScore = \tag #'Score { \noPageBreak }
noPageBreakVideo = \tag #'Video { \noPageBreak }
noPageBreakFlute = \tag #'Flute { \noPageBreak }
noPageBreakPiccolo = \tag #'Piccolo { \noPageBreak }
noPageBreakEnglishHorn = \tag #'EnglishHorn { \noPageBreak }
noPageBreakSaxophone = \tag #'Saxophone { \noPageBreak }
noPageBreakLead = \tag #'Lead { \noPageBreak }
noPageBreakCondensed = \tag #'Condensed { \noPageBreak }
noPageBreakVoice = \tag #'Voice { \noPageBreak }
noPageBreakRhythm = \tag #'Rhythm { \noPageBreak }
noPageBreakMelody = \tag #'Melody { \noPageBreak }
noPageBreakClave = \tag #'Clave { \noPageBreak }
noPageBreakPiano = \tag #'Piano { \noPageBreak }
noPageBreakViolin = \tag #'Violin { \noPageBreak }
noPageBreakSoloViolin = \tag #'SoloViolin { \noPageBreak }
noPageBreakBass = \tag #'Bass { \noPageBreak }


low = #(define-music-function () () #{ \change Staff = "lower" #})
hi = #(define-music-function () () #{ \change Staff = "upper" #})

notuple = { \once \override TupletNumber.stencil = ##f  \once \override TupletBracket.stencil = ##f }

\layout {
    \context {
        \Voice
        \override Slur.height-limit = 3.6
        %\override Slur.ratio = 0.36
        \override Slur.ratio = 0.3
        \override Slur.minimum-length = 2.3
        \override Slur.details.free-head-distance = 1.0
    }
}

hideGrace = {
    \once \hide NoteHead
    \once \hide Stem
    \once \override NoteHead.no-ledgers = ##t
    \once \override Glissando.bound-details.left.padding = #0.3
}

extendLV = #(define-music-function (further) (number?)
    #{
        \once \override LaissezVibrerTie.X-extent = #'(0 . 0)
        \once \override LaissezVibrerTie.details.note-head-gap = #(/ further -2)
        \once \override LaissezVibrerTie.extra-offset = #(cons (/ further 2) 0)
    #}
)


#(define flamingDrums 
    '(
        (snare           slash   #f           0)
    )
)

#(define factor 2)

%
%  Fails with error:
%  Preprocessing graphical objects...../../flaming-libs/flaming-paper.ily:216:15: In procedure enlarged-extent-laissez-vibrer::print:
%
% #(define (enlarged-extent-laissez-vibrer::print grob)
%   (let* ((stil (laissez-vibrer::print grob))
%          (stil-ext (ly:stencil-extent stil X))
%          (stil-length (interval-length stil-ext))
%          (new-stil-length (* stil-length factor))
%          (scale-factor (/ new-stil-length stil-length))
%          (new-stil (ly:stencil-scale stil scale-factor 1))
%          (new-stil-ext (ly:stencil-extent new-stil X))
%          (x-corr (- (car stil-ext) (car new-stil-ext))))
%   (ly:stencil-translate-axis
%      new-stil
%      x-corr
%      X)))

% #(assoc-set! (assoc-ref all-grob-descriptions 'LaissezVibrerTie)
% 'stencil enlarged-extent-laissez-vibrer::print)

#(define triangle->vertical-line-stencil
  (lambda (grob)
    (let* ((style (ly:grob-property grob 'style))
           (thickness (ly:grob-property grob 'thickness))
           (staff-line-thick (ly:staff-symbol-line-thickness grob))
           (thick (* thickness staff-line-thick))
           (height (ly:grob-property grob 'height)))
    (if (eq? style 'triangle)
        (make-line-stencil
          thick ;width
          ;; 0.5 is my choice, probably catch NoteColumn and take half of
          ;; its extent
          0.5 ;startx
          0 ;starty
          0.5  ;endx
          height ;endy
          )
        ly:measure-grouping::print))))

%{  Usage: 
\score {
    \new Voice {
        \override Staff.MeasureGrouping.stencil = #triangle->vertical-line-stencil
        ...
    }
    \layout {
        \context {
            \Staff
            \consists "Measure_grouping_engraver"
        }
    }
}

%}

