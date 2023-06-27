# Create a new SSH key.
ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa_github -q -N ""

# Add config to ~/.bashrc to automatically load the SSH keys.
echo "eval \`ssh-agent -s\`" >> ~/.bashrc
echo "ssh-add ~/.ssh/id_rsa_github" >> ~/.bashrc
