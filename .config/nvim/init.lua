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

-- load language servers
require("language_servers")

-- configure individual plugins
require("fzf")
require("openai")

-- configure
require("mappings")
require("settings")
require("commands")
