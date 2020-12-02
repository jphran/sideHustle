#!/usr/bin/env bash

if [[ $SHELL -eq "/usr/bin/zsh" ]]; then
	echo "Successfully switched to zsh"
fi

git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp .zshrc ~/.zshrc
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf
echo " NOTE: need to manually enable nerd font
 Open the file you just downloaded and click Install
 Open your terminal and go to Edit -> Profile Preferences -> General -> Text Appearance. Enable Custom Font and look for Hack Nerd Font Regular in the list and select it."

source ~/.zshrc



echo "Finished setting up zsh"

