let mapleader="L"
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>h :nohls<CR>

call pathogen#infect('$HOME/.dotfiles/.vim/bundle')

colorscheme Tomorrow-Night-Eighties
syntax enable
set background=dark
set number
set enc=utf-8
set cursorline
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set nolist
set timeoutlen=250

