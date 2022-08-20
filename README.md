## Setup a new machine

1. Install desired packages

    ```sh
    git
    tmux
    vim
    zsh
    # etc...
    ```

1. Install oh-my-zsh

  Follow instructions at: https://github.com/robbyrussell/oh-my-zsh

1. Setup dotfiles

    ```sh
    git clone -o github git@github.com:hopsoft/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
    ./bin/symlink_dotfiles
    ```

1. Install plug for vim: https://github.com/junegunn/vim-plug

    Then run `:PlugInstall` after launching neovim.

1. Install Fonts

    ```sh
    git clone -o github https://github.com/powerline/fonts.git ~/work/powerline/fonts
    ~/work/powerline/fonts/install.sh

    git clone -o github https://github.com/ryanoasis/nerd-fonts.git ~/work/ryanoasis/nerd-fonts
    ~/work/ryanoasis/nerd-fonts/install.sh
    ```

1. Setup tmux config: https://github.com/gpakosz/.tmux

    ```sh
    git clone -o github https://github.com/gpakosz/.tmux.git ~/.tmux
    ln -s -f ~/.tmux/.tmux.conf ~/.tmux.conf
    ```
