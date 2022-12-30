/*
 *  Song specificiation for Alt Jazz song TITLE 
 */

var altJazzSongs = altJazzSongs || {};

altJazzSongs["TITLE"] = {

    partsInBooks: {
        "Flute, Alto Flute & Piccolo": {
            "TITLE": [ "Flute" ], 
        },
        "English Horn": {
            "TITLE": [ "English Horn in F" ], 
        },
        "Bass Clarinet": {
            "TITLE": [ "Bass Clarinet in Bb" ],
        },
        "Voice/Percussion": {
            "TITLE": [ "Voice" ],
        },
        "Drums": {
            "TITLE": [ "Drums" ], 
        },
        "Violin I": {
            "TITLE": [ "Violin I" ], 
        },
        "Violin II": {
            "TITLE": [ "Violin II" ], 
        },
        "Viola": {
            "TITLE": [ "Viola" ], 
        },
        "'Cello": {
            "TITLE": [ "'Cello" ],
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