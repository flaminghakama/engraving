#  combine-6page-6page.py input1.pdf input2.pdf output.pdf

#  Create the two outside pages

python ~/git/part-format/bookify-6page-outside.py $1 outside-$1 
python ~/git/part-format/bookify-6page-outside.py $2 outside-$2 

#  Combine the two inside pages

python ~/git/part-format/halfpagify-two-6page-insides.py $1 $2 inside-$3

#  Combine the pages
python ~/git/PyPDF2/Scripts/pdfcat -o $3 outside-$1 outside-$2 inside-$3

#  Clean up temporary files
rm outside-$1 outside-$2 inside-$3

echo op $3

