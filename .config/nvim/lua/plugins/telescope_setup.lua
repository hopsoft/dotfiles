require('telescope').setup({
  defaults = {
    theme = "dropdown",
    mappings = {
      i = {
        ['jk'] = require('telescope.actions').close,
        ['<esc>'] = require('telescope.actions').close,
        ['<C-c>'] = require('telescope.actions').close,
        ['<C-j>'] = require('telescope.actions').move_selection_next,
        ['<C-k>'] = require('telescope.actions').move_selection_previous,
      },
      n = {
        ['jk'] = require('telescope.actions').close,
        ['q'] = require('telescope.actions').close,
        ['<esc>'] = require('telescope.actions').close,
        ['j'] = require('telescope.actions').move_selection_next,
        ['k'] = require('telescope.actions').move_selection_previous,
      }
    }
  },
})
