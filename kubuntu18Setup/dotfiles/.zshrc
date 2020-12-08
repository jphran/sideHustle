# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(user dir vcs newline)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Sourcing
source /opt/ros/melodic/setup.zsh
source ~/sarcos_ws/devel/setup.zsh

# setup sarcos env
# setup env
#
GAZEBO_MODEL_PATH=:/home/$USER/px4/Tools/sitl_gazebo/models
LD_LIBRARY_PATH=/home/$USER/catkin_ws/devel/lib:/home/$USER/sarcos_ws/devel/lib:/opt/ros/melodic/lib:/home/user/px4/build/px4_sitl_default/build_gazebo
TZ=America/Denver
ROS_ETC_DIR=/opt/ros/melodic/etc/ros
CMAKE_PREFIX_PATH=/home/$USER/catkin_ws/devel:/home/$USER/sarcos_ws/devel:/opt/ros/melodic
ROS_ROOT=/opt/ros/melodic/share/ros
ROS_MASTER_URI=http://localhost:11311
ROS_VERSION=1
PX4_HOME_ALT=1297
PX4_HOME_LON=-112.68420
PX4_HOME_LAT=40.70194
ROS_PYTHON_VERSION=2
GAZEBO_PLUGIN_PATH=:/home/$USER/px4/build/px4_sitl_default/build_gazebo
PYTHONPATH=/home/$USER/catkin_ws/devel/lib/python2.7/dist-packages:/home/$USER/sarcos_ws/devel/lib/python2.7/dist-packages:/opt/ros/melodic/lib/python2.7/dist-packages
ROS_PACKAGE_PATH=/home/$USER/catkin_ws/src:/home/$USER/sarcos_ws/src:/opt/ros/melodic/share:/home/$USER/px4/Tools/sitl_gazebo:/home/$USER/px4
ROSLISP_PACKAGE_DIRECTORIES=/home/$USER/catkin_ws/devel/share/common-lisp:/home/$USER/sarcos_ws/devel/share/common-lisp
PATH=/opt/ros/melodic/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
PKG_CONFIG_PATH=/home/$USER/catkin_ws/devel/lib/pkgconfig:/home/$USER/sarcos_ws/devel/lib/pkgconfig:/opt/ros/melodic/lib/pkgconfig
ROS_DISTRO=melodic
PATH=$PATH:/home/$USER/.local/bin:/home/$USER//.local/lib/python2.7/site-packages
ROSCONSOLE_FORMAT='[${severity}] [${time}] [${logger}]: ${message}'
ROS_CONSOLE_OUTPUT=screen
