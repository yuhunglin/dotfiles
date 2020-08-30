#!/usr/bin/env bash
# TODO: deprecate

#ln -si ~/workspace/dotfiles/.vimrc ~/.vimrc
#ln -si ~/workspace/dotfiles/.gvimrc ~/.gvimrc
#ln -si ~/workspace/dotfiles/.vim/ ~/.vim
ln -si ~/workspace/dotfiles/.bash_it/ ~/.bash_it
#ln -si ~/workspace/dotfiles/.gitconfig ~/.gitconfig
#ln -si ~/workspace/dotfiles/.path ~/.path
#ln -si ~/workspace/dotfiles/.exports ~/.exports
#ln -si ~/workspace/dotfiles/.aliases ~/.aliases

cp -i ~/workspace/dotfiles/.bashrc ~/.bashrc
cp -i ~/workspace/dotfiles/.bash_profile ~/.bash_profile
cp -i ~/workspace/dotfiles/.inputrc ~/.inputrc
cp -i ~/workspace/dotfiles/.curlrc ~/.curlrc
cp -i ~/workspace/dotfiles/.wgetrc ~/.wgetrc
cp -i ~/workspace/dotfiles/.screenrc ~/.screenrc
#cp -i ~/workspace/dotfiles/.gitconfig ~/.gitconfig

cp -i ~/workspace/dotfiles/.extras.sample ~/.extras
