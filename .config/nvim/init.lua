package.path = os.getenv("DOTDIR") .. '/.config/nvim/lua/?.lua;' .. package.path
require("plugins")
require("mappings")
require("settings")
require("fzf")

-- require("chatgpt") doesn't work
-- but it can be loaded successfully via dofile
dofile(os.getenv("DOTDIR") .. '/.config/nvim/lua/chatgpt.lua')
