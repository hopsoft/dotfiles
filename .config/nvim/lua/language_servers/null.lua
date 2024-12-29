-- SEE: https://github.com/nvimtools/none-ls.nvim
-- SEE: ../plugins.lua

local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local sources = {}

-- Rustywind formatter for Tailwind class sorting
table.insert(sources, null_ls.builtins.formatting.rustywind.with({
  filetypes = { "eex", "erb", "hbs", "heex", "html", "jsx", "php", "svelte", "tsx", "vue" },
  command = "rustywind",
  args = { "--stdin" },
  to_stdin = true
}))

-- HTML/ERB specific formatter with Prettier
table.insert(sources, null_ls.builtins.formatting.prettier.with({
  command = "prettier",
  args = function(params)
    return {
      "--parser", "html",
      "--stdin-filepath", params.fname
    }
  end,
  filetypes = { "eex", "erb", "hbs", "heex", "html", "jsx", "php", "svelte", "tsx", "vue" },
  to_stdin = true
}))

-- Other file types formatter
table.insert(sources, null_ls.builtins.formatting.prettier.with({
  command = "prettier",
  args = function(params)
    return {
      "--parser", params.ft == "javascript" and "babel" or params.ft,
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
      "--stdin-filepath", params.fname
    }
  end,
  filetypes = { "css", "graphql", "javascript", "json", "markdown", "scss", "svg", "typescript", "yaml" },
  to_stdin = true
}))

-- Setup autoformatting
local function format_if_supported(bufnr)
  local filetype = vim.bo[bufnr].filetype
  for _, source in ipairs(sources) do
    if vim.tbl_contains(source.filetypes, filetype) then
      vim.lsp.buf.format({ bufnr = bufnr })
      break
    end
  end
end

local function setup_formatting(client, bufnr)
  if not client.supports_method("textDocument/formatting") then return end

  vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup,
    buffer = bufnr,
    callback = function() format_if_supported(bufnr) end
  })
end

null_ls.setup({
  sources = sources,
  on_attach = setup_formatting
})
