let mapleader=","

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'cespare/vim-toml'
Plug 'chriskempson/base16-vim'
Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plug 'easymotion/vim-easymotion'
Plug 'elixir-editors/vim-elixir'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'junegunn/vim-emoji'
Plug 'kchmck/vim-coffee-script'
Plug 'kien/ctrlp.vim'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-mix-format'
Plug 'mileszs/ack.vim'
Plug 'morhetz/gruvbox'
Plug 'mustache/vim-mustache-handlebars'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rizzatti/dash.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sjl/vitality.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-dotenv'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
Plug 'wincent/terminus'
call plug#end()

inoremap jk <esc>
nmap K <Plug>(devdocs-under-cursor)
nnoremap <Leader>fd :cd %:p:h<CR>
nnoremap <Leader>h :nohls<CR>
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>tb :TagbarToggle<CR>
vnoremap <Leader>fh :Tab /\w:\zs/r0l1l0<CR>

if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

set autoindent
set autoread
set background=dark
set backspace=indent,eol,start " backspace through everything in insert mode
set backupdir=/tmp/editor
set colorcolumn=111
set complete-=i
set completefunc=emoji#complete
set conceallevel=0
set cursorline
set dir=/tmp/editor
set encoding=utf-8
set endofline
set expandtab " use spaces, not tabs (optional)
set guifont=Meslo\ LG\ M\ for\ Powerline:h15
set hidden
set lazyredraw
set lcs+=space:· " show dot for whitespaces
set list
set listchars=tab:▸\ ,eol:¬,trail:·
set noautochdir
set number
set shell=/bin/bash
set tabstop=2 shiftwidth=2 " a tab is two spaces (or set this to 4)
set tags=.tags
set timeoutlen=400
set wrap " wrap lines

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let g:ackprg = 'ag --vimgrep'
let g:airline_powerline_fonts=1
let g:ale_fix_on_save = 1
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier_standard']
let g:ale_fixers['ruby'] = ['standardrb']
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'
let g:ale_linters = {}
let g:ale_linters['javascript'] = ['']
let g:ale_linters['ruby'] = ['standardrb']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git$|tmp|cache|node_modules)',
  \ 'file': '\v[\/](\.so\|\.dat|\.tags|tags|\.DS_Store)$'
  \ }
let g:ctrlp_follow_symlinks=1
let g:ctrlp_match_window=''
let g:ctrlp_max_depth=100
let g:ctrlp_max_files=0
let g:ctrlp_working_path_mode=''
let g:gruvbox_contrast_dark='soft'
let g:mix_format_on_save = 0
let g:vim_markdown_folding_disabled=1
let g:vim_vue_plugin_load_full_syntax = 1

au FileType javascript setl sw=2 ts=2 expandtab
autocmd BufWritePre * :%s/\s\+$//e " remove trailing whitespace on save
colorscheme gruvbox
filetype off " Clear filetype flags before changing runtimepath to force Vim to reload them
hi EasyMotionTarget guifg='#ffaf00'
highlight ColorColumn guibg='#2b2b2b'
syntax enable
syntax on
syntax sync minlines=256
