#!/usr/bin/env bash

set -e

source $BASH_IT/bash_it.sh

bash-it enable completion ssh git github-cli
bash-it enable plugin base rbenv pyenv
