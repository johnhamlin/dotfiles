# Extra completions for zsh
if [ -n "${ZSH_CUSTOM:-}" ] && [ -d "$ZSH_CUSTOM/plugins/zsh-completions/src" ]; then
  fpath=("$ZSH_CUSTOM/plugins/zsh-completions/src" $fpath)
fi

autoload -Uz compinit
compinit

# ngrok completions (if installed)
if command -v ngrok &>/dev/null; then
  eval "$(ngrok completion)"
fi
