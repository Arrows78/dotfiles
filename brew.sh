# Make sure we’re using the latest Homebrew
brew update

# List which installed packages are outdated with
brew outdated

# Upgrade any already-installed formulae
brew upgrade

#############################################################
# Apps
#############################################################
brew install 'asciiquarium'
brew install 'cmatrix'
brew install 'gh'
brew install 'git'
brew install 'imagemagick'
brew install 'jq'
brew install 'mas'
brew install 'toilet'
brew install 'tree'
brew install 'wget'
brew install 'zsh'

#############################################################
# Desktop Apps
#############################################################
brew install --cask 'adobe-creative-cloud'
brew install --cask 'alt-tab'
brew install --cask 'appcleaner'
brew install --cask 'bitwarden'
brew install --cask 'darktable'
brew install --cask 'dbeaver-community'
brew install --cask 'discord'
brew install --cask 'figma'
brew install --cask 'firefox'
brew install --cask 'github'
brew install --cask 'google-chrome'
brew install --cask 'google-drive'
brew install --cask 'hiddenbar'
brew install --cask 'iterm2'
brew install --cask 'keycastr'
brew install --cask 'latest'
brew install --cask 'messenger'
brew install --cask 'molotov'
brew install --cask 'notion'
brew install --cask 'notion-calendar'
brew install --cask 'onyx'
brew install --cask 'openvpn-connect'
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
brew install --cask 'upscayl'
brew install --cask 'vlc'
brew install --cask 'wacom-tablet'
brew install --cask 'whatsapp'
brew install --cask 'zoom'

# Upgrade any installed desktop app
brew upgrade --cask

#############################################################
# Fonts
#############################################################
brew install --cask 'font-open-sans'
brew install --cask 'font-roboto'

#############################################################
# App Store
#############################################################
mas install '1147396723' # 'WhatsApp Desktop'
mas install '1352778147' # 'Bitwarden'
mas install '1450038993' # 'Microsoft 365'
mas install '1480068668' # 'Messenger'
mas install '1575588022' # 'MenubarX'
mas install '408981434' # 'iMovie'
mas install '409183694' # 'Keynote'
mas install '409201541' # 'Pages'
mas install '409203825' # 'Numbers'
mas install '803453959' # 'Slack for Desktop'

# Upgrade any installed App Store app
mas upgrade

# Remove outdated versions from the cellar
brew cleanup