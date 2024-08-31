#!/bin/zsh

# Function to rename a `target` file to `target.backup`
backup() {
  target=$1

  if [ -e "$target" ]; then           # Does the config file already exist?
    if [ ! -L "$target" ]; then       # as a pure file? (i.e. not a symlink)
      mv "$target" "$target.backup"   # Then backup it
      echo "-----> Moved your old $target config file to $target.backup"
    fi
  fi
}

# Function to create a symlink
symlink() {
  file=$1
  link=$2

  if [ ! -e "$link" ]; then
    echo "-----> Symlinking your new $link"
    ln -s $file $link
  fi
}

# ==============================
# XCODE COMMAND LINE
# ==============================
# Install macOS Command Line Tools if not installed yet
if [[ ! $(xcode-select --print-path) ]]; then
  echo "-----> Installing Xcode command line tools..."
  xcode-select --install
fi

# ==============================
# HOMEBREW
# ==============================
if [[ ! $(command -v brew) ]]; then
  echo "-----> Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
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

    if [[ ! "$name" =~ '\.sh$' ]] && [ "$name" != 'README.md' ] && [[ ! "$name" =~ '\.sublime-settings$' ]] && [[ ! "$name" =~ '\.sublime-keymap$' ]] && [[ ! "$name" =~ 'sshconfig' ]]; then
      backup $target
      symlink $PWD/$name $target
    fi
  fi
done

# ==============================
# SSH CONFIG
# ==============================
SSH_KEY="$HOME_DIR/.ssh/id_ed25519"

# Symlink SSH config file to the present ssh config file for macOS and add SSH passphrase to the keychain
target="$HOME_DIR/.ssh/config"

if [ ! -e "$target" ]; then
  backup $target
  symlink $CURRENT_DIR/sshconfig $target
fi

if [ ! -e "$SSH_KEY" ]; then
  echo "Type in your email address for the SSH key: "
  read GIT_EMAIL
  ssh-keygen -t ed25519 -f "$SSH_KEY" -N "" -C "$GIT_EMAIL"
  ssh-add --apple-use-keychain $SSH_KEY
fi

# ==============================
# ZSH PLUGINS
# ==============================
ZSH_PLUGINS_DIR="$HOME_DIR/.oh-my-zsh/custom/plugins"

mkdir -p "$ZSH_PLUGINS_DIR" && cd "$ZSH_PLUGINS_DIR"

if [ ! -d "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting" ]; then
  echo "-----> Installing zsh plugin 'zsh-syntax-highlighting'..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
  git clone https://github.com/zsh-users/zsh-autosuggestions.git
fi

cd "$CURRENT_DIR"

# ==============================
# SUBLIME TEXT
# ==============================
# Git editor setup for macOS
git config --global core.editor "/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl --new-window --wait"

if [[ ! $(grep "export EDITOR=" zshrc) ]]; then
  echo "export EDITOR=\"subl -w -a\"" >> zshrc
fi

SUBL_PATH=~/Library/Application\ Support/Sublime\ Text

mkdir -p $SUBL_PATH/Packages/User $SUBL_PATH/Installed\ Packages

if [ ! -e $SUBL_PATH/Installed\ Packages/Package\ Control.sublime-package ]; then
  echo "-----> Installing Package Control..."
  curl -k https://packagecontrol.io/Package%20Control.sublime-package > $SUBL_PATH/Installed\ Packages/Package\ Control.sublime-package
fi

files=(
  "Preferences.sublime-settings"
  "Package Control.sublime-settings"
  "Default (OSX).sublime-keymap"
  "SublimeLinter.sublime-settings"
)

for file in "${files[@]}"; do
  backup $SUBL_PATH/Packages/User/$file
  symlink $CURRENT_DIR/$file $SUBL_PATH/Packages/User/$file
done

# Refresh the current terminal with the newly installed configuration
exec zsh

echo "🎉 All Done!"