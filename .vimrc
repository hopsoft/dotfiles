let mapleader=","
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>h :nohls<CR>

call pathogen#infect('$HOME/.dotfiles/.vim/bundle')

colorscheme Tomorrow-Night-Eighties
syntax enable
set background=dark
set number
set encoding=utf-8
set cursorline
set nolist
set timeoutlen=400

"" Whitespace / Indentation
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set autoindent
set expandtab                   " use spaces, not tabs (optional)
set wrap                        " wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" temp file handling
set directory=~/tmp,.,/var/tmp,/tmp
set backupdir=~/tmp,.,~/
