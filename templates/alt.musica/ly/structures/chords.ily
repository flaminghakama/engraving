\include "../../flaming-libs/flaming-chords.ily"

chordsACommon = \chordmode { 
    bf1:m7 | ef:7 | bf:m7 | ef:7 |
    bf1:m7 | ef:7 | bf:m7 | ef:7 |

    af1:m7 | df:7 | fs:m7 | b:7 |
    bf1:m7 | ef:7 | bf:m7 | ef:7 |

    af1:m7 | df:7 | fs:m7 | b:7 |
    bf1:m7 | ef:7 | 
}
chordsACommonForMidi = \chordmode { 
    r8 bf:m7 r bf:m7 r bf4.:m7 ~ | bf4:m7 ef8:7 ef8:7 ~ ef2:7 |
    r8 bf:m7 r bf:m7 r bf4.:m7 ~ | bf4:m7 ef8:7 ef8:7 ~ ef2:7 |
    r8 bf:m7 r bf:m7 r bf4.:m7 ~ | bf4:m7 ef8:7 ef8:7 ~ ef2:7 |
    r8 bf:m7 r bf:m7 r bf4.:m7 ~ | bf4:m7 ef8:7 ef8:7 ~ ef2:7 |

    r8 af:m7 r af:m7 r4 df4:7 ~ | 1 |
    r8 fs:m7 r fs:m7 r4 b4:7 ~ | 1 |
    r8 bf:m7 r bf:m7 r bf4.:m7 ~ | bf4:m7 ef8:7 ef8:7 ~ ef2:7 |
    r8 bf:m7 r bf:m7 r bf4.:m7 ~ | bf4:m7 ef8:7 ef8:7 ~ ef2:7 |

    r8 af:m7 r af:m7 r4 df4:7 ~ | 1 |
    r8 fs:m7 r fs:m7 r4 b4:7 ~ | 1 |
    r8 bf:m7 r bf:m7 r bf4.:m7 ~ | bf4:m7 ef8:7 ef8:7 ~ ef2:7 |
}
chordsACommonForFlats = \chordmode { 
    bf1:m7 | ef:7 | bf:m7 | ef:7 |
    bf1:m7 | ef:7 | bf:m7 | ef:7 |

    af1:m7 | df:7 | gf:m7 | cf:7 |
    bf1:m7 | ef:7 | bf:m7 | ef:7 |

    af1:m7 | df:7 | gf:m7 | cf:7 |
    bf1:m7 | ef:7 | 
}
chordsEndings = \chordmode { 
    bf1:m7 | ef:7 |
}
chordsEndingsForMidi = \chordmode { 
    bf4.:m7 bf4.:m7 ef4:7 | R1 |
}

chordsBridge = \chordmode { 
    d1 | s2 f:7 | bf1 | s2 cs:7 | 
    fs1 | s2 a:7 | d1 | gs2:m7 cs:7 | 

    b1:m | a2:m7.5- d:aug7 | g1:m | f2:m7.5- bf:aug 7 | 
    ef1:m | e2:m7 a:7 | d1 | fs2:m7 b:7 ||
}

chordsBridgeForMidi = \chordmode { 
    r4 r8 d r d r d | r4 d8 f:7 r2  | 
    r4 r8 bf r bf r bf | r4 bf8 cs:7 r2  | 
    r4 r8 fs r fs r fs | r4 fs8 a:7 r2  | 
    r4 r8 d r d r d | R1 | 
    
    r4 r8 b:m r b:m r b:m | r4 a8:m7.5- d:aug7 r2  | 
    r4 r8 g:m r g:m r g:m | r4 f8:m7.5- bf:aug7 r2  | 
    r4 r8 ef:m r ef:m r ef:m | r4 e8:m7.5- a:aug7 r2  | 
    r4 r8 d r fs:m7 r b:7 | R1 ||
}

chordsBridgeForFlats = \chordmode { 
    d1 | s2 f:7 | bf1 | s2 df:7 | 
    gf1 | s2 a:7 | d1 | af2:m7 df:7 | 

    cf1:m | a2:m7.5- d:aug7 | g1:m | f2:m7.5- bf:aug 7 | 
    ef1:m | e2:m7 a:7 | d1 | gf2:m7 cf:7 ||
}

chordsSong = \chordmode { 
    \set chordChanges = ##t 
    \set chordNameExceptions = #flamingChordExceptions
    \set noChordSymbol = ##f
    \tag SegmentAI {
        \tag #'PDF { s4 }
        \tag #'MIDI { s1 }
        \chordsACommon
        \chordsEndings
    }
    \tag SegmentAII {
        \chordsACommon
        \chordsEndings
    }
    \tag SegmentBIII {
        \chordsBridge
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


