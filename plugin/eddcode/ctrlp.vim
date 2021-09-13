"File listing
let g:ctrlp_user_command = 'find %s -type fa'

" ignore files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.DS_Store " MacOSX/Linux


" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\.git$\|node_modules\|log\|tmp\|dist$',
	\ 'file': '\.so$\|\.dat$|\.DS_Store$',
	\}
