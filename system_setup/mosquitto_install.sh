#!/bin/bash

#Logic to install and enable Mosquitto  if not already completed
 #Reference material https://randomnerdtutorials.com/how-to-install-mosquitto-broker-on-raspberry-pi/

 sudo apt-get install mosquitto
 sudo apt-get install mosquitto-clients
 

mosquitto_service_status=$(sudo systemctl status mosquitto.service | grep "Active" | awk '{print $2}')
if [ "$mosquitto_service_status" = "inactive" ]
then
	echo "Mosquitto not Started."
	sudo systemctl start mosquitto.service
	mosquitto_service_status=$(sudo systemctl status mosquitto.service | grep "Active" | awk '{print $2}')

	if [ "$mosquitto_service_status" = "inactive" ]
	then
		echo "Mosquitto service COULD NOT be started."
	else
		echo "Mosquitto service has now been started."
	fi
else
	echo "Mosquitto service already running."
fi


mosquitto_status=$(sudo systemctl status mosquitto.service | grep "Loaded"| awk '{print $4}')
if [ "$mosquitto_status" = "disabled;" ]
then
	echo "Mosquitto not Enabled."
	sudo systemctl enable mosquitto.service
	mosquitto_status=$(sudo systemctl status mosquitto.service | grep "Loaded"| awk '{print $4}')
	if [ "$mosquitto_status" = "disabled;" ]
	then
		echo "Mosquitto service COULD NOT be enabled."
	else
		echo "Mosquitto service has now been enabled."
	fi
else
	echo "Mosquitto service already enabled."
fi
