vim.g.mapleader = ","

vim.api.nvim_set_keymap('i', 'jk', '<esc>', {})
vim.api.nvim_set_keymap('n', '<Leader>h', ':set hls! hls?<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>nf', ':NERDTreeFind<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>nt', ':NERDTreeToggle<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>tb', ':TagbarToggle<CR>', {})

--vim.api.nvim_set_keymap('i', '<ESC>', 'pumvisible() ? "<C-e>" : "<ESC>"', { expr = true, noremap = true })
--vim.api.nvim_set_keymap('i', 'jk', '<ESC>', { noremap = true })
--vim.api.nvim_set_keymap('c', '<ESC>', 'pumvisible() ? "<C-e>" : "<ESC>"', { expr = true, noremap = true })
--vim.api.nvim_set_keymap('c', 'jk', '<ESC>', { noremap = true })
