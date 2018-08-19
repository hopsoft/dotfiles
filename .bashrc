export HOSTNAME=$(hostname)
export DOTDIR=$HOME/.dotfiles
export BREW_PREFIX=$(brew --prefix)

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
. $DOTDIR/.aliases

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export RUBY_PATH=$(rbenv root)/versions/$(rbenv version-name)

if [ -d $HOME/.rvm/bin ]; then
  export PATH=$PATH:$HOME/.rvm/bin
  #export PS1="$(rvm-prompt) $PS1"
fi

if [ -f $HOME/.private ]; then
  . $HOME/.private
fi

export PATH=$HOME/.dotfiles/bin:$PATH
#export DYLD_LIBRARY_PATH=$BREW_PREFIX/mysql/lib
export PATH=$BREW_PREFIX/mysql/bin:$PATH
export ARCHFLAGS="-arch x86_64"
export BUNDLE_DEV=true
export JRUBY_OPTS="--1.9 -Xcext.enabled=true"
export RBXOPT="-X19"
export EDITOR=$BREW_PREFIX/bin/nvim
export GIT_EDITOR=$EDITOR
export BUNDLER_EDITOR=$EDITOR
#export RUBYGEMS_GEMDEPS=-

export GOPATH=~/work/go
export PATH=$GOPATH:$PATH

### Added by the Heroku Toolbelt
#export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$HOME/.rbenv/bin:$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/Library/Android/sdk/tools:$HOME/Library/Android/sdk/platform-tools"

if which exenv > /dev/null; then eval "$(exenv init -)"; fi

export RBENV_ROOT=/usr/local/var/rbenv
eval "$(rbenv init -)"

export ERL_AFLAGS="-kernel shell_history enabled"
