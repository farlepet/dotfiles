if &shell =~# 'fish$'
    set shell=sh
endif

" Make sure these settings don't get overrided
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
set rtp+=$HOME/.local/lib/python3.5/site-packages/powerline/bindings/vim/
Plugin 'ryanoasis/vim-webdevicons'
Plugin 'airblade/vim-gitgutter'
Plugin 'elixir-lang/vim-elixir'
Plugin 'vim-scripts/Conque-GDB'
Plugin 'leafgarland/typescript-vim'

let g:ConqueTerm_Color = 2         " 1: strip color after 200 lines, 2: always with color
let g:ConqueTerm_CloseOnEnd = 1    " close conque when program ends running
let g:ConqueTerm_StartMessages = 0 " display warning messages if conqueTerm is configured incorrectly

call vundle#end()            " required
filetype plugin indent on    " required


set laststatus=2
set t_Co=256
set encoding=utf8

" autocmd vimenter * NERDTree
map <C-f> :NERDTreeToggle<CR>

let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:ConqueGdb_GdbExe = "arm-none-eabi-gdb"

let g:powerline_symbols = 'fancy'

" Show grey line numbers
set number
highlight LineNr ctermfg=grey guifg=#050505

" Show incomplete commands and show current mode
set showcmd
set showmode

" Disable annoying beeps
set visualbell

" Prevent backups from being created
set noswapfile
set nobackup
set nowb

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

" Enable mouse
set mouse=a
set ttymouse=xterm

" Color background after 80 characters differently
let &colorcolumn=80
highlight ColorColumn ctermbg=232 guibg=#2c2d27

set ttyfast

" Highlight searches
set hlsearch
" Search ignoring case
set ignorecase


" Keybindings:
" Tabs
nmap <C-t> :tabnew<CR>
nmap <C-l> :tabp<CR>
nmap <C-n> :tabn<CR>

" Buffers
" nmap <C-b> :enew<CR>
" nmap <C-o> :bprev<CR>
" nmap <C-p> :bnext<CR>


set ts=4
set sw=4
set expandtab

let NERDTreeIgnore = ['\.o$']

source ~/.vim/themes/sourcerer

map <A-Right> gt
map <A-Left> gT
