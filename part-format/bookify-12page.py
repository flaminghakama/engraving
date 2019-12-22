# bookify-12page.py input1.pdf output1.pdf

# A 12-page booklet has three full pages (outside, middle, inside) 

#           \          /
#            \        /
#            2\1   12/11
#              \    /
#               \  /  
#  ____3_________\/______ 10_____  
#       4                 9
#               /  \
#              /    \
#           5 /      \ 8
#            /6      7\
#           /          \
#          /            \

#    Outward outside
#    Outward inside
#    Middle outside
#    Middle inside
#    Inner outside
#    Inner inside 

import sys
from PyPDF2 import PdfFileWriter, PdfFileReader, PdfFileMerger

inputOneFileName = sys.argv[1] 
outputOneFileName = sys.argv[2] 
print "input 1: " + inputOneFileName
print "output 1: " + outputOneFileName 

inputReaderOne = PdfFileReader(open(inputOneFileName, "rb"))
outputWriterOne = PdfFileWriter()

pageIndex = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]

pageIndex[0] = 11
pageIndex[1] = 0
pageIndex[2] = 1
pageIndex[3] = 10

pageIndex[4] = 9
pageIndex[5] = 2
pageIndex[6] = 3
pageIndex[7] = 8

pageIndex[8] = 7
pageIndex[9] = 4
pageIndex[10] = 5
pageIndex[11] = 6

outputWriterOne.addPage(inputReaderOne.getPage(pageIndex[0]))
outputWriterOne.addPage(inputReaderOne.getPage(pageIndex[1]))
outputWriterOne.addPage(inputReaderOne.getPage(pageIndex[2]))
outputWriterOne.addPage(inputReaderOne.getPage(pageIndex[3]))
outputWriterOne.addPage(inputReaderOne.getPage(pageIndex[4]))
outputWriterOne.addPage(inputReaderOne.getPage(pageIndex[5]))
outputWriterOne.addPage(inputReaderOne.getPage(pageIndex[6]))
outputWriterOne.addPage(inputReaderOne.getPage(pageIndex[7]))
outputWriterOne.addPage(inputReaderOne.getPage(pageIndex[8]))
outputWriterOne.addPage(inputReaderOne.getPage(pageIndex[9]))
outputWriterOne.addPage(inputReaderOne.getPage(pageIndex[10]))
outputWriterOne.addPage(inputReaderOne.getPage(pageIndex[11]))
outputStreamOne = file(outputOneFileName, "wb")
outputWriterOne.write(outputStreamOne)
