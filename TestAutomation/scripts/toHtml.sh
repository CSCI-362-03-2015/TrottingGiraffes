OUTPUTFILE=../reports/$1
CONTENT=$2

touch $OUTPUTFILE
chmod +rwx $OUTPUTFILE

echo "<html>" > $OUTPUTFILE
echo "" >> $OUTPUTFILE

cat $CONTENT | while read line
do
	echo "<BR> $line" >> $OUTPUTFILE
done

echo "" >> $OUTPUTFILE
echo "</html>" >> $OUTPUTFILE



