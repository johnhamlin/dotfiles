# --- Install atuin if missing ---
if [ ! -d "$HOME/.atuin" ] && ! command -v atuin >/dev/null 2>&1; then
  echo "[chezmoi] Installing Atuin..."
  curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
else
  echo "[chezmoi] Atuin already installed, skipping."
fi

# --- Atuin post-install reminder ---
if command -v atuin >/dev/null 2>&1 && [ ! -d "$HOME/.config/atuin" ]; then
  cat <<'EOF'

[chezmoi] Atuin appears to be installed but not configured on this machine.

To finish setting it up:

  # If this is your FIRST Atuin machine:
  atuin register
  atuin import auto
  atuin sync

  # If you ALREADY have an Atuin account:
  atuin login
  atuin import auto   # optional, import this machine's history
  atuin sync

After that, your zsh config will automatically load Atuin for you.

EOF
fi
