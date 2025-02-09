#!/bin/bash

# Logic to enable i2c if not already enabled
# reference https://pi3g.com/enabling-and-checking-i2c-on-the-raspberry-pi-using-the-command-line-for-your-own-scripts/

i2c_status=$(sudo raspi-config nonint get_i2c) # Check status of i2c 
if [ $i2c_status -eq 1 ] 
then
	echo "i2C not enabled."
	sudo raspi-config nonint do_i2c 0
	i2c_status=$(sudo raspi-config nonint get_i2c)
	if [ $i2c_status -eq 1 ]
	then
		echo "i2C COULD NOT be enabled."
	else
		echo "i2C has now been enabled."
	fi
else
	echo "i2C already enabled."
fi