#!/bin/bash

if [ $# -lt 2 ]; then
  echo "ERROR: You must pass in the username of the new user account you'd like to create on the droplet, and the email you'd like to use for nginx. Exiting."
  exit 1
fi

username=$1
email=$2

# https://unix.stackexchange.com/a/273348
script_dir="${0%/*}"

sudo ./$script_dir/modules/add_primary_user.sh $username
sudo ./$script_dir/modules/setup_firewall.sh
sudo ./$script_dir/modules/add_swap_memory.sh
su $username -c ./$script_dir/modules/setup_docker.sh
su $username -c ./$script_dir/modules/setup_github_ssh_key.sh
su $username -c "./$script_dir/modules/setup_nginx_proxy.sh $email"
su $username -c ./$script_dir/modules/setup_app_deployer.sh

echo "All done! Rebooting so new configs can take effect."
sudo reboot
