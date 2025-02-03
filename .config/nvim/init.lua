package.path = os.getenv("HOME") .. '/.config/nvim/lua;' .. package.path

-- luacheck: globals vim
_G.vim = vim

require("mappings")
require("plugins")
require("current")
require("filetypes")

require("plugins.codecompanion_setup")
require("plugins.fzf_setup")
require("plugins.gitsigns_setup")
require("plugins.telescope_setup")
require("plugins.treesitter_setup")
require("plugins.lualine_setup")

require("settings")
require("commands")
require("completions")
require("language_servers")
