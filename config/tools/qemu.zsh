# Updated by: GPT-6 (Codex); QEMU 路径由本机配置提供。
# Optional QEMU environment
# QEMU_BIN_DIR should be defined by ~/.zshrc.local

if [[ -n "${QEMU_BIN_DIR:-}" && -d "$QEMU_BIN_DIR" ]]; then
  path=(
    "$QEMU_BIN_DIR"
    $path
  )
fi
