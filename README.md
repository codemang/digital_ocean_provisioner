Digital Oceans Provisioner
=

This repository contains a set of scripts for provisioning a DigitalOcean droplet.

## Setting up a New Droplet

To set up a new DigitalOcean droplet, do the following:

1. In the DigitalOcean UI, go through the steps of creating a new droplet.
    - The setup script was tested on Ubuntu 22.04 (LTS) x64, so select that base
      image.
    - **This script assumes that when you set up the droplet, you chose to use SSH
      keys for authentication. This is because the script creates a new user on
      the droplet and copies the existing SSH keys from the root user to the new
      user. The root user's SSH keys are only set if you choose the SSH key
      authentication method.**

1. SSH into your new droplet: `ssh root@IP-ADDRESS`.

1. Clone the repo and cd into it:

    ```
    git clone https://github.com/codemang/digital_ocean_provisioner.git; cd digital_ocean_provisioner
    ```

1. Run the set up script.
    - **Make sure to replace the `<username>` and `<email_address>` CLI args at the end of the command.**
    - `username` will be used as the name for the new linux system user (i.e you can ssh into the machine as that user).
    - 'email_address' will be used by

    ```bash
    ./scripts/setup_digital_ocean_droplet.sh  <new_username> <email_address>
    ```

1. Add the droplet to your SSH config. Once you do that, you can ssh in by doing
   `ssh digital_ocean`.

    ```bash
    Host digital_ocean
        HostName IP-ADDRESS
        User USERNAME
        Port 22
    ```

## What's Configured On The New Droplet?

This repo configures a new Droplet to run my specific projects, therefore, it's a bit opinionated about what to install. Here is a high-level overview of what's installed and configured:

1. Creates a non-root user with sudo access.
1. Disables password authentication for that user and only allows SSH access.
1. Sets up a basic firewall that only allows SSH, HTTP, and HTTPS connections on the expected ports.
1. Adds 4GB of swap memories since these are small machines.
1. Enables the native DigitalOcean metric collection.
1. Installs Docker and Docker-Compose
1. Sets up an Nginx reverse proxy and a LetsEncrypt container so that all my apps can run on a subdomain with SSL.
1. Clones a GitHub repo that enables me to deploy my apps to the Droplet via a single CLI command.
