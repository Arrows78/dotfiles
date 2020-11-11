# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

cask_args appdir: '/Applications'

# Apps
brew cask install 'firefox'
brew cask install 'google-chrome'
brew cask install 'sublime-text'
brew cask install 'slack'
brew cask install 'spotify'
brew cask install 'bitwarden'
brew cask install 'figma'
brew cask install 'google-backup-and-sync'
brew cask install 'iterm2'
brew cask install 'vlc'
brew cask install 'postman'

# Fonts
brew cask install 'font-open-sans'
brew cask install 'font-roboto'
