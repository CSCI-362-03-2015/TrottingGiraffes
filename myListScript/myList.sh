#!/bin/bash 

#Choose output file
OUTPUTFILE="ls.html"

#Ensure the file exists
touch $OUTPUTFILE

#Set permissions (lazily)
chmod +rwx $OUTPUTFILE

#Add HTML tag
echo "<html>" > $OUTPUTFILE
echo "" >> $OUTPUTFILE

#Call ls with -al flags
#Pipe into while loop to read each individual line
#Add <BR> HTML break for each line
ls -al | while read line
do
	echo "<BR> $line" >> $OUTPUTFILE
done

#Add closing HTML tag
echo "" >> $OUTPUTFILE
echo "</html>" >> $OUTPUTFILE

#Try to open in iceweasel, firefox, or chrome and dump error messages
#into /dev/null
(iceweasel -new-tab ./$OUTPUTFILE || firefox -new-tab ./$OUTPUTFILE || google-chrome -new-tab ./$OUTPUTFILE) 2>/dev/null
