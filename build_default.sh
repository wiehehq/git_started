#!/bin/bash

######################  FUNCTIONS

# Will run at all points that some kind of checkpoint would be helpful in the terminal
function checkpoint () {
    HR="........................................................................"
    for counter in {1..12}
    do
        echo $HR
    done
}

function leave_dev_note() {
    echo 
    echo
    echo 
    echo 
    echo
    echo 
    echo
    echo
    echo "........................................................................"
    echo
    # $1 = arg: Text to be echo'd as dev note
    echo $1
    echo
    echo "........................................................................"
    echo 
    echo 
    echo
    echo 
    echo
    echo
    echo
    echo
}

function exit_loudly () {
    leave_dev_note "!!!!!!!!!!!!   EXITING LOUDLY   !!!!!!!!!!!!"
    exit
}

function start_loudly () {
    leave_dev_note "!!!!!!!!!!!!   STARTING LOUDLY   !!!!!!!!!!!!"
}







######################  COMMANDS







##### START SCRIPT LOUDLY
start_loudly


##### Installing CURL and some other dependencies via this script
leave_dev_note "Installing CURL and some other dependencies via this script"
yes | apt install curl
yes | apt install software-properties-common apt-transport-https wget


##### Installing Visual Studio via this script
leave_dev_note "Installing Visual Studio via this script"
sudo wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code


##### Installing Chrome via this script
leave_dev_note "Installing Chrome via this script"
yes | sudo apt install gdebi-core
sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
yes | gdebi google-chrome-stable_current_amd64.deb


##### Setting as favorites (control panel on left, from top to bottom) Terminal, Files, Chrome, and VS Code
leave_dev_note "Setting as favorites (control panel on left, from top to bottom) Terminal, Files, Chrome, and VS Code"
gsettings set org.gnome.shell favorite-apps "['org.gnome.Terminal.desktop', 'org.gnome.Nautilus.desktop', 'google-chrome.desktop', 'code.desktop']"

exit_loudly

