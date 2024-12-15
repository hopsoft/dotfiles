-- SEE: https://www.andersevenrud.net/neovim.github.io/lsp/configurations/tsserver/
-- SEE: ../../../bin/install-language-servers

Current.lsp.config.ts_ls.setup({
  --on_attach = function(client)
  --client.resolved_capabilities.document_formatting = false
  --client.resolved_capabilities.document_range_formatting = false
  --end,
  handlers = {
    ["textDocument/publishDiagnostics"] = function() end
  },
  settings = {
    javascript = {
      allowJs = true,                                                               -- Enable/disable diagnostic features for JavaScript files (default: true)
      autoDiscovery = true,                                                         -- Enable/disable automatic type acquisition for JavaScript files (default: true)
      checkJs = true,                                                               -- Enable/disable checking of JavaScript files (default: true)
      diagnostics = { enable = false },
      disableSourceOfProjectReferenceRedirect = false,                              -- Enable/disable reporting errors for code style issues (default: false)
      format = { enable = false },
      includeInlayParameterNameHints = false,                                       -- Enable/disable inclusion of comments in the language service output (default: false)
      includeInlayParameterNameHintsWhenArgumentMatchesName = false,                -- Enable/disable inclusion of parameter name hints in the language service output (default: false)
      includeInlayParameterNameHintsWhenArgumentMatchesNameButNotIdentical = false, -- Enable/disable inclusion of parameter name hints for unused arguments (default: false)
      inlineMapImportedContent = true,                                              -- Enable/disable inlining of imported file contents (default: true)
      jsEnable = true,                                                              -- Enable/disable TypeScript language features for JavaScript files (default: true)
      maxFileSize = 1048576,                                                        -- Specify the maximum file size (in bytes) for automatic type acquisition (default: 1048576)
      maxFiles = 1000,                                                              -- Specify the maximum number of files for automatic type acquisition (default: 1000)
      moduleDetection = "Node16",                                                   -- Specify the module system to use for JavaScript files (default: "Node16")
      pathMapping = {},                                                             -- Specify the path mapping rules for resolving modules (default: [])
      strictMode = false,                                                           -- Enable/disable strict mode for JavaScript files (default: false)
      useFunctionSyntax = false,                                                    -- Enable/disable strict mode for function types in JavaScript files (default: false)
    },
    typescript = {
      diagnostics = { enable = false },
      format = { enable = false },
      suggestionActions = { enabled = false },
      validate = false,
    },
  },
})
