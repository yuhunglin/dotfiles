#!/usr/bin/env bash

SHELL_RCFILE="$HOME/.bashrc"

fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n$fmt\n" "$@"
}

append_to_file() {
  local file="$1"
  local text="$2"

  if ! grep -Fqs "$text" "$file"; then
    printf "\n%s\n" "$text" >> "$file"
  fi
}

# shellcheck disable=SC2154
trap 'ret=$?; test $ret -ne 0 && printf "failed\n\n" >&2; exit $ret' EXIT

set -e

if [ ! -d "$HOME/.bin/" ]; then
  mkdir "$HOME/.bin"
fi

if [ ! -f "$SHELL_RCFILE" ]; then
  touch "$SHELL_RCFILE"
fi

# shellcheck disable=SC2016
append_to_file "$SHELL_RCFILE" 'export PATH="$HOME/.bin:$PATH"'


brew_install_or_upgrade() {
  if brew_is_installed "$1"; then
    if brew_is_upgradable "$1"; then
      fancy_echo "Upgrading %s ..." "$1"
      brew upgrade "$@"
    else
      fancy_echo "Already using the latest version of %s. Skipping ..." "$1"
    fi
  else
    fancy_echo "Installing %s ..." "$1"
    brew install "$@"
  fi
}

brew_is_installed() {
  brew list -1 | grep -Fqx "$1"
}

brew_is_upgradable() {
  ! brew outdated --quiet "$1" >/dev/null
}


if ! command -v brew >/dev/null; then
  fancy_echo "Installing Homebrew ..."
    curl -fsS \
      'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby

    # shellcheck disable=SC2016
    append_to_file "$SHELL_RCFILE" 'export PATH="/usr/local/bin:$PATH"'
else
  fancy_echo "Homebrew already installed. Skipping ..."
fi

fancy_echo "Updating Homebrew formulas ..."
brew update

brew_install_or_upgrade 'git'
brew_install_or_upgrade 'neovim'

# Enable support for git osx credential helper
git config --global credential.helper osxkeychain

