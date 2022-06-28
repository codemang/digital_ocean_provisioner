#!/bin/bash

if [ $# -lt 2 ]; then
  echo "ERROR: You must pass in the username of the new user account you'd like to create on the droplet, and the email you'd like to use for nginx. Exiting."
  exit 1
fi

username=$1
email=$2

./setup_new_droplet.sh $username

su $username -c "./setup_docker.sh"
su $username -c "./setup_github_ssh_key.sh"
su $username -c "./setup_nginx_proxy.sh $email"

su nate -c "./setup_docker.sh"
