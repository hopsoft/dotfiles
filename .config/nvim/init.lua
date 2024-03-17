-- luacheck: globals vim
_G.vim = vim

-- Custom container for global variables across the entire configuration
-- Inspired by Rails' CurrentAttributes
Current = {
  brew_prefix = vim.fn.system("brew --prefix"):gsub("[\n\r]+", "")
}

package.path = os.getenv("HOME") .. '/.config/nvim/lua/?.lua;' .. package.path

-- load plugins
require("plugins")

-- load lsp language servers
require("language_servers/bash")
require("language_servers/crystal")
require("language_servers/css")
require("language_servers/docker")
require("language_servers/elixir")
require("language_servers/go")
require("language_servers/html")
require("language_servers/json")
require("language_servers/lua")
require("language_servers/null")
require("language_servers/python")
--require("language_servers/ruby") -- Ruby
require("language_servers/solargraph") -- Ruby
require("language_servers/standardrb") -- Ruby (formatting)
require("language_servers/sql")
require("language_servers/tailwindcss")
require("language_servers/typescript")
require("language_servers/vue")
require("language_servers/yaml")

-- configure individual plugins
require("fzf")
require("openai")

-- configure
require("mappings")
require("settings")
require("commands")
