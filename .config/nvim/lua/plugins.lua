local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.local/share/nvim/plugged')

vim.call('plug#end')
Plug('EdenEast/nightfox.nvim')                                                                   -- Customizable theme for neovim with support for lsp
Plug('L3MON4D3/LuaSnip', { ['do'] = 'make install_jsregexp' })                                   -- Snippets plugin
Plug('MeanderingProgrammer/render-markdown.nvim', { ['for'] = { 'markdown', 'codecompanion' } }) -- Markdown rendering
Plug('MunifTanjim/nui.nvim')                                                                     -- UI Component Library
Plug('Xuyuanp/nerdtree-git-plugin')                                                              -- NERDTree with git status
Plug('catppuccin/nvim')                                                                          -- Soothing pastel theme for (Neo)vim
Plug('chriskempson/base16-vim')                                                                  -- Base16 color support
Plug('duane9/nvim-rg')                                                                           -- Fast recursive search
Plug('easymotion/vim-easymotion')                                                                -- Quick navigation (jump to line, word, etc.)
Plug('esensar/nvim-dev-container')                                                               -- Neovim dev container support
Plug('folke/tokyonight.nvim')                                                                    -- Dark Neovim theme written in Lua
Plug('folke/twilight.nvim')                                                                      -- Dims inactive portions of the code you're editing
Plug('godlygeek/tabular')                                                                        -- Quickly align text
Plug('hrsh7th/cmp-buffer')                                                                       -- Completion for buffer words
Plug('hrsh7th/cmp-cmdline')                                                                      -- Completion for command line
Plug('hrsh7th/cmp-nvim-lsp')                                                                     -- Supports more types of completion (LSP)
Plug('hrsh7th/cmp-path')                                                                         -- Completion for filesystem paths
Plug('hrsh7th/nvim-cmp')                                                                         -- Autocompletion plugin with LSP support
Plug('ibhagwan/fzf-lua')                                                                         -- Fuzzy finder
Plug('isobit/vim-caddyfile')                                                                     -- Caddyfile syntax highlighting
Plug('jlcrochet/vim-rbs')                                                                        -- Syntax highlighting and indentation for Ruby Signature (RBS) files
Plug('junegunn/vim-emoji')                                                                       -- Emoji support
Plug('lewis6991/gitsigns.nvim')                                                                  -- Git integration for buffers
Plug('ludovicchabant/vim-gutentags')                                                             -- Automatic tag management
Plug('majutsushi/tagbar')                                                                        -- Display tags in a sidebar
Plug('mg979/vim-visual-multi')                                                                   -- Multiple cursors
Plug('morhetz/gruvbox')                                                                          -- Retro groove color scheme
Plug('neanias/everforest-nvim')                                                                  -- Everforest colour scheme
Plug('neovim/nvim-lspconfig')                                                                    -- Quickstart LSP configs
Plug('nvim-lua/plenary.nvim')                                                                    -- Lua asynchronous programming using coroutines
Plug('nvim-lualine/lualine.nvim')                                                                -- Neovim statusline plugin
Plug('nvim-telescope/telescope.nvim')                                                            -- Fuzzy finder for lists with preview
Plug('nvim-tree/nvim-web-devicons')                                                              -- File type icons
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })                                -- Easy tree-sitter UI usage
Plug('nvimtools/none-ls.nvim')                                                                   -- Inject LSP diagnostics, code actions, etc. with Lua
Plug('olimorris/codecompanion.nvim')                                                             -- In-editor AI power tools
Plug('onsails/lspkind.nvim')                                                                     -- vscode-like pictograms for neovim lsp completion items
Plug('prabirshrestha/vim-lsp')                                                                   -- Async language server protocol plugin for neovim
Plug('rebelot/kanagawa.nvim')                                                                    -- Dark colorscheme inspired by the colors of the famous painting by Katsushika Hokusai
Plug('rizzatti/dash.vim')                                                                        -- Dash documentation search
Plug('scrooloose/nerdcommenter')                                                                 -- Comment/uncomment lines
Plug('scrooloose/nerdtree')                                                                      -- Tree explorer (directory structure, etc.)
Plug('sjl/vitality.vim')                                                                         -- Buffer autosave/restore support
Plug('supermaven-inc/supermaven-nvim')                                                           -- Write code 2x faster with AI
Plug('tpope/vim-dotenv')                                                                         -- Support for .env and Procfile files
Plug('tpope/vim-endwise')                                                                        -- Auto-close code blocks
Plug('tpope/vim-fugitive')                                                                       -- Git integration
Plug('tpope/vim-rails')                                                                          -- Ruby on Rails power tools
Plug('vim-scripts/restore_view.vim')                                                             -- Autosave/restore cursor position and folds
Plug('wincent/terminus')                                                                         -- Enhanced terminal integration (iTerm, tmux)
Plug('yggdroot/indentline')                                                                      -- Visualize indention levels

vim.call('plug#end')
