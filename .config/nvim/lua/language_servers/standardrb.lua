-- SEE: https://github.com/standardrb/standard/wiki/IDE:-neovim

vim.opt.signcolumn = "yes"

vim.api.nvim_create_autocmd("FileType", {
  pattern = "ruby",
  group = vim.api.nvim_create_augroup("RubyLSP", { clear = true }),
  callback = function()
    vim.lsp.start {
      name = "standard",
      cmd = { "standardrb", "--lsp" },
    }
  end,
})

-- format ruby files on save with the standard gem
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.builder", "*.erb", "*.gemspec", "*.rake", "*.rb", "*.rbw", "*.rdoc", "*.ru", "*.yaml", "*.yml" },
  callback = function()
    vim.lsp.buf.format({ async = true })
  end,
})
