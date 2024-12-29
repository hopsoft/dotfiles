-- SEE: https://www.andersevenrud.net/neovim.github.io/lsp/configurations/html/
-- SEE: ../../../bin/install-language-servers

Current.lsp.config.html.setup({
  capabilities = Current.lsp.capabilities,
  settings = {
    html = {
      format = {
        enable = false  -- Disable LSP formatting to avoid conflicts with Prettier
      }
    }
  }
})
