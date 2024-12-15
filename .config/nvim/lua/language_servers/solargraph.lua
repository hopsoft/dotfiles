-- SEE: https://www.andersevenrud.net/neovim.github.io/lsp/configurations/solargraph/
-- SEE: ../../../bin/install-language-servers

Current.lsp.config.solargraph.setup({
  capabilities = Current.lsp.capabilities,
  settings = {
    bundlerPath = "bundle",
    checkGemVersion = true,
    commandPath = "solargraph",
    completion = true,
    definitions = true,
    diagnostics = true,
    externalServer = { host = "localhost", port = 7658 },
    folding = true,
    formatting = false,
    hover = true,
    logLevel = "warn",
    references = true,
    rename = true,
    symbols = true,
    transport = "stdio", -- "stdio" | "socket"
    useBundler = false,
  },
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*runfile" },
  callback = function()
    vim.bo.filetype = "ruby"
  end
})
