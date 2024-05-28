## Setup a new machine

1. Install [Homebrew](https://brew.sh/)

TODOS:

- [ ] Install oh-my-zsh
- [ ] Install asdf with homebrew
- [ ] Install ruby with asdf
- [ ] Install lua with asdf

1. Setup dotfiles

   ```sh
   git clone -o github git@github.com:hopsoft/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ./bin/link-dotfiles
   ```

1. Install packages

   ```sh
   install-everything
   ```

1. Update git config

   ```sh
   git config --global user.name "Your Name"
   git config --global user.email "your-email@example.com"
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
