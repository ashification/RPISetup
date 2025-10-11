 #################################################################
## 		                Set up file		                            ##
## ---------------------------------------------------------    ## 
##| Editor | Version |    Date    |       Comments          |   ## 
## ---------------------------------------------------------    ##    
##   ALee      1.0      11/10/25     Created                    ##
 #################################################################


#  This file servers to run required code to install and configure 
#  a plex media server on a raspberry pi 5 
# Taken and adapted from:
#    https://pimylifeup.com/raspberry-pi-plex-server/

#!/bin/bash

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install apt-transport-https # Plex install file only available via https run incase not presently on pi
curl https://downloads.plex.tv/plex-keys/PlexSign.key | gpg --dearmor | sudo tee /usr/share/keyrings/plex-archive-keyring.gpg >/dev/null # Add plex repos to keyrings dir
echo deb [signed-by=/usr/share/keyrings/plex-archive-keyring.gpg] https://downloads.plex.tv/repo/deb public main | sudo tee /etc/apt/sources.list.d/plexmediaserver.list # add plex main repo to sources list
sudo apt -y update # run again since new repos were added
sudo apt install plexmediaserver # install plex official package
