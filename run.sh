#!/usr/bin/env bash
# TODO: deprecate

# Install more brew packages
if [ -f "$HOME/workspace/dotfiles/brew.sh" ]; then
  . "$HOME/workspace/dotfiles/brew.sh"
fi

# Finalize with symlinks
if [ -f "$HOME/workspace/dotfiles/link.sh" ]; then
  . "$HOME/workspace/dotfiles/link.sh"
fi

# Config apps and etc
# TODO: seems a little buggy. run items manually
#if [ -f "$HOME/workspace/dotfiles/apps_etc.sh" ]; then
#  . "$HOME/workspace/dotfiles/apps_etc.sh"
#fi

# Tinker with os x settings
if [ -f "$HOME/workspace/dotfiles/.macos" ]; then
  . "$HOME/workspace/dotfiles/.macos"
fi
