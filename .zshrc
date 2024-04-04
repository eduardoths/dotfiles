
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi


# Exports
. ~/.exports

eval "$(direnv hook zsh)"


# Aliases
. ~/.aliases

# Starship
eval "$(starship init zsh)"


# Zsh plugins
source ${ZSH_PLUGINS}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ${ZSH_PLUGINS}/zsh-history-substring-search/zsh-history-substring-search.zsh
source ${ZSH_PLUGINS}/zsh-autosuggestions/zsh-autosuggestions.zsh

# Key bindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# rbenv
eval "$(rbenv init -)"
