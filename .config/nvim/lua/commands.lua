require("commands.sort_selected_line")                                 -- Sorts visual selection on a single line

vim.cmd("au BufRead,BufNewFile *.jb setfiletype ruby")                 -- Sets filetype to Ruby for .jb files
--vim.cmd("colorscheme gruvbox")                                       -- Sets the colorscheme
vim.cmd("colorscheme nightfox")                                        -- Sets the colorscheme
vim.cmd("filetype on")                                                 -- Turns on filetype detection
vim.cmd("filetype plugin on")                                          -- Enables filetype plugins
vim.cmd("filetype indent on")                                          -- Enables filetype indentation
vim.cmd("hi ColorColumn guibg='#2b2b2b'")                              -- Sets the background color of the color column (used to indicate text width limit)
vim.cmd("hi EasyMotionTarget guifg='#ffaf00'")                         -- Sets the font color for targets of the EasyMotion plugin
vim.cmd("syntax enable")                                               -- Enables syntax highlighting
vim.cmd("syntax on")                                                   -- Turns syntax highlighting on
vim.cmd("syntax sync minlines=512")                                    -- Adjusts syntax highlighting synchronization, useful for large files to avoid glitches
vim.cmd('autocmd VimEnter,WinEnter,BufWinEnter * setlocal nohlsearch') -- Automatically turns off highlight search when entering a window or buffer
vim.cmd('set completeopt+=menuone')                                    -- Adds 'menuone' to completion options, showing the completion menu even for a single match
vim.cmd('set completeopt+=noselect')                                   -- Adds 'noselect' to completion options, preventing automatic selection of the first completion item
vim.cmd([[autocmd BufWritePre * :%s/\s\+$//e]])                        -- Automatically trims trailing whitespace from all lines on buffer write (save)
