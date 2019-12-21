# extract-pages.py input.pdf output.pdf [ page number ]+
# Create a PDF of the specified pages from the specified PDF

import sys
from PyPDF2 import PdfFileWriter, PdfFileReader, PdfFileMerger

argumentCount = len(sys.argv) - 1  
position = 1
while (argumentCount >= position):  
    argument = sys.argv[position]
    if position == 1:
		inputFileName = argument
		print ("parameter %i: is input file %s" % (position, inputFileName))
		inputReader = PdfFileReader(open(inputFileName, "rb"))
    elif position == 2:
		outputFileName = argument 
		print ("parameter %i: is output file PDF %s" % (position, outputFileName))
		outputWriter = PdfFileWriter()
    else:
    	pageNumber = int(argument)
        print ("    adding page %i" % (pageNumber))
        pageIndex = pageNumber - 1
        outputWriter.addPage(inputReader.getPage(pageIndex))
    position = position + 1

outputStream = file(outputFileName, "wb")
outputWriter.write(outputStream)

