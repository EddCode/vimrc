
" ------Standard Bindings------
" A way for switching relative numbers with a single map.
nmap <silent> <F5> :set invrelativenumber<CR>
imap <silent> <F5> <ESC>:set invrelativenumber<CR>a

" Basic file system commands
nnoremap <A-o> :!touch<Space>
nnoremap <A-e> :!crf<Space>
nnoremap <A-d> :!mkdir<Space>
nnoremap <A-m> :!mv<Space>%<Space>

" Enable and disable auto comment
map <C-c> :setlocal formatoptions-=cro<CR>
map <Leader>c :setlocal formatoptions=cro<CR>

" Shorcuts for switching buffers
map <Leader>n :bnext<CR>
map <Leader>p :bprev<CR>
map <Leader>b :buffers<CR>
map <Leader>c :bd<CR>
nnoremap <Leader>U :UndotreeShow<CR>

" quick semi
nnoremap <Leader>; $a;<Esc>

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>wq :w<CR>

" ==============================
" Manage easeir windows actions
" ==============================
"
" Move through the windows
map <Leader>wh <C-w>h
map <Leader>wj <C-w>j
map <Leader>wk <C-w>k
map <Leader>wl <C-w>l

" ==> resize horizontal windows
map <Leader>w+ <C-w>5+
map <Leader>w- <C-w>5-
" ==> resize vertical windows
map <Leader>w< <C-w>5<
map <Leader>w> <C-w>5>
" ==> resize equal windows
map <Leader>w= <C-w> =
" ==> split windows
nmap <Leader>ws :sp <CR>
nmap <Leader>wv :vsp <CR>

nnoremap <Leader>wS :new<CR>
nnoremap <Leader>wV :vnew<CR>
nnoremap <Leader>wn :wincmd w<CR>
nnoremap <Leader>wc :close<CR>
