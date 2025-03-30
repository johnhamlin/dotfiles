# Homebrew Shell Completions
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

# Java Version
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home

# Antigen plugin manager
# source /opt/homebrew/share/antigen/antigen.zsh

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
#

export PATH=$PATH:$HOME/.config/emacs/bin

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# Powerlevel10k instead of the above line
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnbasePath:'/catalog'basePath:'/catalog'oster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# ~/.zshrc
export PATH=$(brew --prefix)/bin:$PATH
plugins=(
	git
	# zsh-autosuggestions
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
	pnpm
	node
	npm
  zsh-vi-mode
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# My custom bins/scripts
export PATH=$HOME/bin:$PATH

# Fuzzyfind
# The vim plugin will auto execute this zvm_after_init function
function zvm_after_init() {
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
}

# Function to compile C programs with CS50 library
# function make50 { gcc "$1".c -o "$1" -I /usr/local/include -L /usr/local/lib -lcs50; }
# export PATH="/usr/local/sbin:$PATH"
# alias python=python3
# source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Make directory and cd into it
mc() {
mkdir -p "$@" && cd "$@"
}

# zsh-completions
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
  fi

# zsh-syntax-highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh auto suggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh you-should-use
source /opt/homebrew/share/zsh-you-should-use/you-should-use.plugin.zsh

# homebrew aliases
alias bi="brew install"
alias bic="brew install --cask"
alias bs="brew search"

# live-server alias with ignore
# alias lsi="live-server --ignore=.git,node_modules ./"

# git aliases
alias gpam="git push all main"
# github desktop
alias gh="github"

gcld() {
  git clone "$1" && cd "$(basename "$1" .git)"
}

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# pnpm
export PNPM_HOME="/Users/john/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end


# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# vscode
alias c="code ./"

# update
# based on https://twit.tv/shows/hands-on-mac/episodes/9
alias update="sudo softwareupdate -ia —verbose ; brew update ; brew upgrade ; brew cleanup ; brew doctor -v ; mas upgrade"

# Node
alias nr="npm run"
alias ni="npm install --save"
alias nrd="npm run dev"

# Docker
alias dk="docker"

# shorcut to clear screen because I remmaped ctrl+l.
alias cl="clear"

export PATH="$PATH:$HOME/.local/bin"


# Neovim
alias vim=nvim
alias v=vim

#ngrok
if command -v ngrok &>/dev/null; then
    eval "$(ngrok completion)"
  fi
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# source /Users/john/.local/share/xs-dev-export.sh

# Shell hook for direnv
eval "$(direnv hook zsh)"

# Android Development
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

eval "$(rbenv init - zsh)"

# Expo
alias e="npx expo"
alias ei="npx expo install"
alias est="npx expo start"
alias edoc="npx expo-doctor@latest"

# Zoxide replacement for cd
eval "$(zoxide init --cmd cd zsh)"

alias l="eza -l --icons"

#Go modules
export PATH=$PATH:$HOME/go/bin/

# Rust
alias c="cargo"
alias cr="cargo run"
alias ct="cargo test"

export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

# fuzzyfind
alias ff='find . -type f -not -path "*/\.git/*" | fzf --preview "/opt/homebrew/bin/bat --style=numbers --color=always --line-range :500 {}"'

# Sudo aliases
alias s='sudo'
alias si='sudo -i'  # Interactive sudo shell
alias se='sudoedit' # Safe way to edit system files
alias sv='sudo -v'  # Extend sudo timeout
alias sk='sudo -k'  # Kill sudo timeout

# Function to run previous command with sudo
function please() {
    if [ -z "$1" ]; then
        sudo $(history -p '!-1')
    else
        sudo "$@"
    fi
}

# Optional: Add completion for the new alias
if [ -n "$BASH_VERSION" ]; then
    complete -F _sudo s
fi

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/john/.lmstudio/bin"

# Run a command in Ubuntu
alias drun='docker run --rm -it -v "$(pwd):/work" -w /work -e HOME=/work -e USER="$USER" -u "$(id -u):$(id -g)" ubuntu'

export VISUAL=nvim

alias ai='aichat'
