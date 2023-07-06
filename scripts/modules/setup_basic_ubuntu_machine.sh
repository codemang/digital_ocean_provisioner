#!/bin/bash

# This script sets up a new DigitalOcean droplet according to the instructions found here:
# https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-22-04

if [[ $# -eq 0 ]]; then
  echo "ERROR: You must pass in the username of the new user account you'd like to create on the droplet. Exiting."
  exit 1
fi

username=$1
echo "Setting up a new droplet for user: $username"

./modules/upgrade_apt_packages.sh
./modules/add_primary_user.sh
./modules/setup_firewall.sh
./modules/add_swap_memory.sh
