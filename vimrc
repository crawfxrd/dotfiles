set nocompatible

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'

call vundle#end()
filetype plugin indent on

set viminfo+=n~/.vim/viminfo
set title
set hidden
set ruler
set cmdheight=2
set showcmd
set encoding=utf-8
set fileencoding=utf-8
set lazyredraw
set history=50
set backspace=indent,eol,start
set whichwrap+=<,>,h,l,[,]
set nowrap
set cursorline
set colorcolumn=80
set scrolloff=3
set backup
set backupdir=~/.vim/bkp
set directory=~/.vim/tmp

set tabstop=4
set shiftwidth=4
set expandtab
set smartindent autoindent

set list
set listchars=tab:→\ ,trail:·,extends:»,precedes:«

syntax enable
set t_Co=256
set background=dark
colorscheme solarized

