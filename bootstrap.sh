#!/usr/bin/env bash

# Install additional brew packages
if [ -f "$HOME/workspace/dotfiles/brew.sh" ]; then
  . "$HOME/workspace/dotfiles/brew.sh"
fi

# Links and copies up some dotfiles
if [ -f "$HOME/workspace/dotfiles/link.sh" ]; then
  . "$HOME/workspace/dotfiles/link.sh"
fi

source ~/.bash_profile

# Bash-it bootstrap
if bash-it > /dev/null; then
    echo "Configuring Bash-it"
    cd $HOME/workspace/dotfiles/.bash_it && git pull
    bash-it enable completion ssh
    bash-it enable completion git
    bash-it enable completion gh
    bash-it enable plugin base
    for file in $HOME/workspace/dotfiles/bash_it_custom/*; do
        . "$file"
    done;
fi

# Configure OSX specific settings
if [ -f "$HOME/workspace/dotfiles/osx.sh" ]; then
  . "$HOME/workspace/dotfiles/osx.sh"
fi
