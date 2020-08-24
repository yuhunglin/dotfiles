" ----------------------------------------------------------------------------
"   Plug
" ----------------------------------------------------------------------------

" Install vim-plug if we don't already have it
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Files
Plug 'mileszs/ack.vim'

" Text
Plug 'scrooloose/nerdcommenter'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
end
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'neomake/neomake'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-abolish'
Plug 'vim-scripts/ingo-library'
Plug 'vim-scripts/AdvancedSorters'
Plug 'FooSoft/vim-argwrap'

" Utilities
Plug 'bling/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'embear/vim-localvimrc'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'szw/vim-maximizer'
Plug 'godlygeek/tabular'
Plug 'greyblake/vim-preview'
Plug 'rhysd/devdocs.vim'

" Testing
Plug 'janko-m/vim-test'

" Git
Plug 'tpope/vim-fugitive'

" Syntax
Plug 'ekalinin/Dockerfile.vim', { 'for': ['Dockerfile'] }
Plug 'hashivim/vim-hashicorp-tools'
Plug 'Yggdroot/indentLine'
Plug 'elzr/vim-json'

source ~/.vim/plugs-javascript.vimrc
source ~/.vim/plugs-ruby.vimrc
source ~/.vim/plugs-elixir.vimrc
source ~/.vim/plugs-python.vimrc

filetype plugin indent on                   " required!
call plug#end()
