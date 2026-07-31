

#Source 
# Standard set up - https://raspberrytips.com/install-tailscale-raspberry-pi/
# Setting up to run on Pihole https://tailscale.com/docs/solutions/block-ads-all-devices-anywhere-using-raspberry-pi


# Get pre-reqs
sudo apt install curl apt-transport-https

# Install tailscale
curl -fsSL https://tailscale.com/install.sh | sh

#Launch it
# sudo tailscale up # when running on a non DNS server
sudo tailscale up --accept-dns=false # if runing on pi-hole/device acting as DNS server
