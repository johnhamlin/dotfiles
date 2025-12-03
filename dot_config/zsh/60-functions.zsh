# Make directory and cd into it
mc() {
  mkdir -p "$@" && cd "$@"
}

# Clone a repo then cd into it
gcld() {
  git clone "$1" && cd "$(basename "$1" .git)"
}

# Run previous command with sudo, or sudo <args>
please() {
  if [ -z "$1" ]; then
    sudo "$(history -p '!-1')"
  else
    sudo "$@"
  fi
}

# Create a temp file and open in $VISUAL/$EDITOR
vt() {
  if [ -z "$1" ]; then
    echo "Usage: vt <filename.ext>"
    return 1
  fi

  local tmpdir="${TMPDIR:-/tmp}"
  local file="$tmpdir/$1"

  mkdir -p -- "$tmpdir"
  [ -e "$file" ] || : > "$file"

  echo "Opening temporary file: $file"
  "${VISUAL:-${EDITOR:-nvim}}" "$file"
}

# Claude wrapper to force bash
claude() {
  SHELL=/bin/bash command claude "$@"
}

# fuzzyfind helper using fzf + bat
ff() {
  find . -type f -not -path "*/.git/*" \
    | fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'
}
