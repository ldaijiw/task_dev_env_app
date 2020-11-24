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
end
```
If there are any issues with the **Vagrantfile** you can make a new one with terminal in your current working directory with the following command, and add the above code to your newly created **Vagrantfile**
```bash
vagrant init
```

## Requirements

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