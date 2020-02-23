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
    echo "........................................................................"
    empty_echo
    # $1 = arg: Text to be echo'd as dev note
    echo $1
    empty_echo
    echo "........................................................................"
    empty_echo 
    empty_echo
    empty_echo 
}

function start_loudly () {
   # Leave a very noticeable note from dev (without a need for an argument) in the terminal saying the script will "start running commands"
    leave_dev_note "!!!!!!!!!!!!   STARTING LOUDLY   !!!!!!!!!!!!"
}

function exit_loudly () {
    # Leave a very noticeable note from dev (without a need for an argument) in the terminal saying the script will "be finished running commands"
    leave_dev_note "!!!!!!!!!!!!   EXITING $current_path  !!!!!!!!!!!!"
    exit
}

function exit_confusedly () {
    echo "Sorry, I don't recognize that response. You'll have to call this script again... Exiting..."
}




######################      COMMANDS            ######################

##### START SCRIPT LOUDLY
start_loudly

##### GET USER INPUT TO PUT INTO VARS

unrecognized_user_response="Sorry, I don't recognize that response. You'll have to call this script again... Exiting..."

#### Get user input for if they are from wiehehq
read -s -p $'\nAre you from WieheHQ? [Y\N]\nIf you are not sure, the answer is definitely no\n(By the way, you will not be able to see what you type for certain chosen reasons)\n\n' from_wiehehq_response
from_wiehe_disposition=''

case $from_wiehehq_response in
    n)
        from_wiehe_disposition='Y'
        ;;
    N)
        from_wiehe_disposition='Y'
        ;;
    no)
        from_wiehe_disposition='Y'
        ;;
    No)
        from_wiehe_disposition='Y'
        ;;
    NO)
        from_wiehe_disposition='Y'
        ;;
    nO)
        from_wiehe_disposition='Y'
        ;;
    y)
        from_wiehe_disposition='N'
        ;;
    Y)
        from_wiehe_disposition='N'
        ;;
    yes)
        from_wiehe_disposition='N'
        ;;
    Yes)
        from_wiehe_disposition='N'
        ;;
    YES)
        from_wiehe_disposition='N'
        ;;
    yES)
        from_wiehe_disposition='N'
        ;;
    *)
        exit_confusedly
        ;;
esac

#### Get user input for repo to clone
echo $'\n***   HEADS UP! --- Right now, you can only clone from repos in github.com/wiehehq using this tool. But if you clone from this tool and help with some of these super-mega-ultra-basic logic with prompts and variables, we can change that!\n'
read -p $'\nWhat do you want to build?\n\n[0]  VM Scripting\n[1]  Git Scripts\n[2]  PERN Stack\n[3]  LAMP Stack\n\n' repo_to_clone

empty_echo
echo "Okay, let me make sure your response of [$repo_to_clone] is an available option..."
empty_echo

case $repo_to_clone in
# think of the variable $repo_to_clone as fitting the format github.com/wiehehq/$repo_to_clone
    0)
        repo_to_clone='vm_bash_scripting'
        bash vm_bash_scripting_setup.sh
        ;;
    1)
        repo_to_clone='git_started'
        bash git_started_setup.sh
        ;;        
    2)
        repo_to_clone='pern_stack'
        bash pern_app/pern_setup.sh
        ;;
    3)
        repo_to_clone='lamp_stack'
        lamp_stack_setup.sh
        ;;
    *)
        exit_confusedly
esac

##### EXIT SCRIPT LOUDLY
exit_loudly

