-- Environment

-- Globals
vim.g.NERDTreeDisableSpecialCharacters = 1
vim.g.ackprg = 'rg --vimgrep'
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
vim.g.loaded_perl_provider = 0

-- Functions
function _G.reloadNeovimInit()
  vim.cmd("source " .. vim.fn.expand("$HOME/.dotfiles/.config/nvim/init.lua"))
  print("Neovim configuration reloaded")
end

_G.execChatGPTRun = function(start_line, end_line, args)
  local range_str = start_line .. "," .. end_line
  vim.cmd(string.format("%sChatGPTRun %s", range_str, args))
end

-- Aliases
vim.cmd("command! Reinit lua reloadNeovimInit()")
vim.cmd([[command! Ai ChatGPT]])
vim.cmd([[command! AiAct ChatGPTActAs]])
vim.cmd("command! -range -nargs=* AiRun lua execChatGPTRun(<line1>, <line2>, <f-args>)")
vim.cmd("command! -range AiYard lua execChatGPTRun(<line1>, <line2>, 'yard')")

-- Mappings
vim.api.nvim_set_keymap('i', '<ESC>', 'pumvisible() ? "<C-e>" : "<ESC>"', { expr = true, noremap = true })
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', { noremap = true })
vim.api.nvim_set_keymap('c', '<ESC>', 'pumvisible() ? "<C-e>" : "<ESC>"', { expr = true, noremap = true })
vim.api.nvim_set_keymap('c', 'jk', '<ESC>', { noremap = true })

-- Options
vim.opt.guicursor = {
  "n-v-c:block",
  "i-ci-ve:ver25",
  "r-cr:hor20",
  "o:hor50",
  "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",
  "sm:block-blinkwait175-blinkoff150-blinkon175"
}
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
vim.opt.runtimepath:append('~/.vim')
vim.opt.runtimepath:append('~/.vim/after')
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.timeoutlen = 400
vim.opt.wrap = true

vim.cmd([[autocmd BufWritePre * :%s/\s\+$//e]])
vim.cmd("au BufRead,BufNewFile *.jb setfiletype ruby")
vim.cmd("au FileType javascript setl sw=2 ts=2 expandtab")
vim.cmd("colorscheme gruvbox")
vim.cmd("filetype off")
vim.cmd("hi ColorColumn guibg='#2b2b2b'")
vim.cmd("hi EasyMotionTarget guifg='#ffaf00'")
vim.cmd("syntax enable")
vim.cmd("syntax on")
vim.cmd("syntax sync minlines=256")
vim.cmd('set completeopt+=menuone')
vim.cmd('set completeopt+=noselect')
