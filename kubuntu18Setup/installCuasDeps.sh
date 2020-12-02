#/usr/bin/bash bash

# stuff needed for sim
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -sc` main" > /etc/apt/sources.list.d/ros-latest.list'
sudo sh -c 'echo "deb http://packages.ros.org/ros-shadow-fixed/ubuntu `lsb_release -sc` main" > /etc/apt/sources.list.d/ros-shadow.list'
sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
wget https://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -
sudo apt update
sudo apt -y --no-install-recommends install build-essential \
	doxygen \
	dnsutils \
        iputils-ping \
        geographiclib-tools \
        grc \
	libeigen3-dev \
        libgeographic-dev \
        libopencv-dev \
        locales \
	openssh-server \
        protobuf-compiler \
        python-catkin-tools \
	python-jinja2 \
        python-tk \
        python3 \
        python3-virtualenv \
        python3-venv \
        python3-pip \
	python-argparse \
        python-empy \
        python-toml \
        python-numpy \
        python-dev \
        python-pip \
        python-rosinstall-generator \
        python-wstool \
	python-rosdep \
	ros-$ROS_DISTRO-ros-base \
	ros-$ROS_DISTRO-mavlink \
	ros-$ROS_DISTRO-gazebo-ros-pkgs \
        ros-$ROS_DISTRO-mavros-extras \
        ros-$ROS_DISTRO-nmea-msgs \
        ros-$ROS_DISTRO-pcl-conversions \
        ros-$ROS_DISTRO-pcl-msgs \
        ros-$ROS_DISTRO-pcl-ros \
        ros-$ROS_DISTRO-ros-base \
        ros-$ROS_DISTRO-rostest \
        ros-$ROS_DISTRO-rosunit \
        ros-$ROS_DISTRO-xacro  \
	ros-$ROS_DISTRO-gazebo9* \
	ros-$ROS_DISTRO-mav* \
	rsync \
        socat \
        ssh \
        ccache \
        vim \
        xvfb \
        clang \
        clang-format \
        clang-tidy \
        uncrustify \
        cppcheck

sudo geographiclib-get-geoids egm96-5

pip install --upgrade pip && pip install px4tools pymavlink rosdep numpy toml
pip3 install --upgrade pip && pip3 install setuptools wheel rosdep pyulog "matplotlib==3.0.*" pre-commit

rosdep init && rosdep update

# custom dusty DJI SDK
git clone -b 3.8.2 https://github.com/dustycodes/Onboard-SDK.git && mkdir -p /home/$USER/Onboard-SDK/build
pushd .
cd ~/Onboard-SDK/build
cmake .. \
    && make -j $(nproc) \
    && sudo make install

# setup DJI ros api
mkdir -p /home/$USER/sarcos_ws/src && mkdir -p /home/$USER/catkin_ws/src
cd ~/sarcos_ws/src
git clone ssh://git@sarcos-source.westus.cloudapp.azure.com:7999/cuas/sarcos_cuas.git
cd /home/$USER/catkin_ws/src
git clone -b 3.8.1 https://github.com/dji-sdk/Onboard-SDK-ROS.git
popd
cp containers/sdk.launch /home/$USER/catkin_ws/src/Onboard-SDK-ROS/dji_sdk/launch/sdk.launch
pushd .
cd ~/catkin_ws
catkin build
cd /home/$USER/sarcos_ws
catkin build
popd
sudo cp containers/rosconsole.config /opt/ros/melodic/share/ros/config/
ROSCONSOLE_FORMAT='[${severity}] [${time}] [${logger}]: ${message}'
cp containers/fences.json /home/$USER/.ros/fences.json

# build log analysis python env
python3 -m venv env && \
        env/bin/pip3 install --upgrade pip && \
        env/bin/pip3 install wheel && \
        env/bin/pip3 install numpy \
        matplotlib \
        pandas \
        rosbag_pandas \
        bokeh \
        numpy_quaternion \
        tables \
        h5py \
        pyyaml \
        rospkg \
        jupyter \
        lz4 \
        pycrypto \
        gnupg \
        pyqt5 \
        numba \
        scipy \
        pre-commit

# Build Px4
pushd .
cd /home/$USER
git clone -b develop ssh://git@sarcos-source.westus.cloudapp.azure.com:7999/cuas/px4.git
cd /home/$USER/px4
git submodule update --init --recursive
DONT_RUN=1 make px4_sitl gazebo
DONT_RUN=1 make px4_sitl gazebo_m600
DONT_RUN=1 make px4_sitl gazebo_matador
chmod +x clean_m600_build.sh
./clean_m600_build.sh
ROS_CONSOLE_OUTPUT=screen

popd

# QT stuff
sudo apt install -y git libqt5bluetooth5 libperl-dev libgstreamer1.0-0 \
gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav \
gstreamer1.0-doc gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 \
gstreamer1.0-pulseaudio speech-dispatcher libudev-dev libsdl2-dev libczmq-dev libgstreamer-plugins-base1.0-dev \
libsodium-dev libcurl4-openssl-dev libssl-dev libhiredis-dev

mkdir -p /tmp/snmp 
pushd .
cd /tmp/snmp
version='5.8'
wget http://sourceforge.net/projects/net-snmp/files/net-snmp/$version/net-snmp-$version.tar.gz
tar -xvzf net-snmp-$version.tar.gz
cd net-snmp-$version
./configure --with-default-snmp-version="1" --with-sys-contact="@@no.where" --with-sys-location="Unknown" --with-logfile="/var/log/snmpd.log" --with-persistent-directory="/var/net-snmp"
make
sudo make install
popd

echo "Finished installing CUAS deps"
