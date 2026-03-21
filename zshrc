# ==============================
# OH MY ZSH CONFIGURATION
# ==============================
export ZSH=$HOME/.oh-my-zsh

# Theme
# Change the theme: https://github.com/robbyrussell/oh-my-zsh/wiki/themes
ZSH_THEME="robbyrussell"

# Useful plugins
plugins=(
    colored-man-pages
    colorize
    common-aliases
    git
    gitfast
    history-substring-search
    last-working-dir
    sublime
    web-search
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# Load Oh My Zsh
source "${ZSH}/oh-my-zsh.sh"

# ==============================
# HOMEBREW
# ==============================
# Prevent Homebrew from reporting
# More information: https://github.com/Homebrew/brew/blob/master/docs/Analytics.md
export HOMEBREW_NO_ANALYTICS=1

# ==============================
# PATH MANAGEMENT
# ==============================
# Global paths
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:/usr/local/sbin:$PATH"

# Project-local binaries (Rails, Node, etc.)
export PATH="./bin:./node_modules/.bin:$PATH"

# ==============================
# LANGUAGE VERSION MANAGERS
# ==============================
# Ruby version manager (rbenv)
if type rbenv &>/dev/null; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi

# Python version manager (pyenv)
if type pyenv &>/dev/null; then
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# Node version manager (nvm)
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"

# ==============================
# TERMINAL CONFIG
# ==============================
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR="subl -w -a"

setopt HIST_IGNORE_ALL_DUPS

# Store your own aliases in the ~/.aliases file and load it here
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

# Add my dotfiles folder
export DOTFILES=~/Documents/Labs/dotfiles
