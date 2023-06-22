let mapleader=","

call plug#begin('~/.vim/plugged')
Plug 'MunifTanjim/nui.nvim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'easymotion/vim-easymotion'
Plug 'github/copilot.vim'
Plug 'godlygeek/tabular'
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
Plug 'jackMort/ChatGPT.nvim'
Plug 'junegunn/vim-emoji'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-tree/nvim-web-devicons'
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
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/restore_view.vim'
Plug 'w0rp/ale'
Plug 'wincent/terminus'
Plug 'yggdroot/indentline'
Plug 'zorab47/procfile.vim'
call plug#end()

nmap <F5> <Plug>(lcn-menu)
nmap <silent> K <Plug>(lcn-hover)
nmap <silent> gd <Plug>(lcn-definition)
nnoremap <Leader>f <cmd>lua require('fzf-lua').grep()<CR>
nnoremap <Leader>fd :cd %:p:h<CR>
nnoremap <Leader>h :nohls<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>tb :TagbarToggle<CR>
nnoremap <c-P> <cmd>lua require('fzf-lua').files()<CR>
vnoremap <Leader>fh :Tab /\w:\zs/r0l1l0<CR>

if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

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
set expandtab " use spaces, not tabs
set guifont=MesloLGM\ Nerd\ Font:h14
set hidden
set lazyredraw
set lcs+=space:· " show dot for whitespaces
set list
set listchars=tab:▸\ ,eol:¬,trail:·
set noautochdir
set number
set tabstop=2 shiftwidth=2 " a tab is two spaces
set timeoutlen=400
set wrap

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
let g:indentLine_char_list = ['┊', '¦']
let g:gruvbox_contrast_dark='soft'
let g:gutentags_enabled=1
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

" ============================================================================================================
" OpenAI / ChatGPT Setup
" ============================================================================================================
command! Ai ChatGPT
command! Aiact ChatGPTActAs
command! -nargs=* -range Airun :<line1>,<line2>ChatGPTRun <args>

lua << EOF
local os = require("os")
require("chatgpt").setup({
openai_params = {
  max_tokens = 600,
  temperature = 0.3
  },

chat = {
  sessions_window = {
    win_options = {
      winhighlight = "Normal:NormalFloat,FloatingBorder:FloatBorder",
      },
    },
  },

popup_window = {
  win_options = {
    winhighlight = "Normal:NormalFloat,FloatingBorder:FloatBorder",
    },
  },

popup_input = {
  submit = "<C-s>",
  win_options = {
    winhighlight = "Normal:DiagnosticOk,FloatingBorder:FloatBorder",
    },
  },

settings_window = {
  win_options = {
    winhighlight = "Normal:NormalFloat,FloatingBorder:FloatBorder",
    },
  },

predefined_chat_gpt_prompts = "https://raw.githubusercontent.com/hopsoft/dotfiles/main/openai/chat/prompts.csv",

actions_paths = {
  os.getenv("DOTDIR") .. "/openai/chat/actions/fun.json",
  os.getenv("DOTDIR") .. "/openai/chat/actions/rails.json",
  os.getenv("DOTDIR") .. "/openai/chat/actions/ruby.json",
  },
})

require('fzf-lua').setup{
  winopts = {
    preview = {
      delay = 25
    }
  },
  grep = {
    input_prompt = 'Search: ',
    prompt = 'Results: ',
    rg_opts = "--line-number --no-heading --color=always --smart-case --follow --vimgrep"
  }
}
EOF
