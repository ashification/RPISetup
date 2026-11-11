#!/bin/bash

 ## Source for repo https://nodered.org/docs/getting-started/raspberrypi

  bash <(curl -sL https://github.com/node-red/linux-installers/releases/latest/download/install-update-nodered-deb) # Install NodeRed for RPI
  npm install node-red-dashboard                                                                                    # Install the dashboard package for nodeRed
  #npm install node-red-contrib-alexa-remote2                                                                        # Follow instructions here -> https://tech.scargill.net/node-red-contrib-alexa-cakebaked/
  #npm install node-red-contrib-tplink-tapo-connect-api                                                              # Install Tapo integration module - https://flows.nodered.org/node/node-red-contrib-tplink-tapo-connect-api
  #npm install node-red-contrib-amazon-echo
  #npm install @node-red-matter/node-red-matter                                                                      # enables the generation of Matter devices within Node-RED
  #npm install @sammachin/node-red-matter-bridge                                                                     # allow users to create a Matter Bridge and wisimulate devices to their Matter controller (eg Apple Home, Google Home, Alexa etc)
  #npm install @sammachin/node-red-matter-controller                                                                 # allow users to control Matter devices from Node RED
  

  ## If the install goes wrong below are the commands to uninstall nodeRed
  ## ref https://community.openhab.org/t/how-to-uninstall-node-red/104013
  ## sudo npm remove -g node-red node-red-admin
  ## rm -R ~/.node-red


nodered_status=$(sudo systemctl status nodered | grep "Loaded"| awk '{print $4}')
if [ "$nodered_status" = "disabled;" ]
then
	echo "Node Red not Enabled."
	sudo systemctl enable nodered.service  # Ensures Nodered runs on startup
	nodered_status=$(sudo systemctl status nodered | grep "Loaded"| awk '{print $4}')
	if [ "$nodered_status" = "disabled;" ]
	then
		echo "Node Red service COULD NOT be enabled."
	else
		echo "Node Red service has now been enabled."
	fi
else
	echo "Node Red service already enabled."
fi

nodered_service_status=$(sudo systemctl status nodered | grep "Active" | awk '{print $2}')
if [ "$nodered_service_status" = "inactive" ]
then
	echo "Node Red not Started."
	node-red-start # to manuallystarts node red
	nodered_service_status=$(sudo systemctl status nodered | grep "Active" | awk '{print $2}')

	if [ "$nodered_service_status" = "inactive" ]
	then
		echo "Node Red service COULD NOT be started."
	else
		echo "Node Red service has now been started."
	fi
else
	echo "Node Red service already running."
fi
