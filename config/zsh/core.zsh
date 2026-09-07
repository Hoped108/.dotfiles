# Updated by: GPT-6 (Codex); 保留已有设置，修正变量作用域。
# Core Zsh settings.

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt \
  append_history \
  share_history \
  hist_ignore_dups \
  hist_reduce_blanks

# Keep PATH/fpath unique in nested shells.
# Modules are sourced through a loader function; the tied arrays must be global.
typeset -gU path PATH fpath FPATH

# Basic user executables only.
path=(
  "$HOME/.local/bin"
  $path
)

export PATH

# Editor
export EDITOR=vim
export VISUAL=vim
