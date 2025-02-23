local codecompanion = require("codecompanion")
local M = require("lualine.component"):extend()

function M:init(options)
  M.super.init(self, options)

  -- Create highlight group for the spinner
  self.highlight = require('lualine.highlight').create_component_highlight_group(
    { fg = 'yellow' },
    'codecompanion',
    self.options
  )

  -- Spinner configuration
  self.spinner_symbols = {
    "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷"
  }
  self.spinner_index = 1
  self.spinner_symbols_len = #self.spinner_symbols
  self.processing = false
  self.adapter_info = nil
  self.strategy = nil

  -- Create autocommand group for tracking requests
  local group = vim.api.nvim_create_augroup("CodeCompanionLualine", { clear = true })

  -- Track request states
  vim.api.nvim_create_autocmd({ "User" }, {
    pattern = { "CodeCompanionRequest*" },
    group = group,
    callback = function(args)
      if not args or not args.match then return end

      if args.match == "CodeCompanionRequestStarted" then
        self.processing = true
        if args.data then
          self.strategy = args.data.strategy
          if args.data.adapter then
            self.adapter_info = {
              name = args.data.adapter.formatted_name or args.data.adapter.name,
              model = args.data.adapter.model or
                  (args.data.adapter.parameters and args.data.adapter.parameters.model)
            }
          end
        end
      elseif args.match == "CodeCompanionRequestFinished" then
        -- Only reset if it's the same strategy that started
        if args.data and args.data.strategy == self.strategy then
          self.processing = false
          self.adapter_info = nil
          self.strategy = nil
        end
      end

      vim.schedule(function()
        pcall(vim.cmd, "redrawstatus")
      end)
    end,
  })
end

function M:next_symbol()
  self.spinner_index = (self.spinner_index % self.spinner_symbols_len) + 1
  return self.spinner_symbols[self.spinner_index]
end

function M:update_status()
  if not self.processing then
    return nil
  end

  local display = self:next_symbol()
  if self.adapter_info then
    local strategy_indicator = self.strategy and ("[" .. self.strategy .. "] ") or ""
    display = string.format(
      "%s %s%s%s",
      display,
      strategy_indicator,
      self.adapter_info.name,
      self.adapter_info.model and ("<" .. self.adapter_info.model .. ">") or ""
    )
  end

  return require('lualine.highlight').component_format_highlight(self.highlight) .. display
end

return M
