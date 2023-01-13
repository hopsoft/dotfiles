let mapleader=","

call plug#begin('~/.vim/plugged')
"Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
"Plug 'ervandew/supertab'
"Plug 'ncm2/ncm2'
"Plug 'roxma/nvim-yarp'
Plug '/opt/homebrew/opt/fzf'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'cespare/vim-toml'
Plug 'chriskempson/base16-vim'
Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plug 'easymotion/vim-easymotion'
Plug 'elixir-editors/vim-elixir'
Plug 'github/copilot.vim'
Plug 'godlygeek/tabular'
Plug 'hashivim/vim-terraform'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/vim-emoji'
Plug 'kchmck/vim-coffee-script'
Plug 'kien/ctrlp.vim'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-mix-format'
Plug 'mileszs/ack.vim'
Plug 'morhetz/gruvbox'
Plug 'mustache/vim-mustache-handlebars'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rizzatti/dash.vim'
Plug 'ryanoasis/vim-devicons'
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
Plug 'yggdroot/indentline'
Plug 'zorab47/procfile.vim'
call plug#end()


"inoremap jk <esc>
nmap <F5> <Plug>(lcn-menu)
nmap <silent> K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
"nmap K <Plug>(devdocs-under-cursor)
nnoremap <Leader>f :FZF!<CR>
nnoremap <Leader>fd :cd %:p:h<CR>
nnoremap <Leader>h :nohls<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>tb :TagbarToggle<CR>
vnoremap <Leader>fh :Tab /\w:\zs/r0l1l0<CR>

if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

"set guifont=Meslo\ LG\ M\ for\ Powerline:h14
"set shell=/opt/homebrew/bin/zsh
"set shellcmdflag=-ic
"set relativenumber
set autoindent
set autoread
set background=dark
set backspace=indent,eol,start " backspace through everything in insert mode
set backupdir=/tmp/editor
set colorcolumn=111
set complete-=i
set completefunc=emoji#complete
set completeopt=noinsert,menuone,noselect
set conceallevel=0
set cursorline
set dir=/tmp/editor
set encoding=utf-8
set endofline
set expandtab " use spaces, not tabs (optional)
set guifont=MesloLGM\ Nerd\ Font:h14
set hidden
set lazyredraw
set lcs+=space:· " show dot for whitespaces
set list
set listchars=tab:▸\ ,eol:¬,trail:·
set noautochdir
set number
set tabstop=2 shiftwidth=2 " a tab is two spaces (or set this to 4)
set timeoutlen=400
set wrap " wrap lines

let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
let g:ackprg = 'ag --vimgrep'
let g:airline_powerline_fonts = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier-standard']
let g:ale_fixers['ruby'] = ['standardrb']
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'
let g:ale_lint_delay = 1500
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {}
let g:ale_linters['javascript'] = ['prettier-standard']
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
let g:indentLine_char_list = ['┊', '¦']
let g:gruvbox_contrast_dark='soft'
let g:gutentags_enabled=1
"let g:LanguageClient_autoStop = 0
"let g:LanguageClient_serverCommands = {
"  \ 'ruby': ['solargraph', 'stdio'],
"  \ 'javascript': ['typescript-language-server', '--stdio'],
"  \ 'terraform': ['terraform-ls', 'serve'],
"  \ 'typescript': ['typescript-language-server', '--stdio']
"\ }
let g:mix_format_on_save = 0
let g:tagbar_type_ruby = {
  \ 'kinds' : [
    \ 'm:modules',
    \ 'c:classes',
    \ 'd:describes',
    \ 'C:contexts',
    \ 'f:methods',
    \ 'F:singleton methods'
  \ ]
\ }
let g:vim_markdown_folding_disabled=1
let g:vim_vue_plugin_load_full_syntax = 1
let g:webdevicons_enable = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_ctrlp = 1
let g:webdevicons_enable_nerdtree = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:python3_host_prog = '$BREW_PREFIX/bin/python3'

"autocmd BufEnter * call ncm2#enable_for_buffer()
"autocmd FileType ruby setlocal omnifunc=LanguageClient#complete

au BufRead,BufNewFile *.jb setfiletype ruby
au FileType javascript setl sw=2 ts=2 expandtab
autocmd BufWritePre * :%s/\s\+$//e " remove trailing whitespace on save
colorscheme gruvbox
filetype off " Clear filetype flags before changing runtimepath to force Vim to reload them
hi EasyMotionTarget guifg='#ffaf00'
highlight ColorColumn guibg='#2b2b2b'
syntax enable
syntax on
syntax sync minlines=256
