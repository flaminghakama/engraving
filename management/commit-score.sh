MESSAGE=$1 
PDF=$2

if [ "$1" == "" ]; then
	echo "Please provide a message"
	echo "Usage: commit.sh 'commit message' <pdf>"
	exit 1
fi

echo "-=-"
echo "removing workspace"
rm *.sublime-workspace

if [ "$PDF" == "pdf" ]; then
	echo "-=-"
	echo "Committing pdf files"
	cd pdf
	PDF_FILES=`find . -type f | egrep '.pdf|.js'`
	git add $PDF_FILES
	git commit -m"$MESSAGE" $PDF_FILES
	git push
	cd ..
fi

FILES="ly midi *.sublime-project buildParts.sh .gitignore .gitmodules README.md"
if [ "$PDF" == "pdf" ]; then
	FILES="$FILES pdf"
fi
echo "-=-"
echo "adding files $FILES"
git add $FILES

echo "-=-"
echo "committing with message '$MESSAGE'"
echo "git commit -m'$MESSAGE' $FILES"
git commit -m"$MESSAGE" $FILES
git push 

