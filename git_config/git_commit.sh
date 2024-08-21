#!/bin/bash

if [ "$1" == "" ]; then
    printf  "ERROR: First Arg is empty, Please Provide Commit Comment"
	## Insert print out describing how to use the script eg enter in format xxxxxx
else
        git add .
        git commit -m "$1"
        git push origin HEAD:main #Update branch name eg main or branch1 etc etc
        printf "Code Comitted. Please Verify\n"
fi