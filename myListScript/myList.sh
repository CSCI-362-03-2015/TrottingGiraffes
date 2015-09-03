#!/bin/bash
OUTPUTFILE="ls.html"
touch $OUTPUTFILE
chmod +rwx $OUTPUTFILE
echo "<html>" > $OUTPUTFILE
echo "" >> $OUTPUTFILE
ls -al | while read line
do
	echo "<BR> $line" >> $OUTPUTFILE
done

echo "" >> $OUTPUTFILE
echo "</html>" >> $OUTPUTFILE

(iceweasel -new-tab ./$OUTPUTFILE || firefox -new-tab ./$OUTPUTFILE || google-chrome -new-tab ./$OUTPUTFILE) 2>/dev/null
