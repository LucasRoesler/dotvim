" install vim-plug if it's not already installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC | Startify | Ql
endif

" plugin list
call plug#begin('~/.vim/plugins')

" python specific plugins
Plug 'hynek/vim-python-pep8-indent'    " for auto indenting pep8 style
Plug 'python-rope/ropevim'             " refactoring, finding occurrences
Plug 'python-mode/python-mode'

" home screen
Plug 'mhinz/vim-startify'              " pretty start page

" project management
Plug 'ctrlpvim/ctrlp.vim'              " project file fuzzy-matcher
Plug 'dbakker/vim-projectroot'         " locate project
Plug 'scrooloose/nerdtree'             " file tree

" window management
Plug 'roman/golden-ratio'
Plug 'vim-scripts/tinykeymap'
Plug 'vim-scripts/ZoomWin'

" coding/editing
Plug 'SirVer/ultisnips'                " textmate style snippets
Plug 'honza/vim-snippets'              " the actual snippest themselves
Plug 'tpope/vim-surround'              " add, change, delete surround text
Plug 'w0rp/ale'
Plug 'jmcantrell/vim-virtualenv'       " virtualenv
Plug 'ntpeters/vim-better-whitespace'  " removes spurious whitespace
Plug 'tpope/vim-commentary'            " quickly toggle comments
Plug 'szw/vim-tags'
Plug 'davidhalter/jedi-vim'            " python autocomplete
Plug 'michaeljsmith/vim-indent-object' " for selecting indent objects
Plug 'kshenoy/vim-signature'           " visible marks
Plug 'vim-scripts/Align'
Plug 'godlygeek/tabular'               " align text, even tables

" search
Plug 'haya14busa/incsearch.vim'
Plug 'dyng/ctrlsf.vim'                 " search project

" syntax files
Plug 'plasticboy/vim-markdown'         " markdown syntax highlighting
Plug 'pangloss/vim-javascript'         " javascript utils

" undo
Plug 'sjl/gundo.vim'                   " undo tree

" git
Plug 'jreybert/vimagit'
Plug 'mattn/webapi-vim'                " required for gist-vim
Plug 'mattn/gist-vim'                  " post gists to gist.github.com
Plug 'tpope/vim-fugitive'              " git utils
Plug 'airblade/vim-gitgutter'

" movement
Plug 'Lokaltog/vim-easymotion'         " much quicker movement
Plug 'vim-scripts/quit-another-window'

" colorschemes
Plug 'synic/jellybeans.vim'
Plug 'jnurmine/Zenburn'
Plug 'morhetz/gruvbox'
Plug 'synic/synic.vim'

" interface
Plug 'bling/vim-airline'

" misc
Plug 'vim-scripts/openssl.vim'
Plug 'Valloric/ListToggle'

call plug#end()

" auto-reload this file when saving
autocmd! bufwritepost plugins.vim source %
