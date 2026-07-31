
# Simple Install Guide Video
# https://www.youtube.com/watch?v=0gUy05u763Y

#Source for commands 
# Standard set up - https://raspberrytips.com/install-tailscale-raspberry-pi/
# Setting up to run on Pihole https://tailscale.com/docs/solutions/block-ads-all-devices-anywhere-using-raspberry-pi


# Get pre-reqs
sudo apt install curl apt-transport-https

# Install tailscale
curl -fsSL https://tailscale.com/install.sh | sh

#Launch it
# sudo tailscale up # when running on a non DNS server
sudo tailscale up --accept-dns=false # if runing on pi-hole/device acting as DNS server

#Configure the IP forwarding so as your devices use your pi hole 
#source - https://tailscale.com/docs/features/subnet-routers/how-to/setup
echo 'net.ipv4.ip_forward = 1' | sudo tee -a /etc/sysctl.d/99-tailscale.conf
echo 'net.ipv6.conf.all.forwarding = 1' | sudo tee -a /etc/sysctl.d/99-tailscale.conf
sudo sysctl -p /etc/sysctl.d/99-tailscale.conf
sudo tailscale set --advertise-routes=XXX.XXX.XX.0/24,XXX.XXX.XX.0/24 #update to X's to be numbers for the address of the subnets you wish to enable  

# Then follow steps here
# https://tailscale.com/docs/features/subnet-routers
