#!/bin/bash

echo "Copying the SSH config from the root user to the new user, so that you can SSH in as the new user."
rsync --archive --chown=$username:$username ~/.ssh /home/$username

