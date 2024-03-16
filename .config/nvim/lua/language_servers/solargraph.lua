-- INSTALL: gem install solargraph
-- SEE: https://www.andersevenrud.net/neovim.github.io/lsp/configurations/solargraph/

require('lspconfig').solargraph.setup({
  bundlerPath = "bundle",
  checkGemVersion = true,
  commandPath = "solargraph",
  completion = true,
  definitions = true,
  diagnostics = true,
  externalServer = { host = "localhost", port = 7658 },
  folding = true,
  formatting = true,
  hover = true,
  logLevel = "warn",
  references = true,
  rename = true,
  symbols = true,
  transport = "socket",
  useBundler = false,
})
