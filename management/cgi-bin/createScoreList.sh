
cd ../scores

FILE="scores.html"

echo "<label for='score'>Choose a score:</label>" > $FILE
echo "<select name='score' id='score'> " >> $FILE
echo "    <option value=''> choose a score </option>" >> $FILE

for score in `find * -type d -prune` ; do 
    echo "    <option value='$score'>$score</option>" >> $FILE
done

echo "</select>" >> $FILE 
echo "" >> $FILE
echo "<script>" >> $FILE
echo "    document.getElementById('score').addEventListener(" >> $FILE
echo "        'change'," >> $FILE 
echo "        function() {" >> $FILE
echo "            window.location.search = document.getElementById('score').value;" >> $FILE
echo "        }" >> $FILE
echo "    );" >> $FILE
echo "</script>" >> $FILE

cat $FILE

rm $FILE