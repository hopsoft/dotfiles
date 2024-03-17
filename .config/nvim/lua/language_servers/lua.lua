-- luacheck: globals vim
-- SEE: https://www.andersevenrud.net/neovim.github.io/lsp/configurations/sumneko_lua/
-- SEE: ../../../bin/install-language-servers

local lua_ls = require('lspconfig').lua_ls

lua_ls.cmd = { Current.brew_prefix .. "/bin/lua-language-server" }

lua_ls.setup({
  Lua = {
    color = { mode = "Semantic" },
    completion = {
      autoRequire = true,
      callSnippet = "Both",
      displayContext = 10,
      enable = true,
      keywordSnippet = "Replace",
      showParams = true,
      workspaceWord = true,
    },
    diagnostics = {
      enable = true,
      globals = { 'vim' }
    },
    hint = {
      enable = true ,
      paramName = true,
    },
    hover = {
      documentation = true,
      enable = true,
      enumsLimit = 10,
      previewFields = 20,
      viewNumber = true,
      viewString = true,
      viewStringMax = 1000,
    },
    signatureHelp = { enable = true },
    telemetry = { enable = false },
    window = { progressBar = true, statusBar = true },
    workspace = {
      checkThirdParty = true,
      ignoreDir = { ".git", ".vscode", "node_modules" },
      ignoreSubmodules = true,
      library = vim.api.nvim_get_runtime_file("", true),
      maxPreload = 1000,
      preloadFileSize = 100,
      useGitIgnore = true,
    },
  },
})
