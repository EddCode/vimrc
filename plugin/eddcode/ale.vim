" Only run linters named in ale_linters settings.
let g:ale_sign_error = '🤬'
let g:ale_sign_warning = '🧐'

highlight clear ALEErrorSign
highlight clear ALEWarningSign

" linter setting
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:airline#extensions#ale#enabled = 1	                " Set this. Airline will handle the rest.
let g:ale#statusline#Count = 1
let g:ale_linters_explicit = 1
let g:ale_disable_lsp = 1
let g:ale_list_window_size = 5
let g:ale_virtualtext_cursor = 'current'
let g:ale_fix_on_save = 1

let js_fixers = ['eslint', 'prettier']

let g:ale_linters = {
	\ 'javascript': js_fixers,
	\ 'javascriptreact': js_fixers,
	\ 'typescript': js_fixers,
	\ 'typescriptreact': js_fixers,
	\ 'go': ['golint', 'gopls'],
	\ 'dockerfile': ['dockerfile_lint'],
	\ 'yaml': ['yamllint'],
	\ 'css': ['stylelint'],
	\ 'python': ['autopep8']
	\ }

let g:ale_fixers = {
	\ '*': ['remove_trailing_lines', 'trim_whitespace'],
	\ 'javascript': js_fixers,
	\ 'javascriptreact': js_fixers,
	\ 'javascript.jsx': js_fixers,
	\ 'typescript': js_fixers,
	\ 'typescriptreact': js_fixers,
	\ 'go': ['gofmt', 'goimports'],
	\ 'python': ['reorder-python-imports', 'black', 'add_blank_lines_for_python_control_statements'],
	\ 'yaml': ['prettier'],
	\ 'css': ['stylelint']
	\ }

" MAPING :ALEFix
nnoremap <silent> ]f :ALEFix<CR>

" MAPING TO NAVIGATE THROW ERROR AND WARNINGS
nnoremap <silent> [a :ALEPreviousWrap <CR>
nnoremap <silent> ]a :ALENextWrap <CR>
nmap <silent> <C-k> <Plug>ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)


"packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
