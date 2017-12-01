" install vim-plug if it's not already installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC | Startify | Ql
endif

" plugin list
call plug#begin('~/.vim/plugins')

Plug 'tpope/vim-repeat'                " enable repeating supported plugin maps
Plug 'tpope/vim-unimpaired'

" python specific plugins
Plug 'hynek/vim-python-pep8-indent'    " for auto indenting pep8 style
Plug 'python-rope/ropevim', { 'for': ['python'] }             " refactoring, finding occurrences
Plug 'python-mode/python-mode'

" home screen
Plug 'mhinz/vim-startify'              " pretty start page

" project management
" Plug 'ctrlpvim/ctrlp.vim'              " project file fuzzy-matcher
Plug 'dbakker/vim-projectroot'         " locate project

" window management
Plug 'vim-scripts/tinykeymap'

" coding/editing
Plug 'sheerun/vim-polyglot'            " on demand* language pags
Plug 'fatih/vim-go'
Plug 'tpope/vim-surround'              " add, change, delete surround text
Plug 'JamshedVesuna/vim-markdown-preview'

Plug 'w0rp/ale'
Plug 'szw/vim-tags'
Plug 'majutsushi/tagbar'
Plug 'ajh17/VimCompletesMe'

Plug 'vim-scripts/Align'
Plug 'godlygeek/tabular'               " align text, even tables
Plug 'jiangmiao/auto-pairs'             " auto crud bracket pairs
Plug 'ntpeters/vim-better-whitespace'  " removes spurious whitespace
Plug 'tpope/vim-commentary'            " quickly toggle comments
Plug 'michaeljsmith/vim-indent-object' " for selecting indent objects


" search
Plug 'mileszs/ack.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'junegunn/fzf.vim'

" undo
Plug 'sjl/gundo.vim'                   " undo tree

" git
Plug 'tpope/vim-fugitive'              " git utils
Plug 'airblade/vim-gitgutter'


" colorschemes
Plug 'crusoexia/vim-monokai'

" interface
 Plug 'itchyny/lightline.vim'

" misc
" Plug 'vim-scripts/openssl.vim'
Plug 'Valloric/ListToggle'

call plug#end()

" auto-reload this file when saving
autocmd! bufwritepost plugins.vim source %
