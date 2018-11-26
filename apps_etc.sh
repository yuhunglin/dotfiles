#!/usr/bin/env bash

set -e

# Install Ruby
rbenv install -s 2.5.3
rbenv global 2.5.3
#rbenv shell 2.5.3
rbenv rehash
gem install bundler

# TODO: probably sort out the version problem
#pip install --upgrade pip

# Install android sdk
#android update sdk --no-ui --filter 'platform-tools'

# Auto install vundle plugins
vim +PluginInstall +qall

# Bash-it bootstrap
if bash-it > /dev/null; then
    echo "Configuring Bash-it"
    cd $HOME/workspace/dotfiles/.bash_it && git pull origin master
    bash-it enable completion ssh
    bash-it enable completion git
    bash-it enable completion gh
    bash-it enable plugin base
    bash-it enable plugin rbenv
    bash-it enable plugin pyenv
fi

# disable START/STOP output control
# frees up CTRL+S for bash history forward search
stty -ixon
