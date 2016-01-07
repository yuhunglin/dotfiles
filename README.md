## Install
- Get the basic setup going:
```
curl --remote-name https://raw.githubusercontent.com/yuhunglin/dotfiles/master/mac
```

- Rerun this a few times until everything installs successfully
```
bash mac 2>&1 | tee ~/laptop.log
```

- While the top level script is running
```
ssh-keygen -t rsa -b 4096
sudo scutil --set HostName <new name>
# Copy to github for the new machine
cat ~/.ssh/id_rsa.pub
mkdir ~/workspace/ && cd ~/workspace/
git clone git@github.com:yuhunglin/dotfiles.git
cd ~/workspace/dotfiles
git submodule init
git submodule update
```

- Init bash_it
```
~/workspace/dotfiles/link.sh
~/.bash_it/install
~/workspace/dotfiles/link.sh
```
- Kick off the more detailed script when the `mac` one finishes
```
~/workspace/dotfiles/./bootstrap.sh
```

- If brew complains eventually:
```
brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup
```

- If there are issues symlinking some of the elements, comment out the link.sh entry after it runs in bootstrap.sh

- Vim plugin install (if necessary)
```
vim .
PluginInstall
```

- Dock icon suggestions
  - Finder
  - Iterm
  - Google Keep
  - Chrome
  - Adium
  - Slack
  - ITunes
  - Evernote
  - Activity Monitor
  - Preferences

- Open the following programs to finish installation
  - Viscosity
  - Dropbox
  - Flycut
  - Shiftit
  - Adium
  - Jing
  - VLC

## Credits
This laptop script is based on and inspired by:
* [The original mathias dotfiles](https://github.com/mathiasbynens/dotfiles)
* [18F's laptop](https://github.com/18F/laptop)
* [thoughtbot's laptop](https://github.com/thoughtbot/laptop) script.
