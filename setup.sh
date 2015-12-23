#!/usr/bin/env bash

rbenv rehash
gem install bundler
rbenv rehash
ruby setup_projects.rb
sudo apachectl restart
