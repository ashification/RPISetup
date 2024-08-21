# RPISetup
Repo for setting up and configuring raspberry pis 

To download the packages please run the following on your pis

    sudo apt-get install git                             # To download files from git you will need to install this package, its not standard
    mkdir ~/git-repos                                    # Create a sub directory for the repositories you wish to use 
    cd git-repos				         # Open the directory in which you wish to clone your repo
    git clone https://github.com/ashification/RPISetup   # Run this commant to clone the repo
    chmod -R 777 ~/git-repos                             # Run this to make the repo executable by all users



Once cloned then run the files you need from the sub directory.
You can run them where you are in the directory or navigate and open their location and run from there whichever youre more comfortable with 


e.g. to run this file https://github.com/ashification/RPISetup/blob/main/Installers/rpi_base_installer.sh
    
    sh ./Installers/rpi_base_installer.sh
	
