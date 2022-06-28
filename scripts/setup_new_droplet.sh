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
sudo ufw default deny incoming
ufw allow OpenSSH
ufw --force enable

echo "Copying the SSH config from the root user to the new user, so that you can SSH in as the new user."
rsync --archive --chown=$username:$username ~/.ssh /home/$username

echo "Adding 4GB of swap memory."
sudo /bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=4024
sudo /sbin/mkswap /var/swap.1
sudo /sbin/swapon /var/swap.1
sudo sh -c 'echo "/var/swap.1 swap swap defaults 0 0 " >> /etc/fstab'

# https://docs.digitalocean.com/products/monitoring/how-to/install-agent/
echo "Enabling advanced metrics."
curl -sSL https://repos.insights.digitalocean.com/install.sh | sudo bash
