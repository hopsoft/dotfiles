vim.cmd("call plug#begin('~/.vim/plugged')")

vim.cmd("Plug 'EdenEast/nightfox.nvim'")                                                              -- Customizable theme for neovim with support for lsp
vim.cmd("Plug 'L3MON4D3/LuaSnip', {'do': 'make install_jsregexp'}")                                   -- Snippets plugin
vim.cmd("Plug 'MeanderingProgrammer/render-markdown.nvim', { 'for': ['markdown', 'codecompanion'] }") -- Markdown rendering
vim.cmd("Plug 'MunifTanjim/nui.nvim'")                                                                -- UI Component Library
vim.cmd("Plug 'Xuyuanp/nerdtree-git-plugin'")                                                         -- NERDTree with git status
vim.cmd("Plug 'catppuccin/nvim'")                                                                     -- Soothing pastel theme for (Neo)vim
vim.cmd("Plug 'chriskempson/base16-vim'")                                                             -- Base16 color support
vim.cmd("Plug 'duane9/nvim-rg'")                                                                      -- Fast recursive search
vim.cmd("Plug 'easymotion/vim-easymotion'")                                                           -- Quick navigation (jump to line, word, etc.)
vim.cmd("Plug 'esensar/nvim-dev-container'")                                                          -- Neovim dev container support
vim.cmd("Plug 'folke/tokyonight.nvim'")                                                               -- Dark Neovim theme written in Lua
vim.cmd("Plug 'folke/twilight.nvim'")                                                                 -- Dims inactive portions of the code you're editing
vim.cmd("Plug 'godlygeek/tabular'")                                                                   -- Quickly align text
vim.cmd("Plug 'hrsh7th/cmp-buffer'")                                                                  -- Completion for buffer words
vim.cmd("Plug 'hrsh7th/cmp-cmdline'")                                                                 -- Completion for command line
vim.cmd("Plug 'hrsh7th/cmp-nvim-lsp'")                                                                -- Supports more types of completion (LSP)
vim.cmd("Plug 'hrsh7th/cmp-path'")                                                                    -- Completion for filesystem paths
vim.cmd("Plug 'hrsh7th/nvim-cmp'")                                                                    -- Autocompletion plugin with LSP support
vim.cmd("Plug 'ibhagwan/fzf-lua'")                                                                    -- Fuzzy finder
vim.cmd("Plug 'isobit/vim-caddyfile'")                                                                -- Caddyfile syntax highlighting
vim.cmd("Plug 'jlcrochet/vim-rbs'")                                                                   -- Syntax highlighting and indentation for Ruby Signature (RBS) files
vim.cmd("Plug 'junegunn/vim-emoji'")                                                                  -- Emoji support
vim.cmd("Plug 'lewis6991/gitsigns.nvim'")                                                             -- Git integration for buffers
vim.cmd("Plug 'ludovicchabant/vim-gutentags'")                                                        -- Automatic tag management
vim.cmd("Plug 'majutsushi/tagbar'")                                                                   -- Display tags in a sidebar
vim.cmd("Plug 'mg979/vim-visual-multi'")                                                              -- Multiple cursors
vim.cmd("Plug 'morhetz/gruvbox'")                                                                     -- Retro groove color scheme
vim.cmd("Plug 'neanias/everforest-nvim'")                                                             -- Everforest colour scheme
vim.cmd("Plug 'neovim/nvim-lspconfig'")                                                               -- Quickstart LSP configs
vim.cmd("Plug 'nvim-lua/plenary.nvim'")                                                               -- Lua asynchronous programming using coroutines
vim.cmd("Plug 'nvim-lualine/lualine.nvim'")                                                           -- Neovim statusline plugin
vim.cmd("Plug 'nvim-telescope/telescope.nvim'")                                                       -- Fuzzy finder for lists with preview
vim.cmd("Plug 'nvim-tree/nvim-web-devicons'")                                                         -- File type icons
vim.cmd("Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}")                                -- Easy tree-sitter UI usage
vim.cmd("Plug 'nvimtools/none-ls.nvim'")                                                              -- Inject LSP diagnostics, code actions, etc. with Lua
vim.cmd("Plug 'olimorris/codecompanion.nvim'")                                                        -- AI-powered coding
vim.cmd("Plug 'onsails/lspkind.nvim'")                                                                -- vscode-like pictograms for neovim lsp completion items
vim.cmd("Plug 'prabirshrestha/vim-lsp'")                                                              -- Async language server protocol plugin for neovim
vim.cmd("Plug 'rebelot/kanagawa.nvim'")                                                               -- Dark colorscheme inspired by the colors of the famous painting by Katsushika Hokusai
vim.cmd("Plug 'rizzatti/dash.vim'")                                                                   -- Dash documentation search
vim.cmd("Plug 'scrooloose/nerdcommenter'")                                                            -- Comment/uncomment lines
vim.cmd("Plug 'scrooloose/nerdtree'")                                                                 -- Tree explorer (directory structure, etc.)
vim.cmd("Plug 'sjl/vitality.vim'")                                                                    -- Buffer autosave/restore support
vim.cmd("Plug 'supermaven-inc/supermaven-nvim'")                                                      -- Write code 2x faster with AI
vim.cmd("Plug 'tpope/vim-dotenv'")                                                                    -- Support for .env and Procfile files
vim.cmd("Plug 'tpope/vim-endwise'")                                                                   -- Auto-close code blocks
vim.cmd("Plug 'tpope/vim-fugitive'")                                                                  -- Git integration
vim.cmd("Plug 'tpope/vim-rails'")                                                                     -- Ruby on Rails power tools
vim.cmd("Plug 'vim-scripts/restore_view.vim'")                                                        -- Autosave/restore cursor position and folds
vim.cmd("Plug 'wincent/terminus'")                                                                    -- Enhanced terminal integration (iTerm, tmux)
vim.cmd("Plug 'yggdroot/indentline'")                                                                 -- Visualize indention levels

vim.cmd("call plug#end()")
