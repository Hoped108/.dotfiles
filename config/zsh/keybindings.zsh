# Updated by: GPT-6 (Codex); 保留按键，缺少插件时不绑定其 widget。
# Command-line editing and base keybindings.

autoload -Uz edit-command-line
zle -N edit-command-line

# Edit current command line in $EDITOR.
bindkey '^X^E' edit-command-line

# Accept zsh-autosuggestions suggestion.
(( $+widgets[autosuggest-accept] )) && bindkey '^ ' autosuggest-accept

# Up/down search history using the current prefix.
bindkey "\e[A" history-beginning-search-backward
bindkey "\e[B" history-beginning-search-forward
