export ARCHFLAGS="-arch x86_64"

# homebrew
if command -v brew &> /dev/null; then
  export BREW_PREFIX=$(brew --prefix)
fi

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

if [ -f /usr/local/opt/asdf/asdf.sh ]; then
  . /usr/local/opt/asdf/asdf.sh
fi

if [ -f /usr/local/etc/bash_completion.d ]; then
  . /usr/local/etc/bash_completion.d
fi

. $DOTDIR/.aliases
if [ -f $HOME/.private ]; then
  . $HOME/.private
fi

# Ruby C extension notes
#
# - Nokogiri SEE: https://nokogiri.org/tutorials/installing_nokogiri.html#macos
#
# - libv8
#     gem install libv8 -v 'YOUR_VERSION' -- --with-system-v8
#
# - therubyracer
#     brew install v8@3.15
#     bundle config build.libv8 --with-system-v8
#     bundle config build.therubyracer --with-v8-dir=$(brew --prefix v8@3.15)
#     bundle install

# libffi
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/opt/libffi/lib/pkgconfig"

if command -v thefuck &> /dev/null; then
  eval $(thefuck --alias)
fi

if [ -f /Users/nathan/Library/Preferences/org.dystroy.broot/launcher/bash/br ]; then
  . /Users/nathan/Library/Preferences/org.dystroy.broot/launcher/bash/br
fi
PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

# rubymotion
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

ulimit -n 1024
