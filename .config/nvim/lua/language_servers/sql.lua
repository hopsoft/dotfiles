-- INSTALL: asdf install golang X.X.X
--          asdf global golang X.X.X
--          go install github.com/sqls-server/sqls@latest
-- SEE: https://www.andersevenrud.net/neovim.github.io/lsp/configurations/sqlls/

require('lspconfig').sqlls.setup({})
