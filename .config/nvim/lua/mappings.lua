vim.g.mapleader = ","

vim.api.nvim_set_keymap('i', 'jk', '<esc>', {})
vim.api.nvim_set_keymap('n', '<leader>h', ':set hls! hls?<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>nf', ':NERDTreeFind<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>nt', ':NERDTreeToggle<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>tb', ':TagbarToggle<CR>', {})
