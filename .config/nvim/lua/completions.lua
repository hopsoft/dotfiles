require('luasnip.loaders.from_snipmate').lazy_load()

local cmp = require('cmp')

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
    ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources(
    {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    },
    { { name = 'buffer' } }
  )
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources(
    { { name = 'git' } }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    { { name = 'buffer' } }
  )
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = { { name = 'buffer' } }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources(
    { { name = 'path' } },
    { { name = 'cmdline' } }
  )
})

-- Set up lspconfig
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Add langauge server capabilities
require('lspconfig')['bashls'].setup({ capabilities = capabilities })
require('lspconfig')['crystalline'].setup({ capabilities = capabilities })
require('lspconfig')['cssls'].setup({ capabilities = capabilities })
require('lspconfig')['elixirls'].setup({ capabilities = capabilities })
require('lspconfig')['gopls'].setup({ capabilities = capabilities })
require('lspconfig')['html'].setup({ capabilities = capabilities })
require('lspconfig')['jsonls'].setup({ capabilities = capabilities })
require('lspconfig')['lua_ls'].setup({ capabilities = capabilities })
require('lspconfig')['pylsp'].setup({ capabilities = capabilities })
require('lspconfig')['ruby_ls'].setup({ capabilities = capabilities })
require('lspconfig')['solargraph'].setup({ capabilities = capabilities })
require('lspconfig')['sqlls'].setup({ capabilities = capabilities })
require('lspconfig')['tailwindcss'].setup({ capabilities = capabilities })
require('lspconfig')['tsserver'].setup({ capabilities = capabilities })
require('lspconfig')['vuels'].setup({ capabilities = capabilities })
require('lspconfig')['yamlls'].setup({ capabilities = capabilities })
