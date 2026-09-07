# Ubuntu initializes completion globally unless this parameter is set before
# /etc/zsh/zshrc is sourced. ~/.zshrc owns the single cached compinit call.
typeset -g skip_global_compinit=1
