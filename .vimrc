set nocompatible            " disable vi compatibility mode
set history=1000            " increase history size
set noswapfile              " don't create swapfiles
set nobackup                " don't backup, use git!
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Enable filetype
filetype indent plugin on

" Persist undo history between file editing sessions.
set undofile
set undodir=~/.vim/undodir

" Modify indenting settings
set autoindent              " autoindent always ON.
set wrap 		    	" wrap line if it`s larger
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
syntax on
set t_Co=256
set background=dark 
colorscheme gruvbox

" setup cursor
highlight Cursor guifg=green guibg=black
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

let mapleader=","

" ------Standard Bindings------
" Shortcuts for switching the buffers
map <Leader>n :buffers<CR>
map <Leader>p :bprev<CR>
map <Leader>b :buffers<CR>

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

" Shorcuts for swu=itching the buffers
map <Leader>n :bnext<CR>
map <Leader>p :bprev<CR>
map <Leader>b :buffers<CR>
map <Leader>c :bd<CR>
nnoremap <Leader>U :UndotreeShow<CR>

" Manage easeir windows actions
map ah <C-w>h
map aj <C-w>j
map ak <C-w>k
map al <C-w>l
nnoremap <silent> <Leader><C-p> :wincmd p <CR>
nnoremap <silent> <Leader><C-s> :wincmd s <CR>
nnoremap <silent> <Leader><C-v> :wincmd v <CR>
nnoremap <silent> <Leader><C-n> :wincmd n <CR>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical reize -5<CR>

" Clean hidden buffers (https://stackoverflow.com/a/8459043/2033517)
function DeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
endfunction
