Current = {} -- Custom container for global variables across the entire configuration

package.path = os.getenv("HOME") .. '/.config/nvim/lua/?.lua;' .. package.path

-- load plugins
require("plugins")

-- configure individual plugins
require("coc")
require("fzf")
require("openai")

-- configure
require("mappings")
require("settings")
require("commands")
