#!/bin/bash

if [[ $# -eq 0 ]]; then
  echo "ERROR: You must pass in the username of the new user account you'd like to create on the droplet. Exiting."
  exit 1
fi

username=$1

curl -s https://raw.githubusercontent.com/codemang/digital_ocean_provisioner/master/setup_new_droplet.sh | bash -s $username
curl -s https://raw.githubusercontent.com/codemang/digital_ocean_provisioner/master/setup_docker.sh | bash
curl -s https://raw.githubusercontent.com/codemang/digital_ocean_provisioner/master/setup_github_ssh_key.sh | bash
