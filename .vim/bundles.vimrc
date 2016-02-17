set nocompatible
filetype off

if !isdirectory(expand("~/.vim/bundle/Vundle.vim/.git"))
  !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
endif

set runtimepath+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/vundle'

" Files
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'

" Text
Plugin 'scrooloose/nerdcommenter'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-abolish'

" Utilities
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'embear/vim-localvimrc'
Plugin 'scrooloose/nerdtree'
Plugin 'taglist.vim'
Plugin 'ZoomWin'
Plugin 'godlygeek/tabular'
Plugin 'greyblake/vim-preview'

" Testing
Plugin 'janko-m/vim-test'

" Git
Plugin 'tpope/vim-fugitive'

" Syntax
Plugin 'ekalinin/Dockerfile.vim'


source ~/.vim/bundles-javascript.vimrc
source ~/.vim/bundles-ruby.vimrc
source ~/.vim/bundles-elixir.vimrc
source ~/.vim/bundles-python.vimrc

call vundle#end()
filetype plugin indent on
