#!/bin/bash




######################      HIGH-PRIORITY           ######################

current_path=$(pwd)




######################      FUNCTIONS           ######################

empty_echo () {
    # echo an empty string
    echo
}

function checkpoint () {
    # Will run at all points that some kind of checkpoint would be helpful in the terminal
    HR="........................................................................"
    for counter in {1..12}
    do
        echo $HR
    done
}

function leave_dev_note() {
    # Leave a very noticeable note from dev (which will be passed as an argument) in the terminal
    empty_echo 
    empty_echo
    empty_echo 
    empty_echo 
    empty_echo
    empty_echo 
    empty_echo
    empty_echo
    echo "........................................................................"
    empty_echo
    # $1 = arg: Text to be echo'd as dev note
    echo $1
    empty_echo
    echo "........................................................................"
    empty_echo 
    empty_echo
    empty_echo 
    empty_echo 
    empty_echo
    empty_echo 
    empty_echo
    empty_echo
}

function start_loudly () {
   # Leave a very noticeable note from dev (without a need for an argument) in the terminal saying the script will "start running commands"
    leave_dev_note "!!!!!!!!!!!!   STARTING LOUDLY   !!!!!!!!!!!!"
    echo "!!!!   [$current_path]   !!!!!"
}

function exit_loudly () {
    # Leave a very noticeable note from dev (without a need for an argument) in the terminal saying the script will "be finished running commands"
    leave_dev_note "!!!!!!!!!!!!   EXITING LOUDLY  FROM  PATH BELOW   !!!!!!!!!!!!"
    echo "!!!!   [$current_path]   !!!!!"
    exit
}

function exit_confusedly () {
    echo "Sorry, I don't recognize that response. You'll have to call this script again... Exiting..."
}


######################      COMMANDS            ######################

##### START SCRIPT LOUDLY
start_loudly


# Install Apache and update firewall
leave_dev_note "apt install apache2"
sudo apt install apache2
leave_dev_note "in apache"
sudo ufw allow in "Apache Full"


# Install MySQL
leave_dev_note "install mysql-server"
sudo apt install mysql-server
leave_dev_note "secure installation"
sudo mysql_secure_installation
leave_dev_note "run mysql"
sudo mysql


##### EXIT SCRIPT LOUDLY
exit_loudly

