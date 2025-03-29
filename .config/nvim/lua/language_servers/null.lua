-- SEE: https://github.com/nvimtools/none-ls.nvim
-- SEE: ../plugins.lua

local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting

-- Create formatting augroup
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- Format on save setup
local function setup_format_on_save(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({
          bufnr = bufnr,
          timeout_ms = 1000,
          filter = function(c) return c.name == "null-ls" end
        })
      end,
    })
  end
end

-- Null-ls setup
null_ls.setup({
  sources = {
    -- Rustywind for Tailwind class sorting
    formatting.rustywind.with({
      filetypes = { "eex", "erb", "hbs", "heex", "html", "jsx", "php", "svelte", "tsx", "vue", },
      command = "rustywind",
      args = { "--stdin" },
      to_stdin = true
    }),

    -- Prettier
    formatting.prettier.with({
      filetypes = { "css", "eex", "erb", "graphql", "hbs", "heex", "html", "javascript", "json", "jsx", "markdown", "php", "scss", "svelte", "svg", "tsx", "typescript", "vue", "yaml", },
      prefer_local = "node_modules/.bin",
      args = function(params)
        local parser = params.ft == "javascript" and "babel" or params.ft
        return { "--parser", parser, "--stdin-filepath", params.fname }
      end,
    }),
  },
  on_attach = setup_format_on_save,
  debug = true,
})

vim.api.nvim_create_user_command(
  "FormatInfo",
  function()
    local sources = null_ls.get_sources()
    local ft = vim.bo.filetype
    local available = vim.tbl_filter(
      function(source) return source.filetypes[ft] end,
      sources
    )

    if #available > 0 then
      local formatter_names = vim.tbl_map(function(source) return source.name end, available)
      print(string.format("Available formatters for %s: %s", ft, table.concat(formatter_names, ", ")))
    else
      print(string.format("No formatters available for %s", ft))
    end
  end,
  { desc = "Show available formatters for current file" }
)
