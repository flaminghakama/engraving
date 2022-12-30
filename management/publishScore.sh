CWD=`pwd`
SCORE=`basename $CWD`
if [ "$SCORE" ==  "" ]; then
	echo "Coud not determine score"
else 
    lynx http://altjazz.org/cgi-bin/pullScore.pl?$SCORE
fi