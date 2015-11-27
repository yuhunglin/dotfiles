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
