#!/bin/bash

#TestCases Directory which contains our test case text files
TESTCASES="../testCases"
#TestCasesExecutables directory which contains our java drivers for the methods to be tested
TESTCASESEXEC="../testCasesExecutables"

timestamp() {
  date +"%T"
}

removeTemp() {
  rm -rf ./testCasesExecutables/org/trotting/*~
  rm -rf ./testCasesExecutables/org/trotting/*.class
  rm -rf ./testCases/*~
  rm -rf ./temp/*
  mkdir ./temp 2>/dev/null
  mkdir ./reports 2>/dev/null
}

removeTemp

#Navigate to the main folder for the OWASP Java HTML Sanitizer
cd ./project/src/java-html-sanitizer-master

#Creates a target directory next to the source folder to save the compiled class files too	
mkdir -p target/classes
../../../scripts/mightyGiraffes.sh

#Compile the OWASP Project files
javac -cp $JAVA_HOME:lib/guava-libraries/guava.jar:lib/guava-libraries/guava-src.jar:lib/commons-codec-1.4/commons-codec-1.4.jar:lib/htmlparser-1.3/htmlparser-1.3.jar:lib/htmlparser-1.3/htmlparser-1.3-with-transitions.jar:lib/jsr305/jsr305.jar:lib/junit/junit.jar:lib/junit/junit-dep.jar:lib/junit/junit-src.jar:. ./src/main/java/org/owasp/html/*.java ./src/main/java/org/owasp/html/examples/*.java -d ./target/classes 2>/dev/null

cd ../../../scripts

#Compile all of our test drivers from the testCasesExecutables directory
cd ../testCasesExecutables/
ls ./org/trotting | while read FILENAME 
do
	#test to see if we can cat all files in the testcases directory and pipe errors into /dev/null.
	#Errors come from .class files already existing within the folder, instead of purely .java files.
	#javac will write over the previously existing files, so the error is not important
	(javac -cp ../project/src/java-html-sanitizer-master/target/classes/:$JAVA_HOME:../project/src/java-html-sanitizer-master/lib org/trotting/$FILENAME) 2>/dev/null

done
#I think this can be removed but dont want to try while editing so many other things
#cd ../../../scripts

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
		#For instance, if the line says 1. Hello, this will return Hello
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

		#If second line, this indicates the test requirement
		#if [ $COUNTER -eq 2 ]
		#then
			#TESTNUMBER=$CHOPPED
		#fi

		#If third line, this indicates the class to be tested
		if [ $COUNTER -eq 3 ]
		then
			CLASSNAME=$CHOPPED
		fi

		#If fourth line, this indicates the method to be tested
		if [ $COUNTER -eq 4 ]
		then
			METHOD=$CHOPPED
		fi

		#If fifth line, this indicates the test parameter to be inserted into the method
		if [ $COUNTER -eq 5 ]
		then
			TEST=$CHOPPED
		fi

		#If sixth line, this indicates the oracle, which is the expected result returned from the tested method
		#In addition to pulling the oracle, at this step we also run the driver
		if [ $COUNTER -eq 6 ]
		then
			ORACLE=$CHOPPED
			
			cd ../testCasesExecutables

			JAVACSTRING="TEST$CLASSNAME"
			JAVAENDING=".java"
			JAVACFULLSTRING="$JAVACSTRING$JAVAENDING"


			JAVASTRING="TEST$CLASSNAME"

			#Temporary variables used for string building the name of the results file
			OUTPUTFILE1="../temp/TEST$TESTNUMBER"
			OUTPUTFILE2="$CLASSNAME.txt"
			
			#File where the results will be printed to
			OUTPUTFILE="$OUTPUTFILE1$OUTPUTFILE2"

			#Ensure outputfile exists before trying to print to it
			touch $OUTPUTFILE

			#Creates a subshell to run the java driver #in so that we can capture the ouput and print it to outputfile
			#This will overwrite any existing results from previous runs
			echo $(java -cp ../project/src/java-html-sanitizer-master/target/classes/:org/trotting/:$JAVA_HOME:../project/src/java-html-sanitizer-master/lib/guava-libraries/guava.jar org/trotting/$JAVASTRING $TEST $ORACLE) > $OUTPUTFILE



			
		fi

	done
	echo ""
	echo ""

done
		#File to print html into to display our results table
		HTMLOUTPUTFILE="../reports/testResults$(timestamp).html"
		cd ../scripts
		(./toCompiledHtmlWithCss.sh $HTMLOUTPUTFILE ../temp && xdg-open ./$HTMLOUTPUTFILE &)
