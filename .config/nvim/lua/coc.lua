vim.g.coc_global_extensions = {
  '@yaegassy/coc-nginx',
  'coc-css',
  'coc-docker',
  'coc-html',
  'coc-htmlhint',
  'coc-lua',
  'coc-markdown-preview-enhanced',
  'coc-markdownlint',
  'coc-marketplace',
  'coc-solargraph',
  'coc-svg',
  'coc-tailwindcss',
  'coc-toml',
  'coc-tsserver',
  'coc-webview',
  'coc-xml',
  'coc-yaml',
}

vim.g.coc_settings = {
  solargraph = {
    useBundler = true,
    formatting = true,
  },
}
