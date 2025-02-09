#!/bin/bash

#Logic to enable SSH if not already enabled
# reference material: https://phoenixnap.com/kb/enable-ssh-raspberry-pi

ssh_service_status=$(sudo systemctl status ssh | grep "Active" | awk '{print $2}')
if [ "$ssh_service_status" = "inactive" ]
then
	echo "SSH not Started."
	sudo systemctl start ssh
	ssh_service_status=$(sudo systemctl status ssh | grep "Active" | awk '{print $2}')

	if [ "$ssh_service_status" = "inactive" ]
	then
		echo "SSH service COULD NOT be started."
	else
		echo "SSH service has now been started."
	fi
else
	echo "SSH service already running."
fi


ssh_status=$(sudo systemctl status ssh | grep "Loaded"| awk '{print $4}')
if [ "$ssh_status" = "disabled;" ]
then
	echo "SSH not Enabled."
	sudo systemctl enable ssh
	ssh_status=$(sudo systemctl status ssh | grep "Loaded"| awk '{print $4}')
	if [ "$ssh_status" = "disabled;" ]
	then
		echo "SSH service COULD NOT be enabled."
	else
		echo "SSH service has now been enabled."
	fi
else
	echo "SSH service already enabled."
fi