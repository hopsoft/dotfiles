vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Default options for keymaps
local opts = { noremap = true, silent = true }

-- Neovim --
vim.keymap.set('n', 'jk', '<ESC>', opts)
vim.keymap.set('n', '<Leader>h', function()
  vim.opt.hlsearch = not vim.opt.hlsearch:get()
  print('hlsearch: ' .. tostring(vim.opt.hlsearch:get()))
end, opts)

-- CodeCompanion --
vim.keymap.set({ 'n', 'v' }, '<C-a>', '<cmd>CodeCompanionActions<cr>', opts)
vim.keymap.set({ 'n', 'v' }, '<LocalLeader>a', '<cmd>CodeCompanionChat Toggle<cr>', opts)
vim.keymap.set('v', 'ga', '<cmd>CodeCompanionChat Add<cr>', opts)

-- NERDTree --
vim.keymap.set('n', '<Leader>nt', '<cmd>NERDTreeToggle<cr>', opts)
vim.keymap.set('n', '<Leader>nf', '<cmd>NERDTreeFind<cr>', opts)

-- Tagbar --
vim.keymap.set('n', '<Leader>tb', '<cmd>TagbarToggle<cr>', opts)

-- FZF --
vim.keymap.set('n', '<C-p>', function()
  Current.fzf.files()
end, opts)
vim.keymap.set('n', '<Leader>f', function()
  Current.fzf.grep()
end, opts)
