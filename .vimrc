set nocompatible            " disable vi compatibility mode
set history=1000            " increase history size
set noswapfile              " don't create swapfiles
set nobackup                " don't backup, use git!
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Enable filetype
filetype indent plugin on

" Persist undo history between file editing sessions.
set undofile
set undodir=~/.vim/undodir

" Modify indenting settings
set autoindent              " autoindent always ON.
set wrap 		    " wrap line if it`s larger

" Modify some other settings about files
set encoding=utf8          " always use unicode (god damnit, windows)
set guifont=Fira_Code_Nerd_Font:11
set backspace=indent,eol,start " backspace always works on insert mode
set hidden

" Make statusline appear even with only single window.
set laststatus=1

" ==========
"  Colors
" ==========
syntax enable
set redrawtime=10000
set t_Co=256
set background=dark
colorscheme gruvbox

" setup cursor
set guicursor+=a:ver30-iCursor-blinkwait175-blinkoff150-blinkon175
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue

" highlight searchings
set incsearch
set hlsearch
set smartcase
map <C-F> :nohlsearch<CR>
" Use a specific pipe ch
set fillchars+=vert:\┊
set visualbell
set noshowmode
set wildmenu            " enable visual wildmenu

set showcmd
set nowrap              " don't wrap long lines
set number              " show line numbers
set relativenumber      " show numbers as relative by default
set showmatch           " higlight matching parentheses and brackets
set autoread		" refreshing file
set colorcolumn=120

highlight ColorColumn ctermbg=lightblue

let mapleader=" "

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
map <leader>C :setlocal formatoptions=cro<CR>

" Shorcuts for switching buffers
map <Leader>n :bnext<CR>
map <Leader>p :bprev<CR>
map <Leader>b :buffers<CR>
map <Leader>c :bd<CR>
nnoremap <Leader>U :UndotreeShow<CR>

" Manage easeir windows actions
map <Leader>wh <C-w>h
map <Leader>wj <C-w>j
map <Leader>wk <C-w>k
map <Leader>wl <C-w>l
nnoremap <silent> <Leader>wp :wincmd p <CR>
nnoremap <silent> <Leader>ws :wincmd s <CR>
nnoremap <silent> <Leader>wv :wincmd v <CR>
nnoremap <silent> <Leader>wn :wincmd n <CR>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>
nnoremap <silent> <Leader>wq <C-w>q <CR>

" auto closing characters
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

inoremap (      ()<Left>
inoremap (<CR>  (<CR>)<Esc>O
inoremap ((     (
inoremap ()     ()

" Clean hidden buffers (https://stackoverflow.com/a/8459043/2033517)
function DeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
endfunction

let b:c_minlines = 10000

if exists("c_minlines")
  let b:c_minlines = c_minlines
else
  if !exists("c_no_if0")
    let b:c_minlines = 50 " #if 0 constructs can be long
  else
    let b:c_minlines = 15 " mostly for () constructs
  endif
endif
exec "syn sync ccomment cComment minlines=" . b:c_minlines
