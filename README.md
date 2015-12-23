# Brandon's Dev Environment

This is a dev environment for multiple rails apps being hosted by Apache passenger.
Mostly just setup the way I like it.  Open to feedback though!

## Includes
- Apache2
- Passenger
- Ruby/Rails
- Dotfiles: https://github.com/brandonjoyce/dotfiles #WIP

## Prerequisites
- Install [Vagrant](https://www.vagrantup.com/)
- Install [VirtualBox](https://www.virtualbox.org/)
- Ensure your SSH key is installed: https://help.github.com/articles/generating-ssh-keys/#platform-mac

```bash
  vagrant plugin install vagrant-vbguest
  vagrant plugin install vagrant-librarian-chef-nochef
```

## Installation
Setup some environment variables on your host machine.
These should be rails projects.
The setup script will automatically clone the projects, setup passenger config, and run script/setup from your project.

```
export GITHUB_PROJECTS=brandonjoyce/whatever.git
export GITHUB_PROJECTS=${GITHUB_PROJECTS}:brandonjoyce/another-one.git
export BITBUCKET_PROJECTS=brandonjoyce/yep.git
```

- clone this repository

```bash
  cd vagrant
  vagrant up # go get coffee
  vagrant ssh # you're on the dev machine now.
  cd /vagrant
  bash setup.sh
```
- Modify the hosts file on your host machine

```
# this is the ip for your Vagrant box, configure according to your project list
192.168.33.11 brandonjoyce.whatever.dev
192.168.33.11 brandonjoyce.another-one.dev
```

Now you can reach sites using the '.dev' urls from your host machine.
The code for your apps is under the vagrant/code directory.
You can edit that code from the host machine or from within vagrant ssh.
You should run tests, migrations, generators, rails consoles and dev web servers from within the vagrant though.
