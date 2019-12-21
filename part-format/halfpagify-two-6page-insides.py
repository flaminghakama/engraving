
# halfpagify-two-6page-insides.py input1.pdf input2.pdf output.pdf 

import sys
from PyPDF2 import PdfFileWriter, PdfFileReader, PdfFileMerger

inputOneFileName = sys.argv[1] 
inputTwoFileName = sys.argv[2] 
outputOneFileName = sys.argv[3] 
print "input 1: " + inputOneFileName
print "input 2: " + inputTwoFileName 
print "output 1: " + outputOneFileName 

inputReaderOne = PdfFileReader(open(inputOneFileName, "rb"))
inputReaderTwo = PdfFileReader(open(inputTwoFileName, "rb"))
outputWriterOne = PdfFileWriter()

# From 6-page part, a file for pages 1-2
outputWriterOne.addPage(inputReaderTwo.getPage(3))
outputWriterOne.addPage(inputReaderOne.getPage(2))
outputWriterOne.addPage(inputReaderOne.getPage(3))
outputWriterOne.addPage(inputReaderTwo.getPage(2))
outputStreamOne = file(outputOneFileName, "wb")
outputWriterOne.write(outputStreamOne)

