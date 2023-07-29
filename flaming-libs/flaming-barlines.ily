\version "2.22.0"

%\defineBarLine bartype #'(end begin span)

\defineBarLine ":|]" #'(":|]" "" " |.")
\defineBarLine "[|:" #'("||" "[|:" ".|")
\defineBarLine ":|][|:" #'(":|]" "[|:" " .|.")

\defineBarLine ":]" #'(":]" "" ";")
\defineBarLine "[:" #'("" "[:" ";")
\defineBarLine ":][:" #'(":]" "[:" ";")

\defineBarLine ":." #'("||" "" " ||")
\defineBarLine ".:" #'("||" ".:" "||")
\defineBarLine ":]:|]" #'(":]:|]" "" " .|.")

\defineBarLine ":!]" #'(":!]" "||" " !.")
\defineBarLine "[!:" #'("||" "[!:" " .!")
\defineBarLine ":!]:|]" #'(":!]:|]" "" " !| |.")

\defineBarLine "S-double" #'("||" "S" "||")
\defineBarLine "S||" #'("||" "S" "||")
\defineBarLine "SS-double" #'("||" "SS" "||")
\defineBarLine "SS[|:" #'("||" "SS[|:" "")
\defineBarLine "S[|:" #'("||" "S[|:" "")
\defineBarLine ":|]S" #'(":|]" "S||" "")
\defineBarLine ":|]S[|:" #'(":|]" "S[|:" "||")
\defineBarLine ":|]SS[|:" #'(":|]" "SS[|:" "||")
\defineBarLine "SS" #'("" "SS" "")

startRepeat = { \bar "[|:" }
doubleRepeat = { \bar ":|][|:" }
endRepeat = { \bar ":|]" }

twoTwo = {
    \bar "||"
    \time 2/2
}
threeTwo = {
    \bar "||"
    \time 3/2
}
fourTwo = {
    \bar "||"
    \time 4/2
}
twoFour = {
    \bar "||"
    \time 2/4
}
threeFour = {
    \bar "||"
    \time 3/4
}
fourFour = {
    \bar "||"
    \time 4/4
}
fiveFour = {
    \bar "||"
    \time 5/4
}
sixFour = {
    \bar "||"
    \time 6/4
}
sevenFour = {
    \bar "||"
    \time 7/4
}
fiveEight = {
    \bar "||"
    \time 5/8
    \set Timing.beatStructure = 3,2
}
sixEight = {
    \bar "||"
    \time 6/8
    \set Timing.beatStructure = 3,3
}
sevenEight = {
    \bar "||"
    \time 7/8
    \set Timing.beatStructure = 3,2,2
}
nineEight = {
    \bar "||"
    \time 9/8
    \set Timing.beatStructure = 3,3,3
}
tenEight = {
    \bar "||"
    \time 10/8
    \set Timing.beatStructure = 3,3,4
}
twelveEight = {
    \bar "||"
    \time 12/8
    \set Timing.beatStructure = 3,3,3,3
}
fifteenEight = {
    \bar "||"
    \time 15/8
    \set Timing.beatStructure = 3,3,3,3,3
}
threeDottedFour = {
    \bar "||"
    \once \override Staff.TimeSignature.stencil = #(lambda (grob)
        (grob-interpret-markup grob #{
            \markup \override #'(baseline-skip . 0.5) {
                \column { \number 3 \tiny\note {4.} #-1 }
            }
        #}))
    \time 9/8
    \set Timing.beatStructure = 3,3,3
}
fiveDottedFour = {
    \bar "||"
    \once \override Staff.TimeSignature.stencil = #(lambda (grob)
        (grob-interpret-markup grob #{
            \markup \override #'(baseline-skip . 0.5) {
                \column { \number 5 \tiny\note {4.} #-1 }
            }
        #}))
    \time 15/8
    \set Timing.beatStructure = 3,3,3,3,3
}
sevenDottedFour = {
    \bar "||"
    \once \override Staff.TimeSignature.stencil = #(lambda (grob)
        (grob-interpret-markup grob #{
            \markup \override #'(baseline-skip . 0.5) {
                \column { \number 7 \tiny\note {4.} #-1 }
            }
        #}))
    \time 21/8
    \set Timing.beatStructure = 3,3,3,3,3,3,3
}

leftAlignBarNumbers = {
    \override Score.BarNumber.self-alignment-X =
        #(lambda (grob)
            (let ((break-dir (ly:item-break-dir grob)))
                (if (= break-dir RIGHT) RIGHT LEFT)))
}

%%%%% Multi-measure rest for Jazz drum charts %%%%%
#(define (white-under-parenthetical grob)
  (grob-interpret-markup grob
    #{
      \markup
        \whiteout
        \pad-x #-0.2
        \line \vcenter {
          \huge \normal-text "( "
          #(ly:grob-property grob 'text)
          \huge \normal-text  " )"
      }
    #}))

setInlineMMRN = {
    \set Score.skipBars = ##t
    \override Score.MultiMeasureRest.expand-limit = 1
    \override Score.MultiMeasureRest.minimum-length = #30
}

inlineMMRN = {
    \once \override MultiMeasureRest.layer = #-2
    \once \override MultiMeasureRestNumber.layer = #-1
    \once \override MultiMeasureRestNumber.Y-offset = #0
    \once \override MultiMeasureRestNumber.stencil = #white-under-parenthetical
}

playTime = {
    \inlineMMRN
    <>^\markup { \large \italic "Time" }
}

inOne = {
    \inlineMMRN
    <>^\markup { \large \italic "In One" }
}

%{
    \setInlineMMRN
    \inlineMMRN
    R1*4
    \playTime
    R1*8
%}

