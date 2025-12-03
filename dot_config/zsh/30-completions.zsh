# Extra completions from Homebrew zsh-completions
if command -v brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh-completions:$FPATH"
fi

autoload -Uz compinit
compinit

# ngrok completions (if installed)
if command -v ngrok &>/dev/null; then
  eval "$(ngrok completion)"
fi
