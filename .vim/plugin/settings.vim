" Plugin-specific customizations ------------------------------- {{{1
" Airline ------------------------------------------------------ {{{2
function! s:ToggleShowBuffers()
	let l:current = g:airline#extensions#tabline#show_buffers
	let g:airline#extensions#tabline#show_buffers = !l:current
	redraw!
endfunction

function! s:AirlineConfigs()
	" Hide the mode indicator
	set noshowmode
	let g:airline_powerline_fonts = 1
	"let g:airline_extensions = ['tabline', 'whitespace', 'fugitiveline']
	"let g:airline_skip_empty_sections = 1
	let g:airline#extensions#tabline#enabled = 1
	"let g:airline#extensions#tabline#buffer_nr_show = 1
	let g:airline#extensions#tabline#show_buffers = 0
	let g:airline#extensions#tabline#show_tab_nr = 0
	let g:airline#extensions#tabline#show_splits = 1
	let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
	let g:airline#extensions#tabline#show_close_button = 0
	let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
	let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'

	autocmd BufDelete * call airline#extensions#tabline#buflist#invalidate()
	" Hack to refresh font for tabline: make a new tab then close it immediately
	nnoremap <c-x> :call ToggleHighlighting()<cr>:call airline#themes#dark#refresh()<cr>:tabnew<cr>:q<cr>
	" Not sure why, but for some reason '<SID>' is necessary instead of 's:'.
	nnoremap <leader>b :call <SID>ToggleShowBuffers()<cr>
endfunction

silent! call s:AirlineConfigs()
" }}}

" UltiSnips ---------------------------------------------------- {{{2
" Trigger configuration. Do not use <tab> if you use YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<c-b>"   " Default: <c-k>

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" }}}
" }}}
