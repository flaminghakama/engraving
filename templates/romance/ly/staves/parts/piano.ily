        \new PianoStaff \with {
            instrumentName = "Piano"
            shortInstrumentName = ""
            %\override StaffGrouper.staff-staff-spacing.basic-distance = #50
            \override StaffGrouper.staff-staff-spacing.minimum-distance = #11
        } <<
            \new Staff = "upper" <<
                \override DynamicLineSpanner #'staff-padding = #3.0
                \accidentalStyle modern-voice-cautionary
                \clef treble
                \new Voice = "first" \pianoVoiceOne
                \new Voice = "second" \pianoVoiceTwo
            >>
            \new Staff = "lower" <<
                \override DynamicLineSpanner #'staff-padding = #3.0
                \accidentalStyle modern-voice-cautionary
                \clef bass
                \new Voice = "third" \pianoVoiceThree
                \new Voice = "fourth" \pianoVoiceFour
            >>
        >>
