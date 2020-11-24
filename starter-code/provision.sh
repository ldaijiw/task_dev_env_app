#!/bin/bash

sudo apt update
sudo apt install nginx -y

cd /app

# install npm
sudo apt install npm -y

# install correct version of nodejs
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs

# npm install pm2 -g
npm install
npm start