if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  export PATH="$PATH:$BREW_PREFIX/opt/fzf/bin"
fi

[[ $- == *i* ]] && . "$BREW_PREFIX/opt/fzf/shell/completion.zsh" 2> /dev/null
. "$BREW_PREFIX/opt/fzf/shell/key-bindings.zsh"

export FZF_BASE="$BREW_PREFIX/bin/fzf"
#export FZF_DEFAULT_COMMAND="fd --hidden --type=file --color=never"
#export FZF_DEFAULT_OPTS="--ansi --tabstop=2"
#export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
#export FZF_CTRL_T_OPTS="--preview 'bat --force-colorization --highlight-line 60 {}'"
