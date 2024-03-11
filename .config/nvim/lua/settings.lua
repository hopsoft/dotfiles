-- Globals --
vim.g.NERDTreeDisableSpecialCharacters = 1
vim.g.ackprg = 'rg --hidden --smart-case --vimgrep'
vim.g.airline_powerline_fonts = 1
vim.g.copilot_node_command = vim.fn.system("echo -n $(asdf which node)")
vim.g.indentLine_char_list = {'⏐', '⁞', '⋮', '⠅' }
vim.g.gutentags_enabled = 1
vim.g.gutentags_generate_on_missing = 1
vim.g.gutentags_generate_on_write = 1
vim.g.tagbar_sort = 0

-- Options --
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
vim.opt.foldenable = false
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
