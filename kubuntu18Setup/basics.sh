#!/usr/bin/env bash
  
echo " NOTES: Remember to enable thunderbolt devices (use boltctl)"

# basics
sudo apt update
sudo apt upgrade -y
sudo apt install vim -y
sudo apt install snapd

# spotify
snap install spotify

# docker
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker 
docker run hello-world

distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
   && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
   && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

sudo apt update
sudo apt-get install -y nvidia-docker2
sudo systemctl restart docker
sudo docker run --rm --gpus all nvidia/cuda:11.0-base nvidia-smi

# catch 2
git clone https://github.com/catchorg/Catch2.git
cd Catch2
cmake -Bbuild -H. -DBUILD_TESTING=OFF
sudo cmake --build build/ --target install 

echo "Finished basic setup"

