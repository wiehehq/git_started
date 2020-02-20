#!/bin/bash

bash ssh_setup.sh
read -p 'Add key to github.com and press enter when finished... '
sudo bash git_setup.sh

echo
echo
echo
echo 'finished with assemble.sh'

exit
