#!/usr/local/bin/perl

print "Content-type:text/html\r\n\r\n";
print '<html>';
print '<head>';
print '<title>dir</title>';
print '</head>';
print '<body>';

print '<h2>pullLessons.sh</h2>';
my $PULL = `./pullLessons.sh`;
$PULL =~ s/\n/<br>\n/g;
print "<p><tt>$PULL</tt></p>";

print "<p><a href='/lessons/pdf'>PDF directory of Lessons</a></p>";
print "<p><a href='/lessons/html'>HTML directory of Lessons</a></p>";


print '</body>';
print '</html>';

1;