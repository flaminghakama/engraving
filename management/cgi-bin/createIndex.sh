#!/bin/sh

# Usage: createIndex.sh 

INDEX=index.html

write_header(){
    FILE=$INDEX
    NAME=`perl -e '$name = $ARGV[0];$name =~ s/(\w+)/\u$1/g;$name =~ s/-/ /g;print "$name\n";' $1`
    echo "<html>" > $FILE
    echo "<head><title>Directory listing of $NAME</title></head>" >> $FILE
    echo "<body>" >> $FILE
}

append_style(){
    FILE=$INDEX
    echo "    <style>" >> $FILE
    echo "    A {" >> $FILE
    echo "        color:\#916545;" >> $FILE
    echo "    }" >> $FILE
    echo "    H1,H2,H3,H4,H5,H6 {" >> $FILE
    echo "        font-size:2.6em;" >> $FILE
    echo "        color:\#492e26;" >> $FILE
    echo "    }" >> $FILE
    echo "    UL {" >> $FILE
    echo "        font-size:2em;" >> $FILE
    echo "        list-style-type:none;" >> $FILE
    echo "        padding:0.4em 0.8em;" >> $FILE
    echo "    }" >> $FILE
    echo "    UL LI {" >> $FILE
    echo "        margin:0.4em 0;" >> $FILE
    echo "    }" >> $FILE
    echo "    </style>" >> $FILE
}

append_list(){
    FILE=$INDEX
    NAME=`perl -e '$name = $ARGV[0];$name =~ s/(\w+)/\u$1/g;$name =~ s/-/ /g;print "$name\n";' $1`
    echo "    <h2>$NAME</h2>" >> $FILE
    echo "    <ul>" >> $FILE
    for file in `ls -1` ; do 
        if [ "$file" != "index.html" ] ; then
            if [ "$file" != "README.md" ] ; then
                if [ "$file" != "manifest.js" ] ; then
                    NAME=`perl -e '$name = $ARGV[0];$name =~ s/(\w+)/\u$1/g;$name =~ s/-/ /g;print "$name\n";' $file`
                    echo "        <li><a href='$file'>$NAME</a></li>" >> $FILE
                fi
            fi
        fi
    done
}

append_footer(){
    FILE=$INDEX
    echo "    </ul>" >> $FILE
    echo "</body>" >> $FILE
    echo "</html>" >> $FILE
    echo "" >> $FILE
}

cd ../scores

write_header scores
append_style
append_list scores
append_footer

exit 0
