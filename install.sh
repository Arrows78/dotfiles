#!/bin/zsh

# Define a function which rename a `target` file to `target.backup`
backup() {
  target=$1
  if [ -e "$target" ]; then           # Does the config file already exist?
    if [ ! -L "$target" ]; then       # as a pure file? (i.e. not a symlink)
      mv "$target" "$target.backup"   # Then backup it
      echo "-----> Moved your old $target config file to $target.backup"
    fi
  fi
}

# Define a function to create a symlink
symlink() {
  file=$1
  link=$2
  if [ ! -e "$link" ]; then
    echo "-----> Symlinking your new $link"
    ln -s $file $link
  fi
}

HOME_DIR="$HOME"
CURRENT_DIR="$PWD"

# For all files `$name` in the present folder except `*.sh`, `README.md`, `sublime-settings` and `sshconfig`,
# backup the target file located at `~/.$name` and symlink `$name` to `~/.$name`
for name in *; do
  if [ ! -d "$name" ]; then
    target="$HOME_DIR/.$name"
    if [[ ! "$name" =~ '\.sh$' ]] && [ "$name" != 'README.md' ] && [[ ! "$name" =~ '\.sublime-settings$' ]] && [[ ! "$name" =~ 'sshconfig' ]]; then
      backup $target
      symlink $PWD/$name $target
    fi
  fi
done

# Symlink SSH config file to the present ssh config file for macOS and add SSH passphrase to the keychain
if [[ `uname` =~ "Darwin" ]]; then
  target="$HOME_DIR/.ssh/config"
  backup $target
  symlink $CURRENT_DIR/sshconfig $target
  ssh-add --apple-use-keychain ~/.ssh/id_ed25519
fi

# zsh plugins
ZSH_PLUGINS_DIR="$HOME_DIR/.oh-my-zsh/custom/plugins"
mkdir -p "$ZSH_PLUGINS_DIR" && cd "$ZSH_PLUGINS_DIR"
if [ ! -d "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting" ]; then
  echo "-----> Installing zsh plugin 'zsh-syntax-highlighting'..."
  git clone git@github.com/zsh-users/zsh-syntax-highlighting.git
  git clone git@github.com/zsh-users/zsh-autosuggestions.git
fi
cd "$CURRENT_DIR"

setopt nocasematch
if [[ ! `uname` =~ "Darwin" ]]; then
  git config --global core.editor "subl -n -w $@ >/dev/null 2>&1"
  echo 'export BUNDLER_EDITOR="subl $@ >/dev/null 2>&1 -a"' >> zshrc
else
  git config --global core.editor "'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl' -n -w"
  bundler_editor="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'"
  echo "export BUNDLER_EDITOR=\"${bundler_editor} -a\"" >> zshrc
fi

# Sublime Text
if [[ ! `uname` =~ "Darwin" ]]; then
  SUBL_PATH=~/.config/sublime-text-3
else
  SUBL_PATH=~/Library/Application\ Support/Sublime\ Text\ 3
fi
mkdir -p $SUBL_PATH/Packages/User $SUBL_PATH/Installed\ Packages
backup "$SUBL_PATH/Packages/User/Preferences.sublime-settings"
curl -k https://sublime.wbond.net/Package%20Control.sublime-package > $SUBL_PATH/Installed\ Packages/Package\ Control.sublime-package
symlink $CURRENT_DIR/Preferences.sublime-settings $SUBL_PATH/Packages/User/Preferences.sublime-settings
symlink $CURRENT_DIR/Package\ Control.sublime-settings $SUBL_PATH/Packages/User/Package\ Control.sublime-settings
symlink $CURRENT_DIR/SublimeLinter.sublime-settings $SUBL_PATH/Packages/User/SublimeLinter.sublime-settings

# Homebrew
if [[ ! $(command -v brew) ]]; then
  echo "-----> Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Refresh the current terminal with the newly installed configuration
exec zsh

echo "👌 Carry on with git setup!"
