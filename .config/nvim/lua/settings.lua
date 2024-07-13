---- Gets the latest version of node installed by asdf
local node_path = vim.fn.system("asdf where nodejs"):gsub("%s+$", "")

vim.g.ackprg = 'rg --hidden --smart-case --vimgrep' ------------------ Set ack program to use ripgrep
vim.g.airline_powerline_fonts = 1 ------------------------------------ Enable powerline fonts for airline
vim.g.airline_statusline_ontop = 1 ----------------------------------- Move airline to the top
vim.g.airline_theme = 'jellybeans' ----------------------------------- Set airline theme
vim.g['airline#extensions#tabline#enabled'] = 1 ---------------------- Enable airline tabline
vim.g.copilot_node_command = node_path .. "/bin/node" ---------------- Set Copilot node command
vim.g.gutentags_enabled = 1 ------------------------------------------ Enable gutentags
vim.g.gutentags_generate_on_missing = 1 ------------------------------ Generate tags on missing
vim.g.gutentags_generate_on_write = 1 -------------------------------- Generate tags on write
vim.g.indentLine_char_list = { '⏐', '⁞', '⋮', '⠅' } ------------------ Set indentation line characters

-- Options --
vim.opt.guicursor = { ------------------------------------------------ Set cursor styles for various modes
  "n-v-c:block",
  "i-ci-ve:ver25",
  "r-cr:hor20",
  "o:hor50",
  "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",
  "sm:block-blinkwait175-blinkoff150-blinkon175"
}
vim.opt.autochdir = false -------------------------------------------- Disable auto-changing of the current directory
vim.opt.autoindent = true -------------------------------------------- Enable auto-indentation
vim.opt.autoread = true ---------------------------------------------- Reload files when changed outside of Vim
vim.opt.background = 'dark' ------------------------------------------ Set dark background
vim.opt.backspace = 'indent,eol,start' ------------------------------- Allow backspace over indentation
vim.opt.backupdir = '/tmp/editor' ------------------------------------ Set backup directory
vim.opt.colorcolumn = '121' ------------------------------------------ Highlight column 111
vim.opt.complete:remove('i') ----------------------------------------- Remove insert mode completion
vim.opt.completefunc = 'emoji#complete' ------------------------------ Set completion function to emoji#complete
vim.opt.completeopt:remove('insert') --------------------------------- Remove insert mode completion option
vim.opt.conceallevel = 0 --------------------------------------------- Disable concealing text
vim.opt.cursorline = true -------------------------------------------- Highlight the current line
vim.opt.dir = '/tmp/editor' ------------------------------------------ Set swap file directory
vim.opt.encoding = 'utf-8' ------------------------------------------- Set encoding to UTF-8
vim.opt.endofline = true --------------------------------------------- Ensure end-of-line characters are present
vim.opt.expandtab = true --------------------------------------------- Use spaces instead of tabs
vim.opt.foldenable = false ------------------------------------------- Disable folding
vim.opt.guifont = 'MesloLGM\\ Nerd\\ Font:h14' ----------------------- Set GUI font
vim.opt.hidden = true ------------------------------------------------ Allow switching between unsaved buffers
vim.opt.laststatus = 0 ----------------------------------------------- Disable status line (using airline)
vim.opt.lazyredraw = true -------------------------------------------- Disable redrawing during macros
vim.opt.list = true -------------------------------------------------- Display invisible characters
vim.opt.listchars:append({ tab = '\\ ⇥', eol = '↵', trail = '―' }) --- Set invisible character symbols
vim.opt.number = true ------------------------------------------------ Show line numbers
vim.opt.relativenumber = false --------------------------------------- Disable relative line numbers
vim.opt.runtimepath:append('~/.vim') --------------------------------- Add ~/.vim to runtime path
vim.opt.runtimepath:append('~/.vim/after') --------------------------- Add ~/.vim/after to runtime path
vim.opt.shiftwidth = 2 ----------------------------------------------- Set shift width to 2 spaces
vim.opt.tabstop = 2 -------------------------------------------------- Set tab width to 2 spaces
vim.opt.timeoutlen = 350 --------------------------------------------- Set timeout length to 350ms
vim.opt.wrap = true -------------------------------------------------- Enable line wrapping
