" install vim-plug if it's not already installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC | Startify | Ql
endif

" plugin list
call plug#begin('~/.vim/plugins')

Plug 'mileszs/ack.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'sheerun/vim-polyglot'

" python specific plugins
Plug 'hynek/vim-python-pep8-indent'    " for auto indenting pep8 style
Plug 'python-rope/ropevim', { 'for': ['python'] }             " refactoring, finding occurrences
Plug 'python-mode/python-mode'

" home screen
Plug 'mhinz/vim-startify'              " pretty start page

" project management
" Plug 'ctrlpvim/ctrlp.vim'              " project file fuzzy-matcher
Plug 'dbakker/vim-projectroot'         " locate project
"Plug 'scrooloose/nerdtree'             " file tree

" window management
Plug 'vim-scripts/tinykeymap'

" coding/editing
Plug 'tpope/vim-surround'              " add, change, delete surround text
Plug 'w0rp/ale'
Plug 'ntpeters/vim-better-whitespace'  " removes spurious whitespace
Plug 'tpope/vim-commentary'            " quickly toggle comments
Plug 'szw/vim-tags'
Plug 'michaeljsmith/vim-indent-object' " for selecting indent objects
Plug 'vim-scripts/Align'
Plug 'godlygeek/tabular'               " align text, even tables
Plug 'fatih/vim-go'
Plug 'majutsushi/tagbar'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'jiangmiao/auto-pairs'             " auto crud bracket pairs
Plug 'ajh17/VimCompleteMe'

" search
Plug 'haya14busa/incsearch.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" undo
Plug 'sjl/gundo.vim'                   " undo tree

" git
Plug 'tpope/vim-fugitive'              " git utils
Plug 'airblade/vim-gitgutter'


" colorschemes
Plug 'synic/jellybeans.vim'
Plug 'jnurmine/Zenburn'
Plug 'morhetz/gruvbox'
Plug 'synic/synic.vim'

" interface
 Plug 'itchyny/lightline.vim'

" misc
" Plug 'vim-scripts/openssl.vim'
Plug 'Valloric/ListToggle'

call plug#end()

" auto-reload this file when saving
autocmd! bufwritepost plugins.vim source %
