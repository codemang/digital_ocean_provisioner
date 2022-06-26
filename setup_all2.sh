#!/bin/bash

if [ $# -lt 2 ]; then
  echo "ERROR: You must pass in the username of the new user account you'd like to create on the droplet, and the email you'd like to use for nginx. Exiting."
  exit 1
fi

username=$1
email=$2

./setup_new_droplet.sh $username
./setup_docker.sh
./setup_github_ssh_key.sh
./setup_nginx_proxy.sh $email
