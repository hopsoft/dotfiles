local CodeCompanion = require("codecompanion")
local Adapter = require("codecompanion.adapters")
local Vultr = require("plugins.codecompanion.adapters.vultr")

local adapter = Adapter.extend(Vultr)

CodeCompanion.setup({
  opts = {
    log_level = "DEBUG",
  },

  adapters = {
    vultr = adapter
  },

  strategies = {
    chat = {
      adapter = "vultr",
    },
  },
})
