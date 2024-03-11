-- Neovim --
function _G.reloadNeovimInit()
  vim.cmd("source " .. vim.fn.expand("$HOME/.dotfiles/.config/nvim/init.lua"))
  print("Neovim configuration reloaded")
end

vim.cmd("au BufRead,BufNewFile *.jb setfiletype ruby")
vim.cmd("au FileType javascript setl sw=2 ts=2 expandtab")
vim.cmd("colorscheme gruvbox")
vim.cmd("command! Reinit lua reloadNeovimInit()")
vim.cmd("filetype off")
vim.cmd("hi ColorColumn guibg='#2b2b2b'")
vim.cmd("hi EasyMotionTarget guifg='#ffaf00'")
vim.cmd("syntax enable")
vim.cmd("syntax on")
vim.cmd("syntax sync minlines=256")
vim.cmd('set completeopt+=menuone')
vim.cmd('set completeopt+=noselect')
vim.cmd('autocmd VimEnter,WinEnter,BufWinEnter * setlocal nohlsearch')
vim.cmd([[autocmd BufWritePre * :%s/\s\+$//e]])

-- CoC --
vim.cmd("command! -nargs=0 Fmt execute 'CocCommand prettier.formatFile'")

-- Open AI (jackMort/ChatGPT.nvim') --
_G.execChatGPTRun = function(start_line, end_line, args)
  local range_str = start_line .. "," .. end_line
  vim.cmd(string.format("%sChatGPTRun %s", range_str, args))
end
vim.cmd("command! Ai ChatGPT")
vim.cmd("command! AiAct ChatGPTActAs")
vim.cmd("command! -range -nargs=* AiRun lua execChatGPTRun(<line1>, <line2>, <f-args>)")
vim.cmd("command! -range AiYard lua execChatGPTRun(<line1>, <line2>, 'yardoc')")
vim.cmd([[command! RubyPrefixConstants %s/\s\([A-Z]\)\@=/ ::/g]])
