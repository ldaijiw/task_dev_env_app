#!/bin/bash

sudo apt update
sudo apt install nginx -y
sudo apt install nodejs -y
sudo apt install npm -y
sudo npm install pm2 -g
npm start