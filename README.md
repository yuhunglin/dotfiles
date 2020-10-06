# Dotfiles

* [???] Reworked off a mathias base for high sierra 10.13.
* [2020/08/26] Reworked using [dotbot](https://github.com/anishathalye/dotbot)
* [2020/09/07] Readme cleanup + dotbot instructions

## OSX Installation (from a new machine)

1. Bootstrap
    * caffinate
    * promptless homebrew
    * git install
    * workspace, git clone
    * kill caffinate
    ```
   (caffeinate &) \
   && chsh -s /bin/bash
   && echo | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" \
   && brew install git \
   && mkdir -p ~/workspace \
   && ssh-keyscan github.com >> ~/.ssh/known_hosts \
   && git clone --recursive https://github.com/yuhunglin/dotfiles.git ~/workspace/dotfiles\
   && cd ~/workspace/dotfiles \
   && git remote set-url origin git@github.com:yuhunglin/dotfiles.git \
   && killall caffeinate
    ```

1. Set machine name and stuff:
    * set machine name
    * ssh-keygen
    * add new ssh-key to github
    ```
    ~/workspace/dotfiles/scripts/osx_set_machine_name flexo
    ssh-keygen -t rsa -b 4096
    # Copy to github for the new machine
    cat ~/.ssh/id_rsa.pub
    ```

1. run dotbot stuff
    ```
    caffeinate -i ./install-profile osx_catalina
    ```
1. Deal with keybase finder issues:
    * `sudo xattr -rd com.apple.quarantine /Library/Filesystems/kbfuse.fs/` to deal with the kbfuse.fs signature issues.

1. keybase gpg stuff:
    * `keybase pgp export | gpg --import`
    * `<wherever you get the pgp secret key file> | gpg --allow-secret-key --import`
    * `gpg --list-secret-keys` - get the key ID
    * `gpg --edit-key ???` - trust fully
    * Make sure key matches the one listed in gitconfig
    * Notes
      * https://gist.github.com/webframp/75c680930b6b2caba9a1be6ec23477c1
      * https://makandracards.com/makandra-orga/37763-gpg-extract-private-key-and-import-on-different-machine


* Other useful commands:
    * Standalone config runs:
        * homebrew - `caffeinate -i ./install-standalone homebrew`
        * osx settings - `caffeinate -i ./install-standalone homebrew`
        * nvim refresh - `caffeinate -i ./install-standalone nvim`
---

### Stuff to automate

1. `dotfiles/bin`
    * github releases (for now)
    ```
    curl -L https://github.com/hashicorp/levant/releases/latest/download/darwin-amd64-levant -o ~/workspace/dotfiles/bin/levant && chmod +x ~/workspace/dotfiles/bin/levant

    curl -L https://github.com/jetstack/vault-unsealer/releases/latest/download/vault-unsealer_0.3.1_darwin_amd64 -o ~/workspace/dotfiles/bin/vault-unsealer && chmod +x ~/workspace/dotfiles/bin/vault-unsealer
    ```

1. Add Google Keep manually to the dock

1. Open the following programs to finish installation
    * Docker
    * Flycut
    * Keybase
    * Spectacle
    * VLC
    * Viscosity

* Maybe install the printer?

### Extras

* `.extras.sample` is copied over to $HOME and an easy way to slot in things that cannot be committed easily.
