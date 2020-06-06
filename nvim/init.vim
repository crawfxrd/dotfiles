if !has('nvim')
    set nocompatible
endif

call plug#begin('~/.local/share/nvim/plugins')
Plug 'rust-lang/rust.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'racer-rust/vim-racer'
Plug 'editorconfig/editorconfig-vim'
call plug#end()

syntax enable
set background=dark

if has('nvim')
    let g:deoplete#enable_at_startup = 1
    let g:racer_experimental_completer = 1
    "let g:racer_disable_errors = 1
endif

set backup

if has('nvim')
    set backupdir-=.
else
    set backupdir=~/.local/share/vim/backup
    set directory=~/.local/share/vim/swap//
    set viminfo+=n~/.local/share/vim/viminfo
    set undodir=~/.local/share/vim/undo
endif

set ruler
set encoding=utf-8
set fileencoding=utf-8
set history=50
set backspace=indent,eol,start
set whichwrap+=<,>,[,],h,l
set nowrap
set scrolloff=3
set sidescroll=5
set nomodeline
set undofile

set cursorline
highlight CursorLine cterm=bold ctermbg=233
set colorcolumn=80
highlight ColorColumn ctermbg=233

highlight ExtraWhitespace ctermbg=red
call matchadd('ExtraWhitespace', '\s\+$\| \+\ze\t', 10)
autocmd BufWinEnter * if !exists('w:matchId') | let w:matchId = matchadd('ExtraWhitespace', '\s\+$\| \+\ze\t', 10) | endif
autocmd BufWinLeave * call matchdelete(w:matchId)

highlight AlignmentTabs ctermbg=red
call matchadd('AlignmentTabs', '\(\S.*\)\@<=\t\+', 10)
autocmd BufWinEnter * if !exists('w:matchId2') | let w:matchId2 = matchadd('AlignmentTabs', '\(\S.*\)\@<=\t\+', 10) | endif
autocmd BufWinLeave * call matchdelete(w:matchId2)

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set copyindent
set autoindent
set smartindent

set ignorecase
set smartcase

set winheight=8
set winminheight=8

set list
set listchars=tab:→\ ,trail:·,extends:»,precedes:«

set mouse=a

map , :
nnoremap <Space> za

nnoremap j gj
nnoremap k gk

set foldmethod=syntax
set foldlevelstart=99

if has('nvim')
    set clipboard+=unnamedplus
endif

autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \    exe "normal g'\"" |
    \ endif
