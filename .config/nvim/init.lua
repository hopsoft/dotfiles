vim.opt.runtimepath:append('~/.vim')
vim.opt.runtimepath:append('~/.vim/after')

vim.g.mapleader = ","

vim.cmd [[call plug#begin('~/.vim/plugged')]]
vim.cmd [[Plug 'MunifTanjim/nui.nvim']]
vim.cmd [[Plug 'Xuyuanp/nerdtree-git-plugin']]
vim.cmd [[Plug 'airblade/vim-gitgutter']]
vim.cmd [[Plug 'chriskempson/base16-vim']]
vim.cmd [[Plug 'easymotion/vim-easymotion']]
vim.cmd [[Plug 'github/copilot.vim']]
vim.cmd [[Plug 'godlygeek/tabular']]
vim.cmd [[Plug 'ibhagwan/fzf-lua', {'branch': 'main'}]]
vim.cmd [[Plug 'jackMort/ChatGPT.nvim']]
vim.cmd [[Plug 'junegunn/vim-emoji']]
vim.cmd [[Plug 'ludovicchabant/vim-gutentags']]
vim.cmd [[Plug 'majutsushi/tagbar']]
vim.cmd [[Plug 'morhetz/gruvbox']]
vim.cmd [[Plug 'neoclide/coc.nvim', {'branch': 'release'}]]
vim.cmd [[Plug 'nvim-lua/plenary.nvim']]
vim.cmd [[Plug 'nvim-lua/plenary.nvim']]
vim.cmd [[Plug 'nvim-telescope/telescope.nvim']]
vim.cmd [[Plug 'nvim-tree/nvim-web-devicons']]
vim.cmd [[Plug 'rizzatti/dash.vim']]
vim.cmd [[Plug 'ryanoasis/vim-devicons']]
vim.cmd [[Plug 'scrooloose/nerdcommenter']]
vim.cmd [[Plug 'scrooloose/nerdtree']]
vim.cmd [[Plug 'sjl/vitality.vim']]
vim.cmd [[Plug 'terryma/vim-multiple-cursors']]
vim.cmd [[Plug 'tpope/vim-dotenv']]
vim.cmd [[Plug 'tpope/vim-endwise']]
vim.cmd [[Plug 'tpope/vim-fugitive']]
vim.cmd [[Plug 'tpope/vim-rails']]
vim.cmd [[Plug 'vim-airline/vim-airline']]
vim.cmd [[Plug 'vim-scripts/restore_view.vim']]
vim.cmd [[Plug 'w0rp/ale']]
vim.cmd [[Plug 'wincent/terminus']]
vim.cmd [[Plug 'yggdroot/indentline']]
vim.cmd [[Plug 'zorab47/procfile.vim']]
vim.cmd [[call plug#end()]]

vim.api.nvim_set_keymap('i', 'jk', '<esc>', {})
vim.api.nvim_set_keymap('n', '<F5>', '<Plug>(lcn-menu)', {})
vim.api.nvim_set_keymap('n', 'K', '<Plug>(lcn-hover)', { silent = true })
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(lcn-definition)', { silent = true })
vim.api.nvim_set_keymap('n', '<Leader>f', '<cmd>lua require("fzf-lua").grep()<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>fd', ':cd %:p:h<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>h', ':nohls<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>nf', ':NERDTreeFind<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>nt', ':NERDTreeToggle<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>tb', ':TagbarToggle<CR>', {})
vim.api.nvim_set_keymap('n', '<c-P>', '<cmd>lua require("fzf-lua").files()<CR>', {})
vim.api.nvim_set_keymap('v', '<Leader>fh', ':Tab /\\w:\\zs/r0l1l0<CR>', {})

if vim.fn.has('nvim') == 1 then
  vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {})
end

vim.cmd('set completeopt+=menuone')
vim.cmd('set completeopt+=noselect')
vim.opt.autochdir = false
vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.background = 'dark'
vim.opt.backspace = 'indent,eol,start'
vim.opt.backupdir = '/tmp/editor'
vim.opt.colorcolumn = '111'
vim.opt.complete:remove('i')
vim.opt.completefunc = 'emoji#complete'
vim.opt.completeopt:remove('insert')
vim.opt.conceallevel = 0
vim.opt.cursorline = true
vim.opt.dir = '/tmp/editor'
vim.opt.encoding = 'utf-8'
vim.opt.endofline = true
vim.opt.expandtab = true
vim.opt.guifont = 'MesloLGM\\ Nerd\\ Font:h14'
vim.opt.hidden = true
vim.opt.lazyredraw = true
vim.opt.list = true
vim.opt.listchars:append({ tab = '▸\\ ', eol = '¬', trail = '·' })
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.timeoutlen = 400
vim.opt.wrap = true

vim.env.NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
vim.g.ackprg = 'ag --vimgrep'
vim.g.airline_powerline_fonts = 1
vim.g.ale_fix_on_save = 1
vim.g.ale_fixers = {
  javascript = {'prettier-standard'},
  ruby = {'standardrb'},
}
vim.g.ale_javascript_prettier_options = '--single-quote --trailing-comma es5'
vim.g.ale_lint_delay = 1500
vim.g.ale_lint_on_text_changed = 'never'
vim.g.ale_linters = {
  javascript = {'prettier-standard'},
  ruby = {'standardrb'},
}
vim.g.indentLine_char_list = {'┊', '¦'}
vim.g.gruvbox_contrast_dark = 'soft'
vim.g.gutentags_enabled = 1
vim.g.mix_format_on_save = 0
vim.g.tagbar_type_ruby = {
  kinds = {
    'm:modules',
    'c:classes',
    'd:describes',
    'C:contexts',
    'f:methods',
    'F:singleton methods'
  }
}
vim.g.vim_markdown_folding_disabled = 1
vim.g.vim_vue_plugin_load_full_syntax = 1
vim.g.webdevicons_enable = 1
vim.g.webdevicons_enable_airline_statusline = 1
vim.g.webdevicons_enable_airline_tabline = 1
vim.g.webdevicons_enable_ctrlp = 1
vim.g.webdevicons_enable_nerdtree = 1
vim.g.WebDevIconsNerdTreeGitPluginForceVAlign = 1
vim.g.python3_host_prog = '$BREW_PREFIX/bin/python3'

vim.cmd [[au BufRead,BufNewFile *.jb setfiletype ruby]]
vim.cmd [[au FileType javascript setl sw=2 ts=2 expandtab]]
vim.cmd [[autocmd BufWritePre * :%s/\\s\\+$//e]]
vim.cmd [[colorscheme gruvbox]]
vim.cmd [[filetype off]]
vim.cmd [[hi EasyMotionTarget guifg='#ffaf00']]
vim.cmd [[highlight ColorColumn guibg='#2b2b2b']]
vim.cmd [[syntax enable]]
vim.cmd [[syntax on]]
vim.cmd [[syntax sync minlines=256]]

require('chatgpt').setup({
  openai_params = {
    max_tokens = 600,
    temperature = 0.3
  },

  chat = {
    sessions_window = {
      win_options = {
        winhighlight = 'Normal:NormalFloat,FloatingBorder:FloatBorder'
      }
    }
  },

  popup_window = {
    win_options = {
      winhighlight = 'Normal:NormalFloat,FloatingBorder:FloatBorder'
    }
  },

  popup_input = {
    submit = '<C-s>',
    win_options = {
      winhighlight = 'Normal:DiagnosticOk,FloatingBorder:FloatBorder'
    }
  },

  settings_window = {
    win_options = {
      winhighlight = 'Normal:NormalFloat,FloatingBorder:FloatBorder'
    }
  },

  predefined_chat_gpt_prompts = 'https://raw.githubusercontent.com/hopsoft/dotfiles/main/openai/chat/prompts.csv',

  actions_paths = {
    os.getenv('DOTDIR') .. '/openai/chat/actions/fun.json',
    os.getenv('DOTDIR') .. '/openai/chat/actions/rails.json',
    os.getenv('DOTDIR') .. '/openai/chat/actions/ruby.json'
  }
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
    rg_opts = '--line-number --no-heading --color=always --smart-case --follow --vimgrep'
  }
}
