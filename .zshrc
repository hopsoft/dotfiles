# homebrew ...................................................................................................
if [ -d /opt/homebrew/bin ]; then
  export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
fi
if command -v brew &> /dev/null; then
  export BREW_PREFIX=$(brew --prefix)
fi

# completions ................................................................................................
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# asdf .......................................................................................................
[ -f "$BREW_PREFIX/opt/asdf/libexec/asdf.sh" ] && . "$BREW_PREFIX/opt/asdf/libexec/asdf.sh"
[ -f "$BREW_PREFIX/opt/asdf/etc/bash_completion.d" ] && . "$BREW_PREFIX/opt/asdf/etc/bash_completion.d"

# dotfiles ...................................................................................................
export DOTDIR=$HOME/.dotfiles
export PATH=$PATH:$HOME/.dotfiles/bin

# ollama .....................................................................................................
#
# Hardware Specs:
# - Chip: Apple M1 Pro
# - CPU: 10 (8 performance and 2 efficiency)
# - GPU: 16 Cores
# - Memory: 32 GB
# - Disk: 1TB SSD
#
# NOTE: Configure these variables in: /opt/homebrew/opt/ollama/homebrew.mxcl.ollama.plist
#
# GPU and Processing:
# export OLLAMA_FLASH_ATTENTION="1"   # Enable optimized attention mechanism for faster processing
# export OLLAMA_SCHED_SPREAD="1"      # Enables spreading of tasks across all GPUs (DANGER: kills the system while active)

# Memory and Cache:
# export OLLAMA_KV_CACHE_TYPE="q8_0"  # Sets 8-bit quantization for key/value cache to optimize memory usage
# export OLLAMA_MAX_LOADED_MODELS="2" # Maximum number of models to keep loaded in memory
# export OLLAMA_KEEP_ALIVE="4h"       # How long to keep models loaded in memory after last use

# Queue and Processing:
# export OLLAMA_MAX_QUEUE="32"        # Maximum number of requests that can be queued
# export OLLAMA_NUM_PARALLEL="2"      # Number of concurrent model executions allowed

# podman ......................................................................................................
export PODMAN_COMPOSE_WARNING_LOGS=false

# ruby .......................................................................................................
export BUNDLE_DEV=true
export DISABLE_SPRING=true
. $DOTDIR/.ruby.zsh

# erlang/elixir ..............................................................................................
export ERL_AFLAGS="-kernel shell_history enabled"

# env ........................................................................................................
[[ -f $DOTDIR/.aliases ]] && . $HOME/.aliases
[[ -f $HOME/.bat.zsh ]] && . "$HOME/.bat.zsh"
[[ -f $HOME/.fzf.zsh ]] && . "$HOME/.fzf.zsh"

# postgres ...................................................................................................
if [ -d /Applications/Postgres.app ]; then
  #export PATH="/Applications/Postgres.app/Contents/Versions/14/bin:$PATH"
  #export PATH="/Applications/Postgres.app/Contents/Versions/15/bin:$PATH"
  export PATH="/Applications/Postgres.app/Contents/Versions/16/bin:$PATH"
  #export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
fi

# secrets ....................................................................................................
if [ -f $HOME/.private ]; then
  . $HOME/.private
fi

# editors ....................................................................................................
if [[ -f "$HOME/.asdf/shims/nvim" ]]; then
  export EDITOR="$HOME/.asdf/shims/nvim"
else
  if command -v nvim &> /dev/null; then
    export EDITOR=$(which nvim)
  else
    export EDITOR=$(which vim)
  fi
fi
export GIT_EDITOR=$EDITOR
export BUNDLER_EDITOR=$EDITOR

# zsh .........................................................................................................
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

. $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

compaudit | xargs chmod g-w,o-w

# prompt .....................................................................................................
if [[ -n $SSH_CONNECTION ]]; then
  PROMPT="🔐 %{$fg[magenta]%}%n%{$fg[white]%}@%{$fg[magenta]%}%m%{$reset_color%}$PROMPT"
fi
[ -f /.dockerenv ] && PROMPT="$PROMPT🐳 "

ulimit -n 1024

plugins=(
  1password
  asdf
  brew
  bundler
  colored-man-pages
  colorize
  dash
  docker
  docker-compose
  fzf
  gem
  gh
  git
  heroku
  history
  httpie
  iterm2
  macos
  mix
  pip
  python
  rails
  rake-fast
  redis-cli
  ruby
  safe-paste
  tmux
  tmuxinator
  web-search
  yarn
  zsh-autosuggestions
  zsh-interactive-cd
)
