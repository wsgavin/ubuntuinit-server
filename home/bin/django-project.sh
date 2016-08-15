#!/bin/bash

# Assumes python & virtualenvrwapper installed.

if [ $# -ne 1 ]; then
  echo "$0 <project name>"
  exit 1
fi

# Initialize the pyenv environment...
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
pyenv virtualenvwrapper

mkdir "$1"
mkvirtualenv "$1"
workon "$1"
pip install --upgrade pip setuptools
pip install django
django-admin.py startproject "$1" "$1"

pip freeze > "$1/requirements.txt"

cat <<EOF

To start working on your project execute the following command.

\$ workon $1

EOF

