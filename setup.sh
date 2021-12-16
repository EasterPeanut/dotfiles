#!/usr/bin/env bash
set -e
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

# Remove old links
sudo rm -rf ~/.config/nvim

sudo rm -rf ~/.bash_aliases
sudo rm -rf ~/.zshrc

mkdir -p ~/.config
ln -sf $PWD/dotfiles/nvim ~/.config/nvim

ln -sf $PWD/dotfiles/bash_aliases/.bash_aliases ~/.bash_aliases
ln -sf $PWD/dotfiles/zshrc/.zshrc ~/.zshrc
