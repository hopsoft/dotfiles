-- SEE: https://github.com/standardrb/standard/wiki/IDE:-neovim

Current.lsp.config.standardrb.setup({
  cmd = { 'standardrb', '--lsp' },
  filetypes = { 'ruby' },
})

-- Format Ruby files on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.rb", "*.rake", "*.gemspec", "*.ru" },
  callback = function()
    vim.lsp.buf.format({ async = true })
  end,
})
