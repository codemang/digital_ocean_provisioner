#!/bin/bash

if [ $# -lt 1 ]; then
  echo "ERROR: You must pass in the username of the new user account you'd like to create. Exiting."
  exit 1
fi

username=$1

echo "Copying the SSH config from the root user to the new user, so that you can SSH in as the new user."
rsync --archive --chown=$username:$username ~/.ssh /home/$username

