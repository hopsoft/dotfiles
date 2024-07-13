local supermaven = require("supermaven-nvim")
--local api = require("supermaven-nvim.api")
--api.use_pro()

local settings = {
  keymaps = {
    accept_suggestion = "<Tab>",
    accept_word = "<C-j>",
    clear_suggestion = "<C-]>",
  },
}

supermaven.setup(settings)
