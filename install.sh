#!/bin/zsh

# ==============================
# COLORS
# ==============================
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# ==============================
# MESSAGE FUNCTIONS
# ==============================
success() {
  echo "${GREEN}✅ $1${NC}"
}

info() {
  echo "${BLUE}-----> $1${NC}"
}

warning() {
  echo "${YELLOW}⚠️ $1${NC}"
}

error() {
  echo "${RED}❌ $1${NC}"
}

highlight() {
  echo "${CYAN}$1${NC}"
}

# Function to rename a `target` file to `target.backup`
backup() {
  target=$1

  # Does the config file already exist and as a pure file? (i.e. not a symlink)
  if [ -e "$target" ] && [ ! -L "$target" ]; then
    mv "$target" "$target.backup" # Then backup it
    warning "Moved your old config file $(highlight "$target") --> $(highlight "$target.backup")"
  fi
}

# Function to create a symlink
symlink() {
  file=$1
  link=$2

  if [ ! -e "$link" ]; then
    info "Symlinking your new file $(highlight "$link")"
    ln -s "$file" "$link"
  fi
}

# Check if we're running under zsh
if [ -z "$ZSH_VERSION" ]; then
  error "This script must be run with Zsh. Try: $(highlight "zsh $0")"
  exit 1
fi

# ==============================
# XCODE COMMAND LINE TOOLS
# ==============================
# Install macOS Command Line Tools if not installed yet
if [[ ! $(xcode-select --print-path) ]]; then
  info "Installing $(highlight Xcode command line tools)..."
  xcode-select --install
  success "Xcode Command Line Tools installation initiated"
else
  success "Xcode Command Line Tools already installed"
fi

# ==============================
# HOMEBREW
# ==============================
if [[ ! $(command -v brew) ]]; then
  info "Installing $(highlight Homebrew)..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  success "Homebrew installed successfully"
else
  success "Homebrew already installed"
fi

HOME_DIR="$HOME"
CURRENT_DIR="$PWD"

# ==============================
# SYMLINK SETUP
# ==============================
# For all `$name` files in the present folder except for some specific files mentioned in the if condition,
# backup the target file located at `~/.$name` and symlink `$name` to `~/.$name`
for name in *; do
  if [ ! -d "$name" ]; then
    target="$HOME_DIR/.$name"

    if [[ ! "$name" =~ \.sh$ ]] && [[ "$name" != README.md ]]; then
      backup "$target"
      symlink "$PWD/$name" "$target"
    fi
  fi
done

# ==============================
# SSH CONFIG
# ==============================
SSH_KEY="$HOME_DIR/.ssh/id_ed25519"
SSH_KEY_PUB="${SSH_KEY}.pub"

# Symlink SSH config file to the present ssh config file for macOS and add SSH passphrase to the keychain
target="$HOME_DIR/.ssh/config"

if [ ! -e "$target" ]; then
  backup "$target"
  symlink "$CURRENT_DIR/ssh/sshconfig" "$target"
fi

if [ ! -e "$SSH_KEY" ]; then
  echo "Type in your email address for the SSH key: "
  read -r GIT_EMAIL
  ssh-keygen -t ed25519 -f "$SSH_KEY" -N "" -C "$GIT_EMAIL"
  ssh-add --apple-use-keychain "$SSH_KEY"
  pbcopy <"$SSH_KEY_PUB"
  success "SSH key generated and copied to clipboard. Add it to $(highlight https://github.com/settings/keys)"
fi

# ==============================
# ZSH PLUGINS
# ==============================
ZSH_PLUGINS_DIR="$HOME_DIR/.oh-my-zsh/custom/plugins"

mkdir -p "$ZSH_PLUGINS_DIR" && cd "$ZSH_PLUGINS_DIR" || exit 1

if [ ! -d "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting" ]; then
  info "Installing zsh plugin $(highlight 'zsh-syntax-highlighting')..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
  git clone https://github.com/zsh-users/zsh-autosuggestions.git
  success "Zsh plugins installed successfully"
else
  success "Zsh plugins already installed"
fi

cd "$CURRENT_DIR" || exit 1

# ==============================
# SUBLIME TEXT
# ==============================
# Git editor setup for macOS
git config --global core.editor "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl --new-window --wait"

if [[ ! $(grep "export EDITOR=" zshrc) ]]; then
  echo "export EDITOR=\"subl -w -a\"" >>zshrc
  success "Added $(highlight EDITOR) to zshrc"
fi

SUBL_PATH="$HOME_DIR/Library/Application Support/Sublime Text"
SUBL_DOTFILES_PATH="$CURRENT_DIR/apps/sublime-text"

mkdir -p "$SUBL_PATH/Packages/User" "$SUBL_PATH/Installed Packages"

if [ ! -e "$SUBL_PATH/Installed Packages/Package Control.sublime-package" ]; then
  info "Installing $(highlight Package Control)..."
  curl -fSL https://packagecontrol.io/Package%20Control.sublime-package >"$SUBL_PATH/Installed Packages/Package Control.sublime-package"
  success "Package Control installed"
fi

for file in "$SUBL_DOTFILES_PATH"/*; do
  filename=$(basename "$file")
  backup "$SUBL_PATH/Packages/User/$filename"
  symlink "$file" "$SUBL_PATH/Packages/User/$filename"
done

success "Sublime Text configuration complete"

success "Installation completed successfully! All Done! 🎉"

# Refresh the current terminal with the newly installed configuration
exec zsh
