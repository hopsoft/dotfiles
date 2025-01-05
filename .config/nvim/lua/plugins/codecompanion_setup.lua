local CodeCompanionAdapter = require("codecompanion.adapters")
local Vultr = require("plugins.codecompanion.adapters.vultr")

require("codecompanion").setup({
  opts = {
    log_level = "TRACE",
  },

  adapters = {
    vultr = function()
      return CodeCompanionAdapter.extend(Vultr, {
        schema = {
          model = {
            default = "llama-3.3-70b-instruct"
          }
        }
      })
    end,

    vultr_coder = function()
      return CodeCompanionAdapter.extend(Vultr, {
        schema = {
          model = {
            default = "qwen2.5-coder-32b-instruct"
          }
        }
      })
    end
  },

  strategies = {
    chat = {
      adapter = "vultr_coder",
    },

    inline = {
      adapter = "vultr_coder",
    }
  }
})
