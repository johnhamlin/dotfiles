# Ensure ZSH_CUSTOM is set
ZSH_CUSTOM=${ZSH_CUSTOM:-$ZSH/custom}

# Helper to lazily install oh-my-zsh-compatible plugins
ensure_omz_plugin() {
  local name=$1
  local repo=$2
  local dir="$ZSH_CUSTOM/plugins/$name"

  if [[ ! -d "$dir" ]]; then
    if command -v git >/dev/null 2>&1; then
      echo "[zsh] Installing oh-my-zsh plugin: $name"
      git clone --depth=1 "$repo" "$dir" >/dev/null 2>&1 || {
        echo "[zsh] Failed to clone $repo" >&2
        return 1
      }
    else
      echo "[zsh] git not found; cannot install plugin $name" >&2
    fi
  fi
}

# Make sure our “extra” plugins exist (macOS & Linux)
ensure_omz_plugin zsh-syntax-highlighting https://github.com/zsh-users/zsh-syntax-highlighting.git
ensure_omz_plugin zsh-autosuggestions      https://github.com/zsh-users/zsh-autosuggestions.git
ensure_omz_plugin zsh-vi-mode              https://github.com/jeffreytse/zsh-vi-mode.git
ensure_omz_plugin zsh-completions          https://github.com/zsh-users/zsh-completions.git

# zvm_after_init: zsh-vi-mode calls this if defined
zvm_after_init() {
  # fzf
  [ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"

  # Atuin (only if installed)
  if command -v atuin >/dev/null 2>&1; then
    . "$HOME/.atuin/bin/env"
    eval "$(atuin init zsh)"
  fi
}

# Powerlevel10k theme (try common locations)
if [[ -r /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme ]]; then
  source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
elif [[ -r "$HOME/.local/share/powerlevel10k/powerlevel10k.zsh-theme" ]]; then
  source "$HOME/.local/share/powerlevel10k/powerlevel10k.zsh-theme"
fi

# Oh My Zsh plugins
plugins=(
  git
  brew
  docker
  colored-man-pages
  macos
  colorize
  sudo
  copypath
  web-search
  dirhistory
  history
  node
  npm
  zsh-vi-mode
  zsh-syntax-highlighting
  zsh-autosuggestions
)

# Finally load oh-my-zsh
source "$ZSH/oh-my-zsh.sh"
