# Updated by: GPT-6 (Codex); 默认使用 j/ji，避免重复初始化。
# zoxide directory jumping
# keep the existing 'j' command

if (( $+commands[zoxide] )) && (( ! $+functions[__zoxide_z] )); then
  eval "$(zoxide init --cmd j zsh)"
fi
