" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1
let g:ale_sing_error = 'ˣ'
let g:ale_sing_warning = ''
let g:ale_completion_tsserver_autoimport = 1

" linter setting
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0					" Doest not run linters on opening files
let g:airline#extensions#ale#enabled = 1	" Set this. Airline will handle the rest.

let b:ale_completion_enabled = 1

let g:ale_fix_on_save = 1
let g:ale_linters = {
	\ 'javascript': ['eslint'],
	\ 'go': ['gopls', 'golint'],
	\ 'dockerfile': ['dockerfile_lint'],
	\ 'yaml': ['yamllint'],
	\ 'css': ['stylelint']
	\ }
let g:ale_fixers = {
	\ 'javascript': ['prettier', 'eslint'],
	\ 'go': ['gopls'],
	\ 'yaml': ['prettier']
	\ 'css': ['prettier']
	\ }

" MAPING TO NAVIGATE THROW ERROR AND WARNINGS
nmap <silent> <Leader>k <Plug>(ale_previous_wrap)
nmap <silent> <Leader>j <Plug>(ale_next_wrap)


packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
