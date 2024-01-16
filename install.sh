#!/bin/sh -e

# GPG commit signing
sudo apt-get update && sudo apt-get install gnupg2 -y

# Add to ~/.zshrc
{
    # AZ CLI autocomplete
    echo "[[ -f /etc/bash_completion.d/azure-cli ]] && source /etc/bash_completion.d/azure-cli"
} >> ~/.zshrc
