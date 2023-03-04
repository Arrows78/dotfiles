# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

cask_args appdir: '/Applications'

#############################################################
# Apps
#############################################################
brew install 'git'
brew install 'imagemagick'
brew install 'mas'
brew install 'tree'
brew install 'wget'

#############################################################
# Desktop Apps
#############################################################
brew cask install 'alfred'
brew cask install 'alt-tab'
brew cask install 'bitwarden'
brew cask install 'cron'
brew cask install 'discord'
brew cask install 'figma'
brew cask install 'firefox'
brew cask install 'github'
brew cask install 'google-backup-and-sync'
brew cask install 'google-chrome'
brew cask install 'google-drive'
brew cask install 'iterm2'
brew cask install 'jumpcutony'
brew cask install 'messenger'
brew cask install 'notion'
brew cask install 'onyx'
brew cask install 'postman'
brew cask install 'rectangle'
brew cask install 'shottr'
brew cask install 'slack'
brew cask install 'spotify'
brew cask install 'stats'
brew cask install 'sublime-text'
brew cask install 'vanilla'
brew cask install 'vlc'
brew cask install 'whatsapp'
brew cask install 'zoom'

#############################################################
# Fonts
#############################################################
brew cask install 'font-open-sans'
brew cask install 'font-roboto'
