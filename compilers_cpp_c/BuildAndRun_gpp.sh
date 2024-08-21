#!/bin/bash

if [ "$1" == "" ]; then
    printf  "ERROR: First Arg is empty, Please declare script name"
	## Insert print out describing how to use the script eg enter in format xxxxxx

else
	printf  "Building Script Please wait...\n"
	g++ $1 I2CDevice.cpp ADXL345.cpp -o ca2_script_$2 -lpaho-mqtt3c 
	printf  "Running Script now....\n\n\n"
	./ca2_script_$2
	printf "\n\n"
	printf "Script End\n"

fi