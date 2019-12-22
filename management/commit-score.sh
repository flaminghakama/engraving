MESSAGE=$1 
PDF=$2

if [ "$1" == "" ]; then
	echo "Please provide a message"
	echo "Usage: commit.sh 'commit message' <pdf>"
	exit 1
fi

FILES="ly midi *.sublime-project buildParts.sh .gitignore .gitmodules"
echo "-=-"
echo "adding files $FILES"
git add $FILES

echo "-=-"
echo "committing with message '$MESSAGE'"
echo "git commit -m'$MESSAGE' $FILES"
git commit -m"$MESSAGE" $FILES
git push origin master

if [ "$PDF" == "pdf" ]; then
	echo "-=-"
	echo "Committing pdf files"
	cd pdf
	PDF_FILES=`find . -type f | grep -v '.git' | grep -v README`
	git add $PDF_FILES
	git commit -m"$MESSAGE" $PDF_FILES
	git push origin master
fi