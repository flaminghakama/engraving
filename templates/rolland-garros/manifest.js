/*
 *  Song specificiation for Alt Jazz song TITLE 
 */

var altJazzSongs = altJazzSongs || {};

altJazzSongs["TITLE"] = {

    partsInBooks: {
        "Tenor Sax & Flute": {
            "TITLE": [ "Flute" ], 
            "TITLE": [ "Tenor Sax" ], 
        },
        "Trumpet": {
            "TITLE": [ "Tenor Sax in Bb" ], 
        },
        "Piano": {
            "TITLE": [ "Piano" ], 
        }
        "Drums": {
            "TITLE": [ "Drums" ], 
        },
        "Bass": {
            "TITLE": [ "Bass" ], 
        }
    },

    songs: {

        "TITLE": {
            metadata: { 
                title: "TITLE",
                composer: "Elaine Paul",
                arranger: "Elaine Paul",
                genre: "Afro-Cuban Jazz",
                bpm: 'BPM',
                key: "KEY"
            },
            fileLocation: "scores/SONG/pdf",
            filePrefix: "SONG",
            parts: {
                PARTS
            },
            scores: {
                SCORES
            },
            recordings: {
                demo: {
                    description: 'demo',
                    url: ''
                },
                reading: {
                    description: 'reading',
                    url: ''
                },
                recording: {
                    description: 'recording',
                    url: ''
                },
                live: {
                    description: 'live',
                    url: ''
                }
            }
        }
    }
};