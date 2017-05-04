#!/usr/bin/env bash

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

# Path to the bash it configuration
export BASH_IT="$HOME/.bash_it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='bobby'

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

export THEME_CLOCK_CHECK=true
export THEME_BATTERY_PERCENTAGE_CHECK=false
# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/xvzf/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# Load Bash It
source $BASH_IT/bash_it.sh

alias be="bundle exec"
alias tc-mount="/Applications/TrueCrypt.app/Contents/MacOS/TrueCrypt --text -k '' --protect-hidden=no --mount ~/Dropbox/dev /Volumes/STUFF && vi /Volumes/STUFF/keys.txt"
alias tc-dismount="/Applications/TrueCrypt.app/Contents/MacOS/TrueCrypt --text --dismount ~/Dropbox/dev /Volumes/STUFF"

# Docker machine settings
DOCKER_MACHINE="dev"
if docker-machine status $DOCKER_MACHINE | grep "Running" &> /dev/null
then
  eval "$(docker-machine env $DOCKER_MACHINE)"
else
  docker-machine start $DOCKER_MACHINE && eval "$(docker-machine env $DOCKER_MACHINE)"
fi
