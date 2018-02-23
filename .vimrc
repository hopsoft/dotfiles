let mapleader=","

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

set guifont=Meslo\ LG\ M\ for\ Powerline:h15
set cursorline
highlight ColorColumn guibg='#2b2b2b'
hi EasyMotionTarget guifg='#ffaf00'
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

call pathogen#infect('$HOME/.dotfiles/.vim/bundle/{}')
filetype plugin on
filetype plugin indent on

set autoread
set background=dark
set number
set encoding=utf-8
set timeoutlen=400
set hidden
set colorcolumn=111
set noautochdir
set shell=/bin/bash

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

" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to reload them.
filetype off
set runtimepath+=$GOROOT/misc/vim

set tags=./tags,tags,$RUBY_PATH/lib/ruby/tags
"set tags=./tags
set complete-=i

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

"let g:syntastic_javascript_checkers = ['eslint']
"let g:ale_javascript_eslint_use_global=1
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'

" Enable rufo (ruby formatting on file save)
let g:rufo_auto_formatting=0

set completefunc=emoji#complete
syntax enable
syntax on
colorscheme Tomorrow-Night-Eighties
set conceallevel=0
