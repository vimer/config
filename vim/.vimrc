execute pathogen#infect()
"http://ctags.sourceforge.net/ install ctags
set t_Co=256
"............................
"<@Platform Diff Go@>"
if !has('win32')  "linux
	au GUIEnter * simalt ~x
	colorscheme molokai
	set guifont=Monaco\ 10
	set gfw=consolas\ 10
	set tags=tags;
	set autochdir
	"au BufWritePost *.c,*.cpp,*.cc,*.h !ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .
else 
	"set guifont=consolas:h10.9:cANSI
	"set guifont=Courier_New_Bold:h12:cANSI
	set guifont=Monaco:h10:cANSI
	set gfw=consolas:h11:cGB2312
	colorscheme twilight
	au GUIEnter * simalt ~x
	au GUIEnter * call libcallnr("vimtweak.dll", "SetAlpha", 234)
endif
"<@Platform Diff End@>"
"
"<@ Basic Config Go@>"
syntax on 
set nu!
set ai!
set showmatch "设置括号匹配模式
let mapleader = ","
"set cursorcolumn  "列显示
set cmdheight=1
set ts=4 "Tab为4个空格
set sw=4
set shiftwidth=4
set backspace=2
set lbr "单词间不能断行
set shortmess=atI "启动不显示xx儿童的提示
set showcmd "开启命令提示
set smarttab
set cindent
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s
"set ignorecase
set hlsearch
set incsearch
set list
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<
set ruler
set wildmenu
set confirm
"set paste   "Add will lead to vim does't work 
set clipboard+=unnamed
set vb t_vb=
set guioptions-=m
set guioptions-=T
set autoread
set magic
"set nobackup
set noswapfile
filetype indent on
nnoremap j gj
nnoremap k gk
xnoremap j gj
xnoremap k gk
"<@ Basic Config End@>"

"<@Coding Config Go>@"
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,chinese,taiwan,ansi
"<@Coding Config End>@"

"<@Folding Config Go>@"
"折叠tt(za)打开/关闭折叠 zM打开所有折叠, zm关闭所有折叠
set foldlevel=1000
set foldmethod=marker 
"set foldmarker=[[[,]]]
au BufWinLeave ?* mkview "保存上次折叠
au BufWinEnter ?* silent loadview
nnoremap tt @=((foldclosed(line('.')) < 0) ? 'zc':'zo') <CR>
"<@Folding Config End>@"


"<@Define key Go@>"
au InsertLeave *.* write
inoremap jj <Esc>
:map qq :q!<cr>
:map s :w<cr>
":imap <ESC> <ESC>:w!<cr>
:map <leader>sv :vne<cr>
:map <leader>ss :sp<cr>

""tagbar
:map <leader>tt :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 30

vnoremap  *  y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
vnoremap  #  y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
try
	set switchbuf = useopen
	set stal=1
catch
endtry
"map <leader>al :Align \/\*   
"<@Define key End@>"

"<@Define A.vim BEGIN@>"
noremap <silent><leader>ah :A<CR>
noremap <silent><leader>at :AT<CR>
noremap <silent><leader>av :AV<CR>
noremap <silent><leader>as :AS<CR> 
nnoremap <silent><F12> :Grep<CR>
"<@Define A.vim End@>"

"<@ Emacs Config Go@>"
:imap <c-a> <esc>I
:imap <c-e> <esc>A
":imap <c-p> <up>
":imap <c-n> <down>
":imap <c-l> <right>
:imap <c-f> <right>
":imap <c-h> <left>
:imap <c-b> <left>
:imap <c-k> <ESC>d$
"<@ Emacs Config End@>"

"<@ TagList Config Go@>"
"let Tlist_Exist_OnlyWindow = 1
"let Tlist_Auto_Highlight_Tag = 1
""let Tlist_Auto_Open = 1
"let Tlist_Auto_Update = 1
"let Tlist_Close_On_Select = 0
"let Tlist_Compact_Format = 0
"let Tlist_Display_Prototype = 0
"let Tlist_File_Fold_Auto_Close = 1
"let Tlist_GainFocus_On_ToggleOpen = 0
"let Tlist_Hightlight_Tag_On_BufEnter = 1
"let Tlist_Inc_Winwidth = 0
"let Tlist_Max_Submenu_Items = 1
"let Tlist_Max_Tag_Length = 30
""let Tlist_Process_File_Always = 1
"let Tlist_Show_Menu = 1
"let Tlist_Sort_Type = "name"
"let Tlist_Show_One_File = 1
"let Tlist_Use_Right_Window = 1
"map <F2> :!ctags -R --sort=foldcase --c++-kinds=+p --fields=+iaS --extra=+q "<c-r>=getcwd()<cr>"<cr>
"<@ TagList Config End@>"


""自动完成"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocp
filetype plugin on 
filetype plugin indent on
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType java set omnifunc=javacomplete#Complete
if has("autocmd") && exists("+omnifunc")
	autocmd Filetype *
				\ if &omnifunc == "" |
				\   setlocal omnifunc=syntaxcomplete#Complete |
				\ endif
endif
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"<@Buf Explorer Go@>"
"let g:bufExplorerShowRelativePath=1
"let g:bufExplorerSortBy='mru' 
"let g:bufExplorerSplitRight=0  
"let g:bufExplorerSplitVertical=1 
"let g:bufExplorerSplitVertSize = 30 
"let g:bufExplorerUseCurrentWindow=1
"let g:bufExplorerMaxHeight=13 
"nmap <C-i> :BufExplorer<CR>
""Enter 树开关 u打开文件  e在新标签页打开
":nmap <C-m> :VE<cr> 
"<@Buf Explorer End@>"

"<@minibuffer settings Go@>"
"let g:miniBufExplMapWindowNavVim = 1 
"let g:miniBufExplMapWindowNavArrows = 1 
"let g:miniBufExplMapCTabSwitchBufs = 1 
"let g:miniBufExplModSelTarget = 1 
"let g:miniBufExplUseSingleClick = 1 
"autocmd BufRead,BufNew :call UMiniBufExplorer
"<@minibuffer settings End@>"

"<@winmangaer Settings Go @>"
"let g:winManagerWindowLayout = "BufExplorer,FileExplorer|TagList"
"let g:winManagerWidth = 30
"let g:defaultExplorer = 0
"nmap <silent><leader>wm :WMToggle<cr>
"<@winmangaer Settings End@>"

hi BookMark_HighLight guifg=blue 

function ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endf
"<@Define script End@>"

"<@Python Config Go@>"
"map <F4> :!python % <cr>
"autocmd FileType python set omnifunc=pythoncomplete#Complete 
"autocmd FileType python setlocal et | setlocal sta | setlocal sw=8
"<@Python Config End@>"

"<@Dict Config Go@>"

"<@Dict Config End@>"

"<@Brackets Config Go@>
imap <M-(> ()<esc>i
imap <M-[> []<esc>i
imap <M-{> {}<esc>i
imap <M-<> <><esc>i

inoremap ( ()<ESC>i
"inoremap [ []<ESC>i
inoremap { {}<ESC>i
""inoremap < <><ESC>i "打开后会对html有影响
"inoremap " ""<ESC>i
"<@Brackets Config End@>

"<@Doxygen Config Go@>"
"注释<leader>cc <leader>cA  <leader>dx
map <leader>dx :Dox<cr>
"<@Doxygen Config End@>" 

"<@Nodejs @>"
"https://github.com/moll/vim-node
"set runtimepath^=~/.vim/bundle/node 
"set runtimepath^=~/.vim/bundle/vim-javascript/
autocmd User Node
			\ if &filetype == "javascript" |
			\   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
			\   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
			\ endif   

let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc" 
map <F2> :!node % <cr>
"<@Nodejs @>" 

"vim-airline"
set laststatus=2
"let g:airline_detect_whitespace=0
"let g:airline#extensions#tabline#enabled = 1 "don't open
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme="bubblegum"
"vim-airline"


""""shotcuts
"mm -> 标记一行
",l -> 跳跃一行

""""Go
"disable shows erros for the fmt command
let g:go_fmt_fail_silently = 1 
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
au FileType go set dictionary+=~/.config/vim/dict/golang.dict

"au FileType go nmap <Leader>ds <Plug>(go-def-split)
"au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
"au FileType go nmap <Leader>dt <Plug>(go-def-tab)

""""html5
let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0
let g:html5_aria_attributes_complete = 0
""""

""""缩进线 ,ig
"let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
""""
