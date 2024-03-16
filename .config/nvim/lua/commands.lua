-- Neovim --
function Current.reloadNeovimInit()
  --vim.cmd("luafile " .. vim.fn.expand("$HOME/.dotfiles/.config/nvim/init.lua"))
  dofile(vim.fn.expand("$HOME/.dotfiles/.config/nvim/init.lua"))
  print("Neovim configuration reloaded")
end

  --if command ~= nil then
    --vim.api.nvim_command(command)
    --local output = vim.fn.systemlist(command)
    --vim.api.nvim_buf_set_lines(vim.fn.bufnr("%"), 0, -1, false, output)
  --end
function Current.lintBuffer()
  local filetype = vim.bo.filetype
  local command = nil
  if filetype == "ruby" then command = "standardrb " .. vim.fn.shellescape(vim.fn.expand("%")) end
  if command == nil then return end

  local output = vim.fn.systemlist(command)
  vim.cmd("botright new")
  vim.api.nvim_buf_set_lines(0, -1, -1, false, output)
end
vim.cmd("command! -nargs=0 Lint lua Current.lintBuffer()")


vim.cmd("au BufRead,BufNewFile *.jb setfiletype ruby")
vim.cmd("au FileType javascript setl sw=2 ts=2 expandtab")
vim.cmd("colorscheme gruvbox")
vim.cmd("command! Reinit lua Current.reloadNeovimInit()")
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

vim.cmd([[command! RubyPrefixConstants %s/\s\([A-Z]\)\@=/ ::/g]])

-- CoC --
vim.cmd("command! -nargs=0 Fmt execute 'CocCommand prettier.formatFile'")

-- Open AI (jackMort/ChatGPT.nvim') --
Current.execChatGPTRun = function(start_line, end_line, args)
  local range_str = start_line .. "," .. end_line
  vim.cmd(string.format("%sChatGPTRun %s", range_str, args))
end
vim.cmd("command! Ai ChatGPT")
vim.cmd("command! AiAct ChatGPTActAs")
vim.cmd("command! -range -nargs=* AiRun lua Current.execChatGPTRun(<line1>, <line2>, <f-args>)")
vim.cmd("command! -range AiYard lua Current.execChatGPTRun(<line1>, <line2>, 'yardoc')")
