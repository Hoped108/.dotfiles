# Updated by: GPT-6 (Codex); 通用别名，移除 eza 依赖。
# Aliases
alias v='vim'

# git 
alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias gm='git commit'

alias gl='git log --oneline --all --decorate --graph'

# others
alias t='tldr'
alias e='exit'
alias cl='clear'

# cd
alias ..='cd ..'
alias ~='cd ~'

# Command and completion colors
autoload -Uz colors && colors
alias ls='ls --color=auto -hv'
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip -c=auto'
export LESS='-R'
export CLICOLOR=1
