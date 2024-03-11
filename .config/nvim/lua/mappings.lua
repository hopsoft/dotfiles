vim.g.mapleader = ","

local defaults = {noremap = true, silent = true}

local function map(mode, shortcut, action, opts)
  vim.api.nvim_set_keymap(mode, shortcut, action, opts or defaults)
end

-- Neovim --
map('n', 'jk', '<ESC>') -- escape with jk
map('n', '<Leader>h', ':set hls! hls?<CR>') ----------------- toggle highlighting

-- CoC --
map('n', '<leader>g', ':CocCommand git.foldUnchanged<CR>') -- toggle folding unchanged lines

-- NERDTree --
map('n', '<Leader>nt', ':NERDTreeToggle<CR>') --------------- toggle nerdtree
map('n', '<Leader>nf', ':NERDTreeFind<CR>') ----------------- find file in nerdtree

-- Tagbar --
map('n', '<Leader>tb', ':TagbarToggle<CR>') ----------------- toggle tagbar

-- FZF --
map('n', '<c-P>', '<cmd>lua Current.fzf.files()<CR>') ------- find files
map('n', '<Leader>f', '<cmd>lua Current.fzf.grep()<CR>') ---- search files
