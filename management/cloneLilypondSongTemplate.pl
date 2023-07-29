#!/usr/bin/perl

#  Before running this script, create two git repos: SONG and SONG-pdf, 
#  which each have a README.md file.
#
#  Then clone these to the scores directory: 
#    cd scores
#    ../management/clone-repos.sh SONG

#  And afterwords, commit the template to the repo by running 
#    ../management/commit-score.sh "Initial checkin of template"

#  Usage:
#
#  cloneLilypondSongTemplate.pl SONG TEMPLATE [ <INSTRUMENT-TRANSPOSITION> ]*
#
#  Invoke from the engraving directory
#
#  Example invocation:
#  ./management/cloneLilypondSongTemplate.pl a-night-in-tunisia Flute English-Horn-in-F Bass-Clarinet-in-Bb Clave Bass Rhythm Lead-Sheet 
#
#  Clones the template project within a directory named scores/SONG.
#
#  There are two sets of things that happen, which correspond to parts and scores.
#
#  PARTS
#
#  Generally speaking, there is a one-to-one relationship for instruments to parts.
#  There are three related files that comprise a part: Part, Book and Instrument.
#    Part File.  This is a lilypond file that you can invoke and it will produce a pdf.  
#      References the standard libraries.
#      References the instrument file and the book file.  
#    Book File.  This is a lilypond fragment that defines the lilypond book.
#      References either a staff file, or staffgroup files
#    Staffgroup File.  This contains references to staff files, wrapped in a staffgroup 
#    Staff File.  This uses the music variables, which are defined in the music file 
#      before including the book file.
#    Instrument File.
#      Defines the music variables used in the book file, typically out of combinations of 
#      the music variables contained in the instrument file combined with the global functions. 
#
#  SCORES
#
#  Generally speaking, there are several instruments in a score.
#    Book File.  There is one Book file for a score, which is based on its own template TEMPLATE/parts/SCORE.ly
#    MIDI Book File.  There is one Book file for midi, which is based on its own template TEMPLATE/parts/MIDI.ly
#    Instrument Files.  There are no new instrument files for a score.  Scores uses the same instrument files as the parts.
#    Part File.  There is one Part file for the score.  It is based on the same part file as the parts.
#      However, the file is recomposed after all the parts files have been processed:
#        Save any version lines.
#        Save any include structures lines.
#        Insert include instrument lines from all instruments
#        Insert global music variable definitions for all instruments
#        Save any book include lines 
#      

#  For each PART specified ( <INSTRUMENT-TRANSPOSITION> ), 
#      three files are created: Part file, Book file and Instrument file.
#      plus three more:  
#          staves/scores/<INSTRUMENT>.ily
#          staves/parts/<INSTRUMENT>.ily
#          staves/sound/<INSTRUMENT>.ily

#  Until a better approach comes into being, instead we are populating the 
#  staffgroups and staves ahead of time, rather than generating them from a template
#  However, we still need to update the SONG value in the  

#          staves/*/*.ily
#          staffgroups/*/*.ily
#  

#  Additionally, create a Manifest of the song.
#  Looks for manifest template manifest/SONG.js
#  Updates strings in the template related to the song title
#  And adds entries for each instrumental part and score 


#  Part file <SONG>-<INSTRUMENT-TRANSPOSITION>.ly like octagon-arbiter-English-Horn-in-F.ly
#  Book file <INSTRUMENT-TRANSPOSITION>.ily like English-Horn-in-F.ily
#  Instrument variable name is instrumentName like englishHorn
#  Instrument file is instrumentName.ily like englishHorn.ily
#  Poet (how the part name is printed on the part) based on <INSTRUMENT-TRANSPOSITION> like English Horn in F




use strict ;
use warnings ;
# use File::NCopy ;
use File::Copy ;
use File::Slurp ; 
use File::Find;

sub slurpFile {
    my ($fileName, $fileDescription) = @_ ; 
    local $/ = undef;
    open(FILE, "$fileName") or die "Couldn't open $fileDescription '$fileName': $!";
    binmode FILE;
    my $contents = <FILE>;
    close FILE;
    return $contents ; 
}

sub writeFile {
    my ($fileName, $fileDescription, $fileContents) = @_ ; 
    open(my $fh, '>', $fileName) or die "Could not open $fileDescription '$fileName' $!";
    print $fh $fileContents ; 
    close $fh;
}

sub getPartType {
    my ($fileName) = @_;
    my $partType = "Part" ; 
    if ( $fileName =~ /Score/ ) { 
        $partType = "Score" ; 
    } 
    if ( $fileName =~ /Sound/ ) { 
        $partType = "Sound" ; 
    } 
    if ( $fileName =~ /Lead/ ) { 
        $partType = "Score" ; 
    } 
    if ( $fileName =~ /Rhythm/ ) { 
        $partType = "Score" ; 
    } 
    return $partType ; 
}

sub isPart { 
    my ($fileName) = @_ ; 
    return getPartType($fileName) eq "Part" ; 
}

sub isSound { 
    my ($fileName) = @_ ; 
    return getPartType($fileName) eq "Sound" ; 
}

sub isScore { 
    my ($fileName) = @_ ; 
    return getPartType($fileName) eq "Score" ; 
}

sub convertPartNameToInstrumentName {
    my ($partName) = @_ ; 
    my $instrumentName ; 
    my $transposition ; 
    if ( $partName =~ /\-in\-\w*/ ) {
        ( $instrumentName, $transposition ) = ( $partName =~ /(.*)(\-in\-\w*)/ ) ;
    } else { 
        $instrumentName = $partName ;
    }
    return $instrumentName ; 
}

sub convertInstrumentNameToVariable {
    my ($instrumentName) = @_ ; 
    my @words = split('-', $instrumentName) ;
    my $word ;
    my $variableName = '' ;   
    foreach $word (@words) {
        if ($variableName eq '') {
            $variableName = lc($word) ;  
        } else {
            $variableName = $variableName . $word ; 
        }
    }
    return $variableName ; 
}

sub convertInstrumentNameToTagName {
    my ($instrumentName) = @_ ; 
    my @words = split('-', $instrumentName) ;
    my $word ;
    my $variableName = '' ;   
    foreach $word (@words) {
        $variableName = $variableName . $word ;
    }
    return $variableName ; 
}

sub convertPartNameToPoet {
    my ($partName) = @_ ; 
    $partName =~ s/\-/ /g ;
    return $partName ; 
}

sub convertSongNameToTitle {
    my ($songName) = @_ ; 
    my @words = split('-', $songName) ;
    my $word ;
    my $title = '' ;   
    foreach $word (@words) {
        $title = $title . ucfirst($word) . " ";
    }
    $title =~ s/\s+$//;
    return $title ; 
}

sub convertPartNameToStaffFileName {
    my ($partName) = @_ ; 
    $partName =~ s/\-in\-/-In-/g ;
    my @words = split('-', $partName) ;
    my $word ;
    my $staffFileName = '' ;   
    foreach $word (@words) {
        if ($staffFileName eq '') {
            $staffFileName = lc($word) ;  
        } else {
            $staffFileName = $staffFileName . $word ; 
        }
    }
    return $staffFileName ; 
}

sub getMusicDefinitionsFromInstrument {
    my ($instrumentContents) = @_ ; 
    my $line ;
    my @globalMusicDefinitions ;  
    foreach $line ( split("\n", $instrumentContents) ) {
        next if $line =~ /include|version/ ; 
        push(@globalMusicDefinitions, $line) ; 
    }
    return @globalMusicDefinitions ; 
}

sub getVersionLineFromPart {
    my ($partContents) = @_ ; 
    my $line ;
    foreach $line ( split("\n", $partContents) ) {
        if ( $line =~ /version/ ) { 
            return $line ; 
        }
    }
    return '' ;
}

sub getInstrumentIncludesFromPart {
    my ($partContents) = @_ ; 
    my $line ;
    my @instrumentIncludes ;  
    foreach $line ( split("\n", $partContents) ) {
        if ( ($line =~ /include/) && (($line =~ /instrument/) || ($line =~ /music/)) ) { 
            push(@instrumentIncludes, $line) ; 
        }
    }
    return @instrumentIncludes ; 
}

sub getStructuresFromPart {
    my ($partContents) = @_ ; 
    my $line ;
    my @structureIncludes ;  
    foreach $line ( split("\n", $partContents) ) {
        if ( ( $line =~ /include/ ) && ( $line =~ /structure/ ) ) { 
            push(@structureIncludes, $line) ; 
        }
    }
    return @structureIncludes ; 
}

sub getBookLineFromPart {
    my ($partContents) = @_ ; 
    my $line ;
    foreach $line ( split("\n", $partContents) ) {
        if ( $line =~ /\/books\// ) { 
            return $line ; 
        }
    }
    return '' ;
}

#  Get the song name
my $song = shift(@ARGV) ; 
my $songDir = "scores/$song" ; 
`if [ ! -d "$songDir" ]; then mkdir $songDir; fi` ;  
my $lyDir = "$songDir/ly" ; 

#  Get the template and copy it to the song directory
my $templateName = shift(@ARGV) ; 
my $templateDir = "templates/$templateName" ; 
`cp -R $templateDir/* $songDir` ;  

#  Make a copy of the sublime text project for the song and remove the template 
my $projectFile = "$songDir/$song.sublime-project" ; 
my $projectTemplateFile = "$songDir/SONG.sublime-project" ; 
my $projectWorkspaceFile = "$songDir/SONG.sublime-workspace" ; 
my $fileDescription = "sublime text project file template" ; 
my $template = slurpFile($projectTemplateFile, $fileDescription) ; 
$template =~ s/SONG/$song/g ; 
writeFile($projectFile, $fileDescription, $template) ; 

#  Get the three templates
my $partTemplateFile = "$lyDir/parts/PART.ly" ;
my $partTemplate = slurpFile($partTemplateFile, "part template") ; 

my $bookPartTemplateFile = "$lyDir/books/BOOK.ily" ; 
my $bookPartTemplate = slurpFile($bookPartTemplateFile, "part book template") ; 

my $scoreBookTemplateFile = "$lyDir/books/SCORE.ily" ; 
my $scoreBookTemplate = slurpFile($scoreBookTemplateFile, "score book template") ; 

my $midiBookTemplateFile = "$lyDir/books/MIDI.ily" ; 
my $midiBookTemplate = slurpFile($midiBookTemplateFile, "midi book template") ; 

my $instrumentTemplateFile = "$lyDir/music/INSTRUMENT.ily" ; 
my $instrumentTemplate = slurpFile($instrumentTemplateFile, "instrument template") ; 

#my $staffScoresTemplateFile = "$lyDir/staves/scores/INSTRUMENT.ily" ; 
#my $staffScoresTemplate = slurpFile($staffScoresTemplateFile, "staff scores template") ; 

#my $staffPartsTemplateFile = "$lyDir/staves/parts/INSTRUMENT.ily" ; 
#my $staffPartsTemplate = slurpFile($staffPartsTemplateFile, "staff parts template") ; 

#my $staffSoundTemplateFile = "$lyDir/staves/sound/INSTRUMENT.ily" ; 
#my $staffSoundTemplate = slurpFile($staffSoundTemplateFile, "staff sound template") ; 


#  Process each part/score
my $partName ;
my @lilypondPartInvocation ; 
my @lilypondPartArchive ; 
my $partFile ;
my @partNames ; 
my $partContents ;  
my @scoreNames ; 
my @parts ; 
my $instrumentName ; 
my $staffFileName ; 
my $tagName ; 
my $bookFile ; 
my $bookContents ; 
my $variableName = '' ; 
my $poet ; 
my $instrumentFile ; 
my $instrumentContents ; 
my $staffScoresFile ; 
my $staffScoresContents ; 
my $staffPartsFile ; 
my $staffPartsContents ; 
my $staffSoundFile ; 
my $staffSoundContents ; 
my @globalMusicDefinitions ; 
my @instrumentIncludes ; 
my @scoreContents ; 
my @manifestParts ;
my @manifestScores ;
foreach $partName (@ARGV){

    #  Prepare the invocation of the part file.
    push(@lilypondPartInvocation, "rm \$SONG-$partName.pdf ; lilypond ly/parts/\$SONG-$partName.ly ; open -a Preview \$SONG-$partName.pdf") ; 
    push(@lilypondPartArchive, "mv \$SONG-$partName.pdf pdf") ; 

    $poet = convertPartNameToPoet($partName) ; 

    #  Treat parts and scores differently

    if ( isSound($partName) ) {

        #  Save the name of the part file, which will be created once all the parts have been processed.
        push(@scoreNames, $partName) ; 

        #  Make the book file
        $bookFile = "$lyDir/books/$partName.ily" ; 
        $bookContents = $midiBookTemplate ; 
        $bookContents =~ s/PART/$variableName/g ; 
        $bookContents =~ s/SONG/$song/g ; 
        $bookContents =~ s/POET/$poet/g ;  
        writeFile($bookFile, "midi part file", $bookContents) ; 

    } else { 

        if ( isScore($partName) ) {

            #  Save the name of the part file, which will be created once all the parts have been processed.
            push(@scoreNames, $partName) ; 

            #  Make the book file
            $bookFile = "$lyDir/books/$partName.ily" ; 
            $bookContents = $scoreBookTemplate ; 
            $bookContents =~ s/PART/$partName/g ; 
            $bookContents =~ s/SONG/$song/g ; 
            $bookContents =~ s/POET/$poet/g ;  
            writeFile($bookFile, "score part file", $bookContents) ; 

            # Make the song manifest entry
            push(@manifestScores, "                \"$poet\": { fileSuffix: \"$partName\" },");

        } else { 

            $instrumentName = convertPartNameToInstrumentName($partName) ; 
            $staffFileName = convertPartNameToStaffFileName($partName) ; 
            $variableName = convertInstrumentNameToVariable($instrumentName) ; 
            $tagName = convertInstrumentNameToTagName($instrumentName) ; 

            #  Create the part file and update the part and song names

            $partFile = "$lyDir/parts/$song-$partName.ly" ; 
            $partContents = $partTemplate ; 
            push(@partNames, $partName) ; 
            $partContents =~ s/PART/$partName/g ; 
            $partContents =~ s/SONG/$song/g ; 

            #  Update the instrument name and collect the instrument includes
            $partContents =~ s/INSTRUMENT/$variableName/g ; 
            push(@instrumentIncludes, getInstrumentIncludesFromPart($partContents)) ; 
            writeFile($partFile, "part file", $partContents) ; 

            push(@globalMusicDefinitions, getMusicDefinitionsFromInstrument($partContents)) ; 

        	#  Make the book file

        	$bookFile = "$lyDir/books/$partName.ily" ; 
            $bookContents = $bookPartTemplate ; 
            $bookContents =~ s/PART/$staffFileName/g ; 
            $bookContents =~ s/SONG/$song/g ; 
            $bookContents =~ s/INSTRUMENT/$variableName/g  ; 
            $bookContents =~ s/InstrumentTAGNAME/$tagName/g  ; 
            $bookContents =~ s/POET/$poet/g ;  
            writeFile($bookFile, "book file for instrument $instrumentName", $bookContents) ; 

            # Make the instrument file

            $instrumentFile = "$lyDir/music/$variableName.ily" ;  
            $instrumentContents = $instrumentTemplate ; 

            $instrumentContents =~ s/INSTRUMENT/$variableName/g ;
            writeFile($instrumentFile, "instrument file $instrumentFile", $instrumentContents) ; 

            # Make the staff files

            #$staffScoresFile = "$lyDir/staves/scores/$variableName.ily" ;  
            #$staffScoresContents = $staffScoresTemplate ; 

            #$staffScoresContents =~ s/INSTRUMENT/$variableName/g ;
            #$staffScoresContents =~ s/PART/$partName/g ;
            #$staffScoresContents =~ s/POET/$poet/g ;
            #writeFile($staffScoresFile, "staff file $staffScoresFile", $staffScoresContents) ; 

            #$staffPartsFile = "$lyDir/staves/parts/$variableName.ily" ;  
            #$staffPartsContents = $staffPartsTemplate ; 

            #$staffPartsContents =~ s/INSTRUMENT/$variableName/g ;
            #$staffPartsContents =~ s/PART/$partName/g ;
            #$staffPartsContents =~ s/POET/$poet/g ;
            #writeFile($staffPartsFile, "staff file $staffPartsFile", $staffPartsContents) ; 

            #$staffSoundFile = "$lyDir/staves/sound/$variableName.ily" ;  
            #$staffSoundContents = $staffSoundTemplate ; 

            #$staffSoundContents =~ s/INSTRUMENT/$variableName/g ;
            #$staffSoundContents =~ s/POET/$poet/g ;
            #writeFile($staffSoundFile, "staff file $staffSoundFile", $staffSoundContents) ; 

            # Make the song manifest entry
            push(@manifestParts, "                \"$poet\": { fileSuffix: \"$partName\" },");
        }
    }
}

sub updateStavesAndStaffgroups() {

    my @dirs = ( "$lyDir/staves", "$lyDir/staffgroups" ) ;  

    sub process_file {
        if ( -f $_ ) { 
            my $contents = slurpFile($_, "staff or staffgroup $_") ; 
            $contents =~ s/SONG/$song/g ;
            writeFile($_, "staff or staffgroup $_", $contents) ; 
        }   
    }

    find(\&process_file, @dirs);
}
updateStavesAndStaffgroups() ; 

#  Now that we've gathered all the instrument parts, build the score parts

foreach $partName (@scoreNames){

    $partFile = "$lyDir/parts/$song-$partName.ly" ; 
    $partContents = $partTemplate ; 
    $partContents =~ s/PART/$partName/g ; 
    $partContents =~ s/SONG/$song/g ; 

    writeFile(
        $partFile, 
        "part file", 
        join("\n", 
            getVersionLineFromPart($partContents),  
            "#(ly:set-option 'relative-includes #t)",
            getStructuresFromPart($partContents), 
            @instrumentIncludes,
            @globalMusicDefinitions,
            getBookLineFromPart($partContents)
        )
    ) ;  
}

#  Create the invocation script
my $invocationFile = "$songDir/buildParts.sh" ;
writeFile($invocationFile, 
    "shell script to create parts", 
    join("\n", 
        "#!/usr/local/bin/bash",
        "source ../../part-format/part-format-functions.sh",
        "SONG=\"$song\"",
        "lilypond ly/parts/\$SONG-Score-Sound.ly ; mv \$SONG-Score-Sound.midi midi",
        @lilypondPartInvocation, 
        " ",
        @lilypondPartArchive
    )
) ; 
chmod 0755, $invocationFile;

#  Remove the copied template files
unlink $projectTemplateFile ; 
unlink $projectWorkspaceFile ; 
unlink $partTemplateFile ; 
unlink $bookPartTemplateFile ; 
unlink $scoreBookTemplateFile ; 
unlink $midiBookTemplateFile ; 
unlink $instrumentTemplateFile ; 
#unlink $staffScoresTemplate ; 
#unlink $staffPartsTemplate ; 

#  Create the song manifest
my $manifesetTemplateFile = "$templateDir/manifest.js" ;
my $songManifestFile = "$songDir/manifest.js" ;
my $songTitle = convertSongNameToTitle($song) ; 
my $songManifestTemplateContents = slurpFile($manifesetTemplateFile, "song manifest template") ; 
$songManifestTemplateContents =~ s/TITLE/$songTitle/g ; 
$songManifestTemplateContents =~ s/SONG/$song/g ;
my $manifestPartsContents = join("\n", @manifestParts);
my $manifestScoresContents = join("\n", @manifestScores);
$songManifestTemplateContents =~ s/                PARTS/$manifestPartsContents/g;
$songManifestTemplateContents =~ s/                SCORES/$manifestScoresContents/g;
writeFile($songManifestFile, "song manifest file", $songManifestTemplateContents);

