# Dotfiles

Reworked off off a mathias base for high sierra 10.13.

## Installation (from a new machine)

The `bootstrap.sh` should be sufficient to get Command Line tools, git and homebrew installed on a vanilla machine.

1. `mkdir -p ~/workspace && cd ~/workspace && curl --remote-name https://raw.githubusercontent.com/yuhunglin/dotfiles/sierra/bootstrap.sh && chmod +x bootstrap.sh && ./bootstrap.sh`

While the top level script is running
```
sudo scutil --set HostName <new name>
sudo scutil --set ComputerName <new name>
sudo scutil --set LocalHostName <new name>
ssh-keygen -t rsa -b 4096
# Copy to github for the new machine
cat ~/.ssh/id_rsa.pub
mkdir ~/workspace/ && cd ~/workspace/
git clone git@github.com:yuhunglin/dotfiles.git
cd ~/workspace/dotfiles
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

### TODO:
* bin/confd
* bin/levant
* bin/vault-unsealer
