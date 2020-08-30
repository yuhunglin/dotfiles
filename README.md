# Dotfiles

* [???] Reworked off a mathias base for high sierra 10.13.
* [2020/08/26] Reworked using dotbot

## OSX Installation (from a new machine)

1. Bootstrap
* caffinate
* promptless homebrew
* git install
* workspace, git clone
* kill caffinate

```
   (caffeinate &) \
   && echo | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" \
   && brew install git \
   && mkdir -p ~/workspace \
   && ssh-keyscan github.com >> ~/.ssh/known_hosts \
   && git clone https://github.com/yuhunglin/dotfiles.git ~/workspace/dotfiles\
   && cd ~/workspace/dotfiles \
   && git remote set-url origin git@github.com:yuhunglin/dotfiles.git \
   && killall caffeinate
```

1. While homebrew is bootstrapping:
* set machine name
* ssh-keygen
* add new ssh-key to github


1. run dotbot stuff
```
caffeinate -i ./install-profile osx_highsierra
```

---


While the top level script is running
```
sudo scutil --set HostName <new name>
sudo scutil --set ComputerName <new name>
sudo scutil --set LocalHostName <new name>
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $1
ssh-keygen -t rsa -b 4096
# Copy to github for the new machine
cat ~/.ssh/id_rsa.pub

#mkdir ~/workspace/ && cd ~/workspace/
#git clone git@github.com:yuhunglin/dotfiles.git
#cd ~/workspace/dotfiles
#git submodule init
#git submodule update
```

1. To run the rest of the install: `cd ~/workspace/dotfiles && ./run.sh`

1. Vim plugin install
```
vim .
PluginInstall
```

- Dock icon suggestions
  - Finder
  - Iterm
  - Google Keep
  - Chrome
  - Slack
  - ITunes
  - Activity Monitor
  - Preferences

- Open the following programs to finish installation
  - Viscosity
  - Dropbox
  - Flycut
  - Spectacle
  - Jing
  - VLC

- Maybe install the printer?


### Specify the `$PATH`

If `~/.path` exists, it will be sourced along with the other files, before any feature testing (such as [detecting which version of `ls` is being used](https://github.com/mathiasbynens/dotfiles/blob/aff769fd75225d8f2e481185a71d5e05b76002dc/.aliases#L21-26)) takes place.

Here’s an example `~/.path` file that adds `/usr/local/bin` to the `$PATH`:

```bash
export PATH="/usr/local/bin:$PATH"
```
### Extras

- `.extras.sample` is copied over to $HOME and an easy way to slot in things that cannot be committed easily.
