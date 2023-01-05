\version "2.22.2"

#(define (enharmonize enharmonization-definition)
   (let ((basic-enharmonize (make-semitone->pitch (music-pitches enharmonization-definition))))
     (lambda (pitch)
       (or (basic-enharmonize (ly:pitch-semitones pitch))
           ;; If no enharmonization is specified, remove double/triple
           ;; sharps/flats. Keep sharps and flats as they are.
           (let loop ((pitch pitch))
             (let* ((notename (ly:pitch-notename pitch))
                    (alter (ly:pitch-alteration pitch))
                    (dir (sign alter))
                    (next-notename (+ notename dir))
                    (alter-delta (- (ly:pitch-tones (ly:make-pitch 0 notename))
                                    (ly:pitch-tones (ly:make-pitch 0 next-notename))))
                    (next-alter (+ alter alter-delta)))
               (if (or (zero? next-alter)
                       (eqv? dir (sign next-alter)))
                   (ly:make-pitch (ly:pitch-octave pitch)
                                  next-notename
                                  next-alter)
                   pitch)))))))

#(define (music-transform-property music prop trans)
   (for-some-music
    (lambda (m)
      (let ((val (ly:music-property m prop #f)))
        (if val
            (set! (ly:music-property m prop)
                  (trans val))))
      #f)
    music)
   music)

enharmonizeMusic =
#(define-music-function (def mus) (ly:music? ly:music?)
   (music-transform-property mus 'pitch (enharmonize def)))

enharmonizeChords =
#(define-music-function (def) (ly:music?)
   #{
     \set chordRootNamer =
       #(let ((trans (enharmonize def)))
          (lambda (pitch lowercase)
            (note-name->markup (trans pitch)
                               lowercase)))
   #})


%%%%%%%%%%%%%%%

% mus = \fixed c' { ees f g aes bes c' d' ees' }

% { \mus }
% { \transpose ees gis \mus }
% { \enharmonizeMusic { cis ees fis aes bes } \transpose ees gis \mus }
% { \enharmonizeMusic { } \transpose ees gisis \mus }
% { \enharmonizeMusic { } \transpose ees feses \mus }


% chordMus = \chordmode { ees f g aes bes c d ees }

% \chords { \chordMus }
% \chords { \transpose ees gis \chordMus }
% \chords {
%   \enharmonizeChords { cis ees fis aes bes }
%   \transpose ees gis \chordMus
% }
% \chords {
%   \enharmonizeChords { }
%   \transpose ees gisis \chordMus
% }
% \chords {
%   \enharmonizeChords { }
%   \transpose ees feses \chordMus
% }
