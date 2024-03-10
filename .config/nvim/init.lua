package.path = os.getenv("HOME") .. '/.config/nvim/lua/?.lua;' .. package.path

require("plugins")
require("mappings")
require("settings")
require("commands")
require("coc")
require("fzf")
require("openai")
