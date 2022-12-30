INSTRUMENTSong = \relative c {     
    \tag SegmentAI {
        \tag #'PDF { s4 }
        \tag #'MIDI { s1 }
        s1*24
    }
    \tag SegmentAII {
        s1*24
    }
    \tag SegmentBIII {
        s1*16
    }
}

INSTRUMENTGlobal = \globalSong \INSTRUMENTSong
