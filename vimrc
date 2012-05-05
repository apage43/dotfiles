set nocompatible
filetype off

" Vundle

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'matthias-guenther/hammer.vim'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-speeddating'

Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'spiiph/vim-space'

Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neocomplcache-clang'
Bundle 'Shougo/neocomplcache-snippets-complete'

Bundle 'Lokaltog/vim-powerline'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'altercation/vim-colors-solarized'
Bundle 'kien/ctrlp.vim'
Bundle 'sjl/gundo.vim'
Bundle 'jade.vim'
Bundle 'taskpaper.vim'


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
let maplocalleader=','
let mapleader=','
set magic
set list
set listchars=tab:▸\ ,eol:¬
set tags=~/.vtags,tags
" highlight over 80 columns
highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
highlight OverLength cterm=reverse
match OverLength /\%81v.*/
" Highlight extra whitespace
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
highlight ExtraWhitespace ctermbg=red guibg=#550000
match ExtraWhitespace /\s\+$/
" CtrlP shortcuts
map <Leader>gs :CtrlP src/<CR>
map <Leader>gl :CtrlP lib/<CR>
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
set viminfo=%100,'100,/100,h,\"500,:100,n~/.viminfo
set history=200
"Keep all my swappy type files out of the way
set dir=~/.vimswap//,/var/tmp//,/tmp//,.
" PERSISTENT UNDO
set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000
"Solarized
let g:solarized_contrast="high"    "default value is normal
let g:solarized_diffmode="high"    "default value is normal
let g:solarized_hitrail=1    "default value is 0
" Gundo!
map <Leader>gu :GundoToggle<CR>
set relativenumber
set background=light
" GUI opts
if has('gui_running')
    set guioptions-=T        " no toolbar
    set guioptions-=l        " no left scrollbar
    set guioptions-=L        " no left scrollbar
    set guioptions-=r        " no right scrollbar
    set guioptions-=R        " no right scrollbar
    set lines=64
    set columns=135
    set gfn=PragmataPro:h14.0
    set transparency=5
endif

"neocomplcache
let g:neocomplcache_enable_at_startup = 1
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)
inoremap <expr><CR> neocomplcache#smart_close_popup()."\<CR>"
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()
" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
let g:neocomplcache_ctags_program = "ctags"

let g:neocomplcache_clang_use_library = 1
let g:neocomplcache_clang_user_options = '-I /usr/local/include/SDL'
let g:neocomplcache_clang_macros = 1

" syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_c_include_dirs = ['/usr/local/include/SDL', '/Users/apage43/proj/cb_server/install/include']
let g:syntastic_cpp_include_dirs = ['/usr/local/include/SDL', '/Users/apage43/proj/cb_server/install/include']
" nerdcommenter
nmap <leader># :call NERDComment(0, "invert")<cr>
vmap <leader># :call NERDComment(0, "invert")<cr>
" ,t to show tags window
nmap <leader>t :TagbarToggle<CR>

" Powerline
let g:Powerline_symbols = 'fancy'

"Keys I like
map <leader><space> :noh<CR>

colorscheme solarized
