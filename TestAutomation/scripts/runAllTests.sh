#!/bin/bash

#TestCases Directory
TESTCASES="../testCases"
TESTCASESEXEC="../testCasesExecutables"

#Move to test cases directory
#cd $TESTCASES // if we do this, we can't use variables for relative location

ls $TESTCASES| while read line 
do
	echo "Run testcase executable based off of $line specifications."
	
	#test to see if we can cat all files in the testcases directory
	cat "$TESTCASES"/"$line"
done

