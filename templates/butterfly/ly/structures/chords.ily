\include "../../flaming-libs/flaming-chords.ily"

chordsA = \chordmode { 
    c1:6.9 | s | d:9.11+ | s | 
    g1:13.9-.11+ | g:aug7.9-.11+ | 
}

chordsB = \chordmode { 
    f1:maj7 | f2:m7 bf:7 | ef1:maj7 | ef2:m7 af:7 | 
    df1:maj7 | g:9 | e2:m7.11 a:aug7.9- |
}

chordsC = \chordmode { 
    f1:6.9 | bf:9.11+ | e:m7.11 | s4 a2.:aug7.9- | 
    df1:maj7 
}

chordsIntro = \chordmode {
    c1:6.9 | s | s | s2 g:m9 || 
    c1:6.9 | s | s | s2 g:m9 || 
    gf1:7.9+ | s ||
}

chordsForm = \chordmode { 

    \chordsA | c1:maj9 | g:aug9 | 

    \chordsA | g1:m9 |  c1:9.11+ | 

    \chordsB | d2:m9 g:aug9 ||

    \chordsA | g2:m7 c:9 | gf1:7.9+ |

    \chordsC | g2:7 g2:7.5-.9- | c1:6 | s |
}

chordsCoda = \chordmode { 
    df1:maj7 | g2:9 g:7.5-.9- | c1:6.9 | s | 
    df1.:maj7 ||
    df1:maj7 | g2:9 g:7.5-.9- | c1:6.9 | s | 

    c1:6.9 | s | s | s2 g2:m9 ||
    c1:6.9 | s | gf:7.9+ | s | s | s | 
    c1:6 | s ||
}

chordsSong = \chordmode { 
    \set chordChanges = ##t 
    \set chordNameExceptions = #flamingChordExceptions
    \set noChordSymbol = ##f
    \tag SegmentHeadIn {
        \chordsForm 
        c1:6.9 | s2 g2:m9 ||
    }
    \tag SegmentSolos \chordsForm 
    \tag SegmentInstrumental \chordsForm
    \tag SegmentHeadOut {
        \chordsForm
        \chordsCoda
    }
}
chordsBass = \chordmode {  
    \set chordChanges = ##t  
    \set chordNameExceptions = #flamingChordExceptions 
    \chordsSong       
}
chordsLead = \chordmode {  
    \set chordChanges = ##t  
    \set chordNameExceptions = #flamingChordExceptions 
    \chordsSong       
}
chordsPart = \chordmode {  
    \set chordChanges = ##t  
    \set chordNameExceptions = #flamingChordExceptions 
    \chordsSong
}
