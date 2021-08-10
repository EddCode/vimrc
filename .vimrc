set nocompatible            " disable vi compatibility mode
set history=1000            " increase history size
set noswapfile              " don't create swapfiles
set nobackup                " don't backup, use git!
set nowritebackup
set redrawtime=10000
set ts=4 sts=4 sw=4 noexpandtab
let mapleader=" "


" Give more space for displaying messages.
set cmdheight=2

" Enable filetype
filetype indent plugin on

" Persist undo history between file editing sessions.
set undofile
set undodir=~/.vim/undodir

" Modify indenting settings
set autoindent  " autoindent always ON.
set smartindent
set nowrap 		    " wrap line if it`s larger

" Modify some other settings about files
set encoding=utf8          " always use unicode (god damnit, windows)
set guifont=Fira_Code_Nerd_Font:11
set backspace=indent,eol,start " backspace always works on insert mode
set hidden
"set invlist

" Make statusline appear even with only single window.
set laststatus=1

" ==========
"  Colors
" ==========
syntax enable
set re=0
set t_Co=256
set background=light
colorscheme papercolor

"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" highlight searchings
set incsearch
set hlsearch
set smartcase
map <C-S> :nohlsearch<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set list listchars=tab:┊\ ,eol:¬
set visualbell
set noshowmode
set wildmenu            " enable visual wildmenu

set showcmd
set number              " show line numbers
set relativenumber      " show numbers as relative by default
set showmatch           " higlight matching parentheses and brackets
set autoread		        " refreshing file
set cursorline          " highlight current line
set visualbell          " blink cursor on error, instead of beeping
set ruler               " show line and column number of the cursor on right side of statusline
set showmatch           " highlight matching parentheses / brackets [{()}]
set lazyredraw          " redraw screen only when we need to

highlight ColorColumn ctermbg=lightblue

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


" ===================
"   Mapping
" ===================

" ------Standard Bindings------
" A way for switching relative numbers with a single map.
nmap <silent> <F5> :set invrelativenumber<CR>
imap <silent> <F5> <ESC>:set invrelativenumber<CR>a
nmap <leader>l :set list!<CR>
noremap <Leader><Tab><Tab> :set noexpandtab<CR>

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
nnoremap <Leader>e :e!<CR>

" ==============================
" Manage easeir windows actions
" ==============================

" Move through the windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


" =======================
" Run NodeJs & Golang
" =======================
" run current file
nnoremap <Leader>xn :!node %<cr>
nnoremap <Leader>xg :!go run  %<cr>
