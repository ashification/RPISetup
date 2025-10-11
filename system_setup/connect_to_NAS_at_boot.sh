# Adapted from 
# https://thepihut.com/blogs/raspberry-pi-tutorials/26871940-connecting-to-network-storage-at-boot?srsltid=AfmBOorCXMVUplrcn-FqgFW8RaiLYnDm9Xnd2HcFFKOO8E72Jj6wWU3m
# and 
# https://pimylifeup.com/raspberry-pi-nfs-client/
# Using a synology NAS - enable NFS 

# On windows PC enable SMB1 
# https://learn.microsoft.com/en-us/windows-server/storage/file-server/troubleshoot/detect-enable-and-disable-smbv1-v2-v3?tabs=server
# Control Panel > Programs > Turn Windows features on or off. Locate and check the box for SMB 1.0/CIFS File Sharing Support, click OK, and then restart your computer to apply the changes

sudo apt install nfs-common
cd ~ #Open your users home directory
mkdir <new directory name>  # Make a new directory. Use whatever directory name you want
sudo update-rc.d rpcbind enable #Enable file locking
sudo cp /etc/fstab /etc/fstab.backup # take a backup of the file sys table
sudo vim /etc/fstab # open fstab file to edit
  ## Add the path to your NAS at the end of the file
   //<NAS IP>:/<NAS Volume/<Path> /home/<pi User>/<name of directory created earlier> nfs auto 0 0


#Manual mount
sudo mount -t nfs -o proto=tcp,port=2049 <NAS IP>/<NAS Volume/<Path> /home/<pi User>/<name of directory created earlier>
sudo mount -a

#Use teh following to restore to previous backup if issues arise
# sudo cp /etc/fstab.backup /etc/fstab
