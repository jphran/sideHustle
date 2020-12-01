#!/usr/bin/env bash

# for ubuntu 20.04 and ros noetic

# install ros
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt update
sudo apt install ros-noetic-desktop-full

echo "source /opt/ros/noetic/setup.zsh" >> ~/.zshrc
source ~/.zshrc

echo "Finished installing ros ... "

# create ros workspace
mkdir -p ~/sarcos_ws/src
cd ~/sarcos_ws/
catkin_make 
echo "source ~/sarcos_ws/devel/setup.zsh" >> ~/.zshrc
source ~/.zshrc

echo "Finished creating ros workspace ... "

# install custom dusty version of dji sdk
cd ~
git clone -b 3.8.2 https://github.com/dustycodes/Onboard-SDK.git && mkdir -p Onboard-SDK/build
cd Onboard-SDK/build
cmake ..
make -j $(nproc)
sudo make install

# setup env
GAZEBO_MODEL_PATH=:/home/$USER/px4/Tools/sitl_gazebo/models
LD_LIBRARY_PATH=/home/$USER/catkin_ws/devel/lib:/home/$USER/sarcos_ws/devel/lib:/opt/ros/noetic/lib:/home/user/px4/build/px4_sitl_default/build_gazebo
TZ=America/Denver
ROS_ETC_DIR=/opt/ros/noetic/etc/ros
CMAKE_PREFIX_PATH=/home/$USER/catkin_ws/devel:/home/$USER/sarcos_ws/devel:/opt/ros/noetic
ROS_ROOT=/opt/ros/noetic/share/ros
ROS_MASTER_URI=http://localhost:11311
ROS_VERSION=1
PX4_HOME_ALT=1297
PX4_HOME_LON=-112.68420
PX4_HOME_LAT=40.70194
ROS_PYTHON_VERSION=2
GAZEBO_PLUGIN_PATH=:/home/$USER/px4/build/px4_sitl_default/build_gazebo
PYTHONPATH=/home/$USER/catkin_ws/devel/lib/python2.7/dist-packages:/home/$USER/sarcos_ws/devel/lib/python2.7/dist-packages:/opt/ros/noetic/lib/python2.7/dist-packages
ROS_PACKAGE_PATH=/home/$USER/catkin_ws/src:/home/$USER/sarcos_ws/src:/opt/ros/noetic/share:/home/$USER/px4/Tools/sitl_gazebo:/home/$USER/px4
ROSLISP_PACKAGE_DIRECTORIES=/home/$USER/catkin_ws/devel/share/common-lisp:/home/$USER/sarcos_ws/devel/share/common-lisp
PATH=/opt/ros/noetic/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
PKG_CONFIG_PATH=/home/$USER/catkin_ws/devel/lib/pkgconfig:/home/$USER/sarcos_ws/devel/lib/pkgconfig:/opt/ros/noetic/lib/pkgconfig
ROS_DISTRO=noetic
