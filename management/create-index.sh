#!/usr/local/bin/bash

# Run from ~/engraving/scores/<score> 

STARTING_DIR=`pwd`
PROJECT=`basename $STARTING_DIR`
cd pdf
STARTING_DIR="$STARTING_DIR/pdf"
INDEX=index.html

echo "<html>" > $INDEX
echo "<head><title>Directory listing of $PROJECT</title></head>" >> $INDEX
echo "<body>" >> $INDEX

echo "<style>" >> $INDEX
echo "A {" >> $INDEX
echo "    color:\#916545;" >> $INDEX
echo "}" >> $INDEX
echo "H1,H2,H3,H4,H5,H6 {" >> $INDEX
echo "    font-size:2.6em;" >> $INDEX
echo "    color:\#492e26;" >> $INDEX
echo "}" >> $INDEX
echo "UL {" >> $INDEX
echo "    font-size:2em;" >> $INDEX
echo "    list-style-type:none;" >> $INDEX
echo "    padding:0.4em 0.8em;" >> $INDEX
echo "}" >> $INDEX
echo "UL LI {" >> $INDEX
echo "    margin:0.4em 0;" >> $INDEX
echo "}" >> $INDEX
echo "</style>" >> $INDEX

echo "    <h2>$PROJECT</h2>" >> $INDEX
echo "    <ul>" >> $INDEX
for file in `ls -1` ; do 
    if [ "$file" != "index.html" ] ; then
        if [ "$file" != "README.md" ] ; then
            if [ "$file" != "manifest.js" ] ; then
                echo "        <li><a href='$file'>$file</a></li>" >> $INDEX
            fi
        fi
    fi
done
echo "    </ul>" >> $INDEX
echo "</body>" >> $INDEX
echo "</html>" >> $INDEX
echo "" >> $INDEX


for dir in `find * -type d` ; do 
    cd $dir 
    echo "<html>" > $INDEX
    echo "<head><title>Directory listing of $dir</title></head>" >> $INDEX

    echo "<style>" >> $INDEX
    echo "A {" >> $INDEX
    echo "    color:\#916545;" >> $INDEX
    echo "}" >> $INDEX
    echo "H1,H2,H3,H4,H5,H6 {" >> $INDEX
    echo "    font-size:2.6em;" >> $INDEX
    echo "    color:\#492e26;" >> $INDEX
    echo "}" >> $INDEX
    echo "UL {" >> $INDEX
    echo "    font-size:2em;" >> $INDEX
    echo "    list-style-type:none;" >> $INDEX
    echo "    padding:0.4em 0.8em;" >> $INDEX
    echo "}" >> $INDEX
    echo "UL LI {" >> $INDEX
    echo "    margin:0.4em 0;" >> $INDEX
    echo "}" >> $INDEX
    echo "</style>" >> $INDEX

    echo "<body>" >> $INDEX
    echo "    <h2>$dir</h2>" >> $INDEX
    echo "    <ul>" >> $INDEX
    for file in `ls -1` ; do 
        if [ "$file" != "index.html" ] ; then
            if [ "$file" != "README.md" ] ; then
                echo "        <li><a href='$file'>$file</a></li>" >> $INDEX
            fi
        fi
    done
    echo "    </ul>" >> $INDEX
    echo "</body>" >> $INDEX
    echo "</html>" >> $INDEX
    echo "" >> $INDEX
    cd $STARTING_DIR
done 


