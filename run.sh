#!/usr/bin/env bash

# Install more brew packages
if [ -f "$HOME/workspace/dotfiles/brew.sh" ]; then
  . "$HOME/workspace/dotfiles/brew.sh"
fi

# Finalize with symlinks
if [ -f "$HOME/workspace/dotfiles/link.sh" ]; then
  . "$HOME/workspace/dotfiles/link.sh"
fi
