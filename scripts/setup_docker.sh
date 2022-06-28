# Commands from this guide.
# https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-22-04

echo "Installing Docker."
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update -y
apt-cache policy docker-ce
sudo apt -y install docker-ce

echo "Setting up Docker to not require sudo."
sudo usermod -aG docker ${USER}

# Commands from this guide.
# https://phoenixnap.com/kb/install-docker-compose-on-ubuntu-20-04
echo "Installing docker-compose"
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# https://unix.stackexchange.com/a/273348
script_dir="${0%/*}"

# Update the UFW config to block Docker ports from being publicly accessible.
# https://github.com/moby/moby/issues/4737#issuecomment-419705925
cat $script_dir/../config/docker_ufw_rules | sudo tee -a /etc/ufw/after.rules
