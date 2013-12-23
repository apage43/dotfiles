" vim:set ft=vim et tw=87 sw=2:
set nocompatible
filetype off

let maplocalleader=','
let mapleader=','

" Bundles {{{1

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'mattn/emmet-vim'

"General
" ,t to show tags window
Bundle 'majutsushi/tagbar'
nmap <leader>t :TagbarToggle<CR>
"Tim Freaking Pope
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-sleuth'
Bundle 'tpope/vim-afterimage'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-characterize'
Bundle 'tpope/vim-dispatch'

"PB
Bundle 'uarun/vim-protobuf'

" gitgutter
Bundle 'mhinz/vim-signify'
highlight SignColumn guibg=bg

Bundle 'gregsexton/gitv'

" nerdcommenter
Bundle 'scrooloose/nerdcommenter'
nmap <leader># :call NERDComment(0, "invert")<cr>
vmap <leader># :call NERDComment(0, "invert")<cr>
" syntastic
"Bundle 'scrooloose/syntastic'
"    let g:syntastic_enable_signs=1
"    let g:syntastic_auto_loc_list=1
"    let g:syntastic_c_include_dirs = ['/Users/apage43/proj/cb_server/install/include']
"    let g:syntastic_cpp_include_dirs = ['/Users/apage43/proj/cb_server/install/include']
"    let g:syntastic_cpp_compiler = 'clang++'
"    let g:syntastic_cpp_compiler_options = '-stdlib=libc++ -std=c++11'
"Bundle 'spiiph/vim-space'

"UI
Bundle 'Lokaltog/vim-easymotion'
Bundle 'altercation/vim-colors-solarized'
Bundle 'ZoomWin'

" CtrlP
Bundle 'kien/ctrlp.vim'
    let g:ctrlp_custom_ignore = {
          \ 'file': '\v\.(class|jar)$',
          \ 'dir': '\vtarget$' }
    map <Leader>gs :CtrlP src/<CR>
    map <Leader>gl :CtrlP lib/<CR>
    map <C-B> :CtrlPBuffer<CR>

" Gundo!
Bundle 'sjl/gundo.vim'
map <Leader>gu :GundoToggle<CR>

"Web
Bundle 'vim-stylus'
Bundle 'jade.vim'
Bundle 'groenewege/vim-less'
Bundle 'chrisbra/color_highlight'
  let g:colorizer_auto_filetype='css,less'
Bundle 'itspriddle/vim-marked'
  nmap <leader>qp :MarkedOpen<CR>

"Go
set rtp+=/usr/local/Cellar/go/1.2/libexec/misc/vim
Bundle 'go.vim'
Bundle 'nsf/gocode', {'rtp': 'vim/'}
"Bundle 'mozilla/rust', {'rtp': 'src/etc/vim'}

"Clojure
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'tpope/vim-fireplace'
"Bundle 'tpope/vim-classpath'
"Bundle 'paredit.vim'
Bundle 'guns/vim-sexp'
Bundle 'guns/vim-slamhound'
nnoremap <LocalLeader>sh :Slamhound<CR>
Bundle 'guns/vim-clojure-static'
    let g:clojure_maxlines = 100
    let g:clojure_align_multiline_strings = 1

"C++
"Bundle 'Rip-Rip/clang_complete'
"Bundle 'Valloric/YouCompleteMe'

"OpenGL
Bundle 'glsl.vim'

Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}

"Completey things

" Not a `bundle' per se..
set rtp+=/usr/local/Cellar/go/1.0.2/misc/vim/

" AIRLINE
Bundle 'bling/vim-airline'


" HASKELL
Bundle 'eagletmt/neco-ghc'
Bundle 'dag/vim2hs'

let g:airline_powerline_fonts = 1


"" NEO COMPLETE


"" WHAT ON SHELL?

Bundle 'Shougo/vimproc.vim'
Bundle 'Shougo/vimshell.vim'
Bundle 'Shougo/unite.vim'

" VIM Options {{{1

syntax on
set ruler
set more
set laststatus=2
set autoread
set showmode
set showcmd
set autoindent smartindent
set expandtab
set smarttab
set nohidden
set tabstop=4
set shiftwidth=4
set scrolloff=3
set sidescrolloff=5
set backspace=indent,eol,start
set showfulltag
set cmdheight=1
filetype on
filetype indent on
filetype plugin on
set magic
set listchars=tab:.\ ,trail:·
set list
set tags=~/.vtags,tags
"system clipboard yankpaste
set clipboard=unnamed

set foldmethod=marker

"  searching
set incsearch                 " incremental search
set ignorecase                " search ignoring case
set smartcase                 " Ignore case when searching lowercase
set hlsearch                  " highlight the search
set showmatch                 " show matching bracket
set diffopt=filler,iwhite     " ignore all whitespace and sync

"  backup options
set backup
set backupdir=~/.backup
set viminfo+=!
set history=200

"Keep all my swappy type files out of the way
set dir=~/.vimswap//,/var/tmp//,/tmp//,.

" PERSISTENT UNDO
set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000

"Solarized
"let g:solarized_hitrail=1    "default value is 0
"
set relativenumber
set background=dark
set backupcopy=yes


" GUI options {{{1
if has('gui_running')
    set guioptions-=T        " no toolbar
    set guioptions-=l        " no left scrollbar
    set guioptions-=L        " no left scrollbar
    set guioptions-=r        " no right scrollbar
    set guioptions-=R        " no right scrollbar
    set lines=64
    set columns=135
    set gfn=PragmataPro:h15.0
    "set transparency=1
    colorscheme solarized
    Bundle 'Shougo/neocomplete'
    let g:neocomplete#enable_at_startup = 1
  else
    colorscheme Tomorrow-Night
endif

highlight LineNr gui=NONE guifg=#5d6067

function! ToggleTom()
  if(g:colors_name == "Tomorrow-Night")
    colors Tomorrow
  else
    colors Tomorrow-Night
    highlight LineNr gui=NONE guifg=#5d6067
  endif
endfunction

map <F5> :call ToggleTom()<cr>
" Mappings {{{1

"Keys I like
map ; :
map <leader><space> :noh<CR>
nnoremap <silent> <C-Up> :wincmd k<CR>
nnoremap <silent> <C-Down> :wincmd j<CR>
nnoremap <silent> <C-Left> :wincmd h<CR>
nnoremap <silent> <C-Right> :wincmd l<CR>

map <F8> :wa<Bar>make<CR>

"map <Leader>q v}Jxo<ESC>k^
map <Leader>mx ,Wmxaclojure.walk/macroexpand-all '<ESC>`xc!!
map <Leader>ex yypf(i=> <ESC>lc!!

nnoremap <F9> :Dispatch<CR>

" Autocmds {{{1

autocmd BufRead,BufNewFile *.cljs   set filetype=clojure
autocmd BufRead,BufNewFile *.glsl   set filetype=glsl
autocmd FileType markdown           setlocal tw=72
autocmd FileType clojure            set lispwords+=defproject
autocmd FileType clojure            nmap <buffer> cpP :Eval<cr>
autocmd FileType clojure            RainbowParenthesesActivate
autocmd FileType go                 set makeprg="go build"
autocmd BufWritePre *.go            Fmt
autocmd Filetype cpp set shiftwidth=2
set cino=N-s

au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
highlight SignColumn guibg=bg
hi SpecialKey guifg=red
