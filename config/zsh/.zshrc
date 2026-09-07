# Updated by: GPT-6 (Codex); 保留已有配置，补齐模块加载。
# Powerlevel10k instant prompt.
# Anything that may require console input must stay above this block.
if [[ -r "$HOME/powerlevel10k/powerlevel10k.zsh-theme" &&
      -r "$HOME/.p10k.zsh" &&
      -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# -----------------------------------------------------------------------------
# Repository
# -----------------------------------------------------------------------------

typeset -g DOTFILES="${${(%):-%x}:A:h:h:h}"


# -----------------------------------------------------------------------------
# Module loaders
# -----------------------------------------------------------------------------

# Required configuration file.
# Missing required modules indicate a broken dotfiles deployment.
require_zsh() {
  local file="$1"

  if [[ ! -r "$file" ]]; then
    print -u2 -- "zsh: required configuration not found: $file"
    return 1
  fi

  source "$file"
}

# Optional configuration file.
# Missing optional modules are silently skipped.
optional_zsh() {
  local file="$1"

  [[ -r "$file" ]] || return 0
  source "$file"
}


# -----------------------------------------------------------------------------
# Core
# -----------------------------------------------------------------------------

require_zsh "$DOTFILES/config/zsh/core.zsh" || return 1


# -----------------------------------------------------------------------------
# Machine-specific configuration
# -----------------------------------------------------------------------------

typeset -ga DOTFILES_TOOLS=()
optional_zsh "$HOME/.zshrc.local"


# -----------------------------------------------------------------------------
# Optional development tools
#
# These modules must not install software. install.sh is responsible for that.
# -----------------------------------------------------------------------------

for _dotfiles_tool in $DOTFILES_TOOLS; do
  case "$_dotfiles_tool" in
    node|qemu|uv|rust|cross|wsl)
      require_zsh "$DOTFILES/config/tools/$_dotfiles_tool.zsh" || return 1 ;;
    *) print -u2 -- "zsh: unknown optional tool: $_dotfiles_tool" ;;
  esac
done
unset _dotfiles_tool
require_zsh "$DOTFILES/config/tools/zoxide.zsh" || return 1


# -----------------------------------------------------------------------------
# Completion
#
# Tool modules that modify fpath must be loaded before this point.
# completion.zsh owns the single compinit call.
# -----------------------------------------------------------------------------

require_zsh "$DOTFILES/config/zsh/completion.zsh" || return 1


# -----------------------------------------------------------------------------
# Autosuggestions
#
# Installation is handled by install.sh.
# -----------------------------------------------------------------------------

optional_zsh \
  "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"


# -----------------------------------------------------------------------------
# Keybindings
# -----------------------------------------------------------------------------

require_zsh "$DOTFILES/config/zsh/keybindings.zsh" || return 1


# -----------------------------------------------------------------------------
# FZF
#
# Loaded after base keybindings so Ctrl-R can be overridden by FZF.
# -----------------------------------------------------------------------------

require_zsh "$DOTFILES/config/fzf/fzf.zsh" || return 1


# -----------------------------------------------------------------------------
# Aliases
# -----------------------------------------------------------------------------

require_zsh "$DOTFILES/config/zsh/aliases.zsh" || return 1
# Personal overrides run after shared aliases and before syntax highlighting.
optional_zsh "$HOME/.zshrc.local.after"


# -----------------------------------------------------------------------------
# Prompt
# -----------------------------------------------------------------------------

require_zsh "$DOTFILES/config/zsh/prompt.zsh" || return 1


# -----------------------------------------------------------------------------
# Syntax highlighting
#
# Installation is handled by install.sh.
# This must remain after all widgets, keybindings, and prompt setup.
# -----------------------------------------------------------------------------

optional_zsh \
  "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"


# -----------------------------------------------------------------------------
# Cleanup
# -----------------------------------------------------------------------------

unfunction require_zsh optional_zsh
