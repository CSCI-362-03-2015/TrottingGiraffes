#!/bin/bash

#  USE:  ./toHtml.sh <outputFileName> <folderToConvert>

#Sets the output directory to reports and the file name to the first argument (<outputFileName>)
OUTPUTFILE=../reports/$1
#Sets the CONTENT variable to the second argument (<folderToConvert>)
CONTENT=$2

#Ensures the output file exists and has write permissions
touch $OUTPUTFILE
chmod +rwx $OUTPUTFILE

#Writes html header tag to output file
echo "<!DOCTYPE html>" > $OUTPUTFILE
echo "<html>" >> $OUTPUTFILE
echo "" >> $OUTPUTFILE
echo "<body>" >> $OUTPUTFILE

echo "<table>" >> $OUTPUTFILE # style=\"width:100%\">" >> $OUTPUTFILE



#Pipes the output of the CONTENT file into a while loop to add <BR> tag to each line
#Writes the modified lines to output file
ls $CONTENT | while read FILENAME 
do
	echo "<tr>" >> $OUTPUTFILE

		#echo "<td>Add test number here</td>"  >> $OUTPUTFILE
	
	cat $CONTENT/$FILENAME | while read line
	do
		
		a=($line)
		PASSFAIL="${a[0]}"
		METHODANDARGUMENT="${a[1]}"

		b1="<td>$PASSFAIL"
		b2="</td>"
		echo "$b1$b2" >> $OUTPUTFILE

		a1="<td>$METHODANDARGUMENT"
		a2="</td>"
		echo "$a1$a2" >> $OUTPUTFILE

	done

	echo "</tr>" >> $OUTPUTFILE
done

echo "</table>" >> $OUTPUTFILE

echo "</body>" >> $OUTPUTFILE

#Write closing html tag to output file
echo "" >> $OUTPUTFILE
echo "</html>" >> $OUTPUTFILE



