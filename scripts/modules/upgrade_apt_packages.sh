#!/bin/bash

# Avoid the 'Pending Kernal Upgrade' popup.
# https://askubuntu.com/a/1424249
sudo sed -i "s/#\$nrconf{kernelhints} = -1;/\$nrconf{kernelhints} = -1;/g" /etc/needrestart/needrestart.conf

# Avoid the 'Daemons using outdated libraries' popup.
# https://stackoverflow.com/a/73397970
sudo sed -i "s/#\$nrconf{restart} = 'i';/\$nrconf{restart} = 'a';/g" /etc/needrestart/needrestart.conf

sudo apt update -y
sudo apt full-upgrade -y
