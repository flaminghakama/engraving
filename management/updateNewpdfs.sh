# this script is in engraving/management
# run this out of the engraving/scores directory
# copies PDFs from git repos into a file structure like newpdfs/TRANSPOSITION/ALBUM


transpositions="for-C for-Bb for-Eb"
for transposition in $transpositions ; do 
	if [ ! -d "newpdfs/$transposition" ]; then
		mkdir newpdfs/$transposition
	fi
	if [ ! -d "newpdfs/all-songs-$transposition" ]; then
		mkdir newpdfs/all-songs-$transposition
	fi
	if [ ! -d "newpdfs/all-songs-all-transpositions" ]; then
		mkdir newpdfs/all-songs-all-transpositions
	fi
done

albums="I-inaugural-jazz III-exploring-traditions II-jazz-symphony IV-modern-jazz V-west-coast-jazz VI-lyrical-immersion VII-jazz-combustion-uprising VIII-political-lyrics IX-period-jazz X-adventurous-instrumentals"
for transposition in $transpositions ; do for album in $albums ; do 
	if [ ! -d "newpdfs/$transposition/$album" ]; then
		mkdir newpdfs/$transposition/$album
	fi
done ; done 


score=inaugural-jazz
album=I-inaugural-jazz
songs="blue-choice days enclosure forgotten-aspect in-a-ditch nuclear-waste prodigal-silence shoe-connotations subversion the-cry"
for song in $songs ; do for transposition in $transpositions ; do cp $score/pdf/$song/$song-Lead-Sheet-$transposition.pdf newpdfs/$transposition/$album ; done ; done 
for song in $songs ; do for transposition in $transpositions ; do cp $score/pdf/$song/$song-Lead-Sheet-$transposition.pdf newpdfs/all-songs-$transposition ; done ; done 
for song in $songs ; do for transposition in $transpositions ; do cp $score/pdf/$song/$song-Lead-Sheet-$transposition.pdf newpdfs/all-songs-all-transpositions ; done ; done 

cp inaugural-jazz/pdf/in-a-ditch/in-a-ditch-Melody-Counterpoint-for-C.pdf newpdfs/for-C/I-inaugural-jazz
cp inaugural-jazz/pdf/in-a-ditch/in-a-ditch-Melody-Counterpoint-for-C.pdf newpdfs/all-songs-for-C
cp inaugural-jazz/pdf/in-a-ditch/in-a-ditch-Melody-Counterpoint-for-C.pdf newpdfs/all-songs-all-transpositions


score=jazz-symphony
album=II-jazz-symphony
songs="this-unmemorable-evening november-longing tarragon"

for song in $songs ; do for transposition in $transpositions ; do cp $score/pdf/$song/$song-Lead-Sheet-$transposition.pdf newpdfs/$transposition/$album ; done ; done 
for song in $songs ; do for transposition in $transpositions ; do cp $score/pdf/$song/$song-Lead-Sheet-$transposition.pdf newpdfs/all-songs-$transposition ; done ; done 
for song in $songs ; do for transposition in $transpositions ; do cp $score/pdf/$song/$song-Lead-Sheet-$transposition.pdf newpdfs/all-songs-all-transpositions ; done ; done 

for transposition in $transpositions ; do cp $score/pdf/a-last-look-at-love/a-last-look-at-love-Lead-Sheet-in-F-minor-$transposition.pdf newpdfs/$transposition/$album ; done
for transposition in $transpositions ; do cp $score/pdf/a-last-look-at-love/a-last-look-at-love-Lead-Sheet-in-F-minor-$transposition.pdf newpdfs/all-songs-$transposition ; done
for transposition in $transpositions ; do cp $score/pdf/a-last-look-at-love/a-last-look-at-love-Lead-Sheet-in-F-minor-$transposition.pdf newpdfs/all-songs-all-transpositions ; done

for transposition in $transpositions ; do cp $score/pdf/listening/listening-Lead-Sheet-in-Bb-minor-$transposition.pdf newpdfs/$transposition/$album ; done
for transposition in $transpositions ; do cp $score/pdf/listening/listening-Lead-Sheet-in-Bb-minor-$transposition.pdf newpdfs/all-songs-$transposition ; done
for transposition in $transpositions ; do cp $score/pdf/listening/listening-Lead-Sheet-in-Bb-minor-$transposition.pdf newpdfs/all-songs-all-transpositions ; done

for transposition in $transpositions ; do cp $score/pdf/faith/faith-Lead-Sheet-in-E-$transposition.pdf newpdfs/$transposition/$album ; done
for transposition in $transpositions ; do cp $score/pdf/faith/faith-Lead-Sheet-in-E-$transposition.pdf newpdfs/all-songs-$transposition ; done
for transposition in $transpositions ; do cp $score/pdf/faith/faith-Lead-Sheet-in-E-$transposition.pdf newpdfs/all-songs-all-transpositions ; done


score=jazz-combustion
album=III-exploring-traditions
songs="popcorn annes-eyes nancy-joe spring-to-mission-hill the-end-of-bebop tranes-sound windows latin-blues"

for song in $songs ; do for transposition in $transpositions ; do cp $score/pdf/$song/$song-Lead-Sheet-$transposition.pdf newpdfs/$transposition/$album ; done ; done 
for song in $songs ; do for transposition in $transpositions ; do cp $score/pdf/$song/$song-Lead-Sheet-$transposition.pdf newpdfs/all-songs-$transposition ; done ; done 
for song in $songs ; do for transposition in $transpositions ; do cp $score/pdf/$song/$song-Lead-Sheet-$transposition.pdf newpdfs/all-songs-all-transpositions ; done ; done 


score=journeythem-instrumentals
album=IV-modern-jazz
songs="fade as-it-was nancy the-maze state the-call-from-a-redhead sambo-sambae for-the-death-of-my-friends once-again stomping-ground"
for song in $songs ; do for transposition in $transpositions ; do cp $score/pdf/$song/$song-Lead-Sheet-$transposition.pdf newpdfs/$transposition/$album ; done ; done 
for song in $songs ; do for transposition in $transpositions ; do cp $score/pdf/$song/$song-Lead-Sheet-$transposition.pdf newpdfs/all-songs-$transposition ; done ; done 
for song in $songs ; do for transposition in $transpositions ; do cp $score/pdf/$song/$song-Lead-Sheet-$transposition.pdf newpdfs/all-songs-all-transpositions ; done ; done 


score=journeythem-instrumentals
album=V-west-coast-jazz
songs="the-nymph cole-st just-a-dead-ringer-for-monica-lewinsky presque-tire-sale-in-gods-country three-out-of-four-nights sixteen-k-is-a-lot-of-kim dusk-in-the-courtyard mossad lamoureuse-de-mon-pere apricot-admissions scarlet-rust-blouse the-rhythm-method"

for song in $songs ; do for transposition in $transpositions ; do cp $score/pdf/$song/$song-Lead-Sheet-$transposition.pdf newpdfs/$transposition/$album ; done ; done 
for song in $songs ; do for transposition in $transpositions ; do cp $score/pdf/$song/$song-Lead-Sheet-$transposition.pdf newpdfs/all-songs-$transposition ; done ; done 
for song in $songs ; do for transposition in $transpositions ; do cp $score/pdf/$song/$song-Lead-Sheet-$transposition.pdf newpdfs/all-songs-all-transpositions ; done ; done 

for transposition in $transpositions ; do cp $score/pdf/dusk-in-the-courtyard/dusk-in-the-courtyard-Lead-Sheet-single-page-$transposition.pdf newpdfs/$transposition/$album ; done
for transposition in $transpositions ; do cp $score/pdf/presque-tire-sale-in-gods-country/presque-tire-sale-in-gods-country-Lead-Sheet-single-page-$transposition.pdf newpdfs/$transposition/$album ; done


score=lyrical-compositions
album=VI-lyrical-immersion
songs="just-a-cup-of-coffee news-from-milan palo-alto-susan seven-oclock-tune frivolity mark-time elaine"
for song in $songs ; do for transposition in $transpositions ; do cp $score/pdf/$song/$song-Lead-Sheet-$transposition.pdf newpdfs/$transposition/$album ; done ; done
for song in $songs ; do for transposition in $transpositions ; do cp $score/pdf/$song/$song-Lead-Sheet-$transposition.pdf newpdfs/all-songs-$transposition ; done ; done 
for song in $songs ; do for transposition in $transpositions ; do cp $score/pdf/$song/$song-Lead-Sheet-$transposition.pdf newpdfs/all-songs-all-transpositions ; done ; done 

for transposition in $transpositions ; do cp $score/pdf/catch-me/catch-me-Lead-Sheet-in-F-minor-$transposition.pdf newpdfs/$transposition/$album ; done
for transposition in $transpositions ; do cp $score/pdf/force-of-nature/force-of-nature-Lead-Sheet-in-E-$transposition.pdf newpdfs/$transposition/$album ; done
for transposition in $transpositions ; do cp $score/pdf/jasmine/jasmine-Lead-Sheet-in-C-$transposition.pdf newpdfs/$transposition/$album ; done
for transposition in $transpositions ; do cp $score/pdf/a-classic-base/a-classic-base-Lead-Sheet-in-D-$transposition.pdf newpdfs/$transposition/$album ; done
for transposition in $transpositions ; do cp $score/pdf/roberta-roberta/roberta-roberta-Lead-Sheet-in-Gb-$transposition.pdf newpdfs/$transposition/$album ; done

for transposition in $transpositions ; do cp $score/pdf/catch-me/catch-me-Lead-Sheet-in-F-minor-$transposition.pdf newpdfs/all-songs-$transposition ; done
for transposition in $transpositions ; do cp $score/pdf/force-of-nature/force-of-nature-Lead-Sheet-in-E-$transposition.pdf newpdfs/all-songs-$transposition ; done
for transposition in $transpositions ; do cp $score/pdf/jasmine/jasmine-Lead-Sheet-in-C-$transposition.pdf newpdfs/all-songs-$transposition ; done
for transposition in $transpositions ; do cp $score/pdf/a-classic-base/a-classic-base-Lead-Sheet-in-D-$transposition.pdf newpdfs/all-songs-$transposition ; done
for transposition in $transpositions ; do cp $score/pdf/roberta-roberta/roberta-roberta-Lead-Sheet-in-Gb-$transposition.pdf newpdfs/all-songs-$transposition ; done

for transposition in $transpositions ; do cp $score/pdf/catch-me/catch-me-Lead-Sheet-in-F-minor-$transposition.pdf newpdfs/all-songs-all-transpositions ; done
for transposition in $transpositions ; do cp $score/pdf/force-of-nature/force-of-nature-Lead-Sheet-in-E-$transposition.pdf newpdfs/all-songs-all-transpositions ; done
for transposition in $transpositions ; do cp $score/pdf/jasmine/jasmine-Lead-Sheet-in-C-$transposition.pdf newpdfs/all-songs-all-transpositions ; done
for transposition in $transpositions ; do cp $score/pdf/a-classic-base/a-classic-base-Lead-Sheet-in-D-$transposition.pdf newpdfs/all-songs-all-transpositions ; done
for transposition in $transpositions ; do cp $score/pdf/roberta-roberta/roberta-roberta-Lead-Sheet-in-Gb-$transposition.pdf newpdfs/all-songs-all-transpositions ; done


score=jazz-combustion
album=VII-jazz-combustion-uprising
songs="44-magnum series-of-adjustments cupcake-flavor-profile oxtail-soup aphrodites-girl-friday promises-broken linsanity no-time-like-the-present-future"

for song in $songs ; do for transposition in $transpositions ; do cp $score/pdf/$song/$song-Lead-Sheet-$transposition.pdf newpdfs/$transposition/$album ; done ; done 
for song in $songs ; do for transposition in $transpositions ; do cp $score/pdf/$song/$song-Lead-Sheet-$transposition.pdf newpdfs/all-songs-$transposition ; done ; done 
for song in $songs ; do for transposition in $transpositions ; do cp $score/pdf/$song/$song-Lead-Sheet-$transposition.pdf newpdfs/all-songs-all-transpositions ; done ; done 

score=lyrical-compositions
album=VIII-political-lyrics
songs="bike-lanes rising we-declare"
for song in $songs ; do for transposition in $transpositions ; do cp $score/pdf/$song/$song-Lead-Sheet-$transposition.pdf newpdfs/$transposition/$album ; done ; done
for song in $songs ; do for transposition in $transpositions ; do cp $score/pdf/$song/$song-Lead-Sheet-$transposition.pdf newpdfs/all-songs-$transposition ; done ; done 
for song in $songs ; do for transposition in $transpositions ; do cp $score/pdf/$song/$song-Lead-Sheet-$transposition.pdf newpdfs/all-songs-all-transpositions ; done ; done 

cp lyrical-compositions/pdf/we-declare/we-declare-Bass-for-C.pdf newpdfs/for-C/VIII-political-lyrics
cp lyrical-compositions/pdf/we-declare/we-declare-Bass-for-C.pdf newpdfs/all-songs-for-C
cp lyrical-compositions/pdf/we-declare/we-declare-Bass-for-C.pdf newpdfs/all-songs-all-transpositions

cp lyrical-compositions/pdf/we-declare/we-declare-Voice-for-C.pdf newpdfs/for-C/VIII-political-lyrics
cp lyrical-compositions/pdf/we-declare/we-declare-Voice-for-C.pdf newpdfs/all-songs-for-C
cp lyrical-compositions/pdf/we-declare/we-declare-Voice-for-C.pdf newpdfs/all-songs-all-transpositions

cp lyrical-compositions/pdf/we-declare/we-declare-Voice-for-Bb.pdf newpdfs/for-Bb/VIII-political-lyrics
cp lyrical-compositions/pdf/we-declare/we-declare-Voice-for-Bb.pdf newpdfs/all-songs-for-Bb
cp lyrical-compositions/pdf/we-declare/we-declare-Voice-for-Bb.pdf newpdfs/all-songs-all-transpositions

cp lyrical-compositions/pdf/we-declare/we-declare-Voice-for-Eb.pdf newpdfs/for-Eb/VIII-political-lyrics
cp lyrical-compositions/pdf/we-declare/we-declare-Voice-for-Eb.pdf newpdfs/all-songs-for-Eb
cp lyrical-compositions/pdf/we-declare/we-declare-Voice-for-Eb.pdf newpdfs/all-songs-all-transpositions


score=jazz-combustion
album=IX-period-jazz
songs="hot-swing kickin-the-can thick-as-a-nickel licorice-schtick swampy bouncy-jump steppin-jive"

for song in $songs ; do for transposition in $transpositions ; do cp $score/pdf/$song/$song-Lead-Sheet-$transposition.pdf newpdfs/$transposition/$album ; done ; done 
for song in $songs ; do for transposition in $transpositions ; do cp $score/pdf/$song/$song-Lead-Sheet-$transposition.pdf newpdfs/all-songs-$transposition ; done ; done 
for song in $songs ; do for transposition in $transpositions ; do cp $score/pdf/$song/$song-Lead-Sheet-$transposition.pdf newpdfs/all-songs-all-transpositions ; done ; done 

for transposition in $transpositions ; do cp $score/pdf/wag-that-tail/wag-that-tail-Lead-Sheet-in-Eb-$transposition.pdf newpdfs/$transposition/$album ; done
for transposition in $transpositions ; do cp $score/pdf/wag-that-tail/wag-that-tail-Lead-Sheet-in-Eb-$transposition.pdf newpdfs/all-songs-$transposition ; done
for transposition in $transpositions ; do cp $score/pdf/wag-that-tail/wag-that-tail-Lead-Sheet-in-Eb-$transposition.pdf newpdfs/all-songs-all-transpositions ; done


score=adventurous-instrumentals
album=X-adventurous-instrumentals
songs="big-seven blue-steps next-level-shit"
for song in $songs ; do for transposition in $transpositions ; do cp $score/pdf/$song/$song-Lead-Sheet-$transposition.pdf newpdfs/$transposition/$album ; done ; done 
for song in $songs ; do for transposition in $transpositions ; do cp $score/pdf/$song/$song-Lead-Sheet-$transposition.pdf newpdfs/all-songs-$transposition ; done ; done 
for song in $songs ; do for transposition in $transpositions ; do cp $score/pdf/$song/$song-Lead-Sheet-$transposition.pdf newpdfs/all-songs-all-transpositions ; done ; done 

cp adventurous-instrumentals/pdf/next-level-shit/next-level-shit-Bass-for-C.pdf newpdfs/for-C/X-adventurous-instrumentals
cp adventurous-instrumentals/pdf/next-level-shit/next-level-shit-Bass-for-C.pdf newpdfs/all-songs-for-C
cp adventurous-instrumentals/pdf/next-level-shit/next-level-shit-Bass-for-C.pdf newpdfs/all-songs-all-transpositions



for transposition in $transpositions ; do cd newpdfs/$transposition ; zip ../elaine-alt-lead-sheets-set-I-inaugural-jazz-$transposition.zip I-inaugural-jazz/*.pdf ; cd ../.. ; done
for transposition in $transpositions ; do cd newpdfs/$transposition ; zip ../elaine-alt-lead-sheets-set-II-jazz-symphony-$transposition.zip II-jazz-symphony/*.pdf ; cd ../.. ; done
for transposition in $transpositions ; do cd newpdfs/$transposition ; zip ../elaine-alt-lead-sheets-set-III-exploring-traditions-$transposition.zip III-exploring-traditions/*.pdf ; cd ../.. ; done
for transposition in $transpositions ; do cd newpdfs/$transposition ; zip ../elaine-alt-lead-sheets-set-IV-modern-jazz-$transposition.zip IV-modern-jazz/*.pdf ; cd ../.. ; done    
for transposition in $transpositions ; do cd newpdfs/$transposition ; zip ../elaine-alt-lead-sheets-set-V-west-coast-jazz-$transposition.zip V-west-coast-jazz/*.pdf; cd ../.. ; done
for transposition in $transpositions ; do cd newpdfs/$transposition ; zip ../elaine-alt-lead-sheets-set-VI-lyrical-immersion-$transposition.zip ; cd ../.. ; done
for transposition in $transpositions ; do cd newpdfs/$transposition ; zip ../elaine-alt-lead-sheets-set-VII-jazz-combustion-uprising-$transposition.zip VII-jazz-combustion-uprising/*.pdf ; cd ../.. ; done
for transposition in $transpositions ; do cd newpdfs/$transposition ; zip ../elaine-alt-lead-sheets-set-IX-period-jazz-$transposition.zip IX-period-jazz/*.pdf X-adventurous-instrumentals/*.pdf ; cd ../.. ; done
for transposition in $transpositions ; do cd newpdfs/$transposition ; zip ../elaine-alt-lead-sheets-set-X-adventurous-instrumentals-$transposition.zip X-adventurous-instrumentals/*.pdf ; cd ../.. ; done

for transposition in $transpositions ; do cd newpdfs/$transposition ; zip ../elaine-alt-lead-sheets-sets-I-II-III-IV-$transposition.zip I-inaugural-jazz/*.pdf II-jazz-symphony/*.pdf III-exploring-traditions/*.pdf IV-modern-jazz/*.pdf ; cd ../.. ; done
for transposition in $transpositions ; do cd newpdfs/$transposition ; zip ../elaine-alt-lead-sheets-sets-V-VI-VII-IX-X-$transposition.zip V-west-coast-jazz/*.pdf  VI-lyrical-immersion/*.pdf  VII-jazz-combustion-uprising/*.pdf IX-period-jazz/*.pdf X-adventurous-instrumentals/*.pdf ; cd ../.. ; done

for transposition in $transpositions ; do cd newpdfs/all-songs-$transposition ; zip ../elaine-alt-lead-sheets-all-songs-$transposition.zip *.pdf ; cd ../.. ; done



