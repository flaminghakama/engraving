INSTRUMENTSong = \relative c {     

    \tag SegmentIntro {
        s1*8
        s1*2
    }
    \tag SegmentHeadIn {
        % A1
        s1*8
        % A2
        s1*8
        % B3
        s1*8
        % A4
        s1*8
        % C5
        s1*8
        s1*2
    }
    \tag SegmentSolos {
        % A6
        s1*8
        % A7
        s1*8
        % B8
        s1*8        
        % A9
        s1*8
        % C10
        s1*8
    }
    \tag SegmentInstrumental {
        % A11
        s1*8
        % A12
        s1*8
        % B13
        s1*8        
        % C14
        s1*8
    }
    \tag SegmentHeadOut {
        % A15
        s1*8
        % A16
        s1*8
        % B17
        s1*8
        % A18
        s1*8
        % C19
        s1*8
        % Coda
        s1*4
        s1.
        s1*4
        % 4 bar repeat:
        s1*4
        s1*8
    }
}

INSTRUMENTGlobal = \globalSong \INSTRUMENTSong
