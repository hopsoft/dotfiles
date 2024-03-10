vim.g.mapleader = ","

-- Neovim --
vim.api.nvim_set_keymap('i', 'jk', '<esc>', {}) ----------------------------------------------- escape with jk
vim.api.nvim_set_keymap('n', '<Leader>h', ':set hls! hls?<CR>', { noremap = true }) ------ toggle highlighting

-- NERDTree --
vim.api.nvim_set_keymap('n', '<Leader>nt', ':NERDTreeToggle<CR>', {}) ------------------------ toggle nerdtree
vim.api.nvim_set_keymap('n', '<Leader>nf', ':NERDTreeFind<CR>', {}) -------------------- find file in nerdtree

-- Tagbar --
vim.api.nvim_set_keymap('n', '<Leader>tb', ':TagbarToggle<CR>', {}) ---------------------------- toggle tagbar

-- CoC --
vim.api.nvim_set_keymap( -------------------------------------------------------------- preview markdown files
  'n',
  '<leader>vm',
  ':CocCommand markdown-preview-enhanced.openPreview<CR>',
  {noremap = true, silent = true}
)

-- FZF --
vim.api.nvim_set_keymap('n', '<c-P>', '<cmd>lua require("fzf-lua").files()<CR>', {}) -------------- find files
vim.api.nvim_set_keymap('n', '<Leader>f', '<cmd>lua require("fzf-lua").grep()<CR>', {}) --------- search files
