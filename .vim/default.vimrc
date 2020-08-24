set nocompatible

let mapleader = ","
color vividchalk
set background=dark
if has("gui_macvim")
  set guifont=Monaco:h16
endif
let &t_Co=256

filetype plugin indent on

set cursorline
set hidden
set number
set ruler
set encoding=utf-8
set backspace=indent,eol,start " Fix problems with backspace in insert mode
syntax on

" ruby whitespace
autocmd FileType ruby set tabstop=2|set shiftwidth=2|set softtabstop=2|set expandtab

" vue autoload
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

" json autoload
"au BufRead,BufNewFile,BufReadPost *.json set syntax=json
"au BufRead,BufNewFile,BufReadPost *.json setlocal filetype=json

" Clipboard
set clipboard=unnamed

" Whitespace
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·

" Searching
set nohlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

set laststatus=2 " Status bar

" Turn off backup files
set noswapfile
set nobackup
set nowb

" Speed up
if has("nvim")
  set nolazyredraw
  set noshowcmd
else
  set ttyfast
  set ttyscroll=3
  set showcmd " Display incomplete commands
  set lazyredraw
endif

" Disable jsDoc trying to steal <C-l>
let g:jsdoc_default_mapping = 0
if !hasmapto('<Plug>(jsdoc)')
    nnoremap <silent> <leader>d :call jsdoc#insert()<CR>
endif

" Highlight after 100 characters
augroup vimrc_autocmds
    autocmd BufEnter * highlight OverLength ctermfg=red guibg=#592929
    autocmd BufEnter * match OverLength /\%100v.*/
augroup END

" Reload files changed outside vim
set autoread

" Automatically :write before running commands
set autowrite

" Remove trailing whitespace when manually saving a buffer
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Copy current filename into system clipboard
nnoremap <silent> <leader>cf :let @* = expand("%:~")<CR>

" Vertical split and move to new window
nnoremap <leader>v <C-W>v<C-W>l

" Horizontal split and move to new window
nnoremap <leader>h :split<CR><C-W>j

" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Control-P
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*
map <leader>b :CtrlPBuffer<CR>
map <leader>cpc :CtrlPClearCache<CR>

" Make CtrlP use Ag for listing the files. Much faster and respects .gitignore
let g:ctrlp_user_command = 'ag %s -l --hidden --ignore .git --nocolor -g ""'

" CtrlP auto cache clearing.
function! SetupCtrlP()
    if exists("g:loaded_ctrlp") && g:loaded_ctrlp
        augroup CtrlPExtension
            autocmd!
            autocmd FocusGained  * CtrlPClearCache
            autocmd BufWritePost * CtrlPClearCache
        augroup END
    endif
endfunction
if has("autocmd")
    autocmd VimEnter * :call SetupCtrlP()
endif

" NERDTree configuration
nnoremap <silent> <C-\> :NERDTreeFind<CR>
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
map <leader>nt :NERDTreeToggle<CR>
map <leader>nf :NERDTreeFind<CR>

" ZoomWin configuration
map <leader><leader> :MaximizerToggle!<CR>

" CTags
map <leader>rt :!ctags --extras=+f --exclude=tmp --exclude=node_modules -R * <CR><CR>
map <leader>lt :TagbarToggle<CR>
let Tlist_Use_Right_Window = 1

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
"let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Remember last location in file
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                \| exe "normal g'\"" | endif
endif

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

" Add markdown syntax highlighting and spellcheck
au BufRead,BufNewFile *.md set ft=markdown
au BufRead,BufNewFile *.md setlocal spell
au BufRead,BufNewFile *.md setlocal wrap
map <leader>M :set syntax=markdown<CR>:set wrap<CR>:set spell<CR>

" Enable syntastic syntax checking
"let g:syntastic_enable_signs=1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
" Neomake
" let g:neomake_verbose = 3
let g:neomake_logfile = '/tmp/neomake.log'
"let g:neomake_ruby_reek_maker_errorformat =
        "\ '%E%.%#: Racc::ParseError: %f:%l :: %m,' .
        "\ '%W%f:%l: %m'
"let g:neomake_ruby_reek_maker = {
    "\ 'args': ['--single-line'],
    "\ 'errorformat': g:neomake_ruby_reek_maker_errorformat,
    "\ }
"let b:neomake_ruby_rubocop_exe = \"~/.rvm/gems/ruby-2.4.0/bin/rubocop"
"let g:neomake_ruby_enabled_makers = ['mri', 'rubocop']
let g:neomake_javascript_eslint_exe = nrun#Which('eslint')
let g:neomake_javascript_enabled_makers = ['eslint']
au BufWinEnter,BufWritePost *.js,*.jsx,*.vue Neomake
let g:neomake_serialize = 1
let g:neomake_serialize_abort_on_error = 1

function! MyOnBattery()
  if filereadable('/usr/bin/pmset')
    silent exe "!pmset -g batt | grep discharging"
    return !v:shell_error
  else
    return readfile('/sys/class/power_supply/AC/online') == ['0']
  endif
endfunction
if MyOnBattery()
  call neomake#configure#automake('w')
else
  call neomake#configure#automake('inrw', 1000)
endif

" % to bounce from do to end etc.
runtime! macros/matchit.vim

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapCTabSwitchBufs = 1

" Open up a git grep line, with a quote started for the search
function Search(string) abort
  let saved_shellpipe = &shellpipe
  let &shellpipe = '>'
  try
    execute 'Ack!' shellescape(a:string, 1)
  finally
    let &shellpipe = saved_shellpipe
  endtry
endfunction
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case --hidden --ignore .git'
endif
"cnoreabbrev Ack Ack!
nnoremap <leader>ag :Ack!<space>
"nnoremap <leader>ag :call Search("")<left><left>

" Toggle pasting to preserve format when pasting from clipboard into buffer
nnoremap <leader>pt :set invpaste paste?<cr>
set pastetoggle=<leader>pt
set showmode

map <silent> <Leader>s :TestNearest<CR>
map <silent> <Leader>t :TestFile<CR>
map <silent> <Leader>a :TestSuite<CR>
map <silent> <Leader>l :TestLast<CR>
map <silent> <Leader>g :TestVisit<CR>

" https://github.com/FooSoft/vim-argwrap
map <silent> <Leader>w :ArgWrap<CR>

" deoplete -
let g:deoplete#enable_at_startup = 1
call deoplete#custom#source('buffer', 'rank', 501)
call deoplete#custom#source('_', 'max_candidates', 5)
let g:deoplete#disable_auto_complete = 1
" deoplete-go settings
"let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
"let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

" devdocs - rhysd/devdocs.vim
nmap K <Plug>(devdocs-under-cursor)
let g:devdocs_filetype_map = {
    \   'javascript.jsx': 'react',
    \   'javascript.test': 'chai',
    \ }

" indentline
map <silent> <Leader>ig :IndentLinesToggle<CR>
let g:indentLine_concealcursor=""
