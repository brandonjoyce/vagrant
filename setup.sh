#!/usr/bin/env bash

rbenv rehash
gem install bundler
rbenv rehash

# dotfiles w/ stow
if [ ! -d ~/dotfiles ]; then
  git clone git@github.com:brandonjoyce/dotfiles.git ~/dotfiles
  cd ~/dotfiles
  sh setup.sh
  source ~/.zshrc
fi

# setup projects
cd /vagrant
ruby setup_projects.rb
sudo apachectl restart

# GIT Config
git config --global user.email "brandon@sonerdy.com"
git config --global user.name "Brandon Joyce"
git config --global push.default simple

# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
