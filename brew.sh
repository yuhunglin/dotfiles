#!/usr/bin/env bash

fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n$fmt\n" "$@"
}

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

brew_tap_is_installed() {
  brew tap | ag "$1" > /dev/null
}

brew_tap() {
  if ! brew_tap_is_installed "$1"; then
    fancy_echo "Tapping $1..."
    brew tap "$1" 2> /dev/null
  fi
}

brew_cask_expand_alias() {
  brew cask info "$1" 2>/dev/null | head -1 | awk '{gsub(/:/, ""); print $1}'
}

brew_cask_is_installed() {
  local NAME
  NAME=$(brew_cask_expand_alias "$1")
  brew cask list -1 | grep -Fqx "$NAME"
}

app_is_installed() {
  local app_name
  app_name=$(echo "$1" | cut -d'-' -f1)
  find /Applications -iname "$app_name*" -maxdepth 1 | egrep '.*' > /dev/null
}

brew_cask_install() {
  if app_is_installed "$1" || brew_cask_is_installed "$1"; then
    fancy_echo "$1 is already installed. Skipping..."
  else
    fancy_echo "Installing $1..."
    brew cask install "$@"
  fi
}

brew_install_or_upgrade 'vim'
brew_cask_install 'macvim'
brew_cask_install 'iterm2'
brew_cask_install 'caffeine'
brew_cask_install 'menumeters'
brew_cask_install 'flycut'
brew_cask_install 'evernote'
brew_cask_install 'shiftit'
brew_install_or_upgrade 'ssh-copy-id'
brew_tap 'trinitronx/homebrew-truecrypt'
brew_cask_install 'truecrypt'
brew_cask_install 'vagrant'
brew_cask_install 'virtualbox'
brew_cask_install 'vlc'
brew_cask_install 'android-file-transfer'
brew_cask_install 'dropbox'
brew_cask_install 'logitech-control-center'
brew_cask_install 'logitech-unifying'
brew_cask_install 'sshfs'
brew_cask_install 'inky'
brew_cask_install 'adium'
brew_cask_install 'jing'
brew_install_or_upgrade 'nvm'
brew_install_or_upgrade 'rbenv'
brew_install_or_upgrade 'ruby-build'
brew_install_or_upgrade 'git-flow'
brew_cask_install 'java'
brew_install_or_upgrade 'android-sdk'
brew_install_or_upgrade 'ansible'
brew_install_or_upgrade 'pyenv'
brew_install_or_upgrade 'pyenv-virtualenv'
brew_cask_install 'logitech-control-center'
