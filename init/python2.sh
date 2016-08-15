#!/bin/bash

sudo apt update
sudo apt install python python-pip -y
sudo -H pip install -U pip setuptools
sudo -H pip install virtualenv virtualenvwrapper

if ! grep -q "# virtualenv" "$HOME/.bashrc"; then

  cat <<EOF >>  "$HOME/.bashrc"

# virtualenv
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

EOF

fi

export WORKON_HOME=$HOME/.virtualenvs
mkdir -p "$WORKON_HOME"
# shellcheck disable=SC1091
source /usr/local/bin/virtualenvwrapper.sh

# References
#
# virtualenv: https://virtualenv.pypa.io
# virtualenvwrapper: https://virtualenvwrapper.readthedocs.io
