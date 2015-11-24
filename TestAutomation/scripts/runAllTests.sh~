#!/bin/bash

#TestCases Directory
TESTCASES="../testCases"
TESTCASESEXEC="../testCasesExecutables"



cd ../project/src/java-html-sanitizer-master
	mkdir -p target/classes
	pwd
	javac -cp $JAVA_HOME:lib/guava-libraries/guava.jar:lib/guava-libraries/guava-src.jar:lib/commons-codec-1.4/commons-codec-1.4.jar:lib/htmlparser-1.3/htmlparser-1.3.jar:lib/htmlparser-1.3/htmlparser-1.3-with-transitions.jar:lib/jsr305/jsr305.jar:lib/junit/junit.jar:lib/junit/junit-dep.jar:lib/junit/junit-src.jar:. ./src/main/java/org/owasp/html/*.java ./src/main/java/org/owasp/html/examples/*.java -d ./target/classes

cd ../../../scripts
#Move to test cases directory
#cd $TESTCASES // if we do this, we can't use variables for relative location

cd ../testCasesExecutables/
ls ./org/trotting | while read FILENAME 
do

	#test to see if we can cat all files in the testcases directory
	javac -cp ../project/src/java-html-sanitizer-master/target/classes/:$JAVA_HOME:/home/securepaas/TrottingGiraffes/TrottingGiraffes/TestAutomation/project/src/java-html-sanitizer-master/lib org/trotting/$FILENAME

done


cd ../../../scripts

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


		if [ $COUNTER -eq 1 ]
		then
			TESTNUMBER=$CHOPPED
		fi

		if [ $COUNTER -eq 3 ]
		then
			CLASSNAME=$CHOPPED
		fi

		if [ $COUNTER -eq 4 ]
		then
			METHOD=$CHOPPED
		fi

		if [ $COUNTER -eq 5 ]
		then
			TEST=$CHOPPED
		fi

		if [ $COUNTER -eq 6 ]
		then
			ORACLE=$CHOPPED
			
			cd ../testCasesExecutables

			JAVACSTRING="TEST$CLASSNAME"
			JAVAENDING=".java"
			JAVACFULLSTRING="$JAVACSTRING$JAVAENDING"


			JAVASTRING="TEST$CLASSNAME"

		OUTPUTFILE1="../reports/TEST$TESTNUMBER"
		OUTPUTFILE2="$CLASSNAME.txt"
		OUTPUTFILE="$OUTPUTFILE1$OUTPUTFILE2"


		touch $OUTPUTFILE

			#javac -cp ../project/src/java-html-sanitizer-master/target/classes/:$JAVA_HOME org/trotting/$JAVACSTRING.java && 
echo $(java -cp ../project/src/java-html-sanitizer-master/target/classes/:$JAVA_HOME:../project/src/java-html-sanitizer-master/lib/guava-libraries/guava.jar org/trotting/$JAVASTRING $TEST $ORACLE) > $OUTPUTFILE



			
		fi

	done
 
	echo ""
	echo ""

done

		HTMLOUTPUTFILE="../reports/myResults.html"
		cd ../scripts
		
		(./toCompiledHtmlWithCss.sh $HTMLOUTPUTFILE ../reports && firefox -new-tab ./$HTMLOUTPUTFILE) 
#2>/dev/null

