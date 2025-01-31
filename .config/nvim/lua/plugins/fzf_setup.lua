Current.fzf = require('fzf-lua')

Current.fzf.setup({
  winopts = {
    preview = {
      delay = 100
    }
  },

  grep = {
    input_prompt = 'Search: ',
    prompt = 'Results: ',
    rg_opts = '--hidden --smart-case --vimgrep --line-number --column',
    cwd = Current.project_root(),
    silent = true
  },

  files = {
    cwd = Current.project_root()
  },
})
