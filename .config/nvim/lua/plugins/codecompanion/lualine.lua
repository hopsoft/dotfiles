local highlight = require('lualine.highlight')
local M = require("lualine.component"):extend()

M.processing = false
M.spinner_index = 1

--local spinner_symbols = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
local spinner_symbols = { '▙ ', '▛ ', '▜ ', '▟ ' }
local spinner_symbols_len = #spinner_symbols
local spinner_color = "#00BFFF" -- deep sky blue

-- Initializer
function M:init(options)
  M.super.init(self, options)

  self.spinner_highlight = highlight.create_component_highlight_group({ fg = spinner_color }, 'spinner', self.options)

  local group = vim.api.nvim_create_augroup("CodeCompanionHooks", {})

  vim.api.nvim_create_autocmd({ "User" }, {
    pattern = "CodeCompanionRequest*",
    group = group,
    callback = function(request)
      if request.match == "CodeCompanionRequestStarted" then
        self.processing = true
      elseif request.match == "CodeCompanionRequestFinished" then
        self.processing = false
      end
    end,
  })
end

-- Function that runs every time statusline is updated
function M:update_status()
  if self.processing then
    self.spinner_index = (self.spinner_index % spinner_symbols_len) + 1
    return highlight.component_format_highlight(self.spinner_highlight) .. spinner_symbols[self.spinner_index]
  else
    return nil
  end
end

return M
