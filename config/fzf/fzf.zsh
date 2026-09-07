# Updated by: GPT-6 (Codex); 文件查找和历史搜索集成。
# FZF integration for Zsh.

if (( $+commands[fzf] )); then
  export FZF_CTRL_R_OPTS='--height=60% --layout=reverse --border'

  # The installer supplies the same fzf binary for Vim and Zsh.
  if (( $+commands[fdfind] )); then
    export FZF_DEFAULT_COMMAND='fdfind --type f --hidden --exclude .git'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND='fdfind --type d --hidden --exclude .git'
  elif (( $+commands[fd] )); then
    export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND='fd --type d --hidden --exclude .git'
  fi
  if autoload -Uz is-at-least && is-at-least 0.48.0 "${$(fzf --version)%% *}"; then
    source <(fzf --zsh)
  elif [[ -r /usr/share/doc/fzf/examples/key-bindings.zsh ]]; then
    source /usr/share/doc/fzf/examples/key-bindings.zsh
  fi
fi
