# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
name = ENV['USER']
ipaddress = '192.168.33.11'
ruby_version = '2.0.0-p598'
github_projects = []
bitbucket_projects = []
if ENV['GITHUB_PROJECTS']
  github_projects = ENV['GITHUB_PROJECTS'].split(':').map { |p| p.downcase }
end
if ENV['BITBUCKET_PROJECTS']
  bitbucket_projects = ENV['BITBUCKET_PROJECTS'].split(':').map { |p| p.downcase }
end
projects = github_projects + bitbucket_projects

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.ssh.forward_agent = true

  chef_json = {
    projects: projects,
    github_projects: github_projects,
    bitbucket_projects: bitbucket_projects,
    passenger: {
      ruby_bin: '/home/vagrant/.rbenv/shims/ruby',
    },
    rbenv: {
      user_installs: [{
        user: 'vagrant',
        rubies: [ruby_version],
        global: ruby_version,
        gems: {
          ruby_version => [
            { name: "bundler" },
            { name: "rack" },
          ]
        }
      }]
    },
    postgresql: {
      password: {
        postgres: 'postgres', # this is just for dev machines
      }
    },
  }

  # Configure the virtual machine to use 2GB of RAM
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  config.vm.define "vagrant", autostart: true do |v|
    v.vm.hostname = "vagrant-#{name}.dev"
    v.vm.network :private_network, ip: "#{ipaddress}"
  end

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks", "site-cookbooks"]
    chef.json = chef_json

    chef.add_recipe "apt"
    chef.add_recipe "nodejs"
    chef.add_recipe "postgresql::server"
    chef.add_recipe "postgresql::client"
    chef.add_recipe "ruby_build"
    chef.add_recipe "ruby_rbenv::user"
    chef.add_recipe 'passenger_apache2::default'
    chef.add_recipe 'passenger_apache2::mod_rails'
    chef.add_recipe "sonerdy::default"
  end

  config.vm.provision :shell, inline: 'yes | apt-get install qt5-default libqt5webkit5-dev'
  config.vm.provision :shell, inline: 'yes | apt-get install xvfb'
end
