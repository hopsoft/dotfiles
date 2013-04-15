let mapleader=","

nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>h :nohls<CR>

call pathogen#infect('$HOME/.dotfiles/.vim/bundle')
filetype plugin indent on

colorscheme Tomorrow-Night-Eighties
set rtp+=$GOROOT/misc/vim
syntax enable
syntax on
set background=dark
set number
set encoding=utf-8
set list
set timeoutlen=400
set hidden


"" Whitespace / Indentation
"" set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set listchars=tab:▸\ ,eol:¬,trail:·
set autoindent
set expandtab                   " use spaces, not tabs (optional)
set wrap                        " wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set backspace=indent,eol,start  " backspace through everything in insert mode
set endofline

"" temp file handling
set directory=~/tmp,.,/var/tmp,/tmp
set backupdir=~/tmp,.,~/

