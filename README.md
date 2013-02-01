# Setup

```
$ cd ~
$ git clone git@github.com:hopsoft/dotfiles.git .dotfiles
$ cd ~/.dotfiles
$ git submodule init
$ git submodule update
$ ./bin/symlink_dotfiles
```

## Add a VIM plugin

```
$ cd ~/.dotfiles
$ git submodule add git://github.com/path/to/plugin.git .vim/bundle/plugin_name
```
