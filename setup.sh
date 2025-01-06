#!/bin/bash

# Set your dotfiles directory (this assumes the script is run from the dotfiles directory)
DOTFILES_DIR=$(pwd)

# Run stow to symlink all dotfiles except the .zshrc (because it will be done manually)
echo "Running stow to symlink dotfiles..."
stow .

# Check if ~/.zshrc already exists
if [ -L "$HOME/.zshrc" ]; then
    echo "~/.zshrc already exists as a symlink, removing it first..."
    rm "$HOME/.zshrc"
elif [ -f "$HOME/.zshrc" ]; then
    echo "~/.zshrc exists as a file, renaming it to .zshrc.backup..."
    mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
fi

# Create a manual symlink for .zshrc from dotfiles to home
echo "Creating symlink for .zshrc..."
ln -s "$DOTFILES_DIR/zshrc/.zshrc" "$HOME/.zshrc"

echo "Setup complete!"
