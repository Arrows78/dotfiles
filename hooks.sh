#!/bin/zsh

CURRENT_DIR="$PWD"
HOOKS_DIR=".githooks"
TARGET_HOOKS_DIR=".git/hooks"

# Ensure hooks directory exists
mkdir -p "$HOOKS_DIR"

# Link all custom hooks to the Git hooks directory
for hook in "$HOOKS_DIR"/*; do
    hook_name=$(basename "$hook")

    LINK=$TARGET_HOOKS_DIR/$hook_name

    if [ ! -e "$LINK" ]; then
        ln -s "$CURRENT_DIR/$hook" "$LINK"
        echo "-----> Symlinking $LINK in Git hooks"
    fi

    # Make the symlinked hook file executable
    chmod +x "$LINK"
    echo "-----> Made $LINK executable"
done
