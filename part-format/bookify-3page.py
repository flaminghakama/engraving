# bookify-3page.py

# bookify-3page.py input.pdf output.pdf

import sys
from PyPDF2 import PdfFileWriter, PdfFileReader, PdfFileMerger

inputFileName = sys.argv[1] 
outputFileName = sys.argv[2] 
print "input: " + inputFileName 
print "output: " + outputFileName 

inputReader = PdfFileReader(open(inputFileName, "rb"))
outputWriter = PdfFileWriter()

outputWriter.addPage(inputReader.getPage(0))
outputWriter.addPage(inputReader.getPage(1))
outputWriter.addPage(inputReader.getPage(2))
outputWriter.insertBlankPage()
outputStream = file(outputFileName, "wb")
outputWriter.write(outputStream)
