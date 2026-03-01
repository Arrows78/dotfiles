#!/bin/zsh
# =============================================================================
# git_setup.sh — Git global user configuration
# =============================================================================
#
# Prompts for your full name and email address, then writes them to the
# global Git config (~/.gitconfig). Run this once after cloning the repo
# to personalise your Git identity.
#
# Usage:
#   zsh git_setup.sh
# =============================================================================

echo "Type in your first and last name (no accent or special characters - e.g. 'ç'): "
read -r full_name

echo "Type in your email address (the one used for your GitHub account): "
read -r email

git config --global user.email "$email"
git config --global user.name "$full_name"

echo "👌 Awesome $full_name <$email>, all set."
