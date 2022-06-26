#!/bin/bash

if [ $# -lt 2 ]; then
  echo "ERROR: You must pass in the username of the new user account you'd like to create on the droplet, and the email you'd like to use for nginx. Exiting."
  exit 1
fi

username=$1
email=$2

curl -s https://raw.githubusercontent.com/codemang/digital_ocean_provisioner/master/setup_new_droplet.sh | bash -s $username

su $username -c "curl -s https://raw.githubusercontent.com/codemang/digital_ocean_provisioner/master/setup_docker.sh | bash"
su $username -c "curl -s https://raw.githubusercontent.com/codemang/digital_ocean_provisioner/master/setup_github_ssh_key.sh | bash"

# We need to first cd into the home directory before running this script, since
# it creates a proxy directory for us.
su $username -c "cd && curl -s https://raw.githubusercontent.com/codemang/digital_ocean_provisioner/master/setup_nginx_proxy.sh | bash -s $email"
