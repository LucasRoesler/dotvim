" install vim-plug if it's not already installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC | Startify | Ql
endif

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" golden ratio
let g:golden_ratio_enabled = 0
let g:golden_ratio_autocommand = 0

" incsearch
let g:incsearch#auto_nohlsearch = 1

" setup custom tab lines with numbers and the close button
" set tabline=%!TabLine()

" gundo settings
let g:gundo_width = 35
let g:gundo_right = 1
let g:gundo_preview_height = 25

" youcomplete
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']

" supertab
let g:SuperTabDefaultCompletionType = '<C-j>'

" jedi settings
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 1
let g:jedi#smart_auto_mappings = 0
let g:jedi#goto_definitions_command = 'gd'
let g:jedi#completions_command = '<C-n>'

" listtoggle
let g:lt_location_list_toggle_map = '<space>el'

" ale
let g:ale_sign_column_always = 1
highlight link ALEWarningSign String
highlight link ALEErrorSign Title

" Markdown
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_github=1

" easy motion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1
let g:EasyMotion_startofline = 1 " don't keep cursor column when JK motion

" FZF (replaces Ctrl-P, FuzzyFinder and Command-T)
set rtp+=/usr/local/opt/fzf
set rtp+=~/.fzf

" startify
let g:startify_custom_header = [
    \ '    \ \   / /_ _|  \/  |',
    \ ' ____\ \ / / | || |\/| |_____',
    \ '|_____\ V /  | || |  | |_____|',
    \ '       \_/  |___|_|  |_|',
    \ ]

if filereadable(expand('~/.cache/startify_bookmarks.vim'))
    source ~/.cache/startify_bookmarks.vim
else
    let g:startify_bookmarks = [
        \ {'labs': '$HOME/Code/go/src/github.com/contiamo/labs'},
        \ {'blog': '$HOME/Code/website'},
        \ {'vim': '$HOME/Code/dotvim'},
        \ {'dotfiles': '$HOME/Code/dotfiles'},
        \ ]
endif

let g:startify_list_order = ['bookmarks', 'files', 'sessions']
let g:startify_change_to_dir = 1
let g:startify_fortune_use_unicode = 0
let g:startify_enable_special = 0

" file management
let g:netrw_liststyle = 3
let g:netrw_banner = 1
let g:netrw_list_hide =
    \ '\(^\|\s\s\)\zs\.\S\+,\(^\|\s\s\)ntuser\.\S\+,__pycache__,\.pyc'

" virtualenv
let g:virtualenv_auto_activate = 1

" auto-reload this file when saving
autocmd! bufwritepost pluginsettings.vim source %

" python-mode
let g:pymode_folding = 0
let g:pymode_lint = 0
let g:pymode_rope = 0


" Lightline
let g:lightline = {
\ 'colorscheme': 'wombat',
\ 'active': {
\   'left': [['mode', 'paste'], ['filename', 'modified']],
\   'right': [['lineinfo'],['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ }

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

autocmd User ALELint call s:MaybeUpdateLightline()

" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

" markdown.vim
let g:vim_markdown_frontmatter = 1

" vim-go
let g:go_fmt_command = "gofmt"
let g:go_fmt_autosave = 1

" Sets the `transform` option for `gomodifytags` 
let g:go_addtags_transform = "camelcase"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1

let g:go_fmt_options = {
    \ 'gofmt': '-s',
    \ 'goimports': '-local github.com/contiamo',
\ }

"show the type info (|:GoInfo|) for the word under the cursor automatically.
let g:go_auto_type_info = 0
let g:go_updatetime = 800

" `gocode` should include suggestions from unimported packages
let g:go_gocode_unimported_packages = 1

let g:go_list_height = 0
let g:go_list_autoclose = 1
let g:go_statusline_duration = 6000

let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck', 'interfacer']
let g:go_metalinter_autosave_enabled = ['vet', 'golint' ]
let g:go_metalinter_autosave = 0
autocmd FileType go nmap <Leader>i <Plug>(go-info)
