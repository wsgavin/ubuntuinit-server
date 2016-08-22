#!/bin/bash

#set -e

sudo -k

# Just because, clearing some variables that are shared between other scripts.
unset account_password
unset git_fullname
unset git_email

. init/banner.sh
. init/check.sh
. init/input.sh

# Initializing apt-get
sudo apt update
sudo apt upgrade -y

# Installing various applications...
sudo apt install git -y
sudo apt install vim -y
sudo apt install nmap -y
sudo apt install moreutils -y
sudo apt install curl -y
sudo apt install ctags -y

sudo apt clean
sudo apt autoclean

# Initializing scripts...
. init/git.sh
. init/vim.sh
. init/bash.sh

# For sanity sake
sudo -k

exit 0
