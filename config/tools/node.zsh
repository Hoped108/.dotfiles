# Lazy-load NVM and the default Node environment.

export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"

# Do not shadow a system-installed Node if NVM is unavailable.
if [[ -s "$NVM_DIR/nvm.sh" ]]; then

  _zsh_load_nvm() {
    unfunction nvm node npm npx corepack codex pi 2>/dev/null

    source "$NVM_DIR/nvm.sh" --no-use

    nvm use default >/dev/null 2>&1 || {
      print -u2 -- "Unable to activate NVM's default Node version"
      return 1
    }
  }

  nvm() {
    _zsh_load_nvm || return
    nvm "$@"
  }

  node() {
    _zsh_load_nvm || return
    command node "$@"
  }

  npm() {
    _zsh_load_nvm || return
    command npm "$@"
  }

  npx() {
    _zsh_load_nvm || return
    command npx "$@"
  }

  corepack() {
    _zsh_load_nvm || return
    command corepack "$@"
  }

  codex() {
    _zsh_load_nvm || return
    command codex "$@"
  }

  pi() {
    _zsh_load_nvm || return
    command pi "$@"
  }
fi
