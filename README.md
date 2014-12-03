# Setup

```sh
cd ~
git clone git@github.com:hopsoft/dotfiles.git .dotfiles
cd ~/.dotfiles
git submodule init
git submodule update
./bin/symlink_dotfiles
```

## Update to latest submodule versions

```sh
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

