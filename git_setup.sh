#!/bin/bash

read -p 'Do you want to use defaults for setting up Git? ' defaults_requested
if [ "$defaults_requested" = "Y" ] ; then
  script_random=$RANDOM$RANDOM
  user_email="git_email_$script_random"
  user_name="git_name_$script_random"
  git_account='wiehehq'
  git_repo='git_started'
elif [ "$defaults_requested" = "N" ] ; then
  echo
  read -p 'Enter email to use for git (does not have to be a real one): ' user_email
  read -p 'Enter username to use for git (does not have to be your actual username): ' user_name
  read -p 'Enter the account on github.com that holds the repo you want to clone: ' git_account
  read -p "Enter the name of the repo within the account $git_account that you want to clone: " git_repo
  echo
fi

sudo apt install git-all
yes | git clone git@github.com:$git_account/$git_repo.git
cd git_started
git config --global user.email $user_email
git config --global user.name $user_name
git pull origin master
echo "$script_random">>push_test_file.txt
git add push_test_file.txt
git commit -m "Initial commit - $script_random"
git push origin master

echo
echo
echo
echo "Scripted randomly generated number $script_random"
echo
echo

exit
