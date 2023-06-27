#!/bin/bash

# https://docs.digitalocean.com/products/monitoring/how-to/install-agent/
echo "Enabling advanced metrics."
curl -sSL https://repos.insights.digitalocean.com/install.sh | sudo bash
