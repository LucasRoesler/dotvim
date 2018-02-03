" map the escape key to `fd`
inoremap fd <esc>
vnoremap fd <esc>

" misc
map yig :call SelectBuffer()<cr>
map vig ggVG

autocmd FileType go nmap <space>t  <Plug>(go-test)
autocmd FileType go nmap <space>i  <Plug>(go-install)

" search
map /  <plug>(incsearch-forward)
map ?  <plug>(incsearch-backward)
map g/ <plug>(incsearch-stay)
nmap <Leader>b :Buffers<CR>
nmap <Leader>r :Tags<CR>
nmap <Leader>t :ProjectFiles<CR>
nmap <Leader>a :Ag<CR>

nmap <C-k>    :Ack! <cword><CR>
nmap <C-S-k>  :Ggrep! "\b<cword>\b"<CR>

map n  <plug>(incsearch-nohl-n)
map N  <plug>(incsearch-nohl-N)
map *  <plug>(incsearch-nohl-*)
map #  <plug>(incsearch-nohl-#)
map g* <plug>(incsearch-nohl-g*)
map g# <plug>(incsearch-nohl-g#)

" fugitive
nnoremap <silent> <space>gs :Gstatus<cr>
nnoremap <silent> <space>gd :Gdiff<cr>
nnoremap <silent> <space>gc :Gcommit<cr>
nnoremap <silent> <space>gb :Gblame<cr>
nnoremap <silent> <space>gl :Glog<cr>
nnoremap <silent> <space>gp :Git push<cr>
nnoremap <silent> <space>gr :Gread<cr>
nnoremap <silent> <space>gw :Gwrite<cr>
nnoremap <silent> <space>ge :Gedit<cr>
nnoremap <silent> <space>gi :Git add %<cr>

" location list
nnoremap <silent> <space>en :lnext<cr>
nnoremap <silent> <space>ep :lprev<cr>

" commenting
nmap <space>/ :call ToggleComment()<cr>
vmap <space>/ :call ToggleComment()<cr>

" easy window switching
nmap <silent> <space>wk :wincmd k<cr>
nmap <silent> <space>wj :wincmd j<cr>
nmap <silent> <space>wh :wincmd h<cr>
nmap <silent> <space>wl :wincmd l<cr>
nmap <silent> <space><tab> :b#<cr>
nmap <silent> <space>w= <C-w>=
nmap <silent> <space>wm :ZoomToggle<cr>
nmap <silent> <space>fed :e ~/.vim/vimrc<cr>

" tabs
nnoremap <silent> <space>ll :$tabnew<cr>:Startify<cr>
nnoremap <silent> <space>ln :tabnext<cr>
nnoremap <silent> <space>lp :tabprev<cr>
nnoremap <silent> <space>lc :tabclose<cr>
nnoremap <silent> <space>l1 1gt
nnoremap <silent> <space>l2 2gt
nnoremap <silent> <space>l3 3gt
nnoremap <silent> <space>l4 4gt
nnoremap <silent> <space>l5 5gt
nnoremap <silent> <space>l6 6gt
nnoremap <silent> <space>l7 7gt
nnoremap <silent> <space>l8 8gt
nnoremap <silent> <space>l9 9gt

" startify
nmap <space>bh :Startify<cr>

" file management
map <space>- :call NetRWCurrentFile()<cr>
map <space>_ :call NetRWCurrentProject()<cr>

" toggle relative line numbering
nmap <silent> <space>tr :call NumberToggle()<cr>

" gundo
nmap <silent> <space>ag :GundoToggle<cr>

" toggles
nmap <silent> <space>th :set nohlsearch!<cr>
nmap <silent> ,, :noh<cr>

" auto-reload this file when saving
autocmd! bufwritepost keybindings.vim source %
