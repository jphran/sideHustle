#!/usr/bin/env bash
  
# change shell
sudo apt install -y zsh
chsh -s $(which zsh)
# NOTE: needed restart right here, idk if its necessary

echo "Restarting computer to load zsh in ... "
for i in {1..3}
do
	echo $(( 3 - $i ))
	sleep 1
done

sudo shutdown -r now
