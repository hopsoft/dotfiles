package.path = os.getenv("HOME") .. '/.config/nvim/?.lua;' .. package.path
package.path = os.getenv("HOME") .. '/.config/nvim/lua/?.lua;' .. package.path
package.path = os.getenv("HOME") .. '/.config/nvim/lua/commands/?.lua;' .. package.path
package.path = os.getenv("HOME") .. '/.config/nvim/lua/language_servers/?.lua;' .. package.path

-- luacheck: globals vim
_G.vim = vim

-- load current globals
require("current")

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
require("completions")
