" NERDtree
map <Leader>t :NERDTreeToggle<CR>
map <Leader>tf :NERDTreeFind<CR>
map <Leader>r :NERDTreeRefreshRoot<CR>

let NERDTreeQuitOnOpen=1
let NERDTreeWinSize=35
let NERDTreeCaseSensitiveSort=1

let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeColorMapCustom = {
			\ "Staged": "#0ee375",
			\ "Modified": "#d9bf91",
			\ "Renamed": "#51c1fc",
			\ "Untracked": "#fce77c",
			\ "Unmarged": "#fc51e6",
			\ "Dirty": "#ffbd61",
			\}

