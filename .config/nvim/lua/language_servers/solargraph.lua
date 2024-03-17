-- SEE: https://www.andersevenrud.net/neovim.github.io/lsp/configurations/solargraph/
-- SEE: ../../../bin/install-language-servers

local solargraph = require('lspconfig').solargraph

solargraph.setup({
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
  transport = "socket",
  useBundler = false,
})
