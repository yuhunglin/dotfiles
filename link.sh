#!/usr/bin/env bash

ln -si ~/workspace/dotfiles/.laptop.local ~/.laptop.local
ln -si ~/workspace/dotfiles/.vimrc ~/.vimrc
ln -si ~/workspace/dotfiles/.vim/ ~/.vim
ln -si ~/workspace/dotfiles/.bash_it/ ~/.bash_it
ln -si ~/workspace/dotfiles/.gitconfig ~/.gitconfig

cp -i ~/workspace/dotfiles/.bashrc ~/.bashrc
cp -i ~/workspace/dotfiles/.bash_profile ~/.bash_profile
cp -i ~/workspace/dotfiles/.inputrc ~/.inputrc

mkdir -p ~/.aws/
yes n | cp -i aws-credentials-sample ~/.aws/credentials 2>/dev/null
