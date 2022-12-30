#!/usr/local/bin/perl

print "Content-type:text/html\r\n\r\n";

my $REPO = "scores";

print '<html>';
print '<head>';
print "<title>creating indexes for $REPO</title>";
print '</head>';
print '<body>';

print '<h2>createIndex.sh</h2>';
my $CREATE = `./createIndex.sh`;
$CREATE =~ s/\n/<br>\n/g;
print "<p><tt>$CREATE</tt></p>";

print "<p><a href='/scores/'>Scores</a></p>";

print '</body>';
print '</html>';

1;