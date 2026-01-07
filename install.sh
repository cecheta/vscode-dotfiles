#!/bin/sh -e

# GPG commit signing
sudo apt-get update && sudo apt-get install gnupg2 -y

# azd completion
if command -v azd > /dev/null 2>&1; then
    azd completion zsh | sudo tee /usr/local/share/zsh/site-functions/_azd > /dev/null
fi

# uv completion
if command -v uv > /dev/null 2>&1; then
    uv generate-shell-completion zsh | sudo tee /usr/local/share/zsh/site-functions/_uv > /dev/null
fi

# Add to ~/.zshrc
cat .zshrc >> ~/.zshrc

# Global gitignore
cp .gitignore_global ~/.gitignore_global
git config --global core.excludesFile '~/.gitignore_global'
