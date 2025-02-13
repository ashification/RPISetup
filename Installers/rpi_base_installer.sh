 #################################################################
## 		         Set up file		                            ##
## ---------------------------------------------------------    ## 
##| Editor | Version |    Date    |       Comments          |   ## 
## ---------------------------------------------------------    ##    
##   ALee      1.0      10/05/18    Created                     ##
##   ALee      1.1      21/05/18    bluepy                      ##
##   ALee	   1.2		01/02/21    add vim                     ##
##   TRW 	   1.3		09/02/25    Add auto Y                  ##
##   ALEE 	   1.4		09/02/25    Add Run Auxillary Scripts   ##
## 					                                            ##
 #################################################################


#!/bin/bash

#Start Up
echo "Welcome to system set up" 
echo "HOST: " $HOSTNAME
echo "USER: " $USER

#Configure internet connection
echo "Configure internet connection"
#echo "Are you using WiFi ? [Y = 1 /N = 0] "   
#read wirelessconnection #
#
#if[wirelessconnection=1]
#then
#https://unix.stackexchange.com/questions/92799/connecting-to-wifi-network-through-command-line
#	sudo dhclient wlan0
#	##nmcli dev wifi connect $ssid password $password
#
#fi

hostname -I # Display IP address

# Install
echo "Installing software and updates"
sudo apt-get -y update
sudo apt-get -y upgrade
 
sudo apt-get install  vim                    # install the vim text editor
sudo apt-get install  git                    # install git repo
sudo apt-get install  gcc                    # install c/c++ compiler
sudo apt-get install  wiringpi               # Allows for GPIO control
sudo apt-get install  i2c-tools              # install i2c tools

sudo apt-get install  nmap  # SSH
sudo apt-get install  xrdp  # Remote PC
sudo apt-get install  nmcli # Command-line tool for controlling NetworkManager

sudo apt-get install  python
sudo apt-get install  mysql-server
sudo apt-get install  npm i bluetoothctl
sudo apt-get install  bluez                 #Bluetooth libraries
sudo apt-get install  bluez-utils           #Bluetooth controls
sudo apt-get install python-pip
sudo apt-get install libglib2.0-dev
sudo pip install bluepy

sudo pip     install  pygatt                                     #Bluetooth GATT protocol python Library
sudo pip     install  "pygatt[GATTTOOL]"		 	                     #Library relative to script being ran
sudo pip     install  git+https://github.com/peplin/pygatt  	    #Library relative to script being ran
sudo -E pip  install  pexpect					                               #Library relative to script being ran

#sudo apt install qtcreator libssl-dev git;
sudo apt install qt5-default;
git clone https://github.com/derekmolloy/ee513Assignment2;
git clone http://github.com/eclipse/paho.mqtt.c;
cd paho.mqtt.c/;
make;
sudo make install;
qmake --version;
qtcreator &;

## Source for repo https://nodered.org/docs/getting-started/raspberrypi
bash <(curl -sL https://raw.githubusercontent.com/node-red/linux-installers/master/deb/update-nodejs-and-nodered) # Install NodeRed for RPI
##node-red-start # Starts node red
sudo systemctl enable nodered.service # Ensures Nodewred runs on startup

# Running system Config Scripts to enable features. 
# Comment out if you do not wish to enable any of the following

    #Configure i2C
    sh ./RPISetup/system_setup/i2c_enabling.sh  

    #Configure SSH
    sh ./RPISetup/system_setup/ssh_enabling.sh
