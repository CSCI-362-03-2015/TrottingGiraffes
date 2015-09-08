#!/bin/bash

#  USE:  ./toHtml.sh <outputFileName> <fileToConvert>

#Sets the output directory to reports and the file name to the first argument (<outputFileName>)
OUTPUTFILE=../reports/$1
#Sets the CONTENT variable to the second argument (<fileToConvert>)
CONTENT=$2

#Ensures the output file exists and has write permissions
touch $OUTPUTFILE
chmod +rwx $OUTPUTFILE

#Writes html header tag to output file
echo "<html>" > $OUTPUTFILE
echo "" >> $OUTPUTFILE


#Pipes the output of the CONTENT file into a while loop to add <BR> tag to each line
#Writes the modified lines to output file

cat $CONTENT | while read line
do
	echo "<BR> $line" >> $OUTPUTFILE
done

#Write closing html tag to output file
echo "" >> $OUTPUTFILE
echo "</html>" >> $OUTPUTFILE



