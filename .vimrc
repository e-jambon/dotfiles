"1.GENERAL OPTION
"=================

" Automatically detect file types.
filetype on
" no vi compatibility.
set nocompatible 
" Encoding default for buffers and files
set encoding=utf-8
set fileencoding=utf-8
" Show parenthesis match
set showmatch
" Add recently accessed projects menu (project plugin)
" Minibuffer Explorer Settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" alt+n or alt+p to navigate between entries in Quickfix
map <silent> <m-p> :cp <cr>
map <silent> <m-n> :cn <cr>

" Change which file opens after executing :Rails command
let g:rails_default_file='config/database.yml'

syntax enable

set cf " Enable error files & error jumping.
set clipboard+=unnamed " Yanks go on clipboard instead.
set history=256 " Number of things to remember in history.
set autowrite " Writes on make/shell commands
set ruler "shows position in file in the ruler bar, above the command line
set nu " Line numbers on
set nowrap " Line wrapping off
set timeoutlen=250 " Time to wait after ESC (default causes an annoying delay)
" colorscheme vividchalk " Uncomment this to set a default theme

" Formatting
set ts=2 " Tabs are 2 spaces
set bs=2 " Backspace over everything in insert mode
set shiftwidth=2 " Tabs under smart indent
set softtabstop=2 " Tabs with tab key
set tabstop=4 " Character <tab> width
set nocp incsearch
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent
set autoindent
set smarttab
set expandtab

" Visual
set showmatch " Show matching brackets.
set mat=5 " Bracket blinking.
set list
" search
set hlsearch "Highlight searched paterns
set incsearch "Live search

" Show $ at end of line and trailing space as ~
set lcs=tab:\ \ ,eol:$,trail:~,extends:>,precedes:<
set novisualbell " No blinking .
set noerrorbells " No noise.
set laststatus=2 " Always show status line.

" gvim specific
set mousehide " Hide mouse after chars typed
set mouse=a " Mouse in all modesc

" Tab shortucs
nmap <C-Down> :tabnew <CR>
nmap <C-Right> :tabnext <CR>
nmap <C-Left> :tabprevious <CR>

"BACKUP DIR, pleaaaase ! IMPORTANT : mkdir and chmod 700 on backup folder
set backupdir =~/.vimbackupdir

filetype plugin on
filetype indent on


if &term=="xterm"
  set t_Co=8
  set t_Sb=^[[4%dm
  set t_Sf=^[[3%dm
endif

set cursorline
"highlight CursorLine guibg=#001000
"reouverture a la meme position
if has("autocmd")
  filetype plugin indent on
  autocmd FileType text setlocal textwidth=78
autocmd BufreadPost *
        \ if line ("'\"") > 0 && line("'\"") <= line("$") |
        \ exe "normal g`\"" |
        \ endif
endif

set undolevels=1000

execute pathogen#infect()
