# Updated by: GPT-6 (Codex); 保留单次 compinit，支持工具补全缓存。
# Unified Zsh completion initialization.

# initialize compinit
autoload -Uz compinit

typeset -g _zsh_cache_dir="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"

[[ -d "$_zsh_cache_dir" ]] ||
  command mkdir -p "$_zsh_cache_dir"

_zsh_init_completion() {
  emulate -L zsh
  setopt extended_glob

  local dump="$_zsh_cache_dir/.zcompdump"

  # Full security/directory check once every 24 hours.
  if (( ${_zsh_completion_cache_changed:-0} )) ||
     [[ ! -s "$dump" || -n ${~dump}(#qN.mh+24) ]]; then
    compinit -d "$dump"
  else
    compinit -C -d "$dump"
  fi
}

_zsh_init_completion

unfunction _zsh_init_completion
unset _zsh_cache_dir _zsh_completion_cache_changed
