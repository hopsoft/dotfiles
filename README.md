## Setup a new machine

1. Install [Homebrew](https://brew.sh/)

1. Setup dotfiles

   ```sh
   git clone -o github git@github.com:hopsoft/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ./bin/symlink_dotfiles
   ```

1. Install packages

   ```sh
   install-everything
   ```

1. Install plug for vim: https://github.com/junegunn/vim-plug

   Then run `:PlugInstall` after launching neovim.

1. Install Fonts

   ```sh
   git clone -o github --depth 1 https://github.com/powerline/fonts.git ~/work/powerline/fonts
   ~/work/powerline/fonts/install.sh

   git clone -o github --depth 1 https://github.com/ryanoasis/nerd-fonts.git ~/work/ryanoasis/nerd-fonts
   ~/work/ryanoasis/nerd-fonts/install.sh
   ```

1. Setup tmux config: https://github.com/gpakosz/.tmux

   ```sh
   git clone --depth 1 -o github https://github.com/gpakosz/.tmux.git ~/.tmux
   ln -s -f ~/.tmux/.tmux.conf ~/.tmux.conf
   ```
