-- INSTALL: npm i -g vscode-langservers-extracted
-- SEE: ../../../bin/install-language-servers

local cssls = require('lspconfig').cssls

cssls.setup({})
