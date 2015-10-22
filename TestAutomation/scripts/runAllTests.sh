#!/bin/bash

#TestCases Directory
TESTCASES="../testCases"
TESTCASESEXEC="../testCasesExecutables"


#Move to test cases directory
#cd $TESTCASES // if we do this, we can't use variables for relative location

ls $TESTCASES | while read FILENAME 
do
	echo "Run testcase executable based off of $FILENAME specifications."
	echo ""

	#test to see if we can cat all files in the testcases directory

	COUNTER=0
	cat "$TESTCASES"/"$FILENAME" | while read TESTCASESLINE
	do
		let COUNTER=(COUNTER + 1)

		#Get length of line string for formatting
		TESTCASESLINELENGTH=${#TESTCASESLINE}
		#Cut off numbers at beginning of lines
		TESTCASESLINECHOPPED="${TESTCASESLINE:3:$TESTCASESLINELENGTH}"
		
		####Delete comments
		#Get position of double hash character (##)
		#Thanks to modified responses to:
		#http://stackoverflow.com/questions/20348097/bash-extract-string-before-a-colon 
		
		CHARPOS=$(echo $TESTCASESLINECHOPPED | grep -b -o "##" | cut -d: -f1)
		
		#Get substring with comment removed
		echo ${TESTCASESLINECHOPPED:0:$CHARPOS}	
		CHOPPED=${TESTCASESLINECHOPPED:0:$CHARPOS}
		if [ $COUNTER -eq 5 ]
		then
			TEST=$CHOPPED
		fi

		if [ $COUNTER -eq 6 ]
		then
			ORACLE=$CHOPPED
			
			cd ../testCasesExecutables

			javac -cp ../project/src/java-html-sanitizer-master/target/classes/:$JAVA_HOME org/trotting/TrottingEncodingTest1.java && java -cp ../project/src/java-html-sanitizer-master/target/classes/:$JAVA_HOME:../project/src/java-html-sanitizer-master/lib/guava-libraries/guava.jar org/trotting/TrottingEncodingTest1 $TEST $ORACLE

			
		fi
		touch "../reports/resultsForTestNumber$COUNTER.txt"

	done
 
	echo ""
	echo ""

done


