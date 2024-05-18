# Make sure we’re using the latest Homebrew
brew update

# List which installed packages are outdated with
brew outdated

# Upgrade any already-installed formulae
brew upgrade

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
brew install --cask 'alt-tab'
brew install --cask 'appcleaner'
brew install --cask 'bitwarden'
brew install --cask 'dbeaver-community'
brew install --cask 'discord'
brew install --cask 'figma'
brew install --cask 'firefox'
brew install --cask 'github'
brew install --cask 'google-chrome'
brew install --cask 'google-drive'
brew install --cask 'hiddenbar'
brew install --cask 'iterm2'
brew install --cask 'messenger'
brew install --cask 'notion'
brew install --cask 'notion-calendar'
brew install --cask 'onyx'
brew install --cask 'postman'
brew install --cask 'raycast'
brew install --cask 'rectangle'
brew install --cask 'shottr'
brew install --cask 'slack'
brew install --cask 'spotify'
brew install --cask 'stats'
brew install --cask 'sublime-merge'
brew install --cask 'sublime-text'
brew install --cask 'synology-drive'
brew install --cask 'vlc'
brew install --cask 'wacom-tablet'
brew install --cask 'whatsapp'
brew install --cask 'zoom'

#############################################################
# Fonts
#############################################################
brew install --cask 'font-open-sans'
brew install --cask 'font-roboto'

#############################################################
# App Store
#############################################################
brew install mas 'Bitwarden', id: 1352778147
brew install mas 'iMovie', id: 408981434
brew install mas 'Keynote', id: 409183694
brew install mas 'MenubarX', id: 1575588022
brew install mas 'Messenger', id: 1480068668
brew install mas 'Microsoft 365', id: 1450038993
brew install mas 'Numbers', id: 409203825
brew install mas 'Pages', id: 409201541
brew install mas 'Slack for Desktop', id: 803453959
brew install mas 'Usage: System Activity Monitor', id: 1561788435
brew install mas 'WhatsApp Desktop', id: 1147396723
brew install mas 'Xcode', id: 497799835


# Remove outdated versions from the cellar.
brew cleanup