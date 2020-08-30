#!/usr/bin/env bash

set -e

# Install android sdk
#android update sdk --no-ui --filter 'platform-tools'

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
