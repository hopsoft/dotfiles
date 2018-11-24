let mapleader=","

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'chriskempson/base16-vim'
Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plug 'easymotion/vim-easymotion'
Plug 'elixir-editors/vim-elixir'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'kchmck/vim-coffee-script'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-mix-format'
Plug 'mileszs/ack.vim'
Plug 'ngmy/vim-rubocop'
Plug 'ruby-formatter/rufo-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sjl/vitality.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
call plug#end()

inoremap jk <esc>
nnoremap <Leader>tb :TagbarToggle<CR>
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>h :nohls<CR>
nnoremap <Leader>fd :cd %:p:h<CR>
vnoremap <Leader>fh :Tab /\w:\zs/r0l1l0<CR>
nmap K <Plug>(devdocs-under-cursor)

" neovim configuration
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

syntax enable
syntax on
colorscheme Tomorrow-Night-Eighties
filetype plugin on

set guifont=Meslo\ LG\ M\ for\ Powerline:h15
"set cursorline
"highlight ColorColumn guibg='#2b2b2b'
hi EasyMotionTarget guifg='#ffaf00'
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

set autoread
set background=dark
set colorcolumn=111
set conceallevel=0
set encoding=utf-8
set hidden
set noautochdir
set number
set shell=/bin/bash
set timeoutlen=400

"" Whitespace / Indentation
"" set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set listchars=tab:▸\ ,eol:¬,trail:·
set lcs+=space:· " show dot for whitespaces
set list
set autoindent
set expandtab                   " use spaces, not tabs (optional)
set wrap                        " wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
au FileType javascript setl sw=2 ts=2 expandtab
set backspace=indent,eol,start  " backspace through everything in insert mode
set endofline
" remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

"" temp file handling
set dir=/tmp/editor
set backupdir=/tmp/editor

set tags=./tags,/
"set complete-=i

let g:vim_markdown_folding_disabled=1
let g:airline_powerline_fonts=1

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

let g:ctrlp_match_window=''
let g:ctrlp_working_path_mode=''
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=50
let g:ctrlp_follow_symlinks=1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git$|tags|doc|tmp|cache|node_modules)',
  \ 'file': '\v[\/](\.so\|\.dat|\.DS_Store)$'
  \ }

let g:ale_linters = {}
let g:ale_linters.javascript = ['eslint']
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_fixers.javascript = ['prettier']
let g:ale_javascript_prettier_use_global = 1
let g:ale_fixers.css = ['prettier']
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'

" SEE: https://blog.schembri.me/post/solargraph-in-vim/
"let g:LanguageClient_serverCommands = {
"  \ 'ruby': ['tcp://localhost:7658']
"  \ }
"let g:LanguageClient_autoStop = 0
"autocmd FileType ruby setlocal omnifunc=LanguageClient#complete
