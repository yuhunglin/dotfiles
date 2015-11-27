#!/usr/bin/env bash

# This depends on the laptop script functions

# Install additional brew packages
if [ -f "$HOME/workspace/dotfiles/brew.sh" ]; then
  . "$HOME/workspace/dotfiles/brew.sh"
fi

# Links and copies up some dotfiles
if [ -f "$HOME/workspace/dotfiles/link.sh" ]; then
  . "$HOME/workspace/dotfiles/link.sh"
fi

# Installs npm packages globally
if [ -f "$HOME/workspace/dotfiles/package.json" ]; then
  npm install -g "$HOME/workspace/dotfiles/"
fi

# Install Ruby
rbenv install 2.2.2
rbenv global 2.2.2
rbenv shell 2.2.2
gem install bundler
gem install sass

# Install python goodies
pip install --upgrade pip
pip install flake8

# Install android sdk
android update sdk --no-ui --filter 'platform-tools'

# Auto install vundle plugins
vim +PluginInstall +qall

source ~/.bash_profile

# Bash-it bootstrap
if bash-it > /dev/null; then
    echo "Configuring Bash-it"
    cd $HOME/workspace/dotfiles/.bash_it && git pull
    bash-it enable completion ssh
    bash-it enable completion git
    bash-it enable completion git_flow
    bash-it enable completion gh
    bash-it enable plugin base
    bash-it enable plugin rbenv
    bash-it enable plugin pyenv
    for file in $HOME/workspace/dotfiles/bash_it_custom/*; do
        . "$file"
    done;
fi

# Configure OSX specific settings
if [ -f "$HOME/workspace/dotfiles/osx.sh" ]; then
  . "$HOME/workspace/dotfiles/osx.sh"
fi
