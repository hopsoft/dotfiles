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
# HYPHEN_INSENSITIVE="true"

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
# COMPLETION_WAITING_DOTS="true"

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  asdf
  bundler
  colored-man-pages
  dash
  docker
  docker-compose
  fzf
  gem
  git
  heroku
  history
  mix
  osx
  rails
  rake-fast
  redis-cli
  ruby
  safe-paste
  tmux
  web-search
  yarn
  zsh-autosuggestions
)

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

# erlang/elixir ..............................................................................................
export ERL_AFLAGS="-kernel shell_history enabled"

# apps .......................................................................................................

# asdf .......................................................................................................
[ -f "$BREW_PREFIX/opt/asdf/asdf.sh" ] && . "$BREW_PREFIX/opt/asdf/asdf.sh"
[ -f "$BREW_PREFIX/opt/asdf/etc/bash_completion.d/asdf.bash" ] && . "$BREW_PREFIX/opt/asdf/etc/bash_completion.d/asdf.bash"

# fzf ........................................................................................................
export FZF_BASE="$BREW_PREFIX/bin/fzf"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# postgres ...................................................................................................
if [ -d /Applications/Postgres.app ]; then
  export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
fi

# prompt .....................................................................................................
if [[ -n $SSH_CONNECTION ]]; then
  PROMPT="🔐 %{$fg[magenta]%}%n%{$fg[white]%}@%{$fg[magenta]%}%m%{$reset_color%}$PROMPT"
fi
[ -f /.dockerenv ] && PROMPT="$PROMPT🐳 "

# aliases ....................................................................................................
eval $(thefuck --alias)
. $DOTDIR/.aliases
if [ -f $HOME/.private ]; then
  . $HOME/.private
fi
