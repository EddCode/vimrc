" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1
let g:ale_sing_error = 'X'
let g:ale_sing_warning = '⚠️'
let g:ale_completion_tsserver_autoimport = 1

" highlight colors
highlight ALEError  ctermbg=DarkMagenta

" linter setting
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0					" Doest not run linters on opening files
let g:airline#extensions#ale#enabled = 1	" Set this. Airline will handle the rest.

let b:ale_completion_enabled = 1

let g:ale_fix_on_save = 1
let g:ale_linters = {
	\ 'javascript': ['eslint'],
	\ 'python': ['pylint', 'flake8'],
	\ 'ruby': ['rubocop'],
	\ 'vuejs': ['eslint', 'vls'],
	\ }
let g:ale_fixers = {
	\ 'javascript': ['prettier', 'eslint'],
	\ 'python': ['black'],
	\ 'ruby': ['rubocop'],
	\ 'vuejs': ['prettier'],
	\ }

" MAPING TO NAVIGATE THROW ERROR AND WARNINGS
nmap <silent> <Leader>k <Plug>(ale_previous_wrap)
nmap <silent> <Leader>j <Plug>(ale_next_wrap)
