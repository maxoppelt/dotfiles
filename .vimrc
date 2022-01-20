" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Use spaces instead of tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" color darcula
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=2
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Vundle Package management
" Required for Vundle
filetype off
" set the runtime path to include Vundle
set rtp+=~/.vim/bundle/Vundle.vim

" Initialize Vundles
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
" Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'powerline/powerline'
Plugin 'ervandew/supertab'
Plugin 'davidhalter/jedi-vim'
Plugin 'terryma/vim-multiple-cursors'
" Plugin 'klen/python-mode'
Plugin 'tmhedberg/SimpylFold'

call vundle#end()

" Python Folding
let g:SimpylFold_docstring_preview = 0
let g:SimpylFold_fold_docstring = 1
let b:SimpylFold_fold_docstring = 1
let g:SimpylFold_fold_import = 0
let b:SimpylFold_fold_import = 0
let g:SimpylFold_fold_blank = 0
let b:SimpylFold_fold_blank = 0

set foldlevel=99

filetype plugin indent on    " required

" Setup for supertap and jedi-vim
let g:SuperTabDefaultCompletionType = "context"
let g:jedi#popup_on_dot = 0
autocmd FileType python setlocal completeopt-=preview

" Setup for latex-box
let g:LatexBox_Folding = 1
" The quickfix window is opened automatically if not
" empty and becomes the active window.  Quickfix window is not
" opened on warnings, only on errors.
let g:LatexBox_quickfix = 3
" Latex-Box Viewer
if has('win32') || has('win64')
  let g:viewer = 'sumatrapdf'
elseif has('macunix')
  let g:viewer = 'skim'
else
  let g:viewer = 'evince'
endif

" Spell Checkecking
let b:myLang=0
let g:myLangList=["nospell","de_de","en_us"]
function! ToggleSpell()
  let b:myLang=b:myLang+1
  if b:myLang>=len(g:myLangList) | let b:myLang=0 | endif
  if b:myLang==0
    setlocal nospell
  else
    execute "setlocal spell spelllang=".get(g:myLangList, b:myLang)
  endif
  echo "spell checking language:" g:myLangList[b:myLang]
endfunction
nmap <silent> <F7> :call ToggleSpell()<CR>