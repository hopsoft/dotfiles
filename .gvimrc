let mapleader=","
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>h :nohls<CR>

call pathogen#infect('$HOME/.dotfiles/.vim/bundle')

colorscheme Tomorrow-Night-Eighties
set guifont=Anonymous\ Pro:h16
set number
set background=dark
set antialias
set enc=utf-8
set cursorline
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set nolist
set timeoutlen=250
