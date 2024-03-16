-- SEE: https://luals.github.io/#neovim-install
-- SEE: https://www.andersevenrud.net/neovim.github.io/lsp/configurations/sumneko_lua/
-- SEE: ../../../bin/install-language-servers

local handle = io.popen("brew --prefix)/bin/lua-language-server")
local root_path = handle:read("*a")
handle:close()
local binary = root_path.."/bin/macOS/lua-language-server"
local runtime_path = vim.split(package.path, ';')

table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require('lspconfig').lua_ls.setup({
  cmd = {binary, "-E", root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = runtime_path,
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
})
