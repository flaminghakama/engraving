#!/usr/local/bin/perl

print "Content-type:text/html\r\n\r\n";

my $REPO = $ENV{"QUERY_STRING"};

print '<html>';
print '<head>';
print "<title>cloning the $REPO repo</title>";
print '</head>';
print '<body>';

if (!$REPO) { 

    print '<h2>No score specified</h2>';

} else { 

    print '<h2>cloneScore.sh ' . $REPO . '</h2>';
    my $CLONE = `./cloneScore.sh $REPO`;
    $CLONE =~ s/\n/<br>\n/g;
    print "<p><tt>$CLONE</tt></p>";

    print "<p><a href='/scores/$REPO'>PDFs of $REPO</a></p>";
}
print '</body>';
print '</html>';

1;