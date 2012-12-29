dotdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# set the preferred editor
 export EDITOR=$(which subl)
#if [ -z $EDITOR ]; then
  # export EDITOR=$(which mvim)
#fi
#if [ -z $EDITOR ]; then
  # export EDITOR=$(which vim)
#fi

# source in other dotfiles stuff
source $(dotdir)/.aliases
source $(dotdir)/.private

# Setup BASH completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

# Show the GIT branch and RVM info on the prompt
# export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[00m\]$(__git_ps1 "(%s)")\[\033[31m\]$($HOME/.rvm/bin/rvm-prompt)\[\033[01;32m\]$\[\033[00m\] '
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[00m\]$(__git_ps1 "(%s)")$ '

# Initialize RBENV
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Initialize RVM
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export PATH=$HOME/.dotfiles/scripts:/usr/local/bin:$PATH

# Add mysql path to DYLD_LIBRARY_PATH
 export DYLD_LIBRARY_PATH=/usr/local/mysql/lib
# Add mysql/bin to the path
export PATH=/usr/local/mysql/bin:$PATH

# Ensure that Ruby gems install for the correct architecture
export ARCHFLAGS="-arch x86_64"

export NODE_PATH=$NODE_PATH:/usr/local/lib/node

#export BUNDLER_EDITOR=/usr/local/bin/mine
export BUNDLER_EDITOR="/usr/bin/env subl"

export BUNDLE_DEV=true
export UNITY_PATH="/work/ono/unity"
export UNITY_CRAWL_TEMPLATE_ID="241"



export JRUBY_OPTS="--1.9 -Xcext.enabled=true"
export RBXOPT="-X19"
