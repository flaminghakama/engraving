# bookify-8page.py

# bookify-8page.py input1.pdf output1.pdf [automatic|manual]

#
#  ____1__________________8____
#       2       /\       7
#              /  \
#           3 /    \ 6
#            / 4  5 \
#           /        \
#          /          \
#

#  The order of pages is based on the 3rd argument.

#  If the 3rd argument is specified as "manual", 
#  the printing order is for manual double-sided printing, 
#  with both outward sides printed first, then the inward sides
#    Outward outside
#    Outward inside
#    Inward outside
#    Inward inside
 
#  Otherwise, the printing order is intended for automatic double-sided printing:
#    Outward outside
#    Inward outside
#    Iward inside
#    Outward inside

import sys
from PyPDF2 import PdfFileWriter, PdfFileReader, PdfFileMerger

inputOneFileName = sys.argv[1] 
outputOneFileName = sys.argv[2] 
print "input 1: " + inputOneFileName
print "output 1: " + outputOneFileName 

inputReaderOne = PdfFileReader(open(inputOneFileName, "rb"))
outputWriterOne = PdfFileWriter()

pageIndex = [0, 1, 2, 3, 4, 5, 6, 7, 8]
pageIndex[1] = 7
pageIndex[2] = 0

if sys.argv[3] == "manual":
    pageIndex[3] = 1
    pageIndex[4] = 6
    pageIndex[5] = 5
    pageIndex[6] = 2
    pageIndex[7] = 3 
    pageIndex[8] = 4

else:
    pageIndex[3] = 5
    pageIndex[4] = 2
    pageIndex[5] = 3
    pageIndex[6] = 4
    pageIndex[7] = 1
    pageIndex[8] = 6

outputWriterOne.addPage(inputReaderOne.getPage(pageIndex[1]))
outputWriterOne.addPage(inputReaderOne.getPage(pageIndex[2]))
outputWriterOne.addPage(inputReaderOne.getPage(pageIndex[3]))
outputWriterOne.addPage(inputReaderOne.getPage(pageIndex[4]))
outputWriterOne.addPage(inputReaderOne.getPage(pageIndex[5]))
outputWriterOne.addPage(inputReaderOne.getPage(pageIndex[6]))
outputWriterOne.addPage(inputReaderOne.getPage(pageIndex[7]))
outputWriterOne.addPage(inputReaderOne.getPage(pageIndex[8]))
outputStreamOne = file(outputOneFileName, "wb")
outputWriterOne.write(outputStreamOne)
