package.path = os.getenv("HOME") .. '/.config/nvim/lua/language_servers/?.lua;' .. package.path

require("bash")
require("crystal")
require("css")
require("docker")
require("elixir")
require("go")
require("html")
require("json")
require("lua")
require("null")
require("python")
--require("ruby")     -- Ruby
require("solargraph") -- Ruby
require("standardrb") -- Ruby (formatting)
require("sql")
require("tailwindcss")
require("typescript")
require("vue")
require("yaml")
