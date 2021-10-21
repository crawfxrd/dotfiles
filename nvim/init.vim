if !has('nvim')
    set nocompatible
endif

call plug#begin('~/.local/share/nvim/plugins')
Plug 'rust-lang/rust.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'editorconfig/editorconfig-vim'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/vim-vsnip'
Plug 'simrat39/rust-tools.nvim'
call plug#end()

syntax enable
set background=dark

if has('nvim')
    let g:deoplete#enable_at_startup = 1
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
set completeopt=menuone,noinsert,noselect

set cursorline
highlight CursorLine cterm=bold ctermbg=233
set colorcolumn=96
highlight ColorColumn ctermbg=233
set signcolumn=yes
highlight SignColumn ctermbg=233

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

fun! ShowFuncName()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun
map f :call ShowFuncName() <CR>

set exrc

" https://sharksforarms.dev/posts/neovim-rust/
" rust-analyzer config
lua <<EOF
local nvim_lsp = require'lspconfig'

local opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        -- on_attach = on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
}

require('rust-tools').setup(opts)
EOF

" Setup Completion
" See https://github.com/hrsh7th/nvim-cmp#basic-configuration
"lua <<EOF
"local cmp = require'cmp'
"cmp.setup({
"  -- Enable LSP snippets
"  snippet = {
"    expand = function(args)
"        vim.fn["vsnip#anonymous"](args.body)
"    end,
"  },
"  mapping = {
"    ['<C-p>'] = cmp.mapping.select_prev_item(),
"    ['<C-n>'] = cmp.mapping.select_next_item(),
"    -- Add tab support
"    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
"    ['<Tab>'] = cmp.mapping.select_next_item(),
"    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
"    ['<C-f>'] = cmp.mapping.scroll_docs(4),
"    ['<C-Space>'] = cmp.mapping.complete(),
"    ['<C-e>'] = cmp.mapping.close(),
"    ['<CR>'] = cmp.mapping.confirm({
"      behavior = cmp.ConfirmBehavior.Insert,
"      select = true,
"    })
"  },
"
"  -- Installed sources
"  sources = {
"    { name = 'nvim_lsp' },
"    { name = 'vsnip' },
"    { name = 'path' },
"    { name = 'buffer' },
"  },
"})
"EOF
