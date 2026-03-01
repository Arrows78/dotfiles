<h1 align="center">
    📂 ~/.dotfiles — Setup default configuration<br/>
    <sub>powered by  <a href="https://github.com/Arrows78/">Arrows78</a> 💻</sub>
</h1>

![GitHub last commit](https://img.shields.io/github/last-commit/Arrows78/dotfiles?style=for-the-badge&color=FD8494&logoColor=D9E0EE&logo=github)
![GitHub commit activity](https://img.shields.io/github/commit-activity/m/Arrows78/dotfiles?style=for-the-badge&color=FF6022&logoColor=D9E0EE&logo=git)
![GitHub repo size](https://img.shields.io/github/repo-size/Arrows78/dotfiles?style=for-the-badge&color=FECB02&logoColor=D9E0EE&logo=databricks)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/Arrows78/dotfiles?style=for-the-badge&color=5A59AD&logoColor=D9E0EE&logo=sublimetext)
![GitHub language count](https://img.shields.io/github/languages/count/Arrows78/dotfiles?style=for-the-badge&color=F93538&logoColor=D9E0EE&logo=polymerproject)
![GitHub top language](https://img.shields.io/github/languages/top/Arrows78/dotfiles?style=for-the-badge&color=298AD9&logoColor=D9E0EE&logo=gnubash)
![Github open issues](https://img.shields.io/github/issues/Arrows78/dotfiles?style=for-the-badge&color=D9E0EE&logoColor=D9E0EE&logo=jira)
![GitHub Created At](https://img.shields.io/github/created-at/Arrows78/dotfiles?style=for-the-badge&color=3DB876&logoColor=D9E0EE&logo=clockify)

## 👋 About

Welcome to my dotfiles repository! This repository contains my personal configuration files for a variety of tools, applications, and development environments. These dotfiles are tailored to streamline my workflow, enhance productivity, and can be used as a starting point for setting up your own development environment.

> [!WARNING]
> If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don't want or need. Don't blindly use my settings unless you know what that entails. Use at your own risk!

## ⚙️ Toolset

This repository includes configurations for the following tools:

- [oh-my-zsh](http://ohmyz.sh/) – Zsh configuration framework.
- [Sublime Text](https://www.sublimetext.com/) – A sophisticated text editor.
- [git](https://git-scm.com/) – Version control system.
- [Homebrew](https://brew.sh/) – Package manager for installing and managing software.

## 📦 Requirements

This repository includes configurations for several tools and applications. Ensure the following tools are installed before proceeding:

- [oh-my-zsh](http://ohmyz.sh/)

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## 📖 Installation

Follow these steps to set up your environment using these dotfiles:

1. Clone the repository

Your dotfiles are personal, so start by cloning this repository on GitHub to your computer.

```
git clone git@github.com:Arrows78/dotfiles.git
cd dotfiles
```

2. Run the installers in order

Run the following scripts to set up your environment:

- **Dotfiles installer** — symlinks config files, sets up SSH, installs Zsh plugins and Sublime Text

```bash
zsh install.sh
```

- **Git configuration** — sets your global `user.name` and `user.email`

```bash
zsh git_setup.sh
```

☝️ This will prompt you for your name (Firstname Lastname) and the email linked to your GitHub account.

- **Git hooks** — symlinks `.githooks/` into `.git/hooks/` to enforce commit conventions

```bash
zsh hooks.sh
```

- **Homebrew** — installs all CLI tools, desktop apps, fonts and App Store apps

```bash
zsh brew.sh
```

## 📂 File Overview

Here's a quick look at the files included in this repository:

- `├── 📁 .githooks`: Custom Git hooks for automation
  - `├── 📄 commit-msg`: Validates commit messages against the [Conventional Commits](https://www.conventionalcommits.org) spec
  - `└── 📄 pre-commit`: Regenerates `Brewfile` automatically when `brew.sh` is staged for commit
- `└── 📁 apps/`: Application-specific configuration files
  - `├── 📁 raycast/`: Raycast configuration file backups
  - `└── 📁 sublime-text/`: Sublime Text configuration files
    - `├── 📄 Default (OSX).sublime-keymap`: Custom keybindings for Sublime Text on macOS
    - `├── 📄 Package Control.sublime-settings`: Settings for Sublime Text's Package Control
    - `├── 📄 Preferences.sublime-settings`: General preferences for Sublime Text
    - `└── 📄 SublimeLinter.sublime-settings`: Configuration for SublimeLinter in Sublime Text
- `├── 📁 ssh`: SSH configuration files
  - `└── 📄 sshconfig`: Configuration file for SSH connections
- `├── 📄 aliases`: Custom shell aliases for quick command-line shortcuts
- `├── 📄 brew.sh`: Script to install Homebrew and commonly used packages
- `├── 📄 Brewfile`: Auto-generated configuration file based on the brew.sh
- `├── 📄 git_setup.sh`: Script to configure Git with your user details
- `├── 📄 gitconfig`: Global Git configuration file
- `├── 📄 hooks.sh`: Script to automatically create symlinks for Git hooks in the `.git/hooks` directory
- `├── 📄 install.sh`: Main installation script to symlink dotfiles to the home directory
- `├── 📄 vimrc`: Configuration file for Vim editor
- `└── 📄 zshrc`: Zsh shell configuration file

## 👥 Contributing

Contributions are welcome! If you have improvements or fixes, please follow these steps:

1. Fork the repository.
2. Create a new branch for your changes.
3. Make your changes and commit them with a descriptive message.
4. Push your changes and create a pull request.

You can also open issues for suggestions or bug reports.

🎉 You're all set! Enjoy your personalized setup!
