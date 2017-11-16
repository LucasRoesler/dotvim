
" skip init for vim-tiny or vim-small
if 0 | endif
set encoding=utf-8

" load plugins
source ~/.vim/plugins.vim

" VIM Specific settings
filetype plugin on
filetype plugin indent on

set bs=2                " allow backspacing over everything in insert mode
set cindent
set si
set nobackup            " don't keep a backup file
set viminfo='20,\"50    " read/write a .viminfo file
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set nowrap              " make sure that long lines don't wrap
set laststatus=2        " Make sure the status line is always displayed
set splitright
set splitbelow
set visualbell          " use a visual bell instead of beeping
set incsearch           " use incremental search
set wildmenu
set wildmode=longest:full,full
set hlsearch            " keep search results highlighted

" clipboard sharing on mac
set clipboard=unnamed

" turn on mouse support
set mousehide
set nomousefocus
set mousemodel=extend
set mouse=a

" show paren matches for 5 tenths of a second
set showmatch
set matchtime=5

" setup tabs for 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set expandtab
set noautoindent

" setup auto wrapping
set textwidth=78
set hidden
set colorcolumn=80
set number
set relativenumber
set noequalalways
set dir=~/.vim/swap
set nobackup writebackup

" enable project specific vim settings
set exrc
set secure

" disable completion preview
set completeopt-=preview

" switch syntax highlighting on
syntax enable

if has('vim_starting')
    if &compatible
        set nocompatible " disable vi settings
    endif
endif

" try to enable jellybeans theme, but if that fails, choose `ron`
try
    colorscheme gruvbox
    set background=dark
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme ron
endtry

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()
command! GoTestAll execute 'GoTest' s:find_git_root()

" automatically reload vimrc and gvimrc on save
autocmd! bufwritepost vimrc source %
autocmd! bufwritepost gvimrc source %

" load scripts
source ~/.vim/pluginsettings.vim      " plugin specific settings
source ~/.vim/functions.vim           " user-defined functions
source ~/.vim/keybindings.vim         " custom keybindings
