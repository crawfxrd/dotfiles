call plug#begin('~/.local/share/nvim/plugins')
Plug 'rust-lang/rust.vim'
call plug#end()

syntax enable
set background=dark

set backup

if !has('nvim')
    set backupdir=~/.local/share/vim/backup
    set directory=~/.local/share/vim/swap//
    set viminfo+=n~/.local/share/vim/viminfo
endif

set title
set ruler
set showcmd
set encoding=utf-8
set fileencoding=utf-8
set history=50
set backspace=indent,eol,start
set whichwrap+=<,>,[,],h,l
set nowrap
set scrolloff=3
set sidescroll=5

set cursorline
highlight CursorLine cterm=bold ctermbg=233
set colorcolumn=100
highlight ColorColumn ctermbg=233

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

set list
set listchars=tab:→\ ,trail:·,extends:»,precedes:«

set mouse=a

nnoremap <Space> za
set foldmethod=syntax
set foldlevelstart=99

if has('nvim')
    set clipboard+=unnamedplus
endif

