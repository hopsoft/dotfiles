-- SEE: https://github.com/nvimtools/none-ls.nvim
-- SEE: ../plugins.lua

local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local prettier_config = {
  arrowParens = "avoid",
  bracketSameLine = true,
  bracketSpacing = true,
  embeddedLanguageFormatting = "auto",
  insertPragma = false,
  jsxSingleQuote = false,
  plugins = {},
  printWidth = 120,
  proseWrap = "preserve",
  quoteProps = "as-needed",
  requirePragma = false,
  semi = false,
  singleAttributePerLine = false,
  singleQuote = true,
  tabWidth = 2,
  trailingComma = "none",
  useTabs = false,
  vueIndentScriptAndStyle = false,
}

local sources = {
  -- Prettier for JavaScript, TypeScript, JSON, CSS, YAML, Markdown
  null_ls.builtins.formatting.prettier.with({ config = prettier_config }),

  -- Prettier with plugins for additional file types
  null_ls.builtins.formatting.prettier.with({
    config = prettier_config,
    extra_filetypes = { "xml", "sql", "nginx", "toml" },
  })
}

null_ls.setup({
  sources = sources,

  -- Configure format on save
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})
