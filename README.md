# dotfiles

My dotfiles with some [Thor](https://github.com/wycats/thor/wiki) foo to quickly configure a system the way I like it.

*Should work for both Mac and Linux.*

## What the Thor script does

* Installs and/or updates the following applications

  * [homebrew](http://mxcl.github.com/homebrew/) - Mac systems only
  * [git](http://git-scm.com/)
  * [bash-completion](http://bash-completion.alioth.debian.org/)
  * [rvm](http://beginrescueend.com/)
  * [vim(janus)](https://github.com/carlhuda/janus)
  * [macvim](http://code.google.com/p/macvim/) - Mac systems only

* Installs the [Anonymous Pro](http://www.google.com/webfonts/specimen/Anonymous+Pro) programmer's font.

* Downloads the [Solarized](http://ethanschoonover.com/solarized) color schemes to `/path/to/dotfiles/assets`

* Sets up user symlinks for

  * .bashrc - `~/.bashrc -> /path/to/dotfiles/.bashrc`
  * .bash_profile - `~/.bash_profile -> /path/to/dotfiles/.bash_profile`
  * .gitconfig - `~/.gitconfig -> /path/to/dotfiles/.gitconfig`
  * .gitignore - `~/.gitignore -> /path/to/dotfiles/.gitignore`
  * .vimrc.after - `~/.vimrc.after -> /path/to/dotfiles/.vimrc.after`
  * .gvimrc.after - `~/.gvimrc.after -> /path/to/dotfiles/.gvimrc.after`

*All of these operations are non-destructive. Original copies are catalogued as `/path/to/original.old.20120101000000`*



*The caveats being updates for __homebrew__ and __rvm__. Non-destructiveness is determined by the individual application's update operation.*

## Prerequisites

* `git` *[not necessary if you donwload the files manually]*
* `curl`
* `Ruby`
* `bundler`

## Setup

The thor script automates a lot of manual work. It does this transparently with plenty of output to the shell so you know what's happening.

Setup is non-destructive and is safe to run on an existing system. *(See notes above)*

Its easy too.

```
$git clone git@github.com:hopsoft/dotfiles.git
$gem install bundler
$cd /path/to/dotfiles
$bundle
$thor dotfiles:setup
```

**NOTE:** If you aren't me, you will want to change `/path/to/dotfiles/.gitconfig` to hold your personal info.

## Digging deeper

You can run tasks individually. To see what's available, simply run:

```
$thor -T
```

## Contributing

This is the start of something beautiful.
Please fork and submit pull requests. Bug fixes, features, whatever...
