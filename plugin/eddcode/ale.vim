" Only run linters named in ale_linters settings.
let g:ale_sign_error = '😡'
let g:ale_sign_warning = '🥴'
highlight ALEErrorSign ctermbg=NONE ctermfg=161
highlight ALEWarningSign ctermbg=NONE ctermfg=172

" linter setting
let g:airline#extensions#ale#enabled = 1	                " Set this. Airline will handle the rest.
let g:ale#statusline#Count = 1
let g:ale_linters_explicit = 1
"let g:ale_fix_on_save = 0

let g:ale_linters = {
	\ 'javascript': ['eslint'],
	\ 'javascriptreact': ['eslint'],
	\ 'go': ['gofmt'],
	\ 'dockerfile': ['dockerfile_lint'],
	\ 'yaml': ['yamllint'],
	\ 'css': ['stylelint'],
	\ 'dart': ['dartanalyzer']
	\ }

let g:ale_fixers = {
	\ 'javascript': ['prettier', 'eslint'],
	\ 'javascriptreact': ['prettier', 'eslint'],
	\ 'go': ['gofmt', 'goimports', 'remove_trailing_lines', 'trim_whitespace'],
	\ 'python': ['isort', 'yapf', 'add_blank_lines_for_python_control_statements'],
	\ 'yaml': ['prettier'],
	\ 'css': ['prettier']
	\ }

" MAPING :ALEFix
nnoremap <silent> ]f :ALEFix<CR>

" MAPING TO NAVIGATE THROW ERROR AND WARNINGS
nnoremap <silent> [a :ALEPreviousWrap <CR>
nnoremap <silent> ]a :ALENextWrap <CR>

"packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
