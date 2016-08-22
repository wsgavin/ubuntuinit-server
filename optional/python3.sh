#!/bin/bash

sudo apt update
sudo apt install python3 python3-pip -y
#sudo -H pip3 install -U pip setuptools
sudo -H pip3 install virtualenv virtualenvwrapper

if ! grep -q "# virtualenv" "$HOME/.bashrc"; then

  cat <<EOF >>  "$HOME/.bashrc"

# virtualenv
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
source /usr/local/bin/virtualenvwrapper.sh

EOF

fi

export WORKON_HOME=$HOME/.virtualenvs
mkdir -p "$WORKON_HOME"
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
# shellcheck disable=SC1091
source /usr/local/bin/virtualenvwrapper.sh

# References
#
# virtualenv: https://virtualenv.pypa.io
# virtualenvwrapper: https://virtualenvwrapper.readthedocs.io
