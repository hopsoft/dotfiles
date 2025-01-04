require('nvim-treesitter.configs').setup({
  ensure_installed = {
    "markdown",
    "markdown_inline",
  },

  highlight = {
    enable = true,
  },

  indent = {
    enable = true,
  },
})