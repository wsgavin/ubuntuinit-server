#!/bin/bash

#set -e

# Just because, clearing some variables that are shared between other scripts.
unset account_password
unset git_fullname
unset git_email

. init/banner.sh
. init/check.sh
. init/input.sh
. init/repos.sh

# Initializing apt-get
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y

# Installing various applications...
sudo apt-get install git -y
sudo apt-get install vim -y
sudo apt-get install nmap -y
sudo apt-get install moreutils -y
sudo apt-get install curl -y
sudo apt-get install ctags -y

sudo apt-get clean
sudo apt-get autoclean

# Initializing scripts...
. init/git.sh
. init/vim.sh
. init/bash.sh
#. init/nodejs.sh

exit 0
