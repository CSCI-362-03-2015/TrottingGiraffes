#!/bin/bash

#TestCases Directory which contains our test case text files
TESTCASES="../testCases"
#TestCasesExecutables directory which contains our java drivers for the methods to be tested
TESTCASESEXEC="../testCasesExecutables"


#Navigate to the main folder for the OWASP Java HTML Sanitizer
cd ../project/src/java-html-sanitizer-master

#Creates a target directory next to the source folder to save the compiled class files too	
mkdir -p target/classes

#Compile the OWASP Project files
javac -cp $JAVA_HOME:lib/guava-libraries/guava.jar:lib/guava-libraries/guava-src.jar:lib/commons-codec-1.4/commons-codec-1.4.jar:lib/htmlparser-1.3/htmlparser-1.3.jar:lib/htmlparser-1.3/htmlparser-1.3-with-transitions.jar:lib/jsr305/jsr305.jar:lib/junit/junit.jar:lib/junit/junit-dep.jar:lib/junit/junit-src.jar:. ./src/main/java/org/owasp/html/*.java ./src/main/java/org/owasp/html/examples/*.java -d ./target/classes

#I think this can be removed but don't want to try while editing so many other things
cd ../../../scripts

#Compile all of our test drivers from the testCasesExecutables directory
cd ../testCasesExecutables/
ls ./org/trotting | while read FILENAME 
do
	#test to see if we can cat all files in the testcases directory and pipe errors into /dev/null.
	#Errors come from .class files already existing within the folder, instead of purely .java files.
	#javac will write over the previously existing files, so the error is not important
	(javac -cp ../project/src/java-html-sanitizer-master/target/classes/:$JAVA_HOME:/home/securepaas/TrottingGiraffes/TrottingGiraffes/TestAutomation/project/src/java-html-sanitizer-master/lib org/trotting/$FILENAME) 2>/dev/null

done

#I think this can be removed but don't want to try while editing so many other things
cd ../../../scripts

#Iterates through each text file within the TestCases directory 
#This will pull the information and run the matching java driver
ls $TESTCASES | while read FILENAME 
do
	echo "Running testcase executable based off of $FILENAME specifications:"
	echo ""

	#Iterate through the individual text files and grab the information line-by-line
	COUNTER=0
	cat "$TESTCASES"/"$FILENAME" | while read TESTCASESLINE
	do
		let COUNTER=(COUNTER + 1)

		#Get length of line string for formatting
		TESTCASESLINELENGTH=${#TESTCASESLINE}

		#Remove numbers at beginning of lines
		#For instance, if the line says "1. Hello", this will return "Hello"
		TESTCASESLINECHOPPED="${TESTCASESLINE:3:$TESTCASESLINELENGTH}"
		
		#Deletes any comments within the test case files, marked by ## (double hash)
		#Get position of double hash character (##)
		#Thanks to modified responses to:
		#http://stackoverflow.com/questions/20348097/bash-extract-string-before-a-colon 
		
		CHARPOS=$(echo $TESTCASESLINECHOPPED | grep -b -o "##" | cut -d: -f1)
		
		#Get substring of the line with comment removed
		echo ${TESTCASESLINECHOPPED:0:$CHARPOS}	
		CHOPPED=${TESTCASESLINECHOPPED:0:$CHARPOS}

		#If first line, this indicates the test number
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

