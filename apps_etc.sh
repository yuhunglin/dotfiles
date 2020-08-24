#!/usr/bin/env bash

set -e

# Install Ruby
rbenv install -s 2.5.3
rbenv global 2.5.3
#rbenv shell 2.5.3
rbenv rehash
gem install bundler
gem install terraform_landscape

# Config for pq gem
bundle config --local build.pg --with-opt-dir="/usr/local/opt/libpq"
# psql and pg_* bin goodies
brew link --force libpq

# TODO: probably sort out the version problem
#pip install --upgrade pip
pip3 install --user pynvim

# configure NVM
mkdir -p ~/.nvm

npm install --save-dev eslint eslint-plugin-vue

# Install android sdk
#android update sdk --no-ui --filter 'platform-tools'

# Auto install vim-plug plugins
vim +PlugInstall +qall

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
