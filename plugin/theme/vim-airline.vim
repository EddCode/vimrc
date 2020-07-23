let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:webdevicons_enable_airline_statusline = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='base16'

let g:WebDevIconsGetFileTypeSymbol = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

function! AirlineInit()
		let g:airline_section_b = airline#section#create(['branch'])
		let g:airline_section_y = airline#section#create(['%{WebDevIconsGetFileTypeSymbol()} ','filetype'])
		let g:airline_section_z = airline#section#create(['%l:%c', 'utf8'])
endfunction
autocmd User AirlineAfterInit call AirlineInit()
