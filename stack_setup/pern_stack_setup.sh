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
    leave_dev_note "!!!!!!!!!!!!   STARTING $current_path   !!!!!!!!!!!!"
}

function exit_loudly () {
    # Leave a very noticeable note from dev (without a need for an argument) in the terminal saying the script will "be finished running commands"
    leave_dev_note "!!!!!!!!!!!!   EXITING $current_path   !!!!!!!!!!!!"
    exit
}

function exit_confusedly () {
    echo "Sorry, I don't recognize that response. You'll have to call this script again... Exiting..."
}


######################      COMMANDS            ######################

##### START SCRIPT LOUDLY
start_loudly

##### RUN SCRIPT COMMANDS

# Set up Postgres
sudo apt install postgresql postgresql-contrib
sudo service postgresql start

# Set up Node.js
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt install -y nodejs
sudo npm init

# Set up Express
sudo npm install express

# Set up Nodemon
sudo npm install -g nodemon
sudo npm install --save-dev nodemon

# Create index.js app inside of new directory
mkdir pern_app
cat <<EOF > /pern_app/index.js
# Make folder for this application and write index file
mkdir pern_app
cat << EOF > /pern_app/index.js
const http = require('http');
const hostname = '127.0.0.1';
const port = 3000;
const server = http.createServer((req, res) => {
res.statusCode = 200;
res.setHeader('Content-Type', 'text/plain');
res.end('Hello World');
});
server.listen(port, hostname, () => {
console.log(`Server running at http://${hostname}:${port}/`);
});
EOF              

cd pern_app

# Start application
nodemon app.js

# Set up React
sudo npm install -g create-react-app
npx create-react-app awesome-project
cd awesome-project
npm start

##### EXIT SCRIPT LOUDLY
exit_loudly

