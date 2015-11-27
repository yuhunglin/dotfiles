#!/usr/bin/env bash

source ~/.bash_profile

# General
## Set standby delay to 24 hours (default is 1 hour)
sudo pmset -a standbydelay 86400

## Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

## Enable ssh login
sudo systemsetup -setremotelogin on

## Menu bar hide some useless items
defaults write com.apple.systemuiserver menuExtras -array \
    "/opt/homebrew-cask/Caskroom/menumeters/latest/MenuMeters Installer.app/Contents/Resources/MenuMeters.prefPane/Contents/Resources/MenuMeterNet.menu" \
	"/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
	"/System/Library/CoreServices/Menu Extras/AirPort.menu" \
	"/System/Library/CoreServices/Menu Extras/Battery.menu" \
	"/System/Library/CoreServices/Menu Extras/Clock.menu" \
    "/opt/homebrew-cask/Caskroom/menumeters/latest/MenuMeters Installer.app/Contents/Resources/MenuMeters.prefPane/Contents/Resources/MenuCracker.menu"

## Menu bar clock format
defaults write com.apple.menuextra.clock "DateFormat" "EEE MMM d  h:mm:ss a"

## Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

## Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

## Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

## Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Keyboard settings
## Keyboard repeat rates
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain KeyRepeat -int 0
defaults write NSGlobalDomain InitialKeyRepeat -int 15

## F1 F2 etc
defaults write NSGlobalDomain "com.apple.keyboard.fnState" -bool true

## Disable spellcheck
defaults write NSGlobalDomain WebAutomaticSpellingCorrectionEnabled -bool false

## DIsable autocorrect
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Mouse settings
## Disable “natural” (Lion-style) scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

## Force click
defaults write NSGlobalDomain "com.apple.trackpad.forceClick" -bool false

# Screen
## Save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

## Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

## Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# Finder
## Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

## Finder: show hidden files by default
#defaults write com.apple.finder AppleShowAllFiles -bool true

## Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

## Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

## Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

## Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

## Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

## Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

## Disable disk image verification
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

## Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

## Use list view in all Finder windows by default
## Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

## Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

## Empty Trash securely by default
defaults write com.apple.finder EmptyTrashSecurely -bool true

## Enable AirDrop over Ethernet and on unsupported Macs running Lion
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

## Show the ~/Library folder
chflags nohidden ~/Library

# Dock
# Set the icon size of Dock items to 45 pixels
defaults write com.apple.dock tilesize -int 45

# Google Chrome & Google Chrome Canary
## Allow installing user scripts via GitHub Gist or Userscripts.org
defaults write com.google.Chrome ExtensionInstallSources -array "https://gist.githubusercontent.com/" "http://userscripts.org/*"
defaults write com.google.Chrome.canary ExtensionInstallSources -array "https://gist.githubusercontent.com/" "http://userscripts.org/*"


# Startup items
addloginitem /Applications/Flycut.app
addloginitem ~/Applications/Caffeine.app
addloginitem ~/Applications/ShiftIt.app
addloginitem ~/Applications/Jing.app
addloginitem ~/Applications/Dropbox.app

killall SystemUIServer
killall Terminal
killall cfprefsd
killall Dock
killall Finder
