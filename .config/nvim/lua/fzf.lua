local function find_project_root()
  -- Use git to determine the project root
  local output = vim.fn.systemlist('git rev-parse --show-toplevel')
  if vim.v.shell_error == 0 and #output > 0 then
    return output[1]
  else
    -- If no project root found, use the current file's directory
    return vim.fn.expand('%:p:h')
  end
end

require('fzf-lua').setup{
  winopts = {
    preview = {
      delay = 25
    }
  },
  grep = {
    input_prompt = 'Search: ',
    prompt = 'Results: ',
    rg_opts = '--line-number --no-heading --color=always --smart-case --follow --vimgrep',
    cwd = find_project_root()
  },
  files = {
    cwd = find_project_root()
  }
}

vim.api.nvim_set_keymap('n', '<Leader>f', '<cmd>lua require("fzf-lua").grep()<CR>', {})
vim.api.nvim_set_keymap('n', '<c-P>', '<cmd>lua require("fzf-lua").files()<CR>', {})
