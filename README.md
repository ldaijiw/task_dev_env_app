# Setting Up a Dev Environment with Vagrant

## Installation and Setup for Vagrant, VirtualBox, and Ruby

**You will need to install Vagrant, VirtualBox, and Ruby in order to set up this Dev Environment**

[Installation Instructions](https://github.com/ldaijiw/vagrant_setup)

## Vagrantfile Set up

- In the ``starter-code`` directory, there should already be a **Vagrantfile** set up with the following features:
	- Check if ``hostsupdater`` plugin is installed (if not, then install)
	- Configure the Vagrant Box to Ubuntu 18.04 ``ubuntu/bionic64``
	- Configure private network with ip ``192.168.10.100``
	- Configure hostname alias with ``development.local``
	- Provision ``/app`` and ``/environment`` folders to VM
	- Run a bash script to make any necessary installations in the VM

The **Vagrantfile** should look as follows
```ruby
# Install required plugins
required_plugins = ["vagrant-hostsupdater"]
required_plugins.each do |plugin|
    exec "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
end

Vagrant.configure("2") do |config|
	# configure vagrant box to Ubuntu 18.04
	config.vm.box = "ubuntu/bionic64"

	# configure network ip and hostname alias
	config.vm.network "private_network", ip: "192.168.10.100"
	config.hostsupdater.aliases = ["development.local"]

	# sync folders to VM
	config.vm.sync_folder "/app", "app"
	config.vm.sync_folder "/environment", "environment"

	# run provision bash script
	config.vm.provision "shell", path: "provision.sh"
end
```
If there are any issues with the **Vagrantfile** you can make a new one with terminal in your current working directory with the following command, and add the above code to your newly created **Vagrantfile**
```bash
vagrant init
```

### Vagrant Commands

In the same directory as the **Vagrantfile**, the following terminal commands are useful
- ``vagrant up``: To start VM
- ``vagrant provision``: Firces reprovisioning of VM
- ``vagrant suspend``: To stop VM (``vagrant halt`` for forceful stop)
- ``vagrant reload``: To restart VM (add ``--provision`` to force provisioning)
- ``vagrant ssh``: To connect to the VM via SSH
- ``vagrant destroy``: To destroy the VM

[You can also refer here for any extra commands](https://gist.github.com/wpscholar/a49594e2e2b918f4d0c4)

## Additional Setup

- This project primarily uses **JavaScript**, with some integration testing with **Ruby** and **Rake**


### Setting Up Testing with Ruby

Testing is carried out with the **Rake** testing framework with **Ruby**, used to ensure that everything is set up and running correctly.

- In ``starter-code/environment/`` there is the ``spec-test`` folder which contains:
	- ``spec`` which contains the specific unit tests that ``rspec`` will refer to
	- ``Gemfile`` which contains a list of gems (packages) that must be installed in order to run the tests
	- ``Rakefile`` which contains the set of instructions to execute the tests
	- ``.rspec`` which can be ignored for now


**In order to install all the gems listed in Gemfile, first install bundler**

- Bundler is Ruby's package manager, which can be installed in terminal with
```bash
gem install bundler
```
- After this is successfully carried out, ensure that the terminal's current working directory is ``starter-code/environment/spec-test`` so that it can refer to the ``Gemfile`` and run
```bash
bundle
```
- This will install all the gems listed in ``Gemfile``, the tests are now ready to be run with
```bash
rake spec
```


### Bash Scripting

- Vagrant can use a bash script to make any necessary installations in the VM without requiring the user to write each commands
- The bash script used is ``provision.sh`` and is executed in the last line of the **Vagrantfile** and carries out the following commands:
	- ``sudo apt update``: Updates for Linux
	- ``sudo apt install nginx -y``: Installs nginx with autoconfirmation ([nginx is an HTTP and reverse proxy server](https://nginx.org/en/))
	- ``sudo apt install nodejs -y``: Installs [Node.js](https://nodejs.org/en/about/) with autoconfirmation
	- ``sudo apt install npm -y``: Installs [npm](https://docs.npmjs.com/about-npm) with autoconfirmation
	- ``sudo npm install pm2 -y``: Installs [pm2](https://pm2.keymetrics.io/docs/usage/quick-start/) with autoconfirmation