" Basic settings ----------------------------------------------- {{{1
" Reset options to sane defaults when re-sourcing .vimrc
set nocompatible

filetype indent plugin on

" Enable syntax highlighting
syntax enable

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

set hlsearch
set incsearch

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Display line numbers on the left
set number
" Display relative numbering
set relativenumber

set encoding=utf-8

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

"echo ">^.^<"
" Highlighting ------------------------------------------------- {{{1
set background=dark
colorscheme my_colors_v2
try
	" This is what sets vim to use 24-bit colors.
	set termguicolors
catch
endtry
" Map leaders -------------------------------------------------- {{{1
let mapleader = "-"
let maplocalleader = ","
" Abbreviations ------------------------------------------------ {{{1
iabbrev fun function
iabbrev whathe what the
iabbrev @@ kollch@oregonstate.edu
" Mappings ----------------------------------------------------- {{{1
" Normal mode mappings ----------------------------------------- {{{2
nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <leader>gt :edit 
nnoremap gt :bn<cr>
" Surround word in quotes
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap - <nop>
nnoremap <silent> <leader>w :match Error /\v\s+$/<cr>
nnoremap <silent> <leader>W :match none<cr>
nnoremap / /\v
nnoremap ? ?\v
nnoremap <leader>hl :nohlsearch<cr>
nnoremap <leader>g :silent execute "grep! -r " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>
nnoremap <leader>m :silent make!<cr>:copen<cr>
nnoremap <leader>color :tabnew ~/.vim/colors/my_colors_v2.vim<cr>
nnoremap <leader>cc :source $VIMRUNTIME/colors/tools/check_colors.vim<cr>
" Insert mode mappings ----------------------------------------- {{{2
inoremap <c-u> <esc>lviwUea
inoremap jk <esc>
" Don't use this. For some reason it breaks the arrow keys in insert mode.
"inoremap <esc> <nop>
" File Settings ------------------------------------------------ {{{1
" TeX file settings -------------------------------------------- {{{2
augroup filetype_tex
	autocmd!
	" Turn on spell checker for TeX files
	autocmd FileType tex :setlocal spell spelllang=en_us
augroup END
" Python file settings ----------------------------------------- {{{2
augroup filetype_python
	autocmd!
	" Map a shortcut to commenting out a line in python
	autocmd FileType python :nnoremap <buffer> <localleader>c I#<esc>
	autocmd FileType python :iabbrev <buffer> iff if:<left>
augroup END
" JavaScript file settings ------------------------------------- {{{2
augroup filetype_javascript
	autocmd!
	autocmd FileType javascript :nnoremap <buffer> <localleader>c I//<esc>
augroup END
" PHP file settings -------------------------------------------- {{{2
augroup filetype_php
	autocmd!
	autocmd FileType php :nnoremap <buffer> <localleader>c I//<esc>
augroup END
" asm file settings -------------------------------------------- {{{2
augroup filetype_asm
	autocmd!
	" Set .asm files to default nasm syntax highlighting
	autocmd BufRead,BufNewFile *.asm :set filetype=nasm
augroup END
" Markdown file settings --------------------------------------- {{{2
augroup filetype_markdown
	autocmd!
	" Action on the heading of the current text
	autocmd FileType markdown :onoremap ih :<c-u>execute "normal! ?^==\\+$\r:nohl\rkvg_"<cr>
augroup END
" Vimscript file settings -------------------------------------- {{{2
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
" Action on text within current parentheses -------------------- {{{1
onoremap p i(
" Action on text within current indent ------------------------- {{{1
"onoremap b :execute "normal! V" | let curr_indent=indent(line(".")) | while indent(line(".")+1) >= curr_indent | execute "normal! j" | endwhile
" Read omap-info for information on <c-u>
onoremap b :<c-u>normal! V/{<cr>%<cr>
function! SelectIndent()
	execute "normal! V"
	let curr_indent=indent(line("."))
	while indent(line(".")+1) > curr_indent
		execute "normal! j"
	endwhile
endfunction
" Statusline settings ------------------------------------------ {{{1
" Show partial commands in the last line of the screen
set showcmd

set shortmess=at

" Always display the status line, even if only one window is displayed
set laststatus=2

set ttimeoutlen=10

"set statusline=%f      " Path to the file
"set statusline+=%=     " Switch to the right side
"set statusline+=%p     " Line percentage
"set statusline+=\ \ %l " Current line
"set statusline+=/      " Separator
"set statusline+=%L     " Total lines

" Hide the mode indicator in the command area if it's already displayed on the
" status line
if &laststatus == 2
	set noshowmode
endif

" Airline-specific customizations ------------------------------ {{{2
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#enabled = 1
" Default example settings ------------------------------------- {{{1
" Set folding to be based on indents
"set foldmethod=indent
" Enable toggle folding with the spacebar
"nnoremap <space> za

"____________________________________________________________
" Must have options {{{2
"
" These are highly recommended options.

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
"set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
"set wildmenu

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline

"____________________________________________________________
" Usability options {{{2
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Allow backspacing over autoindent, line breaks and start of insert action
"set backspace=indent,eol,start

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
"set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
"set ruler

" Enable use of the mouse for all modes
"set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
"set cmdheight=2

" Quickly time out on keycodes, but never time out on mappings
"set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
"set pastetoggle=<F11>


"____________________________________________________________
" Indentation options {{{2
"
" Indentation settings according to personal preference.

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
"set shiftwidth=4
"set softtabstop=4
"set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" eight characters wide.
"set shiftwidth=8
"set softtabstop=8
"set tabstop=8

"autocmd FileType * set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
"autocmd FileType python set tabstop=4 softtabstop=4 shiftwidth=4 expandtab textwidth=79 fileformat=unix
"autocmd FileType php set tabstop=4 softtabstop=4 shiftwidth=4 expandtab textwidth=79 fileformat=unix
"autocmd FileType javascript set tabstop=2 softtabstop=2 shiftwidth=2 expandtab textwidth=79 fileformat=unix
"autocmd FileType html set tabstop=2 softtabstop=2 shiftwidth=2 expandtab textwidth=79 fileformat=unix

"____________________________________________________________
" Mappings {{{2
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
"map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
"nnoremap <C-L> :nohl<CR><C-L>


"____________________________________________________________
" The "" is a single character. You enter it by pressing Ctrl+v and then ESC.
"set t_8f=[38;2;%lu;%lu;%lum
"set t_8b=[48;2;%lu;%lu;%lum

"set t_Co=256
"let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : 'italic', 'sp' : '' }

" Change the color scheme here.
"colorscheme gruvbox
"let g:gruvbox_contrast_dark='hard'
"colorscheme flattened_dark
"colorscheme satori_modified
"colorscheme partial_scheme
"colorscheme my_colors
"colorscheme acme

" Sets wrapping to be a soft wrap (doesn't make a new line)
"set wrap linebreak nolist
"set tw=90
"set formatoptions+=t

"nmap <C-S-P> :call <SID>SynStack()<CR>
"function! <SID>SynStack()
"	if !exists("*synstack")
"		return
"	endif
"	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
"endfunc

"call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
"Plug 'lervag/vimtex'

"call plug#end()
