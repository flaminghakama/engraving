#!/usr/local/bin/perl

print "Content-type:text/html\r\n\r\n";

my $REPO = $ENV{"QUERY_STRING"};

print '<html>';
print '<head>';
print "<title>pulling the $REPO repo</title>";
print '</head>';
print '<body>';

if (!$REPO) { 

    print '<h2>No score specified</h2>';
    print `./createScoreList.sh`;
    
} else { 

    print '<h2>pullScorePdf.sh ' . $REPO . '</h2>';
    my $PDF = `./pullScorePdf.sh $REPO`;
    $PDF =~ s/\n/<br>\n/g;
    print "<p><tt>$PDF</tt></p>";

    print "<p><a href='/scores/$REPO'>PDFs of $REPO</a></p>";

}
print '</body>';
print '</html>';

1;