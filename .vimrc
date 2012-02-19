"map!  
" first the disabled features due to security concerns
let g:secure_modelines_verbose=0 " securemodelines vimscript
let g:secure_modelines_modelines = 15 " 15 available modelines

let g:slime_target = "tmux"
" ---------------------------------------------------------------------------
" operational settings
"

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on
set ruler                     " show the line number on the bar
set more                      " use more prompt
set autoread                  " watch for file changes
set lazyredraw                " don't redraw when don't have to
set showmode                  " show the mode all the time
set showcmd                   " Show us the command we're typing
set autoindent smartindent    " auto/smart indent
set expandtab                 " expand tabs to spaces (except java, see autocmd below)
set smarttab                  " tab and backspace are smart
set tabstop=4                 " 6 spaces
set shiftwidth=4              " shift width
set scrolloff=3               " keep at least 3 lines above/below
set sidescrolloff=5           " keep at least 5 lines left/right
set backspace=indent,eol,start  " backspace over all kinds of things
set showfulltag               " show full completion tags
set noerrorbells              " no error bells please
set linebreak                 " wrap at 'breakat' instead of last char
set tw=80                     " default textwidth is a max of 80
set cmdheight=1
set updatecount=100           " switch every 100 chars
set complete=.,w,b,u,U,t,i,d  " do lots of scanning on tab completion
set ttyfast                   " we have a fast terminal
filetype on                   " Enable filetype detection
filetype indent on            " Enable filetype-specific indenting
filetype plugin on            " Enable filetype-specific plugins
set wildmode=longest:full     " *wild* mode
set wildignore+=*.o,*~,.lo    " ignore object files
set wildmenu                  " menu has tab completion
let maplocalleader=','        " all my macros start with ,
let mapleader=','        " all my macros start with ,
" Deprecated, using SimpleFold with '\f' now. ,sf to revert
"set foldmethod=syntax         " fold on syntax automagically, always
set foldcolumn=2              " 2 lines of column for fold showing, always
set whichwrap+=<,>,h,l        " backspaces and cursor keys wrap to
set magic                     " Enable the "magic"
set visualbell t_vb=          " Disable ALL bells
set cursorline                " show the cursor line
set matchpairs+=<:>           " add < and > to match pairs
set list
set listchars=tab:▸\ ,eol:¬
"set tags=tags;/               " search recursively up for tags
set tags=~/.vtags,tags        " tag filenames
set laststatus=2

"Type specific balls
autocmd FileType coffee set tabstop=2 softtabstop=2 shiftwidth=2
" highlight over 80 columns
highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
highlight OverLength cterm=reverse
match OverLength /\%81v.*/

set dictionary=/usr/share/dict/words " more words!

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

" Whitespaaaaace
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
highlight ExtraWhitespace ctermbg=red guibg=#550000
match ExtraWhitespace /\s\+$/

" Settings for VimClojure
let g:vimclojure#HighlightBuiltins=1   " Highlight Clojure's builtins
let g:vimclojure#ParenRainbow=1        " Rainbow parentheses'!
let g:vimclojure#DynamicHighlighting=1 " Dynamically highlight functions
let vimclojure#NailgunClient="/Users/apage43/bin/ng" " Nailgun location
let vimclojure#WantNailgun=1
" let vimclojure#NailgunPort = 2443
let vimclojure#SplitPos = "right"

" CommandT shortcuts

map <Leader>gs :CommandT src/<CR>
map <Leader>gl :CommandT lib/<CR>

" TagList Blah
map <Leader>ml :TlistToggle<CR><C-W>h

" Gundo!
map <Leader>gu :GundoToggle<CR>

let g:SuperTabDefaultCompletionType = "context"
autocmd FileType clojure let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabDefaultCompletionTypeDiscovery = [
                  \ "&completefunc:<c-x><c-u>",
                  \ "&omnifunc:<c-x><c-o>",
                  \ ]
let g:SuperTabLongestHighlight = 1

let g:erlangManPath = "/usr/local/Cellar/erlang/R14A/share/man"

" ---------------------------------------------------------------------------
"  searching
set incsearch                 " incremental search
set ignorecase                " search ignoring case
set smartcase                 " Ignore case when searching lowercase
set hlsearch                  " highlight the search
set showmatch                 " show matching bracket
set diffopt=filler,iwhite     " ignore all whitespace and sync

" ---------------------------------------------------------------------------
"  mouse stuffs
"set mouse=a                   " mouse support in all modes
set mousehide                 " hide the mouse when typing

" ---------------------------------------------------------------------------
"  backup options
set backup
set backupdir=~/.backup
set viminfo=%100,'100,/100,h,\"500,:100,n~/.viminfo
set history=200
"set viminfo='100,f1

map ,, :noh<cr>
nnoremap <silent> ,T :TagbarToggle<CR>

map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

map <C-H> <C-W>h<C-W>_
map <C-L> <C-W>l<C-W>_

colorscheme solarized
set relativenumber

"filetype specific

function DoGoogleIndent()
    unlet b:did_indent
    source ~/.vim/bundle/google-cpp/indent/google.vim
endfunction

autocmd FileType cpp call DoGoogleIndent()

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
set background=dark
colorscheme solarized
