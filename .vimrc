set nocompatible            " disable vi compatibility mode
set history=1000            " increase history size
set noswapfile              " don't create swapfiles
set nobackup                " don't backup, use git!
set nowritebackup
set redrawtime=10000
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
let mapleader=" "

" Javascript specific settings.
autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab


" Give more space for displaying messages.
set cmdheight=2

" Enable filetype
filetype indent plugin on

" Persist undo history between file editing sessions.
"set undofile
"set undodir=~/.vim/undodir

" Modify indenting settings
set autoindent  " autoindent always ON.
set smartindent
set nowrap      " wrap line if it`s larger

" Modify some other settings about files
set encoding=utf-8          " always use unicode (god damnit, windows)
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

set guifont=Victor\ Mono:h12

let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"

if has('termguicolors')
	set termguicolors
endif

function! ChangeBackground()
  if system("defaults read -g AppleInterfaceStyle") =~ '^Dark'
    set background=dark   " for dark version of theme
    colorscheme sonokai
  else
    set background=light  " for light version of theme
    colorscheme PaperColor
  endif

  try
    execute "AirlineRefresh"
  catch
  endtry
endfunction

" initialize the colorscheme for the first run
call ChangeBackground()

"Invisible character colors
highlight NonText guifg=#4a4a59
highlight Comment guifg=magenta gui=italic
highlight SpecialKey guifg=#4a4a59 gui=italic

" highlight searchings
set incsearch
set hlsearch
set smartcase
map <C-q> :nohlsearch<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set list listchars=tab:►\ ,eol:-
set noshowmode
set wildmenu            " enable visual wildmenu
set showcmd

set number             " show line numbers
set relativenumber     " show numbers as relative by default
set showmatch          " higlight matching parentheses and brackets
set autoread		   " refreshing file
set cursorline        " highlight current line
set visualbell        " blink cursor on error, instead of beeping
"set ruler             " show line and column number of the cursor on right side of statusline
set showmatch          " highlight matching parentheses / brackets [{()}]
set lazyredraw         " redraw screen only when we need to

"highlight ColorColumn ctermbg=lightblue

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

augroup filetypedetect
  command! -nargs=* -complete=help Help vertical belowright help <args>
  autocmd FileType help wincmd L
  
  autocmd BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
  
  autocmd BufNewFile,BufRead *.txt setlocal noet ts=4 sw=4
  autocmd BufNewFile,BufRead *.md setlocal noet ts=4 sw=4
  autocmd BufNewFile,BufRead *.vim setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.sh setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.fish setlocal expandtab shiftwidth=2 tabstop=2
  
  autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4
augroup END
"=====================================================
"===================== STATUSLINE ====================

let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '%a',
      \'y'    : '%Y-%m-%d %H:%M',
      \'z'    : ' #h',
      \'options' : {'status-justify' : 'left', 'status-position' : 'bottom'}}

let g:tmuxline_powerline_separators = 0

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

" Shorcuts for switching buffers
map <Leader>n :bnext<CR>
map <Leader>p :bprev<CR>
map <Leader>b :buffers<CR>
map <Leader>bd :bd<CR>
nnoremap <Leader>U :UndotreeShow<CR>
" quick semi
nnoremap <Leader>; $a;<Esc>

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>e :e!<CR>

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

nnoremap <C-i> :new<CR>
nnoremap <C-s> :vnew<CR>
nnoremap <C-n> :wincmd w<CR>
nnoremap <C-c> :close<CR>

noremap <Leader>tv :botright vnew <Bar> :terminal <cr>
noremap <Leader>th :botright new <Bar> :terminal <cr>

" ==============================
" Manage easeir windows actions
" ==============================

" Move through the windows
map <Leader>h <C-w>h
map <Leader>j <C-w>j
map <Leader>k <C-w>k
map <Leader>l <C-w>l


" =======================
" Run NodeJs & Golang
" =======================
" run current file
nnoremap <Leader>xn :!node %<cr>
nnoremap <Leader>xg :!go run  %<cr>


" Configuración de colores para GitSigns
highlight GitSignsAdded ctermfg=2 guifg=#50a14f cterm=bold
highlight GitSignsRemoved ctermfg=1 guifg=#e74c3c cterm=bold
highlight GitSignsChanged ctermfg=3 guifg=#f1c40f cterm=bold
highlight GitSignsChangeRemoved ctermfg=5 guifg=#e64ce6 cterm=bold

set rtp+=/opt/homebrew/opt/fzf
