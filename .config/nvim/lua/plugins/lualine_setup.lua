require('lualine').setup({
  theme = "nightfly",
  sections = {
    lualine_c = {
      require("plugins.codecompanion.lualine")
    }
  }
})
