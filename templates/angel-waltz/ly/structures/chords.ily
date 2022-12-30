\include "../../flaming-libs/flaming-chords.ily"


chordsSong = \chordmode { 
    \set chordChanges = ##t 
    \set chordNameExceptions = #flamingChordExceptions
    \set noChordSymbol = ##f

}
chordsLead = \chordmode {  
    \set chordChanges = ##t  
    \set chordNameExceptions = #flamingChordExceptions 
    \chordsSong       
}
