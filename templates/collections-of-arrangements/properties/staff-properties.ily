				\autoPageBreaksOff
                \set Staff.explicitKeySignatureVisibility = #end-of-line-invisible
                \numericTimeSignature 
                \compressEmptyMeasures
                \override MultiMeasureRest.expand-limit = #1
                \accidentalStyle modern-voice-cautionary
	            \override Accidental.hide-tied-accidental-after-break = ##t
			    \override Beam.damping = #2.75 
			    \override Stem.length-fraction = #(magstep 1.03) 
			    \override DynamicLineSpanner.staff-padding = #2.6

