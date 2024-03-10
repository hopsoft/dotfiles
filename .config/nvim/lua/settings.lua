-- Globals --
vim.g.copilot_node_command = "$HOME/.asdf/installs/nodejs/20.10.0/bin/node"
vim.g.NERDTreeDisableSpecialCharacters = 1
vim.g.ackprg = 'rg --vimgrep'
vim.g.airline_powerline_fonts = 1
vim.g.ale_fix_on_save = 1
vim.g.ale_fixers = {
  javascript = {'prettier'},
  ruby = {'standardrb'},
}
vim.g.ale_javascript_prettier_options =
  '--arrow-parens avoid' ..
  '--embedded-language-formatting auto' ..
  '--html-whitespace-sensitivity css' ..
  '--no-semi' ..
  '--print-width 110' ..
  '--prose-wrap preserve' ..
  '--single-quote' ..
  '--tab-width 2' ..
  '--trailing-comma none'
vim.g.ale_lint_delay = 350
vim.g.ale_linters_ignore = {'erb'} -- TODO: Revisit... ale doesn't handle erb files well
vim.g.ale_lint_on_text_changed = 'normal'
vim.g.ale_linters = {
  javascript = {'prettier'},
  ruby = {'standardrb'},
}
vim.g.indentLine_char_list = {'⏐', '⁞', '⋮', '⠅' }
vim.g.gutentags_enabled = 1
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
