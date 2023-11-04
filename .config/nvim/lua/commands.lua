function _G.reloadNeovimInit()
  vim.cmd("source " .. vim.fn.expand("$HOME/.dotfiles/.config/nvim/init.lua"))
  print("Neovim configuration reloaded")
end

_G.execChatGPTRun = function(start_line, end_line, args)
  local range_str = start_line .. "," .. end_line
  vim.cmd(string.format("%sChatGPTRun %s", range_str, args))
end

vim.cmd("command! Reinit lua reloadNeovimInit()")
vim.cmd("command! Ai ChatGPT")
vim.cmd("command! AiAct ChatGPTActAs")
vim.cmd("command! -range -nargs=* AiRun lua execChatGPTRun(<line1>, <line2>, <f-args>)")
vim.cmd("command! -range AiYard lua execChatGPTRun(<line1>, <line2>, 'yard')")
vim.cmd([[command! RubyPrefixConstants %s/\s\([A-Z]\)\@=/ ::/g]])
