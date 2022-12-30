\version "2.22.0"

defaultMarkingPadding = #1.3

% #(if (not (defined? 'markingPadding)) 
%     (define markingPadding defaultMarkingPadding)
% )

markingPadding = #1.3

dolce = <>^\markup \raise #markingPadding { \italic "dolce" }
rit = <>^\markup \raise #markingPadding { \italic "rit" } 
aTempo = <>^\markup \raise #markingPadding { \italic "a tempo" }
mezzoVoce = <>^\markup \raise #markingPadding { \italic "mezzo voce" }
sottoVoce = <>^\markup \raise #markingPadding { \italic "sotto voce" }

secondTimeOnly = <>^\markup \raise #markingPadding { \large \bold "2nd X Only" }
bothTimes = <>^\markup \raise #markingPadding { \large \bold "Both X" }
firstTime = <>^\markup \raise #markingPadding { \medium \bold "1st X" }
firstTimeBelow = <>_\markup \raise #markingPadding { \medium \bold "1st X" }
bothTimes = <>^\markup \raise #markingPadding { \medium \bold "both X" }
secondTime = <>^\markup \raise #markingPadding { \medium \bold "2nd X" }
secondTimeBelow = <>_\markup \raise #markingPadding { \medium \bold "2nd X" }
thirdTime = <>^\markup \raise #markingPadding { \medium \bold "3rd X" }
thirdTimeBelow = <>_\markup \raise #markingPadding { \medium \bold "3rd X" }
fourthTime = <>^\markup \raise #markingPadding { \medium \bold "4th X" }
fourthTimeBelow = <>_\markup \raise #markingPadding { \medium \bold "4th X" }

div = <>^\markup \raise #markingPadding "div."
unis = <>^\markup \raise #markingPadding "unis."
solo = <>^\markup \raise #markingPadding "Solo"
tutti = <>^\markup \raise #markingPadding "Tutti" 
sim = <>^\markup \raise #markingPadding "sim."

pizz = <>^\markup \raise #markingPadding \italic "pizz."
lhPizz = <>^\markup \raise #markingPadding \italic "l.h. pizz."
arco = <>^\markup \raise #markingPadding \italic "arco" 
stillArco = <>^\markup \raise #markingPadding { "(" \italic arco ")" } 
soli = <>^\markup \raise #markingPadding \italic "Soli" 
marcato = <>^\markup \raise #markingPadding \italic "marcato" 
ponticello = <>^\markup \raise #markingPadding \italic "ponticello" 
avecSourdine = <>^\markup \raise #markingPadding \italic "avec sourdine" 
conSord = <>^\markup \raise #markingPadding \italic "con sord." 
senzaSord = <>^\markup \raise #markingPadding \italic "senza sord." 
reminderSenzaSord = <>^\markup \raise #markingPadding \italic "( senza sord. )" 
muted = <>^\markup \raise #markingPadding \italic \column { \lower #1.25 "con" "sord." }
notMuted = <>^\markup \raise #markingPadding \italic \column { \lower #1.25 "senza" "sord." }
natural = <>^\markup \raise #markingPadding \italic "natural" 
nat = <>^\markup \raise #markingPadding \italic "nat." 
offTheString = <>^\markup \raise #markingPadding \italic "off the string" 
spicc = <>^\markup \raise #markingPadding \italic "spicc." 
sulPont = <>^\markup \raise #markingPadding \italic "sul pont." 
saltando = <>^\markup \raise #markingPadding \italic "saltando" 
salt = <>^\markup \raise #markingPadding \italic "salt." 
legato = <>^\markup \raise #markingPadding \italic "legato" 
soli = <>^\markup \raise #markingPadding \italic "Soli" 
onCue = <>^\markup \raise #markingPadding "On Cue" 
open = <>^\markup \raise #markingPadding "Open" 
clap = <>^\markup \raise #markingPadding \bold "Clap"
snap = <>^\markup \raise #markingPadding \bold "Snap"

snare = <>_\markup \raise #markingPadding \bold "snare"
cymb = <>_\markup \raise #markingPadding \bold "cymb."
abekor = <>_\markup \raise #markingPadding \bold "Abekor groove"
ride = <>^\markup \italic "ride" 
hihat = <>^\markup \italic "hi-hat"

cueFlute = <>^\markup \raise #markingPadding \italic "flute"
cuePiccolo = <>^\markup \raise #markingPadding \italic "piccolo"
cueOboe = <>^\markup \raise #markingPadding \italic "oboe"
cueEnglishHorn = <>^\markup \raise #markingPadding \italic "English horn"
cueClarinet = <>^\markup \raise #markingPadding \italic "clarinet"
cueBassClarinet = <>^\markup \raise #markingPadding \italic "bass cl."
cueBassoon = <>^\markup \raise #markingPadding \italic "bassoon"
cueTrumpet = <>^\markup \raise #markingPadding \italic "trumpet"
cueHorn = <>^\markup \raise #markingPadding \italic "horn"

cueVoice = <>^\markup \raise #markingPadding \italic "voice"

cueViolinSolo = <>^\markup \raise #markingPadding \italic "solo violin"
cueViolinI = <>^\markup \raise #markingPadding \italic "violin I"
cueViolinII = <>^\markup \raise #markingPadding \italic "violin II"
cueViola = <>^\markup \raise #markingPadding \italic "viola"
cueCello = <>^\markup \raise #markingPadding \italic "'cello"
cueBass = <>^\markup \raise #markingPadding \italic "bass"

cueBelowFlute = <>_\markup \raise #markingPadding \italic "flute"
cueBelowPiccolo = <>_\markup \raise #markingPadding \italic "piccolo"
cueBelowOboe = <>_\markup \raise #markingPadding \italic "oboe"
cueBelowEnglishHorn = <>_\markup \raise #markingPadding \italic "English horn"
cueBelowClarinet = <>_\markup \raise #markingPadding \italic "clarinet"
cueBelowBassClarinet = <>_\markup \raise #markingPadding \italic "bass cl."
cueBelowBassoon = <>_\markup \raise #markingPadding \italic "bassoon"
cueBelowTrumpet = <>_\markup \raise #markingPadding \italic "trumpet"
cueBelowHorn = <>_\markup \raise #markingPadding \italic "horn"

cueBelowVoice = <>_\markup \raise #markingPadding { \italic "voice" }

cueBelowViolinSolo = <>_\markup \raise #markingPadding { \italic "solo violin" }
cueBelowViolinI = <>_\markup \raise #markingPadding { \italic "violin I" }
cueBelowViolinII = <>_\markup \raise #markingPadding { \italic "violin II" }
cueBelowViola = <>_\markup \raise #markingPadding { \italic "viola" }
cueBelowCello = <>_\markup \raise #markingPadding { \italic "'cello" }
cueBelowBass = <>_\markup \raise #markingPadding { \italic "bass" }

% 2.19
% toCoda = <>^\markup \translate #'( 0 . 2 ) \huge \bold \musicglyph "scripts.coda" 
% dsAlCoda = <>^\markup { \bold \huge "D.S. al" \translate #'(-2 . 0.8) \small \musicglyph "scripts.coda" }

% 2.22
% toCoda = <>^\markup \translate #'( 0.5 . 2 ) \huge \bold \musicglyph "scripts.coda" 
% dsAlCoda = <>^\markup { \bold \huge "D.S. al" \translate #'(-2 . 0.8) \small \musicglyph "scripts.coda" }

