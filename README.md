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

1. Run the set up script. **Make sure to replace "username" at the end of the
  statement with the username you want to use for the new user on the droplet**:

    ```bash
    curl -s https://raw.githubusercontent.com/codemang/digital_ocean_provisioner/master/setup_new_droplet.sh | bash -s new_username
    ```

1. Add the droplet to your SSH config. Once you do that, you can ssh in by doing
   `ssh digital_ocean`.

    ```bash
    Host digital_ocean
        HostName IP-ADDRESS
        User USERNAME
        Port 22
    ```

## Installing Docker

1. Run the Docker set up script.

    ```bash
    curl -s https://raw.githubusercontent.com/codemang/digital_ocean_provisioner/master/setup_docker.sh | bash
    ```

## Adding a GitHub SSH Key

1. Run the set up set up script.

    ```bash
    curl -s https://raw.githubusercontent.com/codemang/digital_ocean_provisioner/master/setup_github_ssh_key.sh | bash
    ```
