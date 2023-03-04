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
brew install --cask 'alfred'
brew install --cask 'alt-tab'
brew install --cask 'bitwarden'
brew install --cask 'cron'
brew install --cask 'discord'
brew install --cask 'figma'
brew install --cask 'firefox'
brew install --cask 'github'
brew install --cask 'google-backup-and-sync'
brew install --cask 'google-chrome'
brew install --cask 'google-drive'
brew install --cask 'iterm2'
brew install --cask 'jumpcutony'
brew install --cask 'messenger'
brew install --cask 'notion'
brew install --cask 'onyx'
brew install --cask 'postman'
brew install --cask 'rectangle'
brew install --cask 'shottr'
brew install --cask 'slack'
brew install --cask 'spotify'
brew install --cask 'stats'
brew install --cask 'sublime-text'
brew install --cask 'vanilla'
brew install --cask 'vlc'
brew install --cask 'whatsapp'
brew install --cask 'zoom'

#############################################################
# Fonts
#############################################################
brew install --cask 'font-open-sans'
brew install --cask 'font-roboto'