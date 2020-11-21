let g:gitgutter_enabled=1

nmap <Leader>hn <Plug>GitGutterNextHunk
nmap <Leader>hp <Plug>GitGutterPrevHunk
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hr <Plug>GitGutterUndoHunk
nmap <Leader>hv <Plug>GitGutterPreviewHunk
 
" Customize symbols
let g:gitgutter_sign_added = '✅'
let g:gitgutter_sign_modified = '⚠️'
let g:gitgutter_sign_removed = '❌'
