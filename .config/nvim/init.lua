package.path = os.getenv("DOTDIR") .. '/.config/nvim/lua/?.lua;' .. package.path 
require("plugins")
require("mappings")
require("settings")
require("chatgpt")
require("fzf")
