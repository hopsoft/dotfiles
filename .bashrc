# Setup BASH completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

export DOTDIR=$HOME/.dotfiles
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
# export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# export PS1="$(rvm-prompt) $PS1"
export PATH=$HOME/.dotfiles/bin:$PATH
export PATH=/usr/local/bin:$PATH
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib
export PATH=/usr/local/mysql/bin:$PATH
export ARCHFLAGS="-arch x86_64"
export BUNDLER_EDITOR=/usr/local/bin/mvim
export BUNDLE_DEV=true
export UNITY_PATH="/work/ono/unity"
export UNITY_CRAWL_TEMPLATE_ID="241"
export JRUBY_OPTS="--1.9 -Xcext.enabled=true"
export RBXOPT="-X19"
export EDITOR=/usr/local/bin/mvim
source $DOTDIR/.aliases
source $DOTDIR/.private
zsh
