# Provisioning Lab

## Timings

60 - 90 Minutes

## Summary

The developers have indicated that they'll need a mongodb database soon. We need to create a provisioning script that will create this server.

Research the method for installing and configuring a MongoDB server on your server.

Write the steps in to the provisioning script.

Start the machine and run the tests as follows:

```bash
cd tests
rake spec
```

## Hints

To get MongoDB to listen on 0.0.0.0 is a very minor change to the mongodb.conf file.

Research how this is done. But consider how you can automate the editing of this file with your provisioning script.

> HINT: You cannot edit a file with a provisioning script so you'll have to come up with another solution.


## Acceptance Criteria

* Uses vagrant file
* Create VM and Mongod is working
* MongoDB 3.2.20 is isntalled

## Extra time tomorrow -- Try to research and see if you can do it!
* MongoDB to listen on 0.0.0.0 on port 27017
* Work with command "vagrant up"
* All tests passing

* Documentation exists as README.md file
* Documentation includes: Intro (purpose of repo), Pre Requisits  and Intructions

* repo exists on github

## Provision.sh

```bash
#!/bin/bash

# Update and upgrade any packages
sudo apt update
sudo apt upgrade

# Issues command to import MongoDB public GPG Key specifying 3.2
wget -qO - https://www.mongodb.org/static/pgp/server-3.2.asc | sudo apt-key add -

# Create 3.2 list file for Ubuntu 18.04 (Bionic)
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

# Reload local package database
sudo apt update

# Install specific release version 3.2.20 with autoconfirmation
sudo apt install mongodb-org=3.2.20 -y

# To prevent accidental apt upgrades
echo "mongodb-org hold" | sudo dpkg --set-selections
echo "mongodb-org-server hold" | sudo dpkg --set-selections
echo "mongodb-org-shell hold" | sudo dpkg --set-selections
echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
echo "mongodb-org-tools hold" | sudo dpkg --set-selections


# Configure IP for MongoDB
sudo sed -i 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf

# Start server
sudo systemctl start mongod

# Enable ensures that MongoDB will still start following a system reboot
sudo systemctl enable mongod
```

