export HOSTNAME=$(hostname) export DOTDIR=$HOME/.dotfiles
export BREW_PREFIX=$(brew --prefix)

source $DOTDIR/.aliases

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export RUBY_PATH=$(rbenv root)/versions/$(rbenv version-name)

if [ -d $HOME/.rvm/bin ]; then
  export PATH=$PATH:$HOME/.rvm/bin
  #export PS1="$(rvm-prompt) $PS1"
fi

if [ -f $HOME/.private ]; then
  source $HOME/.private
fi

export PATH=/usr/local/share/npm/bin:$PATH
if [ -d /usr/local/lib/node ]; then
  export NODE_PATH="/usr/local/lib/node"
fi

export PATH=$HOME/.dotfiles/bin:$PATH
#export DYLD_LIBRARY_PATH=$BREW_PREFIX/mysql/lib
export PATH=$BREW_PREFIX/mysql/bin:$PATH
export ARCHFLAGS="-arch x86_64"
export BUNDLE_DEV=true
export UNITY_PATH="/work/ono/unity"
export UNITY_CRAWL_TEMPLATE_ID="241"
export JRUBY_OPTS="--1.9 -Xcext.enabled=true"
export RBXOPT="-X19"
export EDITOR=$BREW_PREFIX/bin/nvim
export GIT_EDITOR=$EDITOR
export BUNDLER_EDITOR=$EDITOR
#export RUBYGEMS_GEMDEPS=-

export GOPATH=~/work/go
export PATH=$GOPATH:$PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$HOME/.rbenv/bin:$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH"

if which exenv > /dev/null; then eval "$(exenv init -)"; fi

export RBENV_ROOT=/usr/local/var/rbenv
eval "$(rbenv init -)"
