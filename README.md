## Setup a new machine

1. Install homebrew: http://brew.sh/

    ```sh
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    ```

1. Install desired packages

    ```sh
    brew update
    brew install neovim
    brew install ctags
    brew install tmux
    brew install asdf
    brew install the_silver_searcher
    brew install zsh
    brew install zsh-lovers
    brew install zsh-completions
    brew install zsh-syntax-highlighting
    # etc...
    ```

1. Setup dotfiles

    ```sh
    cd ~
    git clone git@github.com:hopsoft/dotfiles.git .dotfiles
    cd ~/.dotfiles
    ./bin/symlink_dotfiles
    ```

1. Install plug for vim: https://github.com/junegunn/vim-plug

    ```sh
    mkdir -p ~/.vim/autoload
    curl -fLo ~/.vim/autoload https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ```

    Run `:PlugInstall` after launching vim or neovim.

1. Install Powerline fonts: https://github.com/powerline/fonts

    ```sh
    git clone https://github.com/powerline/fonts.git ~/fonts
    ~/fonts/.install.sh
    ```
