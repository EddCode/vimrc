" Only run linters named in ale_linters settings.
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=161
highlight ALEWarningSign ctermbg=NONE ctermfg=172

" linter setting
let g:airline#extensions#ale#enabled = 1	                " Set this. Airline will handle the rest.
let g:ale#statusline#Count = 1
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1

let g:ale_linters = {
	\ 'javascript': ['standard', 'eslint'],
	\ 'javascriptreact': ['eslint'],
	\ 'go': ['gopls', 'golint'],
	\ 'dockerfile': ['dockerfile_lint'],
	\ 'yaml': ['yamllint'],
	\ 'css': ['stylelint'],
	\ 'dart': ['dartanalyzer']
	\ }

let ale_fixers = {
	\ 'javascriptreact': ['eslint' ],
	\ 'go': ['gofmt'],
	\ 'yaml': ['prettier'],
	\ 'css': ['prettier']
	\ }

" MAPING :ALEFix
noremap <F6> <Plug>(ale_fix)

" MAPING TO NAVIGATE THROW ERROR AND WARNINGS
nnoremap <silent> [c <Plug>(ale_previous_wrap)
nnoremap <silent> ]c <Plug>(ale_next_wrap)


"packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
