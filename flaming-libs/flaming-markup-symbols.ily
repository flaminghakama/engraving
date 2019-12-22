\version "2.19.81"

breath = {
    \once \override BreathingSign #'text = \markup {
        \raise #2 \line { " " \musicglyph #"scripts.rcomma" \small " " }
    }
    \breathe
}

parenBreath = {
    \once \override BreathingSign #'text = \markup {
        \raise #2 \line { " " \musicglyph #"scripts.rcomma" \small " " }
    } 
}

railroadTracks = {
    \once \override BreathingSign #'text = \markup {
        \raise #2 \line { "  " \musicglyph #"scripts.caesura.curved" " " }
    }
    \breathe
}

flatTrillStart = \once \override TrillSpanner.bound-details.left.text = \markup {
    \musicglyph #"scripts.trill" \raise #0.65 \teeny  { \flat } 
}
naturalTrillStart = \once \override TrillSpanner.bound-details.left.text = \markup {
    \musicglyph #"scripts.trill" \raise #0.65 \teeny  { \natural } 
}
sharpTrillStart = \once \override TrillSpanner.bound-details.left.text = \markup {
    \musicglyph #"scripts.trill" \raise #0.65 \teeny  { \sharp } 
}

fermata = <>^\markup { \translate #(cons 0.5 -3 ) \musicglyph #"scripts.ufermata" }

toCoda = <>^\markup \translate #'( 0 . 2 ) \huge \bold \musicglyph #"scripts.coda" 

hideGrace = {
    \once \hide NoteHead
    \once \hide Stem
    \once \override NoteHead.no-ledgers = ##t
    \once \override Glissando.bound-details.left.padding = #0.3
}

