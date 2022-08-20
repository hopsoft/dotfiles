#export ARCHFLAGS="-arch x86_64"

# homebrew ...................................................................................................
if [ -d /opt/homebrew/bin ]; then
  export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
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

# dotfiles ...................................................................................................
export DOTDIR=$HOME/.dotfiles
export PATH=$PATH:$HOME/.dotfiles/bin

# langs ......................................................................................................

# ruby .......................................................................................................
export BUNDLE_DEV=true
export DISABLE_SPRING=true

# erlang/elixir ..............................................................................................
export ERL_AFLAGS="-kernel shell_history enabled"

# apps .......................................................................................................

# asdf .......................................................................................................
[ -f "$BREW_PREFIX/opt/asdf/asdf.sh" ] && . "$BREW_PREFIX/opt/asdf/asdf.sh"
[ -f "$BREW_PREFIX/opt/asdf/etc/bash_completion.d/asdf.bash" ] && . "$BREW_PREFIX/opt/asdf/etc/bash_completion.d/asdf.bash"

# fzf ........................................................................................................
export FZF_BASE="$BREW_PREFIX/bin/fzf"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# postgres ...................................................................................................
if [ -d /Applications/Postgres.app ]; then
  export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
fi

# completions ................................................................................................
[ -f "$BREW_PREFIX/etc/profile.d/bash_completion.sh" ] && . "$BREW_PREFIX/etc/profile.d/bash_completion.sh"
if [ -d "$BREW_PREFIX/etc/bash_completion.d/" ]; then
  for bcfile in "$BREW_PREFIX/etc/bash_completion.d/*"; do
    [ -f "$bcfile" ] && . $bcfile
  done
fi

# aliases ....................................................................................................
eval $(thefuck --alias)
. $DOTDIR/.aliases
if [ -f $HOME/.private ]; then
  . $HOME/.private
fi

ulimit -n 1024

exec zsh
