" Usage "{{{
"
" ---------------------------------------------------------------------
" INSTALLATION:
" ---------------------------------------------------------------------
" move the my_colors_v2.vim to your VIMRUNTIME by manual or plugin manager
"
" MODIFY VIMRC:
"
" After either Option 1 or Option 2 above, put the following two lines in your
" .vimrc:
"
"     syntax enable
"     set background=dark
"     colorscheme MyColorsV2
"
" or, for the light background mode:
"
"     syntax enable
"     set background=light
"     colorscheme MyColorsV2
"
" I like to have a different background in GUI and terminal modes, so I can use
" the following if-then. However, I find vim's background autodetection to be
" pretty good and, at least with MacVim, I can leave this background value
" assignment out entirely and get the same results.
"
"     if has('gui_running')
"       set background=light
"     else
"       set background=dark
"     endif
"
" ---------------------------------------------------------------------
" COLOR VALUES
" ---------------------------------------------------------------------
"
" L\*a\*b values are canonical (White D65, Reference D50), other values are
" matched in sRGB space.
"
" SOLARIZED HEX     16/8 TERMCOL  XTERM/HEX   L*A*B      sRGB        HSB
" --------- ------- ---- -------  ----------- ---------- ----------- -----------
" grey      #002b36  8/4 brblack  234 #1c1c1c 15 -12 -12   0  43  54 193 100  21
" black     #073642  0/4 black    235 #262626 20 -12 -12   7  54  66 192  90  26
" lgreen    #586e75 10/7 brgreen  240 #4e4e4e 45 -07 -07  88 110 117 194  25  46
" yellow    #657b83 11/7 brorange 241 #585858 50 -07 -07 101 123 131 195  23  51
" navy      #839496 12/6 brblue   244 #808080 60 -06 -03 131 148 150 186  13  59
" violet    #93a1a1 14/4 brcyan   245 #8a8a8a 65 -05 -02 147 161 161 180   9  63
" brown     #eee8d5  7/7 white    254 #d7d7af 92 -00  10 238 232 213  44  11  93
" white     #fdf6e3 15/7 brwhite  230 #ffffd7 97  00  10 253 246 227  44  10  99
" orange    #b58900  3/3 orange   136 #af8700 60  10  65 181 137   0  45 100  71
" lred      #cb4b16  9/3 brred    166 #d75f00 50  50  55 203  75  22  18  89  80
" red       #dc322f  1/1 red      160 #d70000 50  65  45 220  50  47   1  79  86
" magenta   #d33682  5/5 magenta  125 #af005f 50  65 -05 211  54 130 331  74  83
" pink      #6c71c4 13/5 brmagenta 61 #5f5faf 50  15 -45 108 113 196 237  45  77
" blue      #268bd2  4/4 blue      33 #0087ff 55 -10 -45  38 139 210 205  82  82
" cyan      #2aa198  6/6 cyan      37 #00afaf 60 -35 -05  42 161 152 175  74  63
" green     #859900  2/2 green     64 #5f8700 60 -20  65 133 153   0  68 100  60
"
" ---------------------------------------------------------------------
" COLORSCHEME HACKING
" ---------------------------------------------------------------------
"
" Useful commands for testing colorschemes:
" :source $VIMRUNTIME/syntax/hitest.vim
" :help highlight-groups
" :help cterm-colors
" :help group-name
"
" Useful links for developing colorschemes:
" http://www.vim.org/scripts/script.php?script_id=2937
" http://vimcasts.org/episodes/creating-colorschemes-for-vim/
"
" }}}

" Colorscheme initialization "{{{
" ---------------------------------------------------------------------
highlight clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "my_colors_v2"

"}}}

" GUI & CSApprox hexadecimal palettes"{{{
" ---------------------------------------------------------------------
"
" Set gui and terminal at the same time.
let s:gui_mode    = "gui"
let s:gui_black   = "#000000"
let s:gui_red     = "#330000"
let s:gui_green   = "#19da40"
let s:gui_orange  = "#ff7700"
let s:gui_blue    = "#1e90ff"
let s:gui_magenta = "#ff00ff"
let s:gui_cyan    = "#6495ed"
let s:gui_brown   = "#cdaa7d"
let s:gui_grey    = "#7f7f7f"
let s:gui_lred    = "#ff3232"
let s:gui_lgreen  = "#a3f0b2"
let s:gui_yellow  = "#e6de4a"
let s:gui_navy    = "#061c33"
let s:gui_pink    = "#d9a5f9"
let s:gui_violet  = "#5a4fe6"
let s:gui_white   = "#e5e5e5"

let s:term_mode    = "cterm"
let s:term_black   = "0"
let s:term_red     = "1"
let s:term_green   = "2"
let s:term_orange  = "3"
let s:term_blue    = "4"
let s:term_magenta = "5"
let s:term_cyan    = "6"
let s:term_brown   = "7"
let s:term_grey    = "8"
let s:term_lred    = "9"
let s:term_lgreen  = "10"
let s:term_yellow  = "11"
let s:term_navy    = "12"
let s:term_pink    = "13"
let s:term_violet  = "14"
let s:term_white   = "15"
"}}}

" Formatting options and null values for passthrough effect "{{{
" ---------------------------------------------------------------------
let s:gui_none  = "NONE"
let s:term_none = "NONE"
let s:n         = "NONE"
let s:c         = ",undercurl"
let s:r         = ",reverse"
let s:s         = ",standout"
let s:ou        = ""
let s:ob        = ""
"}}}

" Background value "{{{
" ---------------------------------------------------------------------
let s:gui_back  = s:gui_black
let s:term_back = s:term_black
"}}}

" Alternate light scheme "{{{
" ---------------------------------------------------------------------
if &background == "light"
    " GUI
    let s:gui_temp03 = s:gui_grey
    let s:gui_temp02 = s:gui_black
    let s:gui_temp01 = s:gui_lgreen
    let s:gui_temp00 = s:gui_yellow
    let s:gui_grey   = s:gui_white
    let s:gui_black  = s:gui_brown
    let s:gui_lgreen = s:gui_violet
    let s:gui_yellow = s:gui_navy
    let s:gui_navy   = s:gui_temp00
    let s:gui_violet = s:gui_temp01
    let s:gui_brown  = s:gui_temp02
    let s:gui_white  = s:gui_temp03
    if (s:gui_back != "NONE")
        let s:gui_back = s:gui_grey
    endif

    " terminal
    let s:term_temp03 =   s:term_grey
    let s:term_temp02 =   s:term_black
    let s:term_temp01 =   s:term_lgreen
    let s:term_temp00 =   s:term_yellow
    let s:term_grey   =   s:term_white
    let s:term_black  =   s:term_brown
    let s:term_lgreen =   s:term_violet
    let s:term_yellow =   s:term_navy
    let s:term_navy   =   s:term_temp00
    let s:term_violet =   s:term_temp01
    let s:term_brown  =   s:term_temp02
    let s:term_white  =   s:term_temp03
    if (s:term_back != "NONE")
        let s:term_back = s:term_black
    endif
endif
"}}}

" Overrides dependent on user specified values and environment "{{{
" ---------------------------------------------------------------------
if (&t_Co == 8)
    let s:b  = ""
    let s:bb = ",bold"
else
    let s:b  = ",bold"
    let s:bb = ""
endif

let s:u  = ",underline"
if (&t_Co > 256)
    let s:i  = ",italic"
else
    let s:i  = ""
endif
"}}}

" Highlighting primitives"{{{
" ---------------------------------------------------------------------

execute "let s:bg_none    = ' " . "guibg=".s:gui_none    . " ctermbg=".s:term_none    . "'"
execute "let s:bg_back    = ' " . "guibg=".s:gui_back    . " ctermbg=".s:term_back    . "'"
execute "let s:bg_grey    = ' " . "guibg=".s:gui_grey    . " ctermbg=".s:term_grey    . "'"
execute "let s:bg_black   = ' " . "guibg=".s:gui_black   . " ctermbg=".s:term_black   . "'"
execute "let s:bg_lgreen  = ' " . "guibg=".s:gui_lgreen  . " ctermbg=".s:term_lgreen  . "'"
execute "let s:bg_yellow  = ' " . "guibg=".s:gui_yellow  . " ctermbg=".s:term_yellow  . "'"
execute "let s:bg_navy    = ' " . "guibg=".s:gui_navy    . " ctermbg=".s:term_navy    . "'"
execute "let s:bg_violet  = ' " . "guibg=".s:gui_violet  . " ctermbg=".s:term_violet  . "'"
execute "let s:bg_brown   = ' " . "guibg=".s:gui_brown   . " ctermbg=".s:term_brown   . "'"
execute "let s:bg_white   = ' " . "guibg=".s:gui_white   . " ctermbg=".s:term_white   . "'"
execute "let s:bg_green   = ' " . "guibg=".s:gui_green   . " ctermbg=".s:term_green   . "'"
execute "let s:bg_orange  = ' " . "guibg=".s:gui_orange  . " ctermbg=".s:term_orange  . "'"
execute "let s:bg_lred    = ' " . "guibg=".s:gui_lred    . " ctermbg=".s:term_lred    . "'"
execute "let s:bg_red     = ' " . "guibg=".s:gui_red     . " ctermbg=".s:term_red     . "'"
execute "let s:bg_magenta = ' " . "guibg=".s:gui_magenta . " ctermbg=".s:term_magenta . "'"
execute "let s:bg_pink    = ' " . "guibg=".s:gui_pink    . " ctermbg=".s:term_pink    . "'"
execute "let s:bg_blue    = ' " . "guibg=".s:gui_blue    . " ctermbg=".s:term_blue    . "'"
execute "let s:bg_cyan    = ' " . "guibg=".s:gui_cyan    . " ctermbg=".s:term_cyan    . "'"

execute "let s:fg_none    = ' " . "guifg=".s:gui_none    . " ctermfg=".s:term_none    . "'"
execute "let s:fg_back    = ' " . "guifg=".s:gui_back    . " ctermfg=".s:term_back    . "'"
execute "let s:fg_grey    = ' " . "guifg=".s:gui_grey    . " ctermfg=".s:term_grey    . "'"
execute "let s:fg_black   = ' " . "guifg=".s:gui_black   . " ctermfg=".s:term_black   . "'"
execute "let s:fg_lgreen  = ' " . "guifg=".s:gui_lgreen  . " ctermfg=".s:term_lgreen  . "'"
execute "let s:fg_yellow  = ' " . "guifg=".s:gui_yellow  . " ctermfg=".s:term_yellow  . "'"
execute "let s:fg_navy    = ' " . "guifg=".s:gui_navy    . " ctermfg=".s:term_navy    . "'"
execute "let s:fg_violet  = ' " . "guifg=".s:gui_violet  . " ctermfg=".s:term_violet  . "'"
execute "let s:fg_brown   = ' " . "guifg=".s:gui_brown   . " ctermfg=".s:term_brown   . "'"
execute "let s:fg_white   = ' " . "guifg=".s:gui_white   . " ctermfg=".s:term_white   . "'"
execute "let s:fg_green   = ' " . "guifg=".s:gui_green   . " ctermfg=".s:term_green   . "'"
execute "let s:fg_orange  = ' " . "guifg=".s:gui_orange  . " ctermfg=".s:term_orange  . "'"
execute "let s:fg_lred    = ' " . "guifg=".s:gui_lred    . " ctermfg=".s:term_lred    . "'"
execute "let s:fg_red     = ' " . "guifg=".s:gui_red     . " ctermfg=".s:term_red     . "'"
execute "let s:fg_magenta = ' " . "guifg=".s:gui_magenta . " ctermfg=".s:term_magenta . "'"
execute "let s:fg_pink    = ' " . "guifg=".s:gui_pink    . " ctermfg=".s:term_pink    . "'"
execute "let s:fg_blue    = ' " . "guifg=".s:gui_blue    . " ctermfg=".s:term_blue    . "'"
execute "let s:fg_cyan    = ' " . "guifg=".s:gui_cyan    . " ctermfg=".s:term_cyan    . "'"

execute "let s:fmt_none   = ' " . "gui=NONE"         . " cterm=NONE"         . "'"
execute "let s:fmt_bold   = ' " . "gui=NONE".s:b     . " cterm=NONE".s:b     . "'"
execute "let s:fmt_bldi   = ' " . "gui=NONE".s:b     . " cterm=NONE".s:b     . "'"
execute "let s:fmt_undr   = ' " . "gui=NONE".s:u     . " cterm=NONE".s:u     . "'"
execute "let s:fmt_undb   = ' " . "gui=NONE".s:u.s:b . " cterm=NONE".s:u.s:b . "'"
execute "let s:fmt_undi   = ' " . "gui=NONE".s:u     . " cterm=NONE".s:u     . "'"
execute "let s:fmt_uopt   = ' " . "gui=NONE".s:ou    . " cterm=NONE".s:ou    . "'"
execute "let s:fmt_curl   = ' " . "gui=NONE".s:c     . " cterm=NONE".s:c     . "'"
execute "let s:fmt_ital   = ' " . "gui=NONE".s:i     . " cterm=NONE".s:i     . "'"
execute "let s:fmt_stnd   = ' " . "gui=NONE".s:s     . " cterm=NONE".s:s     . "'"
execute "let s:fmt_revr   = ' " . "gui=NONE".s:r     . " cterm=NONE".s:r     . "'"
execute "let s:fmt_revb   = ' " . "gui=NONE".s:r.s:b . " cterm=NONE".s:r.s:b . "'"
" revbb (reverse bold for bright colors) is only set to actual bold in low
" color terminals (t_co=8, such as OS X Terminal.app) and should only be used
" with colors 8-15.
execute "let s:fmt_revbb  = ' " . "gui=NONE".s:r.s:bb     . " cterm=NONE".s:r.s:bb     . "'"
execute "let s:fmt_revbbu = ' " . "gui=NONE".s:r.s:bb.s:u . " cterm=NONE".s:r.s:bb.s:u . "'"

if has("gui_running") || has("termguicolors") && &termguicolors
    execute "let s:sp_none    = ' guisp=" . s:gui_none    .   "'"
    execute "let s:sp_back    = ' guisp=" . s:gui_back    .   "'"
    execute "let s:sp_grey    = ' guisp=" . s:gui_grey    .   "'"
    execute "let s:sp_black   = ' guisp=" . s:gui_black   .   "'"
    execute "let s:sp_lgreen  = ' guisp=" . s:gui_lgreen  .   "'"
    execute "let s:sp_yellow  = ' guisp=" . s:gui_yellow  .   "'"
    execute "let s:sp_navy    = ' guisp=" . s:gui_navy    .   "'"
    execute "let s:sp_violet  = ' guisp=" . s:gui_violet  .   "'"
    execute "let s:sp_brown   = ' guisp=" . s:gui_brown   .   "'"
    execute "let s:sp_white   = ' guisp=" . s:gui_white   .   "'"
    execute "let s:sp_green   = ' guisp=" . s:gui_green   .   "'"
    execute "let s:sp_orange  = ' guisp=" . s:gui_orange  .   "'"
    execute "let s:sp_lred    = ' guisp=" . s:gui_lred    .   "'"
    execute "let s:sp_red     = ' guisp=" . s:gui_red     .   "'"
    execute "let s:sp_magenta = ' guisp=" . s:gui_magenta .   "'"
    execute "let s:sp_pink    = ' guisp=" . s:gui_pink    .   "'"
    execute "let s:sp_blue    = ' guisp=" . s:gui_blue    .   "'"
    execute "let s:sp_cyan    = ' guisp=" . s:gui_cyan    .   "'"
else
    let s:sp_none    = ""
    let s:sp_back    = ""
    let s:sp_grey    = ""
    let s:sp_black   = ""
    let s:sp_lgreen  = ""
    let s:sp_yellow  = ""
    let s:sp_navy    = ""
    let s:sp_violet  = ""
    let s:sp_brown   = ""
    let s:sp_white   = ""
    let s:sp_green   = ""
    let s:sp_orange  = ""
    let s:sp_lred    = ""
    let s:sp_red     = ""
    let s:sp_magenta = ""
    let s:sp_pink    = ""
    let s:sp_blue    = ""
    let s:sp_cyan    = ""
endif

"}}}

" Basic highlighting"{{{
" ---------------------------------------------------------------------
" note that link syntax to avoid duplicate configuration doesn't work with the
" execute compiled formats

execute "highlight! Normal"         .s:fmt_none   .s:fg_white   .s:bg_back

execute "highlight! Comment"        .s:fmt_ital   .s:fg_grey    .s:bg_none
"                  *Comment         any comment

execute "highlight! Constant"       .s:fmt_none   .s:fg_magenta .s:bg_none
"                  *Constant        any constant
"                   Number          a number constant: 234, 0xff
"                   Boolean         a boolean constant: TRUE, false
"                   Float           a floating point constant: 2.3e10

execute "highlight! String"         .s:fmt_none   .s:fg_yellow  .s:bg_none
"                   String          a string constant: "this is a string"

highlight! link Character String
"                   Character       a character constant: 'c', '\n'

execute "highlight! Identifier"     .s:fmt_none   .s:fg_white   .s:bg_none
"                  *Identifier      any variable name

execute "highlight! Function"       .s:fmt_none   .s:fg_pink    .s:bg_none
"                   Function        function name (also: methods for classes)

execute "highlight! Conditional"    .s:fmt_none   .s:fg_blue    .s:bg_navy
"                   Conditional     if, then, else, endif, switch, etc.

highlight! link Label Conditional
"                   Label           case, default, etc.

highlight! link Exception Conditional
"                   Exception       try, catch, throw

execute "highlight! Statement"      .s:fmt_none   .s:fg_lred    .s:bg_none
"                  *Statement       any statement
"                   Keyword         any other keyword

execute "highlight! Repeat"         .s:fmt_none   .s:fg_orange  .s:bg_none
"                   Repeat          for, do, while, etc.

execute "highlight! Operator"       .s:fmt_none   .s:fg_brown   .s:bg_none
"                   Operator        "sizeof", "+", "*", etc.

execute "highlight! PreProc"        .s:fmt_none   .s:fg_violet  .s:bg_none
"                  *PreProc         generic Preprocessor
"                   Include         preprocessor #include
"                   PreCondit       preprocessor #if, #else, #endif, etc.

execute "highlight! Define"         .s:fmt_none   .s:fg_magenta .s:bg_none
"                   Define          preprocessor #define

highlight! link Macro Define
"                   Macro           same as Define

execute "highlight! Type"           .s:fmt_none   .s:fg_green   .s:bg_none
"                  *Type            int, long, char, etc.
"                   StorageClass    static, register, volatile, etc.
"                   Structure       struct, union, enum, etc.
"                   Typedef         A typedef

execute "highlight! Special"        .s:fmt_none   .s:fg_brown   .s:bg_none
"                  *Special         any special symbol
"                   SpecialChar     special character in a constant
"                   Tag             you can use CTRL-] on this
"                   SpecialComment  special things inside a comment
"                   Debug           debugging statements

execute "highlight! Underlined"     .s:fmt_none   .s:fg_pink    .s:bg_none
"                  *Underlined      text that stands out, HTML links

execute "highlight! Ignore"         .s:fmt_none   .s:fg_none    .s:bg_none
"                  *Ignore          left blank, hidden  |hl-Ignore|

highlight! link Delimiter Ignore
"                   Delimiter       character that needs attention

execute "highlight! Error"          .s:fmt_bold   .s:fg_lred    .s:bg_red
"                  *Error           any erroneous construct

execute "highlight! Todo"           .s:fmt_bold   .s:fg_lred    .s:bg_red
"                  *Todo            anything that needs extra attention; mostly the
"                                   keywords TODO FIXME and XXX
"
"}}}

" Extended highlighting "{{{
" ---------------------------------------------------------------------
execute "highlight! SpecialKey"     .s:fmt_bold  .s:fg_yellow .s:bg_black
execute "highlight! NonText"        .s:fmt_bold  .s:fg_yellow .s:bg_none
execute "highlight! StatusLine"     .s:fmt_none  .s:fg_white  .s:bg_black .s:fmt_revbb
execute "highlight! StatusLineNC"   .s:fmt_none  .s:fg_grey   .s:bg_black .s:fmt_revbb
execute "highlight! Visual"         .s:fmt_none  .s:fg_grey   .s:bg_black .s:fmt_revbb
execute "highlight! Directory"      .s:fmt_none  .s:fg_blue   .s:bg_none
execute "highlight! ErrorMsg"       .s:fmt_revr  .s:fg_red    .s:bg_lred
execute "highlight! IncSearch"      .s:fmt_stnd  .s:fg_white  .s:bg_black
execute "highlight! Search"         .s:fmt_revr  .s:fg_yellow .s:bg_black
execute "highlight! MoreMsg"        .s:fmt_none  .s:fg_blue   .s:bg_none
execute "highlight! ModeMsg"        .s:fmt_none  .s:fg_white  .s:bg_none
execute "highlight! LineNr"         .s:fmt_none  .s:fg_orange .s:bg_black
execute "highlight! Question"       .s:fmt_bold  .s:fg_cyan   .s:bg_none
execute "highlight! VertSplit"      .s:fmt_none  .s:fg_white  .s:bg_white
execute "highlight! Title"          .s:fmt_bold  .s:fg_white  .s:bg_none
execute "highlight! VisualNOS"      .s:fmt_stnd  .s:fg_none   .s:bg_black .s:fmt_revbb
execute "highlight! WarningMsg"     .s:fmt_bold  .s:fg_lred   .s:bg_none
execute "highlight! WildMenu"       .s:fmt_none  .s:fg_brown  .s:bg_black .s:fmt_revbb
execute "highlight! Folded"         .s:fmt_none  .s:fg_black  .s:bg_grey  .s:sp_grey
execute "highlight! FoldColumn"     .s:fmt_none  .s:fg_black  .s:bg_grey

execute "highlight! DiffAdd"        .s:fmt_bold  .s:fg_green  .s:bg_black .s:sp_green
execute "highlight! DiffChange"     .s:fmt_bold  .s:fg_orange .s:bg_black .s:sp_orange
execute "highlight! DiffDelete"     .s:fmt_bold  .s:fg_red    .s:bg_black
execute "highlight! DiffText"       .s:fmt_bold  .s:fg_blue   .s:bg_black .s:sp_blue

execute "highlight! SignColumn"     .s:fmt_none  .s:fg_navy   .s:bg_none
execute "highlight! Conceal"        .s:fmt_none  .s:fg_blue   .s:bg_none
execute "highlight! SpellBad"       .s:fmt_curl  .s:fg_none   .s:bg_none  .s:sp_red
execute "highlight! SpellCap"       .s:fmt_curl  .s:fg_none   .s:bg_none  .s:sp_pink
execute "highlight! SpellRare"      .s:fmt_curl  .s:fg_none   .s:bg_none  .s:sp_cyan
execute "highlight! SpellLocal"     .s:fmt_curl  .s:fg_none   .s:bg_none  .s:sp_orange
execute "highlight! Pmenu"          .s:fmt_none  .s:fg_navy   .s:bg_black .s:fmt_revbb
execute "highlight! PmenuSel"       .s:fmt_none  .s:fg_lgreen .s:bg_brown .s:fmt_revbb
execute "highlight! PmenuSbar"      .s:fmt_none  .s:fg_brown  .s:bg_navy  .s:fmt_revbb
execute "highlight! PmenuThumb"     .s:fmt_none  .s:fg_navy   .s:bg_grey  .s:fmt_revbb
execute "highlight! TabLine"        .s:fmt_none  .s:fg_grey   .s:bg_none  .s:sp_grey
execute "highlight! TabLineFill"    .s:fmt_none  .s:fg_grey   .s:bg_none  .s:sp_grey
execute "highlight! TabLineSel"     .s:fmt_none  .s:fg_grey   .s:bg_none  .s:sp_grey   .s:fmt_revr
execute "highlight! CursorColumn"   .s:fmt_none  .s:fg_none   .s:bg_none
execute "highlight! CursorLine"     .s:fmt_uopt  .s:fg_none   .s:bg_none  .s:sp_violet
execute "highlight! CursorLineNr"   .s:fmt_uopt  .s:fg_none   .s:bg_none  .s:sp_violet
execute "highlight! ColorColumn"    .s:fmt_none  .s:fg_none   .s:bg_none
execute "highlight! Cursor"         .s:fmt_none  .s:fg_grey   .s:bg_navy
highlight! link lCursor Cursor
execute "highlight! MatchParen"     .s:fmt_bold  .s:fg_brown  .s:bg_grey
"}}}

" c highlighting "{{{
" ---------------------------------------------------------------------
execute "highlight! cStructName" .s:fmt_none .s:fg_lgreen .s:bg_none
execute "highlight! cPointer"    .s:fmt_none .s:fg_cyan   .s:bg_none
highlight! link cAddress cPointer
highlight! link cBrackets cPointer
execute "highlight! cNotOprtr"   .s:fmt_none .s:fg_lred   .s:bg_none
"}}}

" vim syntax highlighting "{{{
" ---------------------------------------------------------------------
"execute "highlight! vimLineComment" . s:fg_lgreen .s:bg_none   .s:fmt_ital
"highlight! link vimComment Comment
"highlight! link vimLineComment Comment
highlight! link vimVar Identifier
highlight! link vimFunc Function
highlight! link vimUserFunc Function
highlight! link helpSpecial Special
highlight! link vimSet Normal
highlight! link vimSetEqual Normal
execute "highlight! vimCommentString"   .s:fmt_none .s:fg_pink    .s:bg_none
execute "highlight! vimCommand"         .s:fmt_none .s:fg_orange  .s:bg_none
execute "highlight! vimCmdSep"          .s:fmt_bold .s:fg_blue    .s:bg_none
execute "highlight! helpExample"        .s:fmt_none .s:fg_violet  .s:bg_none
execute "highlight! helpOption"         .s:fmt_none .s:fg_cyan    .s:bg_none
execute "highlight! helpNote"           .s:fmt_none .s:fg_magenta .s:bg_none
execute "highlight! helpVim"            .s:fmt_none .s:fg_magenta .s:bg_none
execute "highlight! helpHyperTextJump"  .s:fmt_undr .s:fg_blue    .s:bg_none
execute "highlight! helpHyperTextEntry" .s:fmt_none .s:fg_green   .s:bg_none
execute "highlight! vimIsCommand"       .s:fmt_none .s:fg_yellow  .s:bg_none
execute "highlight! vimSynMtchOpt"      .s:fmt_none .s:fg_orange  .s:bg_none
execute "highlight! vimSynType"         .s:fmt_none .s:fg_cyan    .s:bg_none
execute "highlight! vimHiLink"          .s:fmt_none .s:fg_blue    .s:bg_none
execute "highlight! vimHiGroup"         .s:fmt_none .s:fg_blue    .s:bg_none
execute "highlight! vimGroup"           .s:fmt_undb .s:fg_blue    .s:bg_none
"}}}

" diff highlighting "{{{
" ---------------------------------------------------------------------
highlight! link diffAdded Statement
highlight! link diffLine Identifier
"}}}

" git & gitcommit highlighting "{{{
"git
"execute "highlight! gitDateHeader"
"execute "highlight! gitIdentityHeader"
"execute "highlight! gitIdentityKeyword"
"execute "highlight! gitNotesHeader"
"execute "highlight! gitReflogHeader"
"execute "highlight! gitKeyword"
"execute "highlight! gitIdentity"
"execute "highlight! gitEmailDelimiter"
"execute "highlight! gitEmail"
"execute "highlight! gitDate"
"execute "highlight! gitMode"
"execute "highlight! gitHashAbbrev"
"execute "highlight! gitHash"
"execute "highlight! gitReflogMiddle"
"execute "highlight! gitReference"
"execute "highlight! gitStage"
"execute "highlight! gitType"
"execute "highlight! gitDiffAdded"
"execute "highlight! gitDiffRemoved"
"gitcommit
"execute "highlight! gitcommitSummary"
execute "highlight! gitcommitComment"       .s:fmt_ital .s:fg_lgreen  .s:bg_none
highlight! link gitcommitUntracked gitcommitComment
highlight! link gitcommitDiscarded gitcommitComment
highlight! link gitcommitSelected  gitcommitComment
execute "highlight! gitcommitUnmerged"      .s:fmt_bold .s:fg_green   .s:bg_none
execute "highlight! gitcommitOnBranch"      .s:fmt_bold .s:fg_lgreen  .s:bg_none
execute "highlight! gitcommitBranch"        .s:fmt_bold .s:fg_magenta .s:bg_none
highlight! link gitcommitNoBranch gitcommitBranch
execute "highlight! gitcommitDiscardedType" .s:fmt_none .s:fg_red     .s:bg_none
execute "highlight! gitcommitSelectedType"  .s:fmt_none .s:fg_green   .s:bg_none
"execute "highlight! gitcommitUnmergedType"
"execute "highlight! gitcommitType"
"execute "highlight! gitcommitNoChanges"
"execute "highlight! gitcommitHeader"
execute "highlight! gitcommitHeader"        .s:fmt_none .s:fg_lgreen  .s:bg_none
execute "highlight! gitcommitUntrackedFile" .s:fmt_bold .s:fg_cyan    .s:bg_none
execute "highlight! gitcommitDiscardedFile" .s:fmt_bold .s:fg_red     .s:bg_none
execute "highlight! gitcommitSelectedFile"  .s:fmt_bold .s:fg_green   .s:bg_none
execute "highlight! gitcommitUnmergedFile"  .s:fmt_bold .s:fg_orange  .s:bg_none
execute "highlight! gitcommitFile"          .s:fmt_bold .s:fg_navy    .s:bg_none
highlight! link gitcommitDiscardedArrow gitcommitDiscardedFile
highlight! link gitcommitSelectedArrow  gitcommitSelectedFile
highlight! link gitcommitUnmergedArrow  gitcommitUnmergedFile
"execute "highlight! gitcommitArrow"
"execute "highlight! gitcommitOverflow"
"execute "highlight! gitcommitBlank"
" }}}
"
" html highlighting "{{{
" ---------------------------------------------------------------------
execute "highlight! htmlTag"            .s:fmt_none .s:fg_lgreen .s:bg_none
execute "highlight! htmlEndTag"         .s:fmt_none .s:fg_lgreen .s:bg_none
execute "highlight! htmlTagN"           .s:fmt_bold .s:fg_violet .s:bg_none
execute "highlight! htmlTagName"        .s:fmt_none .s:fg_blue   .s:bg_none
execute "highlight! htmlSpecialTagName" .s:fmt_ital .s:fg_blue   .s:bg_none
execute "highlight! htmlArg"            .s:fmt_none .s:fg_green  .s:bg_none
execute "highlight! javaScript"         .s:fmt_none .s:fg_orange .s:bg_none
"}}}

" perl highlighting "{{{
" ---------------------------------------------------------------------
execute "highlight! perlHereDoc"           .s:fg_violet .s:bg_back .s:fmt_none
execute "highlight! perlVarPlain"          .s:fg_orange .s:bg_back .s:fmt_none
execute "highlight! perlStatementFileDesc" .s:fg_cyan   .s:bg_back .s:fmt_none
"}}}

" tex highlighting "{{{
" ---------------------------------------------------------------------
execute "highlight! texStatement"   .s:fg_cyan   .s:bg_back .s:fmt_none
execute "highlight! texMathZoneX"   .s:fg_orange .s:bg_back .s:fmt_none
execute "highlight! texMathMatcher" .s:fg_orange .s:bg_back .s:fmt_none
execute "highlight! texMathMatcher" .s:fg_orange .s:bg_back .s:fmt_none
execute "highlight! texRefLabel"    .s:fg_orange .s:bg_back .s:fmt_none
"}}}

" ruby highlighting "{{{
" ---------------------------------------------------------------------
execute "highlight! rubyDefine" .s:fg_violet .s:bg_back .s:fmt_bold
"rubyInclude
"rubySharpBang
"rubyAccess
"rubyPredefinedVariable
"rubyBoolean
"rubyClassVariable
"rubyBeginEnd
"rubyRepeatModifier
"highlight! link rubyArrayDelimiter    Special  " [ , , ]
"rubyCurlyBlock  { , , }

"highlight! link rubyClass             Keyword
"highlight! link rubyModule            Keyword
"highlight! link rubyKeyword           Keyword
"highlight! link rubyOperator          Operator
"highlight! link rubyIdentifier        Identifier
"highlight! link rubyInstanceVariable  Identifier
"highlight! link rubyGlobalVariable    Identifier
"highlight! link rubyClassVariable     Identifier
"highlight! link rubyConstant          Type
"}}}

" haskell syntax highlighting"{{{
" ---------------------------------------------------------------------
" For use with syntax/haskell.vim: Haskell Syntax File
" http://www.vim.org/scripts/script.php?script_id=3034
" See also Steffen Siering's github repository:
" http://github.com/urso/dotrc/blob/master/vim/syntax/haskell.vim
" ---------------------------------------------------------------------
"
" Treat True and False specially, see the plugin referenced above
let hs_highlight_boolean = 1
" highlight delims, see the plugin referenced above
let hs_highlight_delimiters = 1

execute "highlight! cPreCondit"         .s:fg_lred    .s:bg_none .s:fmt_none

execute "highlight! VarId"              .s:fg_blue    .s:bg_none .s:fmt_none
execute "highlight! ConId"              .s:fg_orange  .s:bg_none .s:fmt_none
execute "highlight! hsImport"           .s:fg_magenta .s:bg_none .s:fmt_none
execute "highlight! hsString"           .s:fg_yellow  .s:bg_none .s:fmt_none

execute "highlight! hsStructure"        .s:fg_cyan    .s:bg_none .s:fmt_none
execute "highlight! hs_hlFunctionName"  .s:fg_blue    .s:bg_none
execute "highlight! hsStatement"        .s:fg_cyan    .s:bg_none .s:fmt_none
execute "highlight! hsImportLabel"      .s:fg_cyan    .s:bg_none .s:fmt_none
execute "highlight! hs_OpFunctionName"  .s:fg_orange  .s:bg_none .s:fmt_none
execute "highlight! hs_DeclareFunction" .s:fg_lred    .s:bg_none .s:fmt_none
execute "highlight! hsVarSym"           .s:fg_cyan    .s:bg_none .s:fmt_none
execute "highlight! hsType"             .s:fg_orange  .s:bg_none .s:fmt_none
execute "highlight! hsTypedef"          .s:fg_cyan    .s:bg_none .s:fmt_none
execute "highlight! hsModuleName"       .s:fg_green   .s:bg_none .s:fmt_undr
execute "highlight! hsModuleStartLabel" .s:fg_magenta .s:bg_none .s:fmt_none
highlight! link hsImportParams      Delimiter
highlight! link hsDelimTypeExport   Delimiter
highlight! link hsModuleStartLabel  hsStructure
highlight! link hsModuleWhereLabel  hsModuleStartLabel

" following is for the haskell-conceal plugin
" the first two items don't have an impact, but better safe
execute "highlight! hsNiceOperator"     .s:fg_cyan   .s:bg_none  .s:fmt_none
execute "highlight! hsniceoperator"     .s:fg_cyan   .s:bg_none  .s:fmt_none

"}}}

" pandoc markdown syntax highlighting "{{{
" ---------------------------------------------------------------------

"PandocHiLink pandocNormalBlock
execute "highlight! pandocTitleBlock"        .s:fg_blue    .s:bg_none .s:fmt_none
execute "highlight! pandocTitleBlockTitle"   .s:fg_blue    .s:bg_none .s:fmt_bold
execute "highlight! pandocTitleComment"      .s:fg_blue    .s:bg_none .s:fmt_bold
execute "highlight! pandocComment"           .s:fg_lgreen  .s:bg_none .s:fmt_ital
execute "highlight! pandocVerbatimBlock"     .s:fg_orange  .s:bg_none .s:fmt_none
highlight! link pandocVerbatimBlockDeep pandocVerbatimBlock
highlight! link pandocCodeBlock         pandocVerbatimBlock
highlight! link pandocCodeBlockDelim    pandocVerbatimBlock
execute "highlight! pandocBlockQuote"        .s:fg_blue    .s:bg_none .s:fmt_none
execute "highlight! pandocBlockQuoteLeader1" .s:fg_blue    .s:bg_none .s:fmt_none
execute "highlight! pandocBlockQuoteLeader2" .s:fg_cyan    .s:bg_none .s:fmt_none
execute "highlight! pandocBlockQuoteLeader3" .s:fg_orange  .s:bg_none .s:fmt_none
execute "highlight! pandocBlockQuoteLeader4" .s:fg_red     .s:bg_none .s:fmt_none
execute "highlight! pandocBlockQuoteLeader5" .s:fg_navy    .s:bg_none .s:fmt_none
execute "highlight! pandocBlockQuoteLeader6" .s:fg_lgreen  .s:bg_none .s:fmt_none
execute "highlight! pandocListMarker"        .s:fg_magenta .s:bg_none .s:fmt_none
execute "highlight! pandocListReference"     .s:fg_magenta .s:bg_none .s:fmt_undr

" Definitions
" ---------------------------------------------------------------------
let s:fg_pdef = s:fg_pink
execute "highlight! pandocDefinitionBlock"                  .s:fg_pdef .s:bg_none .s:fmt_none
execute "highlight! pandocDefinitionTerm"                   .s:fg_pdef .s:bg_none .s:fmt_stnd
execute "highlight! pandocDefinitionIndctr"                 .s:fg_pdef .s:bg_none .s:fmt_bold
execute "highlight! pandocEmphasisDefinition"               .s:fg_pdef .s:bg_none .s:fmt_ital
execute "highlight! pandocEmphasisNestedDefinition"         .s:fg_pdef .s:bg_none .s:fmt_bldi
execute "highlight! pandocStrongEmphasisDefinition"         .s:fg_pdef .s:bg_none .s:fmt_bold
execute "highlight! pandocStrongEmphasisNestedDefinition"   .s:fg_pdef .s:bg_none .s:fmt_bldi
execute "highlight! pandocStrongEmphasisEmphasisDefinition" .s:fg_pdef .s:bg_none .s:fmt_bldi
execute "highlight! pandocStrikeoutDefinition"              .s:fg_pdef .s:bg_none .s:fmt_revr
execute "highlight! pandocVerbatimInlineDefinition"         .s:fg_pdef .s:bg_none .s:fmt_none
execute "highlight! pandocSuperscriptDefinition"            .s:fg_pdef .s:bg_none .s:fmt_none
execute "highlight! pandocSubscriptDefinition"              .s:fg_pdef .s:bg_none .s:fmt_none

" Tables
" ---------------------------------------------------------------------
let s:fg_ptable = s:fg_blue
execute "highlight! pandocTable"                       .s:fg_ptable .s:bg_none  .s:fmt_none
execute "highlight! pandocTableStructure"              .s:fg_ptable .s:bg_none  .s:fmt_none
highlight! link pandocTableStructureTop pandocTableStructre
highlight! link pandocTableStructureEnd pandocTableStructre
execute "highlight! pandocTableZebraLight"             .s:fg_ptable .s:bg_grey  .s:fmt_none
execute "highlight! pandocTableZebraDark"              .s:fg_ptable .s:bg_black .s:fmt_none
execute "highlight! pandocEmphasisTable"               .s:fg_ptable .s:bg_none  .s:fmt_ital
execute "highlight! pandocEmphasisNestedTable"         .s:fg_ptable .s:bg_none  .s:fmt_bldi
execute "highlight! pandocStrongEmphasisTable"         .s:fg_ptable .s:bg_none  .s:fmt_bold
execute "highlight! pandocStrongEmphasisNestedTable"   .s:fg_ptable .s:bg_none  .s:fmt_bldi
execute "highlight! pandocStrongEmphasisEmphasisTable" .s:fg_ptable .s:bg_none  .s:fmt_bldi
execute "highlight! pandocStrikeoutTable"              .s:fg_ptable .s:bg_none  .s:fmt_revr
execute "highlight! pandocVerbatimInlineTable"         .s:fg_ptable .s:bg_none  .s:fmt_none
execute "highlight! pandocSuperscriptTable"            .s:fg_ptable .s:bg_none  .s:fmt_none
execute "highlight! pandocSubscriptTable"              .s:fg_ptable .s:bg_none  .s:fmt_none

" Headings
" ---------------------------------------------------------------------
let s:fg_phead = s:fg_lred
execute "highlight! pandocHeading"                       .s:fg_phead  .s:bg_none .s:fmt_bold
execute "highlight! pandocHeadingMarker"                 .s:fg_orange .s:bg_none .s:fmt_bold
execute "highlight! pandocEmphasisHeading"               .s:fg_phead  .s:bg_none .s:fmt_bldi
execute "highlight! pandocEmphasisNestedHeading"         .s:fg_phead  .s:bg_none .s:fmt_bldi
execute "highlight! pandocStrongEmphasisHeading"         .s:fg_phead  .s:bg_none .s:fmt_bold
execute "highlight! pandocStrongEmphasisNestedHeading"   .s:fg_phead  .s:bg_none .s:fmt_bldi
execute "highlight! pandocStrongEmphasisEmphasisHeading" .s:fg_phead  .s:bg_none .s:fmt_bldi
execute "highlight! pandocStrikeoutHeading"              .s:fg_phead  .s:bg_none .s:fmt_revr
execute "highlight! pandocVerbatimInlineHeading"         .s:fg_phead  .s:bg_none .s:fmt_bold
execute "highlight! pandocSuperscriptHeading"            .s:fg_phead  .s:bg_none .s:fmt_bold
execute "highlight! pandocSubscriptHeading"              .s:fg_phead  .s:bg_none .s:fmt_bold

" Links
" ---------------------------------------------------------------------
execute "highlight! pandocLinkDelim"        .s:fg_lgreen  .s:bg_none .s:fmt_none
execute "highlight! pandocLinkLabel"        .s:fg_blue    .s:bg_none .s:fmt_undr
execute "highlight! pandocLinkText"         .s:fg_blue    .s:bg_none .s:fmt_undb
execute "highlight! pandocLinkURL"          .s:fg_yellow  .s:bg_none .s:fmt_undr
execute "highlight! pandocLinkTitle"        .s:fg_yellow  .s:bg_none .s:fmt_undi
execute "highlight! pandocLinkTitleDelim"   .s:fg_lgreen  .s:bg_none .s:fmt_undi .s:sp_yellow
execute "highlight! pandocLinkDefinition"   .s:fg_cyan    .s:bg_none .s:fmt_undr .s:sp_yellow
execute "highlight! pandocLinkDefinitionID" .s:fg_blue    .s:bg_none .s:fmt_bold
execute "highlight! pandocImageCaption"     .s:fg_pink    .s:bg_none .s:fmt_undb
execute "highlight! pandocFootnoteLink"     .s:fg_green   .s:bg_none .s:fmt_undr
execute "highlight! pandocFootnoteDefLink"  .s:fg_green   .s:bg_none .s:fmt_bold
execute "highlight! pandocFootnoteInline"   .s:fg_green   .s:bg_none .s:fmt_undb
execute "highlight! pandocFootnote"         .s:fg_green   .s:bg_none .s:fmt_none
execute "highlight! pandocCitationDelim"    .s:fg_magenta .s:bg_none .s:fmt_none
execute "highlight! pandocCitation"         .s:fg_magenta .s:bg_none .s:fmt_none
execute "highlight! pandocCitationID"       .s:fg_magenta .s:bg_none .s:fmt_undr
execute "highlight! pandocCitationRef"      .s:fg_magenta .s:bg_none .s:fmt_none

" Main Styles
" ---------------------------------------------------------------------
execute "highlight! pandocStyleDelim"             .s:fg_lgreen  .s:bg_none .s:fmt_none
execute "highlight! pandocEmphasis"               .s:fg_navy    .s:bg_none .s:fmt_ital
execute "highlight! pandocEmphasisNested"         .s:fg_navy    .s:bg_none .s:fmt_bldi
execute "highlight! pandocStrongEmphasis"         .s:fg_navy    .s:bg_none .s:fmt_bold
execute "highlight! pandocStrongEmphasisNested"   .s:fg_navy    .s:bg_none .s:fmt_bldi
execute "highlight! pandocStrongEmphasisEmphasis" .s:fg_navy    .s:bg_none .s:fmt_bldi
execute "highlight! pandocStrikeout"              .s:fg_lgreen  .s:bg_none .s:fmt_revr
execute "highlight! pandocVerbatimInline"         .s:fg_orange  .s:bg_none .s:fmt_none
execute "highlight! pandocSuperscript"            .s:fg_pink    .s:bg_none .s:fmt_none
execute "highlight! pandocSubscript"              .s:fg_pink    .s:bg_none .s:fmt_none

execute "highlight! pandocRule"                   .s:fg_blue    .s:bg_none .s:fmt_bold
execute "highlight! pandocRuleLine"               .s:fg_blue    .s:bg_none .s:fmt_bold
execute "highlight! pandocEscapePair"             .s:fg_red     .s:bg_none .s:fmt_bold
execute "highlight! pandocCitationRef"            .s:fg_magenta .s:bg_none .s:fmt_none
execute "highlight! pandocNonBreakingSpace"       . s:fg_red    .s:bg_none .s:fmt_revr
highlight! link pandocEscapedCharacter pandocEscapePair
highlight! link pandocLineBreak        pandocEscapePair

" Embedded Code
" ---------------------------------------------------------------------
execute "highlight! pandocMetadataDelim" .s:fg_lgreen .s:bg_none .s:fmt_none
execute "highlight! pandocMetadata"      .s:fg_blue   .s:bg_none .s:fmt_none
execute "highlight! pandocMetadataKey"   .s:fg_blue   .s:bg_none .s:fmt_none
execute "highlight! pandocMetadata"      .s:fg_blue   .s:bg_none .s:fmt_bold
highlight! link pandocMetadataTitle pandocMetadata

"}}}

" neomake highlighting "{{{
" ---------------------------------------------------------------------
execute "highlight! NeomakeErrorSign"       . s:fg_lred   .s:bg_none .s:fmt_none
execute "highlight! NeomakeWarningSign"     . s:fg_orange .s:bg_none .s:fmt_none
execute "highlight! NeomakeMessageSign"     . s:fg_cyan   .s:bg_none .s:fmt_none
execute "highlight! NeomakeNeomakeInfoSign" . s:fg_green  .s:bg_none .s:fmt_none

"}}}

" gitgutter highlighting "{{{
" ---------------------------------------------------------------------
execute "highlight! GitGutterAdd"          .s:fg_green  .s:bg_none .s:fmt_none
execute "highlight! GitGutterChange"       .s:fg_orange .s:bg_none .s:fmt_none
execute "highlight! GitGutterDelete"       .s:fg_red    .s:bg_none .s:fmt_none
execute "highlight! GitGutterChangeDelete" .s:fg_red    .s:bg_none .s:fmt_none
" }}}"

" signify highlighting "{{{
" ---------------------------------------------------------------------
execute "highlight! SignifySignAdd"          .s:fg_green  .s:bg_none .s:fmt_none
execute "highlight! SignifySignChange"       .s:fg_orange .s:bg_none .s:fmt_none
execute "highlight! SignifySignDelete"       .s:fg_red    .s:bg_none .s:fmt_none
execute "highlight! SignifySignChangeDelete" .s:fg_red    .s:bg_none .s:fmt_none
" }}}"

" ALE highlighting "{{{
" ---------------------------------------------------------------------
execute "highlight! ALEErrorSign"   .s:fg_lred   .s:bg_none .s:fmt_none
execute "highlight! ALEWarningSign" .s:fg_orange .s:bg_none .s:fmt_none
" }}}"

" NeoVim terminal buffer colours "{{{
" ---------------------------------------------------------------------
let g:terminal_color_0 = s:gui_black
let g:terminal_color_1 = s:gui_red
let g:terminal_color_2 = s:gui_green
let g:terminal_color_3 = s:gui_orange
let g:terminal_color_4 = s:gui_blue
let g:terminal_color_5 = s:gui_magenta
let g:terminal_color_6 = s:gui_cyan
let g:terminal_color_7 = s:gui_brown
let g:terminal_color_8 = s:gui_grey
let g:terminal_color_9 = s:gui_lred
let g:terminal_color_10 = s:gui_lgreen
let g:terminal_color_11 = s:gui_yellow
let g:terminal_color_12 = s:gui_navy
let g:terminal_color_13 = s:gui_pink
let g:terminal_color_14 = s:gui_violet
let g:terminal_color_15 = s:gui_white
"}}}

" Utility autocommand "{{{
" ---------------------------------------------------------------------
" In cases where Solarized is initialized inside a terminal vim session and
" then transferred to a gui session via the command `:gui`, the gui vim process
" does not re-read the colorscheme (or .vimrc for that matter) so any `has_gui`
" related code that sets gui specific values isn't executed.
"
" Currently, Solarized sets only the cterm or gui values for the colorscheme
" depending on gui or terminal mode. It's possible that, if the following
" autocommand method is deemed excessively poor form, that approach will be
" used again and the autocommand below will be dropped.
"
" However it seems relatively benign in this case to include the autocommand
" here. It fires only in cases where vim is transferring from terminal to gui
" mode (detected with the script scope s:vmode variable). It also allows for
" other potential terminal customizations that might make gui mode suboptimal.
"
autocmd GUIEnter * if (has('gui_running')) | execute "colorscheme " . g:colors_name | endif
"}}}
