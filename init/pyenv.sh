#!/bin/bash

# Force sudo to prompt for password.
sudo -k
sudo apt update
sudo apt install make \
                 build-essential \
                 libssl-dev \
                 zlib1g-dev \
                 libbz2-dev \
                 libreadline-dev \
                 libsqlite3-dev \
                 wget \
                 curl \
                 llvm \
                 libncurses5-dev \
                 libncursesw5-dev \
                 xz-utils \
                 -y

# URLs shortended by http://git.io

# Original URL:
# https://raw.githubusercontent.com/yyuu/pyenv-installer/master/
# bin/pyenv-installer
#
# Running pyenv-installer
curl -L https://git.io/v62nr | bash

git clone https://github.com/yyuu/pyenv-virtualenvwrapper.git \
          ~/.pyenv/plugins/pyenv-virtualenvwrapper

if ! grep -q "# pyenv" "$HOME/.bashrc"; then

  cat <<EOF >>  "$HOME/.bashrc"

# pyenv
export PATH="/home/warren/.pyenv/bin:\$PATH"
eval "\$(pyenv init -)"
eval "\$(pyenv virtualenv-init -)"
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
pyenv virtualenvwrapper

EOF

fi

export PATH="/home/warren/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

pyenv install 2.7.12
pyenv install 3.5.2

pyenv global 2.7.12

pip install -U pip setuptools

pyenv global 3.5.2

pip install -U pip setuptools

export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
pyenv virtualenvwrapper

# For sanity sake...
sudo -k

# References
#
# pyenv: https://github.com/yyuu/pyenv
# pyenv-installer: https://github.com/yyuu/pyenv-installer
