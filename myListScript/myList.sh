OUTPUTFILE="ls.html"
touch $OUTPUTFILE
chmod +rwx $OUTPUTFILE
echo "<html>" >> $OUTPUTFILE
echo "" >> $OUTPUTFILE
ls -al >> $OUTPUTFILE
echo "" >> $OUTPUTFILE
echo "</html>" >> $OUTPUTFILE