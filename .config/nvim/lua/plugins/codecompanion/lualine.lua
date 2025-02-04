local codecompanion = require("codecompanion")
local highlight = require('lualine.highlight')

local M = require("lualine.component"):extend()

function M:init(options)
  M.super.init(self, options)

  self.STYLE = highlight.create_component_highlight_group('WarningMsg', 'spinner', self.options)
  self.SYMBOLS = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" }
  self.SIZE = #self.SYMBOLS
  self.index = 1
  self.active = false

  local group = vim.api.nvim_create_augroup("CodeCompanionHooks", {})

  vim.api.nvim_create_autocmd({ "User" }, {
    pattern = "CodeCompanionRequest*",
    group = group,
    callback = function(request)
      if request.match == "CodeCompanionRequestStarted" then
        self.active = true
      elseif request.match == "CodeCompanionRequestFinished" then
        self.active = false
      end
    end,
  })
end

function M:current_chat()
  return codecompanion.buf_get_chat(vim.api.nvim_get_current_buf()) or {
    adapter = {
      name = "Adapter Name",
      parameters = { model = "model-name" },
    },
  }
end

function M:next_symbol()
  self.index = (self.index % self.SIZE) + 1
  return self.SYMBOLS[self.index]
end

function M:update_status()
  if self.active then
    local chat = self:current_chat()
    local msg = self:next_symbol() .. " " .. chat.adapter.name .. " " .. chat.adapter.parameters.model
    return highlight.component_format_highlight(self.STYLE) .. msg
  else
    return nil
  end
end

return M
