#!/bin/bash

set -e

# Get the dotfiles directory (directory where this script is located)
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="$HOME"

# Files/directories to symlink
ITEMS=(
  ".config/ghostty"
  ".config/nvim"
)

# Dry-run mode
DRY_RUN=false
if [ "$1" == "--dry-run" ]; then
  DRY_RUN=true
  echo "Dry-run mode: no changes will be made."
fi

for item in "${ITEMS[@]}"; do
  src="$DOTFILES_DIR/$item"
  dest="$TARGET_DIR/$item"

  mkdir -p "$(dirname "$dest")"

  if [ -L "$dest" ]; then
    echo "Symlink already exists: $dest"
  elif [ -e "$dest" ]; then
    echo "Backing up existing: $dest → ${dest}.bak"
    $DRY_RUN || mv "$dest" "${dest}.bak"
    echo "Creating symlink: $dest → $src"
    $DRY_RUN || ln -s "$src" "$dest"
  else
    echo "Creating symlink: $dest → $src"
    $DRY_RUN || ln -s "$src" "$dest"
  fi
done
