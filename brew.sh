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

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
#brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg
brew link --overwrite gnupg

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew_install_or_upgrade 'ag'
brew_install_or_upgrade 'awscli'
brew_install_or_upgrade 'grep'
brew_install_or_upgrade 'imagemagick'
brew_install_or_upgrade 'jq'
brew_install_or_upgrade 'libpq'
brew_install_or_upgrade 'nvm'
brew_install_or_upgrade 'openssh'
brew_install_or_upgrade 'packer'
brew_install_or_upgrade 'pv'
brew_install_or_upgrade 'pyenv'
brew_install_or_upgrade 'python3'
brew_install_or_upgrade 'rbenv'
brew_install_or_upgrade 'rbenv-vars'
brew_install_or_upgrade 'rename'
brew_install_or_upgrade 'ruby-build'
brew_install_or_upgrade 'screen'
brew_install_or_upgrade 'ssh-copy-id'
brew_install_or_upgrade 'telnet'
brew_install_or_upgrade 'tfenv'

# Init homebrew services
brew services
brew cask

brew_tap 'trinitronx/homebrew-truecrypt'
brew_tap 'caskroom/drivers'
brew_tap 'universal-ctags/universal-ctags'

brew install --HEAD universal-ctags

brew_cask_install 'android-file-transfer'
brew_cask_install 'android-sdk'
brew_cask_install 'caffeine'
brew_cask_install 'displaylink'
brew_cask_install 'docker'
brew_cask_install 'dropbox'
brew_cask_install 'flycut'
brew_cask_install 'google-chrome'
brew_cask_install 'iterm2'
brew_cask_install 'jing'
brew_cask_install 'keybase'
brew_cask_install 'logitech-control-center'
brew_cask_install 'logitech-unifying'
brew_cask_install 'slack'
brew_cask_install 'spectacle'
brew_cask_install 'spotify'
brew_cask_install 'sshfs'
brew_cask_install 'teamviewer'
brew_cask_install 'truecrypt'
brew_cask_install 'vagrant'
brew_cask_install 'vimr'
brew_cask_install 'virtualbox'
brew_cask_install 'virtualbox-extension-pack'
brew_cask_install 'viscosity'
brew_cask_install 'vlc'

tfenv install 0.11.10

## Remove outdated versions from the cellar.
brew cleanup
