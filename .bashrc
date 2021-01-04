#export ARCHFLAGS="-arch x86_64"

# homebrew ...................................................................................................
if [ -d /opt/homebrew/bin ]; then
  export PATH="/opt/homebrew/bin:$PATH"
fi
if command -v brew &> /dev/null; then
  export BREW_PREFIX=$(brew --prefix)
fi

# editors ....................................................................................................
if command -v nvim &> /dev/null; then
  export EDITOR=$(which nvim)
else
  export EDITOR=$(which vim)
fi
export GIT_EDITOR=$EDITOR
export BUNDLER_EDITOR=$EDITOR

# ruby .......................................................................................................
export BUNDLE_DEV=true

# erlang/elixir ..............................................................................................
export ERL_AFLAGS="-kernel shell_history enabled"

# dotfiles ...................................................................................................
export DOTDIR=$HOME/.dotfiles
export PATH=$PATH:$HOME/.dotfiles/bin

# postgres ...................................................................................................
#PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

# completions ................................................................................................
[ -f "$BREW_PREFIX/etc/profile.d/bash_completion.sh" ] && . "$BREW_PREFIX/etc/profile.d/bash_completion.sh"
if [ -d "$BREW_PREFIX/etc/bash_completion.d/" ]; then
  for bcfile in "$BREW_PREFIX/etc/bash_completion.d/*"; do
    [ -f "$bcfile" ] && . $bcfile
  done
fi

. $DOTDIR/.aliases
if [ -f $HOME/.private ]; then
  . $HOME/.private
fi

ulimit -n 1024
