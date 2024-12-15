-- Custom container for global functions and variables across the entire configuration
-- Inspired by Rails' CurrentAttributes

Current = {
  brew_prefix = vim.fn.system("brew --prefix"):gsub("[\n\r]+", ""),

  lsp = {
    config = require('lspconfig'),
    capabilities = require('cmp_nvim_lsp').default_capabilities()
  },

  -- Returns the metadata about the current selection
  selection = function()
    local buffer = vim.api.nvim_get_current_buf()
    local head = { line = vim.fn.line("'<"), column = vim.fn.col("'<") }
    local tail = { line = vim.fn.line("'>"), column = vim.fn.col("'>") }
    local lines = vim.api.nvim_buf_get_lines(buffer, head.line - 1, tail.line, false)
    local selected = {}

    for i = 1, #lines do
      if i == 1 then
        -- first selected entry
        table.insert(selected, string.sub(lines[i], head.column, #lines == 1 and tail.column or #lines[i]))
      elseif i == #lines then
        -- last selected entry
        table.insert(selected, string.sub(lines[i], 1, tail.column))
      else
        -- other selected entries
        table.insert(selected, lines[i])
      end
    end

    return {
      buffer = buffer,
      head = head,
      tail = tail,
      lines = lines,
      selected = selected,
    }
  end,
}
