export ARCHFLAGS="-arch x86_64"

# homebrew
export BREW_PREFIX=$(brew --prefix)

# editors
export EDITOR=$BREW_PREFIX/bin/nvim
export GIT_EDITOR=$EDITOR
export BUNDLER_EDITOR=$EDITOR

# ruby
export BUNDLE_DEV=true

# erlang/elixir
export ERL_AFLAGS="-kernel shell_history enabled"

# dotfiles
export DOTDIR=$HOME/.dotfiles
export PATH=$PATH:$HOME/.dotfiles/bin

# postgres
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/11/bin

. /usr/local/opt/asdf/asdf.sh
. /usr/local/etc/bash_completion.d

. $DOTDIR/.aliases
if [ -f $HOME/.private ]; then
  . $HOME/.private
fi
