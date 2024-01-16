#!/bin/sh -e

{
    # AZ CLI autocomplete
    echo "[[ -f /etc/bash_completion.d/azure-cli ]] && source /etc/bash_completion.d/azure-cli"
} >> ~/.zshrc
