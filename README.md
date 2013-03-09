# Setup

```
$ cd ~
$ git clone git@github.com:hopsoft/dotfiles.git .dotfiles
$ cd ~/.dotfiles
$ git submodule init
$ git submodule update
$ ./bin/symlink_dotfiles
```

## Add a vim plugin

```
$ cd ~/.dotfiles
$ git submodule add git://github.com/path/to/plugin.git .vim/bundle/plugin_name
```

## Remove a vim plugin

1. Delete the relevant line from the .gitmodules file.
1. Delete the relevant section from .git/config.
1. Run `git rm --cached path/to/submodule` (no trailing slash).
1. Run `rm -rf path/to/submodule`
1. Commit the project.

