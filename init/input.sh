#!/bin/bash

# Regular expression for checking email. NOT PERFECT
regex_email="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"

# Git values for configuraion
git_fullname="$(getent passwd `whoami` | awk -F':' '{print $5}' | sed 's/,//g')"
git_email=""

# stty -echo
# echo
# echo "Enter the administrative/sudo password for this system."
# echo
# printf "Enter password: "
# read -r sudo_password
# stty echo
#
# echo
# echo "Checking if current user can sudo..."
#
# # Reseting sudo; just to ensure the test goes as planned.
# sudo -k
#
# # Attempting to use the entered password with sudo.
# is_sudoer="$(echo $sudo_password | sudo -vS &>/dev/null)"
#
# # If the exit status $? is not 0 something went wrong and we'll exit.
# [ $? -eq 0 ] || { echo "Current user does not have sudoer access."; exit 1; }
#
# # Unsetting for good measure...
# unset is_sudoer
#
# # If we've made it here we should be good.
# echo "done."
#
# account_password="$sudo_password"

echo
echo "Configuring git settings..."
echo

# Prompt user for full names used for Git

while [ -z "$get_fullname_entered" ]
do

  # shellcheck disable=SC2039 disable=SC2162
  read -p "Enter full name [$git_fullname]: " get_fullname_entered

  if [ -z "$get_fullname_entered" ]; then
    get_fullname_entered="$git_fullname"
  fi

  # shellcheck disable=SC2039 disable=SC2162
  read -p "Confirm full name '$get_fullname_entered' [Y/n]: " yn

  case "$yn" in
    ""|[Yy])
        git_fullname="$get_fullname_entered"
      ;;
    *)
      get_fullname_entered=""
      ;;
  esac

  if [ -z "$get_fullname_entered" ]; then
    echo "Something is wrong, let's try again."
  fi

done

# Prompt user for email address for Git

while [ -z "$git_email_entered" ]
do

  # shellcheck disable=SC2039 disable=SC2162
  read -p "Enter new email address [$git_email]: " git_email_entered

  if [ -z "$git_email_entered" ]; then
    git_email_entered="$git_email"
  fi

  # shellcheck disable=SC2039 disable=SC2162
  read -p "Confirm email address '$git_email_entered' [Y/n]: " yn

  case "$yn" in
    ""|[Yy])
      # shellcheck disable=SC2039
      if [[ "$git_email_entered" =~ $regex_email ]]; then
        git_email="$git_email_entered"
      else
        git_email_entered=""
      fi
      ;;
    *)
      git_email_entered=""
      ;;
  esac

  if [ -z "$git_email_entered" ]; then
    echo "Something is wrong, let's try again."
  fi

done

echo
echo "done."
