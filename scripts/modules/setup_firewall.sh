#!/bin/bash

echo "Setting up a basic firewall."
ufw default deny incoming
ufw allow OpenSSH
ufw allow http
ufw allow https
ufw --force enable
