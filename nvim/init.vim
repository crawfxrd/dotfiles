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
    let g:racer_cmd = "~/.cargo/bin/racer"
endif

set backup

if has('nvim')
    set backupdir-=.
else
    set backupdir=~/.local/share/vim/backup
    set directory=~/.local/share/vim/swap//
    set viminfo+=n~/.local/share/vim/viminfo
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
set modeline

set cursorline
highlight CursorLine cterm=bold ctermbg=234
set colorcolumn=80
highlight ColorColumn ctermbg=234

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
set expandtab
set copyindent
set preserveindent
set autoindent
set smartindent

set winheight=8
set winminheight=8

set list
set listchars=tab:→\ ,trail:·,extends:»,precedes:«

set mouse=a

nnoremap <Space> za
nmap , :

set foldmethod=syntax
set foldlevelstart=99

if has('nvim')
    set clipboard+=unnamedplus
endif

execute "digraphs as " . 0x2090
execute "digraphs es " . 0x2091
execute "digraphs hs " . 0x2095
execute "digraphs is " . 0x1D62
execute "digraphs ks " . 0x2096
execute "digraphs ls " . 0x2097
execute "digraphs ms " . 0x2098
execute "digraphs ns " . 0x2099
execute "digraphs os " . 0x2092
execute "digraphs ps " . 0x209A
execute "digraphs rs " . 0x1D63
execute "digraphs ss " . 0x209B
execute "digraphs ts " . 0x209C
execute "digraphs us " . 0x1D64
execute "digraphs vs " . 0x1D65
execute "digraphs xs " . 0x2093

autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \    exe "normal g'\"" |
    \ endif
