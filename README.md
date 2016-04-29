## Setup a new machine

1. Install homebrew: http://brew.sh/

    ```sh
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    ```

1. Install desired packages

    ```sh
    brew install postgresql
    brew install macvim
    brew install neovim/neovim/neovim
    brew install ctags
    brew install tmux
    brew install erlang
    brew install exenv
    brew install rbenv
    brew install ruby-build
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
    git submodule init
    git submodule update
    ./bin/symlink_dotfiles
    ```

1. Install pathogen for vim: https://github.com/tpope/vim-pathogen

    ```sh
    mkdir -p ~/.vim/autoload ~/.vim/bundle
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    ```

1. Install Powerline fonts: https://github.com/powerline/fonts

    ```sh
    git clone https://github.com/powerline/fonts.git ~/fonts
    ~/fonts/.install.sh
    ```

## Update to latest submodule versions

```sh
git submodule init
git submodule update
git submodule foreach git pull origin master
```

## Add a vim plugin

```sh
cd ~/.dotfiles
git submodule add git://github.com/path/to/plugin.git .vim/bundle/plugin_name
```

## Remove a vim plugin

1. Delete the relevant line from the .gitmodules file.
1. Delete the relevant section from .git/config.
1. Run `git rm --cached path/to/submodule` (no trailing slash).
1. Run `rm -rf path/to/submodule`
1. Commit the project.

