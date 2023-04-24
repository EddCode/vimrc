let $FZF_DEFAULT_COMMAND = ' rg --files --hidden --follow --color always --no-ignore-vcs  -g "!node_modules" -g "!.git"'
let $FZF_DEFAULT_OPTS='--ansi'

let $FZF_PREVIEW_COMMAND = '[[ -f {} ]] && bat --style numbers --color always {} || (echo {} && cat {})'


" Personalizar colores para FZF
let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'],
      \ }


nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <C-f> :Rg<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>sc :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit'}

" - Popup window (anchored to the bottom of the current window)
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8, 'relative': v:true, 'yoffset': 0.5, 'xoffset': 0.5 } }

" - down / up / left / right
"let g:fzf_layout = { 'down': '30%' }


let g:fzf_history_dir = '~/.local/share/fzf-history'
