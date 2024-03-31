-- Open AI (jackMort/ChatGPT.nvim') --
Current.execChatGPTRun = function(start_line, end_line, args)
  local range_str = start_line .. "," .. end_line
  vim.cmd(string.format("%sChatGPTRun %s", range_str, args))
end
vim.cmd("command! Ai ChatGPT")
vim.cmd("command! AiAct ChatGPTActAs")
vim.cmd("command! -range -nargs=* AiRun lua Current.execChatGPTRun(<line1>, <line2>, <f-args>)")
vim.cmd("command! -range AiYard lua Current.execChatGPTRun(<line1>, <line2>, 'yardoc')")
