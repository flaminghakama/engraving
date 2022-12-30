\version "2.19.81" 

#(define-markup-command (formatInstrumentName layout props text) (markup?)
    "Prepend spaces to text."
    (interpret-markup layout props
        #{
        	\markup \line { "   "  #text }
        #}
    )
)

#(define-markup-command (formatInstrumentTitle layout props text) (markup?)
    "Prepend spaces to text."
    (interpret-markup layout props
        #{
        	\markup \line { " "  #text }
        #}
    )
)

fluteNameOnly = "Flute"
altoFluteNameOnly = "Alto Flute in G"
piccoloNameOnly = "Piccolo"

englishHornNameOnly = "English Horn in F"
englishHornForClarinetNameOnly = \markup \center-column { "English Horn in F" "( for Clarinet )" }

bassoonNameOnly = "Bassoon"
bassoonForClarinetNameOnly = \markup \center-column { "Bassoon" "( for Clarinet )" }
bassoonForBassClarinetNameOnly = \markup \center-column { "Bassoon" "( for Bass Clarinet )" }
bassoonForEnglishHornNameOnly = \markup \center-column { "Bassoon" "( for English Horn )" }

clarinetForBassClarinetNameOnly = \markup \center-column { "Clarinet in A" "( for Bass Clarinet )" }
clarinetInBbNameOnly = \markup \concat { "Clarinet in B" \teeny " " \raise #0.6 \flat }
soloClarinetInANameOnly = "Solo Clarinet in A"
clarinetNameOnly = "Clarinet in A"
clarinetInAName = \clarinetNameOnly

bassClarinetNameOnly = \markup \concat { "Bass Clarinet in B" \teeny " " \raise #0.6 \flat }
bassClarinetForBassoonNameOnly = \markup \center-column { \concat { "Bass Clarinet in B" \teeny " " \raise #0.6 \flat }  "( for Bassoon )" }
bassClarinetForClarinetNameOnly = \markup \center-column { \concat { "Bass Clarinet in B" \teeny " " \raise #0.6 \flat } "( for Clarinet )" }

sopranoSaxophoneNameOnly = \markup \concat  { "Soprano Saxophone in B" \teeny " " \raise #0.6 \flat }
soloSopranoSaxophoneNameOnly = \markup \concat  { "Solo Soprano Saxophone in B" \teeny " " \raise #0.6 \flat }
soloSopSaxNameOnly = \markup \concat { "Solo Sop. Sax in B" \raise #0.6 \flat }
altoSaxophoneForEnglishHornNameOnly = \markup \center-column { \concat { "Alto Saxophone in E" \raise #0.6 \flat } "( for English Horn )"}
soloAltoSaxophoneNameOnly = \markup \concat { "Solo Alto Saxophone in E" \hspace #0.1 \raise #0.35 \flat }
soloAltoSaxNameOnly = \markup \concat { "Solo Alto Sax in E" \hspace #0.1 \raise #0.35 \flat }
altoSaxophoneNameOnly = \markup \concat { "Alto Saxophone in E" \hspace #0.1 \raise #0.35 \flat }
altoSaxophoneINameOnly = \markup \concat { "Alto Saxophone I in E" \hspace #0.1 \raise #0.35 \flat }
altoSaxophoneIINameOnly = \markup \concat { "Alto Saxophone II in E" \hspace #0.1 \raise #0.35 \flat }
soloTenorSaxophoneNameOnly = \markup \concat { "Solo Tenor Saxophone in B" \hspace #0.1 \raise #0.35 \flat }
soloTenorSaxNameOnly = \markup \concat { "Solo Tenor Sax in B" \hspace #0.1 \raise #0.35 \flat }
tenorSaxophoneNameOnly = \markup \concat { "Tenor Saxophone in B" \hspace #0.1 \raise #0.35 \flat }
tenorSaxophoneINameOnly = \markup \concat { "Tenor Saxophone I in B" \hspace #0.1 \raise #0.35 \flat }
tenorSaxophoneIINameOnly = \markup \concat { "Tenor Saxophone II in B" \hspace #0.1 \raise #0.35 \flat }
baritoneSaxophoneNameOnly = \markup \concat { "Baritone Saxophone in E" \hspace #0.1 \raise #0.35 \flat }

trumpetNameOnly = \markup \concat { "Trumpet in B" \teeny " " \hspace #0.1 \raise #0.35 \flat }
trumpetINameOnly = \markup \concat { "Trumpet I in B" \teeny " " \hspace #0.1 \raise #0.35 \flat }
trumpetIINameOnly = \markup \concat { "Trumpet II in B" \teeny " " \hspace #0.1 \raise #0.35 \flat }
trumpetIIINameOnly = \markup \concat { "Trumpet III in B" \teeny " " \hspace #0.1 \raise #0.35 \flat }
trumpetIVNameOnly = \markup \concat { "Trumpet IV in B" \teeny " " \hspace #0.1 \raise #0.35 \flat }
tromboneNameOnly = "Trombone"
tromboneINameOnly = "Trombone I"
tromboneIINameOnly = "Trombone II"
tromboneIIINameOnly = "Trombone III"
tromboneIVNameOnly = "Trombone IV"

hornNameOnly = \markup \concat { "Horn in F" }

voiceNameOnly = "Voice"

claveNameOnly = "Clave"
drumsNameOnly = "Drums"
tympaniNameOnly = "Tympani"

pianoNameOnly = "Piano"

arpeggioneNameOnly = "Arpeggione"

violinNameOnly = "Violin"
violinINameOnly = "Violin I"
violinIINameOnly = "Violin II"
violinOneNameOnly = "Violin 1"
violinTwoNameOnly = "Violin 2"
violaNameOnly = "Viola"
celloNameOnly = "'Cello"
bassNameOnly = "Bass"

leadSheetNameOnly = "Lead Sheet"
rhythmNameOnly = "Rhythm"

%%%%%%%%%%%%%%%%%

fluteName = \markup \formatInstrumentName \fluteNameOnly
altoFluteName = \markup \formatInstrumentName \altoFluteNameOnly
piccoloName = \markup \formatInstrumentName \piccoloNameOnly

englishHornName = \markup \formatInstrumentName \englishHornNameOnly
englishHornForClarinetName = \markup \formatInstrumentName \englishHornForClarinetNameOnly

bassoonName = \markup \formatInstrumentName \bassoonNameOnly
bassoonForClarinetName = \markup \formatInstrumentName \bassoonForClarinetNameOnly
bassoonForBassClarinetName = \markup \formatInstrumentName \bassoonForBassClarinetNameOnly
bassoonForEnglishHornName = \markup \formatInstrumentName \bassoonForEnglishHornNameOnly

clarinetForBassClarinetName = \markup \formatInstrumentName \clarinetForBassClarinetNameOnly
clarinetInBbName = \markup \formatInstrumentName \clarinetInBbNameOnly
soloClarinetInAName = \markup \formatInstrumentName \soloClarinetInANameOnly
clarinetName = \markup \formatInstrumentName \clarinetNameOnly
clarinetInAName = \clarinetName

bassClarinetName = \markup \formatInstrumentName \bassClarinetNameOnly
bassClarinetForBassoonName = \markup \formatInstrumentName \bassClarinetForBassoonNameOnly
bassClarinetForClarinetName = \markup \formatInstrumentName \bassClarinetForClarinetNameOnly

sopranoSaxophoneName = \markup \formatInstrumentName \sopranoSaxophoneNameOnly
soloSopranoSaxophoneName = \markup \formatInstrumentName \soloSopranoSaxophoneNameOnly
soloSopSaxName = \markup \formatInstrumentName \soloSopSaxNameOnly
altoSaxophoneForEnglishHornName = \markup \formatInstrumentName \altoSaxophoneForEnglishHornNameOnly
soloAltoSaxophoneName = \markup \formatInstrumentName \soloAltoSaxophoneNameOnly
soloAltoSaxName = \markup \formatInstrumentName \soloAltoSaxNameOnly
altoSaxophoneName = \markup \formatInstrumentName \altoSaxophoneNameOnly
altoSaxophoneIName = \markup \formatInstrumentName \altoSaxophoneINameOnly
altoSaxophoneIIName = \markup \formatInstrumentName \altoSaxophoneIINameOnly
soloTenorSaxophoneName = \markup \formatInstrumentName \soloTenorSaxophoneNameOnly
soloTenorSaxName = \markup \formatInstrumentName \soloTenorSaxNameOnly
tenorSaxophoneName = \markup \formatInstrumentName \tenorSaxophoneNameOnly
tenorSaxophoneIName = \markup \formatInstrumentName \tenorSaxophoneINameOnly
tenorSaxophoneIIName = \markup \formatInstrumentName \tenorSaxophoneIINameOnly
baritoneSaxophoneName = \markup \formatInstrumentName \baritoneSaxophoneNameOnly

trumpetName = \markup \formatInstrumentName \trumpetNameOnly
trumpetIName = \markup \formatInstrumentName \trumpetINameOnly
trumpetIIName = \markup \formatInstrumentName \trumpetIINameOnly
trumpetIIIName = \markup \formatInstrumentName \trumpetIIINameOnly
trumpetIVName = \markup \formatInstrumentName \trumpetIVNameOnly
tromboneName = \markup \formatInstrumentName \tromboneNameOnly
tromboneIName = \markup \formatInstrumentName \tromboneINameOnly
tromboneIIName = \markup \formatInstrumentName \tromboneIINameOnly
tromboneIIIName = \markup \formatInstrumentName \tromboneIIINameOnly
tromboneIVName = \markup \formatInstrumentName \tromboneIVNameOnly

hornName = \markup \formatInstrumentName \hornNameOnly

voiceName = \markup \formatInstrumentName \voiceNameOnly

claveName = \markup \formatInstrumentName \claveNameOnly
drumsName = \markup \formatInstrumentName \drumsNameOnly
tympaniName = \markup \formatInstrumentName \tympaniNameOnly

pianoName = \markup \formatInstrumentName \pianoNameOnly

arpeggioneName = \markup \formatInstrumentName \arpeggioneNameOnly
violinName = \markup \formatInstrumentName \violinNameOnly
violinIName = \markup \formatInstrumentName \violinINameOnly
violinIIName = \markup \formatInstrumentName \violinIINameOnly
violinOneName = \markup \formatInstrumentName \violinOneNameOnly
violinTwoName = \markup \formatInstrumentName \violinTwoNameOnly
violaName = \markup \formatInstrumentName \violaNameOnly
celloName = \markup \formatInstrumentName \celloNameOnly
bassName = \markup \formatInstrumentName \bassNameOnly

leadSheetName = \markup \formatInstrumentName \leadSheetNameOnly
rhythmName = \markup \formatInstrumentName \rhythmNameOnly


%%%%%%%%%%%%%%%%%

fluteTitle = \markup \formatInstrumentTitle \fluteNameOnly
altoFluteTitle = \markup \formatInstrumentTitle \altoFluteNameOnly
piccoloTitle = \markup \formatInstrumentTitle \piccoloNameOnly

englishHornTitle = \markup \formatInstrumentTitle \englishHornNameOnly
englishHornForClarinetTitle = \markup \formatInstrumentTitle \englishHornForClarinetNameOnly

bassoonTitle = \markup \formatInstrumentTitle \bassoonNameOnly
bassoonForClarinetTitle = \markup \formatInstrumentTitle \bassoonForClarinetNameOnly
bassoonForBassClarinetTitle = \markup \formatInstrumentTitle \bassoonForBassClarinetNameOnly
bassoonForEnglishHornTitle = \markup \formatInstrumentTitle \bassoonForEnglishHornNameOnly

clarinetForBassClarinetTitle = \markup \formatInstrumentTitle \clarinetForBassClarinetNameOnly
clarinetInBbTitle = \markup \formatInstrumentTitle \clarinetInBbNameOnly
soloClarinetInATitle = \markup \formatInstrumentTitle \soloClarinetInANameOnly
clarinetTitle = \markup \formatInstrumentTitle \clarinetNameOnly
clarinetInAName = \clarinetName

bassClarinetTitle = \markup \formatInstrumentTitle \bassClarinetNameOnly
bassClarinetForBassoonTitle = \markup \formatInstrumentTitle \bassClarinetForBassoonNameOnly
bassClarinetForClarinetTitle = \markup \formatInstrumentTitle \bassClarinetForClarinetNameOnly

sopranoSaxophoneTitle = \markup \formatInstrumentTitle \sopranoSaxophoneNameOnly
soloSopranoSaxophoneTitle = \markup \formatInstrumentTitle \soloSopranoSaxophoneNameOnly
soloSopSaxTitle = \markup \formatInstrumentTitle \soloSopSaxNameOnly
altoSaxophoneForEnglishHornTitle = \markup \formatInstrumentTitle \altoSaxophoneForEnglishHornNameOnly
soloAltoSaxophoneTitle = \markup \formatInstrumentTitle \soloAltoSaxophoneNameOnly
soloAltoSaxTitle = \markup \formatInstrumentTitle \soloAltoSaxNameOnly
altoSaxophoneITitle = \markup \formatInstrumentTitle \altoSaxophoneINameOnly
altoSaxophoneIITitle = \markup \formatInstrumentTitle \altoSaxophoneIINameOnly
soloTenorSaxophoneTitle = \markup \formatInstrumentTitle \soloTenorSaxophoneNameOnly
soloTenorSaxTitle = \markup \formatInstrumentTitle \soloTenorSaxNameOnly
tenorSaxophoneITitle = \markup \formatInstrumentTitle \tenorSaxophoneINameOnly
tenorSaxophoneIITitle = \markup \formatInstrumentTitle \tenorSaxophoneIINameOnly
baritoneSaxophoneTitle = \markup \formatInstrumentTitle \baritoneSaxophoneNameOnly

trumpetITitle = \markup \formatInstrumentTitle \trumpetINameOnly
trumpetIITitle = \markup \formatInstrumentTitle \trumpetIINameOnly
trumpetIIITitle = \markup \formatInstrumentTitle \trumpetIIINameOnly
trumpetIVTitle = \markup \formatInstrumentTitle \trumpetIVNameOnly
tromboneITitle = \markup \formatInstrumentTitle \tromboneINameOnly
tromboneIITitle = \markup \formatInstrumentTitle \tromboneIINameOnly
tromboneIIITitle = \markup \formatInstrumentTitle \tromboneIIINameOnly
tromboneIVTitle = \markup \formatInstrumentTitle \tromboneIVNameOnly

voiceTitle = \markup \formatInstrumentTitle \voiceNameOnly

claveTitle = \markup \formatInstrumentTitle \claveNameOnly
drumsTitle = \markup \formatInstrumentTitle \drumsNameOnly
tympaniTitle = \markup \formatInstrumentTitle \tympaniNameOnly

pianoTitle = \markup \formatInstrumentTitle \pianoNameOnly

arpeggioneTitle = \markup \formatInstrumentTitle \arpeggioneNameOnly
violinTitle = \markup \formatInstrumentTitle \violinNameOnly
violinITitle = \markup \formatInstrumentTitle \violinINameOnly
violinIITitle = \markup \formatInstrumentTitle \violinIINameOnly
violinOneTitle = \markup \formatInstrumentTitle \violinOneNameOnly
violinTwoTitle = \markup \formatInstrumentTitle \violinTwoNameOnly
violaTitle = \markup \formatInstrumentTitle \violaNameOnly
celloTitle = \markup \formatInstrumentTitle \celloNameOnly
bassTitle = \markup \formatInstrumentTitle \bassNameOnly

leadSheetTitle = \markup \formatInstrumentTitle \leadSheetNameOnly
rhythmTitle = \markup \formatInstrumentTitle \rhythmNameOnly




corAMarkup = \markup \raise #markingPadding { \italic "cor. a." } 
corA = <>^\corAMarkup
corABelow = <>_\corAMarkup
fluteMarkup = \markup \raise #markingPadding { \italic "flute" } 
flute = <>^\fluteMarkup
fluteBelow = <>_\fluteMarkup
bClMarkup = \markup \raise #markingPadding { \italic "b. cl." } 
bCl = <>^\bClMarkup
bClBelow = <>_\bClMarkup
violinIMarkup = \markup \raise #markingPadding { \italic "violin I" } 
violinI = <>^\violinIMarkup
violinIBelow = <>_\violinIMarkup
violinIIMarkup = \markup \raise #markingPadding { \italic "violin II" } 
violinII = <>^\violinIIMarkup
violinIIBelow = <>_\violinIIMarkup
violaMarkup = \markup \raise #markingPadding { \italic "viola" } 
viola = <>^\violaMarkup
violaBelow = <>_\violaMarkup
celloMarkup = \markup \raise #markingPadding { \italic "'cello" } 
cello = <>^\celloMarkup
celloBelow = <>_\celloMarkup
bassMarkup = \markup \raise #markingPadding { \italic "bass" } 
bass = <>^\bassMarkup
bassBelow = <>_\bassMarkup
voiceCueMarkup = \markup \raise #markingPadding { \italic "voice" } 
voiceCue = <>^\voiceCueMarkup
voiceCueBelow = <>_\voiceCueMarkup
