#!/bin/bash

# This script sets up a new DigitalOcean droplet according to the instructions found here:
# https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-22-04

if [[ $# -eq 0 ]]; then
  echo "ERROR: You must pass in the username of the new user account you'd like to create on the droplet. Exiting."
  exit 1
fi

username=$1

echo "Setting up a new droplet for user: $username"

echo "Adding a new user with no password and give them sudo access."
adduser $username --disabled-password  --gecos ""
passwd -d $username
usermod -aG sudo $username

echo "Setting up a basic firewall."
ufw default deny incoming
ufw allow OpenSSH
ufw allow http
ufw allow https
ufw --force enable


echo "Copying the SSH config from the root user to the new user, so that you can SSH in as the new user."
rsync --archive --chown=$username:$username ~/.ssh /home/$username
# https://www.digitalocean.com/community/tutorials/how-to-add-swap-space-on-ubuntu-20-04
echo "Adding 4GB of swap memory."
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo cp /etc/fstab /etc/fstab.bak
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
sudo sysctl vm.swappiness=10
echo "vm.swappiness=10" >> /etc/sysctl.conf

# https://docs.digitalocean.com/products/monitoring/how-to/install-agent/
echo "Enabling advanced metrics."
curl -sSL https://repos.insights.digitalocean.com/install.sh | sudo bash
