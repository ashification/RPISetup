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
 
sudo apt-get install -y vim                    # install the vim text editor
sudo apt-get install -y git                    # install git repo
sudo apt-get install -y gcc                    # install c/c++ compiler
sudo apt-get install -y wiringpi               # Allows for GPIO control
sudo apt-get install -y i2c-tools              # install i2c tools
sudo apt-get install -y openssl                 # Install OpenSSL for iuse with security cert and keys
sudo apt install -y npm nodejs                  # Install npm and nodejs (dependancies for node red)

# QR code generator tool and pre-requisite packages
sudo apt-get install -y qrencode                
sudo apt-get install -y autoconf
sudo apt-get install -y automake
sudo apt-get install -y autotools-dev
sudo apt-get install -y libtool
sudo apt-get install -y pkg-config
sudo apt-get install -y libpng-dev

sudo apt-get install  -y nmap  # SSH
sudo apt-get install  -y xrdp  # Remote PC
sudo apt-get install  -y nmcli # Command-line tool for controlling NetworkManager

sudo apt-get install -y python
sudo apt-get install -y mysql-server
sudo apt-get install -y npm i bluetoothctl
sudo apt-get install -y bluez                 #Bluetooth libraries
sudo apt-get install -y bluez-utils           #Bluetooth controls
sudo apt-get install -y python-pip
sudo apt-get install -y libglib2.0-dev
sudo pip install -y bluepy

sudo pip     install  pygatt                                     #Bluetooth GATT protocol python Library
sudo pip     install  "pygatt[GATTTOOL]"		 	                     #Library relative to script being ran
sudo pip     install  git+https://github.com/peplin/pygatt  	    #Library relative to script being ran
sudo -E pip  install  pexpect					                               #Library relative to script being ran


## Installing Wireguard
 #sudo apt-get install wireguard wireguard-tools
 # Follow steps here to configure youre server https://docs.pi-hole.net/guides/vpn/wireguard/server/

# Running system Config Scripts to enable features. 
# Comment out if you do not wish to enable any of the following
    #Install Mosquitto MQTT Broker
     sh ./RPISetup/system_setup/mosquitto_install.sh
     mosquitto -v         # Run this command to check MQTT version
     # netstat -a
        
    ## Installing nodeRed
    sh ./RPISetup/system_setup/nodered_install.sh
    
    #Configure i2C
    sh ./RPISetup/system_setup/i2c_enabling.sh  

    #Configure SSH
    sh ./RPISetup/system_setup/ssh_enabling.sh
