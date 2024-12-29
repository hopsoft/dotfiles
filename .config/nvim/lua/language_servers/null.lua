-- SEE: https://github.com/nvimtools/none-ls.nvim
-- SEE: ../plugins.lua

local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local sources = {
  -- Single Prettier configuration for all file types
  null_ls.builtins.formatting.prettier.with({
    extra_args = {
      "--arrow-parens", "avoid",
      "--bracket-same-line", "true",
      "--bracket-spacing", "false",
      "--embedded-language-formatting", "auto",
      "--end-of-line", "lf",
      "--html-whitespace-sensitivity", "css",
      "--jsx-single-quote", "true",
      "--print-width", "120",
      "--prose-wrap", "preserve",
      "--quote-props", "as-needed",
      "--semi", "false",
      "--single-quote", "true",
      "--tab-width", "2",
      "--trailing-comma", "none",
      "--use-tabs", "false",
      "--vue-indent-script-and-style", "false",
      "--xml-quote-attributes", "single",
      "--xml-whitespace-sensitivity", "ignore",
      "--plugin", "@prettier/plugin-xml",
      "--plugin", "prettier-plugin-tailwindcss"
    },
    extra_filetypes = { "erb", "nginx", "sql", "toml", "xml", "html", "svg" },
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
