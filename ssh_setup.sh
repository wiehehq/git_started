#!/bin/bash

read -p 'Do you want to use defaults for setting up SSH? ' defaults_requested

if [ "$defaults_requested" = "Y" ] ; then
  email='generic_email.com'
  ssh_path="/home/dev/.ssh/id_rsa$RANDOM"
elif [ "$defaults_requested" = "N" ] ; then
  echo
  read -p 'Enter email: ' email
  read -p 'Enter SSH path with filename: ' ssh_path
  echo
fi

ssh-keygen -t rsa -b 4096 -C $email -f $ssh_path -q -N ""
eval "$(ssh-agent -s)"
ssh-add $ssh_path

gedit "$ssh_path.pub"

exit
