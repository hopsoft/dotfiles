package.path = os.getenv("HOME") .. '/.config/nvim/?.lua;' .. package.path
package.path = os.getenv("HOME") .. '/.config/nvim/lua/?.lua;' .. package.path
package.path = os.getenv("HOME") .. '/.config/nvim/lua/commands/?.lua;' .. package.path
package.path = os.getenv("HOME") .. '/.config/nvim/lua/language_servers/?.lua;' .. package.path
package.path = os.getenv("HOME") .. '/.config/nvim/lua/plugins/?.lua;' .. package.path

-- luacheck: globals vim
_G.vim = vim

-- load plugins
require("plugins")

-- load current globals
require("current")

-- configure plugins
-- require("openai")
require("fzf")

-- configure
require("settings")
require("mappings")
require("commands")
require("completions")

-- load language servers
require("language_servers")
