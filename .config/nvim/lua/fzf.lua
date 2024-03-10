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
      delay = 0
    }
  },
  grep = {
    input_prompt = 'Find: ',
    prompt = 'Results: ',
    rg_opts = ' --ignore-case --no-fixed-strings --follow --pretty --vimgrep',
    cwd = find_project_root()
  },
  files = {
    cwd = find_project_root()
  },
  files_ignore = {
    'application.js.map',
    'coverage',
    'node_modules',
    'pkg',
  },
}
