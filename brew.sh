#!/bin/zsh
# =============================================================================
# brew.sh — Homebrew packages & applications installer
# =============================================================================
#
# Installs and upgrades:
#   - CLI tools (developer utilities, formatters, linters)
#   - Desktop applications via Homebrew Cask
#   - Fonts
#   - Mac App Store applications via mas
#
# Usage:
#   zsh brew.sh
#
# Note: The Brewfile is automatically regenerated from this file via the
#       pre-commit Git hook whenever this file is staged for commit.
# =============================================================================

# Make sure we're using the latest Homebrew
brew update

# List which installed packages are outdated with
brew outdated

# Upgrade any already-installed formulae
brew upgrade

#############################################################
# CLI Tools
#############################################################
brew install 'anomalyco/tap/opencode'   # OpenCode AI coding assistant
brew install 'asciiquarium'             # Aquarium animation in the terminal (fun)
brew install 'bat'                      # cat with syntax highlighting and Git integration
brew install 'cmatrix'                  # Matrix-style terminal animation
brew install 'cmux'                     # Multi-connection proxy
brew install 'figlet'                   # Generate large ASCII art text banners
brew install 'gh'                       # GitHub CLI — manage PRs, issues, repos from the terminal
brew install 'git'                      # Version control (always keep up-to-date)
brew install 'imagemagick'              # CLI image conversion and manipulation
brew install 'jq'                       # Parse and transform JSON from the command line
brew install 'markdownlint-cli2'        # Markdown linter for consistent documentation style
brew install 'mas'                      # CLI for the Mac App Store (used below)
brew install 'node'                     # Node.js runtime and npm package manager
brew install 'ollama'                   # Local AI chatbot server
brew install 'shellcheck'               # Static analysis / linter for shell scripts
brew install 'shfmt'                    # Shell script formatter
brew install 'sl'                       # Steam Locomotive animation
brew install 'smudge/smudge/nightlight' # Control macOS Night Shift from the terminal
brew install 'toilet'                   # Generate coloured ASCII banners (extends figlet)
brew install 'tree'                     # Display directory structure as a tree
brew install 'wget'                     # Download files from the web via CLI
brew install 'yarn'                     # Fast, reliable npm-compatible package manager
brew install 'zsh'                      # Zsh shell (latest version, managed by Homebrew)

#############################################################
# Desktop Apps
#############################################################
brew install --cask 'adobe-creative-cloud'
brew install --cask 'advanced-renamer'
brew install --cask 'alt-tab'
brew install --cask 'appcleaner'
brew install --cask 'bitwarden'
brew install --cask 'ccleaner'
brew install --cask 'chatgpt'
brew install --cask 'claude-code'
brew install --cask 'clop'
brew install --cask 'cursor'
brew install --cask 'darktable'
brew install --cask 'dbeaver-community'
brew install --cask 'discord'
brew install --cask 'figma'
brew install --cask 'firefox'
brew install --cask 'flux-app'
brew install --cask 'fork'
brew install --cask 'github'
brew install --cask 'google-chrome'
brew install --cask 'google-drive'
brew install --cask 'handy'
brew install --cask 'hiddenbar'
brew install --cask 'iterm2'
brew install --cask 'keycastr'
brew install --cask 'latest'
brew install --cask 'messenger'
brew install --cask 'molotov'
brew install --cask 'ngrok'
brew install --cask 'notion'
brew install --cask 'notion-calendar'
brew install --cask 'onyx'
brew install --cask 'openvpn-connect'
brew install --cask 'postman'
brew install --cask 'raycast'
brew install --cask 'rectangle'
brew install --cask 'rocket'
brew install --cask 'shottr'
brew install --cask 'slack'
brew install --cask 'spotify'
brew install --cask 'stats'
brew install --cask 'sublime-merge'
brew install --cask 'sublime-text'
brew install --cask 'superwhisper'
brew install --cask 'sweet-home3d'
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
mas install '408981434'  # 'iMovie'
mas install '409183694'  # 'Keynote'
mas install '409201541'  # 'Pages'
mas install '409203825'  # 'Numbers'
mas install '803453959'  # 'Slack for Desktop'

# Upgrade any installed App Store app
mas upgrade

# Remove outdated versions from the cellar
brew cleanup
