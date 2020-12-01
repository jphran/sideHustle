#!/usr/bin/env bash

# NOTES:
# Remember to enable thunderbolt devices (use boltctl)

# basics
sudo apt update
sudo apt upgrade
sudo apt install vim -y

# change shell
sudo apt install -y zsh
sudo chsh -s $(which zsh)
# NOTE: needed restart right here, idk if its necessary
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp .zshrc ~/.zshrc
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf
# NOTE: need to manually enable nerd font
# Open the file you just downloaded and click Install
# Open your terminal and go to Edit -> Profile Preferences -> General -> Text Appearance. Enable Custom Font and look for Hack Nerd Font Regular in the list and select it.
source ~/.zshrc


