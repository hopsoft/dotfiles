-- INSTALL: npm install -g dockerfile-language-server-nodejs
-- SEE: https://www.andersevenrud.net/neovim.github.io/lsp/configurations/dockerls/

require('lspconfig').dockerls.setup({})
