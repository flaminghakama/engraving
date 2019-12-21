# bookify-6page-outside.py

# bookify-6page-inside.py input1.pdf output1.pdf

import sys
from PyPDF2 import PdfFileWriter, PdfFileReader, PdfFileMerger

inputOneFileName = sys.argv[1] 
outputOneFileName = sys.argv[2] 
print "input 1: " + inputOneFileName
print "output 1: " + outputOneFileName 

inputReaderOne = PdfFileReader(open(inputOneFileName, "rb"))
outputWriterOne = PdfFileWriter()

outputWriterOne.addPage(inputReaderOne.getPage(5))
outputWriterOne.addPage(inputReaderOne.getPage(0))
outputWriterOne.addPage(inputReaderOne.getPage(1))
outputWriterOne.addPage(inputReaderOne.getPage(4))

outputStreamOne = file(outputOneFileName, "wb")
outputWriterOne.write(outputStreamOne)
