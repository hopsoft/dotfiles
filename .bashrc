CURRENT_DIR=$(ruby -e "puts File.expand_path(File.dirname(__FILE__))")
BREW_PREFIX=$(brew --prefix)

# set the preferred editor
export EDITOR=$(which subl)
if [ -z $EDITOR ]; then
  export EDITOR=$(which mvim)
fi
if [ -z $EDITOR ]; then
  export EDITOR=$(which vim)
fi

source $CURRENT_DIR/.aliases
source $CURRENT_DIR/.private

# Setup BASH completion
if [ -f $BREW_PREFIX/etc/bash_completion ]; then
  source $BREW_PREFIX/etc/bash_completion
fi

# Show the GIT branch and RVM info on the prompt
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[00m\]$(__git_ps1 "(%s)")\[\033[31m\]$($HOME/.rvm/bin/rvm-prompt)\[\033[01;32m\]$\[\033[00m\] '

# Initialize RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export PATH=/usr/local/bin:/usr/bin:$PATH

# Add mysql path to DYLD_LIBRARY_PATH
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH
# Add mysql/bin to the path
export PATH=/usr/local/mysql/bin:$PATH

# Ensure that Ruby gems install for the correct architecture
export ARCHFLAGS="-arch x86_64"

export NODE_PATH=$NODE_PATH:/usr/local/lib/node

#export BUNDLER_EDITOR=/usr/local/bin/mine
export BUNDLER_EDITOR="/usr/bin/env subl"
