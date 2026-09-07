# Updated by: GPT-6 (Codex); 已有 p10k 可用时加载，否则使用简单提示符。
# Powerlevel10k prompt.

if [[ -r "$HOME/powerlevel10k/powerlevel10k.zsh-theme" && -r "$HOME/.p10k.zsh" ]]; then
  source "$HOME/powerlevel10k/powerlevel10k.zsh-theme"
  source "$HOME/.p10k.zsh"
else
  PROMPT='%F{blue}%n@%m%f %F{cyan}%~%f %# '
fi
