#!/bin/bash

sudo apt upgrade -y
sudo apt install -y fzf
sudo apt install -y ripgrep

# Install Vim

# https://github.com/neovim/neovim/wiki/Building-Neovim#ubuntu--debian
sudo apt install -y ninja-build gettext cmake unzip curl

# https://github.com/neovim/neovim/wiki/Building-Neovim#quick-start
git clone https://github.com/neovim/neovim
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo
cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb

# Install nvchad
# https://nvchad.com/docs/quickstart/install
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
