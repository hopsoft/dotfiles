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

vim.api.nvim_set_keymap('n', '<Leader>f', '<cmd>lua require("fzf-lua").grep()<CR>', {})
vim.api.nvim_set_keymap('n', '<c-P>', '<cmd>lua require("fzf-lua").files()<CR>', {})
