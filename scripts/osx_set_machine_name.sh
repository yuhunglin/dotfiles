#!/usr/bin/env bash

set -ex

sudo -v

sudo scutil --set HostName "$1"
sudo scutil --set ComputerName "$1"
sudo scutil --set LocalHostName "$1"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$1"
