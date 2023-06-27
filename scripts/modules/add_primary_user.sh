#!/bin/bash

if [[ $# -eq 0 ]]; then
  echo "ERROR: You must pass in the username of the new user account you'd like to create. Exiting."
  exit 1
fi

username=$1

echo "Adding a new user with no password and give them sudo access."
adduser $username --disabled-password  --gecos ""
passwd -d $username
usermod -aG sudo $username
