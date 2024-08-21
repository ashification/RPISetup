# Install and configure a git autodeploy from https://github.com/olipo186/Git-Auto-Deploy
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:olipo186/git-auto-deploy
sudo apt-get update

# Install Git-Auto-Deploy using apt.
sudo apt-get install git-auto-deploy

# Modify the configuration file to match your project setup. Read more about the configuration options.
# https://github.com/olipo186/Git-Auto-Deploy/blob/master/docs/Configuration.md
nano /etc/git-auto-deploy.conf.json


# Optional: Copy any private SSH key you wish to use to the home directory of GAD. 
# Check out this document for more on SSH keys https://github.com/olipo186/Git-Auto-Deploy/blob/master/docs/add-ssh-keys.md
#sudo cp /path/to/id_rsa /etc/git-auto-deploy/.ssh/
#sudo chown -R git-auto-deploy:git-auto-deploy /etc/git-auto-deploy

# Start Git-Auto-Deploy and check it's status.
service git-auto-deploy start
service git-auto-deploy status