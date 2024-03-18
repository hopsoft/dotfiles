-- SEE: https://www.andersevenrud.net/neovim.github.io/lsp/configurations/tsserver/
-- SEE: ../../../bin/install-language-servers

local tsserver = require('lspconfig').tsserver

tsserver.setup({
  settings = {
    javascript = {
      jsEnable = false,                                                             -- Enable/disable TypeScript language features for JavaScript files (default: true)
      allowJs = true,                                                               -- Enable/disable diagnostic features for JavaScript files (default: true)
      checkJs = false,                                                              -- Enable/disable checking of JavaScript files (default: true)
      autoDiscovery = true,                                                         -- Enable/disable automatic type acquisition for JavaScript files (default: true)
      maxFileSize = 1048576,                                                        -- Specify the maximum file size (in bytes) for automatic type acquisition (default: 1048576)
      maxFiles = 1000,                                                              -- Specify the maximum number of files for automatic type acquisition (default: 1000)
      disableSourceOfProjectReferenceRedirect = false,                              -- Enable/disable reporting errors for code style issues (default: false)
      strictMode = false,                                                           -- Enable/disable strict mode for JavaScript files (default: false)
      moduleDetection = "Node16",                                                   -- Specify the module system to use for JavaScript files (default: "Node16")
      pathMapping = {},                                                             -- Specify the path mapping rules for resolving modules (default: [])
      inlineMapImportedContent = true,                                              -- Enable/disable inlining of imported file contents (default: true)
      useFunctionSyntax = false,                                                    -- Enable/disable strict mode for function types in JavaScript files (default: false)
      includeInlayParameterNameHints = false,                                       -- Enable/disable inclusion of comments in the language service output (default: false)
      includeInlayParameterNameHintsWhenArgumentMatchesName = false,                -- Enable/disable inclusion of parameter name hints in the language service output (default: false)
      includeInlayParameterNameHintsWhenArgumentMatchesNameButNotIdentical = false, -- Enable/disable inclusion of parameter name hints for unused arguments (default: false)
    },
  },
})
