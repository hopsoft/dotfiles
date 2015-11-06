let mapleader=","

nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>h :nohls<CR>
nnoremap <Leader>fd :cd %:p:h<CR>
vnoremap <Leader>fh :Tab /\w:\zs/r0l1l0<CR>

call pathogen#infect('$HOME/.dotfiles/.vim/bundle/{}')
filetype plugin indent on

colorscheme Tomorrow-Night-Eighties
syntax enable
syntax on
set background=dark
set number
set encoding=utf-8
set timeoutlen=400
set hidden
set colorcolumn=120
set noautochdir
set shell=/bin/bash


"" Whitespace / Indentation
"" set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set listchars=tab:▸\ ,eol:¬,trail:·
set list
set autoindent
set expandtab                   " use spaces, not tabs (optional)
set wrap                        " wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
au FileType javascript setl sw=2 ts=2 expandtab
set backspace=indent,eol,start  " backspace through everything in insert mode
set endofline

"" temp file handling
set dir=/tmp/editor
set backupdir=/tmp/editor

filetype plugin on

" remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to reload them.
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on

set tags=./tags,tags,$RUBY_PATH/lib/ruby/tags
"set tags=./tags
set complete-=i

let g:vim_markdown_folding_disabled=1
let g:airline_powerline_fonts=1

