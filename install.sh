#!/bin/sh -e

# GPG commit signing
sudo apt-get update && sudo apt-get install gnupg2 -y

# Add to ~/.zshrc
cat .zshrc >> ~/.zshrc

# Copy global gitignore
cp .gitignore_global ~/.gitignore_global
