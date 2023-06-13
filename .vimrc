if &shell =~# 'fish$'
    set shell=sh
endif

" Make sure these settings don't get overrided
set nocompatible
filetype off

filetype plugin indent on    " required

set laststatus=2
set t_Co=256
set encoding=utf8

" autocmd vimenter * NERDTree
map <C-f> :NERDTreeToggle<CR>
map <C-g> :NERDTreeToggle %<CR>

" Git blame on \s
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

" Enable Doxygen highlighting
let g:load_doxygen_syntax=1

let g:powerline_symbols = 'fancy'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' ℅:'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = '☰ '
let g:airline_symbols.dirty='⚡'

let g:ctrlp_working_path_mode = 0

" Show grey line numbers
set number
highlight LineNr ctermfg=grey guifg=#050505

" Show incomplete commands and show current mode
set showcmd
set showmode

" Disable annoying beeps
set visualbell

" Place backup files in separate directory
set directory=$HOME/.vim/swap//
set backupdir=$HOME/.vim/backup//

" Enable smart indentation
set autoindent
set smartindent

" Set indentation
set shiftwidth=4
set softtabstop=4
set tabstop=4
set noexpandtab

" Wrapping
set nowrap

" Ignore these when tab-completing
set wildignore=*.o,*~

" Enable syntax highlighting
syntax on
filetype on

" Enable mouse
set mouse=a

if !has('nvim')
    set ttymouse=xterm
endif

" Color background after 80 characters differently
set colorcolumn=80,120
highlight ColorColumn ctermbg=232 guibg=#2c2d27

set ttyfast

" Highlight searches
set hlsearch
" Search ignoring case
set ignorecase


" Keybindings:
" Tabs
map <C-t>     :tabnew<CR>
map <Leader>, :tabp<CR>
map <Leader>. :tabn<CR>

" Buffers
" nmap <C-b> :enew<CR>
" nmap <C-o> :bprev<CR>
" nmap <C-p> :bnext<CR>


set ts=4
set sw=4
set expandtab

let NERDTreeIgnore = ['\.o$']

source ~/.vim/themes/sourcerer

" Tags
nmap <F12> g<C-]>
nmap <F24> <C-w>g<C-]>
nmap <F11> :po<CR>
nmap <F23> :ta<CR>

if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" File types
autocmd BufNewFile,BufRead *.json.example set filetype=json
autocmd FileType makefile setlocal noexpandtab
autocmd BufRead,BufNewFile *.tbpy set filetype=python

" Highlight current line in active window
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au VimEnter,WinEnter,BufWinEnter * hi clear CursorLine
  au WinLeave * setlocal nocursorline
augroup END

